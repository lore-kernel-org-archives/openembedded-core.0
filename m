Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBA2DC982EC
	for <webhook@archiver.kernel.org>; Thu, 17 Sep 2026 22:08:05 +0000 (UTC)
Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1561.1789682876149632576
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Sep 2026 15:07:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=PWFAgEl6;
 spf=pass (domain: smile.fr, ip: 74.125.225.141, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e6c0fce17so584555e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 15:07:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1789682874; x=1790287674; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ehbNKlJOrfIxbV6oqRGBieBG41HEmrB5j3jYDVKKVtM=;
        b=PWFAgEl6ikHRUGsErCMdhSbdhqcSOP8Ie0uju2C4xUPcUJDGjKOpffrfEGzqAOLFP3
         m8nM6UpKfH0yrX36EBVbf1mLGk21BNQEOjaTZcs3j4zlw6x4aGE9AMQzpWmt3j6s3x1o
         Wyvfw872BWksTesHHjVm7k/+0nhG5jhI/UOZ8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789682874; x=1790287674;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ehbNKlJOrfIxbV6oqRGBieBG41HEmrB5j3jYDVKKVtM=;
        b=GUbDmdkjZUMmX+tY3AjdWbbZrj/EciV41H/y+sxJlKojF9X9JI7M0lr5eijxKj6xfP
         yTYMmH/+zGvqIg5gUpk9+aJtQBFTEV6OHfai7uWdv32IW1xNNFgM0rSyGDc7X3ItB3Y7
         LsYyByxzn0NTaOW3uy3I61HOK1hYJUpcJYy6Dh4wetK7Ad33Fi/+6dHiGMpS0sVA0kQM
         TS6FnMQR5d22vmUcyaLC8Ed5/cYw183xhBgEJ1KcT79EYrfkSnmguIwX2NdvHAMSZTeN
         /V+u2z2b1n1jfWYKLGcYUXZVwFIT9IAb8G/z8STdHcrIJ/jiZTExvaz/BUwhnjMptFBs
         qYsQ==
X-Gm-Message-State: AFuF++k/MH5ZBX9efug/ZK7Y0INr+r7uE4s/A7yRvpk+/Y67ScKDtsQu
	spP7qLdqorlTJgRs05SjelmdAzJVsCNKGdwCzq62ALtcNadX+h65YF4elT+hKEE0/dWHK6XyW6U
	wRKdP38k=
X-Gm-Gg: AYBFou0zAnN0TMxqqed3M9NV2p0+9WkeFmlPJeOJpAG9OUG+PS+mHzLHtczyaKsio7C
	nZZJcDfC9lQHJ11spmowW4/ZYYWYBqh5b28Cj9YM4WqtqbNrIA2tcI0LiX79qAvoLmjrE5Rti6P
	PxEAIxm+EIDIhrMvOGWjttjyjJCnbThaipQvLbAL8ix3UqNY9FFyTV2J7724ANIXst/yXb7SLDD
	Y1XHi/UjKsedet4SOfX+GHsNnTJHyxw7LmAXDzI+x55RBmVU9C7DFXtIwruoQ4tB01p1phpfX25
	jZsAEIAL/Wny7IaBYpsrJM0cGh/Bz5Qhak5vfiS2PGGNBU/LaOFFY6OH0lzGYUVp3bzqbuChzJV
	vB/bh/4eO7mSwBFBdHKj1xBRgKMal/JGHucXJ7JD6NRqI7/ml/8wsvSwsckP67MlJMkTj4xYPHx
	gah/9khQ5MZgbrnvkKca323HG5otqWns2LtHkdEsMgyrhRND6HxSMC/2HWr3llLRJRSWDsguiJD
	wEzIUBBaHptl9aLEEM4Xf0nIjK8nrdruiL5a26pGIex0xbXIbbT6qJ/43g0sb9/L+nkcBayBgaK
X-Received: by 2002:a05:600c:34d4:b0:49c:fc6e:a3d5 with SMTP id 5b1f17b1804b1-49fc574f51cmr3038885e9.20.1789682874294;
        Thu, 17 Sep 2026 15:07:54 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc471b9a2sm8984075e9.0.2026.09.17.15.07.53
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 15:07:53 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 09/79] libxml2: upgrade 2.15.3 -> 2.15.4
Date: Fri, 18 Sep 2026 00:05:54 +0200
Message-ID: <22cf12907dfe4ba8ac6aa0aa62f9f954dacfa591.1789681419.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1789681419.git.yoann.congal@smile.fr>
References: <cover.1789681419.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 22:08:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246104

