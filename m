Return-Path: <jsbronder@cold-front.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2DC8D59F6A
	for <webhook@archiver.kernel.org>; Wed,  6 Nov 2024 19:07:08 +0000 (UTC)
Received: from fhigh-a7-smtp.messagingengine.com (fhigh-a7-smtp.messagingengine.com [103.168.172.158])
 by mx.groups.io with SMTP id smtpd.web10.54554.1730920022216960137
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Nov 2024 11:07:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cold-front.org header.s=fm1 header.b=QeDAZ+tS;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=V3OzZa5r;
 spf=pass (domain: cold-front.org, ip: 103.168.172.158, mailfrom: jsbronder@cold-front.org)
Received: from phl-compute-09.internal (phl-compute-09.phl.internal [10.202.2.49])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 6249111400D0;
	Wed,  6 Nov 2024 14:07:01 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-09.internal (MEProxy); Wed, 06 Nov 2024 14:07:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cold-front.org;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to; s=fm1; t=1730920021; x=1731006421; bh=7BAJPY0Gi8
	BBvy7Pt7qMxYMnMmWueNC8mDDB3ci07CM=; b=QeDAZ+tSuEWryKWJM99hq6sHA0
	s9srsZznNT32V39yBJcotJUpeONxYGAHmYqAuteMds7Nle6ho9ndcJ7lh+JKkMzM
	Zqer3q1F2G5U4c45RasBtEHrt/1ey0Kuwh5cRC7lM4rAaemf0xXq0hK2smjhfWr3
	uUf4o5ic6Uaw/CtDoDbSDz/s2pBLIVlR0bCvYOz99I+8CizMe4w1V16u1csfuDVt
	ex+NK0JcxwrEPxIOdj9M4NNjRQDBZycOdLys2+dN8OtVjAsgYti2VYE2/jkZ+t20
	URcvQKoxAcA4Lsj7JZ3x6ySBHmpERaKUGqc+Btq5PZL5Neh12hD+ytpBvPYg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1730920021; x=1731006421; bh=7BAJPY0Gi8BBvy7Pt7qMxYMnMmWueNC8mDD
	B3ci07CM=; b=V3OzZa5rn+cfANwYEyCbtt1SCUacMZqneW/5YHW/khXzzo3tA1P
	GZ44XSzPzVz6ErVIGxTCe69ZKiJvwVJG6Ddfp9atyfkssoznhULQZpiGIisuy2NO
	4CrQ0Q4LWJDp5Y1aIHUu/XUH/reOuOkEsHyLOLH7QuLcHFZ090ymPUMUm/g4U+5z
	b4NAZKti5aCzLZ8lZDlk8rwi+VirycsJOqy0+vOzwaQSFQntyicMSeEHMzpv29v8
	eNQcjgTgiKifh9xysu3lM187wXrW/HmRGtp9phQCm9aw3iAAZ3jGffdhFVUamXhl
	lqcRMhLKfExEk/2Pzs2Ei8sUcRkookyhnaw==
X-ME-Sender: <xms:Vb4rZ5JHuUSsoBscn5EpZkrGy6NaBLLYTjrLNalrh7f4TyDYrIJSjg>
    <xme:Vb4rZ1LBvpf1wW_USpGMsYp9Zrz8x-_WoDWi55Z5nKqGVASlhH22uAdWugcqqBaf5
    W_wGzD0lkPI1dkumA>
X-ME-Received: <xmr:Vb4rZxtU4EjPdRdzQQ5gz5URR2YLPxRBWTWodxD0zckYe5vZbSNyDaRq3200rZnfKGgGW2vszv0q50GLWvZlj9C4QRqV4ON1ntdpKXd2Ew>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrtddvgdduudelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevuf
    ffkffoggfgsedtkeertdertddtnecuhfhrohhmpefluhhsthhinhcuuehrohhnuggvrhcu
    oehjshgsrhhonhguvghrsegtohhlugdqfhhrohhnthdrohhrgheqnecuggftrfgrthhtvg
    hrnhepgeetveehgeefjeelvdevjefgfeejfffgtedtgfdtvdekgeefvdfflefhteekgeeh
    necuffhomhgrihhnpehgihhthhhusgdrtghomhdpihhnfhhrrgguvggrugdrohhrghdpsg
    grrhgvsghogidrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgr
    ihhlfhhrohhmpehjshgsrhhonhguvghrsegtohhlugdqfhhrohhnthdrohhrghdpnhgspg
    hrtghpthhtohepvddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepohhpvghnvghm
    sggvugguvgguqdgtohhrvgeslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhgpd
    hrtghpthhtohepjhhssghrohhnuggvrhestgholhguqdhfrhhonhhtrdhorhhg
X-ME-Proxy: <xmx:Vb4rZ6Z928rRt9JqvGB3BXxXf6SSHaFknxREbbEKtUSyGGmD5qEEVg>
    <xmx:Vb4rZwZoo5cEWKCd6DVUfnzDTth5QcDpLiZ-vvuQobCPlCzsHbhvHg>
    <xmx:Vb4rZ-BKd_ofWp2ZmTalYEhFKv5v8_nCy47hHRrzkFoBdxdq4h5wDA>
    <xmx:Vb4rZ-ayLYsnMUCTtJdPaMcNkXXxTHH-440pk7_A2kexDagnFULvBg>
    <xmx:Vb4rZ_kvVYlXhcTyqBFHHIgaLa5KseaiS79atEXAf0ycWmSGEewqRjCl>
