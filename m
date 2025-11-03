Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74410CCF9F8
	for <webhook@archiver.kernel.org>; Mon,  3 Nov 2025 20:11:37 +0000 (UTC)
Received: from fout-b8-smtp.messagingengine.com (fout-b8-smtp.messagingengine.com [202.12.124.151])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1179.1762200692527613865
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Nov 2025 12:11:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm1 header.b=TpLpwTLB;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=UjaHxa0W;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.151, mailfrom: paul@pbarker.dev)
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.stl.internal (Postfix) with ESMTP id B87551D00436;
	Mon,  3 Nov 2025 15:11:31 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Mon, 03 Nov 2025 15:11:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm1; t=1762200691; x=1762287091; bh=Kn
	uoXnAz+6rr+5ibhBj/BNt19L/05FC+TA7QsVz+E9c=; b=TpLpwTLBzWo7tQEyU1
	Iju8iv7Ocj0joPurM0KZ7xS3eKXq5reLeEwF+OESRtdh0nLUuCviPX9iiRqZ8bim
	yKK8WI55hAKM5hyWTzqoeQBkrWdPOZLPTkmfqtXdDCp9jCgj/5o4mQ5AZ+HiAdIn
	tYx/g1/RsrKf0ii7FFmdoIbvhsihYEmxbicsenZiaGhfSJypJAz5yegVmVumN+Ke
	tC7ccYmTI0Ylnfp/gokfiabcGB4HIPNsMdxeC4wHId4qgTapB4qgvxuT/TRhYXob
	UMPhPMmVqge75P8ggJKhAS1SKgDoNGHKw8dMh6nGSVuAr/TEkdz8jLqhZS9XFxLy
	fP4w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1762200691; x=1762287091; bh=KnuoXnAz+6rr+5ibhBj/BNt19L/0
	5FC+TA7QsVz+E9c=; b=UjaHxa0WcJFSLMSMiFZUEwAm1d3EoLKoVWHQjScgkRHG
	We259BJU2JzVk93Bz83gzhsU0hOK52zgB9+tMI/eVPhn7JIydyRUpTyrzOn6wMQe
	Uf1NQTCuC704ueqqlG7edo5bb11pFly1/d5uac2Omfph367syAu/5stqZi5xyDY1
	YIMqdW1ejrARBDJ6MF2JoVh60NLOW9d0qc7r1ks0gDcDTWyPyYGCz/IpDKTEMmA6
	5WXeYZSnpRyfWAJImdF8ZjEAXjTo9PPT6ZKZna9Xl/ABOCDKw6k3Bx/hFwrOuoKv
	WH5jWKkYWRcW/u/lIOEtuai/cDA24/FMb8k2D4QT/Q==
X-ME-Sender: <xms:cwwJaWJfcYZ4KTNVRe7xZbFQkjRt6gZBOocpJuuvzXhrwTpPbMQUDQ>
    <xme:cwwJaVJpfmffMlA5C0n_E7Itty_lI4_P8iCZ6kTOzUwn3BE0zgS41FoXcXse5Iru2
    lnl5UDJV15tleSmMUMOpq6KrO8uYug69r4lyG7F83CJeA6Ow2cuhQL8>
X-ME-Received: <xmr:cwwJabuR9ER_oqq1yqxj1riozvmBVOOKUuyzsU1N4P1yT7ApVlIOQY8tAY7_4OJ1e5xYbykyoq3-ZebjGmKsqik>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddujeeltdeiucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephfffufggtgfgkffvvefosehtjeertdertdejnecuhfhrohhmpefrrghulhcuuegr
    rhhkvghruceophgruhhlsehpsggrrhhkvghrrdguvghvqeenucggtffrrghtthgvrhhnpe
    ffudeifeffffelhfetieekteetvedtheeuffdtleehuefhtdelueeggfdvteehteenucff
    ohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrg
    hrrghmpehmrghilhhfrhhomhepphgruhhlsehpsggrrhhkvghrrdguvghvpdhnsggprhgt
    phhtthhopeegpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegrlhgvgidrkhgrnh
    grvhhinhesghhmrghilhdrtghomhdprhgtphhtthhopehprghulhesphgsrghrkhgvrhdr
    uggvvhdprhgtphhtthhopehrihgthhgrrhgurdhpuhhrughivgeslhhinhhugihfohhunh
    gurghtihhonhdrohhrghdprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdqtghorhgv
    sehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrgh
