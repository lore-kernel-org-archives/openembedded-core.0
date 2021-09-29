Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F161C433FE
	for <webhook@archiver.kernel.org>; Wed, 29 Sep 2021 14:59:22 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by mx.groups.io with SMTP id smtpd.web10.10087.1632927554721798137
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Sep 2021 07:59:22 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: intel.com, ip: 192.55.52.115, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10122"; a="224613798"
X-IronPort-AV: E=Sophos;i="5.85,332,1624345200";
   d="scan'208";a="224613798"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2021 07:59:21 -0700
X-IronPort-AV: E=Sophos;i="5.85,332,1624345200";
   d="scan'208";a="520858451"
Received: from zkeh-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl1.gar.corp.intel.com) ([10.213.143.173])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2021 07:59:20 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 06/10] libsamplerate0: Set correct soname for 0.1.9
Date: Wed, 29 Sep 2021 22:59:04 +0800
Message-Id: 
 <26109606df69374d06046b758492fb16fa224db9.1632903759.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1632903759.git.anuj.mittal@intel.com>
References: <cover.1632903759.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Sep 2021 14:59:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156463

From: Tom Pollard <tom.pollard@codethink.co.uk>

Manually patch SHARED_VERSION_INFO, which was missed in
the 0.1.9 release and later incorrectly fixed until 0.2.1

Signed-off-by: Tom Pollard <tom.pollard@codethink.co.uk>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit cb2e8efd316d44b9b1453882114856e0eb7b3500)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../libsamplerate0/shared_version_info.patch        | 13 +++++++++++++
 .../libsamplerate/libsamplerate0_0.1.9.bb           |  1 +
 2 files changed, 14 insertions(+)
 create mode 100644 meta/recipes-multimedia/libsamplerate/libsamplerate0/shared_version_info.patch

diff --git a/meta/recipes-multimedia/libsamplerate/libsamplerate0/shared_version_info.patch b/meta/recipes-multimedia/libsamplerate/libsamplerate0/shared_version_info.patch
new file mode 100644
index 0000000000..b42d564b4b
--- /dev/null
+++ b/meta/recipes-multimedia/libsamplerate/libsamplerate0/shared_version_info.patch
@@ -0,0 +1,13 @@
+Index: libsamplerate-0.1.8/configure.ac
+===================================================================
+--- libsamplerate-0.1.8.orig/configure.ac
++++ libsamplerate-0.1.8/configure.ac
+@@ -53,7 +53,7 @@ AC_PROG_LN_S
+ #  6. If any interfaces have been removed since the last public release, then set age
+ #     to 0.
+ 
+-SHARED_VERSION_INFO="1:8:1"
++SHARED_VERSION_INFO="1:9:1"
+ 
+ 
+ 
diff --git a/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb b/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb
index 6dfc42b436..8345d6880f 100644
--- a/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb
+++ b/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb
@@ -10,6 +10,7 @@ PR = "r1"
 
 SRC_URI = "http://www.mega-nerd.com/SRC/libsamplerate-${PV}.tar.gz \
            file://0001-configure.ac-improve-alsa-handling.patch \
+           file://shared_version_info.patch \
 "
 
 SRC_URI[md5sum] = "2b78ae9fe63b36b9fbb6267fad93f259"
-- 
2.31.1