Feedback-ID: iea0042cb:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 6 Nov 2024 14:07:00 -0500 (EST)
From: Justin Bronder <jsbronder@cold-front.org>
To: openembedded-core@lists.openembedded.org
Cc: Justin Bronder <jsbronder@cold-front.org>
Subject: [PATCH v2 1/2] barebox: use lz4 instead of lz4c
Date: Wed,  6 Nov 2024 14:06:42 -0500
Message-ID: <20241106190643.610702-1-jsbronder@cold-front.org>
X-Mailer: git-send-email 2.46.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Nov 2024 19:07:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206800

lz4c has been considered deprecated by upstream since at least 2018 [1]
and has been disabled by default recently [2].  openSUSE Tumbleweed is
no longer packaging the deprecated version and others will likely
follow.

Going back as far as Ubuntu 16.04/Fedora 25, both lz4 and lz4c are
installed as part of the same package so switching should be safe.

1. https://github.com/lz4/lz4/pull/553
2. https://github.com/lz4/lz4/pull/1479

Upstream-Status: Submitted [http://lists.infradead.org/pipermail/barebox/2024-November/048491.html]
Signed-off-by: Justin Bronder <jsbronder@cold-front.org>
---
 ...0001-lib-lz4-use-lz4-instead-of-lz4c.patch | 35 +++++++++++++++++++
 meta/recipes-bsp/barebox/barebox_2024.09.0.bb |  4 ++-
 2 files changed, 38 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-bsp/barebox/barebox/0001-lib-lz4-use-lz4-instead-of-lz4c.patch

diff --git a/meta/recipes-bsp/barebox/barebox/0001-lib-lz4-use-lz4-instead-of-lz4c.patch b/meta/recipes-bsp/barebox/barebox/0001-lib-lz4-use-lz4-instead-of-lz4c.patch
new file mode 100644
index 0000000000..55d4a4556b
--- /dev/null
+++ b/meta/recipes-bsp/barebox/barebox/0001-lib-lz4-use-lz4-instead-of-lz4c.patch
@@ -0,0 +1,35 @@
+From 24839df617aef8099e4d1ba3fc47a04c52c0cf75 Mon Sep 17 00:00:00 2001
+From: Justin Bronder <jsbronder@cold-front.org>
+Date: Wed, 6 Nov 2024 11:59:40 -0500
+Subject: [PATCH] lib: lz4: use lz4 instead of lz4c
+
+lz4c has been considered deprecated by upstream since at least 2018 [1]
+and has been disabled by default recently [2].  openSUSE Tumbleweed is
+no longer packaging the deprecated version and others will likely
+follow.
+
+Going back as far as Ubuntu 16.04/Fedora 25, both lz4 and lz4c are
+installed as part of the same package so switching should be safe.
+
+1. https://github.com/lz4/lz4/pull/553
+2. https://github.com/lz4/lz4/pull/1479
+
+Upstream-Status: Submitted [http://lists.infradead.org/pipermail/barebox/2024-November/048491.html]
+Signed-off-by: Justin Bronder <jsbronder@cold-front.org>
+---
+ scripts/Makefile.lib | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
+index 1881e3c1..1052bcee 100644
+--- a/scripts/Makefile.lib
++++ b/scripts/Makefile.lib
+@@ -492,7 +492,7 @@ cmd_lzo = (cat $(filter-out FORCE,$^) | \
+ 
+ quiet_cmd_lz4 = LZ4     $@
+ cmd_lz4 = (cat $(filter-out FORCE,$^) | \
+-	lz4c -l -c1 stdin stdout && $(call size_append, $(filter-out FORCE,$^))) > $@ || \
++	lz4 -l --best stdin stdout && $(call size_append, $(filter-out FORCE,$^))) > $@ || \
+ 	(rm -f $@ ; false)
+ 
+ %.lz4: %
diff --git a/meta/recipes-bsp/barebox/barebox_2024.09.0.bb b/meta/recipes-bsp/barebox/barebox_2024.09.0.bb
index d2a3d4ebd1..4b24ab945e 100644
--- a/meta/recipes-bsp/barebox/barebox_2024.09.0.bb
+++ b/meta/recipes-bsp/barebox/barebox_2024.09.0.bb
@@ -11,5 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=f5125d13e000b9ca1f0d3364286c4192"
 
 inherit barebox
 
-SRC_URI = "https://barebox.org/download/barebox-${PV}.tar.bz2"
+SRC_URI = "https://barebox.org/download/barebox-${PV}.tar.bz2 \
+           file://0001-lib-lz4-use-lz4-instead-of-lz4c.patch \
+           "
 SRC_URI[sha256sum] = "4d4ea7e232aeba2b3cb9ccf0dbf8cd8e01c65b6c615f64c3bd0c4f24f23a47da"
-- 
2.46.1