From: Siddharth Doshi <sdoshi@mvista.com>

v2.15.4: Sep 01 2026

- xmlregexp: Prevent out-of-bounds read in NXT macro
- fix: add missing overflow checks in dict.c, uri.c, and valid.c
- xmlregexp: Calc string length after null checking
- xpointer: Check overflow in xmlXPtrEvalXPtrPart
- xmlIO: Check for int overflow before calling writecallback
- fix(xinclude): propagate parseFlags in xmlXIncludeProcess and xmlXIncludeProcessTree

- Improve bound checks for xmlcatalog and xmllint arguments (out-of-bound)
- Fix memory leak in static Windows library (memory-leak)
- xmlreader: Copy DTD in xmlTextReaderDumpCopy
- parser: Fix double free in xmlIOParseDTD (double-free)
- parser: fix division-by-zero when maxAmpl is set to 0
- parser: Fix memory leak in xmlCtxtSetSaxHandler (memory-leak)
- catalog: Make sure to reset catalog resolve cache
- xmlAddChild: unlink node before free for text nodes (memory-leak)
- Normalize entity values in attr in xmlNodeGetContent
- Handle whitespace for date/time/duration types
- catalog: Fix NULL deref for nextCatalog without 'catalog' attribute (null-deref)

For detailed information, see the link below:
[1] https://gitlab.gnome.org/GNOME/libxml2/-/commit/96498992efa48d52b0e8b83058bd88dbdaf153c1

Note: Removed CVE-2026-11979 as it is already fixed.

CVE's Fixed:
CVE-2026-11979 (CVSSv3: 7.8): https://nvd.nist.gov/vuln/detail/CVE-2026-11979
CVE-2026-86137 (CVSSv3: 2.9): https://nvd.nist.gov/vuln/detail/CVE-2026-86137
CVE-2026-86138 (CVSSv3: 6.9): https://nvd.nist.gov/vuln/detail/CVE-2026-86138
CVE-2026-86139 (CVSSv3: 6.9): https://nvd.nist.gov/vuln/detail/CVE-2026-86139
CVE-2026-86140 (CVSSv3: 8.0): https://nvd.nist.gov/vuln/detail/CVE-2026-86140
CVE-2026-86141 (CVSSv3: 2.9): https://nvd.nist.gov/vuln/detail/CVE-2026-86141
CVE-2026-86142 (CVSSv3: 6.9): https://nvd.nist.gov/vuln/detail/CVE-2026-86142
CVE-2026-86143 (CVSSv3: 6.9): https://nvd.nist.gov/vuln/detail/CVE-2026-86143
CVE-2026-86144 (CVSSv3: 5.6): https://nvd.nist.gov/vuln/detail/CVE-2026-86144

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 8875c7e8dbecc0700aa6db49b66b8d77a21938b1)
Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
[YC: I merged commit message from master/RP and Siddharth]
---
 .../libxml/libxml2/CVE-2026-11979.patch       | 81 -------------------
 .../{libxml2_2.15.3.bb => libxml2_2.15.4.bb}  |  3 +-
 2 files changed, 1 insertion(+), 83 deletions(-)
 delete mode 100644 meta/recipes-core/libxml/libxml2/CVE-2026-11979.patch
 rename meta/recipes-core/libxml/{libxml2_2.15.3.bb => libxml2_2.15.4.bb} (96%)

