Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f178.google.com (mail-ig0-f178.google.com
	[209.85.213.178])
	by mail.openembedded.org (Postfix) with ESMTP id B8D2E6ABDB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Aug 2014 00:49:20 +0000 (UTC)
Received: by mail-ig0-f178.google.com with SMTP id uq10so3499501igb.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Aug 2014 17:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=O0ILsGTmGzDvVSqAS+dCiHcQXsAY48s+QIMZc68Uvjs=;
	b=e7aC2NX0bw+ChI/BZhp0acdA437oUixJN+FJlmuQIFEd8kHPR2UFcw4CpHnaNGPrKF
	DcDAjv9cpnm6UXE8rOBaxU6WK/H/Jxdq8D06/6Ixg5yOaKa/fnT4WeP+Rmd/CVxf6d0p
	qZ+MJfNo7dTPrdvrtstgnHXTO32qm247fFy8F+xCbSEcdz+0xSUNlZ+QhDvg57QPO/Fq
	Mt4yyiUfjlHDElYgJ/yrjLPibQ47rl4oJPpJ4S1PSlKvt/hG3BAmmuVpJEVqbqEqIrwp
	uqMvWa4AGoSJndH3vvomHEkS3Zv6G5OLWwgS4GA9pBZuTQBo55sWb8LWEPu2CjS6lU8v
	eDcw==
MIME-Version: 1.0
X-Received: by 10.50.43.225 with SMTP id z1mr12229289igl.17.1407977361290;
	Wed, 13 Aug 2014 17:49:21 -0700 (PDT)
Received: by 10.50.126.103 with HTTP; Wed, 13 Aug 2014 17:49:21 -0700 (PDT)
In-Reply-To: <53EBF375.1070701@pabigot.com>
References: <53E9134F.7040108@pabigot.com>
	<CAMKF1soHVxmjWW=TBqjh1P0ddPuMkxtmxXdnbLCSMLgQm2=hcQ@mail.gmail.com>
	<53EBD76A.3010401@pabigot.com> <53EBDA75.4040101@pabigot.com>
	<CAMKF1soioSe+U1CkB+PDsZyfDyaEFovugjOr+Tw+rGNjK57cJg@mail.gmail.com>
	<53EBF375.1070701@pabigot.com>
Date: Wed, 13 Aug 2014 17:49:21 -0700
Message-ID: <CAMKF1srUa9tUqu7bNXZ0g=yCa0e8E2K5XrzTHUUxB6BbTwYZ6g@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: "Peter A. Bigot" <pab@pabigot.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Yocto development with C++11 threads and gcc
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
X-List-Received-Date: Thu, 14 Aug 2014 00:49:23 -0000
Content-Type: multipart/alternative; boundary=089e010d8dd678be0005008c46f2

--089e010d8dd678be0005008c46f2
Content-Type: text/plain; charset=UTF-8

On Wednesday, August 13, 2014, Peter A. Bigot <pab@pabigot.com> wrote:

> On 08/13/2014 05:05 PM, Khem Raj wrote:
>
>> On Wed, Aug 13, 2014 at 2:36 PM, Peter A. Bigot <pab@pabigot.com> wrote:
>>
>>> In any case, Khem can you run with this?  It'd be fixed a lot better that
>>> way....
>>>
>> We do not configure target gcc with right matching cpu defaults,
>> atomic instruction strex/ldrex are only added after armv6 but defaults
>> for gcc if not specified is armv5t and hence it does not use the right
>> set as expected by libstdc++ which has been cross compiled. so while
>> you are at it and can reproduce it. Try to add
>>
>> EXTRA_OECONF += '${@bb.utils.contains("TUNE_FEATURES", "armv7a", "
>> --with-cpu=armv7-a", "", d)}'
>>
>> to gcc-target.inc and see if resulting gcc is any better
>>
>
> I had to make it:
>
> EXTRA_OECONF += '${@bb.utils.contains("TUNE_FEATURES", "armv7a",
> "--with-cpu=generic-armv7-a", "", d)}'
>
>
Sorry a typo there you   need  --with-arch

to get gcc to build but at runtime I then get:

