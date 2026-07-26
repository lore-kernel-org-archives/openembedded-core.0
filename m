Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E306C54F4E
	for <webhook@archiver.kernel.org>; Sun, 26 Jul 2026 08:30:33 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7390.1785054624195630509
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Jul 2026 01:30:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=CPB/bnTu;
 spf=pass (domain: smile.fr, ip: 209.85.128.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4957eefd361so13244685e9.1
        for <openembedded-core@lists.openembedded.org>; Sun, 26 Jul 2026 01:30:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1785054622; x=1785659422; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=pqFAVZsMIpoCtO9fRRVf5N6nZbeNC9bExTuzcvnepJc=;
        b=CPB/bnTu2m+uWrEgm2RRnnezf4JLXjfRVvuSophznrDjKJGdL+JtQ3QTzp6n8MmaHB
         t/IeCrVTqdDrfehzViBCa8zgYbRW/gPx3ZMA4QbBaFFqA8IFePw2g72kJuVlBVhZM8R0
         7Q2ui0avlrCf7yCoHLMuSKqIqMvK1/LKX6idw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785054622; x=1785659422;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=pqFAVZsMIpoCtO9fRRVf5N6nZbeNC9bExTuzcvnepJc=;
        b=i6qQfKLSQ2K4OW8Db22NpU4pG89SYI1VECjDIQtroOU6JFXjVcL7xtpHKphKjt4NtY
         Jqh7K9BKO2FUlfdPrDmqPTstjy1zQK0swy0A+80nmCuYwZG+5EyQgSDrzwhky3jKLZbS
         BFC6F5QrqKc7pILkgD9533Q2HrZ0Yz0vl1D/Rv+t5WumQGFoQY9Wyw9bsQ9un1hj9a4n
         1Kqtx+e1gqDVm6vTwLdMZ7H8CW52oFN2qmgLuU7/2N0gjcsy65mwFL9ETycsQRRFyndq
         5lhukCBJzfdSK3eBH2wlMwGsgU++A4AbazDHdhjwYhtsm7HQniAiZtUV/0vpTGQvRonF
         3oBA==
X-Gm-Message-State: AOJu0Ywdh+iyMOKAVtw0cL22OuCDjvr27/oO76wplBV4Fmm0xz/i+Iqd
	04Zbj/nWSaTjarkngJdqKa6xqFqfB3nZS2HW76UzPbR8AkDYRSeOxrISB4ji01POyr+XMG3ZHm2
	UuREAriI=
X-Gm-Gg: AR+sD1344fwJSY2Vg0AS5ZVeOVtdI1HOttKwiM2Xe6bOTqHxl60/sTyrzlfudd0VPCL
	lH7eBdac7khexqzL6VKKGRcHngGQTaLh1DT/Emn7LBwvvIX/eYfD4tDO8J7yrbNOsQSLz9bECjg
	iN7L2FwdmW1wIScvUbj6qgWYXeJsrP26d+RvdG7PWT713W5FOanpdHjY+SjttTPZnVWz/9lRpGh
	uedzGc23qebram3gMcVgZsE8G2LBdmNag1vnzu2LRwFvEpdJJ0WWOI0erA9DPoOk7MzHLBS1JFu
	d15dQV0rWANhueyrs6v5KwHhhBrc8HUBbIQKw8VvGKu5nUJKSnVq/x3vA8cXy05Zuy3rO6UXE9x
	+OFWo877BA5KM2PwXVbbux7oci/VH0F+EAZ2XhU0DaWuDm/JwQBIeXUb48QsvjBrfvDA1NpohSW
	ztFwD6zYg4jLy/MgNptTOdaFl6hltW8su+LAa32aYj7yqSumlxqOCjb9jqZkk6mXWoD2VEMuo6O
	2TxAw==
X-Received: by 2002:a05:600c:4593:b0:493:bd2a:93bb with SMTP id 5b1f17b1804b1-496b56f0fb5mr57457985e9.3.1785054622372;
        Sun, 26 Jul 2026 01:30:22 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496b4f24a93sm142482505e9.11.2026.07.26.01.30.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 01:30:22 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 21/31] libxpm: fix CVE-2026-4367
Date: Sun, 26 Jul 2026 10:29:45 +0200
Message-ID: <b3f8956f38b2f2cb0f260ab8853e9d028831f420.1785054430.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1785054429.git.yoann.congal@smile.fr>
References: <cover.1785054429.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 26 Jul 2026 08:30:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242003

From: Enoch Ng <enoch.ng@windriver.com>

Backport the upstream fix for CVE-2026-4367, in which the
`xpmNextWord()` function could attempt to read beyond the file's
end due to improper validation of file boundaries.

