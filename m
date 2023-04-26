Return-Path: <ejo@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3B96C7EE26
	for <webhook@archiver.kernel.org>; Wed, 26 Apr 2023 09:17:27 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
 by mx.groups.io with SMTP id smtpd.web10.3729.1682500643484453628
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Apr 2023 02:17:24 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: pengutronix.de, ip: 85.220.165.71, mailfrom: ejo@pengutronix.de)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[IPv6:::1])
	by metis.ext.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <ejo@pengutronix.de>)
	id 1prbH6-0005CS-T8; Wed, 26 Apr 2023 11:17:21 +0200
Message-ID: <f60440d8db110719eaa71960149f248ec27f7c9c.camel@pengutronix.de>
Subject: Re: [OE-core] [PATCH v3 4/9] oeqa/utils/qemurunner: support
 ignoring vt100 escape sequences
From: Enrico =?ISO-8859-1?Q?J=F6rns?= <ejo@pengutronix.de>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: openembedded-core@lists.openembedded.org, yocto@pengutronix.de, Richard
 Purdie <richard.purdie@linuxfoundation.org>, Alexander Kanavin
 <alex.kanavin@gmail.com>,  alexandre.belloni@bootlin.com
Date: Wed, 26 Apr 2023 11:17:18 +0200
In-Reply-To: <20230426105220.78e13af1@booty>
References: <20230425184720.456896-1-ejo@pengutronix.de>
	 <20230425184720.456896-5-ejo@pengutronix.de>
	 <20230426105220.78e13af1@booty>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.3-1+deb11u1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: ejo@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-core@lists.openembedded.org
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Apr 2023 09:17:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180414

Hello Luca,

Am Mittwoch, dem 26.04.2023 um 10:52 +0200 schrieb Luca Ceresoli:
> Hello Enrico,
> 
> On Tue, 25 Apr 2023 20:47:15 +0200
> Enrico Jörns <ejo@pengutronix.de> wrote:
> 
> > If we talk to terminals that like colors, we need to ignore the vt100
> > escape sequences when matching strings.
> > 
> > An unprocessed barebox console prompt would e.g. look like:
> > 
> >   ESC[1;32mbarebox@ESC[1;36mARM QEMU virt64:/ESC[0m
> > 
> > where we cannot match for something like "barebox@ARM QEMU virt64:/".
> > The same applies to colored Linux terminal output of course.
> > 
> > The "\x1b\[" from the regex catches the standard start of ansii escape
>                                                             ^^^^
> I guess you mean "ansi" (single 'i'). I fixed that (and also converted
> to uppercase) while applying the patch for testing, no need to resend.

indeed, seems as if a part of me had 'ascii' in mind and when writing this.
ANSI is what I meant, yes.


Thanks for fixing it at both places!

Enrico

> > sequence while the rest catches the actual command code executed.
> > 
> > Signed-off-by: Enrico Jorns <ejo@pengutronix.de>
> > ---
> >  meta/lib/oeqa/utils/qemurunner.py | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> > 
> > diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
> > index 6734cee48d..c3d8e9e815 100644
> > --- a/meta/lib/oeqa/utils/qemurunner.py
> > +++ b/meta/lib/oeqa/utils/qemurunner.py
> > @@ -30,6 +30,8 @@ control_range = list(range(0,32))+list(range(127,160))
> >  control_chars = [chr(x) for x in control_range
> >                  if chr(x) not in string.printable]
> >  re_control_char = re.compile('[%s]' % re.escape("".join(control_chars)))
> > +# Regex to remove the ansii (color) control codes from console strings in order to match the
> > text only
>                          ^^^^^
> 
> Same here.
> 
> Best regards,
> Luca
> 

-- 
Pengutronix e.K.                           | Enrico Jörns                |
Embedded Linux Consulting & Support        | https://www.pengutronix.de/ |
Steuerwalder Str. 21                       | Phone: +49-5121-206917-180  |
31137 Hildesheim, Germany                  | Fax:   +49-5121-206917-9    |


