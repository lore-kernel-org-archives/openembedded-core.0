Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <brandon@rascalmicro.com>) id 1TBtBq-0007R2-Rc
	for openembedded-core@lists.openembedded.org;
	Wed, 12 Sep 2012 22:05:39 +0200
Received: by iaky10 with SMTP id y10so1663203iak.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Sep 2012 12:53:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:x-originating-ip:in-reply-to:references:date
	:message-id:subject:from:to:content-type:x-gm-message-state;
	bh=hegW0k0S550gmJEnjjHOmY+2E5wHpWxYuntq0++6IkY=;
	b=kP/RQXt1Xts4euUKnimvS/tB5jv3/XM8E8IJotMKCiGa9AXFopPuLUjfN1r95Ke3rO
	FRWxebS529wJp78zPMAW5rKhg8ZMapVeuGAu3UzHxwnofYacyr1opUttjydwbtJiuTBD
	fTLPcq3lcmXh5dEUQuq1VpRVBJ8Qq9HXA02KnltOnkv7ZJAywTpu9/DjBjjIxFAQquca
	N9p/3l7BuvUTWq3NejEzUGDjyym0muJrL3eXJ7FeTG/7d43r/pZeuBeglQIWNouEswSs
	jWM/VcyzvGtC9b8tOVsCBce+ZYJHO0vUp9CtkBn+hNIKULvNy3/jJrLLnFuM38+jV0jF
	gxrg==
MIME-Version: 1.0
Received: by 10.50.140.65 with SMTP id re1mr21939154igb.68.1347479585423; Wed,
	12 Sep 2012 12:53:05 -0700 (PDT)
Received: by 10.64.92.36 with HTTP; Wed, 12 Sep 2012 12:53:05 -0700 (PDT)
X-Originating-IP: [209.6.42.115]
In-Reply-To: <20120908074629.GB3903@sakrah.homelinux.org>
References: <CA+b4E8xjg7ZWy3pMoGY_HRYpTCwhS95_c+o0ZL_JG58dU0iMdw@mail.gmail.com>
	<20120908074629.GB3903@sakrah.homelinux.org>
Date: Wed, 12 Sep 2012 15:53:05 -0400
Message-ID: <CA+b4E8zZp5ScD3QYSVd3JYNj_LWtqJv6cEfi52pLHPbUmZGzZA@mail.gmail.com>
From: Brandon Stafford <brandon@rascalmicro.com>
To: raj.khem@gmail.com, Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQmXbtg3urPxs0iPXohJSlRh7nN1YWsu5/txk8vac7+JbHaMoI/7+l2Y5iEAZ9GPpr/ASQtm
Subject: Re: Trying to compile Scipy, but stuck on native cc and ld
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 12 Sep 2012 20:05:39 -0000
Content-Type: multipart/alternative; boundary=e89a8f839b2708024c04c9868a70

--e89a8f839b2708024c04c9868a70
Content-Type: text/plain; charset=ISO-8859-1

Hi Khem et al.,

Thanks for your thoughts.

I believe I already have gfortran working, but as I say that, I fear that I
may be inadvertently using the host compiler rather than the cross-compiler.

The suggestion to figure out how to override CC and LD in Scipy's setup.py
is good; I'll see if I can figure that out.

Best regards,
Brandon

On Sat, Sep 8, 2012 at 3:46 AM, Khem Raj <raj.khem@gmail.com> wrote:

> On (06/09/12 12:36), Brandon Stafford wrote:
> > Hi all,
> >
> > I'm working on a recipe for Scipy, which is a Python library for
> > scientific computation. It contains chunks of code in C and Fortran.
> >
> > I have seen this recent message from Phil Blundell (about an entirely
> > different recipe) that suggests that the problem may be the use of the
> > host's cc and ld, rather than the correct ARM cross-compilers:
> >
> http://www.mail-archive.com/openembedded-devel@lists.openembedded.org/msg27120.html
> >
> > This looks like the problem to me, but I'm not sure how to tell the
> > Python build script that it should be cross-compiling. Based on Phil's
> > message, I'd expect it involves setting ${CC} and ${LD} and somehow
> > passing them to Python, but I'm not sure how.
> >
> > Full error message: http://pastebin.com/pMvaLpcz
> > Recipe in broken state: http://pastebin.com/a5jm45vB
> >
> > (The line export LDFLAGS = "-L${STAGING_LIBDIR}" is just there because
> > another mailing list suggestion:
> >
> http://www.mail-archive.com/openembedded-devel@lists.openembedded.org/msg24196.html
> .
> > It does not appear to affect the errors produced.)
> >
> > Any suggestions?
>
> FIrst you need fortran language frontends and support libraries
> compiled with gcc cross compiler. By default we only build c/c++
>
> the you need to take a look at scipy build system and see how
> its deriving its CC and LD variables and then override them with
> CC LD that recipe gets from environment when building
>
> >
> > Brandon
> >
> > --
> > Brandon Stafford
> > Rascal Micro: small computers for art and science
> > Somerville, MA, USA
> >
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
> --
> -Khem
>



