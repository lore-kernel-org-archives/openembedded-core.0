Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F6E6C10DC1
	for <webhook@archiver.kernel.org>; Tue,  5 Dec 2023 02:35:36 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by mx.groups.io with SMTP id smtpd.web11.90255.1701743732350797304
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Dec 2023 18:35:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=jASZABVt;
 spf=pass (domain: intel.com, ip: 134.134.136.100, mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701743732; x=1733279732;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=6LzuBG4U6IQtXAk611psJEqtt4buJy3RbKny6RwFdkc=;
  b=jASZABVtnzFGyddc6NTSdVvSgM+gopTB+GLgYkqRk0vH4Yx8LOGztnbs
   rsmMGFnVzekin5oldh0rZGFv/qye3SMEUpd53DcbrUPvCmKBsUMbGWelQ
   5WLPmZExhgdzdIFVZL27xmzlBmHf2Kn4fuiJP4XpDNqdWesnHPYO/YaLQ
   i92NCr1ABi6SYfwd9qfnKym2vwIVURpZ6EEQYijO1CtlCSUb1oFb48DV7
   qItD6LM5nup9DKhyYJdmvnlCcVccmDeY684pzcIILzldjYRN9iNKX6Bdp
   Xz9rSy9/jVjkcEK0GRKxC2z9ZtMSc/XBRI5BLTPcihWYPICbLg/3dddzj
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="460319208"
X-IronPort-AV: E=Sophos;i="6.04,251,1695711600"; 
   d="scan'208";a="460319208"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2023 18:35:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="836817756"
X-IronPort-AV: E=Sophos;i="6.04,251,1695711600"; 
   d="scan'208";a="836817756"
Received: from andromeda02.png.intel.com ([10.221.253.198])
  by fmsmga008.fm.intel.com with ESMTP; 04 Dec 2023 18:35:30 -0800
From: chee.yang.lee@intel.com
To: openembedded-core@lists.openembedded.org
Subject: [dunfell][PATCH 1/2] epiphany: fix CVE-2022-29536
Date: Tue,  5 Dec 2023 10:15:51 +0800
Message-Id: <20231205021552.2248854-1-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Dec 2023 02:35:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191773

From: Lee Chee Yang <chee.yang.lee@intel.com>

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
---
 .../recipes-gnome/epiphany/epiphany_3.34.4.bb |  1 +
 .../epiphany/files/CVE-2022-29536.patch       | 46 +++++++++++++++++++
 2 files changed, 47 insertions(+)
 create mode 100644 meta/recipes-gnome/epiphany/files/CVE-2022-29536.patch

diff --git a/meta/recipes-gnome/epiphany/epiphany_3.34.4.bb b/meta/recipes-gnome/epiphany/epiphany_3.34.4.bb
index e2afb29c12..f43bfd6a67 100644
--- a/meta/recipes-gnome/epiphany/epiphany_3.34.4.bb
+++ b/meta/recipes-gnome/epiphany/epiphany_3.34.4.bb
@@ -16,6 +16,7 @@ REQUIRED_DISTRO_FEATURES = "x11 opengl"
 
 SRC_URI = "${GNOME_MIRROR}/${GNOMEBN}/${@gnome_verdir("${PV}")}/${GNOMEBN}-${PV}.tar.${GNOME_COMPRESS_TYPE};name=archive \
            file://0002-help-meson.build-disable-the-use-of-yelp.patch \
+           file://CVE-2022-29536.patch \
            "
 SRC_URI[archive.md5sum] = "a559f164bb7d6cbeceb348648076830b"
 SRC_URI[archive.sha256sum] = "60e190fc07ec7e33472e60c7e633e04004f7e277a0ffc5e9cd413706881e598d"
diff --git a/meta/recipes-gnome/epiphany/files/CVE-2022-29536.patch b/meta/recipes-gnome/epiphany/files/CVE-2022-29536.patch
new file mode 100644
index 0000000000..7b8adeafcc
--- /dev/null
+++ b/meta/recipes-gnome/epiphany/files/CVE-2022-29536.patch
@@ -0,0 +1,46 @@
+VE: CVE-2022-29536
+Upstream-Status: Backport [ https://gitlab.gnome.org/GNOME/epiphany/-/commit/486da133569ebfc436c959a7419565ab102e8525 ]
+Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
+
+From 486da133569ebfc436c959a7419565ab102e8525 Mon Sep 17 00:00:00 2001
+From: Michael Catanzaro <mcatanzaro@redhat.com>
+Date: Fri, 15 Apr 2022 18:09:46 -0500
+Subject: [PATCH] Fix memory corruption in ephy_string_shorten()
+
+This fixes a regression that I introduced in 232c613472b38ff0d0d97338f366024ddb9cd228.
+
+I got my browser stuck in a crash loop today while visiting a website
+with a page title greater than ephy-embed.c's MAX_TITLE_LENGTH, the only
+condition in which ephy_string_shorten() is ever used. Turns out this
+commit is wrong: an ellipses is a multibyte character (three bytes in
+UTF-8) and so we're writing past the end of the buffer when calling
+strcat() here. Ooops.
+
+Shame it took nearly four years to notice and correct this.
+
+Part-of: <https://gitlab.gnome.org/GNOME/epiphany/-/merge_requests/1106>
+---
+ lib/ephy-string.c | 5 ++---
+ 1 file changed, 2 insertions(+), 3 deletions(-)
+
+diff --git a/lib/ephy-string.c b/lib/ephy-string.c
+index 35a148ab32..8e524d52ca 100644
+--- a/lib/ephy-string.c
++++ b/lib/ephy-string.c
+@@ -114,11 +114,10 @@ ephy_string_shorten (char  *str,
+   /* create string */
+   bytes = GPOINTER_TO_UINT (g_utf8_offset_to_pointer (str, target_length - 1) - str);
+ 
+-  /* +1 for ellipsis, +1 for trailing NUL */
+-  new_str = g_new (gchar, bytes + 1 + 1);
++  new_str = g_new (gchar, bytes + strlen ("…") + 1);
+ 
+   strncpy (new_str, str, bytes);
+-  strcat (new_str, "…");
++  strncpy (new_str + bytes, "…", strlen ("…") + 1);
+ 
+   g_free (str);
+ 
+-- 
+GitLab
+
-- 
2.37.3


