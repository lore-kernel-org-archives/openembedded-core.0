Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E290E7716E
	for <webhook@archiver.kernel.org>; Thu,  5 Dec 2024 23:42:36 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.web11.25876.1733442153492477787
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Dec 2024 15:42:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=AVkA4YyQ;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-256628-20241205234230c990f06919d857f6c1-tqau_r@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 20241205234230c990f06919d857f6c1
        for <openembedded-core@lists.openembedded.org>;
        Fri, 06 Dec 2024 00:42:30 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=fQv1wcAeaPN9FsfNWSc37MtCOU40UUBB8WIKQ3/c4Lg=;
 b=AVkA4YyQ8CSngE/QFJNrUYDzQmMQ679KlAfI32J+h4DX46z1oUCh4x0iekIYQNnl0zicGX
 1JTKNUC64RCMz4bIDpqRdJ+Ws2jCsspMxgh774mSc/THhPJfN5O3sDERdRTTpyNmJaHeYYRb
 c4ol9Xwl4wE2UvF6gbM2jB4h5aqgv5DkeRfYQ6f0RpaelO331j9O0+dafsex/BKfbHMpKUP2
 F2dEwPacInrLeeq6IE0NYLIyAldNB9vamkkwX6/koOW+hLYAUlDvWt/OCJqznUryblXNHXkO
 BCWsPyc0VnUrN5tISTeFs3Eyw0h4OXNXpKQI3uGVt1xAr3Zj5pn4/yYA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: peter.marko@siemens.com,
	Hitendra Prajapati <hprajapati@mvista.com>
Subject: [OE-core][styhead][PATCH 4/7] libarchive: fix CVE-2024-48957 & CVE-2024-48958
Date: Fri,  6 Dec 2024 00:41:41 +0100
Message-Id: <20241205234144.7933-5-peter.marko@siemens.com>
In-Reply-To: <20241205234144.7933-1-peter.marko@siemens.com>
References: <20241205234144.7933-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Dec 2024 23:42:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208393

From: Hitendra Prajapati <hprajapati@mvista.com>

Backport fixes for:

* CVE-2024-48957 - Upstream-Status: Backport from https://github.com/libarchive/libarchive/commit/3006bc5d02ad3ae3c4f9274f60c1f9d2d834734b
* CVE-2024-48958 - Upstream-Status: Backport from https://github.com/libarchive/libarchive/commit/a1cb648d52f5b6d3f31184d9b6a7cbca628459b7

(From OE-Core rev: 8b520c3cea136591128f6601718c23334afd7a55)

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../libarchive/CVE-2024-48957.patch           | 36 +++++++++++++++++
 .../libarchive/CVE-2024-48958.patch           | 40 +++++++++++++++++++
 .../libarchive/libarchive_3.7.4.bb            |  5 ++-
 3 files changed, 80 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2024-48957.patch
 create mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2024-48958.patch

