Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9224CCCF2C6
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 22:24:46 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5935.1792189483166648556
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Oct 2026 15:24:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Dtdwxn1o;
 spf=pass (domain: smile.fr, ip: 209.85.128.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a022fee0caso3530575e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 15:24:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1792189481; x=1792794281; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=0vDKZis7rfrTFDZbdBZS5fY7UsrFqu7nuOaaMWe9aDs=;
        b=Dtdwxn1oU8GKh0P1CNe9I+pksOXbh6vm4DVfdChpsImBg50BanDITdS8dr9rNWwoLl
         5PR4Aw1FopD3hp41Vzs6ELF0gbRFH2p5TSVOhYByPAw1V839q11jVENRspkif1X420TL
         1N+wGHnM3lRmI9JZaR/YJwY3lx1+bQ+0P4pio=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792189481; x=1792794281;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=0vDKZis7rfrTFDZbdBZS5fY7UsrFqu7nuOaaMWe9aDs=;
        b=wH366n4H/SMWlqkyN1x16tLr9v6vrKkmaojBmOZaz02eznuRD7r/eEU6dUoeLYRrao
         gwp/vZ0s9eNINLPabPH08CcWcBsYM+4UDWs7EpjFtcmwVksUNXH4Wjc0NDAgOhxoMlqL
         +haRfOtpuaCX7EE+6u3P5u8vHhWtMMffS2KrYuvIWt3fP0qKX8GQezxPL21jVI/Rt0rJ
         73ayDXhhQq8hfcE586XqXcxoUyaEgeV/gjoq0IiYBnzfxP3uhQUBQu+N2tl7mIzUzeza
         6rknyVbwrsFq6nuL0zFDs0ZOtmmB9vAY+zUjiQR97GCxUzEjz57v4VvpvZBJurHh/QOS
         RP+Q==
X-Gm-Message-State: AFq9FYKWSx1M2WO8xJbPW1tPv6hWoSlZP4XPDl+FiqI1QiFq14mh4AVO
	h9PvasayzGoA72AwjHLy9rDHd1t9UpW7LkJ8+VK0xNXc/HCxtIxedhf0iwkz3Aick+CA/nqByXr
	21rve1EE=
X-Gm-Gg: AYBFou01lCDae/bxu+IPAe6NReje3L1zefhI7cAFsbibQjoqjFypZUEuu/7wg8LBUZS
	o14++XHw9JzvXYZkwSpFjlRCK+J7/I95L8s6AviVUh6IWdphggbPycqN7+Pn1hhXVRNlm5gBAHY
	Ur82jDlSUfJLPsbwUFE3KMTbGeW18SrDjkvFLvAeqaEgQDin11F5Iu2yW1vxYN8jKf4vBjDF5j5
	K1/skq8BucKIeMXgaXgaqbUM/1Lzpr4z57WzhKxwAeAEFi3lQUXfakzvNmU/a6VnVyjHJ5i1way
	FFq7W/u5GwfyKY0FCIm7DO1iahE8/K2ztiXlzZcZ62Wf5FL5WDLjDZw3mHAF3x/v5+sIHK7A8zW
	PPOzmarM/zyFZzWu2ulcQrKdAPSnJ3NeFS8FfC3Hv1aO8rfNAkUxwaADPwrFXOP0iG1hMD3byew
	+2gHpPYdL2uwdu1SsL/yD2HGofZxij/lc5bzmuKFKIp9CF0e0Y0WDNtMTZHdNIAZoRtEszIiIFl
	OfiggLgYk43MorC07SfmCZsNpxTNnD/jA0YUd/YxZURFM+u/zqgc5noGCuPonnxtUI1LkCN4Q==
X-Received: by 2002:a05:6000:4310:b0:48c:69b3:610f with SMTP id ffacd0b85a97d-48e07bbdda1mr2089526f8f.26.1792189481237;
        Fri, 16 Oct 2026 15:24:41 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd503862sm7639515f8f.46.2026.10.16.15.24.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 15:24:40 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][blacksail 03/17] popt: patch CVE-2026-18743
Date: Sat, 17 Oct 2026 00:24:05 +0200
Message-ID: <cdf3e63ee01ab5f975b9b6bbc600bf3a404de6ab.1792189264.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1792189264.git.yoann.congal@smile.fr>
References: <cover.1792189264.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 22:24:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248053

From: Peter Marko <peter.marko@siemens.com>

Pick patch referencing this CVE.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(From OE-Core rev: 6a47df77d4dda066f6c3651480546a79fd445ae6)
Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../popt/popt/CVE-2026-18743.patch            | 97 +++++++++++++++++++
 meta/recipes-support/popt/popt_1.19.bb        |  1 +
 2 files changed, 98 insertions(+)
 create mode 100644 meta/recipes-support/popt/popt/CVE-2026-18743.patch

