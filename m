Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 995EEC433EF
	for <webhook@archiver.kernel.org>; Thu, 17 Feb 2022 14:18:31 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by mx.groups.io with SMTP id smtpd.web09.318.1645107508890252839
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Feb 2022 06:18:31 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=RNCRMZUj;
 spf=pass (domain: intel.com, ip: 134.134.136.24,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645107510; x=1676643510;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=W/mV+5bAzemIZryi3aLsVbINreurSsKYERdOoZr9joE=;
  b=RNCRMZUj9BEwQDLUbUV62/z8RaYW3jrXybFDw2/BEj5CeOVDqy90+qQN
   Y+NsglKlpCoyCSxlic/m3NvyVoxheeyUuVMre0BYOClUkGZKZB4PVnRZr
   ASrhlK7lE+r6XpOsMj/I1hM161Y1FNrAMOUUyVm8FNect5I9WP3y1NU1B
   kZ78OvTOFRVuIqcqdZ9KVsexq3Zho0C/92pCdxnwehpkm2w3NLr7zOGX/
   vosZ3tngD92VXLXFvrcuHSnlL5h9E3edEcyGDVODBilkPB/Sndd+vergX
   TujRGV4AtAwDxgmf/NM0K0jHPZPAlxAgw7tP5xLsl9qEo6XMKtneadzRy
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10260"; a="250617941"
X-IronPort-AV: E=Sophos;i="5.88,376,1635231600";
   d="scan'208";a="250617941"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2022 06:18:30 -0800
X-IronPort-AV: E=Sophos;i="5.88,376,1635231600";
   d="scan'208";a="530249203"
Received: from kkoay3-mobl.gar.corp.intel.com (HELO anmitta2-mobl3.intel.com)
 ([10.213.130.102])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2022 06:18:28 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 01/14] sdk: fix search for dynamic loader
Date: Thu, 17 Feb 2022 22:18:10 +0800
Message-Id: 
 <d57b748ef22d75b863356a97bfc585e1e967a44a.1645106980.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1645106980.git.anuj.mittal@intel.com>
References: <cover.1645106980.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Feb 2022 14:18:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161801

From: Christian Eggers <ceggers@arri.de>

if the package "nativesdk-glibc-dbg" is installed as part of the SDK,
the existing search expression finds two files:

$OECORE_NATIVE_SYSROOT/lib/.debug/ld-linux-x86-64.so.2
$OECORE_NATIVE_SYSROOT/lib/ld-linux-x86-64.so.2

The generated relocate_sdk.sh shell script contains then an extra
newline and segfaults during SDK relocation.

Limit the search depth to 1, to avoid finding the file in the .debug
directory.

Signed-off-by: Christian Eggers <ceggers@arri.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/files/toolchain-shar-relocate.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/files/toolchain-shar-relocate.sh b/meta/files/toolchain-shar-relocate.sh
index 3ece04db0a..cee9adbf39 100644
--- a/meta/files/toolchain-shar-relocate.sh
+++ b/meta/files/toolchain-shar-relocate.sh
@@ -5,7 +5,7 @@ fi
 
 # fix dynamic loader paths in all ELF SDK binaries
 native_sysroot=$($SUDO_EXEC cat $env_setup_script |grep 'OECORE_NATIVE_SYSROOT='|cut -d'=' -f2|tr -d '"')
-dl_path=$($SUDO_EXEC find $native_sysroot/lib -name "ld-linux*")
+dl_path=$($SUDO_EXEC find $native_sysroot/lib -maxdepth 1 -name "ld-linux*")
 if [ "$dl_path" = "" ] ; then
 	echo "SDK could not be set up. Relocate script unable to find ld-linux.so. Abort!"
 	exit 1
-- 
2.35.1


