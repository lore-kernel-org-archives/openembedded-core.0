Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AAA5CD484B
	for <webhook@archiver.kernel.org>; Fri, 22 Sep 2023 18:11:14 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web11.4676.1695406272402452891
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Sep 2023 11:11:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cQtTPhi/;
 spf=pass (domain: gmail.com, ip: 209.85.208.178, mailfrom: rybczynska@gmail.com)
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2bb9a063f26so39561401fa.2
        for <openembedded-core@lists.openembedded.org>; Fri, 22 Sep 2023 11:11:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695406270; x=1696011070; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jtWuoh4zQqoPLvi5lVXR8AZZFrBf0+rs9XsuXhQC65Y=;
        b=cQtTPhi/TnNzX7DePMWZmm55l5RRDHOt7J5DheNpvzRkaAkDhuQMkoiMqCizLxyprX
         fRhspN2f8ibV9AqILBk6IiAoL78Puw5eeYmECwP8RtvPCHcM9aTpdfVhWYl5IvO6+GNe
         2z7GtYrrw2dfDueaBkC8zA0v0RrBa20DSreFIpGo6uBJ1oeirrAASqnXMO64L1k1O75t
         05PZYAeIYsn0LJy8RcxZWWxWSvmxrudcxrnubOc9SlQhP2yeY9bQUlx/MMyuv97TuxS6
         TQbeA+3yJmYm5/MAEVzUYdiJSvNaXUKoh3C8QOn6zMXjvBF3lUgUaPVHpKERMuukLET9
         NRxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695406270; x=1696011070;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jtWuoh4zQqoPLvi5lVXR8AZZFrBf0+rs9XsuXhQC65Y=;
        b=E8F67a/AKLAm/Yspsk8uz8XoJTCPQO9aaGljcRYI6F3ARMdMgRhpAQeHgeGPsWHyvk
         f5CyWHZufm6jFziHgo2w0bpsiATuKfvWTQAjNtxj1aessXs1aPUO5TEXqOuwFCeFi1Ok
         nCo3ka2ml4xVQwt4i4O2eO9mLvvSp3I/uWBPiY1VMSYTumS9vPlqeZBE5P1yByMhOivZ
         riebmJojFEmKdPXleS7YscHtbiN81vS6XVNdn2C1227l9zWpT1AYVhwAyNkYIUA6Wj6c
         ErGkqmyoJfuJ9EJQbwlFF6S4xNskF7uvZlG0R9ivHUsW2abJgP9he/C/hi6RmQ9oOgJH
         AuzA==
X-Gm-Message-State: AOJu0YwJAGobNm9lQ1xKbSH1K2I67kNC8Wu+5SnKtgYsY5HxnXWCsdRG
	5C+MOEXkwgFbiz9xEWrghNjqG2rjdcCsbE7ZMcA=
X-Google-Smtp-Source: AGHT+IGEi7/khW7EdO4RDZ/0/3oKnlTJTIRV36hHPE3naKf43ddMGzCuxQZud82l8mEcQ/AoUJT024cjto+GbUFVL2o=
X-Received: by 2002:a2e:a314:0:b0:2bc:f1d3:b54c with SMTP id
 l20-20020a2ea314000000b002bcf1d3b54cmr34566lje.20.1695406270055; Fri, 22 Sep
 2023 11:11:10 -0700 (PDT)
MIME-Version: 1.0
References: <20230922144628.2495839-1-samantha.jalabert@syslinbit.com>
 <20230922144628.2495839-7-samantha.jalabert@syslinbit.com> <6a999a75-fec2-4ee6-bd9b-e5bc4f23a069@gmail.com>
In-Reply-To: <6a999a75-fec2-4ee6-bd9b-e5bc4f23a069@gmail.com>
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Fri, 22 Sep 2023 20:10:57 +0200
Message-ID: <CAApg2=TWM2ciw2b6=AB7Jdb4imN32OiRXa4tAWActNT0xfHVyA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 06/17] python3-click: Copy recipe from meta-python
To: Khem Raj <raj.khem@gmail.com>
Cc: Samantha Jalabert <samantha.jalabert@syslinbit.com>, 
	OE-core <openembedded-core@lists.openembedded.org>, mrybczynska@syslinbit.com, 
	leon.anavi@konsulko.com, wangmy@fujitsu.com, zhengrq.fnst@fujitsu.com
