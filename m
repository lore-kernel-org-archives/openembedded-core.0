Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A56AC433EF
	for <webhook@archiver.kernel.org>; Thu, 27 Jan 2022 05:10:46 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by mx.groups.io with SMTP id smtpd.web09.24368.1643260217446113039
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Jan 2022 21:10:43 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=m+oI4BAa;
 spf=pass (domain: intel.com, ip: 192.55.52.120,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643260243; x=1674796243;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=zhkA560S/UwPnKt5X7JAg94QBXUWwJuDd9sJhU83vkU=;
  b=m+oI4BAa0vM+mxUyaI9UB0OoyvqQjPM42eERkeM1xYgjg7zBU6JqfEhe
   3XUlfV8hHqXzgY/NMZBJqlNbmUYJm34kYA1pXtTHAbMzWlxZtTT2rKHpG
   GiVEb6BNQHrZ3Nkx7XUEZaG9/x53fJ4ja1EhXUTVGbIC2Z7eRhQkGGlZK
   mXvJejCfWR5bps3Mt0DsySCK9RaJbbG8mFXbEZpw3hxbOkAuPQplm8jhg
   CXdNwNnBnkMWOMFfUepSQcUahoeIc7DY1aasdcRV5TEjQEZ0ahcgE5XtX
   aECoDYBM7KUN21rskwLZqqBZPLTh6LSdxUDwalO7HNaLttlflRvk9ph0R
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10239"; a="245590392"
X-IronPort-AV: E=Sophos;i="5.88,320,1635231600";
   d="scan'208";a="245590392"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2022 21:10:43 -0800
X-IronPort-AV: E=Sophos;i="5.88,320,1635231600";
   d="scan'208";a="618209071"
Received: from huiyinkx-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.213.134.201])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2022 21:10:42 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 16/17] speex: fix CVE-2020-23903
Date: Thu, 27 Jan 2022 13:10:09 +0800
Message-Id: 
 <c58cea5f6a6ea4afd1af4d7b4008febb37729680.1643259953.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1643259953.git.anuj.mittal@intel.com>
References: <cover.1643259953.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Jan 2022 05:10:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161019

From: Kai Kang <kai.kang@windriver.com>

Backport patch to fix CVE-2020-23903.

CVE: CVE-2020-23903

Signed-off-by: Kai Kang <kai.kang@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b8f56e5e9eef32c1e01742f913e205d93548de1f)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../speex/speex/CVE-2020-23903.patch          | 30 +++++++++++++++++++
 meta/recipes-multimedia/speex/speex_1.2.0.bb  |  4 ++-
 2 files changed, 33 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-multimedia/speex/speex/CVE-2020-23903.patch

diff --git a/meta/recipes-multimedia/speex/speex/CVE-2020-23903.patch b/meta/recipes-multimedia/speex/speex/CVE-2020-23903.patch
new file mode 100644
index 0000000000..eb16e95ffc
--- /dev/null
+++ b/meta/recipes-multimedia/speex/speex/CVE-2020-23903.patch
@@ -0,0 +1,30 @@
+Backport patch to fix CVE-2020-23903.
+
+CVE: CVE-2020-23903
+Upstream-Status: Backport [https://github.com/xiph/speex/commit/870ff84]
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+
+From 870ff845b32f314aec0036641ffe18aba4916887 Mon Sep 17 00:00:00 2001
+From: Tristan Matthews <tmatth@videolan.org>
+Date: Mon, 13 Jul 2020 23:25:03 -0400
+Subject: [PATCH] wav_io: guard against invalid channel numbers
+
+Fixes #13
+---
+ src/wav_io.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/wav_io.c b/src/wav_io.c
+index b5183015..09d62eb0 100644
+--- a/src/wav_io.c
++++ b/src/wav_io.c
+@@ -111,7 +111,7 @@ int read_wav_header(FILE *file, int *rate, int *channels, int *format, spx_int32
+    stmp = le_short(stmp);
+    *channels = stmp;
+ 
+-   if (stmp>2)
++   if (stmp>2 || stmp<1)
+    {
+       fprintf (stderr, "Only mono and (intensity) stereo supported\n");
+       return -1;
diff --git a/meta/recipes-multimedia/speex/speex_1.2.0.bb b/meta/recipes-multimedia/speex/speex_1.2.0.bb
index 3a0911d6f8..ea475f0f1b 100644
--- a/meta/recipes-multimedia/speex/speex_1.2.0.bb
+++ b/meta/recipes-multimedia/speex/speex_1.2.0.bb
@@ -7,7 +7,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=314649d8ba9dd7045dfb6683f298d0a8 \
                     file://include/speex/speex.h;beginline=1;endline=34;md5=ef8c8ea4f7198d71cf3509c6ed05ea50"
 DEPENDS = "libogg speexdsp"
 
-SRC_URI = "http://downloads.xiph.org/releases/speex/speex-${PV}.tar.gz"
+SRC_URI = "http://downloads.xiph.org/releases/speex/speex-${PV}.tar.gz \
+           file://CVE-2020-23903.patch \
+           "
 UPSTREAM_CHECK_REGEX = "speex-(?P<pver>\d+(\.\d+)+)\.tar"
 
 SRC_URI[md5sum] = "8ab7bb2589110dfaf0ed7fa7757dc49c"
-- 
2.34.1


