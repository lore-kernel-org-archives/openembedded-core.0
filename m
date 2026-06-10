Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9802CD98CF
	for <webhook@archiver.kernel.org>; Wed, 10 Jun 2026 22:55:19 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.33475.1781132117958182744
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Jun 2026 15:55:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=1nHFdi32;
 spf=pass (domain: smile.fr, ip: 209.85.128.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-490b64c8311so80564855e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 10 Jun 2026 15:55:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1781132116; x=1781736916; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UAUXLjNrY67hCRbCkeh+YWOYWi7O75eECnKHHzVHSw8=;
        b=1nHFdi32jxyxRfqkVtbESfaGIeiTdBBFDU8AIoOZfg6dg/ngYU5PYrygpHBNldiCzM
         4ZnUH0uKA02eWkFHBh7JTePI9g2Gj9/qSFs9FBLHGjyTST7BLKANqHaW0b9FTlVCkFBc
         KCMezpVLKqgQQ6/oDjijUD/QRltaT7L8nSoR4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781132116; x=1781736916;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UAUXLjNrY67hCRbCkeh+YWOYWi7O75eECnKHHzVHSw8=;
        b=KZ0USy1q9R/10mRkDaGE+IvdSd6oku4Q2lGADIKMuUxRjDGVAqQuUdX5xjyf266M6s
         TyfFflu4329JyrwUJYqKJUFv6N2HWl1ERSwvuU5GxvlJbTyYeUyoo/QiWO8jAZTekQ6/
         VOteUHliCEsCwPALDjUoiecyUwsEMavrKEfVd3SNQjOOrZI9gr/tUkDOxRLLIn+C+naA
         6l0c9Bh1B89in8LYn+n36x2jmF047Xtzka8ZcT2tTlTiGIOHvwKsk3RQPUDtH8MD1Kdf
         TDiO+Ua9z+8M0JGQiM1ZDWBtJZjE1qFGqwvRMkne9eGQiFNGePu32kqM46lqrYbHLMmY
         2M0Q==
X-Gm-Message-State: AOJu0YzXGH7PBZN6OPYbtHbiEprJXm7ha53mLNipX5hjZyLwgwFIiCYG
	cTtcLtvDKX0XZzWLsb/eFyRF5ljL/O6TGYSF9xzeVFu+66ZgxZCJYyOOxmv8p40naVz4q0rL7X5
	QlZ+q
X-Gm-Gg: Acq92OFzbnrKuDrNpfI3erKoTSeYAcNomSne4dke1RzgZ1CjofGwFDTPApKrWfCuPIe
	AlWk63eW9WsHm2bbFlZ018aF4vQHX70yrx2qTQHhqoxPEA0H7pu83Fo8ao/JdHwvuvMe3znqSzl
	sV1XR31F8Coutftb7DVJ3g+tMAqLPWPooke3eBKbOLoZSIjBbYsCxXjhhIqOi2Z8/cjvzPP2EDG
	WlqXsYpzqKoVobyqR1Jy7W3JOZFFbDaIni8hcaMT62J1xmJm8rgz4fj0OL097LjR5boN3j78sbi
	wrbsEKKvD2KXXwFOVBss3N2zUPnkkN3oF1RcKn7u8E42CMGMVJQ/1hc4vkRjpX4XnDM7oajcnxZ
	8xEdMyKf9kq+km12kImv2aKiEPSQie3khbe6l3swGlSSAs4SdRnkQvGiBOGyP5PtR0MCDnN2x1t
	0lJSOGjqBCMhtmix69wa7ewQyGtd/Ag02FOuasXPaz76J0vnlGJxMSui+pEULjOUICoFHvM5zBQ
	cbiz7l28cYBrFVcqLCt0PuLwDM3kaMEt9TgNNM=
X-Received: by 2002:a05:600c:83c3:b0:490:b355:9c70 with SMTP id 5b1f17b1804b1-490c25a5970mr456676775e9.11.1781132116310;
        Wed, 10 Jun 2026 15:55:16 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00bb749f54eeb85d7b.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:bb74:9f54:eeb8:5d7b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f344148sm71599304f8f.19.2026.06.10.15.55.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 15:55:15 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 01/21] libpcap: fix error message on 32-bit integer overflow
Date: Thu, 11 Jun 2026 00:54:52 +0200
Message-ID: <727903962601708b2f5a2f18a57017627e83fd46.1781132051.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1781132051.git.yoann.congal@smile.fr>
References: <cover.1781132051.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Jun 2026 22:55:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238397

From: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>

Upstream fix: https://github.com/the-tcpdump-group/libpcap/commit/0d8bd2f67c16637c4d25d81fb24cdcebc35afce6

Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
(cherry picked from commit e5a1ba482ffcccd04fc3efc7a3ab2bc8a4155f15)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 ...ssages-about-32-bit-integer-overflow.patch | 158 ++++++++++++++++++
 .../libpcap/libpcap_1.10.6.bb                 |   4 +-
 2 files changed, 161 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-connectivity/libpcap/libpcap/0001-Fix-error-messages-about-32-bit-integer-overflow.patch

