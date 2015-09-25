Return-Path: <kergoth@gmail.com>
Received: from mail-io0-f180.google.com (mail-io0-f180.google.com
	[209.85.223.180])
	by mail.openembedded.org (Postfix) with ESMTP id 95AD07680E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Sep 2015 16:29:55 +0000 (UTC)
Received: by iofb144 with SMTP id b144so116695300iof.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Sep 2015 09:29:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=2f+wvaYS4Vn4kx/eyy2IAuhmEFOls0/bB3x86xIOYHo=;
	b=XiKy8D7grAAxqmKDvdabuoRmSiM+iBnd1nCqt4rcLp4uwy7NYVY9hPn8g2Qpclxq7o
	uGjXYgEpSG6l1DIG2XMskCH0crydstu7vI5jrtn3kht/rGd/VEdFpNaOcAtNqdAJeGJ3
	X0FfAcvezuICYnMyLUSQu1TIuBixDDb81FB6m+LEny2fUmHvGadk95f6LYiMUMAvx3eo
	IxsRem83Yi0zSjj6WVY/VxMdqXPJJsNSY29pbleLFKkSlrUTtvblQ/8CHVam6qiYoJEd
	4PQKaMNrFQNv2jilw4T+OkXLpcIdLAuHwixeNEAB9ntGbDYwwId4Esp9XuX5xxDhfcDg
	i6fg==
X-Received: by 10.107.128.41 with SMTP id b41mr7187712iod.74.1443198595398;
	Fri, 25 Sep 2015 09:29:55 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.79.100.71 with HTTP; Fri, 25 Sep 2015 09:29:35 -0700 (PDT)
In-Reply-To: <1443198035-30551-1-git-send-email-ross.burton@intel.com>
References: <1443198035-30551-1-git-send-email-ross.burton@intel.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Fri, 25 Sep 2015 09:29:35 -0700
X-Google-Sender-Auth: fUw7J7DFS3IPOiaTm9VD56fm0WA
Message-ID: <CABcZANkSSCbS9S6WyUAVeJd5Kn95=AR8jDYXL2UFmnDXCLFVEw@mail.gmail.com>
To: Ross Burton <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] sstate: fix typo resulting in crazy directory creation
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
X-List-Received-Date: Fri, 25 Sep 2015 16:29:59 -0000
Content-Type: multipart/alternative; boundary=001a113f8bf09e840e052094db01

--001a113f8bf09e840e052094db01
Content-Type: text/plain; charset=UTF-8

On Fri, Sep 25, 2015 at 9:20 AM, Ross Burton <ross.burton@intel.com> wrote:

> A transposed , and ) meant that a string was passed to a function instead
> of a
> list of strings, so bitbake ends up creating a directory for every
> character in
> the current working directory.
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/classes/sstate.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
> index b257734..d09e27a 100644
> --- a/meta/classes/sstate.bbclass
> +++ b/meta/classes/sstate.bbclass
> @@ -644,7 +644,7 @@ python sstate_task_postfunc () {
>
>      sstate_install(shared_state, d)
>      for intercept in shared_state['interceptfuncs']:
> -        bb.build.exec_func(intercept, d, (d.getVar("WORKDIR", True,)))
> +        bb.build.exec_func(intercept, d, (d.getVar("WORKDIR", True),))
>      omask = os.umask(002)
>      if omask != 002:
>         bb.note("Using umask 002 (not %0o) for sstate packaging" % omask)
>

I think I'd have just passed a list instead of a tuple here :) Easier to
parse visually.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a113f8bf09e840e052094db01
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Fri, Sep 25, 2015 at 9:20 AM, Ross Burton <span dir=3D"ltr">&lt;<a href=
=3D"mailto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":32f" cla=
ss=3D"a3s" style=3D"overflow:hidden">A transposed , and ) meant that a stri=
ng was passed to a function instead of a<br>
list of strings, so <span class=3D"il">bitbake</span> ends up creating a di=
rectory for every character in<br>
the current working directory.<br>
<br>
Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@intel.com">ros=
s.burton@intel.com</a>&gt;<br>
---<br>
=C2=A0meta/classes/sstate.<span class=3D"il">bbclass</span> | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/classes/sstate.<span class=3D"il">bbclass</span> b/meta/c=
lasses/sstate.<span class=3D"il">bbclass</span><br>
index b257734..d09e27a 100644<br>
--- a/meta/classes/sstate.<span class=3D"il">bbclass</span><br>
+++ b/meta/classes/sstate.<span class=3D"il">bbclass</span><br>
@@ -644,7 +644,7 @@ python sstate_task_postfunc () {<br>
<br>
=C2=A0 =C2=A0 =C2=A0sstate_install(shared_state, d)<br>
=C2=A0 =C2=A0 =C2=A0for intercept in shared_state[&#39;interceptfuncs&#39;]=
:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 <span class=3D"il">bb</span>.build.exec_func(i=
ntercept, d, (d.getVar(&quot;WORKDIR&quot;, True,)))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 <span class=3D"il">bb</span>.build.exec_func(i=
ntercept, d, (d.getVar(&quot;WORKDIR&quot;, True),))<br>
=C2=A0 =C2=A0 =C2=A0omask =3D os.umask(002)<br>
=C2=A0 =C2=A0 =C2=A0if omask !=3D 002:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 <span class=3D"il">bb</span>.note(&quot;Using u=
mask 002 (not %0o) for sstate packaging&quot; % omask)</div></blockquote></=
div><br>I think I&#39;d have just passed a list instead of a tuple here :) =
Easier to parse visually.<br>-- <br><div class=3D"gmail_signature">Christop=
her Larson<br>clarson at kergoth dot com<br>Founder - BitBake, OpenEmbedded=
, OpenZaurus<br>Maintainer - Tslib<br>Senior Software Engineer, Mentor Grap=
hics</div>
</div></div>

--001a113f8bf09e840e052094db01--