>
> beaglebone[16]$ g++ -std=c++11 -pthread test.cc && ./a.out
> Assembler messages:
> Error: unknown cpu `generic-armv7-a'
> Error: unrecognized option -mcpu=generic-armv7-a
>
> which indicates the flag's being passed to the assembler which doesn't
> recognize it even though g++ is happy with it.  I suppose we could hack
> binutils to substitute whatever spelling it wants to see.
>
> (Also tried --with-cpu=arm7, but that generates assembler errors related
> to unsupported RM mode "bx lr").
>
> The approach bothers me, though.  Instead of explicitly changing
> gcc-target to match gcc-runtime, shouldn't it be a general rule that
> gcc-runtime not apply OE-specific target flags that aren't going to be used
> by direct invocations of the compiler outside of the OE build environment?
>  That seems a little more robust, as the default target flags may be
> changed upstream or by bbappends within OE, and having to make them match
> in gcc-runtime as well would be a headache.
>
> And would we need similar overrides for other architectures? There's
> something similar already in gcc-configure-common.inc for mips64.
>
> Peter
>

--089e010d8dd678be0005008c46f2
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<br><br>On Wednesday, August 13, 2014, Peter A. Bigot &lt;<a href=3D"mailto=
:pab@pabigot.com">pab@pabigot.com</a>&gt; wrote:<br><blockquote class=3D"gm=
ail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-le=
ft:1ex">
On 08/13/2014 05:05 PM, Khem Raj wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
On Wed, Aug 13, 2014 at 2:36 PM, Peter A. Bigot &lt;<a>pab@pabigot.com</a>&=
gt; wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
In any case, Khem can you run with this? =C2=A0It&#39;d be fixed a lot bett=
er that<br>
way....<br>
</blockquote>
We do not configure target gcc with right matching cpu defaults,<br>
atomic instruction strex/ldrex are only added after armv6 but defaults<br>
for gcc if not specified is armv5t and hence it does not use the right<br>
set as expected by libstdc++ which has been cross compiled. so while<br>
you are at it and can reproduce it. Try to add<br>
<br>
EXTRA_OECONF +=3D &#39;${@bb.utils.contains(&quot;TUNE_<u></u>FEATURES&quot=
;, &quot;armv7a&quot;, &quot;<br>
--with-cpu=3Darmv7-a&quot;, &quot;&quot;, d)}&#39;<br>
<br>
to gcc-target.inc and see if resulting gcc is any better<br>
</blockquote>
<br>
I had to make it:<br>
<br>
EXTRA_OECONF +=3D &#39;${@bb.utils.contains(&quot;TUNE_<u></u>FEATURES&quot=
;, &quot;armv7a&quot;, &quot;--with-cpu=3Dgeneric-armv7-a&quot;, &quot;&quo=
t;, d)}&#39;<br>
<br></blockquote><div><br></div><div>Sorry a typo there you =C2=A0 need =C2=
=A0--with-arch</div><div><br></div><div>to get gcc to build but at runtime =
I then get:</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex">

<br>
beaglebone[16]$ g++ -std=3Dc++11 -pthread test.cc &amp;&amp; ./a.out<br>
Assembler messages:<br>
Error: unknown cpu `generic-armv7-a&#39;<br>
Error: unrecognized option -mcpu=3Dgeneric-armv7-a<br>
<br>
which indicates the flag&#39;s being passed to the assembler which doesn&#3=
9;t recognize it even though g++ is happy with it. =C2=A0I suppose we could=
 hack binutils to substitute whatever spelling it wants to see.<br>
<br>
(Also tried --with-cpu=3Darm7, but that generates assembler errors related =
to unsupported RM mode &quot;bx lr&quot;).<br>
<br>
The approach bothers me, though. =C2=A0Instead of explicitly changing gcc-t=
arget to match gcc-runtime, shouldn&#39;t it be a general rule that gcc-run=
time not apply OE-specific target flags that aren&#39;t going to be used by=
 direct invocations of the compiler outside of the OE build environment? =
=C2=A0That seems a little more robust, as the default target flags may be c=
hanged upstream or by bbappends within OE, and having to make them match in=
 gcc-runtime as well would be a headache.<br>

<br>
And would we need similar overrides for other architectures? There&#39;s so=
mething similar already in gcc-configure-common.inc for mips64.<br>
<br>
Peter<br>
</blockquote>

--089e010d8dd678be0005008c46f2--