Reference: https://nvd.nist.gov/vuln/detail/CVE-2026-4367

Signed-off-by: Enoch Ng <enoch.ng@windriver.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 ...67-Out-of-bounds-read-in-xpmNextWord.patch | 140 ++++++++++++++++++
 .../xorg-lib/libxpm_3.5.17.bb                 |   1 +
 2 files changed, 141 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-lib/libxpm/0001-Fix-CVE-2026-4367-Out-of-bounds-read-in-xpmNextWord.patch

diff --git a/meta/recipes-graphics/xorg-lib/libxpm/0001-Fix-CVE-2026-4367-Out-of-bounds-read-in-xpmNextWord.patch b/meta/recipes-graphics/xorg-lib/libxpm/0001-Fix-CVE-2026-4367-Out-of-bounds-read-in-xpmNextWord.patch
new file mode 100644
index 00000000000..e9989a5012c
--- /dev/null
+++ b/meta/recipes-graphics/xorg-lib/libxpm/0001-Fix-CVE-2026-4367-Out-of-bounds-read-in-xpmNextWord.patch
@@ -0,0 +1,140 @@
+From 5448e1bd7252780b16db869c2253d24e0fe0ae18 Mon Sep 17 00:00:00 2001
+From: Olivier Fourdan <ofourdan@redhat.com>
+Date: Tue, 17 Feb 2026 11:59:56 +0100
+Subject: [PATCH libXpm] Fix CVE-2026-4367: Out-of-bounds read in xpmNextWord()
+
+xpmNextWord() checks for the terminator character to detect the end of
+the file, but a very small malformed XPM file may cause the function to
+read past the end of the buffer, causing out-of-bound reads:
+
+  == Invalid read of size 1
+  ==    at 0x48AD3A4: xpmParseColors (parse.c:239)
+  ==    by 0x48AF9D8: xpmParseData (parse.c:783)
+  ==    by 0x48B1C18: XpmCreateXpmImageFromBuffer (CrIFrBuf.c:101)
+  ==    by 0x4005A6: main ()
+  ==  Address 0x4c413bf is 0 bytes after a block of size 15 alloc'd
+  ==    at 0x4841B26: malloc (vg_replace_malloc.c:447)
+  ==    by 0x48B2809: XpmReadFileToBuffer (RdFToBuf.c:96)
+  ==    by 0x400554: main ()
+  ==
+  == Invalid read of size 1
+  ==    at 0x48AC8D5: xpmNextWord.constprop.0 (data.c:262)
+  ==    by 0x48AD492: xpmParseColors (parse.c:266)
+  ==    by 0x48AF9D8: xpmParseData (parse.c:783)
+  ==    by 0x48B1C18: XpmCreateXpmImageFromBuffer (CrIFrBuf.c:101)
+  ==    by 0x4005A6: main ()
+  ==  Address 0x4c413c0 is 1 bytes after a block of size 15 alloc'd
+  ==    at 0x4841B26: malloc (vg_replace_malloc.c:447)
+  ==    by 0x48B2809: XpmReadFileToBuffer (RdFToBuf.c:96)
+  ==    by 0x400554: main ()
+  ==
+  == Invalid read of size 1
+  ==    at 0x48AC965: xpmNextWord.constprop.0 (data.c:265)
+  ==    by 0x48AD492: xpmParseColors (parse.c:266)
+  ==    by 0x48AF9D8: xpmParseData (parse.c:783)
+  ==    by 0x48B1C18: XpmCreateXpmImageFromBuffer (CrIFrBuf.c:101)
+  ==    by 0x4005A6: main ()
+  ==  Address 0x4c413c0 is 1 bytes after a block of size 15 alloc'd
+  ==    at 0x4841B26: malloc (vg_replace_malloc.c:447)
+  ==    by 0x48B2809: XpmReadFileToBuffer (RdFToBuf.c:96)
+  ==    by 0x400554: main ()
+
+The problem actually comes from xpmNextString() and xpmParseColors():
+
+1) xpmNextString() checks for the NULL terminator when looking for the
+   end of the string (Eos) but not when looking for the beginning of the
+   next string (Bos).
+
+2) xpmParseColors() does not check the return value from xpmNextString()
+   and continues even when xpmNextString() raised an invalid XPM file.
+
+To avoid the issue, fix xpmNextString() to check for the NULL string
+terminator when looking for the beginning of the next string and fix
+xpmParseColors() to stop when xpmNextString() reported an invalid XPM
+error.
+
+CVE-2026-4367
+
+This vulnerability was discovered by:
+Naoki Wakamatsu
+
+v2: Fix the XPM 1 code path the same.
+
+Signed-off-by: Olivier Fourdan <ofourdan@redhat.com>
+Part-of: <https://gitlab.freedesktop.org/xorg/lib/libxpm/-/merge_requests/31>
+
+CVE: CVE-2026-4367
+Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/lib/libxpm/-/commit/5448e1bd7252780b16db869c2253d24e0fe0ae18]
+Signed-off-by: Enoch Ng <enoch.ng@windriver.com>
+
+---
+
+ src/data.c  |  3 +++
+ src/parse.c | 19 ++++++++++++++-----
+ 2 files changed, 17 insertions(+), 5 deletions(-)
+
+diff --git a/src/data.c b/src/data.c
+index 6e87455..a2b4acc 100644
+--- a/src/data.c
++++ b/src/data.c
+@@ -210,6 +210,9 @@ xpmNextString(xpmData *data)
+ 	    while ((c = *data->cptr++) && c != data->Bos && c != '\0')
+ 		if (data->Bcmt && c == data->Bcmt[0])
+ 		    ParseComment(data);
++
++	    if (c == '\0')
++		return XpmFileInvalid;
+ 	} else if (data->Bcmt) {	/* XPM2 natural */
+ 	    while (((c = *data->cptr++) == data->Bcmt[0]) && c != '\0')
+ 		ParseComment(data);
+diff --git a/src/parse.c b/src/parse.c
+index cd923f9..268954d 100644
+--- a/src/parse.c
++++ b/src/parse.c
+@@ -216,7 +216,9 @@ xpmParseColors(
+ 
+     if (!data->format) {		/* XPM 2 or 3 */
+ 	for (a = 0, color = colorTable; a < ncolors; a++, color++) {
+-	    xpmNextString(data);	/* skip the line */
++	    ErrorStatus = xpmNextString(data);         /* skip the line */
++	    if (ErrorStatus != XpmSuccess)
++		goto error;
+ 
+ 	    /*
+ 	     * read pixel value
+@@ -314,7 +316,9 @@ xpmParseColors(
+ 	/* get to the beginning of the first string */
+ 	data->Bos = '"';
+ 	data->Eos = '\0';
+-	xpmNextString(data);
++	ErrorStatus = xpmNextString(data);
++	if (ErrorStatus != XpmSuccess)
++	    goto error;
+ 	data->Eos = '"';
+ 	for (a = 0, color = colorTable; a < ncolors; a++, color++) {
+ 
+@@ -354,7 +358,9 @@ xpmParseColors(
+ 	    /*
+ 	     * read color values
+ 	     */
+-	    xpmNextString(data);	/* get to the next string */
++	    ErrorStatus = xpmNextString(data);	/* get to the next string */
++	    if (ErrorStatus != XpmSuccess)
++		goto error;
+ 	    *curbuf = '\0';		/* init curbuf */
+ 	    while ((l = xpmNextWord(data, buf, BUFSIZ))) {
+ 		if (*curbuf != '\0') {
+@@ -378,8 +384,11 @@ xpmParseColors(
+ 	    memcpy(s, curbuf, len);
+ 	    color->c_color = s;
+ 	    *curbuf = '\0';		/* reset curbuf */
+-	    if (a < ncolors - 1)	/* can we trust ncolors -> leave data's bounds */
+-		xpmNextString(data);	/* get to the next string */
++	    if (a < ncolors - 1) {	/* can we trust ncolors -> leave data's bounds */
++		ErrorStatus = xpmNextString(data);	/* get to the next string */
++		if (ErrorStatus != XpmSuccess)
++		    goto error;
++	    }
+ 	}
+     }
+     *colorTablePtr = colorTable;
diff --git a/meta/recipes-graphics/xorg-lib/libxpm_3.5.17.bb b/meta/recipes-graphics/xorg-lib/libxpm_3.5.17.bb
index 8e15ecc0d48..9d1dd477429 100644
--- a/meta/recipes-graphics/xorg-lib/libxpm_3.5.17.bb
+++ b/meta/recipes-graphics/xorg-lib/libxpm_3.5.17.bb
@@ -22,6 +22,7 @@ PACKAGES =+ "sxpm cxpm"
 FILES:cxpm = "${bindir}/cxpm"
 FILES:sxpm = "${bindir}/sxpm"
 
+SRC_URI += " file://0001-Fix-CVE-2026-4367-Out-of-bounds-read-in-xpmNextWord.patch"
 SRC_URI[sha256sum] = "64b31f81019e7d388c822b0b28af8d51c4622b83f1f0cb6fa3fc95e271226e43"
 
 BBCLASSEXTEND = "native"