diff --git a/meta/recipes-support/popt/popt/CVE-2026-18743.patch b/meta/recipes-support/popt/popt/CVE-2026-18743.patch
new file mode 100644
index 00000000000..d57a39b4705
--- /dev/null
+++ b/meta/recipes-support/popt/popt/CVE-2026-18743.patch
@@ -0,0 +1,97 @@
+From ea2092edba8d6c1a9acd60d9fd7a587c624d6ffe Mon Sep 17 00:00:00 2001
+From: Panu Matilainen <pmatilai@redhat.com>
+Date: Tue, 11 Aug 2026 11:45:44 +0300
+Subject: [PATCH] Fix CVE-2026-18743: buffer overflow(s) in
+ poptConfigFileToString()
+
+Fix the reallocation logic thinko, repeated twice in the function:
+if we need to reallocate, the current maximum value is not interesting
+in any way. Just allocate double the required size instead.
+
+The reproducer test is obviously closely tied to the initial buffer
+size of 480 and wouldn't work with other sizes, but with the current
+default this reliably crashes popt under ASAN prior to this fix.
+Also , the reproducer only exercises the first of these flaws.
+
+Fixes: CVE-2026-18743
+
+CVE: CVE-2026-18743
+Upstream-Status: Backport [https://github.com/rpm-software-management/popt/commit/ea2092edba8d6c1a9acd60d9fd7a587c624d6ffe]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ src/poptparse.c            | 10 ++++------
+ tests/test3-data/05.answer |  5 +++++
+ tests/test3-data/05.input  |  2 ++
+ tests/testit.sh            |  1 +
+ 4 files changed, 12 insertions(+), 6 deletions(-)
+ create mode 100644 tests/test3-data/05.answer
+ create mode 100644 tests/test3-data/05.input
+
+diff --git a/src/poptparse.c b/src/poptparse.c
+index f405081..c2a5435 100644
+--- a/src/poptparse.c
++++ b/src/poptparse.c
+@@ -139,7 +139,6 @@ int poptConfigFileToString(FILE *fp, char ** argstrp,
+     char * p;
+     char * q;
+     char * x;
+-    size_t t;
+     size_t argvlen = 0;
+     size_t maxlinelen = sizeof(line);
+     size_t linelen;
+@@ -186,9 +185,9 @@ int poptConfigFileToString(FILE *fp, char ** argstrp,
+ 	if (*q == '\0') {
+ 	    /* single command line option (ie, no name=val, just name) */
+ 	    q[-1] = '\0';		/* kill off newline from fgets() call */
+-	    argvlen += (t = (size_t)(q - p)) + (sizeof(" --")-1);
++	    argvlen += ((size_t)(q - p)) + (sizeof(" --")-1);
+ 	    if (argvlen >= maxargvlen) {
+-		maxargvlen = (t > maxargvlen) ? t*2 : maxargvlen*2;
++		maxargvlen = argvlen * 2;
+ 		argstr_tmp = realloc(argstr, maxargvlen);
+ 		if (argstr_tmp == NULL) {
+ 		    free(argstr);
+@@ -218,10 +217,9 @@ int poptConfigFileToString(FILE *fp, char ** argstrp,
+ 	    *x = '\0';	/* null out last char if space (including fgets() NL) */
+ 
+ 	/* rest of line accept */
+-	t = (size_t)(x - p);
+-	argvlen += t + (sizeof("' --='")-1);
++	argvlen += ((size_t)(x - p) + sizeof("' --='")-1);
+ 	if (argvlen >= maxargvlen) {
+-	    maxargvlen = (t > maxargvlen) ? t*2 : maxargvlen*2;
++	    maxargvlen = argvlen * 2;
+ 	    argstr_tmp = realloc(argstr, maxargvlen);
+ 	    if (argstr_tmp == NULL) {
+ 		free(argstr);
+diff --git a/tests/test3-data/05.answer b/tests/test3-data/05.answer
+new file mode 100644
+index 0000000..37b7fb8
+--- /dev/null
++++ b/tests/test3-data/05.answer
+@@ -0,0 +1,5 @@
++single string: ' --aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa --bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb'
++popt array: size=2
++'--aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa'
++'--bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb'
++
+diff --git a/tests/test3-data/05.input b/tests/test3-data/05.input
+new file mode 100644
+index 0000000..2508292
+--- /dev/null
++++ b/tests/test3-data/05.input
+@@ -0,0 +1,2 @@
++aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
++bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb
+diff --git a/tests/testit.sh b/tests/testit.sh
+index 26724d6..4078f51 100755
+--- a/tests/testit.sh
++++ b/tests/testit.sh
+@@ -179,6 +179,7 @@ fi
+ run_diff test3 "test3 - 1" test3-data/01.input test3-data/01.answer
+ run_diff test3 "test3 - 2" test3-data/02.input test3-data/02.answer
+ run_diff test3 "test3 - 3" test3-data/03.input test3-data/03.answer
++run_diff test3 "test3 - 5" test3-data/05.input test3-data/05.answer
+ 
+ echo ""
+ echo "Passed."
diff --git a/meta/recipes-support/popt/popt_1.19.bb b/meta/recipes-support/popt/popt_1.19.bb
index 525bf553b10..3e9137c156a 100644
--- a/meta/recipes-support/popt/popt_1.19.bb
+++ b/meta/recipes-support/popt/popt_1.19.bb
@@ -10,6 +10,7 @@ DEPENDS = "virtual/libiconv"
 
 SRC_URI = "http://ftp.rpm.org/popt/releases/popt-1.x/${BP}.tar.gz \
            file://run-ptest \
+           file://CVE-2026-18743.patch \
            "
 SRC_URI[sha256sum] = "c25a4838fc8e4c1c8aacb8bd620edb3084a3d63bf8987fdad3ca2758c63240f9"
 

