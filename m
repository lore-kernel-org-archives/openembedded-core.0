Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0737A109316E
	for <webhook@archiver.kernel.org>; Fri, 20 Mar 2026 00:28:39 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2631.1773966516460518943
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Mar 2026 17:28:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=gBtLEKuH;
 spf=pass (domain: smile.fr, ip: 209.85.128.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-48374014a77so12740445e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 17:28:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1773966515; x=1774571315; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vXR8dxPE7WfYOEJp9dsKI+1kx2EHH1KKmMWKVjh7MEk=;
        b=gBtLEKuHsxUzyY3NZZSP8hc4CfcTV892/SMR1Bi5OV/HyQfJDUQiJgvMgOA9lmDHdp
         /6f01UYhwN/x+oiURS4upJt1Q53A0D+e7NH35AxD7qqj8WzzaziR/XzeSa39eLRR2zDu
         8T65ouoUKiWuyEoeXY01akU5DAvjD/ZDtdjsw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773966515; x=1774571315;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vXR8dxPE7WfYOEJp9dsKI+1kx2EHH1KKmMWKVjh7MEk=;
        b=U7McNpOr9jzxAV4vtpFyxi6vYJlZnlZtAOVk/EU4KvkMtjQDso5ZIIrcAeXhxzt7e/
         UNwAuPBBNIJ+R8fikS2wSFE58GzpIQQUq0Q37y4SUY9I7y1l7acUQLezEH3MAQBu8gz1
         /Gph/Ncr/wME4l1ss2FP0JTl7SQXUf+KgrC6a3M5R1VMU//qY/aiiN3J2/hZmd0E0+6+
         ruGG5FPN8v6egcKigp5/X9cRQ0XQ0PM8Y8xnvwefTAiZT29FdNPXqEvOwMYRvKNXtcGk
         P4OC4aEaaJS8R+JYdV1bKbVkjf1Z85Dsx1bvWzUPRpk6I9Aj3qllpnkeUgBqR3g9oYSx
         IxLA==
X-Gm-Message-State: AOJu0YxjBNgeBTcRIH1GXKXjRwG4HGHuoEoyD2jdtFKoavM9nwNWXtvL
	YfFS2HuTlGAWGDJhoWRGrFIDfFvodTU+iA57y7S91tqEr8rrDXlegoTa1meCcdYbAYnMS8P8sUu
	s9+Jj
X-Gm-Gg: ATEYQzw2BzLWhWWOuRo7nT2zjAxjb+r7TWBteph9Ek2fHKKVtLfLh3zxt/sPyxxeOhk
	rKhT7Q8/6Zkqn7pDIV2zzygYOj/YrRXUVQdZJu1eHHeAb6sKr+Rt2a8xVl7/ghGGAbjjnIUTSLP
	QRwNRfZrjrvoXI1mAiGCRZZ15yyucV5/SQB+PbEUSm3oAmkALmgl+PoPNyvYGAAXlKUC6+BDJkk
	ouf4Vis/T3try0j4OSxo3rLyjt5yZppb80X56XpT3W2gI+iqANrPDOukCc6I84Xk7EkgfZ5/cLT
	CG7KM+2QevfSd3MF67OmvWqw9LRc7VrngYbKPMPii5mlZ5n6PRbE6F5gO9usdC10SwCeqol9Mzc
	vTdOD3eePx1/EoU9o6YJxcfeUvv7h5TjUQbvX6+p6jmB/d9ZooBIiVZHW5Uni01/5msrPqwGJdu
	0trz9wB2Ncu4wauxQIEUzMtEyH33M5d0ebrLs7H6VJweigpNqZMIzyj9RxVru0YDplu4bCuYJiZ
	wCny+GYn67SSc3kdo9TJXEQLdU=
X-Received: by 2002:a05:600c:1c0a:b0:485:40c6:f528 with SMTP id 5b1f17b1804b1-486fee2bb38mr14337595e9.30.1773966514528;
        Thu, 19 Mar 2026 17:28:34 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486fe8359acsm23850655e9.12.2026.03.19.17.28.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 17:28:34 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 13/15] inetutils: Fix CVE-2026-32746
