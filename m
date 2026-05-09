Return-Path: <floss@jetm.me>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA1DECD37AF
	for <webhook@archiver.kernel.org>; Sat,  9 May 2026 01:35:08 +0000 (UTC)
Received: from fout-b1-smtp.messagingengine.com (fout-b1-smtp.messagingengine.com [202.12.124.144])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4185.1778290500353044182
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 May 2026 18:35:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@jetm.me header.s=fm2 header.b=qumHoEN8;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=p98yX8sg;
 spf=pass (domain: jetm.me, ip: 202.12.124.144, mailfrom: floss@jetm.me)
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.stl.internal (Postfix) with ESMTP id 40D641D000BD;
	Fri,  8 May 2026 21:34:59 -0400 (EDT)
Received: from phl-imap-07 ([10.202.2.97])
  by phl-compute-02.internal (MEProxy); Fri, 08 May 2026 21:34:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jetm.me; h=cc:cc
	:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1778290499;
	 x=1778376899; bh=Ge6SsSQIsg6QRt0Xtfq02BlPOzhaEhafHBHTeONn33M=; b=
	qumHoEN8xjdT0Njc0AR6wzuUjwZSSP8rdXMz65a71pNe65F8v4Kv19j1Q52sK2e6
	JgGt6ajEJFtfiQRVovKSWjFE8z8ZCMIRUC+ZapgcI/wtQIOCROa6RnMbEDOFXz86
	pnOOt5b884zJ9qmeMVxQut9tjz0bkbHaPsdDU+uD15/1IYeUA9hJRaDlqUpsSsXk
	3mLLHnnfYDT3UQBn1ceTSS22YOG8z2X06Uz1lrc6oeXKU1hDWpSei0Tu8+xFHwAR
	q5RdsMrbyi6oCvKKX0gTWktVY8OxLiaXXSBc3iX3BkdXDnPY6EBpeTu2ihmxdwNu
	Zx4IqwMdJCAcSfel7douOg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1778290499; x=
	1778376899; bh=Ge6SsSQIsg6QRt0Xtfq02BlPOzhaEhafHBHTeONn33M=; b=p
	98yX8sgQbO7O+OyvVVKnJ8bHxDZiZiySC+s5NMjlKlPjxrgVgAsfN7ziIcq4fpeL
	+Pvv876vxe3E4d9RXXO+wewJIEtMgyRYQ7xvgJB3+byFKRoXm+orvJ0DWCZm8EMG
	QRJlpAxDq8luEg7SDh7HyFD4DdpTbykr6oX5WMpzuZf5dA5d6VuB+P8klmkDJyEb
	hEF09igugQKuGxy3d6BUAupHf1MdfHfly8+tLl0CkaJYeJXOeKiLMD/UJ5OX/ge0
	Pe0AzH8sbw1PA6gSep6pXs4FLmSLrX8gJ5X9bm72PFeGBfQnP82jG4lfmCBSIQpR
	MBckPmkAhyS1PDIkj4ceA==
X-ME-Sender: <xms:Qo_-afXGyGNXsMj6mTUjRhrLt-2GjqlR-laIhxOfZ0HqgGeNEyLsSw>
    <xme:Qo_-aSaop5qDYXI9t0LMVRqjCPYIA3nmV0tB42f7nRp547AndVR5X0KZRJItUoPTZ
    ebl_jclK-mlsRV3LPOpX0-BeexTPDio_yMNE_tX3kJKgbUbpja4ZbE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdduudduleefucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnegopf
    hokfffucdluddtmdenucfjughrpefotggggffhvfffufevjghfsehtkedttdertdejnecu
    hfhrohhmpeflrghvihgvrhcuvfhirgcuoehflhhoshhssehjvghtmhdrmhgvqeenucggtf
    frrghtthgvrhhnpeegfeduffefgeejvdehgedtffdutedvveehvdekvdetleekjedvheev
    vdelgffgteenucffohhmrghinhepghhithhhuhgsrdgtohhmnecuvehluhhsthgvrhfuih
    iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepfhhlohhsshesjhgvthhmrdhmvgdp
    nhgspghrtghpthhtohepgedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepohhlih
    hvihgvrhdrsggvnhhjrghmihhnsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepfhhl
    ohhsshesjhgvthhmrdhmvgdprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdqtghorh
    gvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrghdprhgtphhtthhopeihohgt
    thhosehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrgh
X-ME-Proxy: <xmx:Qo_-acfb7B7We5Badl3OEAAjrCvE5pb8w-sh6ePnl2L1f_MB4ZmipA>
    <xmx:Qo_-aZqrWHSXY-G48NK5XWY4tjC-5rNJgZCCPtL51F761_-lH3pChA>
    <xmx:Qo_-aRCA0Hk11iqTU-FVVfy2U_dgu4JWy_uC1tu8V_4dITM22S24LQ>
    <xmx:Qo_-aWbNwTrRSSECknhJzVwYvSzgFtv17j71xhryn6LZoo4ABpfWmg>
    <xmx:Q4_-aZectn-CF_X5vQaCGiZyLsqUFYq1hV6KJpDet0AMiVUj53cL-cXo>
Feedback-ID: i9dde48b3:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 65A761EA006C; Fri,  8 May 2026 21:34:58 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Javier Tia <floss@jetm.me>
To: Olivier Benjamin <olivier.benjamin@bootlin.com>
Date: Fri, 08 May 2026 19:30:03 -0600
Subject: Re: ANNOUNCE: shipcheck - CRA compliance auditor for Yocto builds
Cc: yocto@lists.yoctoproject.org, openembedded-core@lists.openembedded.org
In-Reply-To: <21f76971-7cb6-4bef-9ac2-cd06f0098043@bootlin.com>
References: <d196fb98514a14652a8e6a6ed1b5fff0@jetm.me> <21f76971-7cb6-4bef-9ac2-cd06f0098043@bootlin.com>
Message-Id: <20260509013458.65A761EA006C@mailuser.phl.internal>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 09 May 2026 01:35:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236749

Hi Olivier,

On 4/27/26 08:27 AM, Olivier Benjamin wrote:
> I would certainly be interested in being able to validate SPDX 3.0
> output.

That shipped in v0.0.6. The short version: Yocto Scarthgap scores
20/50 on the new check because create-spdx-3.0 doesn't emit supplier
or per-Package checksums in any form -- field or Relationship. The
format detection, CreationInfo, and rootElement checks all pass; it's
the 30 per-Package points that are zero.

Full details, the scoring breakdown, and a drafted 2-patch series for
openembedded-core to fix the emission gap are in the GitHub issue:

  https://github.com/jetm/shipcheck/issues/3

If you have a Scarthgap or walnascar build with create-spdx-3.0
enabled, I'd be curious what score you see:

  pip install shipcheck==0.0.6
  shipcheck check --build-dir <your-build-dir>

The sbom-generation row is the one to watch. Any feedback on the BSI
v2.1.0 -> SPDX 3.0 field mapping (committed at
audits/0003-spdx3-mapping/mapping.md, marked draft pending review)
would also be welcome -- you have more context on how the SPDX
community expects BSI's requirements to map to 3.0 constructs.

> Not super relevant, but I would dispute the "paperwork regulation"
> bit, and one can only gloss over the "scanner-selection" issue if
> one assumes that problem already solved.

Fair pushback. I was shortcutting. The paperwork framing was meant to
highlight the documentation gap, not to minimize the vulnerability-
management side of things.

-- 
Javier Tia

