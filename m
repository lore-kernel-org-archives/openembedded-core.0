Return-Path: <martin.jansa@gmail.com>
Received: from mail-ua0-f169.google.com (mail-ua0-f169.google.com
	[209.85.217.169])
	by mail.openembedded.org (Postfix) with ESMTP id DC343782BC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Aug 2017 21:13:43 +0000 (UTC)
Received: by mail-ua0-f169.google.com with SMTP id k12so13363768uag.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Aug 2017 14:13:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=7sVMhbdcPxnx4AX2SUGbHxjfxbXYdIZ8QE65DYsrmWo=;
	b=VpIzZZAjiOOJ6lj0SSoYHi+9UkH3mKCdMLx53URYD+vyyz5rMlMidGUii2a4rMKPaG
	b10fDS0M8nxHdG/S0ZV3huZ1xAmmWa8MAabkfX4aq2PWEbGCDGsoFafQ1kVGTqPRjgKS
	fo3Eun4mlhlNByCNu1mw3OKDAhAqEWemKaLk0thlbjHxEs+nrIKo7aqo3hNOsKHy7sdy
	HVRBrouD60lEgeXjvKxPDN1Cgn1TMj0pTHYQBjofd3RsiIuC931DHYmkU7T/1/qcKAEa
	bGE6uz059iWLwNXVMe8FsY1AQJdCTM+WoLB+ao4d3DIoavLRjJFveI81SJYx5kTVbVWt
	MO0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=7sVMhbdcPxnx4AX2SUGbHxjfxbXYdIZ8QE65DYsrmWo=;
	b=NuSSUtSYy3u/6sfmPMzlGDMMhdpmwXS+4HvC49uBkQhzv+bDCKpTK+jVg9Wjejq/2O
	lHqTnU+2YDiipC59oChHKY2kpo7v8bPgUvSebGnKPVh4iTA1aa1E5NBXL4ye9e3A6O4d
	y8hpVqEUnPwY/NgaclLRfqO87KxfnlmF9INyTDGLdHxfaQa7CPJ13R3GXQywLAnNDm/r
	3Pj3xdBDKDs9ainK/H8eUIXmRncPegnMgX0tyGdiAr1vSjlQx2OhiI2gwY8WPJXJRj4w
	71XTh+cEnGc/ijNH0hIGOJyL5DVYZAKnoRZS34wCjNLxLUY8GyQw4xPgKw7zh+B7ru/o
	ysAw==
X-Gm-Message-State: AHYfb5jtfXj+0lW7IvpyKqph9YLFM9/R9OwAsVu6mo5+85Oh44z6Ud97
	gSsZN15ej+VpOwvnoC1hvMfPPa/Cnw==
X-Received: by 10.159.60.90 with SMTP id w26mr177882uah.160.1503350024973;
	Mon, 21 Aug 2017 14:13:44 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.122.88 with HTTP; Mon, 21 Aug 2017 14:13:44 -0700 (PDT)
In-Reply-To: <1503349649.32591.71.camel@linuxfoundation.org>
References: <20170821065633.27570-1-Martin.Jansa@gmail.com>
	<20170821205624.19892-1-Martin.Jansa@gmail.com>
	<1503349649.32591.71.camel@linuxfoundation.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 21 Aug 2017 23:13:44 +0200
Message-ID: <CA+chaQdU05LZtB_LB8y0aMi=Oqe6uyGO=3SY_X4q2xCYtJNZNQ@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2] insane.bbclass: write QA issues to log file only when they are in ERROR_QA or WARN_QA
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
X-List-Received-Date: Mon, 21 Aug 2017 21:13:44 -0000
Content-Type: multipart/alternative; boundary="f40304364344363466055749f43c"

--f40304364344363466055749f43c
Content-Type: text/plain; charset="UTF-8"

> all messages are put into the log but at differing log levels.

But there aren't the "log levels" in the file (as NOTE, WARN, ERROR) now,
it writes only P, error message and type of QA check (not the selected
severity of it, like bb.error, bb.warn, bb.note used in the function for
normal output).

See the function above package_qa_handle_error:

def package_qa_write_error(type, error, d):
    logfile = d.getVar('QA_LOGFILE')
    if logfile:
        p = d.getVar('P')
        with open(logfile, "a+") as f:
            f.write("%s: %s [%s]\n" % (p, error, type))


On Mon, Aug 21, 2017 at 11:07 PM, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Mon, 2017-08-21 at 22:56 +0200, Martin Jansa wrote:
> > * QA check which aren't included in WARN_QA and ERROR_QA are shown
> >   during the build only as NOTE message (not shown at all with
> > default
> >   knotty setting), so it might be surprising to see them later in
> > qa.log
> >   file
> >
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> >  meta/classes/insane.bbclass | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
>
> I've just been having a look at this and I think its by design, all
> messages are put into the log but at differing log levels. I think the
> correct thing to do may be to filter it as you proposed in your CI
> system.
>
> Any other opinions?
>
> Cheers,
>
> Richard
>

--f40304364344363466055749f43c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>&gt;=C2=A0<span style=3D"font-size:12.8px">all=C2=A0<=
/span><span style=3D"font-size:12.8px">messages are put into the log but at=
 differing log levels.</span></div><div><br></div><div>But there aren&#39;t=
 the &quot;log levels&quot; in the file (as NOTE, WARN, ERROR) now, it writ=
es only P, error message and type of QA check (not the selected severity of=
 it, like bb.error, bb.warn, bb.note used in the function for normal output=
).</div><div><br></div><div>See the function above=C2=A0package_qa_handle_e=
rror:</div><div><br></div><div>def package_qa_write_error(type, error, d):<=
/div><div>=C2=A0 =C2=A0 logfile =3D d.getVar(&#39;QA_LOGFILE&#39;)</div><di=
v>=C2=A0 =C2=A0 if logfile:</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 p =3D d.g=
etVar(&#39;P&#39;)</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 with open(logfile,=
 &quot;a+&quot;) as f:</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
f.write(&quot;%s: %s [%s]\n&quot; % (p, error, type))</div><div><br></div><=
/div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Mon, Aug =
21, 2017 at 11:07 PM, Richard Purdie <span dir=3D"ltr">&lt;<a href=3D"mailt=
o:richard.purdie@linuxfoundation.org" target=3D"_blank">richard.purdie@linu=
xfoundation.org</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" =
style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><sp=
an class=3D"">On Mon, 2017-08-21 at 22:56 +0200, Martin Jansa wrote:<br>
&gt; * QA check which aren&#39;t included in WARN_QA and ERROR_QA are shown=
<br>
&gt; =C2=A0 during the build only as NOTE message (not shown at all with<br=
>
&gt; default<br>
&gt; =C2=A0 knotty setting), so it might be surprising to see them later in=
<br>
&gt; qa.log<br>
&gt; =C2=A0 file<br>
&gt;<br>
&gt; Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.c=
om">Martin.Jansa@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt; =C2=A0meta/classes/insane.bbclass | 3 ++-<br>
&gt; =C2=A01 file changed, 2 insertions(+), 1 deletion(-)<br>
<br>
</span>I&#39;ve just been having a look at this and I think its by design, =
all<br>
messages are put into the log but at differing log levels. I think the<br>
correct thing to do may be to filter it as you proposed in your CI<br>
system.<br>
<br>
Any other opinions?<br>
<br>
Cheers,<br>
<br>
Richard<br>
</blockquote></div><br></div>

--f40304364344363466055749f43c--
