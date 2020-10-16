Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com [209.85.218.65])
 by mx.groups.io with SMTP id smtpd.web10.11813.1602841531311174752
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Oct 2020 02:45:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Zcst9gVI;
 spf=pass (domain: gmail.com, ip: 209.85.218.65, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f65.google.com with SMTP id h24so2202532ejg.9
        for <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2020 02:45:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KE2l2Wo6y18eimW0pCc9prZapOpTIUM3QjmVBqkcIwg=;
        b=Zcst9gVIRkD6COU905Z+ZY1eZyQnuR7KNMyA0ouyCaey0utmnNhj3Hx7CtgBSkciCM
         yDLtETXJgJED56UvIMOA9QIDDpDr834fSCwvn5TmVaIUYOAvkhDjkjzod8KoU1rL99Uj
         Dhj1a8mU1YdSiVO5aIaAnMVbWlI9KnAj6hwgK1cGq+lHMFW/K4GOmofCFcOJ3l/+qJjN
         DgR8CcTyiLBvQn5jNRc4huks1cOXiPTSQhHz2Y7VJDDEHMekBaLjazbWtYgtNUx2E2eW
         l0eC//Hls5Epuq0Kds5/l8zFcPnXl49Q6u1YtXvimEHauqQegpFxb/gORHEVXhjFCJSM
         LDZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KE2l2Wo6y18eimW0pCc9prZapOpTIUM3QjmVBqkcIwg=;
        b=X7zamEUZmmJ2AL+rO8MK3ZilZPYbUYrVdkkqZcYNjMG5M/nfK/7BShCwoJtccQasbf
         VOcYlU9LIFPRC5YfrKFOHjavr37/icOmOhV3iHAyzfAlVSj08KN3mkF/Aypls0Y8NdRA
         EQe6/rZz/Hv4o5hVJjg38quHBjA6+fXhf8REQynvkhm/3mHL7UFduwsIwt1ezf4v+oVW
         LJs8J+/Iv0iB0gajGXP7IaiES1WUMAuc1pTZFuV49oAd2MrQcm3SbCtsisAeWBrB+GfH
         AZ0s2JYDi94qJNc1ELm36PbQQbEPnS8X45+mKSFbHeDVZ7PfgMau2IrA6xI9PwLe2UyZ
         5wAA==
X-Gm-Message-State: AOAM531KniC7FSyNKOLeQiaMBiXpq8JvX/oNpR4h5YMHjuUHPyQtPtlL
	sVG5eskNxTTWsc88PUxd/k6jn1ORVTgN/bgbqRc=
X-Google-Smtp-Source: ABdhPJwNbH/wL+4GoGuK8Hb8UnJrzy2Y/8M7aoPoZQKtTYkrQrlnBl2KkjBy0L5Hxb8x51Ymc0BygntK/cXtjoF7b7w=
X-Received: by 2002:a17:906:b285:: with SMTP id q5mr2874547ejz.470.1602841529700;
 Fri, 16 Oct 2020 02:45:29 -0700 (PDT)
MIME-Version: 1.0
References: <20201016092122.2002294-1-ross.burton@arm.com>
In-Reply-To: <20201016092122.2002294-1-ross.burton@arm.com>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Fri, 16 Oct 2020 11:45:18 +0200
Message-ID: <CA+chaQdCL8b+rP_RuJxz+Kt2nqL79nqOQU_Oun4xXzG48J5nNQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 1/2] waf: don't assume the waf intepretter is good
To: Ross Burton <ross@burtonini.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000000257b605b1c6a06c"

--0000000000000257b605b1c6a06c
Content-Type: text/plain; charset="UTF-8"

should it also inherit ${WAF_PYTHON}native, so that people who need to use
python2 don't need to inherit it in the recipe (as python is no longer in
HOSTTOOLS) or is python3-native considered unwanted dependency for the
default behavior?

I don't personally use waf, so no opinion either way from me.

On Fri, Oct 16, 2020 at 11:21 AM Ross Burton <ross@burtonini.com> wrote:

> Waf typically uses `python` as the intepretter but inside a task this
> does not exist.  Typically this is solved by patching waf (see the
> glmark2 recipe) but not all versionf of Waf support Python 3 so we can't
> assume a specific interpretter.
>
> Instead, create a new variable WAF_PYTHON for the correct interpretter,
> and default this to `python3`.  If the user has a recipe that needs
> Python 2 then this can be changed in the recipe.
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta/classes/waf.bbclass | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)
>
> diff --git a/meta/classes/waf.bbclass b/meta/classes/waf.bbclass
> index 309f625a40..8fa5063645 100644
> --- a/meta/classes/waf.bbclass
> +++ b/meta/classes/waf.bbclass
> @@ -1,6 +1,10 @@
>  # avoids build breaks when using no-static-libs.inc
>  DISABLE_STATIC = ""
>
> +# What Python interpretter to use.  Defaults to Python 3 but can be
> +# overridden if required.
> +WAF_PYTHON ?= "python3"
> +
>  B = "${WORKDIR}/build"
>
>  EXTRA_OECONF_append = " ${PACKAGECONFIG_CONFARGS}"
> @@ -40,9 +44,10 @@ python waf_preconfigure() {
>      import subprocess
>      from distutils.version import StrictVersion
>      subsrcdir = d.getVar('S')
> +    python = d.getVar('WAF_PYTHON')
>      wafbin = os.path.join(subsrcdir, 'waf')
>      try:
> -        result = subprocess.check_output([wafbin, '--version'],
> cwd=subsrcdir, stderr=subprocess.STDOUT)
> +        result = subprocess.check_output([python, wafbin, '--version'],
> cwd=subsrcdir, stderr=subprocess.STDOUT)
>          version = result.decode('utf-8').split()[1]
>          if StrictVersion(version) >= StrictVersion("1.8.7"):
>              d.setVar("WAF_EXTRA_CONF", "--bindir=${bindir}
> --libdir=${libdir}")
> @@ -55,16 +60,16 @@ python waf_preconfigure() {
>  do_configure[prefuncs] += "waf_preconfigure"
>
>  waf_do_configure() {
> -       (cd ${S} && ./waf configure -o ${B} --prefix=${prefix}
> ${WAF_EXTRA_CONF} ${EXTRA_OECONF})
> +       (cd ${S} && ${WAF_PYTHON} ./waf configure -o ${B}
> --prefix=${prefix} ${WAF_EXTRA_CONF} ${EXTRA_OECONF})
>  }
>
>  do_compile[progress] = "outof:^\[\s*(\d+)/\s*(\d+)\]\s+"
>  waf_do_compile()  {
> -       (cd ${S} && ./waf build ${@oe.utils.parallel_make_argument(d,
> '-j%d', limit=64)} ${EXTRA_OEWAF_BUILD})
> +       (cd ${S} && ${WAF_PYTHON} ./waf build
> ${@oe.utils.parallel_make_argument(d, '-j%d', limit=64)}
> ${EXTRA_OEWAF_BUILD})
>  }
>
>  waf_do_install() {
> -       (cd ${S} && ./waf install --destdir=${D} ${EXTRA_OEWAF_INSTALL})
> +       (cd ${S} && ${WAF_PYTHON} ./waf install --destdir=${D}
> ${EXTRA_OEWAF_INSTALL})
>  }
>
>  EXPORT_FUNCTIONS do_configure do_compile do_install
> --
> 2.25.1
>
>
> 
>
>

--0000000000000257b605b1c6a06c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">should it also inherit ${WAF_PYTHON}native, so that people=
 who need to use python2 don&#39;t need to inherit=C2=A0it in the recipe (a=
s python is no longer in HOSTTOOLS) or is python3-native considered unwante=
d dependency for the default behavior?<div><br></div><div>I don&#39;t perso=
nally use waf, so no opinion either way from me.</div></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Oct 16, 202=
0 at 11:21 AM Ross Burton &lt;<a href=3D"mailto:ross@burtonini.com">ross@bu=
rtonini.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">Waf typically uses `python` as the intepretter but inside a tas=
k this<br>
does not exist.=C2=A0 Typically this is solved by patching waf (see the<br=
>
glmark2 recipe) but not all versionf of Waf support Python 3 so we can&#39=
;t<br>
assume a specific interpretter.<br>
<br>
Instead, create a new variable WAF_PYTHON for the correct interpretter,<br=
>
and default this to `python3`.=C2=A0 If the user has a recipe that needs<b=
r>
Python 2 then this can be changed in the recipe.<br>
<br>
Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@arm.com" targ=
et=3D"_blank">ross.burton@arm.com</a>&gt;<br>
---<br>
=C2=A0meta/classes/waf.bbclass | 13 +++++++++----<br>
=C2=A01 file changed, 9 insertions(+), 4 deletions(-)<br>
<br>
diff --git a/meta/classes/waf.bbclass b/meta/classes/waf.bbclass<br>
index 309f625a40..8fa5063645 100644<br>
--- a/meta/classes/waf.bbclass<br>
+++ b/meta/classes/waf.bbclass<br>
@@ -1,6 +1,10 @@<br>
=C2=A0# avoids build breaks when using no-static-libs.inc<br>
=C2=A0DISABLE_STATIC =3D &quot;&quot;<br>
<br>
+# What Python interpretter to use.=C2=A0 Defaults to Python 3 but can be<=
br>
+# overridden if required.<br>
+WAF_PYTHON ?=3D &quot;python3&quot;<br>
+<br>
=C2=A0B =3D &quot;${WORKDIR}/build&quot;<br>
<br>
=C2=A0EXTRA_OECONF_append =3D &quot; ${PACKAGECONFIG_CONFARGS}&quot;<br>
@@ -40,9 +44,10 @@ python waf_preconfigure() {<br>
=C2=A0 =C2=A0 =C2=A0import subprocess<br>
=C2=A0 =C2=A0 =C2=A0from distutils.version import StrictVersion<br>
=C2=A0 =C2=A0 =C2=A0subsrcdir =3D d.getVar(&#39;S&#39;)<br>
+=C2=A0 =C2=A0 python =3D d.getVar(&#39;WAF_PYTHON&#39;)<br>
=C2=A0 =C2=A0 =C2=A0wafbin =3D os.path.join(subsrcdir, &#39;waf&#39;)<br>
=C2=A0 =C2=A0 =C2=A0try:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 result =3D subprocess.check_output([wafbin, &=
#39;--version&#39;], cwd=3Dsubsrcdir, stderr=3Dsubprocess.STDOUT)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 result =3D subprocess.check_output([python, w=
afbin, &#39;--version&#39;], cwd=3Dsubsrcdir, stderr=3Dsubprocess.STDOUT)<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0version =3D result.decode(&#39;utf-8&#39=
;).split()[1]<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if StrictVersion(version) &gt;=3D Strict=
Version(&quot;1.8.7&quot;):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0d.setVar(&quot;WAF_EXTRA_C=
ONF&quot;, &quot;--bindir=3D${bindir} --libdir=3D${libdir}&quot;)<br>
@@ -55,16 +60,16 @@ python waf_preconfigure() {<br>
=C2=A0do_configure[prefuncs] +=3D &quot;waf_preconfigure&quot;<br>
<br>
=C2=A0waf_do_configure() {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0(cd ${S} &amp;&amp; ./waf configure -o ${B} --=
prefix=3D${prefix} ${WAF_EXTRA_CONF} ${EXTRA_OECONF})<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(cd ${S} &amp;&amp; ${WAF_PYTHON} ./waf config=
ure -o ${B} --prefix=3D${prefix} ${WAF_EXTRA_CONF} ${EXTRA_OECONF})<br>
=C2=A0}<br>
<br>
=C2=A0do_compile[progress] =3D &quot;outof:^\[\s*(\d+)/\s*(\d+)\]\s+&quot;=
<br>
=C2=A0waf_do_compile()=C2=A0 {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0(cd ${S} &amp;&amp; ./waf build ${@oe.utils.pa=
rallel_make_argument(d, &#39;-j%d&#39;, limit=3D64)} ${EXTRA_OEWAF_BUILD})<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(cd ${S} &amp;&amp; ${WAF_PYTHON} ./waf build =
${@oe.utils.parallel_make_argument(d, &#39;-j%d&#39;, limit=3D64)} ${EXTRA_=
OEWAF_BUILD})<br>
=C2=A0}<br>
<br>
=C2=A0waf_do_install() {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0(cd ${S} &amp;&amp; ./waf install --destdir=3D=
${D} ${EXTRA_OEWAF_INSTALL})<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(cd ${S} &amp;&amp; ${WAF_PYTHON} ./waf instal=
l --destdir=3D${D} ${EXTRA_OEWAF_INSTALL})<br>
=C2=A0}<br>
<br>
=C2=A0EXPORT_FUNCTIONS do_configure do_compile do_install<br>
-- <br>
2.25.1<br>
<br>
<br>
<br>
<br>
</blockquote></div>

--0000000000000257b605b1c6a06c--
