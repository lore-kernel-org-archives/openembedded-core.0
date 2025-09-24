Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0423CAC5A5
	for <webhook@archiver.kernel.org>; Wed, 24 Sep 2025 19:58:10 +0000 (UTC)
Received: from fout-a3-smtp.messagingengine.com (fout-a3-smtp.messagingengine.com [103.168.172.146])
 by mx.groups.io with SMTP id smtpd.web10.23814.1758743881334481359
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Sep 2025 12:58:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm3 header.b=gnt4ybBG;
 dkim=pass header.i=@messagingengine.com header.s=fm1 header.b=OEJ+GgRX;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.146, mailfrom: paul@pbarker.dev)
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfout.phl.internal (Postfix) with ESMTP id 75082EC00C6;
	Wed, 24 Sep 2025 15:58:00 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Wed, 24 Sep 2025 15:58:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm3; t=1758743880; x=1758830280; bh=lZ
	w3wf3fvC3+YuDuRfMA21+xPTYeB3/Txta3o89qFLY=; b=gnt4ybBG7Wr2DXidVY
	fwf3vg9tEICTM2SQx7CPNs8UK/EXrQAytEkKzGqiRfulG4cCJzMT03BSdKH43DSO
	vwRLZBVVyKi/dSzO0OZgSgH98u48JSNgPus9DVjpJMy0TVseVqinnvH5jjrk2GYt
	j1x7MIeS6NGAjK4gt64EUzUDsfvU5FqC0il89A2dxEgFV/RQxvXYp+ZABiLlAszW
	Kz9Engy5nCZsIlHsBMdoJI/s2O72RV4x7QrSsRORfWrXmFyWyDe+qdEt9UVnB8CT
	djIYnEwRfbYwJHuT7qz6dLiMkqkPiczaEnvJiiZOmw94ZY+7b+iUxBg/p/DsBlUZ
	kBLQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1758743880; x=1758830280; bh=lZw3wf3fvC3+YuDuRfMA21+xPTYe
	B3/Txta3o89qFLY=; b=OEJ+GgRXpTIFqE+6Ge3sjjSJD8jQm65VN0mOUZ3eWhxp
	g8oH1BokYB71x7obMT8YoR3Co/Jx+4qy/wA7BeYJ+YRVJDOBAAjBcCqH+FBkrk0r
	VYtE99jP/v8e/twTJyuV6Cwu1VAW6Bmj6Lzk//uATlKvg0rZkZLDFxMjtml3uMz4
	xORzwIWJmr8rZDp6CrUZ5AAufRB1wadP503FUO8qd5aZgmvBjhvUvGUSdGNWGfcx
	8o73XhVunxJGtxOU6uoomgq8F7QMJHyUzvw4hoy92sTGAw/tbJQazb1E+UdfZ68U
	miH2uljAiFZqRwUuQNAm3Tmtib4n+yasws4Qe1PWww==
X-ME-Sender: <xms:R03UaL9swAlXzkfGLFh3t26Z4m1POi7BhuvLVYdq8l-hrRF66BcbnA>
    <xme:R03UaK_vMx8_sl7tEPIOWKsqbSWiGmqxLhtu8tBB-WYX0pvb0FaLe_3w1OJcH2ltV
    ERz8qpXWcT2uMpf7O-pFsJlU0109UH1GTaK6SM9Ldtuk_Nug1gBmps>
