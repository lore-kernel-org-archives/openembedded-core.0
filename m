Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FBF7C41513
	for <webhook@archiver.kernel.org>; Wed, 26 Jul 2023 16:22:31 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by mx.groups.io with SMTP id smtpd.web11.15664.1690388543744120259
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Jul 2023 09:22:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=CuHC4hOH;
 spf=pass (domain: intel.com, ip: 192.55.52.136, mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690388546; x=1721924546;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=K76+N09KfTlyVRZGXiZsqGC8faGZr/RZjqzJhegOYYg=;
  b=CuHC4hOH11ETmMjbofzoOQ1JGOEYpDhmkZNYyHy/LNpSCgyWk0RaL1Fd
   FvhKUyHppOCK3Wtsz8Nje9qQx8L21hEj65hVn9xgq3quR5FtWuACBtent
   m9wcKv4yptwOSjue+PqvLfbTmV+SCa/tIAupDKhUtlkyIrT/RKF1A6VfN
   kqJkHQmNmSDV8P58olmlIkr9vAJJ37HiYooUKDgyNbV8Sl0A+4716jBM2
   H2ea0jlG0Q+bsY42O5fWWF7V92QksC/XNHsOR41jXKfFzVQ+g4Ee/bGHs
   geJ9TR4NRdSXon6Drk3QRq/p4NtAzidDBcsELV9BStwoJu//OwMI1pRxl
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="347676139"
X-IronPort-AV: E=Sophos;i="6.01,232,1684825200"; 
   d="scan'208";a="347676139"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2023 09:22:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="816745740"
X-IronPort-AV: E=Sophos;i="6.01,232,1684825200"; 
   d="scan'208";a="816745740"
Received: from anmitta2-mobl3.gar.corp.intel.com (HELO anmitta2-mobl3.intel.com) ([10.215.151.246])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2023 09:22:25 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/4] oeqa/utils/nfs: allow requesting non-udp ports
Date: Thu, 27 Jul 2023 00:22:08 +0800
Message-ID: <20230726162209.131855-4-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230726162209.131855-1-anuj.mittal@intel.com>
References: <20230726162209.131855-1-anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Jul 2023 16:22:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184894

Allows setting up NFS over TCP as well.

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/lib/oeqa/utils/nfs.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/utils/nfs.py b/meta/lib/oeqa/utils/nfs.py
index b66ed42a58..903469bfee 100644
--- a/meta/lib/oeqa/utils/nfs.py
+++ b/meta/lib/oeqa/utils/nfs.py
@@ -12,7 +12,7 @@ from oeqa.utils.commands import bitbake, get_bb_var, Command
 from oeqa.utils.network import get_free_port
 
 @contextlib.contextmanager
-def unfs_server(directory, logger = None):
+def unfs_server(directory, logger = None, udp = True):
     unfs_sysroot = get_bb_var("RECIPE_SYSROOT_NATIVE", "unfs3-native")
     if not os.path.exists(os.path.join(unfs_sysroot, "usr", "bin", "unfsd")):
         # build native tool
@@ -26,7 +26,7 @@ def unfs_server(directory, logger = None):
             exports.write("{0} (rw,no_root_squash,no_all_squash,insecure)\n".format(directory).encode())
 
         # find some ports for the server
-        nfsport, mountport = get_free_port(udp = True), get_free_port(udp = True)
+        nfsport, mountport = get_free_port(udp), get_free_port(udp)
 
         nenv = dict(os.environ)
         nenv['PATH'] = "{0}/sbin:{0}/usr/sbin:{0}/usr/bin:".format(unfs_sysroot) + nenv.get('PATH', '')
-- 
2.41.0


