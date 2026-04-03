Return-Path: <pavel@loebl.cz>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7A2BE7E345
	for <webhook@archiver.kernel.org>; Fri,  3 Apr 2026 08:38:51 +0000 (UTC)
Received: from mxb.seznam.cz (mxb.seznam.cz [77.75.76.89])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7460.1775205525479311214
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Apr 2026 01:38:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@emailprofi.seznam.cz header.s=szn1 header.b=SL4EbV8G;
 spf=none, err=permanent DNS error (domain: loebl.cz, ip: 77.75.76.89, mailfrom: pavel@loebl.cz)
Received: from email.seznam.cz
	by smtpc-mxb-798b96f97c-dtvjf
	(smtpc-mxb-798b96f97c-dtvjf [2a02:598:128:8a00::1000:904])
	id 514f21e74addac3355aa9865;
	Fri, 03 Apr 2026 10:38:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=emailprofi.seznam.cz; s=szn1; t=1775205521;
	bh=M0JSFDnq78mpxjATlJDNkFqSS2S41WUqyLNXEqoo3hE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	b=SL4EbV8Gs+xJPclHtYtgrg4yf3HZo6wqRSBBwSA8hNRccpozwkkA8YDAxTUVfu5Kr
	 e9nF5AYmY0e2ztepdnCGLMh2mm3iaN6lm7d/P+JUP0fpTkQTKJAW4B2w3CnzbbMuGW
	 AvnPNJekrtmLQv27ELpzn9qcWdWDN8jRe0RfHJnQGTdKqUkjQYjgrIGtHfuHjcjP+S
	 PRIYBWtK4ZGWYq7e6p5wS9r7AMCTiXSwgrN9fOg1HythZNP/JH/v/f/KCDUcBv6vw4
	 tm+oY3+u0pKqaMzwYOFvxfMmrThqqXXRepP6ITU9Juh9iIZqG8PV/cTNAot1QvPB1E
	 kweQ+/FTAayFA==
Received: from localhost ([2a03:a900:1020:47::f71])
	by smtpd-relay-789d8dfb5c-qvt4n (szn-email-smtpd/2.0.71) with ESMTPA
	id 5fa20f08-738a-47a5-a5e2-c1e508e4d07b;
	Fri, 03 Apr 2026 10:38:06 +0200
Date: Fri, 3 Apr 2026 10:38:04 +0200
From: Pavel =?utf-8?B?TMO2Ymw=?= <pavel@loebl.cz>
To: Paul Barker <paul@pbarker.dev>
Cc: openembedded-core@lists.openembedded.org, 
	Michelle Lin <michelle.linto91@gmail.com>, Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: Re: [OE-core] [RFC PATCH] uki.bbclass: add multi-profile UKI support
Message-ID: <ac9y4JKHSQEMsNo8@alena.lan>
References: <20260402202616.3177283-1-pavel@loebl.cz>
 <96d932f72af422a6509ac9e6e92a979b75f2f5e7.camel@pbarker.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <96d932f72af422a6509ac9e6e92a979b75f2f5e7.camel@pbarker.dev>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Apr 2026 08:38:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234571

On Fri, Apr 03, 2026 at 08:47:17AM +0100, Paul Barker wrote:
> On Thu, 2026-04-02 at 22:25 +0200, Pavel L�bl wrote:
> > Allow generating multi-profile UKI [1]. This is quite usefull for
> > dual slot A/B deploymets with secureboot active.
> > 
> > Currently only .cmdline sections are supported. But can be easily
> > extended with others.
> > 
> > [1] https://uapi-group.org/specifications/specs/unified_kernel_image/#multi-profile-ukis
> > 
> > Signed-off-by: Pavel L�bl <pavel@loebl.cz>
> > ---
> >  meta/classes-recipe/uki.bbclass | 48 +++++++++++++++++++++++++++++----
> >  1 file changed, 43 insertions(+), 5 deletions(-)
> > 
> > diff --git a/meta/classes-recipe/uki.bbclass b/meta/classes-recipe/uki.bbclass
> > index d16f3c95561e..c2d21304c793 100644
> > --- a/meta/classes-recipe/uki.bbclass
> > +++ b/meta/classes-recipe/uki.bbclass
> > @@ -59,6 +59,17 @@
> >  #   - see efi-uki-bootdisk.wks.in how to create ESP partition which hosts systemd-boot,
> >  #     config file(s) for systemd-boot and the UKI binaries.
> >  #
> > +#   - to generate multi-profile UKI (currently only supports .cmdline section)
> > +#
> > +#     UKI_PROFILE[0] = "TITLE=Recovery boot"
> > +#     UKI_PROFILE_CMDLINE[0] = "rootwait recovery"
> > +#
> > +#     UKI_PROFILE[1] = "TITLE=Boot from slot A"
> > +#     UKI_PROFILE_CMDLINE[1] = "rootwait root=LABEL=root_a"
> > +#
> > +#     UKI_PROFILE[2] = "TITLE=Boot from slot B"
> > +#     UKI_PROFILE_CMDLINE[2] = "rootwait root=LABEL=root_b"
> > +#
> 
> Hi Pavel, thanks for the RFC.
> 
> To make things easier to debug and to follow existing conventions, I'd
> suggest:
> 
>     UKI_PROFILES = "slot_a slot_b recovery"
> 
>     UKI_PROFILES[recovery] = "TITLE=Recovery boot"
>     UKI_PROFILE_CMDLINE[recovery] = "rootwait recovery"
> 
>     UKI_PROFILES[slot_a] = "TITLE=Boot from slot A"
>     UKI_PROFILE_CMDLINE[slot_a] = "rootwait root=LABEL=root_a"
> 
>     UKI_PROFILES[slot_b] = "TITLE=Boot from slot B"
>     UKI_PROFILE_CMDLINE[slot_b] = "rootwait root=LABEL=root_b"
> 
Hi Paul,

the idea was to use the same indexes as firmware will be passing to
stub. As multi-profile UKI only supports numerical ones (actually
it's just the order in which they appear in PE32 binary).

In your example user would have to pass @0 from firmware to select
slot_a, @1 for slot_b and @2 for recovery.

I have no issues with that, just wanted to make that clear.

Regards,
Pavel
> 
> Best regards,
> 
> -- 
> Paul Barker
> 



