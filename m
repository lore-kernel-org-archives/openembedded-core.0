Return-Path: <pavel@zhukoff.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 569E0C47258
	for <webhook@archiver.kernel.org>; Tue, 23 Jan 2024 09:06:27 +0000 (UTC)
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
 by mx.groups.io with SMTP id smtpd.web11.7937.1706000781884382573
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jan 2024 01:06:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@zhukoff.net header.s=fm3 header.b=CtxKCPMN;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=qH6sgO9j;
 spf=pass (domain: zhukoff.net, ip: 66.111.4.27, mailfrom: pavel@zhukoff.net)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.nyi.internal (Postfix) with ESMTP id 06D4D5C03B9;
	Tue, 23 Jan 2024 04:06:19 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Tue, 23 Jan 2024 04:06:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zhukoff.net; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to; s=fm3; t=1706000779; x=1706087179; bh=SoRDa3IZlmi/aa/Pe1QIr
	fswTh3x1kFG71XX3IBo8Qw=; b=CtxKCPMNjXxlIUrb11wXIiZ0jDGLFbKilHho0
	TWCXqgMBIX71LAIb6QggXdGCaljl0/UI47iI2Td5dHGQyzfkDV2EASsM8LQTTAfE
	qFvGKAyx2A2f99+eOMz/qT9P/Lzc3vtfgqBw3LDFeCEfGQ1b/GKvHQwz7RgDwUy2
	b47BPzOQRNnTagCg1ayyF2bNTH0q805RV5gDfYOUxMwxSpUdesDIdpZGDEybkhv5
	zaqwdKs8rIU1iV6HiAPtKAnfFfM2/0jBYLIF9NWNwy7iXkWgdN0/b9T8TieqK75J
	Ksqq33gPNjSJjRuIcvIsYL5RCZ14Jdgat0iPp2gC/brZgUItw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1706000779; x=1706087179; bh=SoRDa3IZlmi/aa/Pe1QIrfswTh3x
	1kFG71XX3IBo8Qw=; b=qH6sgO9jV/uoVfweFjCtDNDr14STiS1rUc9Kh/HmeANc
	phY8UM4ZdefGvtppWRJ3LJMksYVWVvc4BlxvzarPDDoKCcD9fReckF+6upiGEVrF
	lW41Q+mw6HlqyctuXlgGeE8qjKSI1ZUtiLXxZqJE94Z8zmA/R2NHN+Il37wNgZlz
	Ju1vZkDvU9aMi4NWbhn5O7w9z/uCh7hm6dHxPxNXWJNXOMH1MdGn7vvJkCHODSRo
	3s4gRQm90baqjCDPcraQbLC/qcQYpPFaj6oxJPt9IZvigLtLnWZkO62PyY76iAmX
	FVOvSSbehhztdMJ9Tur07I3E8m6ez3LEVFUT51ZTQg==
X-ME-Sender: <xms:ioGvZVvXR80GpllCjTjNBVSayT9jNhLXXKRP0-B8YisIQI71Xlj4wg>
    <xme:ioGvZeeP7KyDDKbXlOXtVeBmJhQYUIciUrMJyGDLkaykXTbn5PPgqfzZMd-xST3fT
    ru_Abxr0R-HSRUqd54>
X-ME-Received: <xmr:ioGvZYwnVxyLimaFJrNVAyl53OaZQDniBZzca3qW8tVlt_2K2-MoRL5FRYvYVA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrvdekjedguddvhecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvvefufffkofgggfestdekre
    dtredttdenucfhrhhomheprfgrvhgvlhcukghhuhhkohhvuceophgrvhgvlhesiihhuhhk
    ohhffhdrnhgvtheqnecuggftrfgrthhtvghrnhepveefjeekjedugeeltdekjefhtedtfe
    ejueffheeikedvudfgtdffffelvddvfefhnecuvehluhhsthgvrhfuihiivgeptdenucfr
    rghrrghmpehmrghilhhfrhhomhepphgrvhgvlhesiihhuhhkohhffhdrnhgvth
X-ME-Proxy: <xmx:ioGvZcMKl4DBd3vQPr9rHDrZktNisrvEyQ_wyuuNGgEszOHTL1pK-w>
    <xmx:ioGvZV-LArZfH51eP7fsAycMwsxuWp6q3t_3IevurR4VNMuBhu9g5A>
    <xmx:ioGvZcVNxyZ1b8Q5gM8SkQrwyARpOZFqXlA39KD1_91OuQ1uFpIJeA>
    <xmx:i4GvZSEqVZyHab4BQQ-P8Xy7o4c9QYaOyaeWI3_DKTbXGh9Czd5h4g>
Feedback-ID: ib94946c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 23 Jan 2024 04:06:17 -0500 (EST)
From: Pavel Zhukov <pavel@zhukoff.net>
To: openembedded-core@lists.openembedded.org
Cc: Pavel Zhukov <pavel@zhukoff.net>
Subject: [PATCH] mdadm: Disable ptests
Date: Tue, 23 Jan 2024 10:06:13 +0100
Message-ID: <20240123090613.656612-1-pavel@zhukoff.net>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jan 2024 09:06:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194218

As agreed upon in the bug triage meeting, disable mdadm ptest for the time being

Related: [Yocto #15181] [Yocto #15159] [Yocto #15308] [Yocto #15309]

Signed-off-by: Pavel Zhukov <pavel@zhukoff.net>
---
 meta/conf/distro/include/ptest-packagelists.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index ef6f471e7b..7f949a467c 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -135,6 +135,7 @@ PTESTS_PROBLEMS:append:x86 = " valgrind"
 #    ifupdown \ # Tested separately in lib/oeqa/selftest/cases/imagefeatures.py
 #    libinput \ # Tests need an unloaded system to be reliable
 #    libpam \ # Needs pam DISTRO_FEATURE
+#    mdadm \ # tests are flaky in AB.
 #    numactl \ # qemu not (yet) configured for numa; all tests are skipped
 #    libseccomp \ #  tests failed: 38; add to slow tests once addressed
 #    python3-numpy \ # requires even more RAM and (possibly) disk space; multiple failures
@@ -147,6 +148,7 @@ PTESTS_PROBLEMS = "\
     libinput \
     libpam \
     libseccomp \
+    mdadm \
     numactl \
     python3-license-expression \
     python3-numpy \
-- 
2.43.0


