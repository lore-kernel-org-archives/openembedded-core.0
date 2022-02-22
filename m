Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B571C433EF
	for <webhook@archiver.kernel.org>; Tue, 22 Feb 2022 15:08:31 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by mx.groups.io with SMTP id smtpd.web08.13723.1645542509609922511
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Feb 2022 07:08:30 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=KzpRDVKq;
 spf=pass (domain: intel.com, ip: 192.55.52.93,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645542510; x=1677078510;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=W/mV+5bAzemIZryi3aLsVbINreurSsKYERdOoZr9joE=;
  b=KzpRDVKqkItPW1RZuZfcrRI6gTQS9MvqP/G/ViVko8+HZjUpNsy8/W5m
   OVdy8tD2ohWVzX019GZxAKiGK2cs/Exd/IUkyBJWlgkqMIOfUorhFG17g
   gfNQV4gs2QCE9GOuGagvXWIpDUIurJDxm2aeGr5JY2CEPE5nfGd8OkGNj
   tgO4+xSZ3B0Y3RsvVRcGvuJvqWehWisB7MbE/V4e1Dm0g1lpJNdTOJwnm
   5fip/9EICoCPkeWe02HWtvLnR8E2AQLw1WLfE8BMgtKyJ17eAPFjNlNzX
   ZXTh4uypv54rbT3H3gKvMAv4AQ4DHY9gFv7iBrX3IJQP+Xb8WUNWnoILQ
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10265"; a="249305084"
X-IronPort-AV: E=Sophos;i="5.88,387,1635231600";
   d="scan'208";a="249305084"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2022 07:08:11 -0800
X-IronPort-AV: E=Sophos;i="5.88,387,1635231600";
   d="scan'208";a="532258590"
Received: from mmohdnaj-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.213.137.195])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2022 07:08:10 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 14/38] sdk: fix search for dynamic loader
Date: Tue, 22 Feb 2022 23:07:15 +0800
Message-Id: 
 <950536bc9cc78ab3c58586e67acb602cd78e3dac.1645536711.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1645536711.git.anuj.mittal@intel.com>
References: <cover.1645536711.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Feb 2022 15:08:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162149

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


