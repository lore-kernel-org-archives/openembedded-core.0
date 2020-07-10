Received: from mail-vs1-f67.google.com (mail-vs1-f67.google.com [209.85.217.67])
 by mx.groups.io with SMTP id smtpd.web10.5011.1594413709860946464
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jul 2020 13:41:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=IcQNs53d;
 spf=pass (domain: gmail.com, ip: 209.85.217.67, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f67.google.com with SMTP id x13so3668743vsx.13
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Jul 2020 13:41:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GyPal7gXVbR8ImmjuEWgZm+U5Lxhyj5ZfqjVQPWYgIY=;
        b=IcQNs53dRDGzIu8Yenc25HTxK7/EDKfZOEyby8PczdSYqsKdwuLh+wkeQt7YPkP2Zg
         8gibL//PEO+RCwYgPwaWEotwXl/Eq30biqTGuqkQ+byyaTvCdqq6o+J0BhC5s+0J7sSP
         I4qKvyuFliMnjGv9ANaPCQLcDaNDkCfG9GqFTydQx3/Em704xgjwecW1+Rl9pWNVQxC0
         KwLBoaS0O40Jefuj0kg+x2qMnFm7M9rFttUtqbfLzx44Rw12i3Ipx67ZdhwizUJz8n4P
         nhErY/W3m0f3X4aIuXAp9EdklkCaKF8NichUNrI4NYmiACDobmPtmcetuUi8PbRuh7rn
         qvJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GyPal7gXVbR8ImmjuEWgZm+U5Lxhyj5ZfqjVQPWYgIY=;
        b=Ke/hPTPfDVWBAhYZQYU7ilqDD8rkWQv9lk0luTWTBAhXhmRySFHvlW/rSmvy4iAz6w
         1NNfa4o8MlqMlQ4SqM7SYto1oFCZGH1K7Kgt/qp4AMeegozCcsSlzzKwgyYBMHuAb/BX
         wWlxBeHw0mjAVMX+XxeioYXYNVUVEXMSUiWFEYWcPpTfPj7oKZ9mtyQKqAm5zINHY8r7
         J/NBbfWeC8dg9ZaFUq+UJjt5MFAjwVU9f6KrTJ0IXsn5P9goIZJWQtLeC/CuqoLTkwfW
         eMotY33lh+CYK5fSIRawuQL76PBPSHLWskNsidWE7R/hZIxl4nI4mcTRf9jyfRJLSE6J
         V+0Q==
X-Gm-Message-State: AOAM533cv0S5ZRnI97M28oILXeaC6fGt6x11S2oeDdP876yPy5dxg7Im
	ijfFIFYALrzO/XP8NulJr9ozyEM2d6/XgEWI3As=
X-Google-Smtp-Source: ABdhPJzfb012Mo1eN1p+Uo80i2CG4/Q+V1OOCqMH3et08HEj96t8nSwuQK2TIOXlxoD3ntVTrUsUzB7L16R142BoeZA=
X-Received: by 2002:a05:6102:126a:: with SMTP id q10mr34904801vsg.35.1594413709044;
 Fri, 10 Jul 2020 13:41:49 -0700 (PDT)
MIME-Version: 1.0
References: <20200710190810.1967868-1-takondra@cisco.com>
In-Reply-To: <20200710190810.1967868-1-takondra@cisco.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Fri, 10 Jul 2020 22:41:37 +0200
Message-ID: <CANNYZj9sJAaPdPQ2yPkN5iPBiUA9jNQ4qLSvbhxGGXja2oTR-A@mail.gmail.com>
Subject: Re: [RFC PATCH] devtool: remove _PYTHON_SYSCONFIGDATA_NAME to fix do_unpack
To: Taras Kondratiuk <takondra@cisco.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>, 
	"xe-linux-external(mailer list)" <xe-linux-external@cisco.com>, Martin Jansa <Martin.Jansa@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000c0ae3a05aa1c5e85"

--000000000000c0ae3a05aa1c5e85
Content-Type: text/plain; charset="UTF-8"

I am able to do 'devtool modify gpgme' without any errors. In what setting
does it fail for you?

The purpose of _sysconfigdata is to substitute configuration values that
are specific for target python when running native python in cross builds
with requests from target component build systems to supply those values.
For that to work, the recipe also needs to have target python3 in its
DEPENDS. It

I feel the patch is fixing the symptom rather than the issue somehow?


Alex

On Fri, 10 Jul 2020 at 21:08, Taras Kondratiuk <takondra@cisco.com> wrote:

> 'devtool modify' fails for packages that inherit python3native (e.g.
> gpgme or systemd, via meson class):
> | Exception: ModuleNotFoundError: No module named '_sysconfigdata'
>
> After commit 02714c105426 ("python3: upgrade to 3.7.2") python3native
> class exports _PYTHON_SYSCONFIGDATA_NAME = '_sysconfigdata'. I think the
> expectation is that it will find
> usr/lib/python-sysconfigdata/_sysconfigdata.py prepared by the same
> commit. But some places seems to still use host python3 which doesn't
> have _sysconfigdata.py. This leads to "No module named '_sysconfigdata'"
> errors. E.g. commit 4b26eaf7152f ("prservice.py: fix do_package with
> newer Python in Ubuntu 20.04") recently tried to workaround it for PR
> service. And now we see similar issue in devtool. To unblock devtool
> apply similar workaround here.
>
> But looks like there is some deeper issue here. I haven't fully grasped
> the purpose of _sysconfigdata.py yet. It is copied from
> _sysconfigdata_m_linux_x86_64-linux-gnu.py and then some variables are
> modified. But new values seems to be wrong. For example:
> In _sysconfigdata_m_linux_x86_64-linux-gnu.py:
> 'INCLUDEPY': 'FIXMESTAGINGDIRHOST/usr/include/python3.7m',
> While in _sysconfigdata.py:
> 'INCLUDEPY':
> 'FIXMESTAGINGDIRHOSTFIXMESTAGINGDIRHOST/usr/include/python3.7m',
>
> When FIXMESTAGINGDIRHOST is replaces by staging.bbclass, the path in
> _sysconfigdata.py points to nowhere while
> _sysconfigdata_m_linux_x86_64-linux-gnu.py has a correct path.
>
> Signed-off-by: Taras Kondratiuk <takondra@cisco.com>
> ---
>  meta/classes/devtool-source.bbclass | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/meta/classes/devtool-source.bbclass
> b/meta/classes/devtool-source.bbclass
> index 280d6009f3c2..4a469bfacad7 100644
> --- a/meta/classes/devtool-source.bbclass
> +++ b/meta/classes/devtool-source.bbclass
> @@ -65,6 +65,11 @@ python() {
>
>
>  python devtool_post_unpack() {
> +    # Otherwise this fails when called from recipes which e.g. inherit
> +    # python3native (which sets _PYTHON_SYSCONFIGDATA_NAME) with: No
> module
> +    # named '_sysconfigdata'
> +    if '_PYTHON_SYSCONFIGDATA_NAME' in os.environ:
> +        del os.environ['_PYTHON_SYSCONFIGDATA_NAME']
>      import oe.recipeutils
>      import shutil
>      sys.path.insert(0, os.path.join(d.getVar('COREBASE'), 'scripts',
> 'lib'))
> --
> 2.25.1
>
>

--000000000000c0ae3a05aa1c5e85
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I am able to do &#39;devtool modify gpgme&#39; withou=
t any errors. In what setting does it fail for you?</div><div><br></div><di=
v>The purpose of _sysconfigdata is to substitute configuration values that =
are specific for target python when running native python in cross builds w=
ith requests from target component build systems to supply those values. Fo=
r that to work, the recipe also needs to have target python3 in its DEPENDS=
. It <br></div><div><br></div><div>I feel the patch is fixing the symptom r=
ather than the issue somehow?<br></div><div><br></div><div><br></div><div>A=
lex<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D=
"gmail_attr">On Fri, 10 Jul 2020 at 21:08, Taras Kondratiuk &lt;<a href=3D"=
mailto:takondra@cisco.com">takondra@cisco.com</a>&gt; wrote:<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">&#39;devtool modify&#39; fails=
 for packages that inherit python3native (e.g.<br>
gpgme or systemd, via meson class):<br>
| Exception: ModuleNotFoundError: No module named &#39;_sysconfigdata&#39;<=
br>
<br>
After commit 02714c105426 (&quot;python3: upgrade to 3.7.2&quot;) python3na=
tive<br>
class exports _PYTHON_SYSCONFIGDATA_NAME =3D &#39;_sysconfigdata&#39;. I th=
ink the<br>
expectation is that it will find<br>
usr/lib/python-sysconfigdata/_sysconfigdata.py prepared by the same<br>
commit. But some places seems to still use host python3 which doesn&#39;t<b=
r>
have _sysconfigdata.py. This leads to &quot;No module named &#39;_sysconfig=
data&#39;&quot;<br>
errors. E.g. commit 4b26eaf7152f (&quot;prservice.py: fix do_package with<b=
r>
newer Python in Ubuntu 20.04&quot;) recently tried to workaround it for PR<=
br>
service. And now we see similar issue in devtool. To unblock devtool<br>
apply similar workaround here.<br>
<br>
But looks like there is some deeper issue here. I haven&#39;t fully grasped=
<br>
the purpose of _sysconfigdata.py yet. It is copied from<br>
_sysconfigdata_m_linux_x86_64-linux-gnu.py and then some variables are<br>
modified. But new values seems to be wrong. For example:<br>
In _sysconfigdata_m_linux_x86_64-linux-gnu.py:<br>
&#39;INCLUDEPY&#39;: &#39;FIXMESTAGINGDIRHOST/usr/include/python3.7m&#39;,<=
br>
While in _sysconfigdata.py:<br>
&#39;INCLUDEPY&#39;: &#39;FIXMESTAGINGDIRHOSTFIXMESTAGINGDIRHOST/usr/includ=
e/python3.7m&#39;,<br>
<br>
When FIXMESTAGINGDIRHOST is replaces by staging.bbclass, the path in<br>
_sysconfigdata.py points to nowhere while<br>
_sysconfigdata_m_linux_x86_64-linux-gnu.py has a correct path.<br>
<br>
Signed-off-by: Taras Kondratiuk &lt;<a href=3D"mailto:takondra@cisco.com" t=
arget=3D"_blank">takondra@cisco.com</a>&gt;<br>
---<br>
=C2=A0meta/classes/devtool-source.bbclass | 5 +++++<br>
=C2=A01 file changed, 5 insertions(+)<br>
<br>
diff --git a/meta/classes/devtool-source.bbclass b/meta/classes/devtool-sou=
rce.bbclass<br>
index 280d6009f3c2..4a469bfacad7 100644<br>
--- a/meta/classes/devtool-source.bbclass<br>
+++ b/meta/classes/devtool-source.bbclass<br>
@@ -65,6 +65,11 @@ python() {<br>
<br>
<br>
=C2=A0python devtool_post_unpack() {<br>
+=C2=A0 =C2=A0 # Otherwise this fails when called from recipes which e.g. i=
nherit<br>
+=C2=A0 =C2=A0 # python3native (which sets _PYTHON_SYSCONFIGDATA_NAME) with=
: No module<br>
+=C2=A0 =C2=A0 # named &#39;_sysconfigdata&#39;<br>
+=C2=A0 =C2=A0 if &#39;_PYTHON_SYSCONFIGDATA_NAME&#39; in os.environ:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 del os.environ[&#39;_PYTHON_SYSCONFIGDATA_NAME=
&#39;]<br>
=C2=A0 =C2=A0 =C2=A0import oe.recipeutils<br>
=C2=A0 =C2=A0 =C2=A0import shutil<br>
=C2=A0 =C2=A0 =C2=A0sys.path.insert(0, os.path.join(d.getVar(&#39;COREBASE&=
#39;), &#39;scripts&#39;, &#39;lib&#39;))<br>
-- <br>
2.25.1<br>
<br>
</blockquote></div>

--000000000000c0ae3a05aa1c5e85--
