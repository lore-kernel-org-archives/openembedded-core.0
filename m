Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C36010F3DD9
	for <webhook@archiver.kernel.org>; Sat, 28 Mar 2026 09:50:10 +0000 (UTC)
Received: from fhigh-a7-smtp.messagingengine.com (fhigh-a7-smtp.messagingengine.com [103.168.172.158])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8104.1774691407074386051
 for <openembedded-core@lists.openembedded.org>;
 Sat, 28 Mar 2026 02:50:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm3 header.b=syfwvWrZ;
 dkim=pass header.i=@messagingengine.com header.s=fm1 header.b=Ollu6k3w;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.158, mailfrom: paul@pbarker.dev)
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 5E84C14001CD;
	Sat, 28 Mar 2026 05:50:06 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Sat, 28 Mar 2026 05:50:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1774691406;
	 x=1774777806; bh=a6DGGKMVXYmrFD974R/Z4r+P6GpwAzdCFxUGeoCTEss=; b=
	syfwvWrZG5bR3oyBDXXh6CuG4ELEgVQPpP8a/tQuakzwgEhupkAlLX3bKlu1aZL4
	/pS0D3fViNDiOhnhPlQaX8GoTccwvGzXIQCaq1O1XeskgRwc7utZ7l/kH0NvdEs8
	PN+rsXNAX7KGh5VPKuDtsmxIE4DHuvI/6Tmzm8JGrtU9AL/LWyyN1sw2gxBTlc5x
	iqy4jSEFFuBGhVCknoSVuVYFkBG62q7+Xvvz1L2XMt0EqNF/exypOhDEiVG7xYJY
	kaH8GgyPUIo6q7FFGLiwyN7MouAvfBTxEXRR0aRdr7pw/AD8WpH4cIvnIUCACd0k
	W3t1tDzYYoqJJiFxL2Xj4Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1774691406; x=
	1774777806; bh=a6DGGKMVXYmrFD974R/Z4r+P6GpwAzdCFxUGeoCTEss=; b=O
	llu6k3w5XUKpSisGNPikxnLmAoYiJQnEi4jaEXJApO8c6a8DiJBpKXPSGeo7hUup
	O12So7FDB6OTW3F7bEbEx2pjDGFXDOg1TCsu6AdXrA+b4Yb7603bNVGxlGBYeGBG
	JeJRk7W++7Z5JTMjnROZYgXJmhEJRmPPnyW+z4mByhtfGpWWAptHULhcmw5uwCkr
	GhrmW9Qggj4iCYcrd+9xeIipR6p3TO/KuugZbYx9iTnJJnDBRAO1v32MJj6/J4Xm
	+fTMy1U9I6B/38ARAaqbKTb6EzFoTaaG5Hlpm41Ul+3P2lpS3CgGw+crBamHTROO
	uPeJxGvmYAjeKAjYrBPyA==
X-ME-Sender: <xms:TqTHabfc3VXIcJS-IMr2JmG6XbBbzP6JSx4h3t7iFQ4YGYeVOpQ5OA>
    <xme:TqTHaXMDC-flBCd3Usg1NxHlg7ccBuMT8j4lTxHCUYUlB_FYqUbhQBbev3bYHV6Fg
    HbIyCAmyODTl--_OZ0PlzYb-o69-xvd5TfCuz8fmVtXF1bi_FX0R8V5>
X-ME-Received: <xmr:TqTHaSLAFmHgPvMkxP2IvUZ9FYew3ZgVHrwqiixaghoQ6BzhEILilkdsCFqLfRWkLm-eKOXuZswqJ-U9vYBKzXg42XeKaZI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdeffedvkeehucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucenucfjughrpefhfffugggtgffkfhgjvfevofesthejre
    dtredtjeenucfhrhhomheprfgruhhluceurghrkhgvrhcuoehprghulhesphgsrghrkhgv
    rhdruggvvheqnecuggftrfgrthhtvghrnheptdffvdffjeevhfelieegudfgieefleefue
    efffelvdehfeeviedtieeukefhleeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghr
    rghmpehmrghilhhfrhhomhepphgruhhlsehpsggrrhhkvghrrdguvghvpdhnsggprhgtph
    htthhopedvpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehophgvnhgvmhgsvggu
    uggvugdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrghdprhgtph
    htthhopehprghulhesphgsrghrkhgvrhdruggvvh
