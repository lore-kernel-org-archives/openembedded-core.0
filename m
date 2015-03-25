Return-Path: <kergoth@gmail.com>
Received: from mail-qg0-f52.google.com (mail-qg0-f52.google.com
	[209.85.192.52])
	by mail.openembedded.org (Postfix) with ESMTP id 0FE006AC36
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Mar 2015 17:34:20 +0000 (UTC)
Received: by qgep97 with SMTP id p97so54171750qge.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Mar 2015 10:34:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=LCV7uPfOpgOXbv56wsFRY0q0+MyG6AwraxneyeJq/xg=;
	b=xkvQz3waVFKUwMsDy7gkUv6fmGprW+jjstqQHPcoD7pkAL2DJwdOzztOtLRU4FYgKI
	9TvTD/DmXYwmgIbiA+qW/ve1Iz4sKBOaqht792Nv7/f1pv8KT9CODpAQRlMga2RFox4g
	f/252og2x/gJYwNEN/chZPloELO7N6JReQ0hf0qpXYnnmExWZbjkym8hMh7O4gTepqSo
	UNV9wpC3QshDRYimESzUj+Qh+mfN6LCWTUWTEujCCv3/fmSrC6z2elnpfk3CqEJZHreJ
	5ndrB2NffqM+yHqFwnXylnnpR0xUupiTfYrJY+A7BIdZah7ABmEhOHuulsjfm6rE0lek
	1AKw==
X-Received: by 10.55.26.167 with SMTP id l39mr20937532qkh.63.1427304861317;
	Wed, 25 Mar 2015 10:34:21 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.140.108.75 with HTTP; Wed, 25 Mar 2015 10:34:00 -0700 (PDT)
In-Reply-To: <1427300914-11208-1-git-send-email-mark.asselstine@windriver.com>
References: <1427300914-11208-1-git-send-email-mark.asselstine@windriver.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Wed, 25 Mar 2015 10:34:00 -0700
X-Google-Sender-Auth: Q4ZD-4HlygspYwMGiIwJ9654yHk
Message-ID: <CABcZANnJymdXZq0m1NgAQndp+-ou7o7i+1sW5C+8ZCFtybeS4w@mail.gmail.com>
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
X-List-Received-Date: Wed, 25 Mar 2015 17:34:22 -0000
Content-Type: multipart/alternative; boundary=001a114414f03ec0cf0512204f81

--001a114414f03ec0cf0512204f81
Content-Type: text/plain; charset=UTF-8

On Wed, Mar 25, 2015 at 9:28 AM, Mark Asselstine <
mark.asselstine@windriver.com> wrote:

> Configure makes use of 'libdir' to set 'openssldir'. Unfortunately
> openssl treats this as a hardcoded absolute path. The value passed in
> as openssl becomes part of header files and baked in to executables.
>
> For target builds libdir is not something that changes and for -native
> builds unless you move your builds around you will see no issue with
> the current implementation. If you do update libdir or if you move
> your build or reuse sstate by copying it to a new build you will start
> to see errors. These will be seen when you use the 'openssl' tool and
> look like the following:
>
> WARNING: can't open config file: /home/build/bitbake_build/tmp/
>                         sysroots/x86_64-linux/usr/lib/ssl/openssl.cnf
>
> Knowing that openssl treats 'openssldir' as a hard coded absolute path
> and that we set this in configure we must add a 'vardeps' to ensure
> that things get re-configured and built whenever 'libdir' is
> modified. This will fix both target and -native builds per the
> usecases described above. If 'libdir' is unchanged things continue to
> function as they did before and a re-configure will not happen.
>
> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> ---
>  meta/recipes-connectivity/openssl/openssl.inc | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta/recipes-connectivity/openssl/openssl.inc
> b/meta/recipes-connectivity/openssl/openssl.inc
> index d337017..105b3fa 100644
> --- a/meta/recipes-connectivity/openssl/openssl.inc
> +++ b/meta/recipes-connectivity/openssl/openssl.inc
> @@ -54,6 +54,8 @@ do_configure_prepend_darwin () {
>         sed -i -e '/version-script=openssl\.ld/d' Configure
>  }
>
> +do_configure[vardeps] += "${libdir}"
>