Content-Type: multipart/alternative; boundary="0000000000007a0c0a0605f6887d"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Sep 2023 18:11:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188131

--0000000000007a0c0a0605f6887d
Content-Type: text/plain; charset="UTF-8"

Sure Khem,
We wanted to make sure there are no major objections to this patchset and
immediately follow with removals in meta-openembedded.

Cheers,
Marta

On Fri, 22 Sept 2023, 17:24 Khem Raj, <raj.khem@gmail.com> wrote:

> On 9/22/23 7:46 AM, Samantha Jalabert wrote:
> > From: Samantha Jalabert <samantha.jalabert@syslinbit.com>
> >
> > commit: 1a14a28f132a10e9db7b3e5bb2b5361c4679946e
> >
> > Signed-off-by: Marta Rybczynska <mrybczynska@syslinbit.com>
>
> Please send a removal patch for meta-python as well. So we can keep
> passing the yp compat checks for meta-openembedded on AB and coordinate
> the change between meta-python and oe-core
>
> > ---
> >   .../python/python3-click/run-ptest            |  3 ++
> >   .../python/python3-click_8.1.7.bb             | 39 +++++++++++++++++++
> >   2 files changed, 42 insertions(+)
> >   create mode 100644 meta/recipes-devtools/python/python3-click/run-ptest
> >   create mode 100644 meta/recipes-devtools/python/python3-click_8.1.7.bb
> >
> > diff --git a/meta/recipes-devtools/python/python3-click/run-ptest
> b/meta/recipes-devtools/python/python3-click/run-ptest
> > new file mode 100644
> > index 0000000000..b63c4de0d9
> > --- /dev/null
> > +++ b/meta/recipes-devtools/python/python3-click/run-ptest
> > @@ -0,0 +1,3 @@
> > +#!/bin/sh
> > +
> > +pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'|
> sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e
> 's/SKIPPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" ||
> $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk
> '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" ||
> $NF=="XPASS") {$NF="";print $0}else{print}}'
> > diff --git a/meta/recipes-devtools/python/python3-click_8.1.7.bb
> b/meta/recipes-devtools/python/python3-click_8.1.7.bb
> > new file mode 100644
> > index 0000000000..a4ec6cd1ef
> > --- /dev/null
> > +++ b/meta/recipes-devtools/python/python3-click_8.1.7.bb
> > @@ -0,0 +1,39 @@
> > +SUMMARY = "A simple wrapper around optparse for powerful command line
> utilities."
> > +DESCRIPTION = "\
> > +Click is a Python package for creating beautiful command line
> interfaces \
> > +in a composable way with as little code as necessary. It's the "Command
> \
> > +Line Interface Creation Kit". It's highly configurable but comes with \
> > +sensible defaults out of the box."
> > +HOMEPAGE = "http://click.pocoo.org/"
> > +LICENSE = "BSD-3-Clause"
> > +LIC_FILES_CHKSUM =
> "file://LICENSE.rst;md5=1fa98232fd645608937a0fdc82e999b8"
> > +
> > +SRC_URI[sha256sum] =
> "ca9853ad459e787e2192211578cc907e7594e294c7ccc834310722b41b9ca6de"
> > +
> > +inherit pypi setuptools3 ptest
> > +
> > +SRC_URI += "file://run-ptest"
> > +
> > +RDEPENDS:${PN}-ptest += " \
> > +     ${PYTHON_PN}-pytest \
> > +     ${PYTHON_PN}-terminal \
> > +     ${PYTHON_PN}-unixadmin \
> > +"
> > +
> > +do_install_ptest() {
> > +    install -d ${D}${PTEST_PATH}/tests
> > +    cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
> > +    cp -rf ${S}/setup.cfg ${D}${PTEST_PATH}/
> > +    cp -rf ${S}/docs ${D}${PTEST_PATH}/
> > +}
> > +
> > +UPSTREAM_CHECK_REGEX = "click/(?P<pver>\d+(\.\d+)+)/"
> > +
> > +CLEANBROKEN = "1"
> > +
> > +RDEPENDS:${PN} += "\
> > +    ${PYTHON_PN}-io \
> > +    ${PYTHON_PN}-threading \
> > +    "
> > +
> > +BBCLASSEXTEND = "native nativesdk"
> >
> >
> >
> >
> >
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#188123):
> https://lists.openembedded.org/g/openembedded-core/message/188123
> Mute This Topic: https://lists.openembedded.org/mt/101522496/5827677
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> rybczynska@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--0000000000007a0c0a0605f6887d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Sure Khem,<div dir=3D"auto">We wanted to make sure there =
are no major objections to this patchset and immediately follow with remova=
ls in meta-openembedded.</div><div dir=3D"auto"><br></div><div dir=3D"auto"=
>Cheers,</div><div dir=3D"auto">Marta</div></div><br><div class=3D"gmail_qu=
ote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, 22 Sept 2023, 17:24 Khem=
 Raj, &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8e=
