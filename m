Return-Path: <jsbronder@cold-front.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FDF7D2C13E
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 15:38:03 +0000 (UTC)
Received: from fhigh-a6-smtp.messagingengine.com (fhigh-a6-smtp.messagingengine.com [103.168.172.157])
 by mx.groups.io with SMTP id smtpd.web10.22961.1730821082017960440
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Nov 2024 07:38:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cold-front.org header.s=fm1 header.b=lUfAP5BY;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=eV9g69e5;
 spf=pass (domain: cold-front.org, ip: 103.168.172.157, mailfrom: jsbronder@cold-front.org)
Received: from phl-compute-02.internal (phl-compute-02.phl.internal [10.202.2.42])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 13D75114013D;
	Tue,  5 Nov 2024 10:38:01 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Tue, 05 Nov 2024 10:38:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cold-front.org;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to; s=fm1; t=1730821081; x=1730907481; bh=uGoSVa9K6f
	LaW7j61NpSIa/wpkIBQpY9EPiuUEcqXJk=; b=lUfAP5BY0SkvwFb10IgJU+cWM3
	Q7l9tMyPJJEU+N8qlo8p1ilyxWIC7ZAL6S1bae59lUPuJU8b262e5Yd78vdJSWOV
	lf18Y5Kw358VAzKMszY/6UawDbii3M2WbUxKwPBXFU/qxixE1q6OW++jIimFiYJG
	7ccOrsHxCXff8PnRyM4b2cWeKvlpxC8LMr8d+UdGVB2Id6l8VMiCJ4wHB9/bFzme
	mv9JbGhrQJrk6TI9k4UGaLjBVZ0jYDTRG4P0YTP+Czyeg3IrHKq/F0WJh24DKrAk
	PIx+zFZMIBLvQOEpKKaYKoASIciF7BxrU4SOWUTqG5JioiLwQd06w5jU7GGg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1730821081; x=1730907481; bh=uGoSVa9K6fLaW7j61NpSIa/wpkIBQpY9EPi
	uUEcqXJk=; b=eV9g69e5hAb+J/7PyIneymQaMVwTj9BRVUZ8d52i/6gxOgT6+AJ
	6KwtXo94CZthXh4xSVUK7oNxZwGS3jrdQ4oQ4oqogHPp7bVhm3+jwd/OvaipCX4W
	ZnsipEkLO+9gou7M8LMpAy9ctaJAjNGq8YwoF5i1Lx+wRLjR61J3JNm7zGYzHmdv
	1teV1qpDS5RLBQRaSiqUd3BPMH4gY6BzBrikrbzELv1ZAEk9YFcLtFhxcxYpmPJa
	mcKdJLNXnGek7MpY9rW59uKMfOjp1h4t+1Eeq3hpK0BChDXIJ9l8YzzqVKzG8KC5
	U3YseJ5fWA2bbXlZpHSgjPG2Eu6yZVho4CQ==
X-ME-Sender: <xms:2DsqZ2z3Opd9Q2SFL4W8nnuBBTrbA6dBCXjJc7dJi_AdGBf442_bMg>
    <xme:2DsqZyR97GUb4McJJXeln1-PppAtZWRP24Sx3slw10YVBA46xXwAzLMv10xODBWpZ
    fg1-4E5utgK3nCM0g>
X-ME-Received: <xmr:2DsqZ4X4r2pVSxIahw7AjuEjP2VEqC8NZkjGGxyE7yle5r_ZJMYEIJFyeTlKO1MMXZHvek4JpU2KVU6MPp_QfObgmjNpeBKVJxnE1PX4EA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrtddtgdehtdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdpuffr
    tefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecunecujfgurhephffvvefuff
    fkofgggfestdekredtredttdenucfhrhhomheplfhushhtihhnuceurhhonhguvghruceo
    jhhssghrohhnuggvrhestgholhguqdhfrhhonhhtrdhorhhgqeenucggtffrrghtthgvrh
    hnpedvteeukeegueevffekfeelgeeifefguddtudeitdelteffhefftefflefhteejveen
    ucffohhmrghinhepohhpvghnvghmsggvugguvggurdhorhhgpdhgihhthhhusgdrtghomh
    enucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjshgs
    rhhonhguvghrsegtohhlugdqfhhrohhnthdrohhrghdpnhgspghrtghpthhtohepvddpmh
    houggvpehsmhhtphhouhhtpdhrtghpthhtohepohhpvghnvghmsggvugguvgguqdgtohhr
    vgeslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhgpdhrtghpthhtohepjhhssg
    hrohhnuggvrhestgholhguqdhfrhhonhhtrdhorhhg
X-ME-Proxy: <xmx:2DsqZ8i6sztA1BSU3kABa23RyRrYznMjvw_g1hUzjTml2GQh4TjXOw>
    <xmx:2DsqZ4D7-cFhI6R1wd6TgmbPw4EHn_37aZWuH8odPT6y_UzB0WKQkQ>
    <xmx:2DsqZ9KxS4pgrZ1U8Gat0_LpiLtC2d-CPmu8yceO1jlWY35gGEPgnA>
    <xmx:2DsqZ_DzMmCSHlk5emYIywC9NBuhoQ54xBJHCGmGh7jYZ69GSr2V_g>
    <xmx:2TsqZ7P4uNoyLBh_VP1cxZHkrAk00FtFGMaGGsoNh9s_VpBPs6VluAiK>
Feedback-ID: iea0042cb:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 5 Nov 2024 10:38:00 -0500 (EST)
From: Justin Bronder <jsbronder@cold-front.org>
To: openembedded-core@lists.openembedded.org
Cc: Justin Bronder <jsbronder@cold-front.org>
Subject: [PATCH] bitbake.conf: require lz4 instead of lz4c
Date: Tue,  5 Nov 2024 10:37:52 -0500
Message-ID: <20241105153752.3610957-1-jsbronder@cold-front.org>
X-Mailer: git-send-email 2.46.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Nov 2024 15:38:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206715

With bitbake commit 'bb: compress: use lz4 instead of lz4c' we require
lz4, not lz4c [1].  Going as far back as Ubuntu 16.04/Fedora 25, they
are packaged together so it should be safe to simply adjust the
requirement from lz4c to lz4.

Note that the two are largely the same, but upstream has considered lz4c
deprecated since at least 2018 [2].

1. https://git.openembedded.org/bitbake/commit/?id=907472034b344e4eb73cfd43059a413469f52e1c
2. https://github.com/lz4/lz4/pull/553

Signed-off-by: Justin Bronder <jsbronder@cold-front.org>
---
 meta/conf/bitbake.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index eda505c861..14e761e2e7 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -517,7 +517,7 @@ HOSTTOOLS += " \
     [ ar as awk basename bash bunzip2 bzip2 cat chgrp chmod chown chrpath cmp comm cp cpio \
     cpp cut date dd diff diffstat dirname du echo egrep env expand expr false \
     fgrep file find flock g++ gawk gcc getconf getopt git grep gunzip gzip \
-    head hostname iconv id install ld ldd ln ls lz4c make md5sum mkdir mkfifo mknod \
+    head hostname iconv id install ld ldd ln ls lz4 make md5sum mkdir mkfifo mknod \
     mktemp mv nm objcopy objdump od patch perl pr printf pwd \
     python3 pzstd ranlib readelf readlink realpath rm rmdir rpcgen sed seq sh \
     sha1sum sha224sum sha256sum sha384sum sha512sum \
-- 
2.46.1


