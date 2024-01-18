Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84760C4707B
	for <webhook@archiver.kernel.org>; Thu, 18 Jan 2024 14:16:35 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web10.12463.1705587387548493811
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Jan 2024 06:16:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=LAhq17BW;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=P1v5nrSub2+CZbouOI9mI4jPERqm6pc7cGqpeMHULYo=; b=LAhq17BW4VSgoxOkYNbiWJEv76
	LX20VLzJd2Pn7PZz2zKoUgs9SZLOguK/NdoHtl17O6e2K2afLJDJa5ysA1FnSflRmgiMkQ+OdLApe
	smOZ5N2RnXdkPr6dLupY0NytDLZoe/y90sP8wqn5G+lF+LA+xqqLaUMN/XATy2MsJch/rF5GiL7h9
	aVe3erMBRMAJZ8NOD0Cz/ivHCLLevB0DcRY49I/P/W/xKHghn98FhwGklfVr7jtuRo0UvWocXRbjn
	9wavc/bYCwJsb4niB+u0ASZ/Wu548thBB1P2YXCU8yvdWgt1LBta6VdEEe5eU91qrqZLBOL/F3Eyi
	WlmS1bpw==;
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.102.5]:49994 helo=fedora)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1rQTBw-00GhLM-26;
	Thu, 18 Jan 2024 09:16:26 -0500
Date: Thu, 18 Jan 2024 09:16:22 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Alexander Kanavin <alex.kanavin@gmail.com>
cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] want to confirm i'm using "externalsrc" and "bin_package"
 efficiently
In-Reply-To: <CANNYZj_0QmjJY-LE9FiGo0iVWA28u3rsFujEyS9ppk-bDCk8fg@mail.gmail.com>
Message-ID: <26ab7d89-3ae8-37c5-a084-7c4ffe497f2@crashcourse.ca>
References: <dfcf7a4a-81b1-ff26-d14-923bf379025@crashcourse.ca> <CANNYZj9aG5qcpe6PksShW4W69uk7EZ+j7yxHb43tgfDrk8ygFQ@mail.gmail.com> <5610c776-f1d9-3543-9878-56fad23e776a@crashcourse.ca> <CANNYZj9swGJz6kc4ykCAOnw=ACc_4aCn1UODGZSKrhT4Rcpj4g@mail.gmail.com>
 <cbd55bb-9148-16b4-4146-b6e8cebb9d3@crashcourse.ca> <CANNYZj_0QmjJY-LE9FiGo0iVWA28u3rsFujEyS9ppk-bDCk8fg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel10.indieserve.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel10.indieserve.net: authenticated_id: rpjday+crashcourse.ca/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: cpanel10.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Jan 2024 14:16:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193989

On Thu, 18 Jan 2024, Alexander Kanavin wrote:

> On Thu, 18 Jan 2024 at 15:10, Robert P. J. Day <rpjday@crashcourse.ca> wrote:
> >   ah, got it. that's still fine since as the content is almost
> > exclusively binary (pre-built) content, redoing from scratch will take
> > no time at all. thanks for clarifying that.
>
> Pre-built content is ok on its own, but if those items are in the
> dependency tree of something that does take time to build, they will
> subvert sstate and lengthen build times.

  i'm already going over the entire build to identify unnoticed
dependencies that could cause problems.

rday

