Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web10.12650.1626103965804959193
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Jul 2021 08:32:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=O6ZynrOz;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.172, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f172.google.com with SMTP id v14so2454802plg.9
        for <openembedded-core@lists.openembedded.org>; Mon, 12 Jul 2021 08:32:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=7kxed6HFbqa6R0ms80k66/G4DHqpqZ4caWIcFrFxvgY=;
        b=O6ZynrOzEtTYMFIin9TOpWb2kFshuLQimsDcKul1vzfkPJISkZWpc+Quh9fWDVxmRt
         +30xA8rv5tJ33gxInvIva6WPGVT84jU5fLampYC4KC+HhppBCBgg4psyOTEAtJerzShe
         nfZQF0JgdgELRlNWH0Tv03cAl0aSv+IdglgPq87gwLx16pcNdk1ZFGzoMNxeqQIb3RzD
         5XCiZgIUjUIIDD8fSgnkPsV5YXsYwi/kZYrv2akD25MSLiD1JFDaCBgBKUkZuco+aGYS
         5WaKeYd8BQJmRtON203ap+DP486175KInEyzE68Hi+/l4c/Uc5DisGUefmCTVfGFjNBm
         lrWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7kxed6HFbqa6R0ms80k66/G4DHqpqZ4caWIcFrFxvgY=;
        b=UShBbJcoNEE5h/LxxH/UT9zPgCuR/WXkHOf187NsGwiuzxIPuronC1C/drXV7VQpcB
         AwxlKJGjoTdmWS3aJoXSSijzsBrN50xSVhX/JzyecH74noXSYmseGAMda78tIPn2N/CB
         6jRbQKI6b4KuCCls3txp8R0/yFiACaYVwAQRg5jA2VrKxfBL5UeBJO3s/7U/2Xkjj/KF
         zA/8sbRj1s6dNz7ZsluRqRzQbWex4yGiGumB966ZDOO8hfFTTgoURcVBDEjMuz0csegM
         hxUjoRWbL88vl/DD0k9jqbpqpov9pl7Vvi4PRDJ7FNGG7NZbfC9nnAcbMqHgrYXOsvR+
         +Ycw==
X-Gm-Message-State: AOAM532NnwY+RcKFUZOnjeqZ2eqpcV83+kmD62t8Ur2pDe7+BSoZuP3P
	JySPveqZkQ+74Tx5KQO+yapENO6jFA3nu+WY
X-Google-Smtp-Source: ABdhPJwTFAjqbg5VCZLjkIMq/lqWCT3LiRjw26wx9qKWvJBvte4inqzwg9hQkdEXlokaBzw4n39HAw==
X-Received: by 2002:a17:90a:8912:: with SMTP id u18mr24128343pjn.90.1626103964910;
        Mon, 12 Jul 2021 08:32:44 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id n3sm16765942pfn.216.2021.07.12.08.32.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jul 2021 08:32:44 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 06/12] busybox: fix CVE-2021-28831
Date: Mon, 12 Jul 2021 05:31:59 -1000
Message-Id: <42098fd740fe3de68a221fcc9c44ead545757461.1626103708.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1626103708.git.steve@sakoman.com>
References: <cover.1626103708.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chen Qi <Qi.Chen@windriver.com>

Backport patch to fix CVE-2021-28831.

(From OE-Core rev: e579dbd9a6b2472ca90f411c0b594da9e38c9aca)

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Akash Hadke <akash.hadke@kpit.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...ss_gunzip-Fix-DoS-if-gzip-is-corrupt.patch | 51 +++++++++++++++++++
 meta/recipes-core/busybox/busybox_1.31.1.bb   |  3 +-
 2 files changed, 53 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-core/busybox/busybox/0001-decompress_gunzip-Fix-DoS-if-gzip-is-corrupt.patch

diff --git a/meta/recipes-core/busybox/busybox/0001-decompress_gunzip-Fix-DoS-if-gzip-is-corrupt.patch b/meta/recipes-core/busybox/busybox/0001-decompress_gunzip-Fix-DoS-if-gzip-is-corrupt.patch
new file mode 100644
index 0000000000..b75f0907e7
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox/0001-decompress_gunzip-Fix-DoS-if-gzip-is-corrupt.patch
@@ -0,0 +1,51 @@
+From fe791386ebc270219ca00406c9fdadc5130b64ee Mon Sep 17 00:00:00 2001
+From: Samuel Sapalski <samuel.sapalski@nokia.com>
+Date: Wed, 3 Mar 2021 16:31:22 +0100
+Subject: [PATCH] decompress_gunzip: Fix DoS if gzip is corrupt
+
+On certain corrupt gzip files, huft_build will set the error bit on
+the result pointer. If afterwards abort_unzip is called huft_free
+might run into a segmentation fault or an invalid pointer to
+free(p).
+
+In order to mitigate this, we check in huft_free if the error bit
+is set and clear it before the linked list is freed.
+
+Signed-off-by: Samuel Sapalski <samuel.sapalski@nokia.com>
+Signed-off-by: Peter Kaestle <peter.kaestle@nokia.com>
+Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
+
+Upstream-Status: Backport
+CVE: CVE-2021-28831
+Comment: One hunk from this patch is removed as it was not relevant.
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+Signed-off-by: Akash Hadke <Akash.Hadke@kpit.com>
+---
+ archival/libarchive/decompress_gunzip.c | 12 ++++++++++--
+ 1 file changed, 10 insertions(+), 2 deletions(-)
+
+diff --git a/archival/libarchive/decompress_gunzip.c b/archival/libarchive/decompress_gunzip.c
+index eb3b64930..e93cd5005 100644
+--- a/archival/libarchive/decompress_gunzip.c
++++ b/archival/libarchive/decompress_gunzip.c
+@@ -220,10 +220,20 @@ static const uint8_t border[] ALIGN1 = {
+  * each table.
+  * t: table to free
+  */
++#define BAD_HUFT(p) ((uintptr_t)(p) & 1)
++#define ERR_RET     ((huft_t*)(uintptr_t)1)
+ static void huft_free(huft_t *p)
+ {
+ 	huft_t *q;
+ 
++	/*
++	 * If 'p' has the error bit set we have to clear it, otherwise we might run
++	 * into a segmentation fault or an invalid pointer to free(p)
++	 */
++	if (BAD_HUFT(p)) {
++		p = (huft_t*)((uintptr_t)(p) ^ (uintptr_t)(ERR_RET));
++	}
++
+ 	/* Go through linked list, freeing from the malloced (t[-1]) address. */
+ 	while (p) {
+ 		q = (--p)->v.t;
diff --git a/meta/recipes-core/busybox/busybox_1.31.1.bb b/meta/recipes-core/busybox/busybox_1.31.1.bb
index 7563368287..f7808f4d84 100644
--- a/meta/recipes-core/busybox/busybox_1.31.1.bb
+++ b/meta/recipes-core/busybox/busybox_1.31.1.bb
@@ -50,7 +50,8 @@ SRC_URI = "https://busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://0001-sysctl-ignore-EIO-of-stable_secret-below-proc-sys-ne.patch \
            file://busybox-CVE-2018-1000500.patch \
            file://0001-hwclock-make-glibc-2.31-compatible.patch \
-"
+           file://0001-decompress_gunzip-Fix-DoS-if-gzip-is-corrupt.patch \
+           "
 SRC_URI_append_libc-musl = " file://musl.cfg "
 
 SRC_URI[tarball.md5sum] = "70913edaf2263a157393af07565c17f0"
-- 
2.25.1

