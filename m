Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com [209.85.218.67])
 by mx.groups.io with SMTP id smtpd.web11.19729.1597252443779214877
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Aug 2020 10:14:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=VRrdFVIE;
 spf=pass (domain: gmail.com, ip: 209.85.218.67, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f67.google.com with SMTP id o18so3101000eje.7
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Aug 2020 10:14:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=A7otihBhFZdnkA087GK5rB4llIhSpFVQyeSEph/QA3U=;
        b=VRrdFVIEKU+DbxrWqNRMyDMqDDeVw9fYvjDnZNUIjiyyE49p173Yjg8K1ttYqZT+MD
         hFPjkQNAiZScBLxA1yhStLOS34rAmYayLQJ8HfaJKIX9YK8REb0TuoyYeTY6FMk5b9/K
         bjCIkexOBWsOVVUxI5SGR26bFVHz794CQYK6IQYi3lAFjRnAnuhLbet8GH3v99Wk3xuz
         H3kZjBMpgvQPrJrQcCMcBdMNOSbN66LXkmGNEtWlj8gBTmG11wQiQEen+s4PXKcJUXvb
         Cl3QxBQgY+Q2ZfqfqzAPP/6QEv8AOuKNCbpQdBRxFBJXRkjyPzKNCPFWcMLbfifnioF2
         FADA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=A7otihBhFZdnkA087GK5rB4llIhSpFVQyeSEph/QA3U=;
        b=LYg91dpoH1k21+CmZmuImAhJfefrGp7U+DgEmjsDlV14A650mct0Smy2qJz902+D/H
         5rrdK1BJyWg+ss+pOIKB5n89eVQemQ4kajK4n18Yh7X2Am35gmi8sePiZaOPiHQsaJ2D
         x9fKaYz+/+EWNYeFMD1zasUzJeCWFbReOvPb6NYOfkcALvEVTQ9Uowy8feesLYPeAxLY
         IdTI38Hbgl5Rx7nzelE04mnCWqtpQ3ctSOZS5upR/pHBtk7BmAIXnHo9drqn/D/GatqB
         nd6ngQ6u/q+Cq/4M7EcE0toCO3a0lnZExEL7ratnnep9fWH7pfTengkW7zpwg1eRnRzt
         9aJg==
X-Gm-Message-State: AOAM5320Tde9AM3qe6DFqs7/FHerq7Nh39pSHdCgIXYDFRWK+uALlz0r
	AxQ1Q46yrUB82qGaOs4n127bBDhbEJSdwwQZcQ4=
X-Google-Smtp-Source: ABdhPJzvuBKxZmg8exLKgjUdOkc61jnBL9riaKiwO1P5zHbJX/mO9osJw1ZPaCeFPcFFrDabhZco01TzCou6l5aD1Zo=
X-Received: by 2002:a17:906:1414:: with SMTP id p20mr761736ejc.247.1597252442288;
 Wed, 12 Aug 2020 10:14:02 -0700 (PDT)
MIME-Version: 1.0
References: <20200616170538.1049884-1-ross@burtonini.com> <20200616170538.1049884-2-ross@burtonini.com>
 <1a012137-cde9-d770-8a67-aa5ca65b608a@windriver.com>
In-Reply-To: <1a012137-cde9-d770-8a67-aa5ca65b608a@windriver.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Wed, 12 Aug 2020 13:13:51 -0400
Message-ID: <CADkTA4Nb8P3SV9JdB71w_6BJPHnefkGYPDChE0+L=5VyOsB8PA@mail.gmail.com>
Subject: Re: [OE-core] [RFC PATCH 2/3] tcmode-default: use go-binary-native by default
To: Chen Qi <Qi.Chen@windriver.com>
Cc: Ross Burton <ross@burtonini.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000007075fc05acb150c2"

--0000000000007075fc05acb150c2
Content-Type: text/plain; charset="UTF-8"

On Wed, Aug 12, 2020 at 5:25 AM Chen Qi <Qi.Chen@windriver.com> wrote:

> Hi Ross,
>
> I've just tracked down to this patch about k8s build failure for arm.
> I'm now setting the preferred provider to 'go-native' to avoid k8s build
> regression.
>
> go-native contains patches like
> 0001-allow-CC-and-CXX-to-have-multiple-words.patch.
> These patches seem to make sense.
>
> Do you have any idea how to deal with such situation?
>

We've had lots of problems with 32bit arm and the new go compiler. I just
confirmed that k8s still builds 64 bit.

And if this is the gnu-stubs.h issue, it's the same thing.

It might be time to just exclude 32bit arm from some of the bigger stack in
meta-virt, since getting them to respect the cross go compiler is getting
harder and harder.

That being said, I hunted down a few more incorrect 'go' calls in the k8s
build scripts, and can now build 32 bit again. But as for runtime, I can't
say if it works or not.

Once I complete builds on other archs, I'll push the change to meta-virt.

Bruce



> Best Regards,
> Chen Qi
>
> On 06/17/2020 01:05 AM, Ross Burton wrote:
>
> From: Ross Burton <ross.burton@arm.com> <ross.burton@arm.com>
>
> go-binary-native is faster and more portable than go-native, so use it
> by default.
>
> Signed-off-by: Ross Burton <ross.burton@arm.com> <ross.burton@arm.com>
> ---
>  meta/conf/distro/include/tcmode-default.inc | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
> index ab4333144b..7103e10d3b 100644
> --- a/meta/conf/distro/include/tcmode-default.inc
> +++ b/meta/conf/distro/include/tcmode-default.inc
> @@ -66,6 +66,10 @@ PREFERRED_VERSION_qemu ?= "${QEMUVERSION}"
>  PREFERRED_VERSION_qemu-native ?= "${QEMUVERSION}"
>  PREFERRED_VERSION_nativesdk-qemu ?= "${QEMUVERSION}"
>
> +# Bootstrap Go using a binary release from golang.org.  If you want to bootstrap
> +# from source using the C-implemented Go 1.4 (only supports x86-64 hosts) then use
> +# go-native.
> +PREFERRED_PROVIDER_go-native ?= "go-binary-native"
>  PREFERRED_VERSION_virtual/${TARGET_PREFIX}go ?= "${GOVERSION}"
>  PREFERRED_VERSION_go-cross-${TUNE_PKGARCH} ?= "${GOVERSION}"
>  PREFERRED_VERSION_go-crosssdk-${SDK_ARCH} ?= "${GOVERSION}"
>
>
>
>
> 
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--0000000000007075fc05acb150c2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Wed, Aug 12, 2020 at 5:25 AM Chen Qi &lt;<a href=
=
=3D"mailto:Qi.Chen@windriver.com" target=3D"_blank">Qi.Chen@windriver.com<=
/a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">

  
  <div bgcolor=3D"#FFFFFF">
    <div>Hi Ross,<br>
      <br>
      I&#39;ve just tracked down to this patch about k8s build failure for
      arm.<br>
      I&#39;m now setting the preferred provider to &#39;go-native&#39; to=
 avoid k8s
      build regression.<br>
      <br>
      go-native contains patches like
      0001-allow-CC-and-CXX-to-have-multiple-words.patch.<br>
      These patches seem to make sense.<br>
      <br>
      Do you have any idea how to deal with such situation?<br></div></div=
></blockquote><div>=C2=A0<br><div class=3D"gmail_default" style=3D"font-siz=
e:small">We&#39;ve had lots of problems with 32bit arm and the new go compi=
ler. I just confirmed that k8s still builds 64 bit.=C2=A0</div><div class=
=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"gmail=
_default" style=3D"font-size:small">And if this is the gnu-stubs.h issue, i=
t&#39;s the same thing.</div><div class=3D"gmail_default" style=3D"font-siz=
e:small"><br></div><div class=3D"gmail_default" style=3D"font-size:small">I=
t might be time to just exclude 32bit arm from some of the bigger stack in =
meta-virt, since getting them to respect the cross go compiler is getting h=
arder and harder.</div><div class=3D"gmail_default" style=3D"font-size:smal=
l"><br></div><div class=3D"gmail_default" style=3D"font-size:small">That be=
ing said, I hunted down a few more incorrect &#39;go&#39; calls in the k8s =
build scripts, and can now build 32 bit again. But as for runtime, I can&#3=
9;t say if it works or not.</div><div class=3D"gmail_default" style=3D"font=
-size:small"><br></div><div class=3D"gmail_default" style=3D"font-size:smal=
l">Once I complete builds on other archs, I&#39;ll push the change to meta-=
virt.</div><div class=3D"gmail_default" style=3D"font-size:small"><br></div=
><div class=3D"gmail_default" style=3D"font-size:small">Bruce</div><br></di=
v><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div bgc=
olor=3D"#FFFFFF"><div>
      <br>
      Best Regards,<br>
      Chen Qi<br>
      <br>
      On 06/17/2020 01:05 AM, Ross Burton wrote:<br>
    </div>
    <blockquote type=3D"cite">
      <pre>From: Ross Burton <a href=3D"mailto:ross.burton@arm.com" target=
=
=3D"_blank">&lt;ross.burton@arm.com&gt;</a>

go-binary-native is faster and more portable than go-native, so use it
by default.

Signed-off-by: Ross Burton <a href=3D"mailto:ross.burton@arm.com" target=
=3D"_blank">&lt;ross.burton@arm.com&gt;</a>
---
 meta/conf/distro/include/tcmode-default.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distr=
o/include/tcmode-default.inc
index ab4333144b..7103e10d3b 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -66,6 +66,10 @@ PREFERRED_VERSION_qemu ?=3D &quot;${QEMUVERSION}&quot;
 PREFERRED_VERSION_qemu-native ?=3D &quot;${QEMUVERSION}&quot;
 PREFERRED_VERSION_nativesdk-qemu ?=3D &quot;${QEMUVERSION}&quot;
=20
+# Bootstrap Go using a binary release from <a href=3D"http://golang.org" =
target=3D"_blank">golang.org</a>.  If you want to bootstrap
+# from source using the C-implemented Go 1.4 (only supports x86-64 hosts)=
 then use
+# go-native.
+PREFERRED_PROVIDER_go-native ?=3D &quot;go-binary-native&quot;
 PREFERRED_VERSION_virtual/${TARGET_PREFIX}go ?=3D &quot;${GOVERSION}&quot=
;
 PREFERRED_VERSION_go-cross-${TUNE_PKGARCH} ?=3D &quot;${GOVERSION}&quot;
 PREFERRED_VERSION_go-crosssdk-${SDK_ARCH} ?=3D &quot;${GOVERSION}&quot;
</pre>
      <br>
      <fieldset></fieldset>
      <br>
      <pre></pre>
    </blockquote>
    <p><br>
    </p>
  </div>

<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr=
">- Thou shalt not follow the NULL pointer, for chaos and madness await the=
e at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star Trek II<b=
r><br></div></div>

--0000000000007075fc05acb150c2--
