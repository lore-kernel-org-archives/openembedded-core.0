Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 6220C60B98
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Feb 2020 09:54:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 48RZ5g3kD8z4M;
	Tue, 25 Feb 2020 10:54:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1582624456;
	bh=D5Hs/20UeohT9qNkcpvL/5lYS/b6XHp2k4KCHZO0IMo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cfBNeEO/rP+PsA6FkuaGo11KuWzPfThchKdK4EQaLJvR9oKu43DJn5XiEUtAjXsdE
	ko46lWK1ekOet7IbiGRmw6PjiXv728O2FUzaFrP/2Sjl7JSMfUpUGYa4F0Gv1WAkUL
	iJGiDhii6Dz0QWgeAyprFov4oyQ/Nuz4GK5IJ2FMMfebjYpEd9ud7JOu8Q9fm5zR/v
	qMZuVlfKEanyFY2IJb4C/O5RQFW7Tu8A0ylzuCREvqYdSE7ezmefg96qSIfKJjkomt
	yHZhmKgcmj/Z1ecIWaWFzZh/R0mcnwQAHb8LBSKM6WZmBmYCEYwedvwhL+g5/kMquq
	Rf1AkTgXhDQVISXAH0e05xN4pnVIWEMcapgt3N/mcQiDahnSOd8macggh2IDBUvY9F
	AXzmWdlS1U+c/+G3U66tXAFJ/fZNY+1sGC3z9tyomxA894uBbGauzCTDrImfC3oh0G
	G719UoEkPFOxvVDpH4fMUPBz89gkicuienfTnhinLGwhTvhjk55jMfx4EeWEo9DF0J
	6Cf3ubHeliNe5hTITC8yEkmVv5i6UrnvsQpacuOwuukRl7oOrDLOqG7FDTJEPjs+yp
	S/uW2SyQKvy0nWUWykjaOTrTAsziDMaqnCw1lQkveW5Q/5Wjl0IPj6H40w0tapiUid
	eGmG/f9sepfI8eAGM75Ua150=
Date: Tue, 25 Feb 2020 11:54:12 +0200
From: Adrian Bunk <bunk@stusta.de>
To: =?utf-8?B?QW5kcsOp?= Draszik <git@andred.net>
Message-ID: <20200225095412.GA7740@localhost>
References: <20200224125955.26771-1-git@andred.net>
	<20200224134022.GB27036@localhost>
	<669ba509f1df86a8f2c7ea172aa8ff23d7449744.camel@linuxfoundation.org>
	<23c396de32bb98414dcb2aaec178e73079e000d3.camel@andred.net>
	<b14a0847fffc79809e5fcef86d82b5a8abf3f9a2.camel@linuxfoundation.org>
	<20200224220013.GA11259@localhost>
	<861ecc2be15dcbfcb8cb5a6dac481561d235ddd9.camel@andred.net>
MIME-Version: 1.0
In-Reply-To: <861ecc2be15dcbfcb8cb5a6dac481561d235ddd9.camel@andred.net>
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
X-List-Received-Date: Tue, 25 Feb 2020 09:54:18 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Tue, Feb 25, 2020 at 09:16:20AM +0000, André Draszik wrote:
> On Tue, 2020-02-25 at 00:00 +0200, Adrian Bunk wrote:
>...
> > > Perhaps we just allow the number of xz threads
> > > to be set independently?
> > 
> > dpkg manually reduces the number of threads until less than half
> > of the RAM is used:
> > https://sources.debian.org/src/dpkg/1.19.7/lib/dpkg/compress.c/#L566-L574
> > 
> > In a script it would be possible to use --no-adjust to achieve the same:
> > $ xz -9 --memlimit=50% --no-adjust -T32 /dev/null 
> > xz: Memory usage limit is too low for the given filter setup.
> > xz: 39,972 MiB of memory is required. The limit is 32,051 MiB.
> > $
> 
> The problem with --no-adjust is that it also prevents xz from reducing the
> number of threads. It will do that in preference to changing compression
> parameters, so as long as you have more than 2499MiB of memory to support at
> least 2 threads (with default block size), compression will be identical.
>...

5 GB due to the 50%.

But I had something different in mind:

Similar to what dpkg is doing, you could once loop from 
@oe.utils.cpu_count() down to 2 until "--memlimit=50% --no-adjust -T$(i)"
succeeds.

Then run the actual compression without --memlimit.

I would not consider anything with less than 4 GB RAM reasonable for 
building Yocto (g++ also likes to use more than 2 GB).

> Cheers,
> Andre'

cu
Adrian