x;border-left:1px #ccc solid;padding-left:1ex">On 9/22/23 7:46 AM, Samantha=
 Jalabert wrote:<br>
&gt; From: Samantha Jalabert &lt;<a href=3D"mailto:samantha.jalabert@syslin=
bit.com" target=3D"_blank" rel=3D"noreferrer">samantha.jalabert@syslinbit.c=
om</a>&gt;<br>
&gt; <br>
&gt; commit: 1a14a28f132a10e9db7b3e5bb2b5361c4679946e<br>
&gt; <br>
&gt; Signed-off-by: Marta Rybczynska &lt;<a href=3D"mailto:mrybczynska@sysl=
inbit.com" target=3D"_blank" rel=3D"noreferrer">mrybczynska@syslinbit.com</=
a>&gt;<br>
<br>
Please send a removal patch for meta-python as well. So we can keep <br>
passing the yp compat checks for meta-openembedded on AB and coordinate <br=
>
the change between meta-python and oe-core<br>
<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0.../python/python3-click/run-ptest=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 3 ++<br>
&gt;=C2=A0 =C2=A0.../python/<a href=3D"http://python3-click_8.1.7.bb" rel=
=3D"noreferrer noreferrer" target=3D"_blank">python3-click_8.1.7.bb</a>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 39 +++++++++++++++++++<br>
&gt;=C2=A0 =C2=A02 files changed, 42 insertions(+)<br>
&gt;=C2=A0 =C2=A0create mode 100644 meta/recipes-devtools/python/python3-cl=
ick/run-ptest<br>
&gt;=C2=A0 =C2=A0create mode 100644 meta/recipes-devtools/python/<a href=3D=
"http://python3-click_8.1.7.bb" rel=3D"noreferrer noreferrer" target=3D"_bl=
ank">python3-click_8.1.7.bb</a><br>
&gt; <br>
&gt; diff --git a/meta/recipes-devtools/python/python3-click/run-ptest b/me=
ta/recipes-devtools/python/python3-click/run-ptest<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..b63c4de0d9<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-devtools/python/python3-click/run-ptest<br>
&gt; @@ -0,0 +1,3 @@<br>
&gt; +#!/bin/sh<br>
&gt; +<br>
&gt; +pytest -o log_cli=3Dtrue -o log_cli_level=3DINFO | sed -e &#39;s/\[..=
.%\]//g&#39;| sed -e &#39;s/PASSED/PASS/g&#39;| sed -e &#39;s/FAILED/FAIL/g=
&#39;|sed -e &#39;s/SKIPPED/SKIP/g&#39;| awk &#39;{if ($NF=3D=3D&quot;PASS&=
quot; || $NF=3D=3D&quot;FAIL&quot; || $NF=3D=3D&quot;SKIP&quot; || $NF=3D=
=3D&quot;XFAIL&quot; || $NF=3D=3D&quot;XPASS&quot;){printf &quot;%s: %s\n&q=
uot;, $NF, $0}else{print}}&#39;| awk &#39;{if ($NF=3D=3D&quot;PASS&quot; ||=
 $NF=3D=3D&quot;FAIL&quot; || $NF=3D=3D&quot;SKIP&quot; || $NF=3D=3D&quot;X=
