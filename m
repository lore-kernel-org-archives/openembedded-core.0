Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E60BC433FE
	for <webhook@archiver.kernel.org>; Tue,  8 Mar 2022 14:21:33 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by mx.groups.io with SMTP id smtpd.web10.8578.1646749290648435983
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Mar 2022 06:21:32 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=fzAxUch0;
 spf=pass (domain: intel.com, ip: 134.134.136.20,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646749292; x=1678285292;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=Y5u1RC9gSkyKUoAHsqcbKHU0E1xihNrDJPGJQTLp5u4=;
  b=fzAxUch0BpQpfeT4BRuoc6fA/803JCBxaBEhOlCJ2NykdZeWRGPfY91f
   gymhue9wngTAHhj86iU4ieCgTHmvW76c2+4zjs2hK6YHduBdZNJxWJNwI
   eRt9metZqpB3WoUV+x2XrfbtlqdGdwjsPYZty+lxx2nMqLlGr47w4od2A
   rGZHUdsnuWvmRlem/LWQ0xRuHgjYfLpBOdPIcE8dpamc/rt1BqplAXb/I
   L6kjD5IEWbyFJq78Me3aVvGICbuNAFKAK/7HSlme1vkd2+j9u1dde9fMI
   Fyp8q2q+9NWey2UIP7+3Jj+PZEXALmd2t1LsVST9Aqz6TnQMtcLighJuQ
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10279"; a="242130162"
X-IronPort-AV: E=Sophos;i="5.90,165,1643702400";
   d="scan'208";a="242130162"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2022 06:21:02 -0800
X-IronPort-AV: E=Sophos;i="5.90,165,1643702400";
   d="scan'208";a="513120075"
Received: from sktoh-mobl1.gar.corp.intel.com (HELO anmitta2-mobl3.intel.com)
 ([10.215.225.176])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2022 06:21:01 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 15/15] unfs3: correct configure option
Date: Tue,  8 Mar 2022 22:20:06 +0800
Message-Id: 
 <d0b1807edc10835beff9a55a105ac191b6ac2fe7.1646748870.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1646748869.git.anuj.mittal@intel.com>
References: <cover.1646748869.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Mar 2022 14:21:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162922

From: Changqing Li <changqing.li@windriver.com>

On some new distro like ubuntu21.04, unfs3-native compile failed with
error: undefined reference to `xdr_uint32', since new distro has new
glibc.

>From glibc 2.27 rpc support is dropped, so unfs3 need to link to
libtirpc.

Here is defination of ac_link:
ac_link='$CC -o conftest$ac_exeext $CFLAGS $CPPFLAGS $LDFLAGS conftest.$ac_ext $LIBS >&5'

Depended library should be added into LIBS, not LDFLAGS, otherwise,
gcc may not load the lib since it is before conftest.$ac_ext during
configure. Finally, it results in compile failed.

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 27867862c1fee6c0e649286500fa1ab015d57faf)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-devtools/unfs3/unfs3_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/unfs3/unfs3_git.bb b/meta/recipes-devtools/unfs3/unfs3_git.bb
index bcaa4e2822..06148005cf 100644
--- a/meta/recipes-devtools/unfs3/unfs3_git.bb
+++ b/meta/recipes-devtools/unfs3/unfs3_git.bb
@@ -37,7 +37,7 @@ BBCLASSEXTEND = "native nativesdk"
 inherit autotools
 EXTRA_OECONF_append_class-native = " --sbindir=${bindir}"
 CFLAGS_append = " -I${STAGING_INCDIR}/tirpc"
-LDFLAGS_append = " -ltirpc"
+EXTRA_OECONF_append = " LIBS=-ltirpc"
 
 # Turn off these header detects else the inode search
 # will walk entire file systems and this is a real problem
-- 
2.35.1


