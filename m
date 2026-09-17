Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AC26C982DB
	for <webhook@archiver.kernel.org>; Thu, 17 Sep 2026 22:08:28 +0000 (UTC)
Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1704.1789682904444864849
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Sep 2026 15:08:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=ho7AR8lf;
 spf=pass (domain: smile.fr, ip: 74.125.225.141, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e83a388f8so738115e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 15:08:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1789682903; x=1790287703; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=H6l4IHoIrXc3kKykRGa1qoQ/kdKe1A+8mInMQ+KCFis=;
        b=ho7AR8lfzwj9gWBeLvQBcuYB07BbZvAKf7GsKufkbb13LTxTZLCHrSuLUzcu29hjTL
         AEHer2Cg3O8wloK+dkoxH+rw4jf/GRnCnMOO/ZJveg7jV2X/ZiIQ/lL4gjB01CUI0pqk
         fCb/RO1RjdCuwaysrpIzqn9OG8ycus3GVWo1o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789682903; x=1790287703;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=H6l4IHoIrXc3kKykRGa1qoQ/kdKe1A+8mInMQ+KCFis=;
        b=CznY7QDs35C8i+8WAWHINda4dtMSTDWoE/h8szTSPw1f1HCkzroSwKH8JDqWq+pRxu
         tXa/IfrTfmqjkiuk0BTICZgFdJqzopO8Rjn6U1zcWFbnr4/WU7U+L0EQQLu4O4C1VW2Y
         JXX65J9f0zrIE5Bh78mMCtyMFsXMp2HYbM9qrlUtmyAOiB8xgwY02wrmHIDdugDXzNRI
         pz81ZIRETrYpKfUKv6+InzjIsVqvo5QPRgNlu0NkuQ/L4xpYex4QDYogW38gJM+uJNW+
         qZdl2OjWfSGjXbYK+lhdxmJWPElfY3wjvqVlSPFPi8+ilI1OsQ+jcPE0QhVIJKHTlLW8
         L4tA==
X-Gm-Message-State: AFuF++m93rRFpu7Nr0pEu0kbfHeEbJXfptOguZYg/1Cga7DIeS+IOBmg
	PxYGS0vieof4ijvEl6+rvKiRMePYedS0vcbMCVj74s1q4KnpD7st04quCDKiiGunylyoiRx7Lq/
	6iJ9Yg9E=
X-Gm-Gg: AYBFou2As4ocwpreR4oUOSJC3Brnr4YRZ0Dytb1jmI6YLIvsps6/vexoS4zZDctOaQQ
	tJ72UXsQ9wKbj8Bg6Q6g5LskzEv6HvPHzFuScFoFtDUazuQjgR55zxc9+ZvTITGy1BzdVq6e/KQ
	yWy4UUh3og3/g+oi1XsNT413LR1kgX3wa8NjCX6vBHG6ShzR6reWlHiQoYSNn2MDpXnKoYxo+mR
	B05gkj3Xt/ocLVWz8dh1Fx/EezLnQNJIiSk9Rg/CVJ9LQJd3vUzhSX2hWHKCjJXwrrmbtH2xUeV
	qq2wSrqNLmQab0pdghPKpBN5flcfbrOCzB5buTaxOEIaIsFU7rzok3dbea7nLH84NKdySvIjepN
	yVAk5qy7zYjiDUlghPllNXsrJLjFDbkfNNqeNowZMekkzo6XYuuQ/NKbp8pPoq8to33XQWH1y7o
	Aa7wzYGgHai9vv1pLuIbFzGRJvByhcaggeRfiOpdzh/3v0S1kJYa5HdbwhTKzOn5ZNGBP8DvQWc
	c6QiS7/Q7wg79o655FCQn8iItrHvjWmGeBG8uTX4DlZeqv/yLftD/gwEfIWfaMI0AQ+/cIcWB8=
X-Received: by 2002:a05:600c:a14:b0:49d:1e09:694a with SMTP id 5b1f17b1804b1-49fc568f869mr3149405e9.11.1789682902731;
        Thu, 17 Sep 2026 15:08:22 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc471b9a2sm8984075e9.0.2026.09.17.15.08.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 15:08:22 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 62/79] libpcap: Fix CVE-2026-0799
Date: Fri, 18 Sep 2026 00:06:47 +0200
Message-ID: <da13add2943749d79e2c629b8264fa289dd09ad7.1789681419.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1789681419.git.yoann.congal@smile.fr>
References: <cover.1789681419.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 22:08:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246157

From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>

