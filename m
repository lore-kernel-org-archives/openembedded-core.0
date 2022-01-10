Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00222C433EF
	for <webhook@archiver.kernel.org>; Mon, 10 Jan 2022 04:09:28 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by mx.groups.io with SMTP id smtpd.web12.27324.1641787762773038697
 for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Jan 2022 20:09:28 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=Z5kV6Ho+;
 spf=pass (domain: intel.com, ip: 192.55.52.115,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1641787768; x=1673323768;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=DcoCL2EHplVV+ueEDWZcoGOCRTGBi0igkwHnWZBRLVs=;
  b=Z5kV6Ho+J7r2Mtlp0t33YwDPwoWB2ML9fGgiOEIt1BSHJPUKc+oYNnuh
   nkAdl4c2xtBBK41trqDNB3fBLx9WSSSfbYmseagi+KVQiQGmUtWl9MpDV
   aHzLN85FwdTMgm0902ipLginBflt1xRKtbfhKZgtJ9BHw6I/HCr70rZ4S
   kcs0CIWP4QbKx3k/VYp+6ATxqlPf0bAOUcgLyiZuHafENfkZaAfhmOhbA
   LqralETtjmfto8LEg4aQkLKmPgRAHubSZ3Ghpc9oEIt4znZjuI5fi4JMb
   CLn+sgytBHsapT8lYtHdraYv26rjV4TfvGuWEaS6HYXgPhnKERgG7kugx
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10222"; a="243347358"
X-IronPort-AV: E=Sophos;i="5.88,276,1635231600";
   d="scan'208";a="243347358"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2022 20:09:28 -0800
X-IronPort-AV: E=Sophos;i="5.88,276,1635231600";
   d="scan'208";a="764402219"
Received: from bboox-mobl.gar.corp.intel.com (HELO anmitta2-mobl3.intel.com)
 ([10.213.135.82])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2022 20:09:26 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 04/10] grub2: fix CVE-2021-3981
Date: Mon, 10 Jan 2022 12:09:08 +0800
Message-Id: 
 <9c839db1144a8a96f8b848e3e1aad2fd93859abd.1641787452.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1641787452.git.anuj.mittal@intel.com>
References: <cover.1641787452.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Jan 2022 04:09:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160325

From: Yongxin Liu <yongxin.liu@windriver.com>

Signed-off-by: Yongxin Liu <yongxin.liu@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit bb554d14142f93c39fd1516a31757006531c348f)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 ...onfig-Restore-umask-for-the-grub.cfg.patch | 49 +++++++++++++++++++
 meta/recipes-bsp/grub/grub2.inc               |  1 +
 2 files changed, 50 insertions(+)
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2021-3981-grub-mkconfig-Restore-umask-for-the-grub.cfg.patch

diff --git a/meta/recipes-bsp/grub/files/CVE-2021-3981-grub-mkconfig-Restore-umask-for-the-grub.cfg.patch b/meta/recipes-bsp/grub/files/CVE-2021-3981-grub-mkconfig-Restore-umask-for-the-grub.cfg.patch
new file mode 100644
index 0000000000..dae26fd8bb
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/CVE-2021-3981-grub-mkconfig-Restore-umask-for-the-grub.cfg.patch
@@ -0,0 +1,49 @@
+From 0adec29674561034771c13e446069b41ef41e4d4 Mon Sep 17 00:00:00 2001
+From: Michael Chang <mchang@suse.com>
+Date: Fri, 3 Dec 2021 16:13:28 +0800
+Subject: [PATCH] grub-mkconfig: Restore umask for the grub.cfg
+
+The commit ab2e53c8a (grub-mkconfig: Honor a symlink when generating
+configuration by grub-mkconfig) has inadvertently discarded umask for
+creating grub.cfg in the process of running grub-mkconfig. The resulting
+wrong permission (0644) would allow unprivileged users to read GRUB
+configuration file content. This presents a low confidentiality risk
+as grub.cfg may contain non-secured plain-text passwords.
+
+This patch restores the missing umask and sets the creation file mode
+to 0600 preventing unprivileged access.
+
+Fixes: CVE-2021-3981
+
+Signed-off-by: Michael Chang <mchang@suse.com>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+
+Upstream-Status: Backport
+CVE: CVE-2021-3981
+
+Reference to upstream patch:
+https://git.savannah.gnu.org/cgit/grub.git/commit/?id=0adec29674561034771c13e446069b41ef41e4d4
+
+Signed-off-by: Yongxin Liu <yongxin.liu@windriver.com>
+---
+ util/grub-mkconfig.in | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/util/grub-mkconfig.in b/util/grub-mkconfig.in
+index c3ea7612e..62335d027 100644
+--- a/util/grub-mkconfig.in
++++ b/util/grub-mkconfig.in
+@@ -301,7 +301,10 @@ and /etc/grub.d/* files or please file a bug report with
+     exit 1
+   else
+     # none of the children aborted with error, install the new grub.cfg
++    oldumask=$(umask)
++    umask 077
+     cat ${grub_cfg}.new > ${grub_cfg}
++    umask $oldumask
+     rm -f ${grub_cfg}.new
+   fi
+ fi
+-- 
+2.31.1
+
diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index bb791347dc..a72a562c5a 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -20,6 +20,7 @@ SRC_URI = "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
            file://0001-grub.d-10_linux.in-add-oe-s-kernel-name.patch \
            file://determinism.patch \
            file://0001-RISC-V-Restore-the-typcast-to-long.patch \
+           file://CVE-2021-3981-grub-mkconfig-Restore-umask-for-the-grub.cfg.patch \
 "
 
 SRC_URI[sha256sum] = "23b64b4c741569f9426ed2e3d0e6780796fca081bee4c99f62aa3f53ae803f5f"
-- 
2.33.1