X-ME-Received: <xmr:R03UaCfLkpK-MOjzdWUWkMrKxBlmzS_HpJGQ-_jwapGOBgEWg0K7Fr-xOiFcsHbIVDcIrNfC1abP646qS15Z3Fs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdeigeehudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefhufffkfggtgfgvfevofesthejredtredtjeenucfhrhhomheprfgruhhluceurghr
    khgvrhcuoehprghulhesphgsrghrkhgvrhdruggvvheqnecuggftrfgrthhtvghrnhepje
    duueevffdtudejgeeiffduhfefgfdvheehtdduiefgjeelleelvddtkeeuhfejnecuvehl
    uhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgruhhlsehpsg
    grrhhkvghrrdguvghvpdhnsggprhgtphhtthhopeefpdhmohguvgepshhmthhpohhuthdp
    rhgtphhtthhopehtghgrmhgslhhinhessggrhihlihgsrhgvrdgtohhmpdhrtghpthhtoh
    epohhpvghnvghmsggvugguvgguqdgtohhrvgeslhhishhtshdrohhpvghnvghmsggvuggu
    vggurdhorhhgpdhrtghpthhtohepphgruhhlsehpsggrrhhkvghrrdguvghv
X-ME-Proxy: <xmx:R03UaDEFW8-HGo8j_moNovc3lU0rE5scaedrVbUof7yvj9f-KuuDMg>
    <xmx:R03UaAe9KGKzjO1e6JsnM2lStsNbL4gXchleX0ia_F_O7QpLsbe-JQ>
    <xmx:R03UaNHPcyfNsdy1L_9aazDACUdlQrmCPQDgQmI6Tmrhz9nbLPeatQ>
    <xmx:R03UaJUC4A6FUAoMOJqbZeN_dDEQeG7MT6_U1uMMcW_5l-vnOZjCJg>
    <xmx:SE3UaHk5YVbdX_E_WYbe7iMORJMfm2iEwIpgTYkV2gU9ANmdXk6d6IiD>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 24 Sep 2025 15:57:59 -0400 (EDT)
From: Paul Barker <paul@pbarker.dev>
Subject: [PATCH 0/2] Minor fixes for bitbake-layers & patchtest
Date: Wed, 24 Sep 2025 20:57:45 +0100
Message-Id: <20250924-minor-fixes-v1-0-affc85657a66@pbarker.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADlN1GgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDSyMT3dzMvPwi3bTMitRi3SRTs2RLszRDo8RkQyWgjoKiVLAEUEN0bG0
 tAAHqE4JdAAAA
X-Change-ID: 20250924-minor-fixes-b56c96f12ac1
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <paul@pbarker.dev>, Trevor Gamblin <tgamblin@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=803; i=paul@pbarker.dev;
 h=from:subject:message-id; bh=EHXOnocynHTa3YAbvve78UpbV9sKlQdnsy5SUdBaiXM=;
 b=owGbwMvMwCW2OjnkzdxdX/IYT6slMWRc8XUruae8XSLg5TRr34iv+26dbRHMDbLl+xqxc2WHO
 l/Qj++cHaUsDGJcDLJiiiybe77ef9rryJsRcksBZg4rE8gQBi5OAZhIXSnD/wIusbqXBzP3bV4T
 JB135tSG/PhP05szGDZO1uFyZNV6HsrwVzZ7dWHL+3DeHV+WP3JfXWpvlhMZ/Ujm7+OOnmtrpgu
 rsAMA
X-Developer-Key: i=paul@pbarker.dev; a=openpgp;
 fpr=98B2AAC100AC3F82BB5D546774975C81B7E66BAC
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Sep 2025 19:58:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223983

I spotted these two issues while working on master, they're both fairly
trivial fixes.

I've tested `bitbake-layers create-layer` and `patchtest` locally after
these changes, there should be no impact outside of these two commands.

Signed-off-by: Paul Barker <paul@pbarker.dev>
---
Paul Barker (2):
      bitbake-layers/create: Improve help message for layerid argument
      patchtest: Use raw strings for regex patterns

 meta/lib/bblayers/create.py              |  2 +-
 meta/lib/patchtest/patchtest_patterns.py | 20 ++++++++++----------
 meta/lib/patchtest/tests/test_mbox.py    |  4 ++--
 3 files changed, 13 insertions(+), 13 deletions(-)
---
base-commit: e18d697e92b55e57124e80234369d46575226386
change-id: 20250924-minor-fixes-b56c96f12ac1

Best regards,
-- 
Paul Barker