NVD: https://nvd.nist.gov/vuln/detail/CVE-2026-0799
Upstream-commit: https://github.com/the-tcpdump-group/libpcap/commit/48e8960a7108e9e828f9d7bdc7e97bdab841aec7
Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../libpcap/libpcap/01-CVE-2026-0799.patch    | 67 +++++++++++++++++++
 .../libpcap/libpcap_1.10.6.bb                 |  1 +
 2 files changed, 68 insertions(+)
 create mode 100644 meta/recipes-connectivity/libpcap/libpcap/01-CVE-2026-0799.patch

diff --git a/meta/recipes-connectivity/libpcap/libpcap/01-CVE-2026-0799.patch b/meta/recipes-connectivity/libpcap/libpcap/01-CVE-2026-0799.patch
new file mode 100644
index 00000000000..7c40faa608d
--- /dev/null
+++ b/meta/recipes-connectivity/libpcap/libpcap/01-CVE-2026-0799.patch
@@ -0,0 +1,67 @@
+From 3c55fdefa576c7a06feab86a9e4341be414de49b Mon Sep 17 00:00:00 2001
+From: Denis Ovsienko <denis@ovsienko.info>
+Date: Thu, 30 Jul 2026 13:33:41 +0100
+Subject: [PATCH] CVE-2026-0799: Access M[] safely in the BPF interpreter.
+
+Include Security identified and reported this problem as a potential
+vulnerability in 2018 (case reference "I7").  Their work was sponsored
+by Mozilla under the Secure Open Source program.  The vulnerability has
+been independently confirmed only recently.
+
+The current revision of pcapint_filter_with_aux_data() can, but does not
+check whether a scratch memory register index is valid in the "ld M[k]",
+"ldx M[k]", "st M[k]" and "stx M[k]" BPF instructions, and assumes this
+is always the case.  This holds for programs that have been generated or
+validated by libpcap.
+
+However, this does not necessarily hold for programs that come via
+pcap_offline_filter() or [deprecated] bpf_filter() from an external
+source and have not been explicitly validated.  If the interpreter
+executes such a program with an invalid index, it will read/write the
+process memory at arbitrary locations starting at the current stack
+frame.  Depending on the address, the memory layout and the OS, this can
+result in stack buffer overflow, SIGSEGV, SIGBUS or other effects.  To
+fix this, in the interpreter reject the packet if the index is invalid.
+
+(backported from commit 569f8fd3524192acbabf93c9cd704471bb38f84a)
+
+(cherry picked from commit 48e8960a7108e9e828f9d7bdc7e97bdab841aec7)
+
+Notes on backporting to 1.10.6:
+ - The upstream CHANGES/changelog hunk is not backported.
+
+Upstream-Status: Backport [https://github.com/the-tcpdump-group/libpcap/commit/48e8960a7108e9e828f9d7bdc7e97bdab841aec7]
+CVE: CVE-2026-0799
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+diff --git a/bpf_filter.c b/bpf_filter.c
+index 9b899bbb..510dbd9c 100644
+--- a/bpf_filter.c
++++ b/bpf_filter.c
+@@ -217,18 +217,26 @@ DIAG_ON_DEFAULT_ONLY_SWITCH
+ 			continue;
+ 
+ 		case BPF_LD|BPF_MEM:
++			if (pc->k >= BPF_MEMWORDS)
++				return 0;
+ 			A = mem[pc->k];
+ 			continue;
+ 
+ 		case BPF_LDX|BPF_MEM:
++			if (pc->k >= BPF_MEMWORDS)
++				return 0;
+ 			X = mem[pc->k];
+ 			continue;
+ 
+ 		case BPF_ST:
++			if (pc->k >= BPF_MEMWORDS)
++				return 0;
+ 			mem[pc->k] = A;
+ 			continue;
+ 
+ 		case BPF_STX:
++			if (pc->k >= BPF_MEMWORDS)
++				return 0;
+ 			mem[pc->k] = X;
+ 			continue;
+ 
diff --git a/meta/recipes-connectivity/libpcap/libpcap_1.10.6.bb b/meta/recipes-connectivity/libpcap/libpcap_1.10.6.bb
index d381a4eb2fe..265c46e3bd0 100644
--- a/meta/recipes-connectivity/libpcap/libpcap_1.10.6.bb
+++ b/meta/recipes-connectivity/libpcap/libpcap_1.10.6.bb
@@ -12,6 +12,7 @@ DEPENDS = "flex-native bison-native"
 
 SRC_URI = "https://www.tcpdump.org/release/${BP}.tar.xz \
 	   file://0001-Fix-error-messages-about-32-bit-integer-overflow.patch \
+	   file://01-CVE-2026-0799.patch \
           "
 SRC_URI[sha256sum] = "ec97d1206bdd19cb6bdd043eaa9f0037aa732262ec68e070fd7c7b5f834d5dfc"
 

