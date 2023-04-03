Return-Path: <ejo@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 223EFC76196
	for <webhook@archiver.kernel.org>; Mon,  3 Apr 2023 13:02:35 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
 by mx.groups.io with SMTP id smtpd.web10.69404.1680526952210181223
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Apr 2023 06:02:32 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: pengutronix.de, ip: 85.220.165.71, mailfrom: ejo@pengutronix.de)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[IPv6:::1])
	by metis.ext.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <ejo@pengutronix.de>)
	id 1pjJpO-0000xN-Gn; Mon, 03 Apr 2023 15:02:30 +0200
Message-ID: <d781cf840988282726b4d09217f5080704ec1343.camel@pengutronix.de>
Subject: Re: [PATCH v2 4/9] oeqa/utils/qemurunner: support ignoring vt100
 escape sequences
From: Enrico =?ISO-8859-1?Q?J=F6rns?= <ejo@pengutronix.de>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, yocto@pengutronix.de, Richard
	Purdie <richard.purdie@linuxfoundation.org>, alexandre.belloni@bootlin.com
Date: Mon, 03 Apr 2023 15:02:29 +0200
In-Reply-To: <CANNYZj8Z1kSGOpZ7jj5bRT++ugPNTrbzyuFdF6y7TYc98bqqtg@mail.gmail.com>
References: <20230331104025.1478393-1-ejo@pengutronix.de>
	 <20230331104025.1478393-5-ejo@pengutronix.de>
	 <CANNYZj8Z1kSGOpZ7jj5bRT++ugPNTrbzyuFdF6y7TYc98bqqtg@mail.gmail.com>
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
 <openembedded-core@lists.openembedded.org>; Mon, 03 Apr 2023 13:02:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179631

Hi Alex,

Am Freitag, dem 31.03.2023 um 16:05 +0200 schrieb Alexander Kanavin:
> On Fri, 31 Mar 2023 at 12:40, Enrico Jorns <ejo@pengutronix.de> wrote:
> > +re_vt100 = re.compile(r'(\x1b\[|\x9b)[^@-_a-z]*[@-_a-z]|\x1b[@-_a-z]')
> 
> This piece of 'magic' needs to be explained :) What does it define?

this is actually 'stolen' from labgrid's implementation for barebox[1] or shell[2] drivers which
have exactly the same needs: They need to remove the ansii (color) control codes from the strings in
order to match the text only.

The unprocessed barebox console prompt would look like:

  ESC[1;32mbarebox@ESC[1;36mARM QEMU virt64:/ESC[0m

where we cannot match for something like "barebox@ARM QEMU virt64:/".
The same applies to colored linux terminal output of course.

The "\x1b\[" from the regex catches the standard start of ansii escape sequence while the rest
catches the actual command code executed.


Regards, Enrico

[1] https://github.com/labgrid-project/labgrid/blob/e05f530c22513cd775b4f84e28f6c8c920b95102/labgrid/driver/bareboxdriver.py#L44 
[2] https://github.com/labgrid-project/labgrid/blob/5d3d5714976b37df0f9a9b769c581fe1f83ccbdc/labgrid/driver/shelldriver.py#L61

> Alex
> 

-- 
Pengutronix e.K.                           | Enrico Jörns                |
Embedded Linux Consulting & Support        | https://www.pengutronix.de/ |
Steuerwalder Str. 21                       | Phone: +49-5121-206917-180  |
31137 Hildesheim, Germany                  | Fax:   +49-5121-206917-9    |


