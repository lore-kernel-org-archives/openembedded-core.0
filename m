Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2288CC6B39
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 05:04:24 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32852.1792040654801672096
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Oct 2026 22:04:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=bLo4poPH;
 spf=pass (domain: smile.fr, ip: 209.85.128.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a021c809e3so45975805e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Oct 2026 22:04:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1792040653; x=1792645453; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Bs118gol+uNLBEYHsqJd1MO11ml4StiXpwHTQxseP5c=;
        b=bLo4poPH3XDmLZCTlRM3lBV3BgYWifnZe1CsIsF2+n8a1eNLFyicamc+3M+BVfJC0v
         GBFz9cxjr8MHfABq5DXPJh3LJqCRmRHFZ2q8ItswxAFk5yZ5IJfPYHkOhACxWamBIVBZ
         QNRIPuW9SR/qMulR+eJ+qHwcVXX53zinIuAhU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792040653; x=1792645453;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Bs118gol+uNLBEYHsqJd1MO11ml4StiXpwHTQxseP5c=;
        b=I2jwqQw9HazwgXuxfKf8xfdmtDyT3UU4UXW/8E3w5/DQND35fbxzE20OjZOXzUp+9U
         zJLksuBEFSjpIKsdNwJnM8eegeSOj+6I95c8yhyjB8UcvGkx/jSsj5M/0dQ3MYwf/zDR
         YMdXcefAaAl2QkwbluCrB0FUYHra9nTKW+zKaQKbiiDRyEx9NH5LCFYT97c5GqAxfBVK
         rL1jYrTKEMlDwLIBbzA/9J/tP1m9awEQ5iNc1BUfML/hvHosj92XC88Yn6/t6LeKJ9v8
         Q/VcSkF9KQuSQDV7xjAYgG8M+u/mgCEKA4jvJfWRyqo1qDlFb+uVrPsFs3/TX/RMfO40
         Taug==
X-Gm-Message-State: AFq9FYIox0bZpGhvfWjI8pfxwIBkIyvYszd3La8FqgeAQWMGNOFAOsrr
	PuBqsTBTjnCqcom2J3O2VjRUT0iYvy9OWvK5eGOfXxP29CMB+G5BATFm4BIQCu6LnUmfGM09tq3
	MYv7LmcQ=
X-Gm-Gg: AYBFou0Ivr9pCARYw1N62g0AgDrhGprMlKRARkl4QQz0lgeSzhC3VdrQ+gCloSl/RW3
	ha3JFm045mJDgmcfvnon7Nm+I0ocZlgwWn7r303mjq8Ns2PLmp5UFNbsZec5Sc0d1nUmS0kY5Gm
	Kw12hEuBdoJsKXOpj1civvgKs4/8yLUrAJe+2Ty0Cq5hU+KvqmdxeM3kZfHXfG3QpVPsDC7ztC6
	sqf9bNkvPJXoS4NUAkIMo89m6S/haL50oVFXkUrDEPtcOYW1GxbqMTdrO7vPhc1O00ceOqPDRUp
	xBU0tF/LqaAXppMZ4ajnCrWLa24rjvizxQ0TxDXjIUPIVo/gekAh/KUiMKvpg3QzTI93TpO+g2A
	qv5x2swPT25XODzMVSQw48FNSyzzOerfEHsoCVaHv8DDBOC7OsnHYccLoJvkOptKgzowBMwK10O
	QL6sNDDPD809rH0ADebg5e1o+orfx8HV+jKCuyXVTnjW6D0Fsxa+fzwfKVHh+JhbECzC7uiSJaW
	58aiKhdh9fkgkQwvJMap6OY5dQJ/KqP3L6+IyneunU1aYRNNffzDTu0mZXD1enzC46988wiZfY=
X-Received: by 2002:a05:600c:8105:b0:49f:fdca:c361 with SMTP id 5b1f17b1804b1-4a18e483818mr380346295e9.12.1792040653050;
        Wed, 14 Oct 2026 22:04:13 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd972aebsm46376245e9.1.2026.10.14.22.04.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 22:04:12 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 50/55] libpcap: Fix CVE-2026-6554
Date: Thu, 15 Oct 2026 07:03:13 +0200
Message-ID: <97da4c723262d570d42ef66d281f7add017c72f5.1792020605.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1792020605.git.yoann.congal@smile.fr>
References: <cover.1792020605.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Oct 2026 05:04:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247848

From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>

NVD: https://nvd.nist.gov/vuln/detail/CVE-2026-6554
Upstream-commit: https://github.com/the-tcpdump-group/libpcap/commit/ff3c83475ac303c6b681c52ad0b6e14795a8e0ce

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../libpcap/libpcap/05-CVE-2026-6554.patch    | 92 +++++++++++++++++++
 .../libpcap/libpcap_1.10.4.bb                 |  1 +
 2 files changed, 93 insertions(+)
 create mode 100644 meta/recipes-connectivity/libpcap/libpcap/05-CVE-2026-6554.patch