-- 
Brandon Stafford
Rascal Micro: small computers for art and science
Somerville, MA, USA

--e89a8f839b2708024c04c9868a70
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi Khem et al.,<div><br></div><div>Thanks for your thoughts.</div><div><br>=
</div><div>I believe I already have gfortran working, but as I say that, I =
fear that I may be inadvertently using the host compiler rather than the cr=
oss-compiler.</div>
<div><br></div><div>The suggestion to figure out how to override CC and LD =
in Scipy&#39;s setup.py is good; I&#39;ll see if I can figure that out.</di=
v><div><br></div><div>Best regards,</div><div>Brandon<br><br><div class=3D"=
gmail_quote">
On Sat, Sep 8, 2012 at 3:46 AM, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</spa=
n> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;b=
order-left:1px #ccc solid;padding-left:1ex">
<div class=3D"HOEnZb"><div class=3D"h5">On (06/09/12 12:36), Brandon Staffo=
rd wrote:<br>
&gt; Hi all,<br>
&gt;<br>
&gt; I&#39;m working on a recipe for Scipy, which is a Python library for<b=
r>
&gt; scientific computation. It contains chunks of code in C and Fortran.<b=
r>
&gt;<br>
&gt; I have seen this recent message from Phil Blundell (about an entirely<=
br>
&gt; different recipe) that suggests that the problem may be the use of the=
<br>
&gt; host&#39;s cc and ld, rather than the correct ARM cross-compilers:<br>
&gt; <a href=3D"http://www.mail-archive.com/openembedded-devel@lists.openem=
bedded.org/msg27120.html" target=3D"_blank">http://www.mail-archive.com/ope=
nembedded-devel@lists.openembedded.org/msg27120.html</a><br>
&gt;<br>
&gt; This looks like the problem to me, but I&#39;m not sure how to tell th=
e<br>
&gt; Python build script that it should be cross-compiling. Based on Phil&#=
39;s<br>
&gt; message, I&#39;d expect it involves setting ${CC} and ${LD} and someho=
w<br>
&gt; passing them to Python, but I&#39;m not sure how.<br>
&gt;<br>
&gt; Full error message: <a href=3D"http://pastebin.com/pMvaLpcz" target=3D=
"_blank">http://pastebin.com/pMvaLpcz</a><br>
&gt; Recipe in broken state: <a href=3D"http://pastebin.com/a5jm45vB" targe=
t=3D"_blank">http://pastebin.com/a5jm45vB</a><br>
&gt;<br>
&gt; (The line export LDFLAGS =3D &quot;-L${STAGING_LIBDIR}&quot; is just t=
here because<br>
&gt; another mailing list suggestion:<br>
&gt; <a href=3D"http://www.mail-archive.com/openembedded-devel@lists.openem=
bedded.org/msg24196.html" target=3D"_blank">http://www.mail-archive.com/ope=
nembedded-devel@lists.openembedded.org/msg24196.html</a>.<br>
&gt; It does not appear to affect the errors produced.)<br>
&gt;<br>
&gt; Any suggestions?<br>
<br>
</div></div>FIrst you need fortran language frontends and support libraries=
<br>
compiled with gcc cross compiler. By default we only build c/c++<br>
<br>
the you need to take a look at scipy build system and see how<br>
its deriving its CC and LD variables and then override them with<br>
CC LD that recipe gets from environment when building<br>
<div class=3D"im"><br>
&gt;<br>
&gt; Brandon<br>
&gt;<br>
&gt; --<br>
&gt; Brandon Stafford<br>
&gt; Rascal Micro: small computers for art and science<br>
&gt; Somerville, MA, USA<br>
&gt;<br>
</div>&gt; _______________________________________________<br>
&gt; Openembedded-core mailing list<br>
&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedd=
ed-core@lists.openembedded.org</a><br>
&gt; <a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openemb=
edded-core" target=3D"_blank">http://lists.linuxtogo.org/cgi-bin/mailman/li=
stinfo/openembedded-core</a><br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
-Khem<br>
</font></span></blockquote></div><br><br clear=3D"all"><div><br></div>-- <b=
r><div>Brandon Stafford</div><div>Rascal Micro: small computers for art and=
 science</div><div>Somerville, MA, USA</div><br>
</div>

--e89a8f839b2708024c04c9868a70--
