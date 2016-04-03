Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 9DDBF76A51
	for <openembedded-core@lists.openembedded.org>;
	Sun,  3 Apr 2016 23:00:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u33N0tIt003061; Mon, 4 Apr 2016 00:00:55 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id TuKjaplEXkhE; Mon,  4 Apr 2016 00:00:55 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u33N0of9003058
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 4 Apr 2016 00:00:52 +0100
Message-ID: <1459724450.7348.146.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Max Krummenacher <max.oss.09@gmail.com>
Date: Mon, 04 Apr 2016 00:00:50 +0100
In-Reply-To: <CAEHkU3VUnh78uOWRT2gYhAR5QOxYGDnc6J8RAsqkEkyj31HWfA@mail.gmail.com>
References: <1459717038-10549-1-git-send-email-max.krummenacher@toradex.com>
	<1459719934.7348.141.camel@linuxfoundation.org>
	<CAEHkU3VUnh78uOWRT2gYhAR5QOxYGDnc6J8RAsqkEkyj31HWfA@mail.gmail.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Cc: Max Krummenacher <max.krummenacher@toradex.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [oe][Patch] package.bbclass: fix host contamination warnings for source files
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 03 Apr 2016 23:00:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2016-04-04 at 00:51 +0200, Max Krummenacher wrote:
> 2016-04-03 23:45 GMT+02:00 Richard Purdie <
> richard.purdie@linuxfoundation.org>:
> > On Sun, 2016-04-03 at 22:57 +0200, Max Krummenacher wrote:
> > How about passing --owner=0:0 to cpio?
> 
> That was my first try, it didn't help.
> I'm also not sure if do_package() is executed under pseudo by
> default.

do_package is definitely run under pseudo.

> Also since the command is a pipeline, I don't know if pseudo is
> propagated from one command to the next.

It almost certainly does stay around. Its one of the reasons I found
the fakeroot changes in your patch odd.

> Actually I feel a bit as a sorcerer apprentice when it comes to
> python/pseudo/packaging.
> 
> > 
> > I'm a little worried about why I don't see this failure on my own
> > local
> > builds.
> I added some text to bugzilla. The gist is: In poky the sources are
> not deployed.

I don't understand that. If you mean playing sources in the -dbg
packages, poky does that too. Is there some specific configuration
Angstrom makes which triggers this?

There was a bug in master recently which broke source file deployment
into -dbg packages but that was a bug everywhere which was then fixed
when we realised.

> No source files, no wrong ownership.
> 
> What I did is doing a repo setup of angstrom master.
> 
> Removed the following from bblayers.conf because of parsing errors:
>   ${TOPDIR}/sources/meta-uav
>   ${TOPDIR}/sources/meta-kde4
>   ${TOPDIR}/sources/meta-edison
>   ${TOPDIR}/sources/meta-atmel
>   ${TOPDIR}/sources/meta-minnow
>   ${TOPDIR}/sources/meta-altera
> 
> And then:
> . setup-environment qemux86
> bitbake core-image-minimal
> 
> Regards
> Max

Cheers,

Richard

