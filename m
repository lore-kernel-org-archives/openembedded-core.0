Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 96BD860AF3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Feb 2020 22:00:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 48RGFr2Blzz4c;
	Mon, 24 Feb 2020 23:00:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1582581616;
	bh=yBdCOmU4XicGiJEQ8emkJhEatm2EIY4yyvLfsAbEfoU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IXwgLT/Hcxwris8xhC8+jUMdDbhdUKtKI4eE2NfJ6mX/a+ftMawhAtmiq0+r1svJ9
	1pIT8LJkPxkn1+G8nuQhpjWWhQy3fdj8BrAH24wYIuRpD+uGZyDYKW4MFchdciyiZT
	dmPurt3Umgw163VJhXqxtLFIXcrjTqP1oqMpS+XSf2L83Foh5hMfqzkNLxeEIEFV1k
	4ibCiwzS9NoiHr49BV2g4biW8M3bzr45ERfQEvivtYfZiJq8Q2TTxy5pB/m//Hh85l
	Ie20nu1RGGPCi+V4z6HT4cCFNGy7QxpaYDteZAYQpkS8eeNbAUdQ96iAFTcsfuZGaN
	fysQLc/s68laMHMmcTGzFKPzfKOn56B3I5cxwVDdIZ+7c6f/jYRlWBnzm52gk68VM1
	09j15Ic0AFPnrUTdzhCGPYTWumfKGqx6gC0wzmigGN8zIhOnynNMNf218ZwRmepNzS
	pSBMGspgykVkLqWGe/eM4vpcBKvQoTzS+4hy+T4kpurvbwOrVY4XKuZkD65ieI4OLu
	z8neNTPD8i0CHuqUMF9xp2ww8dUa/uLqKCvA9cRGCz1YU5Yn4rgW42HxDdki1LbnCk
	jsytNCR1+4q63ZrD5IzkGxEz0Z5o5YypkUThLptZXQ7/G9tmZ+tDG6t7Tza0xsgdEy
	6+9JJhuVRafZPDiUoFb+JWJc=
Date: Tue, 25 Feb 2020 00:00:13 +0200
From: Adrian Bunk <bunk@stusta.de>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20200224220013.GA11259@localhost>
References: <20200224125955.26771-1-git@andred.net>
	<20200224134022.GB27036@localhost>
	<669ba509f1df86a8f2c7ea172aa8ff23d7449744.camel@linuxfoundation.org>
	<23c396de32bb98414dcb2aaec178e73079e000d3.camel@andred.net>
	<b14a0847fffc79809e5fcef86d82b5a8abf3f9a2.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <b14a0847fffc79809e5fcef86d82b5a8abf3f9a2.camel@linuxfoundation.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] bitbake.conf: omit XZ threads and RAM from sstate signatures
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
X-List-Received-Date: Mon, 24 Feb 2020 22:00:17 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Mon, Feb 24, 2020 at 05:32:29PM +0000, Richard Purdie wrote:
> On Mon, 2020-02-24 at 17:14 +0000, André Draszik wrote:
>...
> > I don't want to penalise myself or anybody else by generally forcing
> > a low number of threads either.
> 
> We didn't have resource issues on the autobuilder with xz but others
> did report it and its why the memlimit was set. It would be better to
> remove the memlimit for determinism really as far as I can tell and if
> necessary throttle the threads count.
> 
> Maybe setting an upper limit of say 10 threads and a minimum of 2 might
> given us what we need.

On a Threadripper with 128 cores and 256 GB RAM it would not be a
problem to use all cores.

A laptop with 8 cores and 8 GB RAM is problematic.

> Perhaps we just allow the number of xz threads
> to be set independently?

dpkg manually reduces the number of threads until less than half
of the RAM is used:
https://sources.debian.org/src/dpkg/1.19.7/lib/dpkg/compress.c/#L566-L574

In a script it would be possible to use --no-adjust to achieve the same:
$ xz -9 --memlimit=50% --no-adjust -T32 /dev/null 
xz: Memory usage limit is too low for the given filter setup.
xz: 39,972 MiB of memory is required. The limit is 32,051 MiB.
$

> > > FWIW we haven't seen variation on the autobuilder due to this as
> > > far as
> > > I know.
> > 
> > BTW, pigz and pbzip should have a similar thread related problem,
> > according to the man pages, if you read between the lines.
> 
> Agreed. We have less of an issue with these as their use is much less
> frequent. xz is used by deb and ipk for packaging.

Good point, dpkg does parallel xz compression and I am not aware of any
reproducibility problems this causes.

> Cheers,
> 
> Richard

cu
Adrian

