Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com [209.85.208.67])
 by mx.groups.io with SMTP id smtpd.web12.1856.1589047059010143979
 for <openembedded-core@lists.openembedded.org>;
 Sat, 09 May 2020 10:57:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=deXPA7zx;
 spf=pass (domain: gmail.com, ip: 209.85.208.67, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f67.google.com with SMTP id d16so4099426edq.7
        for <openembedded-core@lists.openembedded.org>; Sat, 09 May 2020 10:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Xy/xkj8srox+/E4PHjGlrRYEiSJlpy8no7R07SfG594=;
        b=deXPA7zxCD0wzHNKsr7prsGKGz1h4u9ai7Gzc6mq6CPwXu+7cuqqCldGh+EUIStBW1
         syNcUliRm814fXnzu8g+wdk8EcCP+fY/hITVt3x+0p52rx3EAsbMTiy7qL//jSnADiD/
         ubLxypyZ4xLzVdtmqonoq9cnrp4yGU6Xk+nGOsQ0bIS9CmHhTHd9XcGH9au1rkw5GwPW
         z9n/iWQKmFVbGAKIXgALSBi6X4q2TufsAWe5NljHTjugbkF/4896FJiDSDPFLaNrEB5t
         QcaS/k1I1HjiRldQ6OA2JqEN8RNjhUVxCf8xEDP1CGjx94DIMyN7e/pOtWMHwHW6hz2j
         XSgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Xy/xkj8srox+/E4PHjGlrRYEiSJlpy8no7R07SfG594=;
        b=PZxCHD8yOzkrfCvYNc4+oTSIo1apOAuJo1f/WY9T3kwoqhvaSjumNGL62lS4bnbaKg
         Y0PN1MQ014MiBrgi7RjHpxodMvRAIg721SXmAloABMYceqaevlicOAMQc7JqRl4QsEbb
         wLqHenMpnQaEYspyCL/TbKUC0xb+RYlLmW5Y/5pDD7o/pMhf/bD/davTsdOUQvwjDPcs
         6RofyCITKW61wkhcG6m81ShDL8iWSLNA/XdJ5l633M7R/gXBI9eUqkFzWO2V8khu0tFw
         UUGlJ5pZB7Oa3Cv7Ek53IoWOEwzzCSWPHQ4N3PYrEjK8Hp9XaRkeUhqe1o676fxZ073r
         HaLw==
X-Gm-Message-State: AGi0PuYUzwkwPby7eSuLlGdBN/gnFffYSCMv+YD4v9POCCy0wEgf/fhv
	Ecsl7mkjg9DoOV9mxIpNKrr840CtIhkw5Spq3sw=
X-Google-Smtp-Source: APiQypJaNPXLUV6v3pKFm5MadJ/0jHI6zCaF7XTUkJfZ3E/TVpT6lNhdq799W5nJ0s2yt0rJEg2ERb4WcUa4vSZCkBQ=
X-Received: by 2002:a50:c016:: with SMTP id r22mr6781062edb.388.1589047057499;
 Sat, 09 May 2020 10:57:37 -0700 (PDT)
MIME-Version: 1.0
References: <20200506134002.155500-1-richard.purdie@linuxfoundation.org> <66e0d1d5-2b72-ce26-4b5b-709fbcfc7274@gmail.com>
In-Reply-To: <66e0d1d5-2b72-ce26-4b5b-709fbcfc7274@gmail.com>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Sat, 9 May 2020 19:57:26 +0200
Message-ID: <CA+chaQdaOXJ694M2Tz8LAtcmW+Dj7VW5MZPvec1Vjb5MheVr=Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] insane: Promote warnings into errors
To: Khem Raj <raj.khem@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000064cb4405a53ad9f2"

--00000000000064cb4405a53ad9f2
Content-Type: text/plain; charset="UTF-8"

Agreed, I would go even further and move all WARN_QA to ERROR_QA. I do that
in all my builds already for few years, so oe-core+meta-oe status shouldn't
be so bad and those few cases where it still fails can be skipped with
INSANE_SKIP in the recipe - to make sure that no new warnings are
introduced later.

On Thu, May 7, 2020 at 10:07 PM Khem Raj <raj.khem@gmail.com> wrote:

