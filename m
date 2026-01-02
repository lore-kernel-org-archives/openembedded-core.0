Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF652FA374F
	for <webhook@archiver.kernel.org>; Fri,  2 Jan 2026 13:33:08 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5029.1767360779186469455
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Jan 2026 05:32:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=cu1d18KY;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-256628-20260102133257330556558f000207ab-4g8ejw@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 20260102133257330556558f000207ab
        for <openembedded-core@lists.openembedded.org>;
        Fri, 02 Jan 2026 14:32:57 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=2yc0pny+5WAXC653ekxXR1k4t9NQ1b1qmXSXVX6WCOc=;
 b=cu1d18KYEMOqgdgvkwEgjd5uNXPlHmLcnjaCB+vcdpQB4bjPRURDPXeY/VQwM+2xadUTdc
 XF3Ig4ELHgkVULZrOeRTSSrp66GJhuiB76+wr6twIJVZUDcRDlX1wKPKUe0qR2cnafk7YFmr
 FcA/73dqzjQkr4SzGbSdxS/hHgYcL2pwoxhEeL3WHf0+aaeHSOfr/rq8oZqp5nRl/3zbYxXQ
 VuOs249PPn2UQKN8v/rj4pa+uIl+NxKo6jliEp8pJHfHqI5kgrxFurqFd/kqE6h/C4VFK41X
 PcGJxhGQSmtiofxzWrCeN18w59qqkYZqkI+nOZIczH3kCNy8KAHwPiVA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][kirkstone][PATCH 1/2] libpcap: patch CVE-2025-11961
Date: Fri,  2 Jan 2026 14:32:52 +0100
Message-Id: <20260102133253.2651626-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Jan 2026 13:33:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228846

From: Peter Marko <peter.marko@siemens.com>

Pick patch per [1].
Also pick additional preparation patch to apply it cleanly.

[1] https://nvd.nist.gov/vuln/detail/CVE-2025-11961

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../libpcap/libpcap/CVE-2025-11961-01.patch   |  38 ++
 .../libpcap/libpcap/CVE-2025-11961-02.patch   | 433 ++++++++++++++++++
 .../libpcap/libpcap_1.10.1.bb                 |   2 +
 3 files changed, 473 insertions(+)
 create mode 100644 meta/recipes-connectivity/libpcap/libpcap/CVE-2025-11961-01.patch
 create mode 100644 meta/recipes-connectivity/libpcap/libpcap/CVE-2025-11961-02.patch

diff --git a/meta/recipes-connectivity/libpcap/libpcap/CVE-2025-11961-01.patch b/meta/recipes-connectivity/libpcap/libpcap/CVE-2025-11961-01.patch
new file mode 100644
index 00000000000..73c3ab3f5c7
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
index 00000000000..0b0dc5ac403
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
+@@ -7206,6 +7206,11 @@ gen_ecode(compiler_state_t *cstate, const char *s, struct qual q)
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
diff --git a/meta/recipes-connectivity/libpcap/libpcap_1.10.1.bb b/meta/recipes-connectivity/libpcap/libpcap_1.10.1.bb
index 584e98c76d2..b3bd4f669af 100644
--- a/meta/recipes-connectivity/libpcap/libpcap_1.10.1.bb
+++ b/meta/recipes-connectivity/libpcap/libpcap_1.10.1.bb
@@ -17,6 +17,8 @@ SRC_URI = "https://www.tcpdump.org/release/${BP}.tar.gz \
            file://CVE-2023-7256-pre4.patch \
            file://CVE-2023-7256.patch \
            file://CVE-2024-8006.patch \
+           file://CVE-2025-11961-01.patch \
+           file://CVE-2025-11961-02.patch \
           "
 
 SRC_URI[sha256sum] = "ed285f4accaf05344f90975757b3dbfe772ba41d1c401c2648b7fa45b711bdd4"

