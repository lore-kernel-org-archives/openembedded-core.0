Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f48.google.com (mail-wm0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id F25A0601A5
	for <openembedded-core@lists.openembedded.org>;
	Sat,  5 Dec 2015 00:07:26 +0000 (UTC)
Received: by wmww144 with SMTP id w144so80858542wmw.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 Dec 2015 16:07:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=EB+qQM71cdUcTUVT/4TFZjJoUYrykmm9V0dfKZxNZW8=;
	b=0i8b1ciFuCpFBA46x4nW5jZC0PpilkvkSwcItC/y++32ekuw43oGr9kbOiaJPdXkZs
	G2LcrmpcR3X3t+8cxuV50yI+N1YiHpyTJmQ7d9+qp7PJz1sXp3T3e29PapIMdyFXN71+
	W2618CZg7yylaPGKpUM6hCSF5R09cQIcd2jcF20DeIufqQfliohFXwgLVSzXc6Bex9BK
	3SQfVVr5Zdz/tpRzj7p+H41hA34S5CKaF0QOnuH0jfOu8OEjqgvum7K0JUWZMNhOchDn
	5mIFpctTdYGmQ3/ed/gSA57ASmKVYLmgjilHSa2PaV24aZQSfADKFN592JOi5gZaZzHf
	hjNw==
MIME-Version: 1.0
X-Received: by 10.28.175.144 with SMTP id y138mr7716791wme.47.1449274047032;
	Fri, 04 Dec 2015 16:07:27 -0800 (PST)
Received: by 10.194.2.15 with HTTP; Fri, 4 Dec 2015 16:07:26 -0800 (PST)
In-Reply-To: <1449273356.14864.232.camel@linuxfoundation.org>
References: <1449262027-26919-1-git-send-email-Martin.Jansa@gmail.com>
	<1449273356.14864.232.camel@linuxfoundation.org>
Date: Sat, 5 Dec 2015 01:07:26 +0100
Message-ID: <CA+chaQc9JrMVv-iGoX8waOEPLAOiktGdULRwzkhgfLdRHWQB1A@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] texinfo: don't create dependency on INHERIT variable
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
X-List-Received-Date: Sat, 05 Dec 2015 00:07:29 -0000
Content-Type: multipart/alternative; boundary=001a11444b64c172ec05261b6808

--001a11444b64c172ec05261b6808
Content-Type: text/plain; charset=UTF-8

Probably yes, I don't know why it was written in this way before and I've
just blindly followed it to fix the issue I was seeing.

v2 coming soon.

On Sat, Dec 5, 2015 at 12:55 AM, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Fri, 2015-12-04 at 21:47 +0100, Martin Jansa wrote:
> > * we don't want the do_package signature depending on INHERIT variable
> > * e.g. just adding the own-mirrors causes texinfo to rebuild:
> >   # bitbake-diffsigs BUILD/sstate-diff/*/*/texinfo/*do_package.sig*
> >   basehash changed from 015df2fd8e396cc1e15622dbac843301 to
> 9f1d06c4f238c70a99ccb6d8da348b6a
> >   Variable INHERIT value changed from
> >   ' rm_work blacklist blacklist report-error ${PACKAGE_CLASSES}
> ${USER_CLASSES} ${INHERIT_DISTRO} ${INHERIT_BLACKLIST} sanity'
> >   to
> >   ' rm_work own-mirrors blacklist blacklist report-error
> ${PACKAGE_CLASSES} ${USER_CLASSES} ${INHERIT_DISTRO} ${INHERIT_BLACKLIST}
> sanity'
> >
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> >  meta/recipes-extended/texinfo/texinfo_6.0.bb | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-extended/texinfo/texinfo_6.0.bb
> b/meta/recipes-extended/texinfo/texinfo_6.0.bb
> > index 8fb715a..b0a6975 100644
> > --- a/meta/recipes-extended/texinfo/texinfo_6.0.bb
> > +++ b/meta/recipes-extended/texinfo/texinfo_6.0.bb
> > @@ -9,8 +9,11 @@ LIC_FILES_CHKSUM =
> "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
> >
> >  PROVIDES_append_class-native = " texinfo-replacement-native"
> >
> > +DOC_COMPRESS_ENABLED = "${@ '1' if 'compress_doc' in
> (d.getVar('INHERIT', True) or '').split() else '0' }"
> > +DOC_COMPRESS_ENABLED[vardepvalue] = "${DOC_COMPRESS_ENABLED}"
> > +
> >  def compress_pkg(d):
> > -    if "compress_doc" in (d.getVar("INHERIT", True) or "").split():
> > +    if d.getVar("DOC_COMPRESS_ENABLED", True) == "1":
>
> Could we use:
>
> if bb.data.inherits_class("compress_doc", d):
>
> ?
>
> Cheers,
>
> Richard
>
>

