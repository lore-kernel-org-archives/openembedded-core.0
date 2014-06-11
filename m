Return-Path: <kergoth@gmail.com>
Received: from mail-la0-f53.google.com (mail-la0-f53.google.com
	[209.85.215.53])
	by mail.openembedded.org (Postfix) with ESMTP id BB3706BCB3;
	Wed, 11 Jun 2014 19:24:56 +0000 (UTC)
Received: by mail-la0-f53.google.com with SMTP id ty20so115410lab.40
	for <multiple recipients>; Wed, 11 Jun 2014 12:24:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=08OQ65u/73VAW1w45dPHF9Wmm+G9NdxgDQxzgeyvXdk=;
	b=LCU99cQSZe67kMRwNuo3YIqC+Q/FmiTHs/0HddhEFVuCYCj9f554s78WOYEcZ8nUMa
	5Zg8s2tYZHyIL4c4eqgBLQz0DmTHNTCzU02vS9+Qy/whtMeboKQ7KjMkvqlrmV0PLJ1X
	h3PzbhRMqlwEYOHWQjmW4SSBEqHaNNaskeJrmnR0x8n/Iijys0EloxYrAf+h5FBxmDwa
	+vdv44hZaGJ7H3MhNmQgqxj7eFMCjS9mXdByctWNAYqmA63pa4OFO04KTK/Amp82V+XU
	MHM0c2Q3Br0KOaylMTzJpqviji3igXynXYeJdL+CuVR4qT+qY9tcL7kQ4/iELmMYuKFI
	7vdQ==
X-Received: by 10.152.45.37 with SMTP id j5mr3174128lam.58.1402514696740; Wed,
	11 Jun 2014 12:24:56 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.112.148.170 with HTTP; Wed, 11 Jun 2014 12:24:36 -0700 (PDT)
In-Reply-To: <CAJTo0LacXy5_wf39pX9z078RD0vU0BpvWsNTdZqcr6dMobpXWw@mail.gmail.com>
References: <CAJTo0LacXy5_wf39pX9z078RD0vU0BpvWsNTdZqcr6dMobpXWw@mail.gmail.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Wed, 11 Jun 2014 12:24:36 -0700
X-Google-Sender-Auth: YQNv8eMEzH2zGYV-MeANHrdg8UI
Message-ID: <CABcZANnZQJuXq_umM5SYZ+Z665PEjO+jdwwVV9Nz50pcWa1DOg@mail.gmail.com>
To: Openembedded Discussion <openembedded-devel@lists.openembedded.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [oe] RFC: automatic -dbg splitting
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
X-List-Received-Date: Wed, 11 Jun 2014 19:24:58 -0000
Content-Type: multipart/alternative; boundary=001a11c28c104aa63504fb946658

--001a11c28c104aa63504fb946658
Content-Type: text/plain; charset=UTF-8

On Wed, Jun 11, 2014 at 12:10 PM, Burton, Ross <ross.burton@intel.com>
wrote:

> So yet again I was wrestling PACKAGES and FILES in an attempt to get
> everything in the right place, the latest complication being ptest and
> where they are in the PACKAGES chain making correct splitting tricky.
>
> Again I wondered why debug packages need explicit FILES, and did a
> quick hack as a proof of concept to put split debug objects and source
> code into PN-dbg automatically, instead of through explicit FILES.
> This hack is at best: it clears FILES_PN-dbg in bitbake.conf and as it
> executes do_package FILES is set for each file it handles.  As PN-dbg
> is at the beginning of PACKAGES it takes the right files before other
> packages, apart from when other =+ is used as in ptest... so my
> original reason for looking at this is still a problem.  This is in
> ross/debug in poky-contrib, fwiw.
>
> Before I look at this again and avoid FILES entirely, I should check
> that my assumptions are valid in the greater community.  My big
> assumptions here are that 1) every recipe has a single -dbg package,
> 2) every debug object belongs in that -dbg package, 3) only debug
> objects and sources belong in that -dbg package.
>
> I know there are recipes floating around that have multiple -dbg
> packages, but I can't see a great rationale for that.  I also can't
> see a reason why you'd want debug objects/sources outside of the -dbg
> package, or something that wasn't a debug object or source inside the
> -dbg package.
>

This seems like a step in the right direction to me.

I do think we should also pursue going a step further, adding the ability
to automatically emit a per-binary-package -dbg package, rather than a
single monolithic recipe-wide one. This would mean that adding dbg-pkgs to
an image is cleaner and doesn't result in installing every sub-package of
the recipe. This change you're proposing would make it easier to extend to
potentially do this, possibly optionally.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a11c28c104aa63504fb946658
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Wed, Jun 11, 2014 at 12:10 PM, Burton, Ross <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com<=
/a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div id=3D":e6" class=3D"a3s" style=3D"overf=
low:hidden">So yet again I was wrestling PACKAGES and FILES in an attempt t=
o get<br>


everything in the right place, the latest complication being ptest and<br>
where they are in the PACKAGES chain making correct splitting tricky.<br>
<br>
Again I wondered why debug packages need explicit FILES, and did a<br>
quick hack as a proof of concept to put split debug objects and source<br>
code into PN-dbg automatically, instead of through explicit FILES.<br>
This hack is at best: it clears FILES_PN-dbg in bitbake.conf and as it<br>
executes do_package FILES is set for each file it handles. =C2=A0As PN-dbg<=
br>
is at the beginning of PACKAGES it takes the right files before other<br>
packages, apart from when other =3D+ is used as in ptest... so my<br>
original reason for looking at this is still a problem. =C2=A0This is in<br=
>
ross/debug in poky-contrib, fwiw.<br>
<br>
Before I look at this again and avoid FILES entirely, I should check<br>
that my assumptions are valid in the greater community. =C2=A0My big<br>
assumptions here are that 1) every recipe has a single -dbg package,<br>
2) every debug object belongs in that -dbg package, 3) only debug<br>
objects and sources belong in that -dbg package.<br>
<br>
I know there are recipes floating around that have multiple -dbg<br>
packages, but I can&#39;t see a great rationale for that. =C2=A0I also can&=
#39;t<br>
see a reason why you&#39;d want debug objects/sources outside of the -dbg<b=
r>
package, or something that wasn&#39;t a debug object or source inside the<b=
r>
-dbg package.</div></blockquote></div><br></div><div class=3D"gmail_extra">=
This seems like a step in the right direction to me.<br><br>I do think we s=
hould also pursue going a step further, adding the ability to automatically=
 emit a per-binary-package -dbg package, rather than a single monolithic re=
cipe-wide one. This would mean that adding dbg-pkgs to an image is cleaner =
and doesn&#39;t result in installing every sub-package of the recipe. This =
change you&#39;re proposing would make it easier to extend to potentially d=
o this, possibly optionally.<br>

-- <br>Christopher Larson<br>clarson at kergoth dot com<br>Founder - BitBak=
e, OpenEmbedded, OpenZaurus<br>Maintainer - Tslib<br>Senior Software Engine=
er, Mentor Graphics
</div></div>

--001a11c28c104aa63504fb946658--