diff --git a/meta/recipes-connectivity/libpcap/libpcap/0001-Fix-error-messages-about-32-bit-integer-overflow.patch b/meta/recipes-connectivity/libpcap/libpcap/0001-Fix-error-messages-about-32-bit-integer-overflow.patch
new file mode 100644
index 00000000000..4f2af537626
--- /dev/null
+++ b/meta/recipes-connectivity/libpcap/libpcap/0001-Fix-error-messages-about-32-bit-integer-overflow.patch
@@ -0,0 +1,158 @@
+From 217c3a07c7db694324b5c61eaaa07774735e2d7d Mon Sep 17 00:00:00 2001
+From: Denis Ovsienko <denis@ovsienko.info>
+Date: Thu, 9 Oct 2025 20:51:45 +0100
+Subject: [PATCH] Fix error messages about 32-bit integer overflow.
+
+Since commit a5cac25 stoulen() takes a pointer to a string and a
+length of the string and uses the length to report a problem about the
+string.  However, by that time it has already modified the length, so
+the error message does not match the input:
+
+$ filtertest RAW '123456789012345'
+filtertest: number 1234 overflows 32 bits
+$ filtertest RAW '12345678901234567890'
+filtertest: number 123456789 overflows 32 bits
+$ filtertest RAW '123456789012345678901234567890'
+filtertest: number 1234567890123456789 overflows 32 bits
+$ filtertest RAW '0123456701234'
+filtertest: number  overflows 32 bits
+$ filtertest RAW '0x100000000'
+filtertest: number  overflows 32 bits
+
+Consequently, if more than one number in the filter expression is out of
+range, it can be not immediately obvious which one it is:
+
+$ filtertest RAW '4294967296 != 4294967297'
+filtertest: number  overflows 32 bits
+
+To fix this, in stoulen() keep a copy of the original string length and
+use it for the error reporting.  Ibid., factor the format string out and
+show the base in the message.  Simplify the forward declaration.  Add
+two comments to outline the clash space between certain MAC-48 addresses
+and certain octal integers.  Document this syntax peculiarity in the man
+page and add a few basic reject tests.
+
+Upstream-Status: Backport [https://github.com/the-tcpdump-group/libpcap/commit/0d8bd2f67c16637c4d25d81fb24cdcebc35afce6]
+Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
+---
+ pcap-filter.manmisc.in |  9 ++++++++-
+ scanner.l              | 33 ++++++++++++++++++++++++---------
+ 2 files changed, 32 insertions(+), 10 deletions(-)
+
+diff --git a/pcap-filter.manmisc.in b/pcap-filter.manmisc.in
+index bfb692ff..929d668d 100644
+--- a/pcap-filter.manmisc.in
++++ b/pcap-filter.manmisc.in
+@@ -18,7 +18,7 @@
+ .\" WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF
+ .\" MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE.
+ .\"
+-.TH PCAP-FILTER @MAN_MISC_INFO@ "13 June 2023"
++.TH PCAP-FILTER @MAN_MISC_INFO@ "9 October 2025"
+ .SH NAME
+ pcap-filter \- packet filter syntax
+ .br
+@@ -886,6 +886,13 @@ integer constants (expressed in standard C syntax), the normal binary operators
+ a length operator, and special packet data
+ accessors.  Note that all comparisons are unsigned, so that, for example,
+ 0x80000000 and 0xffffffff are > 0.
++.LP
++Note that 32-bit octal integer constants in the [010000000000 .. 037777777777]
++interval, which includes 75% of all 32-bit integers, are interpreted as MAC-48
++addresses when prepended with a single zero (e.g., 012345670123 means
++01:23:45:67:01:23).  To disambiguate the expression, prepend such an octal
++number with more zeroes (0012345670123) or represent the same value using a
++decimal (1402433619) or hexadecimal (0x53977053) number.
+ .IP
+ The
+ .B %
+diff --git a/scanner.l b/scanner.l
+index 57779497..49aaeab2 100644
+--- a/scanner.l
++++ b/scanner.l
+@@ -48,8 +48,8 @@ typedef enum {
+ 	STOULEN_ERROR
+ } stoulen_ret;
+ 
+-stoulen_ret stoulen(const char *string, size_t stringlen, bpf_u_int32 *val,
+-    compiler_state_t *cstate);
++stoulen_ret stoulen(const char *, const size_t, bpf_u_int32 *,
++    compiler_state_t *);
+ }
+ 
+ /*
+@@ -244,6 +244,12 @@ V6004		::{N}\.{N}\.{N}\.{N}
+ 
+ V6		({V680}|{V670}|{V671}|{V672}|{V673}|{V674}|{V675}|{V676}|{V677}|{V660}|{V661}|{V662}|{V663}|{V664}|{V665}|{V666}|{V650}|{V651}|{V652}|{V653}|{V654}|{V655}|{V640}|{V641}|{V642}|{V643}|{V644}|{V630}|{V631}|{V632}|{V633}|{V620}|{V621}|{V622}|{V610}|{V611}|{V600}|{V6604}|{V6504}|{V6514}|{V6524}|{V6534}|{V6544}|{V6554}|{V6404}|{V6414}|{V6424}|{V6434}|{V6444}|{V6304}|{V6314}|{V6324}|{V6334}|{V6204}|{V6214}|{V6224}|{V6104}|{V6114}|{V6004})
+ 
++	/*
++	 * In the regexp below the "{B2}{3}" form matches all octal numbers in
++	 * the [010000000000 .. 077777777777] interval that use a single leading
++	 * zero.  The interval includes both integer values that fit into 32
++	 * bits and values that don't.
++	 */
+ MAC		({B}:{B}:{B}:{B}:{B}:{B}|{B}\-{B}\-{B}\-{B}\-{B}\-{B}|{B}\.{B}\.{B}\.{B}\.{B}\.{B}|{B2}\.{B2}\.{B2}|{B2}{3})
+ 
+ 
+@@ -486,13 +492,16 @@ tcp-cwr			{ yylval->h = 0x80; return NUM; }
+  */
+ DIAG_ON_FLEX
+ 
++#define FORMAT_OVERFLOWS_32_BITS "%s number %.*s overflows 32 bits"
++
+ stoulen_ret
+-stoulen(const char *string, size_t string_len, bpf_u_int32 *val,
++stoulen(const char *string, const size_t orig_string_len, bpf_u_int32 *val,
+     compiler_state_t *cstate)
+ {
+ 	bpf_u_int32 n = 0;
+ 	unsigned int digit;
+ 	const char *s = string;
++	size_t string_len = orig_string_len;
+ 
+ 	/*
+ 	 * string is guaranteed either to be a string of decimal digits
+@@ -538,8 +547,8 @@ stoulen(const char *string, size_t string_len, bpf_u_int32 *val,
+ 					 * in 32 bits.
+ 					 */
+ 					bpf_set_error(cstate,
+-					    "number %.*s overflows 32 bits",
+-					   (int)string_len, string);
++					    FORMAT_OVERFLOWS_32_BITS,
++					    "hexadecimal", (int)orig_string_len, string);
+ 					return STOULEN_ERROR;
+ 				}
+ 				n = (n << 4) + digit;
+@@ -573,10 +582,16 @@ stoulen(const char *string, size_t string_len, bpf_u_int32 *val,
+ 					 * number, and are about to add
+ 					 * 3 more; that won't fit in
+ 					 * 32 bits.
++					 *
++					 * This code path depends on using more
++					 * than one leading zero for all values
++					 * in the [040000000000 .. 077777777777]
++					 * interval, otherwise the MAC regexp
++					 * above consumes the string first.
+ 					 */
+ 					bpf_set_error(cstate,
+-					    "number %.*s overflows 32 bits",
+-					   (int)string_len, string);
++					    FORMAT_OVERFLOWS_32_BITS,
++					    "octal", (int)orig_string_len, string);
+ 					return STOULEN_ERROR;
+ 				}
+ 				n = (n << 3) + digit;
+@@ -609,8 +624,8 @@ stoulen(const char *string, size_t string_len, bpf_u_int32 *val,
+ 				 * number that won't fit in 32 bits.
+ 				 */
+ 				bpf_set_error(cstate,
+-				    "number %.*s overflows 32 bits",
+-				   (int)string_len, string);
++				    FORMAT_OVERFLOWS_32_BITS,
++				    "decimal", (int)orig_string_len, string);
+ 				return STOULEN_ERROR;
+ 			}
+ 			n = (n * 10) + digit;
+-- 
+2.34.1
+
diff --git a/meta/recipes-connectivity/libpcap/libpcap_1.10.6.bb b/meta/recipes-connectivity/libpcap/libpcap_1.10.6.bb
index 9b259396f06..d381a4eb2fe 100644
--- a/meta/recipes-connectivity/libpcap/libpcap_1.10.6.bb
+++ b/meta/recipes-connectivity/libpcap/libpcap_1.10.6.bb
@@ -10,7 +10,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=5eb289217c160e2920d2e35bddc36453 \
                     file://pcap.h;beginline=1;endline=32;md5=39af3510e011f34b8872f120b1dc31d2"
 DEPENDS = "flex-native bison-native"
 
-SRC_URI = "https://www.tcpdump.org/release/${BP}.tar.xz"
+SRC_URI = "https://www.tcpdump.org/release/${BP}.tar.xz \
+	   file://0001-Fix-error-messages-about-32-bit-integer-overflow.patch \
+          "
 SRC_URI[sha256sum] = "ec97d1206bdd19cb6bdd043eaa9f0037aa732262ec68e070fd7c7b5f834d5dfc"
 
 inherit autotools binconfig-disabled pkgconfig

