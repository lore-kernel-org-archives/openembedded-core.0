Return-Path: <kergoth@gmail.com>
Received: from mail-qg0-f43.google.com (mail-qg0-f43.google.com
	[209.85.192.43])
	by mail.openembedded.org (Postfix) with ESMTP id DCFDC72B1E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Mar 2015 20:36:05 +0000 (UTC)
Received: by qgh3 with SMTP id 3so50732761qgh.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Mar 2015 13:36:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=eMSaIbU5/9aleGbXLlYaueNxvJdOf3m++gFGS7EBUx8=;
	b=ZX6+Kdr4JGAGlBP49nEU/nItPDw0Sdubadey0VJY3ruiFgkY1KXzm5LZnSZMH28QQP
	aBs0EPSOeyXbzw4QmU91KvOkjNKknYvcRTe+DF9s/NjfIA6wPqx8SopbuU50dc2LEIaE
	877FmcPEk2DU8lEd8d2EYwVngpa2PW6km03neAIbK08ICuqRZ5YBhjETlfU3FTmaWy4V
	FxyO3NiJLgPZaYy7UxRUG+37qT0tYPUkW/t/Orr3V08ZNe4UwlzHbKRT0PAWnz9FyaRU
	B3V3Gq7F6aYXuh1b+yd5XsdwxjYQtCqpHMsIRhQ3T9/5Q+uaE7t31NhHrugLaP+Y7A7e
	HlwA==
X-Received: by 10.140.102.120 with SMTP id v111mr13244579qge.93.1427315766249; 
	Wed, 25 Mar 2015 13:36:06 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.140.108.75 with HTTP; Wed, 25 Mar 2015 13:35:46 -0700 (PDT)
In-Reply-To: <2616204.si38TmSJD5@yow-masselst-d1>
References: <1427300914-11208-1-git-send-email-mark.asselstine@windriver.com>
	<CABcZANnJymdXZq0m1NgAQndp+-ou7o7i+1sW5C+8ZCFtybeS4w@mail.gmail.com>
	<2616204.si38TmSJD5@yow-masselst-d1>
From: Christopher Larson <clarson@kergoth.com>
Date: Wed, 25 Mar 2015 13:35:46 -0700
X-Google-Sender-Auth: bq5CsP4CgyqTd3LaQRjr8_iPOb4
Message-ID: <CABcZANnWKxuF6jGU1Zn3XwDery4+4RJRi28x5gCpH0M+LMQD8A@mail.gmail.com>
To: Mark Asselstine <mark.asselstine@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] openssl: add a vardeps for configure on libdir
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
X-List-Received-Date: Wed, 25 Mar 2015 20:36:07 -0000
Content-Type: multipart/alternative; boundary=001a11c16f543ad07d051222d9e7

--001a11c16f543ad07d051222d9e7
Content-Type: text/plain; charset=UTF-8

On Wed, Mar 25, 2015 at 12:28 PM, Mark Asselstine <
mark.asselstine@windriver.com> wrote:

> My first attempt I had tried "libdir" and it doesn't seem to have the
> needed
> effect. I was hesitant to use other variables (such as those that libdir is
> derived from) as that would fork how -native and target builds would be
> handled. I had found other instances (meta/classes/package.bbclass) that
> seemed to use vardeps on expanded variables. At any rate I will circle
> back,
> your comment was not entirely unexpected, just the push that is needed for
> me
> to look more closely. I will follow up in a bit.
>

package.bbclass has variables containing / functions returning lists of
variable names. libdir isn't a list of variable names, it's a path.

> Second, if libdir is used in do_configure, then changing
> > it will already cause do_configure to be re-run, as bitbake tracks
> variable
> > references. Only references which can't be tracked by bitbake need to be
> > listed explicitly.
>
> The observed behavior definitely supports the view that this is a case
> where
> it can't be tracked. It is definitely a different usage than you would find
> normally.
>
> do_configure () {
> ...
>     perl ./Configure ${EXTRA_OECONF} shared --prefix=$useprefix \
>        --openssldir=${libdir}/ssl --libdir=`basename ${libdir}` $target
> }
>


Nope, this is exactly what bitbake knows how to track, a standard variable
reference; ${libdir}. It knows that do_configure uses libdir already. It's
only when the variable name is determined programmatically at runtime in
python that bitbake isn't able to track the reference (e.g. d.getVar(foo +
"bar", True)).
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a11c16f543ad07d051222d9e7
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Wed, Mar 25, 2015 at 12:28 PM, Mark Asselstine <span dir=3D"ltr">&lt;<a =
href=3D"mailto:mark.asselstine@windriver.com" target=3D"_blank">mark.assels=
tine@windriver.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quot=
e" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">=
<div id=3D":bi" class=3D"a3s" style=3D"overflow:hidden">My first attempt I =
had tried &quot;libdir&quot; and it doesn&#39;t seem to have the needed<br>
effect. I was hesitant to use other variables (such as those that libdir is=
<br>
derived from) as that would fork how -native and target builds would be<br>
handled. I had found other instances (meta/classes/package.bbclass) that<br=
>
seemed to use vardeps on expanded variables. At any rate I will circle back=
,<br>
your comment was not entirely unexpected, just the push that is needed for =
me<br>
to look more closely. I will follow up in a bit.<br></div></blockquote><div=
><br></div><div>package.bbclass has variables containing / functions return=
ing lists of variable names. libdir isn&#39;t a list of variable names, it&=
#39;s a path.</div><div><br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=
=3D":bi" class=3D"a3s" style=3D"overflow:hidden"><span class=3D"">
&gt; Second, if libdir is used in do_configure, then changing<br>
&gt; it will already cause do_configure to be re-run, as bitbake tracks var=
iable<br>
&gt; references. Only references which can&#39;t be tracked by bitbake need=
 to be<br>
&gt; listed explicitly.<br>
<br>
</span>The observed behavior definitely supports the view that this is a ca=
se where<br>
it can&#39;t be tracked. It is definitely a different usage than you would =
find<br>
normally.<br>
<br>
do_configure () {<br>
...<br>
=C2=A0 =C2=A0 perl ./Configure ${EXTRA_OECONF} shared --prefix=3D$useprefix=
 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0--openssldir=3D${libdir}/ssl --libdir=3D`basenam=
e ${libdir}` $target<br>
}</div></blockquote></div><br><br>Nope, this is exactly what bitbake knows =
how to track, a standard variable reference; ${libdir}. It knows that do_co=
nfigure uses libdir already. It&#39;s only when the variable name is determ=
ined programmatically at runtime in python that bitbake isn&#39;t able to t=
rack the reference (e.g. d.getVar(foo + &quot;bar&quot;, True)).<br>-- <br>=
<div class=3D"gmail_signature">Christopher Larson<br>clarson at kergoth dot=
 com<br>Founder - BitBake, OpenEmbedded, OpenZaurus<br>Maintainer - Tslib<b=
r>Senior Software Engineer, Mentor Graphics</div>
</div></div>

--001a11c16f543ad07d051222d9e7--
