Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4844BF506F2
	for <webhook@archiver.kernel.org>; Mon, 16 Mar 2026 14:59:35 +0000 (UTC)
Received: from fhigh-a3-smtp.messagingengine.com (fhigh-a3-smtp.messagingengine.com [103.168.172.154])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.52749.1773673168420424906
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Mar 2026 07:59:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm3 header.b=k5w69Edf;
 dkim=pass header.i=@messagingengine.com header.s=fm1 header.b=M73XDZbc;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.154, mailfrom: paul@pbarker.dev)
Received: from phl-compute-08.internal (phl-compute-08.internal [10.202.2.48])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 9CC1A1400237;
	Mon, 16 Mar 2026 10:59:27 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-08.internal (MEProxy); Mon, 16 Mar 2026 10:59:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1773673167;
	 x=1773759567; bh=aK8uIrodBfxJxd/1pTD0i4Grpvz+inhJQR+xw0QY5Z0=; b=
	k5w69EdfgGqpvW8/xnGDf4c2jx3MDvzx79Jh3CnjlRrkruW8bORzHWkaynsW9WCT
	e2E/npC4QzazublHzfKvMgUOPTbnH91auEwkBL643cuqIBfErBwYJ1K/zh3jZXf0
	tOYmLTWyhqV8xB1I3EY+B0B7cPibgDsUl3AspULwZpmsXs4Lycqvn4w55MEF0bDi
	wreTANBUN5qyiVeaEoTzXM0SJVc2Y237/Hq1WW24MHasN0P+/FMT5dCFWuipJxT5
	AhPzf4aowySOspCKfIU8ynscKiag/LrxhrBQym+0shVuWp53PAY3/qIWkB5J8pYI
	QohdlG1pI/eXo3eZf68krQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1773673167; x=
	1773759567; bh=aK8uIrodBfxJxd/1pTD0i4Grpvz+inhJQR+xw0QY5Z0=; b=M
	73XDZbccgYblxJWtHLeyaeJBX4ptYtkKmU43jArMC1pGPsmTj66dZwOw1Ck8mnuE
	cC+rYmfQ1HfQinC+Qx+xW0agm8GfKKnYL48nVlRRHD+zN8tfvln0gLTqfpUMQ8/f
	FpH5y0AuSoO27LFBm2fhP4LDAk3XJeRC2aTczfPpLGbN9ABBfHaqvWE9qovpJVV7
	P8pduqFRGaea0Sbp9Q/2w/R3yu/MU9I8T8OBvMkk666wGUzVjglvNeBuSntU+98L
	uUtfIFqILA0HWQgAoA/mAFJP+SnzvigrAkP2IsbUaP9Dsh1PEA4GnGzMy2sRmI7l
	8oxvojtyydlZxjx0GBT+w==
X-ME-Sender: <xms:zxq4acopj0QYB33uPVivaRB830CETqbcpCDPHZHuA7FwRVxo3_gyaw>
    <xme:zxq4aYrmS1vA-Z-WTbDVF_U6LrOcgMqls1_6iCnnS3znbOP6NlkwQ4Jgt8E1Qk9J_
    nQKFVw79hDbx1i-vDPgS8UTg0Ct37UGmB7KnMb_B4_5VAlNEzt0VUw>
X-ME-Received: <xmr:zxq4ae0a8nf3yAZbNtWP7kqvqfiAw4KGV4YDJWfYR8j44PKBPHWiw4VFzMOyPJcCEJrX2_xoJrOXwK2JaZqu6KPxxHSPz_M>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvleekieekucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucenucfjughrpefhfffugggtgffkfhgjvfevofesthejre
    dtredtjeenucfhrhhomheprfgruhhluceurghrkhgvrhcuoehprghulhesphgsrghrkhgv
    rhdruggvvheqnecuggftrfgrthhtvghrnheptdffvdffjeevhfelieegudfgieefleefue
    efffelvdehfeeviedtieeukefhleeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghr
    rghmpehmrghilhhfrhhomhepphgruhhlsehpsggrrhhkvghrrdguvghvpdhnsggprhgtph
    htthhopedvpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehophgvnhgvmhgsvggu
    uggvugdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrghdprhgtph
    htthhopehprghulhesphgsrghrkhgvrhdruggvvh
X-ME-Proxy: <xmx:zxq4afCtnBbgw3TlDR2wWSfe0y_o9jY9my7cPTArzukDb8DVyPz63g>
    <xmx:zxq4aecsAsh3MOwFSarOlPEQhQk27j4dKCVPWnnANgVGBBHt5rC9jw>
    <xmx:zxq4aciT0HHyjwsMPI165yx7_CEMcQw8ZwywzFKmJUOgYLr2bQp0GA>
    <xmx:zxq4aepOiWKbnNR4VTDcoysFFWAoqCN_00M_K8jSKLRQHyNTOWATSg>
    <xmx:zxq4abP0i-183RcuRnwjg79kWX6VXXrjJ2z4XVidt6sy-4FCOQ4pSuNL>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 16 Mar 2026 10:59:27 -0400 (EDT)
From: Paul Barker <paul@pbarker.dev>
Date: Mon, 16 Mar 2026 14:59:16 +0000
Subject: [PATCH 1/2] oeqa: manual: Add Upstream-Status to abat patch
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260316-fix-checklayer-v1-1-f3bcaa60e93c@pbarker.dev>
References: <20260316-fix-checklayer-v1-0-f3bcaa60e93c@pbarker.dev>
In-Reply-To: <20260316-fix-checklayer-v1-0-f3bcaa60e93c@pbarker.dev>
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <paul@pbarker.dev>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=825; i=paul@pbarker.dev;
 h=from:subject:message-id; bh=B8BrqSZNTajidyby/+2KmVOudkOiurYkLWTJmHug6Tc=;
 b=owGbwMvMwCW2OjnkzdxdX/IYT6slMWTukDp7snCT/iOVxUHnUje/f6m+J/3jF/aJMyR/fTvL/
 Lmv3qN9b0cpC4MYF4OsmCLL5p6v95/2OvJmhNxSgJnDygQyhIGLUwAm8ug3w/88zY7eA8eyN6vl
 v//oZXzYce619qpPbTbbb6X0CpyxijJgZOgIeXQ1ffuUEJ9+V+Hk7QsjjdJuJZ9qMWv6+eSeyoc
 FH9kB
X-Developer-Key: i=paul@pbarker.dev; a=openpgp;
 fpr=98B2AAC100AC3F82BB5D546774975C81B7E66BAC
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Mar 2026 14:59:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233256

Running check-layer on the core metadata showed that abat.patch is
missing an Upstream-Status.

Signed-off-by: Paul Barker <paul@pbarker.dev>
---
 meta/lib/oeqa/manual/abat.patch | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/manual/abat.patch b/meta/lib/oeqa/manual/abat.patch
index 1541ac80cbe1..d69270aa3911 100644
--- a/meta/lib/oeqa/manual/abat.patch
+++ b/meta/lib/oeqa/manual/abat.patch
@@ -1,3 +1,4 @@
+Upstream-Status: Inappropriate [OE-specific patch for manual testing]
 ########
 diff --git a/glxgears_check.sh b/glxgears_check.sh
 index 17622b8..c4d3b97 100755
@@ -61,4 +62,4 @@ index 9cf6eab..2305796 100755
      if [ -z "$XPID" ]; then
          echo "Start up X server FAIL!"
   echo
-########
\ No newline at end of file
+########

-- 
2.43.0


