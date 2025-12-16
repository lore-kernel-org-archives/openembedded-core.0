Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C260CD609DB
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 18:41:29 +0000 (UTC)
Received: from fout-b1-smtp.messagingengine.com (fout-b1-smtp.messagingengine.com [202.12.124.144])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1272.1765910483515446029
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Dec 2025 10:41:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm3 header.b=SsF6ZrP9;
 dkim=pass header.i=@messagingengine.com header.s=fm1 header.b=w5iNSpdJ;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.144, mailfrom: paul@pbarker.dev)
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfout.stl.internal (Postfix) with ESMTP id D2E541D0006A;
	Tue, 16 Dec 2025 13:41:22 -0500 (EST)
Received: from phl-frontend-01 ([10.202.2.160])
  by phl-compute-06.internal (MEProxy); Tue, 16 Dec 2025 13:41:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm3; t=1765910482; x=1765996882; bh=xT
	ZsPmrELGiOC7enrcl3PegDe//D1QLi9AoI1seTMuU=; b=SsF6ZrP9P4Sr4fjVr5
	sOmoKipZQ/Q3ic8hDT9RG9bSqMwDzIKmnjfmmb0yaYmN/vYG6ekqI+7s7JdFM3ar
	/f7/0ldS7u9X7Y67fyJ04fMG3jB0UKQAC+2FUN9R5Mkbtjh62zw/+GRnf7l/EHQJ
	bR8UFW4OW7Fw3zhE5gNMTnmSOmuJIL/npWJd13AJpll5zDyx8bdg2LU/xzGHhAkS
	83VVTXg84yZOnrOeEMFddHlZp6OezBCkpwNJTx1oURen+uJN5AxPPEZvNEB+szh2
	rOg66YR/9oPoABhz7SUbxatZIWiN2aKQ7qE+RHrhD/2mGamt7JvXCv1faB7st6A+
	MV5w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1765910482; x=1765996882; bh=xTZsPmrELGiOC7enrcl3PegDe//D
	1QLi9AoI1seTMuU=; b=w5iNSpdJehsQUXMYI9M/NODQhpjWRysrK+qyfKmOM7F/
	22jVfK0II/SvP2FoqQyt2Ajjd1xzhDXmiixV+bNhVXd1NQcMfMMrxrjaVQvB8hT7
	910SHgUzD9dl9J5UfwLiP1R03why5Y37CX+/jwvqtCgV0KELYHd/i2IxoUM19yQS
	gzn0ii1J+WJV5SycHerrBp0ZCYCVfjCj6PG+Jd7Qu0xNtCFu+bRKsvgxcy54w/5d
	06/XpZB4FgUC2zUd0tGbj+loX73j0uMWduRTU2Q9dbZ9hMSQ+c6Eb2PLTHY0Jkg3
	m7vqnMQhUTf614AeFBObG0EdXzJOqJ7V4YwxSwFh7g==
X-ME-Sender: <xms:0qdBafcq5NaE5djR0PPGUDQj43iX90YXYVCoWtYqurZMn8qnXpbi7Q>
    <xme:0qdBabPUByRvxTKLDl5igroqQ54coJTvkqMeI73_XnkNOHlhVeM5NjxUBw57pN5np
    XWtYpyXMDA6f1XfsVMWuczxCOTe241nxpJN2TWr9NRI9k2MYklby-s>
X-ME-Received: <xmr:0qdBaWJYu-PrCygYjiMUY8iXd1HMDHrJy_5-MF93UuRSxgl9itpXth5_vnyYyBJkMBszIIMZCT7HYRv0_G-orpCC_Reu4L4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdegtdegvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecunecujfgurhephfffufggtgfgkffvvefosehtjeertdertd
    ejnecuhfhrohhmpefrrghulhcuuegrrhhkvghruceophgruhhlsehpsggrrhhkvghrrdgu
    vghvqeenucggtffrrghtthgvrhhnpeevvdduffekvddtveefhfeiueehgfdufefggfeile
    euueekieekfeektdegledtkeenucffohhmrghinhepihgrnhgrrdhorhhgnecuvehluhhs
    thgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgruhhlsehpsggrrh
    hkvghrrdguvghvpdhnsggprhgtphhtthhopedvpdhmohguvgepshhmthhpohhuthdprhgt
    phhtthhopehprghulhesphgsrghrkhgvrhdruggvvhdprhgtphhtthhopehophgvnhgvmh
    gsvgguuggvugdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrgh
X-ME-Proxy: <xmx:0qdBacH2XubI1YK3gE-DuJi0Zf3dqrHJhhmzsGUjPL-nV9gW4UFP4w>
    <xmx:0qdBaeTz0inX1G_b_wSzvTSMadCeeEAuUam2miKz8zNvFUkDdO-J0Q>
    <xmx:0qdBaYGbuIH-e9WwaGGvwG_1bXkFKubOFKp9CAXDyoxCmqhigFsbIw>
    <xmx:0qdBaa_O0Ctqjdq1hpFM8cMyl2KmZ4t1nc2l8RZvudPzEk-uoCYggA>
    <xmx:0qdBaTD-hGHPjfVGVGZTaQg9rbqlvZRv2FHZ0mGidVg6ZV7JQYkQDLLx>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 16 Dec 2025 13:41:21 -0500 (EST)
From: Paul Barker <paul@pbarker.dev>
Date: Tue, 16 Dec 2025 18:41:11 +0000
Subject: [PATCH] tzdata,tzcode-native: Upgrade 2025b -> 2025c
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251216-recipes-v1-1-382e3042f00d@pbarker.dev>
X-B4-Tracking: v=1; b=H4sIAManQWkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDI0Mz3aLU5MyC1GLdtBQDE1NDU8vk5EQzJaDqgqLUtMwKsEnRsbW1ALC
 pPqRZAAAA
X-Change-ID: 20251216-recipes-fd045159cca6
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <paul@pbarker.dev>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1702; i=paul@pbarker.dev;
 h=from:subject:message-id; bh=0GXEfTZPjtQX/6M9BQkiaBsDtTs7/AWHgABsPxxwA/k=;
 b=owGbwMvMwCW2OjnkzdxdX/IYT6slMWQ6Lr9Ybr+6+c/aubOLAkUvqz+QmXfe70vUhA+F1w0es
 P04zpFn11HKwiDGxSArpsiyuefr/ae9jrwZIbcUYOawMoEMYeDiFICJ6IQzMrwyta4SUP5cv431
 7L/onTeP9/61L7a78mHlw9ruqXcdPdMY/gcYnBZZP3mD18QbwStfe1XtiJKdNnXd5zU3+G1mv97
 2dzczAA==
X-Developer-Key: i=paul@pbarker.dev; a=openpgp;
 fpr=98B2AAC100AC3F82BB5D546774975C81B7E66BAC
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 18:41:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227982

This release mostly changes code and commentary. The only changed data
are leap second table expiration and pre-1976 time in Baja California.

Full release notes:
  https://lists.iana.org/hyperkitty/list/tz-announce@iana.org/thread/TAGXKYLMAQRZRFTERQ33CEKOW7KRJVAK/

Signed-off-by: Paul Barker <paul@pbarker.dev>
---
 meta/recipes-extended/timezone/timezone.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/timezone/timezone.inc b/meta/recipes-extended/timezone/timezone.inc
index 9a5105ffd74f..b9323432b8d3 100644
--- a/meta/recipes-extended/timezone/timezone.inc
+++ b/meta/recipes-extended/timezone/timezone.inc
@@ -6,7 +6,7 @@ SECTION = "base"
 LICENSE = "PD & BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c679c9d6b02bc2757b3eaf8f53c43fba"
 
-PV = "2025b"
+PV = "2025c"
 
 SRC_URI = "http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz;name=tzcode;subdir=tz \
            http://www.iana.org/time-zones/repository/releases/tzdata${PV}.tar.gz;name=tzdata;subdir=tz \
@@ -16,5 +16,5 @@ S = "${UNPACKDIR}/tz"
 
 UPSTREAM_CHECK_URI = "http://www.iana.org/time-zones"
 
-SRC_URI[tzcode.sha256sum] = "05f8fedb3525ee70d49c87d3fae78a8a0dbae4fe87aa565c65cda9948ae135ec"
-SRC_URI[tzdata.sha256sum] = "11810413345fc7805017e27ea9fa4885fd74cd61b2911711ad038f5d28d71474"
+SRC_URI[tzcode.sha256sum] = "697ebe6625444aef5080f58e49d03424bbb52e08bf483d3ddb5acf10cbd15740"
+SRC_URI[tzdata.sha256sum] = "4aa79e4effee53fc4029ffe5f6ebe97937282ebcdf386d5d2da91ce84142f957"

---
base-commit: 2e10e9a50f12d5de3d22fbed59b65461afa3fa84
change-id: 20251216-recipes-fd045159cca6

Best regards,
-- 
Paul Barker


