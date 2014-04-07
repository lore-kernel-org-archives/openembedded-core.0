Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f176.google.com (mail-ie0-f176.google.com
	[209.85.223.176])
	by mail.openembedded.org (Postfix) with ESMTP id 904D46F908
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Apr 2014 19:35:44 +0000 (UTC)
Received: by mail-ie0-f176.google.com with SMTP id rd18so6543333iec.7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Apr 2014 12:35:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=C5/AeLGoQAK1NXuGq+3oztxGZgQikauD7uDli0kCqUw=;
	b=XKlTwH2C/sFohXr/JZ9s2aqZ6RRyUyZV+dPuBjzjsV7yHpavBdNKagx4lMagqO/kzy
	0keTo/vibEFDEGlwV6si3z/dK3/k/9eX0YSCMLb8DxRg2+UZYqEkSjpSnmrCe0Gq6BP8
	OXWmiZ7+7sLXSKVLWodnMiS1SPnCwmMJVv01/l0tNDsVLGEz63EJA0zR9wRAZFqbhNZ3
	ewA0C08N2Gjjejx0xvcXK7tgqqKu2752QDtGPYRXP3N2h3kS+unmoqbiNSZc0hxhEHvA
	8OHh++g4VGFtzD8VBWD3sEeidK3b0knuR958syoMttrVP+S/hzRly8D49n92qH/NH6As
	g0Qg==
MIME-Version: 1.0
X-Received: by 10.43.18.135 with SMTP id qg7mr27999725icb.5.1396899344183;
	Mon, 07 Apr 2014 12:35:44 -0700 (PDT)
Received: by 10.50.229.14 with HTTP; Mon, 7 Apr 2014 12:35:44 -0700 (PDT)
Received: by 10.50.229.14 with HTTP; Mon, 7 Apr 2014 12:35:44 -0700 (PDT)
In-Reply-To: <20140407155333.GA19351@mcrowe.com>
References: <20140407155333.GA19351@mcrowe.com>
Date: Mon, 7 Apr 2014 12:35:44 -0700
Message-ID: <CAMKF1spaiP8bkNxnSHqUs4tg6=gfZqR8fZaTrDn-N=s1iSDLkw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: Mike Crowe <mac@mcrowe.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: export TARGET_LDFLAGS and native sstate
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
X-List-Received-Date: Mon, 07 Apr 2014 19:35:47 -0000
Content-Type: multipart/alternative; boundary=bcaec51866be327aa104f678f9a6

--bcaec51866be327aa104f678f9a6
Content-Type: text/plain; charset=UTF-8

-Khem
On Apr 7, 2014 5:53 AM, "Mike Crowe" <mac@mcrowe.com> wrote:
>
> We're building for both ARM and MIPS-based MACHINEs in a single source
> tree. This seems to result in us compiling (or luckily most of the time
> resurrecting from sstate-cache) two different versions of all -native
> packages due to different base hashes.
>
> It seems that this difference in base hashes is due to the exported
> variable TARGET_LDFLAGS being different between the two CPUs:
>
> < export TARGET_LDFLAGS="-Wl,-O1  -Wl,--as-needed"
> ---
> > export TARGET_LDFLAGS="-Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed"
>
> which in turn is because TARGET_LINK_HASH_STYLE is explicitly set to
"sysv"
> on MIPS but allowed to be "gnu" on everything else.
>
> Every time I switch back and forth between building ARM-based and
> MIPS-based machines the do_populate_sysroot_setscene tasks run for each
> required -native recipe.
>
> If I modify native.bbclass to do:
>
>  TARGET_LDFLAGS = "${BUILD_LDFLAGS}"

this is reasonable to do
>
> then the hashes match and this unnecessary sysroot population is avoided.
>
> Is this a sensible thing to be doing? It does mean that TARGET_LDFLAGS
> contains a lot of (presumably unnecessary) rpath shenanigans but perhaps
> that doesn't matter. :(
>
> Thanks.
>
> Mike.
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--bcaec51866be327aa104f678f9a6
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr"></p>
<p dir=3D"ltr">-Khem<br>
On Apr 7, 2014 5:53 AM, &quot;Mike Crowe&quot; &lt;<a href=3D"mailto:mac@mc=
rowe.com">mac@mcrowe.com</a>&gt; wrote:<br>
&gt;<br>
&gt; We&#39;re building for both ARM and MIPS-based MACHINEs in a single so=
urce<br>
&gt; tree. This seems to result in us compiling (or luckily most of the tim=
e<br>
&gt; resurrecting from sstate-cache) two different versions of all -native<=
br>
&gt; packages due to different base hashes.<br>
&gt;<br>
&gt; It seems that this difference in base hashes is due to the exported<br=
>
&gt; variable TARGET_LDFLAGS being different between the two CPUs:<br>
&gt;<br>
&gt; &lt; export TARGET_LDFLAGS=3D&quot;-Wl,-O1 =C2=A0-Wl,--as-needed&quot;=
<br>
&gt; ---<br>
&gt; &gt; export TARGET_LDFLAGS=3D&quot;-Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,=
--as-needed&quot;<br>
&gt;<br>
&gt; which in turn is because TARGET_LINK_HASH_STYLE is explicitly set to &=
quot;sysv&quot;<br>
&gt; on MIPS but allowed to be &quot;gnu&quot; on everything else.<br>
&gt;<br>
&gt; Every time I switch back and forth between building ARM-based and<br>
&gt; MIPS-based machines the do_populate_sysroot_setscene tasks run for eac=
h<br>
&gt; required -native recipe.<br>
&gt;<br>
&gt; If I modify native.bbclass to do:<br>
&gt;<br>
&gt; =C2=A0TARGET_LDFLAGS =3D &quot;${BUILD_LDFLAGS}&quot;</p>
<p dir=3D"ltr">this is reasonable to do<br>
&gt;<br>
&gt; then the hashes match and this unnecessary sysroot population is avoid=
ed.<br>
&gt;<br>
&gt; Is this a sensible thing to be doing? It does mean that TARGET_LDFLAGS=
<br>
&gt; contains a lot of (presumably unnecessary) rpath shenanigans but perha=
ps<br>
&gt; that doesn&#39;t matter. :(<br>
&gt;<br>
&gt; Thanks.<br>
&gt;<br>
&gt; Mike.<br>
&gt; --<br>
&gt; _______________________________________________<br>
&gt; Openembedded-core mailing list<br>
&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedd=
ed-core@lists.openembedded.org</a><br>
&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded=
-core">http://lists.openembedded.org/mailman/listinfo/openembedded-core</a>=
<br>
</p>

--bcaec51866be327aa104f678f9a6--
