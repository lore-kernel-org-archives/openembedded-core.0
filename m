Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
 by mx.groups.io with SMTP id smtpd.web12.11215.1602679287194223927
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Oct 2020 05:41:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=NABm5UqS;
 spf=pass (domain: gmail.com, ip: 209.85.221.68, mailfrom: jpewhacker@gmail.com)
Received: by mail-wr1-f68.google.com with SMTP id i1so3706796wro.1
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Oct 2020 05:41:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=L7AiJvLAnvlsbZlbxkmkenelXL+bmcN7lWSAUQ2pknc=;
        b=NABm5UqSec/ihyjspJpOsAG5rCeZC2rzr4h+St/J1GsRJpguqkC7by/6q4FCz7IeZk
         +MpXsd8OkXQSJqe3diQEcx6JcnLHUNgwneGXyWgrBqIo9VYuwPiYyfShjF0xMJl6+Hsw
         2ZtDBMSpAwkJAQ/n/kmZ1TvKTWmFVPw1wnIR7hvK7TkpJ7hXjVzTCGOOYvqXtUsWarFj
         UXKSg9+6cL3Hb5MDWC72Yfnc+q7KhV05BDgQQ+T4nBSRcLuOmiB0ZQ/lHn+iLvYKnHo2
         vcUZ6I1FSNCHx2+VzDTMEksqNjgvy1YELzx3KnvTEpYFVrzGt+JL56PhEDKZN5fREU2P
         YitA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=L7AiJvLAnvlsbZlbxkmkenelXL+bmcN7lWSAUQ2pknc=;
        b=dSF+W1ZgXRi75xbALNupYDFc6qQ3sNvIv30atU0UUW8IwbzMeI7uHBC8arr3XQdQOO
         7DF1qqeBCMGeG/ADE02r5whMfz2jZOUO9xC1i0TdSQF+Lq4b0xAW8GMab/C5MTFQYKjR
         GqACQpA1YMk2tIAE2C8TaKmvpVgUM9kZ1JXzopxok3IpHiOeBDSYdXImmHbGJVuMD7AO
         CeS24oHK8izagyB/KxUUmdif+k2kJAihfvrWDZz6ehQrx6VXqkyxXYYUTTmvwDeizKUy
         7hW+jY9vBtjdquJMHnIX0tSK5ehhQk3ERl8Tq9toBEsBSp1OtFpm7o52ul9BEEcyrl0k
         m6dQ==
X-Gm-Message-State: AOAM532Ws3kEe8QpdapHL7S+1Xqr6Lkwz1Wq2f2aeSVtY+Vr1W83ewnj
	c3odqDZIkcok+bQ+Aqx+uEkPpiFeOOsoel/pKag=
X-Google-Smtp-Source: ABdhPJybaoIv/0zInLWNQDqh/JjbdsOCtsLgxY/8We/DcbSEc3EB5TB0SEpmzerPbl8FWGBbTmO2FE01pl0BwdnLGb4=
X-Received: by 2002:a5d:6ca6:: with SMTP id a6mr5315708wra.348.1602679285402;
 Wed, 14 Oct 2020 05:41:25 -0700 (PDT)
MIME-Version: 1.0
References: <20201014112620.2244199-1-ross.burton@arm.com>
In-Reply-To: <20201014112620.2244199-1-ross.burton@arm.com>
From: "Joshua Watt" <JPEWhacker@gmail.com>
Date: Wed, 14 Oct 2020 07:41:14 -0500
Message-ID: <CAJdd5GY4QD03+UWP_y-ALi4vE54cf8-DTAYxMNOGrG1BZ-cHUw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] waf: explicitly run waf under Python 3
To: Ross Burton <ross@burtonini.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000007ed18b05b1a0d96d"

--0000000000007ed18b05b1a0d96d
Content-Type: text/plain; charset="UTF-8"

On Wed, Oct 14, 2020, 6:26 AM Ross Burton <ross@burtonini.com> wrote:

