Return-Path: <kergoth@gmail.com>
Received: from mail-lb0-f173.google.com (mail-lb0-f173.google.com
	[209.85.217.173])
	by mail.openembedded.org (Postfix) with ESMTP id E4DD9706F1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Aug 2014 17:21:51 +0000 (UTC)
Received: by mail-lb0-f173.google.com with SMTP id u10so721lbd.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Aug 2014 10:21:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=4v0B8uMQNaUrtp0AInWTC7h63v8gQeSySPHfnPbjQls=;
	b=dMi2HCvBiwce+w0tWCl8P3jNqXhuf1WvpmZMzgEyjz997feCXOAtLzQehohXJnWVoq
	+5fDnuNaSonsHJSMB2Xr/xHJyHQepNrIl53sXfsfa8+M+P7bPOWbwnX40uh2mzeD7iDe
	uHSSCR/1NrbTvC7t5FUM/4A02sT9Tnc2qioYz7/XFoFK6NKbQVygxXQX2SKzytl5ClRT
	zzDUV3WeuSZYccS3Y2zJFxqx6Rg1vCBAcgcepp88AkCA0ly5JtDZE0ngw46N7BogBfEh
	jO9iUl4949tbGG3dnOK0UMLqdxEdZLyEj7vvmeorEuRj6tlq5yXIgsjnp+Fy16kLiS+6
	3SOQ==
X-Received: by 10.112.30.39 with SMTP id p7mr21547426lbh.35.1408987311574;
	Mon, 25 Aug 2014 10:21:51 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.112.43.42 with HTTP; Mon, 25 Aug 2014 10:21:31 -0700 (PDT)
In-Reply-To: <20140825171945.GA25050@haswell>
References: <1408983725-45864-1-git-send-email-fahad_usman@mentor.com>
	<20140825171945.GA25050@haswell>
From: Christopher Larson <clarson@kergoth.com>
Date: Mon, 25 Aug 2014 10:21:31 -0700
X-Google-Sender-Auth: XV7lo1kUtnJyI6ouL4FSsL_2YSQ
Message-ID: <CABcZAN=x7u=gF=-NfbBNLUcqvXgzte_CK_52rQGYikaNSXqU_A@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] logrotate: obey our flags
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
X-List-Received-Date: Mon, 25 Aug 2014 17:21:52 -0000
Content-Type: multipart/alternative; boundary=001a113475683316f60501776c14

--001a113475683316f60501776c14
Content-Type: text/plain; charset=UTF-8

On Mon, Aug 25, 2014 at 10:19 AM, Khem Raj <raj.khem@gmail.com> wrote:

> On 14-08-25 21:22:04, Fahad Usman wrote:
> > Needed to quiet GNU_HASH warnings, amd some minor fixes.
> >
> > Signed-off-by: Fahad Usman <fahad.usman@gmail.com>
> > Signed-off-by: Christopher Larson <kergoth@gmail.com>
> > ---
> >  meta/recipes-extended/logrotate/logrotate_3.8.7.bb |   18
> ++++++++++++++++--
> >  1 file changed, 16 insertions(+), 2 deletions(-)
> >
> > diff --git a/meta/recipes-extended/logrotate/logrotate_3.8.7.bb
> b/meta/recipes-extended/logrotate/logrotate_3.8.7.bb
> > index 3a6a228..42cd764 100644
> > --- a/meta/recipes-extended/logrotate/logrotate_3.8.7.bb
> > +++ b/meta/recipes-extended/logrotate/logrotate_3.8.7.bb
> > @@ -16,7 +16,21 @@ SRC_URI = "
> https://fedorahosted.org/releases/l/o/logrotate/logrotate-${PV}.tar.g
> >  SRC_URI[md5sum] = "99e08503ef24c3e2e3ff74cc5f3be213"
> >  SRC_URI[sha256sum] =
> "f6ba691f40e30e640efa2752c1f9499a3f9738257660994de70a45fe00d12b64"
> >
> > -EXTRA_OEMAKE = ""
> > +# If RPM_OPT_FLAGS is unset, it adds -g itself rather than obeying our
> > +# optimization variables, so use it rather than EXTRA_CFLAGS.
> > +EXTRA_OEMAKE = "\
> > +    LFS= \
> > +    OS_NAME='${OS_NAME}' \
> > +    \
> > +    'CC=${CC}' \
>
> hmmm CC may have spaces in it so you might need 'CC="${CC}"' or somesuch