Date: Fri, 20 Mar 2026 01:28:20 +0100
Message-ID: <025e550f82e2c2c68c5296c4d568163aad123be1.1773966414.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1773966414.git.yoann.congal@smile.fr>
References: <cover.1773966414.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Mar 2026 00:28:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233574

From: Vijay Anusuri <vanusuri@mvista.com>

Pick patch according to [1]

[1] https://security-tracker.debian.org/tracker/CVE-2026-32746
[2] https://lists.gnu.org/archive/html/bug-inetutils/2026-03/msg00031.html
[3] https://codeberg.org/inetutils/inetutils/pulls/17/files

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../inetutils/inetutils/CVE-2026-32746.patch  | 40 +++++++++++++++++++
 .../inetutils/inetutils_2.5.bb                |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 meta/recipes-connectivity/inetutils/inetutils/CVE-2026-32746.patch

diff --git a/meta/recipes-connectivity/inetutils/inetutils/CVE-2026-32746.patch b/meta/recipes-connectivity/inetutils/inetutils/CVE-2026-32746.patch
new file mode 100644
index 00000000000..0e55f3f0a4e
--- /dev/null
+++ b/meta/recipes-connectivity/inetutils/inetutils/CVE-2026-32746.patch
@@ -0,0 +1,40 @@
+From 6864598a29b652a6b69a958f5cd1318aa2b258af Mon Sep 17 00:00:00 2001
+From: Collin Funk <collin.funk1@gmail.com>
+Date: Wed, 11 Mar 2026 23:06:46 -0700
+Subject: [PATCH] telnetd: fix stack buffer overflow processing SLC suboption triplets
+
+Previously a client could write past the end of an internal buffer using
+an SLC suboption with many triplets using function octets greater than
+18, possibly leading to remote code execution. Reported by Adiel Sol,
+Arad Inbar, Erez Cohen, Nir Somech, Ben Grinberg, Daniel Lubel at DREAM
+Security Research Team at:
+<https://lists.gnu.org/r/bug-inetutils/2026-03/msg00031.html>.
+
+* telnetd/slc.c (add_slc): Return early if writing the tuple would lead
+us to writing past the end of the buffer.
+* NEWS.md: Mention the fix.
+
+Upstream-Status: Backport [https://cgit.git.savannah.gnu.org/cgit/inetutils.git/commit/?id=6864598a29b652a6b69a958f5cd1318aa2b258af]
+CVE: CVE-2026-32746
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ telnetd/slc.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/telnetd/slc.c b/telnetd/slc.c
+index b3cc117..9d6bad1 100644
+--- a/telnetd/slc.c
++++ b/telnetd/slc.c
+@@ -162,6 +162,9 @@ get_slc_defaults (void)
+ void
+ add_slc (register char func, register char flag, register cc_t val)
+ {
++  /* Do nothing if the entire triplet cannot fit in the buffer.  */
++  if (slcbuf + sizeof slcbuf - slcptr <= 6)
++    return;
+ 
+   if ((*slcptr++ = (unsigned char) func) == 0xff)
+     *slcptr++ = 0xff;
+-- 
+2.43.0
+
diff --git a/meta/recipes-connectivity/inetutils/inetutils_2.5.bb b/meta/recipes-connectivity/inetutils/inetutils_2.5.bb
index 6c53902356f..29ff62379d3 100644
--- a/meta/recipes-connectivity/inetutils/inetutils_2.5.bb
+++ b/meta/recipes-connectivity/inetutils/inetutils_2.5.bb
@@ -21,6 +21,7 @@ SRC_URI = "${GNU_MIRROR}/inetutils/inetutils-${PV}.tar.xz \
            file://CVE-2026-24061-1.patch \
            file://CVE-2026-24061-2.patch \
            file://CVE-2026-28372.patch \
+           file://CVE-2026-32746.patch \
            "
 
 inherit autotools gettext update-alternatives texinfo

