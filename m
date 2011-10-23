Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RHzJi-0000NH-RM
	for openembedded-core@lists.openembedded.org;
	Sun, 23 Oct 2011 16:46:26 +0200
Received: by ggnj1 with SMTP id j1so3425236ggn.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Oct 2011 07:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=Lg3hCl8E3rWX6kYj0p3odxP28KiYOhzeLGYV72ss/hk=;
	b=sQeVstMpg8yGHpl4s72j/nJbTBpBAy1dmm2SO+g0ky/zKpZrmSntkfinZrND2dw4NO
	S/L0SIv/scivl+sG2kNzxYYCWMk6zDcUYNejlJ7SxwTcVPbeC06cXaJ1nR6N+xiUys4h
	pWT3V0mK/2ZIPJjAnHiR89CahT/UzUeOcyy5I=
Received: by 10.68.23.6 with SMTP id i6mr41478212pbf.13.1319380829606; Sun, 23
	Oct 2011 07:40:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.68.48.230 with HTTP; Sun, 23 Oct 2011 07:39:57 -0700 (PDT)
In-Reply-To: <20111023075715.GD3497@jama.jama.net>
References: <20111023075715.GD3497@jama.jama.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 23 Oct 2011 07:39:57 -0700
Message-ID: <CAMKF1spz4HSrg5tYLo7DPwBb+y8nBZR8vXNrtZEPiMbjM0Lftw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: bitbake eating more than 6GB ram while parsing recipes
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 23 Oct 2011 14:46:27 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 23, 2011 at 12:57 AM, Martin Jansa <martin.jansa@gmail.com> wro=
te:
> Hi,
>
> I know this was reported a while ago and I had this issue for few days
> with 4 GB RAM on my workstation it was hard to do anything when bitbake
> was parsing and today I've "resolved" it by removing cache.

yes I have exact same problem. As you add more machines to same tmpdir
build. It keeps becoming s bigger pig. And so far I have been removing
cache dir too since s parse from scratch is way faster in this case.

I think we have to profile bitbake and find the memory wastage even after
parse right now it keeps like 600M through out the build process which
could be reduced too.

>
> first I've tried to remove
> #PARALLEL_MAKE=3D"-j3"
> #BB_NUMBER_THREADS =3D "2"
> from my local.conf and it didn't help I still had 6 bitbake processes
> 4 eating ~ 1GB ad 2 with ~ 512MB. So I've removed tmp/cache except
> bb_persist_data.sqlite3:
>
> OE om-gta02@shr ~/shr-core $ du -hs tmp/cache/*
> 35M =C2=A0 =C2=A0 tmp/cache/bb_codeparser.dat
> 0 =C2=A0 =C2=A0 =C2=A0 tmp/cache/bb_codeparser.dat.lock.13293
> 0 =C2=A0 =C2=A0 =C2=A0 tmp/cache/bb_codeparser.dat.lock.13294
> 0 =C2=A0 =C2=A0 =C2=A0 tmp/cache/bb_codeparser.dat.lock.13295
> 0 =C2=A0 =C2=A0 =C2=A0 tmp/cache/bb_codeparser.dat.lock.15708
> 0 =C2=A0 =C2=A0 =C2=A0 tmp/cache/bb_codeparser.dat.lock.16878
> 0 =C2=A0 =C2=A0 =C2=A0 tmp/cache/bb_codeparser.dat.lock.16879
> 0 =C2=A0 =C2=A0 =C2=A0 tmp/cache/bb_codeparser.dat.lock.16880
> 0 =C2=A0 =C2=A0 =C2=A0 tmp/cache/bb_codeparser.dat.lock.25605
> 68K =C2=A0 =C2=A0 tmp/cache/bb_persist_data.sqlite3
> 87M =C2=A0 =C2=A0 tmp/cache/default-eglibc
> OE om-gta02@shr ~/shr-core $ rm -rf tmp/cache/bb_codeparser.dat*
>
> OE om-gta02@shr ~/shr-core $ du -hs tmp/cache/default-eglibc/*
> 13M =C2=A0 =C2=A0 tmp/cache/default-eglibc/nokia900
> 13M =C2=A0 =C2=A0 tmp/cache/default-eglibc/om-gta02
> 13M =C2=A0 =C2=A0 tmp/cache/default-eglibc/palmpre
> 13M =C2=A0 =C2=A0 tmp/cache/default-eglibc/qemuarm
> 13M =C2=A0 =C2=A0 tmp/cache/default-eglibc/qemux86
> 13M =C2=A0 =C2=A0 tmp/cache/default-eglibc/qemux86-64
> 13M =C2=A0 =C2=A0 tmp/cache/default-eglibc/spitz
> OE om-gta02@shr ~/shr-core $ rm -rf tmp/cache/default-eglibc/
>
> and now it's sane again and memory used is < 2GB.
>
> Regards,
> --
> Martin 'JaMa' Jansa =C2=A0 =C2=A0 jabber: Martin.Jansa@gmail.com
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>


