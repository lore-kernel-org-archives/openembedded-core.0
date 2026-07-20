Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85DEEC44531
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 17:23:47 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2875.1784568221500271973
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jul 2026 10:23:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=q47JMAB4;
 spf=pass (domain: smile.fr, ip: 209.85.128.50, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-49546c690ffso27067665e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 10:23:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1784568220; x=1785173020; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RkdYb1/khWfzkjOO8XfN9zeN59KzoW2uCXEI8TB1WkM=;
        b=q47JMAB4Hk5BBtSHwYgtXpAOzwM4RZvQWoM1k08srtnYqJnRq70hl3RahifAt6Jqsq
         9cA7GbZdD+EE8KI6Ds10c9R1Bgcz8IHtYLo6v60Jh+dmw594thSBs33p9VczQBHp3GcV
         nuPq3+BoqC/XPqRWI2Fz3gj5CP4KcL9W6R+mM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784568220; x=1785173020;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RkdYb1/khWfzkjOO8XfN9zeN59KzoW2uCXEI8TB1WkM=;
        b=rh7tfjFD9fVU9UAlpypjLvW/kcyS1I7OapR/7VXzADOB1oZnzm2Rr2zhcttpYslJdK
         tuCMvLZ88rI8NgsC4vKM69KZgwzVAZRAPFvw7ZBVYyNb6xwOvEXQ7zTHXavGHT4i96Jz
         t1x9vzO+0grtTBuSl1YHzujY6nLdIxrOWaHwtGO86ZB25RqORq3b1N80Uk8yx2owiXbb
         DWeDuTiIKtOK8fwxBDndaikUb8pej7uXVfYWCQP+jeaWi0opNlET1jjQjJnOg9KTIaGm
         UZciq94knJAKPZPVRet+b3jVM002KIc0Ot2/VchhidmouHUGAlcC5HqV7p/LPLiVfhUi
         7U2w==
X-Gm-Message-State: AOJu0YzEMkLweN0BQnOv+Nn3kFTCiYqJZYbI2wppTN9FtDv7+KLGO4x1
	G6OzriD96ed1ZCzww/ClO6wDhgsLjdn1cPFZE7ZmLQJAvbX2jNFuvGaix2O4gngKlo8FBbB9yAg
	BjWyv7IA=
X-Gm-Gg: AfdE7cn2XkW/pHFomzKTSMsAXFhFtgn2wdcPFqYYijWzAFwZNDjvdRgbn2QRoMJ1ppw
	uchBLGwYAaw/RdjKYpVBaRKphyD4AIPUkiwIQjf1gqzzD9G8iFxUdSEaKNQM7y/T3Glef7hhglo
	P901LHUPh/Z6CNlLNg+8q9qH2WsruasdjOPB8WSlTMhdXd9+6zP1zHy0tzZbUtJqtVigvkNK3og
	mln4U6J46rD9TSr19U4jojhBHtM1L4QNN9KXfASAEuU2oEZebEYoyROQK3dLZfFFMaXQWeyWT94
	y2nLdUU7akAN+cAZXIqih65/kKH2DExakulVa9rrqzWUXMey8Zwou6OB+cjNEd03Wa7aJkQYb0I
	WcOjcNVPGSKXNAMVmOCP+/XmvPBPtKdbK09aoEOvQkTbW/MokvteYysjGf2WCgA5jwT1OZOvXbE
	rzhJ2EN1gEXcrpz24bA7PteHZUUi6ScbO2rZNU2vethg9gcggHidqSL+C9oh4lZlPB9SHWA82dW
	7dafLAY3Wk6qAvtnN8=
X-Received: by 2002:a05:600c:3b20:b0:495:4f62:c9f5 with SMTP id 5b1f17b1804b1-4954f62ca61mr136230035e9.24.1784568219599;
        Mon, 20 Jul 2026 10:23:39 -0700 (PDT)
Received: from localhost.localdomain (2a02-8440-b501-5b7b-2580-caa3-ecc1-dea5.rev.sfr.net. [2a02:8440:b501:5b7b:2580:caa3:ecc1:dea5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49563eee22esm36508575e9.1.2026.07.20.10.23.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 10:23:39 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 17/33] gzip: fix CVE-2026-41992
Date: Mon, 20 Jul 2026 19:22:50 +0200
Message-ID: <aaaa61c4e0ba347849a23b787eb257d9f7e02f2f.1784567958.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1784567958.git.yoann.congal@smile.fr>
References: <cover.1784567958.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 17:23:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241451

From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>

Backport upstream fix for a global buffer overflow in the LZH
decompression logic (unlzh.c). The left[] and right[] global arrays
shared across LZW and LZH decompression routines are not reinitialized
between files processed in the same invocation, allowing an
out-of-bounds read in the LZH decoder.

Adapted for gzip 1.13:
- Refreshed NEWS and THANKS hunks to match 1.13 release context.

Reference: https://nvd.nist.gov/vuln/detail/CVE-2026-41992
Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit deaaaacabbf8d21fb9271e3f6f83055893510cff)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../gzip/gzip-1.13/CVE-2026-41992.patch       | 64 +++++++++++++++++++
 meta/recipes-extended/gzip/gzip_1.13.bb       |  1 +
 2 files changed, 65 insertions(+)
 create mode 100644 meta/recipes-extended/gzip/gzip-1.13/CVE-2026-41992.patch

diff --git a/meta/recipes-extended/gzip/gzip-1.13/CVE-2026-41992.patch b/meta/recipes-extended/gzip/gzip-1.13/CVE-2026-41992.patch
new file mode 100644
index 00000000000..4db9a1c1afd
--- /dev/null
+++ b/meta/recipes-extended/gzip/gzip-1.13/CVE-2026-41992.patch
@@ -0,0 +1,64 @@
+From 63dbf6b3b9e6e781df1a6a64e609b10e23969681 Mon Sep 17 00:00:00 2001
+From: Paul Eggert <eggert@cs.ucla.edu>
+Date: Wed, 15 Apr 2026 12:00:17 -0700
+Subject: =?UTF-8?q?gzip:=20don=E2=80=99t=20mishandle=20.lzh=20after=20.Z?=
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Problem reported by Michał Majchrowicz.
+* unlzh.c (read_c_len): Clear left and right when n == 0.
+
+CVE: CVE-2026-41992
+Upstream-Status: Backport [https://cgit.git.savannah.gnu.org/cgit/gzip.git/commit/?id=63dbf6b3b9e6e781df1a6a64e609b10e23969681]
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+ NEWS    | 4 ++++
+ THANKS  | 1 +
+ unlzh.c | 6 ++++++
+ 3 files changed, 11 insertions(+)
+
+diff --git a/NEWS b/NEWS
+index bdb7cc0..af2a08f 100644
+--- a/NEWS
++++ b/NEWS
+@@ -14,6 +14,10 @@ GNU gzip NEWS                                    -*- outline -*-
+ 
+ ** Bug fixes
+ 
++  A buffer overflow has been fixed when decompressing an .lzh file
++  after decompressing a .Z file.
++  [bug present since the beginning]
++
+   'gzip -d' no longer fails to report invalid compressed data
+   that uses a dictionary distance outside the input window.
+   [bug present since the beginning]
+diff --git a/THANKS b/THANKS
+index 4e545d9..a7d25e4 100644
+--- a/THANKS
++++ b/THANKS
+@@ -186,6 +186,7 @@ Jamie Lokier            u90jl@ecs.oxford.ac.uk
+ Richard Lloyd           R.K.Lloyd@csc.liv.ac.uk
+ David J. MacKenzie	djm@eng.umd.edu
+ John R MacMillan        john@chance.gts.org
++Michał Majchrowicz	mmajchrowicz@afine.com
+ Ron Male                male@eso.mc.xerox.com
+ Jakub Martisko		jamartis@redhat.com
+ Don R. Maszle           maze@bea.lbl.gov
+diff --git a/unlzh.c b/unlzh.c
+index 3320196..a6cf109 100644
+--- a/unlzh.c
++++ b/unlzh.c
+@@ -232,6 +232,12 @@ read_c_len ()
+         c = getbits(CBIT);
+         for (i = 0; i < NC; i++) c_len[i] = 0;
+         for (i = 0; i < 4096; i++) c_table[i] = c;
++
++        /* Needed in case LEFT and RIGHT are reused from a previous
++           LZW decompression.  It may be overkill to clear all of both
++           arrays, but nobody has had time to analyze this carefully.  */
++        memzero(left, (2 * NC - 1) * sizeof *left);
++        memzero(right, (2 * NC - 1) * sizeof *left);
+     } else {
+         i = 0;
+         while (i < n) {
diff --git a/meta/recipes-extended/gzip/gzip_1.13.bb b/meta/recipes-extended/gzip/gzip_1.13.bb
index fd846b30a55..208220867a6 100644
--- a/meta/recipes-extended/gzip/gzip_1.13.bb
+++ b/meta/recipes-extended/gzip/gzip_1.13.bb
@@ -6,6 +6,7 @@ LICENSE = "GPL-3.0-or-later"
 
 SRC_URI = "${GNU_MIRROR}/gzip/${BP}.tar.gz \
            file://run-ptest \
+           file://CVE-2026-41992.patch \
            "
 SRC_URI:append:class-target = " file://wrong-path-fix.patch"
 