>
>
> On 5/6/20 6:40 AM, Richard Purdie wrote:
> > There are several warnings the build can emit which show real problems
> > in the way recipes are being built. Some distros like poky and the Yocto
> > Project autobuilder have been fixing the issues these show for some time.
> >
> > OE-Core has therefore been clean of these errors and warnings for some
> time.
> > Promote warnings into errors to match the defaults in poky to encourage
> > people to fix these real issue and reduce confusion when people switch
> > distros or customise.
>
> This is a good change, and I think all settings used in poky in this
> regard are worth for OE-core.
>
> >
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > ---
> >  meta/classes/insane.bbclass | 11 ++++++-----
> >  1 file changed, 6 insertions(+), 5 deletions(-)
> >
> > diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
> > index 7fc8f33a982..8b19f445f9b 100644
> > --- a/meta/classes/insane.bbclass
> > +++ b/meta/classes/insane.bbclass
> > @@ -22,11 +22,9 @@ QA_SANE = "True"
> >
> >  # Elect whether a given type of error is a warning or error, they may
> >  # have been set by other files.
> > -WARN_QA ?= "ldflags useless-rpaths rpaths staticdev libdir
> xorg-driver-abi \
> > -            textrel already-stripped incompatible-license files-invalid
> \
> > -            installed-vs-shipped compile-host-path install-host-path \
> > -            pn-overrides infodir build-deps src-uri-bad \
> > -            unknown-configure-option symlink-to-sysroot multilib \
> > +WARN_QA ?= " libdir xorg-driver-abi \
> > +            textrel incompatible-license files-invalid \
> > +            infodir build-deps src-uri-bad symlink-to-sysroot multilib \
> >              invalid-packageconfig host-user-contaminated uppercase-pn
> patch-fuzz \
> >              mime mime-xdg \
> >              "
> > @@ -36,6 +34,9 @@ ERROR_QA ?= "dev-so debug-deps dev-deps debug-files
> arch pkgconfig la \
> >              version-going-backwards expanded-d invalid-chars \
> >              license-checksum dev-elf file-rdeps configure-unsafe \
> >              configure-gettext perllocalpod shebang-size \
> > +            already-stripped installed-vs-shipped ldflags
> compile-host-path \
> > +            install-host-path pn-overrides unknown-configure-option \
> > +            useless-rpaths rpaths staticdev \
> >              "
> >  # Add usrmerge QA check based on distro feature
> >  ERROR_QA_append = "${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge',
> ' usrmerge', '', d)}"
> >
> >
> >
> >
> 
>

--00000000000064cb4405a53ad9f2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Agreed, I would go even further and move all WARN_QA to ER=
ROR_QA. I do that in all my builds already for few years, so oe-core+meta-o=
e status shouldn&#39;t be so bad and those few cases where it still fails c=
an be skipped with INSANE_SKIP in the recipe - to make sure that no new war=
nings are introduced later.</div><br><div class=3D"gmail_quote"><div dir=3D=
"ltr" class=3D"gmail_attr">On Thu, May 7, 2020 at 10:07 PM Khem Raj &lt;<a =
href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
<br>
On 5/6/20 6:40 AM, Richard Purdie wrote:<br>
&gt; There are several warnings the build can emit which show real problem=
s<br>
&gt; in the way recipes are being built. Some distros like poky and the Yo=
cto<br>
&gt; Project autobuilder have been fixing the issues these show for some t=
ime.<br>
&gt; <br>
&gt; OE-Core has therefore been clean of these errors and warnings for som=
e time.<br>
&gt; Promote warnings into errors to match the defaults in poky to encoura=
ge<br>
&gt; people to fix these real issue and reduce confusion when people switc=
h<br>
&gt; distros or customise.<br>
<br>
This is a good change, and I think all settings used in poky in this<br>
regard are worth for OE-core.<br>
<br>
&gt; <br>
&gt; Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@li=
nuxfoundation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>=
&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/classes/insane.bbclass | 11 ++++++-----<br>
&gt;=C2=A0 1 file changed, 6 insertions(+), 5 deletions(-)<br>
&gt; <br>
&gt; diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclas=
s<br>
&gt; index 7fc8f33a982..8b19f445f9b 100644<br>
&gt; --- a/meta/classes/insane.bbclass<br>
&gt; +++ b/meta/classes/insane.bbclass<br>
&gt; @@ -22,11 +22,9 @@ QA_SANE =3D &quot;True&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 # Elect whether a given type of error is a warning or error, th=
ey may<br>
&gt;=C2=A0 # have been set by other files.<br>
&gt; -WARN_QA ?=3D &quot;ldflags useless-rpaths rpaths staticdev libdir xo=
rg-driver-abi \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 textrel already-stripped i=
ncompatible-license files-invalid \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 installed-vs-shipped compi=
le-host-path install-host-path \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pn-overrides infodir build=
-deps src-uri-bad \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unknown-configure-option s=
ymlink-to-sysroot multilib \<br>
&gt; +WARN_QA ?=3D &quot; libdir xorg-driver-abi \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 textrel incompatible-licen=
se files-invalid \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 infodir build-deps src-uri=
-bad symlink-to-sysroot multilib \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 invalid-packageconfig=
 host-user-contaminated uppercase-pn patch-fuzz \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mime mime-xdg \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
&gt; @@ -36,6 +34,9 @@ ERROR_QA ?=3D &quot;dev-so debug-deps dev-deps debu=
g-files arch pkgconfig la \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 version-going-backwar=
ds expanded-d invalid-chars \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 license-checksum dev-=
elf file-rdeps configure-unsafe \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 configure-gettext per=
llocalpod shebang-size \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 already-stripped installed=
-vs-shipped ldflags compile-host-path \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 install-host-path pn-overr=
ides unknown-configure-option \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 useless-rpaths rpaths stat=
icdev \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
&gt;=C2=A0 # Add usrmerge QA check based on distro feature<br>
&gt;=C2=A0 ERROR_QA_append =3D &quot;${@bb.utils.contains(&#39;DISTRO_FEAT=
URES&#39;, &#39;usrmerge&#39;, &#39; usrmerge&#39;, &#39;&#39;, d)}&quot;<b=
r>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
<br>
</blockquote></div>

--00000000000064cb4405a53ad9f2--