diff --git a/meta/recipes-core/libxml/libxml2/CVE-2026-11979.patch b/meta/recipes-core/libxml/libxml2/CVE-2026-11979.patch
deleted file mode 100644
index a14e566681e..00000000000
--- a/meta/recipes-core/libxml/libxml2/CVE-2026-11979.patch
+++ /dev/null
@@ -1,81 +0,0 @@
-From dfad0660f7dab3b5f8317b703b16ad0b0d12697d Mon Sep 17 00:00:00 2001
-From: Daniel Garcia Moreno <daniel.garcia@suse.com>
-Date: Fri, 22 May 2026 12:21:20 +0200
-Subject: [PATCH] xmlcatalog: overflow check for large --shell commands
-
-Fix https://gitlab.gnome.org/GNOME/libxml2/-/work_items/1124
-
-CVE: CVE-2026-11979
-Signed-off-by: Anton Skorup <anton.skorup@axis.com>
-Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libxml2/-/commit/c2e233fc1b341685fc99621b2768b503f777a72e]
----
- test/catalogs/test.sh | 11 +++++++++++
- xmlcatalog.c          | 16 ++++++++++++++++
- 2 files changed, 27 insertions(+)
-
-diff --git a/test/catalogs/test.sh b/test/catalogs/test.sh
-index 7e5eaa76..84e8b90a 100755
---- a/test/catalogs/test.sh
-+++ b/test/catalogs/test.sh
-@@ -10,6 +10,17 @@ fi
- 
- exitcode=0
- 
-+# Test xmlcatalog --shell command line
-+# Case 1: Really long argument (470 chars)
-+input=""; for i in {1..470}; do input="${input}A"; done
-+echo $input | $xmlcatalog --shell test/catalogs/dockbook.xml || exit 1
-+# Case 2: public + long argument
-+input="public "; for i in {1..470}; do input="${input}A"; done
-+echo $input | $xmlcatalog --shell test/catalogs/dockbook.xml || exit 1
-+# Case 3: public + lots of args
-+input="public "; for i in {1..80}; do input="${input} x"; done
-+echo $input | $xmlcatalog --shell test/catalogs/dockbook.xml || exit 1
-+
- for i in test/catalogs/*.script ; do
-     name=$(basename $i .script)
-     xml="./test/catalogs/$name.xml"
-diff --git a/xmlcatalog.c b/xmlcatalog.c
-index b400c7cb..5113e930 100644
---- a/xmlcatalog.c
-+++ b/xmlcatalog.c
-@@ -135,6 +135,12 @@ static void usershell(void) {
- 	       (*cur != '\n') && (*cur != '\r')) {
- 	    if (*cur == 0)
- 		break;
-+            /* Do not read beyond the command array capacity */
-+            if (i >= (int)sizeof(command) - 2) {
-+                printf("Invalid command %s\n", cur);
-+                i = 0;
-+                break;
-+            }
- 	    command[i++] = *cur++;
- 	}
- 	command[i] = 0;
-@@ -152,6 +158,11 @@ static void usershell(void) {
- 	while ((*cur != '\n') && (*cur != '\r') && (*cur != 0)) {
- 	    if (*cur == 0)
- 		break;
-+            if (i >= (int)sizeof(arg) - 2) {
-+                printf("Invalid arg %s\n", arg);
-+                i = 0;
-+                break;
-+            }
- 	    arg[i++] = *cur++;
- 	}
- 	arg[i] = 0;
-@@ -164,6 +175,11 @@ static void usershell(void) {
- 	cur = arg;
- 	memset(argv, 0, sizeof(argv));
- 	while (*cur != 0) {
-+            if (i >= (int)sizeof(argv) / (int)sizeof(char*)) {
-+                printf("Too much arguments\n");
-+                break;
-+            }
-+
- 	    while ((*cur == ' ') || (*cur == '\t')) cur++;
- 	    if (*cur == '\'') {
- 		cur++;
--- 
-2.43.0
-
diff --git a/meta/recipes-core/libxml/libxml2_2.15.3.bb b/meta/recipes-core/libxml/libxml2_2.15.4.bb
similarity index 96%
rename from meta/recipes-core/libxml/libxml2_2.15.3.bb
rename to meta/recipes-core/libxml/libxml2_2.15.4.bb
index abf9889b3f3..fc367892bfe 100644
--- a/meta/recipes-core/libxml/libxml2_2.15.3.bb
+++ b/meta/recipes-core/libxml/libxml2_2.15.4.bb
@@ -18,11 +18,10 @@ SRC_URI += "http://www.w3.org/XML/Test/xmlts20130923.tar;subdir=${BP};name=testt
            file://run-ptest \
            file://install-tests.patch \
            file://0001-Revert-cmake-Fix-installation-directories-in-libxml2.patch \
-           file://CVE-2026-11979.patch \
            "
 
-SRC_URI[archive.sha256sum] = "78262a6e7ac170d6528ebfe2efccdf220191a5af6a6cd61ea4a9a9a5042c7a07"
 SRC_URI[testtar.sha256sum] = "c6b2d42ee50b8b236e711a97d68e6c4b5c8d83e69a2be4722379f08702ea7273"
+SRC_URI[archive.sha256sum] = "98087fd181d9070724f3fbc65c7377db03038eb92bd882374daff44940138821"
 
 CVE_STATUS[CVE-2025-6170] = "fixed-version: fixed in version 2.14.5"
 CVE_STATUS[CVE-2026-6732] = "fixed-version: fixed in version 2.15.3"

