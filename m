Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAED3CF34A0
	for <webhook@archiver.kernel.org>; Wed, 19 Nov 2025 12:43:06 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5976.1763556181418509500
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Nov 2025 04:43:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GGKc1mGk;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4779aa4f928so47576225e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Nov 2025 04:43:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763556180; x=1764160980; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ndcl8NFNAQW1UTdu+IhgxOertteqaMqVkXjmzby5Ys0=;
        b=GGKc1mGk5pMXey5ZdMkkANkzDCdDSyFQED462MhmDMqv/FS67UhPVjdHZULx8Kw6vt
         V3DuG6BdIzHWN7XB73dzGmdZMjjCapCH+9/a2hry5Jr9SPn0SCEJUCgoyQ4hPzODGZ8w
         lCP4jTSZ7GPHzX1vJH24gxHtdxfq1qDAhcNRvHsIp/w82cRAh6pPcjRcEeQV01gMBsMb
         aPaMI6M+sRZ9386qVez+Xe0feOWMlNxZMRtfGLeFvZCDHpyjToyLJ0LklNmDRTF9j3Mg
         QijIq22/mvT/P0iLPdwmUlM/a+kkrYD7iZ1/5V+Ctsg8oxxxbcHF0+cD4TnqjUdXUkCL
         eGyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763556180; x=1764160980;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ndcl8NFNAQW1UTdu+IhgxOertteqaMqVkXjmzby5Ys0=;
        b=aO81AtLrZ69E3cv2LgsS91r/ID29trJsTwzBGOX0pURleGtHkM5lyu1c+GfrvrcjAT
         4SaACvCIL0Y2pW60kNXLlFkH+KB9HNRBjaxL0Y0YldzOCansO88RoY876WEiOCXbCuu0
         W+KWfWmMAZ4Xt6EuTg03e2cA67tx4Rc/sWy7L0MSPWhsF6FIEMHfPBvtcnAg9pkNsITK
         4Ndx8iYblncUDgHKKvnP3ix4BTz2c0LO3MbfaXlfzu8gM1MlgNXpMTyce5ZxjODc1suY
         DXBKwlKx9CWeH9Eg4wXe4JobGFMkuiTG8QqMjH+sRvD0YOR6sjaYSV73P6jJVOIKq7x6
         PbEA==
X-Gm-Message-State: AOJu0Yw8e2CgFEqRcBNkU+XEYus5gHHFZmgSnHfab9/DV71UhXXTOmOD
	hcMb2R/pkELXoLr68hW8lxFIYQzL+e2K1JfsG1t9pa/OWBuhU4XyxqoVRHq2VIzE
X-Gm-Gg: ASbGnctj1c85GIulCuTSRi9AVsmlOfZnelvDX3swM6+nDNbhtglo/zyDxCvgx1j8Cq3
	D+lvLIHWuhUHDff+INc30gLfm7SCEnXHXLC5GztHwvA7EY8hn43eHobV6NSyOO/mOUuepEmvMmy
	JUrMY6mw4f7lyuqc/AevmKAAsaIdXRFpSAtitbCPZc37qrre3urMhnhvkPaAS15KvPLVyDIPJFT
	29uWUOXApXSQiMVJNDatv3K7qG9CZmQkSw9NDCUbdZ/BcR1kjtjTrqDOtV4iq5iWhLcMgDmx/2T
	bmSw1TEnUaWK9pdkqzGMNyEJIdNdduxGrWtc3pdJ7n5ZJtPjx9cQX1W8oV8m/iErTB8Pck3Mxmj
	I7mIv4lwb72Fzrm3OVhRua5n4O+LZQfDlnP+vGTYFy6KmJshRlSYijAw713c3a4x1p1670DCkWD
	sTIEIVclOht+nsWZMNQ0c=
X-Google-Smtp-Source: AGHT+IGbalNieqMiBv0dodMtvhkK+RL4lIdWM8KOx7MVNGHBcVBUbXVH9iSJ55757J1jFCLnUiTsfg==
X-Received: by 2002:a05:600c:1986:b0:477:28c1:26ce with SMTP id 5b1f17b1804b1-4778fe41be4mr179182565e9.7.1763556179472;
        Wed, 19 Nov 2025 04:42:59 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42c961f6e64sm24428318f8f.27.2025.11.19.04.42.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 04:42:59 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [kirkstone][PATCH] musl: patch CVE-2025-26519
Date: Wed, 19 Nov 2025 13:42:58 +0100
Message-ID: <20251119124258.164074-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Nov 2025 12:43:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226552

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-26519

Pick the patches that are attached to the musl advisory:
https://www.openwall.com/lists/musl/2025/02/13/1

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../musl/musl/CVE-2025-26519-1.patch          | 39 +++++++++++++++++++
 .../musl/musl/CVE-2025-26519-2.patch          | 38 ++++++++++++++++++
 meta/recipes-core/musl/musl_git.bb            |  4 +-
 3 files changed, 80 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-core/musl/musl/CVE-2025-26519-1.patch
 create mode 100644 meta/recipes-core/musl/musl/CVE-2025-26519-2.patch

