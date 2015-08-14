Return-Path: <kergoth@gmail.com>
Received: from mail-ig0-f170.google.com (mail-ig0-f170.google.com
	[209.85.213.170])
	by mail.openembedded.org (Postfix) with ESMTP id 7F069737F4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Aug 2015 22:01:26 +0000 (UTC)
Received: by igfj19 with SMTP id j19so22080647igf.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Aug 2015 15:01:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=WVdfYW1rSKXvCoaQf+eZ9oxFtrLluqN1AHxDwCfbLaI=;
	b=CkfB76n92VAhcA9yL/nwgJaucV6taS5M4IJtbHm8boAVQSfYyxnjz0f4QPV+GaqS/h
	oH+U1rdy3iEI++HpADlDenYJGG/GgthFxy68AvrcT+M8flpZfGowa0McxqMzmZS+gWSb
	OZVwl67vq3e3sRW3IAJXLH7K1PUcsxIgyLW4NcNfo0/3TWxQJQia8Bi0GipLTvmz7WSb
	BVsn0Y1jypmfEWlS3rHpk/+Js8XZwohYeEixXBYlwHsjrb77c6Q131vDxRBXlPIvo5sc
	AircvuOAu/EAEePkPhbm1g53F8HVTJkm6Yqvzy73uf3rG6v+Ygz1TQtcuft3SjxCIKHA
	GngQ==
X-Received: by 10.50.225.35 with SMTP id rh3mr4847877igc.29.1439589686856;
	Fri, 14 Aug 2015 15:01:26 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.79.100.199 with HTTP; Fri, 14 Aug 2015 15:01:07 -0700 (PDT)
In-Reply-To: <20150813062742.GN6102@loska>
References: <1439303596-18965-1-git-send-email-ed.bartosh@linux.intel.com>
	<1439372011-26268-1-git-send-email-ed.bartosh@linux.intel.com>
	<20150812094953.GL6102@loska>
	<CAMKF1squ7h9gzvrX8u3m2_K_BeO7gto_ji5f4UBdJxnuNMyLZA@mail.gmail.com>
	<CABcZANmtCK18u2m2R51SmZN3Xrq7+FxY8PXMXJ4Y6-WVA3tGMQ@mail.gmail.com>
	<CABcZANkHBUNH5Zo3opKT-uwfneMYghTBTJCV8awOm-6D_0SK1w@mail.gmail.com>
	<20150813062742.GN6102@loska>
From: Christopher Larson <clarson@kergoth.com>
Date: Fri, 14 Aug 2015 15:01:07 -0700
X-Google-Sender-Auth: DWFwBAGZorak-6c9TjFp3KWgLFs
Message-ID: <CABcZANkKkXbb+5BFYBARLOTGKBdaon_+4cvQDGDZw8WWqSmt_g@mail.gmail.com>
To: Mikko.Rapeli@bmw.de
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: shell script guidelines in oe-core? (was Re: [PATCH v4] create-pull-request: cleanup bashisms)
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
X-List-Received-Date: Fri, 14 Aug 2015 22:01:28 -0000
Content-Type: multipart/alternative; boundary=001a1132f214e853b3051d4c9774

--001a1132f214e853b3051d4c9774
Content-Type: text/plain; charset=UTF-8

On Wed, Aug 12, 2015 at 11:27 PM, <Mikko.Rapeli@bmw.de> wrote:

> On Wed, Aug 12, 2015 at 10:51:26AM -0700, Christopher Larson wrote:
> > That reminds me, there's a shell portability issue / standards-complaince
> > issue that's not identified by shellcheck. Typically, to negate a
> bracket
> > expression in a regular expression, one uses ^, e.g. [^a-z] is everything
> > that isn't in the range a to z, but that's not the case in shell, e.g.
> at a
> > prompt or in a ${foo#<pattern>}:
> >
> >     "[...]a bracket expression as in XBD *RE Bracket Expression* , except
> > that the <exclamation-mark> character ( '!' ) shall replace the
> > <circumflex> character ( '^' ) in its role in a non-matching list in the
> > regular expression notation"
> >
> > So in shell, you'd want [!a-z] rather than [^a-z]. Nearly all shells
> handle
> > both, but the behavior of the latter is actually unspecified according to
> > the standard:
> >
> >     "A bracket expression starting with an unquoted <circumflex>
> character
> > produces unspecified results."
> >
> > I recently got bitten by this with one of my shell scripts on a system
> > running dash.
>
> Does checkbashisms warn about this?


Finally got around to checking, and yeah, checkbashisms does spot this one,
it's just shellcheck that doesn't (yet, opened a bug upstream).

-Chris


-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a1132f214e853b3051d4c9774
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Wed, Aug 12, 2015 at 11:27 PM,  <span dir=3D"ltr">&lt;<a href=3D"mailto:=
Mikko.Rapeli@bmw.de" target=3D"_blank">Mikko.Rapeli@bmw.de</a>&gt;</span> w=
rote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex"><span class=3D"">On Wed, Aug 12, 20=
15 at 10:51:26AM -0700, Christopher Larson wrote:<br>
&gt; That reminds me, there&#39;s a shell portability issue / standards-com=
plaince<br>
&gt; issue that&#39;s not identified by shellcheck. Typically, to negate a=
=C2=A0 bracket<br>
&gt; expression in a regular expression, one uses ^, e.g. [^a-z] is everyth=
ing<br>
&gt; that isn&#39;t in the range a to z, but that&#39;s not the case in she=
ll, e.g. at a<br>
&gt; prompt or in a ${foo#&lt;pattern&gt;}:<br>
&gt;<br>
</span>&gt;=C2=A0 =C2=A0 =C2=A0&quot;[...]a bracket expression as in XBD *R=
E Bracket Expression* , except<br>
<span class=3D"">&gt; that the &lt;exclamation-mark&gt; character ( &#39;!&=
#39; ) shall replace the<br>
&gt; &lt;circumflex&gt; character ( &#39;^&#39; ) in its role in a non-matc=
hing list in the<br>
&gt; regular expression notation&quot;<br>
&gt;<br>
&gt; So in shell, you&#39;d want [!a-z] rather than [^a-z]. Nearly all shel=
ls handle<br>
&gt; both, but the behavior of the latter is actually unspecified according=
 to<br>
&gt; the standard:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;A bracket expression starting with an unquote=
d &lt;circumflex&gt; character<br>
&gt; produces unspecified results.&quot;<br>
&gt;<br>
&gt; I recently got bitten by this with one of my shell scripts on a system=
<br>
&gt; running dash.<br>
<br>
</span>Does checkbashisms warn about this?</blockquote></div><br>Finally go=
t around to checking, and yeah, checkbashisms does spot this one, it&#39;s =
just shellcheck that doesn&#39;t (yet, opened a bug upstream).</div><div cl=
ass=3D"gmail_extra"><br></div><div class=3D"gmail_extra">-Chris<br><br clea=
r=3D"all"><div><br></div>-- <br><div class=3D"gmail_signature">Christopher =
Larson<br>clarson at kergoth dot com<br>Founder - BitBake, OpenEmbedded, Op=
enZaurus<br>Maintainer - Tslib<br>Senior Software Engineer, Mentor Graphics=
</div>
</div></div>

--001a1132f214e853b3051d4c9774--
