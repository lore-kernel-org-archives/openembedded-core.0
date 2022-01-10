Return-Path: <andrei@gherzan.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE15BC433EF
	for <webhook@archiver.kernel.org>; Mon, 10 Jan 2022 13:08:03 +0000 (UTC)
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 by mx.groups.io with SMTP id smtpd.web11.31436.1641820082645019317
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Jan 2022 05:08:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gherzan.com header.s=fm3 header.b=E0AEaZis;
 spf=pass (domain: gherzan.com, ip: 64.147.123.25,
 mailfrom: andrei@gherzan.com)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.west.internal (Postfix) with ESMTP id BA03F32007CF;
	Mon, 10 Jan 2022 08:08:01 -0500 (EST)
Received: from imap41 ([10.202.2.91])
  by compute4.internal (MEProxy); Mon, 10 Jan 2022 08:08:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gherzan.com; h=
	mime-version:message-id:in-reply-to:references:date:from:to:cc
	:subject:content-type; s=fm3; bh=LQYN5VO85NfjX9fi1EWX4Nwq5bWKmNa
	GpQALHo2PaeU=; b=E0AEaZis1H9Hpjp0SBUBQohLAemc89TTFNBDTHMXHDKD//F
	/q2F3FdfdbNnAdgqM31osCwHu4dzhOhzMyJdizesmivubxYCZ2/0AFOmUpEJBxkU
	IsQbnJOiMdsqw4Hy9JedYplju9D90qWlThq7KsSa81iktDopRKPpPD1DwXZHLI+V
	FISCUic8Nvlev4sQ94mxwUfX1dYjUP6UZIQBPrSIY2zEp1ZnZhYCNx85g8Mmmkdv
	fVU+y3MRefDSpizWK42t4i3ltXtvm2AOzk/C3ZmNhiIZD6JYWG3GuQv8HAKoeE7G
	QT180dhQfBHgaERCB0nqucSKum4hya+WKKgPrKQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=LQYN5V
	O85NfjX9fi1EWX4Nwq5bWKmNaGpQALHo2PaeU=; b=Yel+8hEQZ6q538IhaA0xIu
	QyXn2OFaK1gzoWs8hChZSLAeTnRpXQdpfJ3sNYYS+ezQ5a+g/OpVgJR5JgiUx3gU
	qyIl9pWQGjBg5to7DFusirWKe9DPBzxGaSFtqEtQS0ZCGpdEnxtJQ9d5h9AWZWfb
	ir+DyCXbYgCiI30NiGbtvcXhBZXN2RV//zFR59zaJ15T78W0eelnuWKoR+x4pj9G
	GVYRPBktrMiEnRsZle+JMbK0/8c0kM9liQ/wO7asa8VrS/7fdK2k2h/fCRmfOHwb
	w8Tiys+7sCToqSv+0m/gzZEF5Uj+8yYTH6XcnSCyw2sAsXk2joDd3sZm0IM4EaVA
	==
X-ME-Sender: <xms:sS_cYeGqHDm0-JMZFLKAM_q5KwOIsM3pM-XsTWsi13yfw5WxvO5IkQ>
    <xme:sS_cYfUDHQB3KfoVbJV4GlNfYAexLPrboE1iTKlGiHwlgHk9zW6ouaUsesgog8eG9
    WsXlXTDWhfPHpVU7cQ>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvuddrudehuddgvdefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvffutgesrgdtreerreertdenucfhrhhomhepfdetnhgu
    rhgvihcuifhhvghriigrnhdfuceorghnughrvghisehghhgvrhiirghnrdgtohhmqeenuc
    ggtffrrghtthgvrhhnpeehuefgfeeuhfdtueegffettdejjefgheeugeefgfegffethfdv
    ffejgeefieetgfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
    hrohhmpegrnhgurhgvihesghhhvghriigrnhdrtghomh
X-ME-Proxy: <xmx:sS_cYYIlJTHVE0tVIbkVAkNm_RNIXlL6UowZfg8gyn8pwDdNJAtMZA>
    <xmx:sS_cYYEwP-H2_96Ez4OhlDX37ZprSpMM7PuQtHW3ZL3vWJlieJZrtA>
    <xmx:sS_cYUVRq364bF9TTDJxp1W73tc_79cKAs0bn7KA2Zgsi5rB6Gr8zg>
    <xmx:sS_cYdewLLoJkGnDf94XsbRehI_eA1iHHce0pMROfoZUjEV-oIoLXQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id F20A13C0146; Mon, 10 Jan 2022 08:08:00 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-4527-g032417b6d6-fm-20220109.002-g032417b6
Mime-Version: 1.0
Message-Id: <ac4676b0-7d40-4f2e-bf3d-892fef657037@www.fastmail.com>
In-Reply-To: 
 <CANNYZj_DDFsXrftLA3ySaAefWbqO=CRwHROiisY8_x80DDT4nA@mail.gmail.com>
References: <20220106201234.159792-1-saul.wold@windriver.com>
 <b44541ed-2bb1-485d-99d3-e6ab1fe61664@www.fastmail.com>
 <647ddff7-c27c-4023-aa70-a423876f4e20@www.fastmail.com>
 <CANNYZj_DDFsXrftLA3ySaAefWbqO=CRwHROiisY8_x80DDT4nA@mail.gmail.com>
Date: Mon, 10 Jan 2022 13:07:40 +0000
From: "Andrei Gherzan" <andrei@gherzan.com>
To: "Alexander Kanavin" <alex.kanavin@gmail.com>
Cc: openembedded <openembedded-core@lists.openembedded.org>, bero@lindev.ch
Subject: Re: [OE-core] [PATCH v2] perl: Enable threading
Content-Type: multipart/alternative;
 boundary=658696f46c6141a985ab4c2c93414cc3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Jan 2022 13:08:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160349

--658696f46c6141a985ab4c2c93414cc3
Content-Type: text/plain

On Mon, 10 Jan 2022, at 13:01, Alexander Kanavin wrote:
> You need to clean before every build. Perl doesn't correctly reconfigure itself when settings like this change.

I'm not sure I get you here. Are you saying that this is normal behavior or that it is a known issue? If the latter, do we have an bug raised on it?

Andrei

--658696f46c6141a985ab4c2c93414cc3
Content-Type: text/html

<!DOCTYPE html><html><head><title></title><style type="text/css">p.MsoNormal,p.MsoNoSpacing{margin:0}</style></head><body><div>On Mon, 10 Jan 2022, at 13:01, Alexander Kanavin wrote:<br></div><blockquote type="cite" id="qt" style=""><div dir="ltr"><div>You need to clean before every build. Perl doesn't correctly reconfigure itself when settings like this change.<br></div></div></blockquote><div><br></div><div>I'm not sure I get you here. Are you saying that this is normal behavior or that it is a known issue? If the latter, do we have an bug raised on it?<br></div><div><br></div><div>Andrei<br></div><div><br></div></body></html>
--658696f46c6141a985ab4c2c93414cc3--

