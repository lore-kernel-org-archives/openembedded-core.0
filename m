Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0820D2ED19
	for <webhook@archiver.kernel.org>; Tue, 20 Jan 2026 12:09:24 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5043.1768910960333601316
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Jan 2026 04:09:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=bja96wVh;
 spf=pass (domain: smile.fr, ip: 209.85.221.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-42fbc305914so4323129f8f.0
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 04:09:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1768910958; x=1769515758; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4Fvnn3urU4VsKr83M1pOapn8MpGTS0SOQX9xj4FPrtY=;
        b=bja96wVhuVnRnkl0SSYxGR8ll0gz5FMfYhAr5pj7JiajC4M9G/lVWz1UNgtl7H48YI
         pybUlx8mPbPz6gDDGcvQ+0FfOq/1QD+kzz3lfhtQON6b/0CLkIfeOFXx0mFO5Rp2yOCn
         G99X5k4EVO9nTY77mRWnqskMNsynTGBYjw2wU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768910958; x=1769515758;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4Fvnn3urU4VsKr83M1pOapn8MpGTS0SOQX9xj4FPrtY=;
        b=JMuA8ZYo54a7SjjW7Pt2P8dE6KaIpUvJrORN3tuaE2pbFp+42cQzI0E8ITsewazEpp
         e2YrdUSjYs5RpDZ9Z8lXvxHMzchfMF4cjC6fGEXktZETVQ2T3B9L8xS9OcERChJf8wrC
         s57CkB4Gm4rjURXsd8WCAtVtaNjlOSL1pPQarpHB/UeBObXsAp89qVjmH++yRxDVaMbD
         WAFv8BfEd/TSo9FtbLfvEE8QDArTwhLvNlUX3GNl5pnzXEvDYMSH839iENtxmTaP4ba4
         wO0FJhFq6y+oc1P56rkXoaUBiaq++ibHRGBezhbfVaP2YeUoRBsHSj6G5oRR70cruGrK
         bhlw==
X-Gm-Message-State: AOJu0YxqXf2U/JtITq4889vCtCNIsk11EHjdKb13d3jZGnmZJ45OH5r7
	hiDgUQ5cjrV/nT5UVL2YYf6Ctmj5hnvsla2DTi/SwthQjnTdFv82nhjieqxCk62HCVW41F7aHpN
	07eaH
X-Gm-Gg: AZuq6aKv193AJKLtipQvWV2vfeambGkhzUHM9mcozeu+/nYAMHXetcFx0lJ67Ct3hWq
	0v9ctJwM1rAqcE6FV95nfytxoadncobuIbKbDIp5clXdQnJJfnhIQTqVj2BQGoZnUiTxo+8G0B9
	mAzZI7Pdf7w0kXkrYffDJT8EH8ncGgmJt0o4NTKVLVGd+4LR8/BvO6CUCvq5L8g4SIlGnUK8Vm5
	HnmMqYZQlosf9ae+kDIdYdVSwuNhlnINq/18U0VzXLyx7Wyrt5Fngu1LTvUyTKgKgoFMusGwks/
	wLBjtd1uUJDrP3zvWFzn7glMU1+bih1YQEqsXDIrCeQ50nc9Hji49FgpcxV+6tSJVwBzlxtw/vq
	CI7KQYTZ/LiXd9LroJAtjxRSQQW5y5ne/EfJb7nI7DxCy9JSUXs3aoW0I7+O6KDfCK0w+5h59SG
	bRD9i8PIUyRjrO/SQZNvkejNFx42yZPt/afY+qepQs7siCwW2x8HSHxV7kkEQy77EEvEcrBq3Fp
	TSgsjJR3KnEasQEcWS6R4VCoWtjDsW2
X-Received: by 2002:a05:6000:2505:b0:42b:4267:83e9 with SMTP id ffacd0b85a97d-4358fed11efmr2231777f8f.2.1768910957957;
        Tue, 20 Jan 2026 04:09:17 -0800 (PST)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43569927007sm28916097f8f.16.2026.01.20.04.09.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 04:09:17 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 09/22] libpcap: patch CVE-2025-11961
Date: Tue, 20 Jan 2026 13:08:23 +0100
Message-ID: <924b68cba6a3decd0c8a477bc1828335551d265d.1768910519.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1768910519.git.yoann.congal@smile.fr>
References: <cover.1768910519.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 12:09:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229687