X-ME-Proxy: <xmx:TqTHaYGjgIqqw_hwzMtGiQhHDqpkeo5774uKltVXBkM5vaNbRE2M1A>
    <xmx:TqTHaaQBXg5UZ3xqFWd3ABIHgeczZWSGV7PxZTuLcJbGPjDFP4MYaQ>
    <xmx:TqTHaUH2R-wAWmA9m9H6A3OuK528trrSJ0d_bXTx1F-zcyYULvYFIw>
    <xmx:TqTHaW_yYn8e8CjnEkCxF-AXthngDLKiMZCMNCBB13mxoJgHV0hCbw>
    <xmx:TqTHafDraaOHOhjebCS-mTXBaldwJAk2_q6jsxJ4pQqe3q4k397yNilL>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 28 Mar 2026 05:50:05 -0400 (EDT)
From: Paul Barker <paul@pbarker.dev>
Date: Sat, 28 Mar 2026 09:49:58 +0000
Subject: [PATCH 1/2] checklayer: Really fix regex in get_signatures
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260328-fix-checklayer-3-v1-1-53da29ef5c35@pbarker.dev>
References: <20260328-fix-checklayer-3-v1-0-53da29ef5c35@pbarker.dev>
In-Reply-To: <20260328-fix-checklayer-3-v1-0-53da29ef5c35@pbarker.dev>
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <paul@pbarker.dev>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1219; i=paul@pbarker.dev;
 h=from:subject:message-id; bh=K+dxN1bigxhLVCTcane1xLrsE1fCUEWt/Vdw8Hus9G8=;
 b=owGbwMvMwCW2OjnkzdxdX/IYT6slMWQeX+Kz/la6ysPTGx8/EbM9d3LX+4dO+7U6tF4USYlu+
 WsYU3n5TEcpC4MYF4OsmCLL5p6v95/2OvJmhNxSgJnDygQyhIGLUwAm8reZkeH6zZ3xHzrEa+L3
 KN+VUpUtCe++5vvw/pLMQtcKP4vNmwQZ/scwy+h/Wa0Ss6/Yb5f9haMbufrqpdf0795xNvnF9Pv
 rmhkA
X-Developer-Key: i=paul@pbarker.dev; a=openpgp;
 fpr=98B2AAC100AC3F82BB5D546774975C81B7E66BAC
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 28 Mar 2026 09:50:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234128

The previous attempt to fix the regex in get_signatures was only a
partial success. We should just be comparing unihash values, inclusion
of the taskhash value in our comparison adds no benefit. Inclusion of
the task hash also results in invalid bitbake-diffsigs commands being
recommended if there are conflicting signatures.

Fixes: a2f7052cf832 ("checklayer: Fix regex in get_signatures")
Signed-off-by: Paul Barker <paul@pbarker.dev>
---
 scripts/lib/checklayer/__init__.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/checklayer/__init__.py b/scripts/lib/checklayer/__init__.py
index 15459b6e0486..f9ba44d08d88 100644
--- a/scripts/lib/checklayer/__init__.py
+++ b/scripts/lib/checklayer/__init__.py
@@ -324,7 +324,7 @@ def get_signatures(builddir, failsafe=False, machine=None, extravars=None):
         else:
             raise
 
-    sig_regex = re.compile(r"^(?P<task>[^:]*:[^:]*):(?P<hash>.*) .$")
+    sig_regex = re.compile(r"^(?P<task>[^:]*:[^:]*)(:(?P<taskhash>[^:]*))?:(?P<hash>.*) .$")
     tune_regex = re.compile(r"(^|\s)SIGGEN_LOCKEDSIGS_t-(?P<tune>\S*)\s*=\s*")
     current_tune = None
     with open(sigs_file, 'r') as f:

-- 
2.43.0


