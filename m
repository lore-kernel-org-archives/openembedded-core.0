Return-Path: <martin@geanix.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37A9EC25B7E
	for <webhook@archiver.kernel.org>; Tue,  4 Jun 2024 07:20:29 +0000 (UTC)
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
 by mx.groups.io with SMTP id smtpd.web11.15570.1717485624856614078
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Jun 2024 00:20:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@geanix.com header.s=default2211 header.b=cM1dltd2;
 spf=pass (domain: geanix.com, ip: 188.40.30.78, mailfrom: martin@geanix.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com;
	s=default2211; h=MIME-Version:Content-Transfer-Encoding:Content-Type:
	References:In-Reply-To:Date:To:From:Subject:Message-ID:Sender:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=UqyTugrxNls9xEPE2A3pFWAjdANU4XFJVE8M/wLPao8=; b=cM1dltd2fHAbzg5D9dNB1EFpvi
	cdzmzj4WdaRr742Q6TP0Y4y2FM8SU2F+5dRlGm9iBh0g3fHtG9JOC87EU67jHo3Pe4Y/6EWCjtSEr
	Z+Vlj0c7AlH/8cM3RwQX/mcYK1ojC5fYXCXkUI384wtmLKv4WG1PKSG3+Ix9rxE/OsdjCXRR9n9zo
	BasoPvmKGdWuwNJnhDGDtvRMsg7WxSLRr2MQchPRVnLAPe+9u9Gu5WPtL/UIh0DQH4RMkFt5PyGFY
	Rdw2npUplllezACMpUORsaRbqFK4ZpMMus0DjyhHRTUkz03waujjEdPn8ihcVZArWOwc7pCY7rFi6
	eXo1kXIQ==;
Received: from sslproxy07.your-server.de ([78.47.199.104])
	by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <martin@geanix.com>)
	id 1sEOT4-000JuI-EV; Tue, 04 Jun 2024 09:20:22 +0200
Received: from [85.184.138.13] (helo=[192.168.8.20])
	by sslproxy07.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <martin@geanix.com>)
	id 1sEOT0-000PSg-3C;
	Tue, 04 Jun 2024 09:20:22 +0200
Message-ID: <8b15e4b1f50b7acc61d8bb09813e7ead3449bb49.camel@geanix.com>
Subject: Re: [OE-core] [PATCH] qemu: upgrade 8.2.1 -> 9.0.0
From: Martin =?ISO-8859-1?Q?Hundeb=F8ll?= <martin@geanix.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org
Date: Tue, 04 Jun 2024 09:20:22 +0200
In-Reply-To: <cc510f2a692c8e654dccd974d45e535cd6210c38.camel@linuxfoundation.org>
References: <20240522132838.2519681-1-martin@geanix.com>
	 <cc510f2a692c8e654dccd974d45e535cd6210c38.camel@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.2 
MIME-Version: 1.0
X-Authenticated-Sender: martin@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.10/27295/Mon Jun  3 10:28:26 2024)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Jun 2024 07:20:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200298

On Tue, 2024-06-04 at 08:13 +0100, Richard Purdie wrote:
> On Wed, 2024-05-22 at 15:28 +0200, Martin Hundeb?ll via
> lists.openembedded.org wrote:
> > Remove pacthes accepted upstream, and refresh the remaining ones.
> > Remove
> > patches required by ubuntu 18.04, as those are unmaintainable.
> >=20
> > Remove CVE status for CVEs not applicable to the new version.
> >=20
> > Exclude hppa-firmware{,64}.img files from stripping during
> > packaging, as
> > those (binary) files are already stripped.
> >=20
> > Signed-off-by: Martin Hundeb=C3=B8ll <martin@geanix.com>
> > ---
> >=20
> > I'm no sure about the CVE changes, but the one I removed didn't
> > have
> > qemu-9.* listed as a vulnerable configuration.
> >=20
> > This has been tested with runqemu on a standard qemux86-64 machine.
> > If
> > it breaks miserably elsewhere, then at least there's a starting
> > point.
>=20
> Thanks for sending this patch. I've tweaked it to delete the hppa
> firmware files since we don't use that and they were causing multiple
> problems. I agree it is time to remove those 18.04 patches.

Removing those files seems like a reasonable approach.

> Testing seems to be otherwise working so we can probably take the
> upgrade :)

Great!

// Martin

