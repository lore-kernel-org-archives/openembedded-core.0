Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA641CFD2F9
	for <webhook@archiver.kernel.org>; Sat, 22 Nov 2025 22:14:53 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2710.1763849690436639751
 for <openembedded-core@lists.openembedded.org>;
 Sat, 22 Nov 2025 14:14:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=MUegMJYH;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.54, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-343514c7854so1685360a91.1
        for <openembedded-core@lists.openembedded.org>; Sat, 22 Nov 2025 14:14:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1763849690; x=1764454490; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kby8h68VDHTnfgbW6dNePQL/nZ1eDGmSCKDpfspeX3A=;
        b=MUegMJYH5HOwmVO+j1t1yU3mXOBHJjR+eAl9rLxhMRFH0PKa/FE3ijRxvI9McD3G39
         jHW6Tgga0DUxhaS/qlgU1a5y3jGBPU9QKO+GaQ8JXE+DMSK9U5gG2G3q5VgKS6r3FHOf
         GcJcghPXZKEJJ1gl1qfbYUf0jxJhOswhq6gV8O1ZMBeSbot80s0HzaWF0PcEY3FzxoLS
         kQT/ffE0sJrkg7kC3YiRM0frV20rZZLMykrI93hnornIvnLJBXTV40QlZnIwu6Zd5B+p
         hijkFJ1GODLMTeAVL01lHeJ6N6k7SqJY1bzVH+k5sstnUisYKq7zB2Z9l7wshRRQc6yK
         0xng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763849690; x=1764454490;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kby8h68VDHTnfgbW6dNePQL/nZ1eDGmSCKDpfspeX3A=;
        b=OLKOCsz/N2FhVDmRlgL4y2XwDwqnYU2dlZevPlCqy6hgoQJVed96uvaDzezLn9ovnv
         rCPAF9920YO8qCMY3Vf3gS6usXwUu6Tr9NTnQVtaRzMtj07CaSB+au7CT4Vg/tr4qLhw
         tw0OjPNez8fLxx8K8zy2I/rVvRZQy+DgIncBg97tElWsIEMlyTM5oQfn5zx3kKzMto64
         dsb2QupwXwOs5Vx7fimQBtansWZYvCDRXCJCriNwjDss7NgHJRL4PxAN3NJYbxqpbwit
         vVnX+XV9/QX7TiVuY6F7O7Sk22HoxPIEv8R3UD8ElLkIwyHRBCUGlXvILdWE7VPvZX/q
         0Q+Q==
X-Gm-Message-State: AOJu0YxZstVRSZl34kGsX8uAf6o3UnqKzsCiULQmfN9a9jyCmhHOzuIo
	sZEk9oD3AiokponToJ8QRGsIfrSMFNhrxOGZ2hbcGK8RBCW7ILJ+CByrsnrqsokBWN3RaQAs4AX
	5CxQE
X-Gm-Gg: ASbGncvQgHws/4/nV5jVQcF/qZ0Kp4Z0EGaJIuJuKS1M6pBpjk3Qx1HbAIZ9sEAetNy
	vQ+weym3gQ7mHR/N8RikNCUmk3+agcNjbaOva1vUTIxQiyzSzFe1DtIg6g/Q9jMNUKcsau2Mbq2
	T+fgBc6ePyepUkitUcN0xeAJIPHzQuRTXjQ58D+Z39fdI7/2yVPRbCgQ6gOIXpOlNRnENzYzvPv
	rFZGmBZ6D+yhsgmCpz0aXu8wIFRkxmYeeTQcY0NfWIRflGMSeqwjocKm9FFoAllelD1KgdIvIEB
	KJlKuG+lbpJ43ZMHHCvpvNO2JRjKBj2YLz9M4WC4FbRSGgHk/k/MAdt5HgNSExfgxlexqA3lj7F
	QNK5C3hFMhfc7/hhe1WujtSe5pJb0kER2Fy+BIdbfrS9TAKXB0xvEe0LhA/i2zbsNcgtRV8PoBy
	MvMg==
X-Google-Smtp-Source: AGHT+IGhroyGy/9Zn9Ot5tu95e4NZjNV474nDMhxBCAjZlU/FjAxW22LGZXHho791+CpFbuQwZ2rbA==
X-Received: by 2002:a17:90a:e7c7:b0:340:6b6f:4bbf with SMTP id 98e67ed59e1d1-347298dacdcmr11888055a91.18.1763849689652;
        Sat, 22 Nov 2025 14:14:49 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:a812:a9e4:3291:bb61])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-345af26d8b1sm7158274a91.3.2025.11.22.14.14.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Nov 2025 14:14:49 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 09/21] musl: patch CVE-2025-26519
Date: Sat, 22 Nov 2025 14:14:15 -0800
Message-ID: <bbdd7d54b070f62f13967df8a13f5f14f2c36120.1763849517.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1763849517.git.steve@sakoman.com>
References: <cover.1763849517.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 22 Nov 2025 22:14:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226707

From: Gyorgy Sarvari <skandigraun@gmail.com>

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-26519

Pick the patches that are attached to the musl advisory:
https://www.openwall.com/lists/musl/2025/02/13/1

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../musl/musl/CVE-2025-26519-1.patch          | 39 +++++++++++++++++++
 .../musl/musl/CVE-2025-26519-2.patch          | 38 ++++++++++++++++++
 meta/recipes-core/musl/musl_git.bb            |  4 +-
 3 files changed, 80 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-core/musl/musl/CVE-2025-26519-1.patch
 create mode 100644 meta/recipes-core/musl/musl/CVE-2025-26519-2.patch

diff --git a/meta/recipes-core/musl/musl/CVE-2025-26519-1.patch b/meta/recipes-core/musl/musl/CVE-2025-26519-1.patch
new file mode 100644
index 0000000000..5583c5f6cc
--- /dev/null
+++ b/meta/recipes-core/musl/musl/CVE-2025-26519-1.patch
@@ -0,0 +1,39 @@
+From 8ebb2a68dfac02e7a83885587a9a5a203147ebbe Mon Sep 17 00:00:00 2001
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
index 0000000000..7d193ab241
--- /dev/null
+++ b/meta/recipes-core/musl/musl/CVE-2025-26519-2.patch
@@ -0,0 +1,38 @@
+From 7e7052e17e900194a588d337ff4a8e646133afed Mon Sep 17 00:00:00 2001
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
index 324269a968..bc516b6183 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -14,7 +14,9 @@ SRC_URI = "git://git.etalabs.net/git/musl;branch=master;protocol=https \
            file://0001-Make-dynamic-linker-a-relative-symlink-to-libc.patch \
            file://0002-ldso-Use-syslibdir-and-libdir-as-default-pathes-to-l.patch \
            file://0003-elf.h-add-typedefs-for-Elf64_Relr-and-Elf32_Relr.patch \
-          "
+           file://CVE-2025-26519-1.patch \
+           file://CVE-2025-26519-2.patch \
+           "
 
 S = "${WORKDIR}/git"
 
-- 
2.43.0