From: Peter Marko <peter.marko@siemens.com>

Pick patch per [1].
Also pick additional preparation patch to apply it cleanly.

[1] https://nvd.nist.gov/vuln/detail/CVE-2025-11961

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libpcap/libpcap/CVE-2025-11961-01.patch   |  38 ++
 .../libpcap/libpcap/CVE-2025-11961-02.patch   | 433 ++++++++++++++++++
 .../libpcap/libpcap_1.10.4.bb                 |   2 +
 3 files changed, 473 insertions(+)
 create mode 100644 meta/recipes-connectivity/libpcap/libpcap/CVE-2025-11961-01.patch
 create mode 100644 meta/recipes-connectivity/libpcap/libpcap/CVE-2025-11961-02.patch

diff --git a/meta/recipes-connectivity/libpcap/libpcap/CVE-2025-11961-01.patch b/meta/recipes-connectivity/libpcap/libpcap/CVE-2025-11961-01.patch
new file mode 100644
index 0000000000..73c3ab3f5c
--- /dev/null
+++ b/meta/recipes-connectivity/libpcap/libpcap/CVE-2025-11961-01.patch
@@ -0,0 +1,38 @@
+From 7224be0fe2f4beb916b7b69141f478facd0f0634 Mon Sep 17 00:00:00 2001
+From: Denis Ovsienko <denis@ovsienko.info>
+Date: Sat, 27 Dec 2025 21:36:11 +0000
+Subject: [PATCH] Rename one of the xdtoi() copies to simplify backporting.
+
+CVE: CVE-2025-11961
+Upstream-Status: Backport [https://github.com/the-tcpdump-group/libpcap/commit/7224be0fe2f4beb916b7b69141f478facd0f0634]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ nametoaddr.c | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/nametoaddr.c b/nametoaddr.c
+index dc75495c..bdaacbf1 100644
+--- a/nametoaddr.c
++++ b/nametoaddr.c
+@@ -646,7 +646,7 @@ pcap_nametollc(const char *s)
+ 
+ /* Hex digit to 8-bit unsigned integer. */
+ static inline u_char
+-xdtoi(u_char c)
++pcapint_xdtoi(u_char c)
+ {
+ 	if (c >= '0' && c <= '9')
+ 		return (u_char)(c - '0');
+@@ -728,10 +728,10 @@ pcap_ether_aton(const char *s)
+ 	while (*s) {
+ 		if (*s == ':' || *s == '.' || *s == '-')
+ 			s += 1;
+-		d = xdtoi(*s++);
++		d = pcapint_xdtoi(*s++);
+ 		if (PCAP_ISXDIGIT(*s)) {
+ 			d <<= 4;
+-			d |= xdtoi(*s++);
++			d |= pcapint_xdtoi(*s++);
+ 		}
+ 		*ep++ = d;
+ 	}
diff --git a/meta/recipes-connectivity/libpcap/libpcap/CVE-2025-11961-02.patch b/meta/recipes-connectivity/libpcap/libpcap/CVE-2025-11961-02.patch
new file mode 100644
index 0000000000..2dca7908ef
--- /dev/null
+++ b/meta/recipes-connectivity/libpcap/libpcap/CVE-2025-11961-02.patch
@@ -0,0 +1,433 @@
+From b2d2f9a9a0581c40780bde509f7cc715920f1c02 Mon Sep 17 00:00:00 2001
+From: Denis Ovsienko <denis@ovsienko.info>
+Date: Fri, 19 Dec 2025 17:31:13 +0000
+Subject: [PATCH] CVE-2025-11961: Fix OOBR and OOBW in pcap_ether_aton().
+
+pcap_ether_aton() has for a long time required its string argument to be
+a well-formed MAC-48 address, which is always the case when the argument
+comes from other libpcap code, so the function has never validated the
+input and used a simple loop to parse any of the three common MAC-48
+address formats.  However, the function has also been a part of the
+public API, so calling it directly with a malformed address can cause
+the loop to read beyond the end of the input string and/or to write
+beyond the end of the allocated output buffer.
+
+To handle invalid input more appropriately, replace the simple loop with
+new functions and require the input to match a supported address format.
+
+This problem was reported by Jin Wei, Kunwei Qian and Ping Chen.
+
+(backported from commit dd08e53e9380e217ae7c7768da9cc3d7bf37bf83)
+
+CVE: CVE-2025-11961
+Upstream-Status: Backport [https://github.com/the-tcpdump-group/libpcap/commit/b2d2f9a9a0581c40780bde509f7cc715920f1c02]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ gencode.c    |   5 +
+ nametoaddr.c | 367 +++++++++++++++++++++++++++++++++++++++++++++++----
+ 2 files changed, 349 insertions(+), 23 deletions(-)
+
+diff --git a/gencode.c b/gencode.c
+index 3ddd15f8..76fb2d82 100644
+--- a/gencode.c
++++ b/gencode.c
+@@ -7228,6 +7228,11 @@ gen_ecode(compiler_state_t *cstate, const char *s, struct qual q)
+ 		return (NULL);
+ 
+ 	if ((q.addr == Q_HOST || q.addr == Q_DEFAULT) && q.proto == Q_LINK) {
++		/*
++		 * Because the lexer guards the input string format, in this
++		 * context the function returns NULL iff the implicit malloc()
++		 * has failed.
++		 */
+ 		cstate->e = pcap_ether_aton(s);
+ 		if (cstate->e == NULL)
+ 			bpf_error(cstate, "malloc");
+diff --git a/nametoaddr.c b/nametoaddr.c
+index f9fcd288..f50d0da5 100644
+--- a/nametoaddr.c
++++ b/nametoaddr.c
+@@ -703,39 +703,360 @@ __pcap_atodn(const char *s, bpf_u_int32 *addr)
+ 	return(32);
+ }
+ 
++// Man page: "xxxxxxxxxxxx", regexp: "^[0-9a-fA-F]{12}$".
++static u_char
++pcapint_atomac48_xxxxxxxxxxxx(const char *s, uint8_t *addr)
++{
++	if (strlen(s) == 12 &&
++	    PCAP_ISXDIGIT(s[0]) &&
++	    PCAP_ISXDIGIT(s[1]) &&
++	    PCAP_ISXDIGIT(s[2]) &&
++	    PCAP_ISXDIGIT(s[3]) &&
++	    PCAP_ISXDIGIT(s[4]) &&
++	    PCAP_ISXDIGIT(s[5]) &&
++	    PCAP_ISXDIGIT(s[6]) &&
++	    PCAP_ISXDIGIT(s[7]) &&
++	    PCAP_ISXDIGIT(s[8]) &&
++	    PCAP_ISXDIGIT(s[9]) &&
++	    PCAP_ISXDIGIT(s[10]) &&
++	    PCAP_ISXDIGIT(s[11])) {
++		addr[0] = pcapint_xdtoi(s[0]) << 4 | pcapint_xdtoi(s[1]);
++		addr[1] = pcapint_xdtoi(s[2]) << 4 | pcapint_xdtoi(s[3]);
++		addr[2] = pcapint_xdtoi(s[4]) << 4 | pcapint_xdtoi(s[5]);
++		addr[3] = pcapint_xdtoi(s[6]) << 4 | pcapint_xdtoi(s[7]);
++		addr[4] = pcapint_xdtoi(s[8]) << 4 | pcapint_xdtoi(s[9]);
++		addr[5] = pcapint_xdtoi(s[10]) << 4 | pcapint_xdtoi(s[11]);
++		return 1;
++	}
++	return 0;
++}
++
++// Man page: "xxxx.xxxx.xxxx", regexp: "^[0-9a-fA-F]{4}(\.[0-9a-fA-F]{4}){2}$".
++static u_char
++pcapint_atomac48_xxxx_3_times(const char *s, uint8_t *addr)
++{
++	const char sep = '.';
++	if (strlen(s) == 14 &&
++	    PCAP_ISXDIGIT(s[0]) &&
++	    PCAP_ISXDIGIT(s[1]) &&
++	    PCAP_ISXDIGIT(s[2]) &&
++	    PCAP_ISXDIGIT(s[3]) &&
++	    s[4] == sep &&
++	    PCAP_ISXDIGIT(s[5]) &&
++	    PCAP_ISXDIGIT(s[6]) &&
++	    PCAP_ISXDIGIT(s[7]) &&
++	    PCAP_ISXDIGIT(s[8]) &&
++	    s[9] == sep &&
++	    PCAP_ISXDIGIT(s[10]) &&
++	    PCAP_ISXDIGIT(s[11]) &&
++	    PCAP_ISXDIGIT(s[12]) &&
++	    PCAP_ISXDIGIT(s[13])) {
++		addr[0] = pcapint_xdtoi(s[0]) << 4 | pcapint_xdtoi(s[1]);
++		addr[1] = pcapint_xdtoi(s[2]) << 4 | pcapint_xdtoi(s[3]);
++		addr[2] = pcapint_xdtoi(s[5]) << 4 | pcapint_xdtoi(s[6]);
++		addr[3] = pcapint_xdtoi(s[7]) << 4 | pcapint_xdtoi(s[8]);
++		addr[4] = pcapint_xdtoi(s[10]) << 4 | pcapint_xdtoi(s[11]);
++		addr[5] = pcapint_xdtoi(s[12]) << 4 | pcapint_xdtoi(s[13]);
++		return 1;
++	}
++	return 0;
++}
++
+ /*
+- * Convert 's', which can have the one of the forms:
++ * Man page: "xx:xx:xx:xx:xx:xx", regexp: "^[0-9a-fA-F]{1,2}(:[0-9a-fA-F]{1,2}){5}$".
++ * Man page: "xx-xx-xx-xx-xx-xx", regexp: "^[0-9a-fA-F]{1,2}(-[0-9a-fA-F]{1,2}){5}$".
++ * Man page: "xx.xx.xx.xx.xx.xx", regexp: "^[0-9a-fA-F]{1,2}(\.[0-9a-fA-F]{1,2}){5}$".
++ * (Any "xx" above can be "x", which is equivalent to "0x".)
+  *
+- *	"xx:xx:xx:xx:xx:xx"
+- *	"xx.xx.xx.xx.xx.xx"
+- *	"xx-xx-xx-xx-xx-xx"
+- *	"xxxx.xxxx.xxxx"
+- *	"xxxxxxxxxxxx"
++ * An equivalent (and parametrisable for EUI-64) FSM could be implemented using
++ * a smaller graph, but that graph would be neither acyclic nor planar nor
++ * trivial to verify.
+  *
+- * (or various mixes of ':', '.', and '-') into a new
+- * ethernet address.  Assumes 's' is well formed.
++ *                |
++ *    [.]         v
++ * +<---------- START
++ * |              |
++ * |              | [0-9a-fA-F]
++ * |  [.]         v
++ * +<--------- BYTE0_X ----------+
++ * |              |              |
++ * |              | [0-9a-fA-F]  |
++ * |  [.]         v              |
++ * +<--------- BYTE0_XX          | [:\.-]
++ * |              |              |
++ * |              | [:\.-]       |
++ * |  [.]         v              |
++ * +<----- BYTE0_SEP_BYTE1 <-----+
++ * |              |
++ * |              | [0-9a-fA-F]
++ * |  [.]         v
++ * +<--------- BYTE1_X ----------+
++ * |              |              |
++ * |              | [0-9a-fA-F]  |
++ * |  [.]         v              |
++ * +<--------- BYTE1_XX          | <sep>
++ * |              |              |
++ * |              | <sep>        |
++ * |  [.]         v              |
++ * +<----- BYTE1_SEP_BYTE2 <-----+
++ * |              |
++ * |              | [0-9a-fA-F]
++ * |  [.]         v
++ * +<--------- BYTE2_X ----------+
++ * |              |              |
++ * |              | [0-9a-fA-F]  |
++ * |  [.]         v              |
++ * +<--------- BYTE2_XX          | <sep>
++ * |              |              |
++ * |              | <sep>        |
++ * |  [.]         v              |
++ * +<----- BYTE2_SEP_BYTE3 <-----+
++ * |              |
++ * |              | [0-9a-fA-F]
++ * |  [.]         v
++ * +<--------- BYTE3_X ----------+
++ * |              |              |
++ * |              | [0-9a-fA-F]  |
++ * |  [.]         v              |
++ * +<--------- BYTE3_XX          | <sep>
++ * |              |              |
++ * |              | <sep>        |
++ * |  [.]         v              |
++ * +<----- BYTE3_SEP_BYTE4 <-----+
++ * |              |
++ * |              | [0-9a-fA-F]
++ * |  [.]         v
++ * +<--------- BYTE4_X ----------+
++ * |              |              |
++ * |              | [0-9a-fA-F]  |
++ * |  [.]         v              |
++ * +<--------- BYTE4_XX          | <sep>
++ * |              |              |
++ * |              | <sep>        |
++ * |  [.]         v              |
++ * +<----- BYTE4_SEP_BYTE5 <-----+
++ * |              |
++ * |              | [0-9a-fA-F]
++ * |  [.]         v
++ * +<--------- BYTE5_X ----------+
++ * |              |              |
++ * |              | [0-9a-fA-F]  |
++ * |  [.]         v              |
++ * +<--------- BYTE5_XX          | \0
++ * |              |              |
++ * |              | \0           |
++ * |              |              v
++ * +--> (reject)  +---------> (accept)
++ *
++ */
++static u_char
++pcapint_atomac48_x_xx_6_times(const char *s, uint8_t *addr)
++{
++	enum {
++		START,
++		BYTE0_X,
++		BYTE0_XX,
++		BYTE0_SEP_BYTE1,
++		BYTE1_X,
++		BYTE1_XX,
++		BYTE1_SEP_BYTE2,
++		BYTE2_X,
++		BYTE2_XX,
++		BYTE2_SEP_BYTE3,
++		BYTE3_X,
++		BYTE3_XX,
++		BYTE3_SEP_BYTE4,
++		BYTE4_X,
++		BYTE4_XX,
++		BYTE4_SEP_BYTE5,
++		BYTE5_X,
++		BYTE5_XX,
++	} fsm_state = START;
++	uint8_t buf[6];
++	const char *seplist = ":.-";
++	char sep;
++
++	while (*s) {
++		switch (fsm_state) {
++		case START:
++			if (PCAP_ISXDIGIT(*s)) {
++				buf[0] = pcapint_xdtoi(*s);
++				fsm_state = BYTE0_X;
++				break;
++			}
++			goto reject;
++		case BYTE0_X:
++			if (strchr(seplist, *s)) {
++				sep = *s;
++				fsm_state = BYTE0_SEP_BYTE1;
++				break;
++			}
++			if (PCAP_ISXDIGIT(*s)) {
++				buf[0] = buf[0] << 4 | pcapint_xdtoi(*s);
++				fsm_state = BYTE0_XX;
++				break;
++			}
++			goto reject;
++		case BYTE0_XX:
++			if (strchr(seplist, *s)) {
++				sep = *s;
++				fsm_state = BYTE0_SEP_BYTE1;
++				break;
++			}
++			goto reject;
++		case BYTE0_SEP_BYTE1:
++			if (PCAP_ISXDIGIT(*s)) {
++				buf[1] = pcapint_xdtoi(*s);
++				fsm_state = BYTE1_X;
++				break;
++			}
++			goto reject;
++		case BYTE1_X:
++			if (*s == sep) {
++				fsm_state = BYTE1_SEP_BYTE2;
++				break;
++			}
++			if (PCAP_ISXDIGIT(*s)) {
++				buf[1] = buf[1] << 4 | pcapint_xdtoi(*s);
++				fsm_state = BYTE1_XX;
++				break;
++			}
++			goto reject;
++		case BYTE1_XX:
++			if (*s == sep) {
++				fsm_state = BYTE1_SEP_BYTE2;
++				break;
++			}
++			goto reject;
++		case BYTE1_SEP_BYTE2:
++			if (PCAP_ISXDIGIT(*s)) {
++				buf[2] = pcapint_xdtoi(*s);
++				fsm_state = BYTE2_X;
++				break;
++			}
++			goto reject;
++		case BYTE2_X:
++			if (*s == sep) {
++				fsm_state = BYTE2_SEP_BYTE3;
++				break;
++			}
++			if (PCAP_ISXDIGIT(*s)) {
++				buf[2] = buf[2] << 4 | pcapint_xdtoi(*s);
++				fsm_state = BYTE2_XX;
++				break;
++			}
++			goto reject;
++		case BYTE2_XX:
++			if (*s == sep) {
++				fsm_state = BYTE2_SEP_BYTE3;
++				break;
++			}
++			goto reject;
++		case BYTE2_SEP_BYTE3:
++			if (PCAP_ISXDIGIT(*s)) {
++				buf[3] = pcapint_xdtoi(*s);
++				fsm_state = BYTE3_X;
++				break;
++			}
++			goto reject;
++		case BYTE3_X:
++			if (*s == sep) {
++				fsm_state = BYTE3_SEP_BYTE4;
++				break;
++			}
++			if (PCAP_ISXDIGIT(*s)) {
++				buf[3] = buf[3] << 4 | pcapint_xdtoi(*s);
++				fsm_state = BYTE3_XX;
++				break;
++			}
++			goto reject;
++		case BYTE3_XX:
++			if (*s == sep) {
++				fsm_state = BYTE3_SEP_BYTE4;
++				break;
++			}
++			goto reject;
++		case BYTE3_SEP_BYTE4:
++			if (PCAP_ISXDIGIT(*s)) {
++				buf[4] = pcapint_xdtoi(*s);
++				fsm_state = BYTE4_X;
++				break;
++			}
++			goto reject;
++		case BYTE4_X:
++			if (*s == sep) {
++				fsm_state = BYTE4_SEP_BYTE5;
++				break;
++			}
++			if (PCAP_ISXDIGIT(*s)) {
++				buf[4] = buf[4] << 4 | pcapint_xdtoi(*s);
++				fsm_state = BYTE4_XX;
++				break;
++			}
++			goto reject;
++		case BYTE4_XX:
++			if (*s == sep) {
++				fsm_state = BYTE4_SEP_BYTE5;
++				break;
++			}
++			goto reject;
++		case BYTE4_SEP_BYTE5:
++			if (PCAP_ISXDIGIT(*s)) {
++				buf[5] = pcapint_xdtoi(*s);
++				fsm_state = BYTE5_X;
++				break;
++			}
++			goto reject;
++		case BYTE5_X:
++			if (PCAP_ISXDIGIT(*s)) {
++				buf[5] = buf[5] << 4 | pcapint_xdtoi(*s);
++				fsm_state = BYTE5_XX;
++				break;
++			}
++			goto reject;
++		case BYTE5_XX:
++			goto reject;
++		} // switch
++		s++;
++	} // while
++
++	if (fsm_state == BYTE5_X || fsm_state == BYTE5_XX) {
++		// accept
++		memcpy(addr, buf, sizeof(buf));
++		return 1;
++	}
++
++reject:
++	return 0;
++}
++
++// The 'addr' argument must point to an array of at least 6 elements.
++static int
++pcapint_atomac48(const char *s, uint8_t *addr)
++{
++	return s && (
++	    pcapint_atomac48_xxxxxxxxxxxx(s, addr) ||
++	    pcapint_atomac48_xxxx_3_times(s, addr) ||
++	    pcapint_atomac48_x_xx_6_times(s, addr)
++	);
++}
++
++/*
++ * If 's' is a MAC-48 address in one of the forms documented in pcap-filter(7)
++ * for "ether host", return a pointer to an allocated buffer with the binary
++ * value of the address.  Return NULL on any error.
+  */
+ u_char *
+ pcap_ether_aton(const char *s)
+ {
+-	register u_char *ep, *e;
+-	register u_char d;
++	uint8_t tmp[6];
++	if (! pcapint_atomac48(s, tmp))
++		return (NULL);
+ 
+-	e = ep = (u_char *)malloc(6);
++	u_char *e = malloc(6);
+ 	if (e == NULL)
+ 		return (NULL);
+-
+-	while (*s) {
+-		if (*s == ':' || *s == '.' || *s == '-')
+-			s += 1;
+-		d = pcapint_xdtoi(*s++);
+-		if (PCAP_ISXDIGIT(*s)) {
+-			d <<= 4;
+-			d |= pcapint_xdtoi(*s++);
+-		}
+-		*ep++ = d;
+-	}
+-
++	memcpy(e, tmp, sizeof(tmp));
+ 	return (e);
+ }
+ 
diff --git a/meta/recipes-connectivity/libpcap/libpcap_1.10.4.bb b/meta/recipes-connectivity/libpcap/libpcap_1.10.4.bb
index 36eb4bca75..df091e5ca2 100644
--- a/meta/recipes-connectivity/libpcap/libpcap_1.10.4.bb
+++ b/meta/recipes-connectivity/libpcap/libpcap_1.10.4.bb
@@ -14,6 +14,8 @@ SRC_URI = "https://www.tcpdump.org/release/${BP}.tar.gz \
            file://CVE-2023-7256-pre1.patch \
            file://CVE-2023-7256.patch \
            file://CVE-2024-8006.patch \
+           file://CVE-2025-11961-01.patch \
+           file://CVE-2025-11961-02.patch \
           "
 
 SRC_URI[sha256sum] = "ed19a0383fad72e3ad435fd239d7cd80d64916b87269550159d20e47160ebe5f"