X-ME-Proxy: <xmx:cwwJaaQclHKPnX0X9PBZS_st1HF5txB8XINWXFYsXKGYVFjBOHfKqQ>
    <xmx:cwwJaZO_PCfBP1zsZlPjv0gp_xcQ0Lp8HAg8KDaxJ1JfIyh9GEta7w>
    <xmx:cwwJaXbxFa2OA-1Pcn_AMVtXWqFnmBTFaEYxAdB1sA1AvfRLGvdcvA>
    <xmx:cwwJabzm-t2gK5bG0S-Ckm0ENaH2dw4yyVSKZfyPF_qCK5mWtZLZbg>
    <xmx:cwwJaRtzXJKPUxTexPNq6wY6GUzwK2k-aauKHmDgWz7VwyuLvNYMLHmS>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 3 Nov 2025 15:11:30 -0500 (EST)
From: Paul Barker <paul@pbarker.dev>
Date: Mon, 03 Nov 2025 20:11:20 +0000
Subject: [PATCH v2] pseudo: Add hard sstate dependencies for pseudo-native
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251103-fix-pseudo-native-v2-1-67564bcaff0f@pbarker.dev>
X-B4-Tracking: v=1; b=H4sIAGcMCWkC/32NQQ7CMAwEv1L5jFFsAghO/QfqIaQOtZDaKikRq
 MrfCX0Ax1ntzq6QJKokuDYrRMmadBor8K4BP7jxIah9ZWDDRzJ0wqBvnJO8+glHt2gWZKYgh+B
 FnIW6m6PU0ua8dZUHTcsUP9tFpl/6z5YJCc/esgvmYom5ne8uPiXue8nQlVK+feGzP7QAAAA=
X-Change-ID: 20251016-fix-pseudo-native-221fe3fceea4
To: openembedded-core@lists.openembedded.org
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
 Alexander Kanavin <alex.kanavin@gmail.com>, Paul Barker <paul@pbarker.dev>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1900; i=paul@pbarker.dev;
 h=from:subject:message-id; bh=CI+yjUje3PXpdL/J9vfBMFpG7mCmmAvN854wxeZmyjE=;
 b=owGbwMvMwCW2OjnkzdxdX/IYT6slMWRy8hT97eDL7ebvPm73SezwwaV8uyMFpd8d1n0/icW4R
 cyYcevGjlIWBjEuBlkxRZbNPV/vP+115M0IuaUAM4eVCWQIAxenAEyk/TbD/3D7M38tJp9/orHy
 6t4NZvPnXrvZ9sNyy68ZIWKmn48VV79n+Cuoo1vy6kGs8Gn+GWFW71Nvln9c9uFQTtfbbPVUcaZ
 7vzkA
X-Developer-Key: i=paul@pbarker.dev; a=openpgp;
 fpr=98B2AAC100AC3F82BB5D546774975C81B7E66BAC
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Nov 2025 20:11:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225695

Where a task (such as do_package) runs under fakeroot, the corresponding
setscene task (do_package_setscene) will also run under fakeroot when
restoring from sstate. Assuming pseudo is used as the fakeroot
implementation, we need pseudo-native and all its runtime dependencies
to be available in the sysroot before running any setscene tasks under
fakeroot.

We already add a hard dependency from all do_package_setscene tasks to
virtual/fakeroot-native:do_populate_sysroot in base.bbclass, but this
does not cover transitive dependencies. So, extend the dependencies of
pseudo-native:do_populate_sysroot_setscene to ensure that the sqlite3
library is also available in the sysroot before running fakeroot
setscene tasks.

[YOCTO #15963]

Signed-off-by: Paul Barker <paul@pbarker.dev>
---
Changes in v2:
- Drop hard setscene dependency on attr-native, it's not needed
- Link to v1: https://lore.kernel.org/r/20251016-fix-pseudo-native-v1-1-7c42af094122@pbarker.dev
---
 meta/recipes-devtools/pseudo/pseudo.inc | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/recipes-devtools/pseudo/pseudo.inc b/meta/recipes-devtools/pseudo/pseudo.inc
index 22c934977d9b..836e910fae4a 100644
--- a/meta/recipes-devtools/pseudo/pseudo.inc
+++ b/meta/recipes-devtools/pseudo/pseudo.inc
@@ -155,3 +155,10 @@ do_install:append:class-nativesdk () {
 }
 
 BBCLASSEXTEND = "native nativesdk"
+
+# Setscene tasks which run under fakeroot must not be executed before
+# pseudo-native and *all* its runtime dependencies are available in the
+# sysroot.
+PSEUDO_SETSCENE_DEPS = ""
+PSEUDO_SETSCENE_DEPS:class-native = "sqlite3-native:do_populate_sysroot"
+do_populate_sysroot_setscene[depends] += "${PSEUDO_SETSCENE_DEPS}"

---
base-commit: 58558b97c157469f060bb2ad59a40254fb6181e4
change-id: 20251016-fix-pseudo-native-221fe3fceea4

Best regards,
-- 
Paul Barker


