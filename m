Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02ED0C88E41
	for <webhook@archiver.kernel.org>; Tue, 27 Jan 2026 09:30:08 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6716.1769506200478168285
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Jan 2026 01:30:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=OTI37u4l;
 spf=pass (domain: smile.fr, ip: 209.85.128.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-47ff94b46afso47257615e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Jan 2026 01:30:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769506199; cv=none;
        d=google.com; s=arc-20240605;
        b=dCSDsJnsrfkP0nnWljQ7gJYI65mR/O7LT/EPyw4JF6UVUB1kY+FlKBMqHiN8WFPTkd
         AktdaA1Hxt7bv7dgV0MGuVlwgMX0/UEiyQyJeWRtlfCXDLoebishrTtQvhb9Gz0nC1h1
         VQGRFmRc1Dbe5kklrUylFPMFK4a1iM/6UX//H1LpNHyZgGaCfmyNJyAZtT/jXo0Wz81i
         H9VmG8eaU4edK+bV3ZuEuBtK1ekeKX2w4tGeDSfeD3TigqWSW01Dw5tIISHK87oyhNQ/
         a1oHzZBZPQBVPAdOwwYg4by9QaqGxTjdnEWdDbTNGwxtG0dvfxWdaSiKq/jLgiyPivrP
         l8mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=TRA8oRF2fs+MwVqRMwN54SEIVA+Ad0NG2vp0wnqfTlA=;
        fh=6mDpEM+He2vvuXQ6lfoW/2Qt2S91skgzebwT+C3hzE4=;
        b=WXiw6tCRwJfr/NELCe0RYBxJYm5wujyfp2+YZ7pECY+g7VOnqnDHNQ+tISDh76ksAx
         NIOpCfPcncdIvyogLim5bepkoc5ICfmuBvWVMSKEDPE7Yx8Q86uLF5sAhvPPpt1LLdEG
         0KJiRiMfJJmPuWMzyMJnsrUBUuzgesp0AzktBLNubdcAxOEPaVyH1/8Tqekrv+03r1yu
         7+5FRdkpvFTPmhm5VkyHi4IauGFCbnRUrfSITRpRJeKiQFRgpLPFv9xpeyn7tdyEtW9y
         kpoCSOG4e4HHWGwFRTwW0Yg20VNMlzgNQ+gnWR++dzUUrUt3pDtXlvPxlC1IokR7oTc1
         09YQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1769506199; x=1770110999; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TRA8oRF2fs+MwVqRMwN54SEIVA+Ad0NG2vp0wnqfTlA=;
        b=OTI37u4l0aHuTEVAiPEh3R74UwJvdyQQv6x7FdShiGh8oJe2cvztSF9CeJl2G+kSnI
         1Xpw5suinskKewcFx2wqxdm5JqfKQYbfFXldKNYXn72uPAlFjOQxLhJ6RXoev4M4dTU/
         Oy1bteDPsqiuRSszN+I6UDBNWiORNPyHMMJp0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769506199; x=1770110999;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TRA8oRF2fs+MwVqRMwN54SEIVA+Ad0NG2vp0wnqfTlA=;
        b=bgwYlOwv1JHGsjSpWmNyCB8BOC7Pj99a2/nCCQbtuxh/lUYZ4BGelnUtkUbwzwnufk
         OavJtPayTwC/2q5Umbo9YMTPNcTc3wSm7ZjYJxuc56Y1c4a+jTF40rbOSfYTUB+53mXg
         ELxIXVr//RPoL0G7W97wH2snqkaeWebpTeOpda10xYAnqb9nQYqt8ruDI9saLlyYkD55
         B3khWCBsbRY2YkLEA241AJBhxRPcvRBPsDv6OPKsfD0j5++JHbXTOnwvQZVMJPJ3F+/q
         rE96uud+ByygJ4DC1IW1C2l2qrcb0Oip8swQ3asKopxC3h6nr4vY/4Sa3lDPJ5cmFZkP
         qiMg==
X-Gm-Message-State: AOJu0YyFnqJ2vAjAiOyk37tzd94bGtXr39X+b0HTFQyHDdB3qwPEmJtK
	N8UXtRMGexgqZ7fz582B3T7gEireetOmYoy2iKCTRhcFkR/Rp9OKNnwncmoVMQcnnyVyrjWPjpT
	YvLwnxyfXfZCXZJ0MRhDFtZ5bqZCt/MHCpt0yDOH2Fw==
X-Gm-Gg: AZuq6aJVt5XNZYtEjUEWVzwk9Um+LOh5OKl3bv3q86j0rb8aQ5gR9RTV46bokJwvwES
	4PvLR0uZuvKtB+AATHHUn5SFKOytm56yZQQ7YuKb4urysCnCrhJA2w24g4HFxuXWPQE12aCiZRZ
	CgztYxwaguCLolYh7H4cRXvoZguY8cjHFldOWD/hk8iSdL49dVfk4a8DTuwEKAX6hAR9gLem41p
	BUia3jrRb+VDtgAu+qJ0SOOpVz5R1XS5ci2C7oKAH6l7WU/GVGHyXkQgXrg7KZ8OEMlVW3HuYLb
	NNxLICCO731QZo1yxNavjtvEZSAEUGYKsuGqKg8=
X-Received: by 2002:a05:600c:3e18:b0:480:1c1c:47d6 with SMTP id
 5b1f17b1804b1-48069e33b67mr10942095e9.6.1769506198647; Tue, 27 Jan 2026
 01:29:58 -0800 (PST)
MIME-Version: 1.0
References: <20260127091608.598339-1-namanj1@kpit.com>
In-Reply-To: <20260127091608.598339-1-namanj1@kpit.com>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Tue, 27 Jan 2026 10:29:32 +0100
X-Gm-Features: AZwV_Qir7nSLs7F0FaRbreyIJ3YG4fN32NDy6NApYF3V1xaVNJi6rA3MOnyOOww
Message-ID: <CAMSfU+5X8yphvKpggDiwAva9GNrkgPv23udRXqUhrSrJB6Yi9w@mail.gmail.com>
Subject: Re: [OE-core] [meta][scarthgap][PATCH] libmd: add ptest for 'libmd'
To: nmjain23@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000660e5206495b4479"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Jan 2026 09:30:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230038

--000000000000660e5206495b4479
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mar. 27 janv. 2026 =C3=A0 10:16, Naman Jain via lists.openembedded.org
<nmjain23=3Dgmail.com@lists.openembedded.org> a =C3=A9crit :

> Adapt the compile 'test' phony target from Makefile and deploy as
> ptest for libmd.
> It takes less than 30seconds for ptest completion
>
> Signed-off-by: Naman Jain <namanj1@kpit.com>
>

Hello,

This patch was also sent to master :
https://lists.openembedded.org/g/openembedded-core/message/229867
... but not merged yet.

Can you please wait for it to be merged on master before resending the
backport request?

Thanks!


---
>  .../distro/include/ptest-packagelists.inc     |  1 +
>  meta/recipes-support/libmd/files/run-ptest    | 18 ++++++++++++++++
>  meta/recipes-support/libmd/libmd_1.1.0.bb     | 21 +++++++++++++++++--
>  3 files changed, 38 insertions(+), 2 deletions(-)
>  create mode 100644 meta/recipes-support/libmd/files/run-ptest
>
> diff --git a/meta/conf/distro/include/ptest-packagelists.inc
> b/meta/conf/distro/include/ptest-packagelists.inc
> index 9950e46776..784176f579 100644
> --- a/meta/conf/distro/include/ptest-packagelists.inc
> +++ b/meta/conf/distro/include/ptest-packagelists.inc
> @@ -29,6 +29,7 @@ PTESTS_FAST =3D "\
>      json-glib \
>      libconvert-asn1-perl \
>      libgpg-error\
> +    libmd\
>      libnl \
>      libpcre \
>      libssh2 \
> diff --git a/meta/recipes-support/libmd/files/run-ptest
> b/meta/recipes-support/libmd/files/run-ptest
> new file mode 100644
> index 0000000000..0c4a5f64ec
> --- /dev/null
> +++ b/meta/recipes-support/libmd/files/run-ptest
> @@ -0,0 +1,18 @@
> +#!/bin/sh
> +
> +cd test
> +status =3D 0
> +
> +for testbin in *; do
> +    if [ -x "$testbin" ] && [ ! -d "$testbin" ]; then
> +        if "./$testbin"; then
> +            echo "PASS: $testbin"
> +        else
> +            echo "FAIL: $testbin"
> +            status=3D1
> +        fi
> +    fi
> +done
> +
> +return $status
> +
> diff --git a/meta/recipes-support/libmd/libmd_1.1.0.bb
> b/meta/recipes-support/libmd/libmd_1.1.0.bb
> index dc588a0f95..ffc59deb26 100644
> --- a/meta/recipes-support/libmd/libmd_1.1.0.bb
> +++ b/meta/recipes-support/libmd/libmd_1.1.0.bb
> @@ -8,9 +8,26 @@ HOMEPAGE =3D "https://www.hadrons.org/software/libmd/"
>  LICENSE =3D "BSD-3-Clause & BSD-2-Clause"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D0436d4fb62a71f661d6e8b7812f9e=
1df"
>
> -SRC_URI =3D "https://archive.hadrons.org/software/libmd/libmd-${PV}.tar.=
xz"
> +SRC_URI =3D "https://archive.hadrons.org/software/libmd/libmd-${PV}.tar.=
xz
> \
> +          file://run-ptest \
> +"
>  SRC_URI[sha256sum] =3D
> "1bd6aa42275313af3141c7cf2e5b964e8b1fd488025caf2f971f43b00776b332"
>
> -inherit autotools
> +inherit autotools ptest
> +
> +do_compile_ptest() {
> +    sed -i "/\$(MAKE) \$(AM_MAKEFLAGS) check-TESTS/d" test/Makefile
> +    oe_runmake check
> +}
> +
> +
> +do_install_ptest() {
> +    install -d ${D}${PTEST_PATH}/test
> +    for bin in ${B}/test/*; do
> +        if [ -x "$bin" ]; then
> +            ${B}/libtool --mode=3Dinstall install "$bin"
> ${D}${PTEST_PATH}/test/$(basename "$bin")
> +        fi
> +    done
> +}
>
>  BBCLASSEXTEND =3D "native nativesdk"
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#230035):
> https://lists.openembedded.org/g/openembedded-core/message/230035
> Mute This Topic: https://lists.openembedded.org/mt/117485645/4316185
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> yoann.congal@smile.fr]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Yoann Congal
Smile ECS

--000000000000660e5206495b4479
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0mar. 27=
 janv. 2026 =C3=A0=C2=A010:16, Naman Jain via <a href=3D"http://lists.opene=
mbedded.org">lists.openembedded.org</a> &lt;nmjain23=3D<a href=3D"mailto:gm=
ail.com@lists.openembedded.org">gmail.com@lists.openembedded.org</a>&gt; a =
=C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">Adapt the compile &#39;test&#39; phony target from Makefile and deploy as=
<br>
ptest for libmd.<br>
It takes less than 30seconds for ptest completion<br>
<br>
Signed-off-by: Naman Jain &lt;<a href=3D"mailto:namanj1@kpit.com" target=3D=
"_blank">namanj1@kpit.com</a>&gt;<br></blockquote><div><br></div><div>Hello=
,</div><div><br></div><div>This patch was also sent to master :=C2=A0<a hre=
f=3D"https://lists.openembedded.org/g/openembedded-core/message/229867">htt=
ps://lists.openembedded.org/g/openembedded-core/message/229867</a></div><di=
v>... but not merged yet.</div><div><br></div><div>Can you please wait for =
it to be merged on master before resending the backport request?</div><div>=
<br></div><div>Thanks!</div><div><br></div><div><br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
---<br>
=C2=A0.../distro/include/ptest-packagelists.inc=C2=A0 =C2=A0 =C2=A0|=C2=A0 =
1 +<br>
=C2=A0meta/recipes-support/libmd/files/run-ptest=C2=A0 =C2=A0 | 18 ++++++++=
++++++++<br>
=C2=A0meta/recipes-support/libmd/<a href=3D"http://libmd_1.1.0.bb" rel=3D"n=
oreferrer" target=3D"_blank">libmd_1.1.0.bb</a>=C2=A0 =C2=A0 =C2=A0| 21 +++=
++++++++++++++--<br>
=C2=A03 files changed, 38 insertions(+), 2 deletions(-)<br>
=C2=A0create mode 100644 meta/recipes-support/libmd/files/run-ptest<br>
<br>
diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/di=
stro/include/ptest-packagelists.inc<br>
index 9950e46776..784176f579 100644<br>
--- a/meta/conf/distro/include/ptest-packagelists.inc<br>
+++ b/meta/conf/distro/include/ptest-packagelists.inc<br>
@@ -29,6 +29,7 @@ PTESTS_FAST =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0json-glib \<br>
=C2=A0 =C2=A0 =C2=A0libconvert-asn1-perl \<br>
=C2=A0 =C2=A0 =C2=A0libgpg-error\<br>
+=C2=A0 =C2=A0 libmd\<br>
=C2=A0 =C2=A0 =C2=A0libnl \<br>
=C2=A0 =C2=A0 =C2=A0libpcre \<br>
=C2=A0 =C2=A0 =C2=A0libssh2 \<br>
diff --git a/meta/recipes-support/libmd/files/run-ptest b/meta/recipes-supp=
ort/libmd/files/run-ptest<br>
new file mode 100644<br>
index 0000000000..0c4a5f64ec<br>
--- /dev/null<br>
+++ b/meta/recipes-support/libmd/files/run-ptest<br>
@@ -0,0 +1,18 @@<br>
+#!/bin/sh<br>
+<br>
+cd test<br>
+status =3D 0<br>
+<br>
+for testbin in *; do<br>
+=C2=A0 =C2=A0 if [ -x &quot;$testbin&quot; ] &amp;&amp; [ ! -d &quot;$test=
bin&quot; ]; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if &quot;./$testbin&quot;; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;PASS: $testbin&quot;<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;FAIL: $testbin&quot;<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 status=3D1<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
+=C2=A0 =C2=A0 fi<br>
+done<br>
+<br>
+return $status<br>
+<br>
diff --git a/meta/recipes-support/libmd/<a href=3D"http://libmd_1.1.0.bb" r=
el=3D"noreferrer" target=3D"_blank">libmd_1.1.0.bb</a> b/meta/recipes-suppo=
rt/libmd/<a href=3D"http://libmd_1.1.0.bb" rel=3D"noreferrer" target=3D"_bl=
ank">libmd_1.1.0.bb</a><br>
index dc588a0f95..ffc59deb26 100644<br>
--- a/meta/recipes-support/libmd/<a href=3D"http://libmd_1.1.0.bb" rel=3D"n=
oreferrer" target=3D"_blank">libmd_1.1.0.bb</a><br>
+++ b/meta/recipes-support/libmd/<a href=3D"http://libmd_1.1.0.bb" rel=3D"n=
oreferrer" target=3D"_blank">libmd_1.1.0.bb</a><br>
@@ -8,9 +8,26 @@ HOMEPAGE =3D &quot;<a href=3D"https://www.hadrons.org/soft=
ware/libmd/" rel=3D"noreferrer" target=3D"_blank">https://www.hadrons.org/s=
oftware/libmd/</a>&quot;<br>
=C2=A0LICENSE =3D &quot;BSD-3-Clause &amp; BSD-2-Clause&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D0436d4fb62a71f661d6e8=
b7812f9e1df&quot;<br>
<br>
-SRC_URI =3D &quot;<a href=3D"https://archive.hadrons.org/software/libmd/li=
bmd-$%7BPV%7D.tar.xz" rel=3D"noreferrer" target=3D"_blank">https://archive.=
hadrons.org/software/libmd/libmd-${PV}.tar.xz</a>&quot;<br>
+SRC_URI =3D &quot;<a href=3D"https://archive.hadrons.org/software/libmd/li=
bmd-$%7BPV%7D.tar.xz" rel=3D"noreferrer" target=3D"_blank">https://archive.=
hadrons.org/software/libmd/libmd-${PV}.tar.xz</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://run-ptest \<br>
+&quot;<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;1bd6aa42275313af3141c7cf2e5b964e8b1fd488=
025caf2f971f43b00776b332&quot;<br>
<br>
-inherit autotools<br>
+inherit autotools ptest<br>
+<br>
+do_compile_ptest() {<br>
+=C2=A0 =C2=A0 sed -i &quot;/\$(MAKE) \$(AM_MAKEFLAGS) check-TESTS/d&quot; =
test/Makefile<br>
+=C2=A0 =C2=A0 oe_runmake check<br>
+}<br>
+<br>
+<br>
+do_install_ptest() {<br>
+=C2=A0 =C2=A0 install -d ${D}${PTEST_PATH}/test<br>
+=C2=A0 =C2=A0 for bin in ${B}/test/*; do<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ -x &quot;$bin&quot; ]; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${B}/libtool --mode=3Dinstall in=
stall &quot;$bin&quot; ${D}${PTEST_PATH}/test/$(basename &quot;$bin&quot;)<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
+=C2=A0 =C2=A0 done<br>
+}<br>
<br>
=C2=A0BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#230035): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/230035" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/230035</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/117485645/431=
6185" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/117485645/4316185</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:yoann.congal@smile.fr" tar=
get=3D"_blank">yoann.congal@smile.fr</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><br><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr"><font face=3D"Raleway, regular">Yoann Congal</font><div><fon=
t face=3D"Raleway, regular">Smile ECS</font></div></div></div></div>

--000000000000660e5206495b4479--

