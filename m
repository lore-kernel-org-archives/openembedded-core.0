Return-Path: <andrei@gherzan.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34EF3C433EF
	for <webhook@archiver.kernel.org>; Mon, 28 Feb 2022 23:54:54 +0000 (UTC)
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by mx.groups.io with SMTP id smtpd.web11.2472.1646092492829428909
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Feb 2022 15:54:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gherzan.com header.s=fm1 header.b=pAllaMDg;
 spf=pass (domain: gherzan.com, ip: 66.111.4.28, mailfrom: andrei@gherzan.com)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.nyi.internal (Postfix) with ESMTP id 0ED7C5C02A6;
	Mon, 28 Feb 2022 18:54:52 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Mon, 28 Feb 2022 18:54:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gherzan.com; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:sender:subject:subject:to:to;
	 s=fm1; bh=hDDEYqmGFX3xngjlpTsFafIGNFYePYam6gGBsb/9ft4=; b=pAlla
	MDg8gYniCbO1d0iXRVGPL/RvfxfUQzrb+fVR2EfqJHcpdlpZMvYAYGKvJA09ztd2
	i0gOi+mNT7B/hg6p6LJ069a53WYi9eIyPfLOjExJBTkvR+j2S9hZZ9RFdREGAB8e
	bVrKL9s6ImGZeZ6J/ymPgxlmzNNtOzvrg1dljdUWlFJtFS/CeC4h7WYx+LTE5gYb
	JOLCJw4Z5t9UUqAGEN0JWorCYowlcXlvvihDWlQcfH9LTRoQTcW9xlzHY4pcDzNA
	teJsvplUHCcBELr6REgH3x3dkiKmVv4X0T+CI9R/EHUWz85K9605u/OY3pP+XaFi
	ivSeppQvUqQvpec2A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:from:from:in-reply-to:message-id:mime-version:reply-to:sender
	:subject:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; bh=hDDEYqmGFX3xngjlpTsFafIGNFYeP
	Yam6gGBsb/9ft4=; b=YyeSLzhsVELNtw+aZl2OlyiqH/QitYTOqfb3ToVimv+b0
	RpwGf2HH9/fvRm+u8ZPKZP25+gbXnEI3aZ9ktmKWTrps9r4s/9UwLjj7KJF7HKFv
	QtVR7sKzTC9enCktkuvAy/m9fw3uzg2uyolAfuBgbAryi9D9rTCenJDZrD1hM4eD
	0PGMS527VpfUTdcUSvPjSY1+Lsm/V9bNZCt+xEjw6v9QSBi2/+JrUoYfPLsdA05H
	jxZ6kbNkIgZ8ZU8UXuPQczzBR2ctF2717Uyey6uiFM2X3W3cExGflblX2oIA3mOl
	jAPDQoRe8i58kz9InUVNuQ++JoDzIKRt7Dmm8/S7g==
X-ME-Sender: <xms:y2AdYl3bKX6G3YCSb0Vj7dWhx8Odnfide1SJY8VJvq2LAgvRAF24IQ>
    <xme:y2AdYsEQmnqKM0n3d8FBGUYvFzwW0_Hk-h1G5Ba3j_1U8SGClyztCe4ijqW40is0H
    nT-QLzgh8Kercl4buo>
X-ME-Received: 
 <xmr:y2AdYl7g8mWnsw1cD69i9lFrhhkDcyyyoNFFX8z_Yl7EpmipuejNrDfA4c5ASeOejnVFdluknpEOgzIQLgAJ784PeYR343YZeTsBSwAvsmFIprVW5cnoPPHh>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvvddruddtuddgudegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgggfestdekredtre
    dttdenucfhrhhomheptehnughrvghiucfihhgvrhiirghnuceorghnughrvghisehghhgv
    rhiirghnrdgtohhmqeenucggtffrrghtthgvrhhnpeelueefieelfeelledugeeuffekke
    duleejffeiheefkeehuedviefggfehhedtkeenucffohhmrghinhepghholhgrnhhgrdho
    rhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hnughrvghisehghhgvrhiirghnrdgtohhm
X-ME-Proxy: <xmx:y2AdYi1oiT0OYVnw-5WWtzK7GIOzQeTREyKJlbRfXJhrVlBoDLSgOw>
    <xmx:y2AdYoGN2fJ3i_r6AkSnWzfgI0oxZk53D6MuU5C0yqBHEC2Q-5kiPw>
    <xmx:y2AdYj_Cla2058a6uCp1N5UKLtTMw81AsTFUfqhpekqInwLJoPlGMg>
    <xmx:zGAdYiNsQmNAkmTOZ9w5yLoZX2d7MDuuC845jZcRqnkvR3ZpKzrRiw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 28 Feb 2022 18:54:51 -0500 (EST)
From: Andrei Gherzan <andrei@gherzan.com>
To: openembedded-core@lists.openembedded.org
Cc: andrei@gherzan.com,
	Andrei Gherzan <andrei.gherzan@huawei.com>
Subject: [PATCH 1/1] go.bbclass: Allow network in do_compile
Date: Tue,  1 Mar 2022 00:54:33 +0100
Message-Id: <20220228235433.3948994-1-andrei@gherzan.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Feb 2022 23:54:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162517

From: Andrei Gherzan <andrei.gherzan@huawei.com>

Compile pulls in the go.mod list requiring network. Without this, do
compile would fail with a similar error to the following:

dial tcp: lookup proxy.golang.org: Temporary failure in name resolution

Signed-off-by: Andrei Gherzan <andrei.gherzan@huawei.com>
---
 meta/classes/go.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/go.bbclass b/meta/classes/go.bbclass
index 9c4c92bffd..dc246c72cb 100644
--- a/meta/classes/go.bbclass
+++ b/meta/classes/go.bbclass
@@ -113,6 +113,7 @@ go_do_compile() {
 }
 do_compile[dirs] =+ "${GOTMPDIR}"
 do_compile[cleandirs] = "${B}/bin ${B}/pkg"
+do_compile[network] = "1"
 
 go_do_install() {
 	install -d ${D}${libdir}/go/src/${GO_IMPORT}
-- 
2.25.1