> We don't assume Python 2 is on the host and don't expose an unversioned
> python in HOSTTOOLS, but waf uses the unversion python binary.
>
> Typically this is solved by patching waf (see the glmark2 recipe) but
> this can be solved centrally by invoking python3 directly.  All wscripts
> that needed Python 2 would have been fixed by now.
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta/classes/waf.bbclass | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/meta/classes/waf.bbclass b/meta/classes/waf.bbclass
> index 309f625a40..df6d4d53e8 100644
> --- a/meta/classes/waf.bbclass
> +++ b/meta/classes/waf.bbclass
> @@ -42,7 +42,7 @@ python waf_preconfigure() {
>      subsrcdir = d.getVar('S')
>      wafbin = os.path.join(subsrcdir, 'waf')
>      try:
> -        result = subprocess.check_output([wafbin, '--version'],
> cwd=subsrcdir, stderr=subprocess.STDOUT)
> +        result = subprocess.check_output(['python3', wafbin,
> '--version'], cwd=subsrcdir, stderr=subprocess.STDOUT)
>

This will break our internal usage... We still use waf 1 which runs under
python 2 only :(, although we are working on transitioning

         version = result.decode('utf-8').split()[1]
>          if StrictVersion(version) >= StrictVersion("1.8.7"):
>              d.setVar("WAF_EXTRA_CONF", "--bindir=${bindir}
> --libdir=${libdir}")
> @@ -55,16 +55,16 @@ python waf_preconfigure() {
>  do_configure[prefuncs] += "waf_preconfigure"
>
>  waf_do_configure() {
> -       (cd ${S} && ./waf configure -o ${B} --prefix=${prefix}
> ${WAF_EXTRA_CONF} ${EXTRA_OECONF})
> +       (cd ${S} && python3 ./waf configure -o ${B} --prefix=${prefix}
> ${WAF_EXTRA_CONF} ${EXTRA_OECONF})
>  }
>
>  do_compile[progress] = "outof:^\[\s*(\d+)/\s*(\d+)\]\s+"
>  waf_do_compile()  {
> -       (cd ${S} && ./waf build ${@oe.utils.parallel_make_argument(d,
> '-j%d', limit=64)} ${EXTRA_OEWAF_BUILD})
> +       (cd ${S} && python3 ./waf build
> ${@oe.utils.parallel_make_argument(d, '-j%d', limit=64)}
> ${EXTRA_OEWAF_BUILD})
>  }
>
>  waf_do_install() {
> -       (cd ${S} && ./waf install --destdir=${D} ${EXTRA_OEWAF_INSTALL})
> +       (cd ${S} && python3 ./waf install --destdir=${D}
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

--0000000000007ed18b05b1a0d96d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Wed, Oct 14, 2020, 6:26 AM Ross Burton &lt;<a href=
=3D"mailto:ross@burtonini.com">ross@burtonini.com</a>&gt; wrote:<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">We don&#39;t assume Python 2 is on the host =
and don&#39;t expose an unversioned<br>
python in HOSTTOOLS, but waf uses the unversion python binary.<br>
<br>
Typically this is solved by patching waf (see the glmark2 recipe) but<br>
this can be solved centrally by invoking python3 directly.=C2=A0 All wscri=
pts<br>
that needed Python 2 would have been fixed by now.<br>
<br>
Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@arm.com" targ=
et=3D"_blank" rel=3D"noreferrer">ross.burton@arm.com</a>&gt;<br>
---<br>
=C2=A0meta/classes/waf.bbclass | 8 ++++----<br>
=C2=A01 file changed, 4 insertions(+), 4 deletions(-)<br>
<br>
diff --git a/meta/classes/waf.bbclass b/meta/classes/waf.bbclass<br>
index 309f625a40..df6d4d53e8 100644<br>
--- a/meta/classes/waf.bbclass<br>
+++ b/meta/classes/waf.bbclass<br>
@@ -42,7 +42,7 @@ python waf_preconfigure() {<br>
=C2=A0 =C2=A0 =C2=A0subsrcdir =3D d.getVar(&#39;S&#39;)<br>
=C2=A0 =C2=A0 =C2=A0wafbin =3D os.path.join(subsrcdir, &#39;waf&#39;)<br>
=C2=A0 =C2=A0 =C2=A0try:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 result =3D subprocess.check_output([wafbin, &=
#39;--version&#39;], cwd=3Dsubsrcdir, stderr=3Dsubprocess.STDOUT)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 result =3D subprocess.check_output([&#39;pyth=
on3&#39;, wafbin, &#39;--version&#39;], cwd=3Dsubsrcdir, stderr=3Dsubproces=
s.STDOUT)<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=
=3D"auto">This will break our internal usage... We still use waf 1 which r=
uns under python 2 only :(, although we are working on transitioning</div><=
div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote"><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #=
ccc solid;padding-left:1ex">
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0version =3D result.decode(&#39;utf-8&#39=
;).split()[1]<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if StrictVersion(version) &gt;=3D Strict=
Version(&quot;1.8.7&quot;):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0d.setVar(&quot;WAF_EXTRA_C=
ONF&quot;, &quot;--bindir=3D${bindir} --libdir=3D${libdir}&quot;)<br>
@@ -55,16 +55,16 @@ python waf_preconfigure() {<br>
=C2=A0do_configure[prefuncs] +=3D &quot;waf_preconfigure&quot;<br>
<br>
=C2=A0waf_do_configure() {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0(cd ${S} &amp;&amp; ./waf configure -o ${B} --=
prefix=3D${prefix} ${WAF_EXTRA_CONF} ${EXTRA_OECONF})<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(cd ${S} &amp;&amp; python3 ./waf configure -o=
 ${B} --prefix=3D${prefix} ${WAF_EXTRA_CONF} ${EXTRA_OECONF})<br>
=C2=A0}<br>
<br>
=C2=A0do_compile[progress] =3D &quot;outof:^\[\s*(\d+)/\s*(\d+)\]\s+&quot;=
<br>
=C2=A0waf_do_compile()=C2=A0 {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0(cd ${S} &amp;&amp; ./waf build ${@oe.utils.pa=
rallel_make_argument(d, &#39;-j%d&#39;, limit=3D64)} ${EXTRA_OEWAF_BUILD})<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(cd ${S} &amp;&amp; python3 ./waf build ${@oe.=
utils.parallel_make_argument(d, &#39;-j%d&#39;, limit=3D64)} ${EXTRA_OEWAF_=
BUILD})<br>
=C2=A0}<br>
<br>
=C2=A0waf_do_install() {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0(cd ${S} &amp;&amp; ./waf install --destdir=3D=
${D} ${EXTRA_OEWAF_INSTALL})<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(cd ${S} &amp;&amp; python3 ./waf install --de=
stdir=3D${D} ${EXTRA_OEWAF_INSTALL})<br>
=C2=A0}<br>
<br>
=C2=A0EXPORT_FUNCTIONS do_configure do_compile do_install<br>
-- <br>
2.25.1<br>
<br>
<br>
<br>
<br>
</blockquote></div></div></div>

--0000000000007ed18b05b1a0d96d--