diff --git a/meta/recipes-extended/libarchive/libarchive/CVE-2024-48957.patch b/meta/recipes-extended/libarchive/libarchive/CVE-2024-48957.patch
new file mode 100644
index 0000000000..98877cf72c
--- /dev/null
+++ b/meta/recipes-extended/libarchive/libarchive/CVE-2024-48957.patch
@@ -0,0 +1,36 @@
+From 3006bc5d02ad3ae3c4f9274f60c1f9d2d834734b Mon Sep 17 00:00:00 2001
+From: Wei-Cheng Pan <legnaleurc@gmail.com>
+Date: Mon, 29 Apr 2024 06:53:19 +0900
+Subject: [PATCH] fix: OOB in rar audio filter (#2149)
+
+This patch ensures that `src` won't move ahead of `dst`, so `src` will
+not OOB. Similar situation like in a1cb648.
+
+Upstream-Status: Backport [https://github.com/libarchive/libarchive/commit/3006bc5d02ad3ae3c4f9274f60c1f9d2d834734b]
+CVE: CVE-2024-48957
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ libarchive/archive_read_support_format_rar.c | 7 +++++++
+ 1 file changed, 7 insertions(+)
+
+diff --git a/libarchive/archive_read_support_format_rar.c b/libarchive/archive_read_support_format_rar.c
+index 79669a8..95a91dc 100644
+--- a/libarchive/archive_read_support_format_rar.c
++++ b/libarchive/archive_read_support_format_rar.c
+@@ -3714,6 +3714,13 @@ execute_filter_audio(struct rar_filter *filter, struct rar_virtual_machine *vm)
+     memset(&state, 0, sizeof(state));
+     for (j = i; j < length; j += numchannels)
+     {
++      /*
++       * The src block should not overlap with the dst block.
++       * If so it would be better to consider this archive is broken.
++       */
++      if (src >= dst)
++        return 0;
++
+       int8_t delta = (int8_t)*src++;
+       uint8_t predbyte, byte;
+       int prederror;
+-- 
+2.25.1
+
diff --git a/meta/recipes-extended/libarchive/libarchive/CVE-2024-48958.patch b/meta/recipes-extended/libarchive/libarchive/CVE-2024-48958.patch
new file mode 100644
index 0000000000..de266e9d95
--- /dev/null
+++ b/meta/recipes-extended/libarchive/libarchive/CVE-2024-48958.patch
@@ -0,0 +1,40 @@
+From a1cb648d52f5b6d3f31184d9b6a7cbca628459b7 Mon Sep 17 00:00:00 2001
+From: Wei-Cheng Pan <legnaleurc@gmail.com>
+Date: Mon, 29 Apr 2024 06:50:22 +0900
+Subject: [PATCH] fix: OOB in rar delta filter (#2148)
+
+Ensure that `src` won't move ahead of `dst`, so `src` will not OOB.
+Since `dst` won't move in this function, and we are only increasing `src`
+position, this check should be enough. It should be safe to early return
+because this function does not allocate resources.
+
+Upstream-Status: Backport [https://github.com/libarchive/libarchive/commit/a1cb648d52f5b6d3f31184d9b6a7cbca628459b7]
+CVE: CVE-2024-48958
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ libarchive/archive_read_support_format_rar.c | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/libarchive/archive_read_support_format_rar.c b/libarchive/archive_read_support_format_rar.c
+index 95a91dc..4fc6626 100644
+--- a/libarchive/archive_read_support_format_rar.c
++++ b/libarchive/archive_read_support_format_rar.c
+@@ -3612,7 +3612,15 @@ execute_filter_delta(struct rar_filter *filter, struct rar_virtual_machine *vm)
+   {
+     uint8_t lastbyte = 0;
+     for (idx = i; idx < length; idx += numchannels)
++    {
++      /*
++       * The src block should not overlap with the dst block.
++       * If so it would be better to consider this archive is broken.
++       */
++      if (src >= dst)
++        return 0;
+       lastbyte = dst[idx] = lastbyte - *src++;
++    }
+   }
+ 
+   filter->filteredblockaddress = length;
+-- 
+2.25.1
+
diff --git a/meta/recipes-extended/libarchive/libarchive_3.7.4.bb b/meta/recipes-extended/libarchive/libarchive_3.7.4.bb
index da85764116..6e406611f9 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.7.4.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.7.4.bb
@@ -30,7 +30,10 @@ PACKAGECONFIG[zstd] = "--with-zstd,--without-zstd,zstd,"
 EXTRA_OECONF += "--enable-largefile --without-iconv"
 
 SRC_URI = "http://libarchive.org/downloads/libarchive-${PV}.tar.gz"
-SRC_URI += "file://configurehack.patch"
+SRC_URI += "file://configurehack.patch \
+            file://CVE-2024-48957.patch \
+            file://CVE-2024-48958.patch \
+	"
 UPSTREAM_CHECK_URI = "http://libarchive.org/"
 
 SRC_URI[sha256sum] = "7875d49596286055b52439ed42f044bd8ad426aa4cc5aabd96bfe7abb971d5e8"
-- 
2.30.2