Nope, the whole CC=${CC} argument is already quoted, note the single quotes
around it. Those quotes mean the entire CC=${CC} bit ends up in the
appropriate argument for make, so there's no need to quote the value alone.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a113475683316f60501776c14
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Mon, Aug 25, 2014 at 10:19 AM, Khem Raj <span dir=3D"ltr">&lt;<a href=3D=
"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</s=
pan> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"">On 14-08-25 21:22:04, Fahad =
Usman wrote:<br>
&gt; Needed to quiet GNU_HASH warnings, amd some minor fixes.<br>
&gt;<br>
&gt; Signed-off-by: Fahad Usman &lt;<a href=3D"mailto:fahad.usman@gmail.com=
">fahad.usman@gmail.com</a>&gt;<br>
&gt; Signed-off-by: Christopher Larson &lt;<a href=3D"mailto:kergoth@gmail.=
com">kergoth@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/recipes-extended/logrotate/<a href=3D"http://logrotate_3.8.=
7.bb" target=3D"_blank">logrotate_3.8.7.bb</a> |=C2=A0 =C2=A018 +++++++++++=
+++++--<br>
&gt;=C2=A0 1 file changed, 16 insertions(+), 2 deletions(-)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-extended/logrotate/<a href=3D"http://logrota=
te_3.8.7.bb" target=3D"_blank">logrotate_3.8.7.bb</a> b/meta/recipes-extend=
ed/logrotate/<a href=3D"http://logrotate_3.8.7.bb" target=3D"_blank">logrot=
ate_3.8.7.bb</a><br>


&gt; index 3a6a228..42cd764 100644<br>
&gt; --- a/meta/recipes-extended/logrotate/<a href=3D"http://logrotate_3.8.=
7.bb" target=3D"_blank">logrotate_3.8.7.bb</a><br>
&gt; +++ b/meta/recipes-extended/logrotate/<a href=3D"http://logrotate_3.8.=
7.bb" target=3D"_blank">logrotate_3.8.7.bb</a><br>
&gt; @@ -16,7 +16,21 @@ SRC_URI =3D &quot;<a href=3D"https://fedorahosted.o=
rg/releases/l/o/logrotate/logrotate-${PV}.tar.g" target=3D"_blank">https://=
fedorahosted.org/releases/l/o/logrotate/logrotate-${PV}.tar.g</a><br>
&gt;=C2=A0 SRC_URI[md5sum] =3D &quot;99e08503ef24c3e2e3ff74cc5f3be213&quot;=
<br>
&gt;=C2=A0 SRC_URI[sha256sum] =3D &quot;f6ba691f40e30e640efa2752c1f9499a3f9=
738257660994de70a45fe00d12b64&quot;<br>
&gt;<br>
&gt; -EXTRA_OEMAKE =3D &quot;&quot;<br>
&gt; +# If RPM_OPT_FLAGS is unset, it adds -g itself rather than obeying ou=
r<br>
&gt; +# optimization variables, so use it rather than EXTRA_CFLAGS.<br>
&gt; +EXTRA_OEMAKE =3D &quot;\<br>
&gt; +=C2=A0 =C2=A0 LFS=3D \<br>
&gt; +=C2=A0 =C2=A0 OS_NAME=3D&#39;${OS_NAME}&#39; \<br>
&gt; +=C2=A0 =C2=A0 \<br>
&gt; +=C2=A0 =C2=A0 &#39;CC=3D${CC}&#39; \<br>
<br>
</div>hmmm CC may have spaces in it so you might need &#39;CC=3D&quot;${CC}=
&quot;&#39; or somesuch</blockquote></div><br></div><div class=3D"gmail_ext=
ra">Nope, the whole CC=3D${CC} argument is already quoted, note the single =
quotes around it. Those quotes mean the entire CC=3D${CC} bit ends up in th=
e appropriate argument for make, so there&#39;s no need to quote the value =
alone.<br>

-- <br>Christopher Larson<br>clarson at kergoth dot com<br>Founder - BitBak=
e, OpenEmbedded, OpenZaurus<br>Maintainer - Tslib<br>Senior Software Engine=
er, Mentor Graphics
</div></div>

--001a113475683316f60501776c14--
