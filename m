Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C5C8C4332F
	for <webhook@archiver.kernel.org>; Tue, 25 Jan 2022 13:46:44 +0000 (UTC)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by mx.groups.io with SMTP id smtpd.web12.7230.1643118392810459867
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Jan 2022 05:46:41 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=i152O4er;
 spf=pass (domain: intel.com, ip: 134.134.136.31,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643118401; x=1674654401;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=zhkA560S/UwPnKt5X7JAg94QBXUWwJuDd9sJhU83vkU=;
  b=i152O4erXwTPcHKged0psmpSTM0HqGQRvJp8Eev645TYCexgNOgGZRlc
   LtkWwFswXHZpf2H1IENAcl00HmrkwSFcRvoZKtBDytcqCavnG3gkx5tpg
   w/OSE+QsbNVqt9pnjbYP6uDG3dRBZNProOc9tpr79WPJtmi2K67/T8Stc
   eZ8E5lT3Nx92ysO3GPrz5MMhTM8W7JwxMjwk6JMNDGpfkRsbR+MLSDbj2
   zESNs5kxKfdOcS6ivUEWIxmNXBRV0OpG/ELIU/X8wyM6bhrEwUdGKvbJN
   8O4zbeIe7ErmjssfQP4lq/pAmK+5WPkuiVYfyWsoXSEYz9hf+0HGg7XHN
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10237"; a="307016485"
X-IronPort-AV: E=Sophos;i="5.88,315,1635231600";
   d="scan'208";a="307016485"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2022 05:46:41 -0800
X-IronPort-AV: E=Sophos;i="5.88,315,1635231600";
   d="scan'208";a="479494335"
Received: from gleong3-mobl.gar.corp.intel.com (HELO anmitta2-mobl3.intel.com)
 ([10.215.227.175])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2022 05:46:39 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 06/13] speex: fix CVE-2020-23903
Date: Tue, 25 Jan 2022 21:46:00 +0800
Message-Id: 
 <1818c3c24fcd42103468a3de01b35c6c9a8228bd.1643113252.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1643113252.git.anuj.mittal@intel.com>
References: <cover.1643113252.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Jan 2022 13:46:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160927

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


