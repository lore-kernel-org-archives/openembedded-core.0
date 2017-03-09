Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f176.google.com (mail-qk0-f176.google.com
	[209.85.220.176])
	by mail.openembedded.org (Postfix) with ESMTP id 4630160079
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Mar 2017 12:38:21 +0000 (UTC)
Received: by mail-qk0-f176.google.com with SMTP id p64so116402704qke.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Mar 2017 04:38:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=tjhgb0bVnvyl8g8TJLio7MGxDXQWmyyohBwInIvg3bY=;
	b=f/jl2Eng9uMVmgnkE1ClbB2TF/ZkTCTnNIzRU6UfqnyTxyt25PhBVXAAVc3JI9Atz5
	I3QZ+mgRtRyiCwvQ2a9X1NnxzgT97KLLpN056w3PYYIWFfPaIpHTTF4iA0IHFo1r51x7
	Js5599CCwD6xlkKJWs6glf0Jw9K1yMthbzPIjAnqDAMvH/NwJfLLILdfCv3euGUvQcaW
	UDEpvTkJys1UNErypYhQQMD4KLi/ZALttmBdXMkiCm/DGZiD4GLYNvbYWahJ/uC+IhvU
	vNmCYLfe7k+byno4F/v8JxOULXfl5RrYkOikAoEEyxuerUN99cNEet8SvS7a56GeS5Sx
	IY/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=tjhgb0bVnvyl8g8TJLio7MGxDXQWmyyohBwInIvg3bY=;
	b=slvJB9xxHhqGlJIURGU3xPMLAfCbt16fpdPWffKoyfW4vfXq/4LoM7rN8HleW+fjwV
	8YnyWZ1/B9mgtUYin85gtB9/mWWKsIioien58IuYAC7YETEr4V+4bwxAyxvhbKN3e1vg
	p/TTZdEeSHFVrMZ3kFTlU3uLbF7gKO5rr+2wo1mKQHF+8OgmqAQmh1uiThfW0MaYbcvl
	mVBpvzHk8URrJM7YafG+gzjtELZGlKO/pZh98llDQBb5wwPjg3gn3IMjK/m8EWJXzpgS
	BktaL2hihmKLAbeSNnVqBCDr1opTa18Bv5n40GhG7KTkXghNh3lxabtaz+wm59oXY2f9
	v7Cw==
X-Gm-Message-State: AMke39nX8Xl1ZkrOk8vDbLfVz7Gv32ct/QLRVvjTu74nMbeQ/QbTiEzaE4dnveG9jCv5BPqFVoXS32oFibxn/cP/
X-Received: by 10.237.33.69 with SMTP id 63mr13742810qtc.109.1489063102099;
	Thu, 09 Mar 2017 04:38:22 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.22.166 with HTTP; Thu, 9 Mar 2017 04:38:01 -0800 (PST)
In-Reply-To: <1488993907-13037-1-git-send-email-ross.burton@intel.com>
References: <1488993907-13037-1-git-send-email-ross.burton@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 9 Mar 2017 12:38:01 +0000
Message-ID: <CAJTo0LZeOiwCJzMdeSCkHuj9mfHBbjwCAKZkeAsbziHBaVhmMg@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] classes: add gitupstream class
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
X-List-Received-Date: Thu, 09 Mar 2017 12:38:21 -0000
Content-Type: multipart/alternative; boundary=94eb2c0c7fc840224d054a4b85df

--94eb2c0c7fc840224d054a4b85df
Content-Type: text/plain; charset=UTF-8

On 8 March 2017 at 17:25, Ross Burton <ross.burton@intel.com> wrote:

> +    d.setVar("S", "${WORKDIR}/git")
> +        d.setVar("PV", pv + "+git${SRCPV}")
>

I guess these are the only two lines which are git-specific.  Would it be
sensible to be VCS-agnostic and simply look at the protocol of the first
entry in SRC_URI?

So if someone had:

BBCLASSEXTEND="devupstream:target"
SRC_URI_class-devupstream = "svn://some/svn/url"

You'd get:

S=${WORKDIR}/svn
PV=${PV}+svn${SRCPV}

Annoyingly that breaks current behaviour as svn checkouts use the module
name, whereas git clones just use "git" (and I can't remember why that is).
The class could look at the SRC_URI further: for git set SRC_URI to
WORKDIR/git, for svn set WORKDIR/{module name}.  Also current practise is
+svnr{SRCPV} not +svn, so that could either be special-cased again or
ignored.

Thoughts?  I don't want something to be merged which we rewrite in a
months' time...

Ross

--94eb2c0c7fc840224d054a4b85df
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 8 March 2017 at 17:25, Ross Burton <span dir=3D"ltr">&lt;<a href=3D"mail=
to:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com</a>&gt;</=
span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8e=
x;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":17e" class=3D"a3=
s aXjCH m15aaef3fa10343eb">+=C2=A0 =C2=A0 d.setVar(&quot;S&quot;, &quot;${W=
ORKDIR}/git&quot;)<br>+=C2=A0 =C2=A0 =C2=A0 =C2=A0 d.setVar(&quot;PV&quot;,=
 pv + &quot;+git${SRCPV}&quot;)</div></blockquote></div><br>I guess these a=
re the only two lines which are git-specific.=C2=A0 Would it be sensible to=
 be VCS-agnostic and simply look at the protocol of the first entry in SRC_=
URI?</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">S=
o if someone had:</div><div class=3D"gmail_extra"><br></div><div class=3D"g=
mail_extra">BBCLASSEXTEND=3D&quot;devupstream:target&quot;</div><div class=
=3D"gmail_extra">SRC_URI_class-devupstream =3D &quot;svn://some/svn/url&quo=
t;</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">You=
&#39;d get:</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_e=
xtra">S=3D${WORKDIR}/svn</div><div class=3D"gmail_extra">PV=3D${PV}+svn${SR=
CPV}</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">A=
nnoyingly that breaks current behaviour as svn checkouts use the module nam=
e, whereas git clones just use &quot;git&quot; (and I can&#39;t remember wh=
y that is). The class could look at the SRC_URI further: for git set SRC_UR=
I to WORKDIR/git, for svn set WORKDIR/{module name}.=C2=A0 Also current pra=
ctise is +svnr{SRCPV} not +svn, so that could either be special-cased again=
 or ignored.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_=
extra">Thoughts?=C2=A0 I don&#39;t want something to be merged which we rew=
rite in a months&#39; time...</div><div class=3D"gmail_extra"><br></div><di=
v class=3D"gmail_extra">Ross</div></div>

--94eb2c0c7fc840224d054a4b85df--
