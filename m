Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34804CF58F0
	for <webhook@archiver.kernel.org>; Wed, 19 Nov 2025 20:42:41 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17329.1763584952251443288
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Nov 2025 12:42:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=TmUUmu93;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.173, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-7aace33b75bso117474b3a.1
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Nov 2025 12:42:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1763584951; x=1764189751; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ownsksxpZnuTfIYUBYhKalPDSG8JKvd0nlkl5oiEjU0=;
        b=TmUUmu93xZ7b1kS7lgtYtziAEbqnwXpq9cXj74hO+I31D/1l89whpfE/OBWlPSbiLL
         LykPkr0m+Ux0RUiw3EO4rlhoflv0kvaiHPL9z6Ie55HqmGl2HYaWLnoWGg9CdHiA1fVa
         da2rdoUkrr0liQ3Xa5eR93o7qv6rReC3EQrxt3kYq+/jg7tgUzbbTqa5w4IkM9ifeimN
         Z8RvbkbFAWlhm76f3hGFec4jZPcI8czW4XXmZqjCDFEXhrZOxuklKEI6zlDh0Kb+uxoi
         5gItXnr3jfJgQ/VXGMX58ZEP4k9hb772BHupZAvdhIiE4kUE5zPCsE7+ryicwP7d/mTE
         LkiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763584951; x=1764189751;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ownsksxpZnuTfIYUBYhKalPDSG8JKvd0nlkl5oiEjU0=;
        b=bauUiyTgunwqAk1jlqp390GcPvU5SUstxzDQzktTfYTeJD4NVStZegKtSeWOfPrpWw
         6I5tmT0nvYtpw5Wni+YltP2GWgFmU3oizGA9HigwtB9xsNHD+S0Zv313SO27ZR4bZAMy
         9FmQLggAJR5CBeHjnzNZPuQ5/Md2ZWhDPPcizlbYIOHNSQQBJIrMwemDP5/wNo1kl46x
         bOxQKYJzPVy8wY6A9bsnZslKpGNbWvH1vtnM2ZKlEfTtx/6zX4f2SUhIcN9EAt1j2sI7
         vwIJEzGu3rWH7B+XdmLBZSIOspMPRktNZurU5cwvlOsNzItZ+m4K30y9/6trAzanx1Kl
         LHGQ==
X-Gm-Message-State: AOJu0YzB64xahMTTTaI52eGOY6DWbJ7/6Ama8CUjRLEPHcdmZZsr24uo
	6cB1vQ2tYTYtwrclKsgIHIBaIPL+wW+Sc35AQ1Kcl2w6xuFEgbhI79AhTxVtNcSPMxnjybMiTkz
	18ogf
X-Gm-Gg: ASbGncvZdv6rAyzIUvlNanclsSegRcBEi5pqlg656AS0HKUU1ctcLzV8RixUrRT5lPC
	qZXa+FAQN+ZVX2TrofJaYezsUcOKcCMkht/OcDphJp+D0lmhYnOhCzKjo5fQ9JY+gWcwQK4kHRw
	4CboipYVaKGZ/LWMSzjEtPQHyGX0tGX83UG5h9uW4+9BYsiSO3bp6SUFEog3+v3zWf7zW046A+3
	ZNqRNxcnvurBuUy2WFKxSG5VRjbr8SGimoNj9KGwUxvBGDl1gSAgJYzYsyIXZs00YUVvN+evn/k
	Y2ADS3RGjWH4ur70mWhTqiiZrNpiswV92p7wgc1yc33CGwJNMXy/rFnHvaTo4La88DtLbWKfiH6
	7OhcNlt4uJ2rUdELQTPAhXIJbO7ih+uvcuh2LDBzT6z3OI6zPWyTP/aM3JOJ1KYIJ8Jl+wY2cfk
	+E+w==
X-Google-Smtp-Source: AGHT+IH21a4u6Zn9qGUX0UGd6tGRwkIUZjIIQ5ouLyPfpmNkdm9/OTL98ZHO+NoWJAiOj8rsBjRFXQ==
X-Received: by 2002:a05:6a00:14d5:b0:7ab:21ca:a3be with SMTP id d2e1a72fcca58-7c3ef179960mr614974b3a.12.1763584951439;
        Wed, 19 Nov 2025 12:42:31 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:95e8:2651:d6f9:404e])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7c3ecf7d5adsm269866b3a.11.2025.11.19.12.42.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 12:42:31 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 6/7] musl: patch CVE-2025-26519
Date: Wed, 19 Nov 2025 12:42:14 -0800
Message-ID: <e1c1b4b5100e08b63a2e6e5ff608f79e7b202649.1763584791.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1763584791.git.steve@sakoman.com>
References: <cover.1763584791.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Nov 2025 20:42:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226596

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
 
-- 
2.43.0