diff --git a/meta/recipes-connectivity/libpcap/libpcap/05-CVE-2026-6554.patch b/meta/recipes-connectivity/libpcap/libpcap/05-CVE-2026-6554.patch
new file mode 100644
index 00000000000..9c44294d1f9
--- /dev/null
+++ b/meta/recipes-connectivity/libpcap/libpcap/05-CVE-2026-6554.patch
@@ -0,0 +1,92 @@
+From ff3c83475ac303c6b681c52ad0b6e14795a8e0ce Mon Sep 17 00:00:00 2001
+From: Denis Ovsienko <denis@ovsienko.info>
+Date: Thu, 30 Jul 2026 13:34:33 +0100
+Subject: [PATCH] CVE-2026-6554: Limit "ja L" looping in pcap_offline_filter().
+
+This vulnerability has been discovered by Kaixuan LI.
+
+The current revision of pcapint_filter_with_aux_data() assumes that any
+"ja L" instruction in a filter program does not jump to itself or to a
+prior instruction that is guaranteed to reach the same "ja L" again.
+This holds for programs that have been generated by libpcap.
+
+However, this does not necessarily hold for programs that come from an
+external source via pcap_offline_filter() or [deprecated] bpf_filter().
+If the interpreter executes such a program, upon reaching such an
+instruction it will begin looping infinitely.
+
+To mitigate this problem, in pcapint_filter_with_aux_data() enforce a
+hard-coded limit on the number of backward jumps per packet.  Ibid., and
+in pcapint_validate_filter() as well, reject the only immediately
+detectable case of an infinite loop.
+
+(backported from commit 63c005c25aeabf1404968add49fc885da3e127e0)
+
+(cherry picked from commit ff3c83475ac303c6b681c52ad0b6e14795a8e0ce)
+
+Notes on backporting to 1.10.4:
+ - Adapted to the 1.10.4 pcap_filter*() names (renamed to pcapint_*()
+   after 1.10.4).
+ - The upstream CHANGES/changelog hunk is not backported.
+
+Upstream-Status: Backport [https://github.com/the-tcpdump-group/libpcap/commit/ff3c83475ac303c6b681c52ad0b6e14795a8e0ce]
+CVE: CVE-2026-6554
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+diff --git a/bpf_filter.c b/bpf_filter.c
+index df92c433..ae8a3a36 100644
+--- a/bpf_filter.c
++++ b/bpf_filter.c
+@@ -72,6 +72,8 @@ enum {
+         BPF_S_ANC_VLAN_TAG_PRESENT,
+ };
+ 
++#define MAX_BACKWARD_JUMPS 64U
++
+ /*
+  * Kernel BPF implementations tend to define BPF_MAXINSNS to 512 or 4096, the
+  * userland interpreter in libpcap is meant to support much longer filter
+@@ -146,6 +148,7 @@ pcap_filter_with_aux_data(const struct bpf_insn *pc, const u_int proglen,
+ 	A = 0;
+ 	X = 0;
+ 	const struct bpf_insn *pc0 = pc;
++	unsigned backward_jumps = 0;
+ 	--pc;
+ 	for (;;) {
+ 		++pc;
+@@ -320,6 +323,17 @@ DIAG_ON_DEFAULT_ONLY_SWITCH
+ 			 */
+ 			if ((bpf_u_int32)(pc - pc0) + 1 + pc->k >= proglen)
+ 				return 0;
++			/*
++			 * Terminate the program if this is a non-forward jump
++			 * and is:
++			 * - a guaranteed infinite loop because it jumps to
++			 *   itself (exactly the same as in the validator), or
++			 * - a backward jump after many enough backward jumps
++			 *   already made for this packet.
++			 */
++			if ((bpf_int32)pc->k < 0 && ((bpf_int32)pc->k == -1 ||
++			    backward_jumps++ >= MAX_BACKWARD_JUMPS))
++				return 0;
+ 			/*
+ 			 * XXX - we currently implement "ip6 protochain"
+ 			 * with backward jumps, so sign-extend pc->k.
+@@ -607,6 +621,17 @@ pcap_validate_filter(const struct bpf_insn *f, int len)
+ 				 */
+ 				if (from + p->k >= (u_int)len)
+ 					return 0;
++				/*
++				 * The only type of infinite loop that can be
++				 * detected in this function is a "ja L" that
++				 * jumps to itself.  For this only k == -1
++				 * needs to be tested because the check above
++				 * has already rejected all other values that
++				 * would wrap the pointer equivalently on
++				 * 32-bit architectures.
++				 */
++				if ((bpf_int32)p->k == -1)
++					return 0;
+ 				break;
+ 			case BPF_JEQ:
+ 			case BPF_JGT:
diff --git a/meta/recipes-connectivity/libpcap/libpcap_1.10.4.bb b/meta/recipes-connectivity/libpcap/libpcap_1.10.4.bb
index d23a018a953..f7ba1bf3eac 100644
--- a/meta/recipes-connectivity/libpcap/libpcap_1.10.4.bb
+++ b/meta/recipes-connectivity/libpcap/libpcap_1.10.4.bb
@@ -21,6 +21,7 @@ SRC_URI = "https://www.tcpdump.org/release/${BP}.tar.gz \
            file://02-CVE-2026-31912.patch \
            file://03-CVE-2026-31911.patch \
            file://04-CVE-2026-6244.patch \
+           file://05-CVE-2026-6554.patch \
           "
 
 SRC_URI[sha256sum] = "ed19a0383fad72e3ad435fd239d7cd80d64916b87269550159d20e47160ebe5f"