--001a11444b64c172ec05261b6808
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Probably yes, I don&#39;t know why it was written in this =
way before and I&#39;ve just blindly followed it to fix the issue I was see=
ing.<div><br></div><div>v2 coming soon.</div></div><div class=3D"gmail_extr=
a"><br><div class=3D"gmail_quote">On Sat, Dec 5, 2015 at 12:55 AM, Richard =
Purdie <span dir=3D"ltr">&lt;<a href=3D"mailto:richard.purdie@linuxfoundati=
on.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt;</span>=
 wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex"><div class=3D"HOEnZb"><div class=
=3D"h5">On Fri, 2015-12-04 at 21:47 +0100, Martin Jansa wrote:<br>
&gt; * we don&#39;t want the do_package signature depending on INHERIT vari=
able<br>
&gt; * e.g. just adding the own-mirrors causes texinfo to rebuild:<br>
&gt;=C2=A0 =C2=A0# bitbake-diffsigs BUILD/sstate-diff/*/*/texinfo/*do_packa=
ge.sig*<br>
&gt;=C2=A0 =C2=A0basehash changed from 015df2fd8e396cc1e15622dbac843301 to =
9f1d06c4f238c70a99ccb6d8da348b6a<br>
&gt;=C2=A0 =C2=A0Variable INHERIT value changed from<br>
&gt;=C2=A0 =C2=A0&#39; rm_work blacklist blacklist report-error ${PACKAGE_C=
LASSES} ${USER_CLASSES} ${INHERIT_DISTRO} ${INHERIT_BLACKLIST} sanity&#39;<=
br>
&gt;=C2=A0 =C2=A0to<br>
&gt;=C2=A0 =C2=A0&#39; rm_work own-mirrors blacklist blacklist report-error=
 ${PACKAGE_CLASSES} ${USER_CLASSES} ${INHERIT_DISTRO} ${INHERIT_BLACKLIST} =
sanity&#39;<br>
&gt;<br>
&gt; Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.c=
om">Martin.Jansa@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/recipes-extended/texinfo/<a href=3D"http://texinfo_6.0.bb" =
rel=3D"noreferrer" target=3D"_blank">texinfo_6.0.bb</a> | 5 ++++-<br>
&gt;=C2=A0 1 file changed, 4 insertions(+), 1 deletion(-)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-extended/texinfo/<a href=3D"http://texinfo_6=
.0.bb" rel=3D"noreferrer" target=3D"_blank">texinfo_6.0.bb</a> b/meta/recip=
es-extended/texinfo/<a href=3D"http://texinfo_6.0.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">texinfo_6.0.bb</a><br>
&gt; index 8fb715a..b0a6975 100644<br>
&gt; --- a/meta/recipes-extended/texinfo/<a href=3D"http://texinfo_6.0.bb" =
rel=3D"noreferrer" target=3D"_blank">texinfo_6.0.bb</a><br>
&gt; +++ b/meta/recipes-extended/texinfo/<a href=3D"http://texinfo_6.0.bb" =
rel=3D"noreferrer" target=3D"_blank">texinfo_6.0.bb</a><br>
&gt; @@ -9,8 +9,11 @@ LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Dd3223=
9bcb673463ab874e80d47fae504&quot;<br>
&gt;<br>
&gt;=C2=A0 PROVIDES_append_class-native =3D &quot; texinfo-replacement-nati=
ve&quot;<br>
&gt;<br>
&gt; +DOC_COMPRESS_ENABLED =3D &quot;${@ &#39;1&#39; if &#39;compress_doc&#=
39; in (d.getVar(&#39;INHERIT&#39;, True) or &#39;&#39;).split() else &#39;=
0&#39; }&quot;<br>
&gt; +DOC_COMPRESS_ENABLED[vardepvalue] =3D &quot;${DOC_COMPRESS_ENABLED}&q=
uot;<br>
&gt; +<br>
&gt;=C2=A0 def compress_pkg(d):<br>
&gt; -=C2=A0 =C2=A0 if &quot;compress_doc&quot; in (d.getVar(&quot;INHERIT&=
quot;, True) or &quot;&quot;).split():<br>
&gt; +=C2=A0 =C2=A0 if d.getVar(&quot;DOC_COMPRESS_ENABLED&quot;, True) =3D=
=3D &quot;1&quot;:<br>
<br>
</div></div>Could we use:<br>
<br>
if bb.data.inherits_class(&quot;compress_doc&quot;, d):<br>
<br>
?<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
</blockquote></div><br></div>

--001a11444b64c172ec05261b6808--
