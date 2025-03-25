Return-Path: <pavel@zhukoff.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B421C36008
	for <webhook@archiver.kernel.org>; Tue, 25 Mar 2025 09:40:41 +0000 (UTC)
Received: from fout-a6-smtp.messagingengine.com (fout-a6-smtp.messagingengine.com [103.168.172.149])
 by mx.groups.io with SMTP id smtpd.web10.61918.1742895633799542530
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Mar 2025 02:40:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@zhukoff.net header.s=fm3 header.b=c/sK35sX;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=d/S+1ej3;
 spf=pass (domain: zhukoff.net, ip: 103.168.172.149, mailfrom: pavel@zhukoff.net)
Received: from phl-compute-03.internal (phl-compute-03.phl.internal [10.202.2.43])
	by mailfout.phl.internal (Postfix) with ESMTP id 03B5B1383A0D;
	Tue, 25 Mar 2025 05:40:33 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Tue, 25 Mar 2025 05:40:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zhukoff.net; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to; s=fm3; t=1742895632; x=1742982032; bh=QAzLWUB6twqsdT5HnIx4P
	mc5yaSZHjQNjKGJA8/qE+o=; b=c/sK35sXoO4TySn4wbW9f5WqRsAFJbeb+d43x
	8L7bEcoGRqf0BBn9OOMsDqbPQ23Lv1knRpesxt+oKz1pniMibcsk57Owaw0o6fQx
	Mrhs4Xl4Aw7xTwxqh6zfLMDO4QgN97zZUljyusadTXr2JH2vJuMq/4MwSV+I60gv
	pQXpp8ZAi/Yhg3dMADsvr6EMs9vKMVQ2sQlGjjnbE4CyFv1coE+oGY19qWs0Kp0R
	MevXW84ZoQriefzdejl5VGHyEIVZv2289tFr9QCWk5io9HVxXJPz/gTz3CaARChb
	S3J3cqD7ld5MPZPnxsGOGyMYNb+QK/Yltl4xD+OqyNwwHpG7g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1742895632; x=1742982032; bh=QAzLWUB6twqsdT5HnIx4Pmc5yaSZHjQNjKG
	JA8/qE+o=; b=d/S+1ej3Xs4Waig9+YCesWqdxBmh6tsZYZbAMBIR+jdJ7CBcMd9
	k+Y2wpZifUf+GU4pAQqRUtC+O65JuQ3xpUmeDX4ZwBS2XYTYlytw62BxNxH8Twfe
	e51aNunUCjj76sijtezifF0IlDW8ZwRgcT11sH41iwg4qKLstoh+sGZjKrd6wZK/
	9m2FLi9J5tTt9hIsWr9tSaC8P+yLCqz2v6rpzwZAY3tajbYC38okJxl3t5Z5j5Z4
	tiqQP9Fcys35YnuNavk5OURxzOqULVSrpYTGqGlk1C0KGEOS/tYOGkNMX4flQAfZ
	Cj4DyIe3w9Dub0bY1tijmlCJQRRZxaX0bwg==
X-ME-Sender: <xms:EHriZ0kHAUjir_VUojEMWR0ssRn5IrrDQy9n4ojW1BxEVm_CDBOBvw>
    <xme:EHriZz3MPeLHkG2qXnHgFRPyf4W53j1tnD3k6Cvw-fHIA4c9wC67oowwWv3epYUc9
    VZaFwCLGGLFSCrA65U>
X-ME-Received: <xmr:EHriZyoca__SLZ9pSQFPGTEjAKJK7882AyLfivpasIAIRLmkFQm1JvN66OqfVGVcFrmmGFOcsnvYblKG9D-->
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduiedvfedvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucenucfjughrpefhvf
    evufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefrrghvvghlucgkhhhukhhovhcu
    oehprghvvghlseiihhhukhhofhhfrdhnvghtqeenucggtffrrghtthgvrhhnpeevfeejke
    ejudegledtkeejhfettdefjeeuffehieekvddugfdtffffledvvdefhfenucevlhhushht
    vghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehprghvvghlseiihhhukh
    hofhhfrdhnvghtpdhnsggprhgtphhtthhopedvpdhmohguvgepshhmthhpohhuthdprhgt
    phhtthhopehophgvnhgvmhgsvgguuggvugdqtghorhgvsehlihhsthhsrdhophgvnhgvmh
    gsvgguuggvugdrohhrghdprhgtphhtthhopehprghvvghlseiihhhukhhofhhfrdhnvght
X-ME-Proxy: <xmx:EHriZwkmhKNPZ1Q05GsDoopqeS7ebjTQhe-K-_oXBKcEZAQJQu-BHg>
    <xmx:EHriZy0MAHScNKUt2GgHJ4yabaXy8_t1A0CBvvUVthnmJ4CEfQO96w>
    <xmx:EHriZ3s5WC--QFMOoX7WuxSzEasYj3NUuPpptx7kaEFE6mvfEVsOGg>
    <xmx:EHriZ-WMNobMxAfgRloC-MxSc3cWCNBhOeWP1qkQUN5rXEir8Ob-wg>
    <xmx:EHriZwCS3W3XZOOzmSek5T7bhO3RHoUTTVcHLD1IFfN6jhnkeKLAf4k0>
Feedback-ID: ib94946c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 25 Mar 2025 05:40:32 -0400 (EDT)
From: Pavel Zhukov <pavel@zhukoff.net>
To: openembedded-core@lists.openembedded.org
Cc: Pavel Zhukov <pavel@zhukoff.net>
Subject: [PATCH] overlayfs-etc: Unmount /sys and /proc before init
Date: Tue, 25 Mar 2025 10:40:14 +0100
Message-ID: <20250325094013.3926549-2-pavel@zhukoff.net>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Mar 2025 09:40:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213601

/sys filesystem mounted by the preinit script causes shadowing of
/sys/firmware/efi/ by double /sys mounting on systemd enabled systems
[1]. As the result EFI tooling is broken

[1]
sysfs on /sys type sysfs (rw,nosuid,nodev,noexec,relatime)
efivarfs on /sys/firmware/efi/efivars type efivarfs (rw,nosuid,nodev,noexec,relatime)
sysfs on /sys type sysfs (rw,relatime)

Signed-off-by: Pavel Zhukov <pavel@zhukoff.net>
---
 meta/files/overlayfs-etc-preinit.sh.in | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/files/overlayfs-etc-preinit.sh.in b/meta/files/overlayfs-etc-preinit.sh.in
index b05e3957a3..973887649a 100644
--- a/meta/files/overlayfs-etc-preinit.sh.in
+++ b/meta/files/overlayfs-etc-preinit.sh.in
@@ -48,5 +48,8 @@ else
     echo "PREINIT: Mounting </data> failed!"
 fi
 
+umount /sys
+umount /proc
+
 echo "PREINIT: done; starting </sbin/init>"
 exec {SBIN_INIT_NAME}
-- 
2.48.1