diff --git a/meta/recipes-core/musl/musl/CVE-2025-26519-1.patch b/meta/recipes-core/musl/musl/CVE-2025-26519-1.patch
new file mode 100644
index 0000000000..a9ea3b4149
--- /dev/null
+++ b/meta/recipes-core/musl/musl/CVE-2025-26519-1.patch
@@ -0,0 +1,39 @@
+From 345d2a053c32f3443dbfdd313f49346ce30b92f8 Mon Sep 17 00:00:00 2001
+From: Rich Felker <dalias@aerifal.cx>
+Date: Wed, 19 Nov 2025 13:23:38 +0100
+Subject: [PATCH] iconv: fix erroneous input validation in EUC-KR decoder
+
+as a result of incorrect bounds checking on the lead byte being
+decoded, certain invalid inputs which should produce an encoding
+error, such as "\xc8\x41", instead produced out-of-bounds loads from
+the ksc table.
+
+in a worst case, the loaded value may not be a valid unicode scalar
+value, in which case, if the output encoding was UTF-8, wctomb would
+return (size_t)-1, causing an overflow in the output pointer and
+remaining buffer size which could clobber memory outside of the output
+buffer.
+
+bug report was submitted in private by Nick Wellnhofer on account of
+potential security implications.
+
+CVE: CVE-2025-26519
+Upstream-Status: Backport [https://git.musl-libc.org/cgit/musl/commit/?id=e5adcd97b5196e29991b524237381a0202a60659]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ src/locale/iconv.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/locale/iconv.c b/src/locale/iconv.c
+index 3047c27b..1fb66bc8 100644
+--- a/src/locale/iconv.c
++++ b/src/locale/iconv.c
+@@ -495,7 +495,7 @@ size_t iconv(iconv_t cd, char **restrict in, size_t *restrict inb, char **restri
+ 			if (c >= 93 || d >= 94) {
+ 				c += (0xa1-0x81);
+ 				d += 0xa1;
+-				if (c >= 93 || c>=0xc6-0x81 && d>0x52)
++				if (c > 0xc6-0x81 || c==0xc6-0x81 && d>0x52)
+ 					goto ilseq;
+ 				if (d-'A'<26) d = d-'A';
+ 				else if (d-'a'<26) d = d-'a'+26;
diff --git a/meta/recipes-core/musl/musl/CVE-2025-26519-2.patch b/meta/recipes-core/musl/musl/CVE-2025-26519-2.patch
new file mode 100644
index 0000000000..82a09af535
--- /dev/null
+++ b/meta/recipes-core/musl/musl/CVE-2025-26519-2.patch
@@ -0,0 +1,38 @@
+From b81230050f6c3348038fe470d260028824b9a9e5 Mon Sep 17 00:00:00 2001
+From: Rich Felker <dalias@aerifal.cx>
+Date: Wed, 19 Nov 2025 13:27:15 +0100
+Subject: [PATCH] iconv: harden UTF-8 output code path against input decoder
+ bugs
+
+the UTF-8 output code was written assuming an invariant that iconv's
+decoders only emit valid Unicode Scalar Values which wctomb can encode
+successfully, thereby always returning a value between 1 and 4.
+
+if this invariant is not satisfied, wctomb returns (size_t)-1, and the
+subsequent adjustments to the output buffer pointer and remaining
+output byte count overflow, moving the output position backwards,
+potentially past the beginning of the buffer, without storing any
+bytes.
+
+CVE: CVE-2025-26519
+Upstream-Status: Backport [https://git.musl-libc.org/cgit/musl/commit/?id=c47ad25ea3b484e10326f933e927c0bc8cded3da]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ src/locale/iconv.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/src/locale/iconv.c b/src/locale/iconv.c
+index 1fb66bc8..fb1d3217 100644
+--- a/src/locale/iconv.c
++++ b/src/locale/iconv.c
+@@ -538,6 +538,10 @@ size_t iconv(iconv_t cd, char **restrict in, size_t *restrict inb, char **restri
+ 				if (*outb < k) goto toobig;
+ 				memcpy(*out, tmp, k);
+ 			} else k = wctomb_utf8(*out, c);
++			/* This failure condition should be unreachable, but
++			 * is included to prevent decoder bugs from translating
++			 * into advancement outside the output buffer range. */
++			if (k>4) goto ilseq;
+ 			*out += k;
+ 			*outb -= k;
+ 			break;
diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index 4b85401360..f24da3b2cb 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -15,7 +15,9 @@ PV = "${BASEVER}+git${SRCPV}"
 SRC_URI = "git://git.musl-libc.org/musl;branch=master \
            file://0001-Make-dynamic-linker-a-relative-symlink-to-libc.patch \
            file://0002-ldso-Use-syslibdir-and-libdir-as-default-pathes-to-l.patch \
-          "
+           file://CVE-2025-26519-1.patch \
+           file://CVE-2025-26519-2.patch \
+           "
 
 S = "${WORKDIR}/git"
 