FAIL&quot; || $NF=3D=3D&quot;XPASS&quot;) {$NF=3D&quot;&quot;;print $0}else=
{print}}&#39;<br>
&gt; diff --git a/meta/recipes-devtools/python/<a href=3D"http://python3-cl=
ick_8.1.7.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">python3-click=
_8.1.7.bb</a> b/meta/recipes-devtools/python/<a href=3D"http://python3-clic=
k_8.1.7.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">python3-click_8=
.1.7.bb</a><br>
&gt; new file mode 100644<br>
&gt; index 0000000000..a4ec6cd1ef<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-devtools/python/<a href=3D"http://python3-click_8.1=
.7.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">python3-click_8.1.7.=
bb</a><br>
&gt; @@ -0,0 +1,39 @@<br>
&gt; +SUMMARY =3D &quot;A simple wrapper around optparse for powerful comma=
nd line utilities.&quot;<br>
&gt; +DESCRIPTION =3D &quot;\<br>
&gt; +Click is a Python package for creating beautiful command line interfa=
ces \<br>
&gt; +in a composable way with as little code as necessary. It&#39;s the &q=
uot;Command \<br>
&gt; +Line Interface Creation Kit&quot;. It&#39;s highly configurable but c=
omes with \<br>
&gt; +sensible defaults out of the box.&quot;<br>
&gt; +HOMEPAGE =3D &quot;<a href=3D"http://click.pocoo.org/" rel=3D"norefer=
rer noreferrer" target=3D"_blank">http://click.pocoo.org/</a>&quot;<br>
&gt; +LICENSE =3D &quot;BSD-3-Clause&quot;<br>
&gt; +LIC_FILES_CHKSUM =3D &quot;file://LICENSE.rst;md5=3D1fa98232fd6456089=
37a0fdc82e999b8&quot;<br>
&gt; +<br>
&gt; +SRC_URI[sha256sum] =3D &quot;ca9853ad459e787e2192211578cc907e7594e294=
c7ccc834310722b41b9ca6de&quot;<br>
&gt; +<br>
&gt; +inherit pypi setuptools3 ptest<br>
&gt; +<br>
&gt; +SRC_URI +=3D &quot;file://run-ptest&quot;<br>
&gt; +<br>
&gt; +RDEPENDS:${PN}-ptest +=3D &quot; \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0${PYTHON_PN}-pytest \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0${PYTHON_PN}-terminal \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0${PYTHON_PN}-unixadmin \<br>
&gt; +&quot;<br>
&gt; +<br>
&gt; +do_install_ptest() {<br>
&gt; +=C2=A0 =C2=A0 install -d ${D}${PTEST_PATH}/tests<br>
&gt; +=C2=A0 =C2=A0 cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/<br>
&gt; +=C2=A0 =C2=A0 cp -rf ${S}/setup.cfg ${D}${PTEST_PATH}/<br>
&gt; +=C2=A0 =C2=A0 cp -rf ${S}/docs ${D}${PTEST_PATH}/<br>
&gt; +}<br>
&gt; +<br>
&gt; +UPSTREAM_CHECK_REGEX =3D &quot;click/(?P&lt;pver&gt;\d+(\.\d+)+)/&quo=
t;<br>
&gt; +<br>
&gt; +CLEANBROKEN =3D &quot;1&quot;<br>
&gt; +<br>
&gt; +RDEPENDS:${PN} +=3D &quot;\<br>
&gt; +=C2=A0 =C2=A0 ${PYTHON_PN}-io \<br>
&gt; +=C2=A0 =C2=A0 ${PYTHON_PN}-threading \<br>
&gt; +=C2=A0 =C2=A0 &quot;<br>
&gt; +<br>
&gt; +BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#188123): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/188123" rel=3D"noreferrer noreferrer" target=3D"_bl=
ank">https://lists.openembedded.org/g/openembedded-core/message/188123</a><=
br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/101522496/582=
7677" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.openemb=
edded.org/mt/101522496/5827677</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank" rel=3D"noreferrer">openembedded-core+owner@lists.op=
enembedded.org</a><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.openem=
bedded.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:rybczynska@gmai=
l.com" target=3D"_blank" rel=3D"noreferrer">rybczynska@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--0000000000007a0c0a0605f6887d--