This really doesn't make sense. First of all, vardeps is a list of
variables, but the expanded libdir is not a variable name. Perhaps you
meant += "libdir"? Second, if libdir is used in do_configure, then changing
it will already cause do_configure to be re-run, as bitbake tracks variable
references. Only references which can't be tracked by bitbake need to be
listed explicitly.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a114414f03ec0cf0512204f81
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Wed, Mar 25, 2015 at 9:28 AM, Mark Asselstine <span dir=3D"ltr">&lt;<a h=
ref=3D"mailto:mark.asselstine@windriver.com" target=3D"_blank">mark.asselst=
ine@windriver.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color=
:rgb(204,204,204);border-left-style:solid;padding-left:1ex"><div id=3D":40a=
" class=3D"" style=3D"overflow:hidden">Configure makes use of &#39;libdir&#=
39; to set &#39;openssldir&#39;. Unfortunately<br>
openssl treats this as a hardcoded absolute path. The value passed in<br>
as openssl becomes part of header files and baked in to executables.<br>
<br>
For target builds libdir is not something that changes and for -native<br>
builds unless you move your builds around you will see no issue with<br>
the current implementation. If you do update libdir or if you move<br>
your build or reuse sstate by copying it to a new build you will start<br>
to see errors. These will be seen when you use the &#39;openssl&#39; tool a=
nd<br>
look like the following:<br>
<br>
WARNING: can&#39;t open config file: /home/build/bitbake_build/tmp/<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 sysroots/x86_64-linux/usr/lib/ssl/openssl.cnf<br>
<br>
Knowing that openssl treats &#39;openssldir&#39; as a hard coded absolute p=
ath<br>
and that we set this in configure we must add a &#39;vardeps&#39; to ensure=
<br>
that things get re-configured and built whenever &#39;libdir&#39; is<br>
modified. This will fix both target and -native builds per the<br>
usecases described above. If &#39;libdir&#39; is unchanged things continue =
to<br>
function as they did before and a re-configure will not happen.<br>
<br>
Signed-off-by: Mark Asselstine &lt;<a href=3D"mailto:mark.asselstine@windri=
ver.com">mark.asselstine@windriver.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-connectivity/openssl/openssl.inc | 2 ++<br>
=C2=A01 file changed, 2 insertions(+)<br>
<br>
diff --git a/meta/recipes-connectivity/openssl/openssl.inc b/meta/recipes-c=
onnectivity/openssl/openssl.inc<br>
index d337017..105b3fa 100644<br>
--- a/meta/recipes-connectivity/openssl/openssl.inc<br>
+++ b/meta/recipes-connectivity/openssl/openssl.inc<br>
@@ -54,6 +54,8 @@ do_configure_prepend_darwin () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 sed -i -e &#39;/version-script=3Dopenssl\.ld/d&=
#39; Configure<br>
=C2=A0}<br>
<br>
+do_configure[vardeps] +=3D &quot;${libdir}&quot;</div></blockquote></div><=
br>This really doesn&#39;t make sense. First of all, vardeps is a list of v=
ariables, but the expanded libdir is not a variable name. Perhaps you meant=
 +=3D &quot;libdir&quot;? Second, if libdir is used in do_configure, then c=
hanging it will already cause do_configure to be re-run, as bitbake tracks =
variable references. Only references which can&#39;t be tracked by bitbake =
need to be listed explicitly.<br>-- <br><div class=3D"gmail_signature">Chri=
stopher Larson<br>clarson at kergoth dot com<br>Founder - BitBake, OpenEmbe=
dded, OpenZaurus<br>Maintainer - Tslib<br>Senior Software Engineer, Mentor =
Graphics</div>
</div></div>

--001a114414f03ec0cf0512204f81--
