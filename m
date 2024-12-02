Return-Path: <peter@pjd.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCEFFD10DB4
	for <webhook@archiver.kernel.org>; Mon,  2 Dec 2024 08:06:37 +0000 (UTC)
Received: from fhigh-a8-smtp.messagingengine.com (fhigh-a8-smtp.messagingengine.com [103.168.172.159])
 by mx.groups.io with SMTP id smtpd.web10.168588.1733126794910027339
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Dec 2024 00:06:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pjd.dev header.s=fm2 header.b=KBu/JyMZ;
 dkim=pass header.i=@messagingengine.com header.s=fm1 header.b=Oqm7BYRg;
 spf=pass (domain: pjd.dev, ip: 103.168.172.159, mailfrom: peter@pjd.dev)
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 2D52A114015B;
	Mon,  2 Dec 2024 03:06:34 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-10.internal (MEProxy); Mon, 02 Dec 2024 03:06:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pjd.dev; h=cc:cc
	:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1733126794; x=
	1733213194; bh=9qJZQpJlGOlGNJwZkYfkCsHe9gRqfBXavaipgtrkOCY=; b=K
	Bu/JyMZfkqtE8R+H10WhMBeNkut0GX9iDMBpT6FC9KtlGIBxtWLSEHxmmOa3x5PX
	T93X0SbbfOKpHkhkroJ8nXW2KY3OUqaGlGE4EWktFV30mjveu7jpmQ8K9zSODX8X
	48TAqkcIDzUuIOba1UdgIVtz4mf9Q4Au1/JTNYIL2oSseZz0S1zE+uT1caG9Y4mG
	dw71YmeJnBZaQDc3+kJCB+bPegNqtQq9cOJrkzrzJY+0gAWdWgYo+NppIpIt83vR
	8n9m2DqFGd1OTkRZY+cR9Zs7q3ntwT9pIfcTyodjIfSihgI+nxjjaqCS8701UgBk
	3iCjMPuZWmerM5at72BZw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1733126794; x=1733213194; bh=9
	qJZQpJlGOlGNJwZkYfkCsHe9gRqfBXavaipgtrkOCY=; b=Oqm7BYRgZqmDwOrry
	iYOIqlT4DwSoSl4Jv9AIG2Yx2TVuvtDYOBh+CcxGi+HKTSDfWEFpMLADWjVAqA3p
	pSbun+TWVb70cFbyzEHAg1DrD6NUJpV2Xx5hAKGIER3y61rTRj/oDQd/OIJ+6Fh4
	DwPKOIxNG61QYqtF4qUs9h469Z0i7jbLDlIDGt9QDAZBaIj0wm1JERQymYd8sTmC
	2Erw/1g1F4FAvM1v0YjHgZZiHpR+s2ckbT9Tyg7ZO+nAx/gCfNnpIS/o93t27pcM
	6UJf4U7jmXJ/ebgrKcnDGx0rLi5eTXdw2nGgJQUSaZtl2rc+Y0y/kx6B/QeLNXbC
	eNs5g==
X-ME-Sender: <xms:iWpNZ3hT99osmkeOtjf7KKCFHh5RpceQNfWDsM5Ifvwr97WAp2-9xQ>
    <xme:iWpNZ0B24rrrAa9Kyvd0seFZjx0JtEDxAYyFZezS-bz1NUyqdVoxUAIpRiGtjBS9s
    EOtH7sttpGlmRydkbI>
X-ME-Received: <xmr:iWpNZ3ExCoNNhUeoMkbHfdo4BlzC0OSPlmmFmK13ZsJBNsC-X8-2KT4NSWsmykmyVkEnC_dy3GBPSY0VzQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrheekgdduudegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevuf
    ffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefrvghtvghrucffvghlvghvohhr
    higrshcuoehpvghtvghrsehpjhgurdguvghvqeenucggtffrrghtthgvrhhnpeeuiedvhe
    ffteeigefgudetffetlefhudfghfeukeeugefhhffgffeguedugffhhfenucffohhmrghi
    nhepihhnfhhorhhmrghtihhonhdrlhhsnecuvehluhhsthgvrhfuihiivgeptdenucfrrg
    hrrghmpehmrghilhhfrhhomhepphgvthgvrhesphhjugdruggvvhdpnhgspghrtghpthht
    ohepvddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepohhpvghnvghmsggvugguvg
    guqdgtohhrvgeslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhgpdhrtghpthht
    ohepphgvthgvrhesphhjugdruggvvh
X-ME-Proxy: <xmx:iWpNZ0T_0cplBg5weWwjYo5yW8lGXVNR4NVxs6ymGQ55kjUEyjFJHw>
    <xmx:iWpNZ0yMtI2EgptOiF9E4pNIZlCCC7RcAX-qG0GEd93aVR2mYyyULw>
    <xmx:iWpNZ66g4koGUFXBK8BPeQWfsc0-F_952FyjqpLYaFM47y5kghMZ7g>
    <xmx:iWpNZ5xP4PWe4ocuS6dMSEPbJghtqVMblDHcxlsd1FgGU8hLpAoiaA>
    <xmx:impNZ_9WMJ9IQGJRO5PUoR5fWH78_-qU0zHQ4NGLDmG4F9-vWyP1Ro5Q>
Feedback-ID: i9e814621:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 2 Dec 2024 03:06:33 -0500 (EST)
From: Peter Delevoryas <peter@pjd.dev>
To: openembedded-core@lists.openembedded.org
Cc: peter@pjd.dev
Subject: [PATCH 1/1] ncurses: Add alacritty terminfo
Date: Mon,  2 Dec 2024 00:06:29 -0800
Message-ID: <20241202080629.1639470-2-peter@pjd.dev>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20241202080629.1639470-1-peter@pjd.dev>
References: <20241202080629.1639470-1-peter@pjd.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Dec 2024 08:06:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208126

This installs alacritty terminal info alongside other terminal emulator
information.

```
$ ls /usr/share/terminfo/a
alacritty  ansi  ansi80x25  ansis  aterm
```

Alacritty is a relatively popular new terminal emulator. Without this,
users need to use workarounds like `export TERM=xterm` to get terminal
escape sequences to work (most of alacritty matches xterm/etc).

Some true-color features do not work correctly with `TERM=xterm` though.

Signed-off-by: Peter Delevoryas <peter@pjd.dev>
---
 meta/recipes-core/ncurses/ncurses.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/ncurses/ncurses.inc b/meta/recipes-core/ncurses/ncurses.inc
index f5e37b94da66..e96ee075bdd0 100644
--- a/meta/recipes-core/ncurses/ncurses.inc
+++ b/meta/recipes-core/ncurses/ncurses.inc
@@ -179,7 +179,7 @@ do_install() {
 
         # include some basic terminfo files
         # stolen ;) from gentoo and modified a bit
-        for x in ansi console dumb linux rxvt screen screen-256color sun vt52 vt100 vt102 vt200 vt220 xterm-color xterm-xfree86 xterm-256color
+        for x in alacritty ansi console dumb linux rxvt screen screen-256color sun vt52 vt100 vt102 vt200 vt220 xterm-color xterm-xfree86 xterm-256color
         do
                 local termfile="$(find "${D}${datadir}/terminfo/" -name "${x}" 2>/dev/null)"
                 local basedir="$(basename $(dirname "${termfile}"))"
-- 
2.43.5


