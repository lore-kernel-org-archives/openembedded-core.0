Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46D66C2BD09
	for <webhook@archiver.kernel.org>; Wed,  3 Jul 2024 13:52:36 +0000 (UTC)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
 by mx.groups.io with SMTP id smtpd.web10.50875.1720014748123971993
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Jul 2024 06:52:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jhordfX9;
 spf=pass (domain: gmail.com, ip: 209.85.217.51, mailfrom: quaresma.jose@gmail.com)
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-48fe544ce8cso182788137.2
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Jul 2024 06:52:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720014747; x=1720619547; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4G5F06+DGXOasl1FfrOcWuCtLyaU/GD4NYopmGleMbE=;
        b=jhordfX9utd9R4IgJ6IKqoovVQmtfGPd9mhPg7VlIXZbb+teOMJbaE/daFTVo/MWQA
         28k+t28hxNapo3GZJRCRCsV+Ii3x7LviuJSsSeyxy4BXYJvWqsKEIbhaiwyS6QEAN+jW
         s7d3tS4O11hAVbcjXhAbSKi82omjAlPB1v19+v10za/ak0CPQpmE/VR5XG3nQQEgzyI0
         nZBu4bwv6f2L0DCvCJUTb+IsJ/wT/4n43ksZMeP9WkUa7fb85Va0YDwR1oKX8EkTTU+O
         fJRsjjRKeeTuHERNI4DKhqvg0k3esCSKtgv8+p4BvG3uaMrVUIOGGwQ8QYqN5RYg40Pp
         pPCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720014747; x=1720619547;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4G5F06+DGXOasl1FfrOcWuCtLyaU/GD4NYopmGleMbE=;
        b=oQMcbj4toYIhkfj/6ZsmRER6HeYIkmZcnyx5VAAQ3P9LVQJE2lsAkq9u1Q4rr2OIB3
         ngSeJnT4LiwcODzW3Q0qc4dp3f5UjGLeZqxFLbuGO2Bx1ErlGON/uY0vRURtR47UDUxm
         +TORHXX0F+r3Ycs4svmxdUz+UwxuzGKcvDTdhOSfVPklmQrQOeaRZSaCRXZA2b2zEHH6
         XZkHa/qxN0LwCVyNECt45rq9E+3kBoFBqB/1YFftls1UcKyu5INu5g39+0KJ3xSH0MlR
         0hxAJ8yn82FgH+d06gzyFVyi6jBtrGhBujJzPhONfaX4HklNsVoUuVwlGrkolUA35C4y
         ribg==
X-Gm-Message-State: AOJu0YxSOiJ9aMnIm8sfm1SMTo3sodptkzNCP1kKMHmIX4u7ppIdKf4Q
	9Qp9N4y1ydP40AUupLE1BQFICFycDpuyoL00cIu15f+U5QR7nIkq7mOQoLLGWM64EpMCOTsKuay
	1mJ6RkNexeSOs3S447H10zcg0nd8=
X-Google-Smtp-Source: AGHT+IGjHKy8ADoSGgycYEhI3rHYmetdY2uKqRgxeXecHCbKSULxZesGMFHAxe+4blyCn/ic5JGB8S4CqXiOlMVocaA=
X-Received: by 2002:a67:f256:0:b0:48f:3bfb:184d with SMTP id
 ada2fe7eead31-48faf0ce36fmr13105159137.16.1720014747034; Wed, 03 Jul 2024
 06:52:27 -0700 (PDT)
MIME-Version: 1.0
References: <20240703121701.175028-1-jose.quaresma@foundries.io> <CAOSpxdY6VC2ZH8DGVpvFV0tO5=O6pvHnL7LKhgnXnQQw1Hfc8A@mail.gmail.com>
In-Reply-To: <CAOSpxdY6VC2ZH8DGVpvFV0tO5=O6pvHnL7LKhgnXnQQw1Hfc8A@mail.gmail.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Wed, 3 Jul 2024 14:52:15 +0100
Message-ID: <CANPvuRkiWHPd-BpaRm-kcvY=11TNKdqv-mgZZXgDP7BiCqC1MA@mail.gmail.com>
Subject: Re: [OE-core][scarthgap][PATCH] openssh: fix CVE-2024-6387
To: Steve Sakoman <steve@sakoman.com>
Cc: openembedded-core@lists.openembedded.org, 
	Jose Quaresma <jose.quaresma@foundries.io>
Content-Type: multipart/alternative; boundary="000000000000016e48061c582439"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Jul 2024 13:52:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201479

--000000000000016e48061c582439
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Steve Sakoman <steve@sakoman.com> escreveu (quarta, 3/07/2024 =C3=A0(s) 14:=
37):

> On Wed, Jul 3, 2024 at 5:17=E2=80=AFAM Jose Quaresma via
> lists.openembedded.org
> <quaresma.jose=3Dgmail.com@lists.openembedded.org> wrote:
> >
> > sshd(8) in Portable OpenSSH versions 8.5p1 to 9.7p1 (inclusive).
> > Race condition resulting in potential remote code execution.
> > A race condition in sshd(8) could allow remote code execution as root o=
n
> non-OpenBSD systems.
> > This attack could be prevented by disabling the login grace timeout
> (LoginGraceTime=3D0 in sshd_config)
> > though this makes denial-of service against sshd(8) considerably easier=
.
> > For more information, please refer to the release notes [1] and the
> > report from the Qualys Security Advisory Team [2] who discovered the bu=
g.
> >
> > [1] https://www.openssh.com/txt/release-9.8
> > [2] https://www.qualys.com/2024/07/01/cve-2024-6387/regresshion.txt
> >
> > References:
> > https://www.openssh.com/security.html
> >
> > Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
> > ---
> >  .../openssh/openssh/CVE-2024-6387.patch       | 27 +++++++++++++++++++
> >  .../openssh/openssh_9.6p1.bb                  |  1 +
> >  2 files changed, 28 insertions(+)
> >  create mode 100644
> meta/recipes-connectivity/openssh/openssh/CVE-2024-6387.patch
> >
> > diff --git
> a/meta/recipes-connectivity/openssh/openssh/CVE-2024-6387.patch
> b/meta/recipes-connectivity/openssh/openssh/CVE-2024-6387.patch
> > new file mode 100644
> > index 0000000000..3e7c707100
> > --- /dev/null
> > +++ b/meta/recipes-connectivity/openssh/openssh/CVE-2024-6387.patch
> > @@ -0,0 +1,27 @@
> > +Description: fix signal handler race condition
> > +Bug-Ubuntu:
> https://bugs.launchpad.net/ubuntu/+source/openssh/+bug/2070497
> > +
> > +CVE: CVE-2024-6387
> > +
> > +Upstream-Status: Backport
> > +
> https://git.launchpad.net/ubuntu/+source/openssh/commit/?h=3Dapplied/ubun=
tu/jammy-devel&id=3Db059bcfa928df4ff2d103ae2e8f4e3136ee03efc
>
> Launchpad is not the upstream for openssh, please send a V2 that
> references the actual upstream commit.
>

A similar question was made for the kirkstone version on
https://lists.openembedded.org/g/openembedded-core/message/201441
As I responded yesterday, this patch uses the suggested fix of the
regression report.

I can remove the Backport from the Upstream-Status but I don't know what to
put in this case.

For not using this fix and using the one mentioned, I need more time to
analyze.
https://github.com/openssh/openssh-portable/commit/b00331402fe5c60d577f3ffc=
c35e49286cdc6b47

Jose


>
> Thanks!
>
> Steve
>
> > +
> > +Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
> > +
> > +--- a/log.c
> > ++++ b/log.c
> > +@@ -452,12 +452,14 @@ void
> > + sshsigdie(const char *file, const char *func, int line, int showfunc,
> > +     LogLevel level, const char *suffix, const char *fmt, ...)
> > + {
> > ++#if 0
> > +       va_list args;
> > +
> > +       va_start(args, fmt);
> > +       sshlogv(file, func, line, showfunc, SYSLOG_LEVEL_FATAL,
> > +           suffix, fmt, args);
> > +       va_end(args);
> > ++#endif
> > +       _exit(1);
> > + }
> > +
> > diff --git a/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
> b/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
> > index d941664b41..3cdf0327b0 100644
> > --- a/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
> > +++ b/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
> > @@ -27,6 +27,7 @@ SRC_URI =3D "
> http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar
> >             file://add-test-support-for-busybox.patch \
> >
>  file://0001-regress-banner.sh-log-input-and-output-files-on-erro.patch \
> >
>  file://0001-systemd-Add-optional-support-for-systemd-sd_notify.patch \
> > +           file://CVE-2024-6387.patch \
> >             "
> >  SRC_URI[sha256sum] =3D
> "910211c07255a8c5ad654391b40ee59800710dd8119dd5362de09385aa7a777c"
> >
> > --
> > 2.45.2
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#201470):
> https://lists.openembedded.org/g/openembedded-core/message/201470
> > Mute This Topic: https://lists.openembedded.org/mt/107018061/3620601
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> steve@sakoman.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>


--=20
Best regards,

Jos=C3=A9 Quaresma

--000000000000016e48061c582439
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Steve Sakoman &lt;<a href=3D"mailto:s=
teve@sakoman.com">steve@sakoman.com</a>&gt; escreveu (quarta, 3/07/2024 =C3=
=A0(s) 14:37):<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">O=
n Wed, Jul 3, 2024 at 5:17=E2=80=AFAM Jose Quaresma via<br>
<a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_bla=
nk">lists.openembedded.org</a><br>
&lt;quaresma.jose=3D<a href=3D"mailto:gmail.com@lists.openembedded.org" tar=
get=3D"_blank">gmail.com@lists.openembedded.org</a>&gt; wrote:<br>
&gt;<br>
&gt; sshd(8) in Portable OpenSSH versions 8.5p1 to 9.7p1 (inclusive).<br>
&gt; Race condition resulting in potential remote code execution.<br>
&gt; A race condition in sshd(8) could allow remote code execution as root =
on non-OpenBSD systems.<br>
&gt; This attack could be prevented by disabling the login grace timeout (L=
oginGraceTime=3D0 in sshd_config)<br>
&gt; though this makes denial-of service against sshd(8) considerably easie=
r.<br>
&gt; For more information, please refer to the release notes [1] and the<br=
>
&gt; report from the Qualys Security Advisory Team [2] who discovered the b=
ug.<br>
&gt;<br>
&gt; [1] <a href=3D"https://www.openssh.com/txt/release-9.8" rel=3D"norefer=
rer" target=3D"_blank">https://www.openssh.com/txt/release-9.8</a><br>
&gt; [2] <a href=3D"https://www.qualys.com/2024/07/01/cve-2024-6387/regress=
hion.txt" rel=3D"noreferrer" target=3D"_blank">https://www.qualys.com/2024/=
07/01/cve-2024-6387/regresshion.txt</a><br>
&gt;<br>
&gt; References:<br>
&gt; <a href=3D"https://www.openssh.com/security.html" rel=3D"noreferrer" t=
arget=3D"_blank">https://www.openssh.com/security.html</a><br>
&gt;<br>
&gt; Signed-off-by: Jose Quaresma &lt;<a href=3D"mailto:jose.quaresma@found=
ries.io" target=3D"_blank">jose.quaresma@foundries.io</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../openssh/openssh/CVE-2024-6387.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 27 +++++++++++++++++++<br>
&gt;=C2=A0 .../openssh/<a href=3D"http://openssh_9.6p1.bb" rel=3D"noreferre=
r" target=3D"_blank">openssh_9.6p1.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 1 +<br>
&gt;=C2=A0 2 files changed, 28 insertions(+)<br>
&gt;=C2=A0 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE=
-2024-6387.patch<br>
&gt;<br>
&gt; diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2024-6387.p=
atch b/meta/recipes-connectivity/openssh/openssh/CVE-2024-6387.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..3e7c707100<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-connectivity/openssh/openssh/CVE-2024-6387.patch<br=
>
&gt; @@ -0,0 +1,27 @@<br>
&gt; +Description: fix signal handler race condition<br>
&gt; +Bug-Ubuntu: <a href=3D"https://bugs.launchpad.net/ubuntu/+source/open=
ssh/+bug/2070497" rel=3D"noreferrer" target=3D"_blank">https://bugs.launchp=
ad.net/ubuntu/+source/openssh/+bug/2070497</a><br>
&gt; +<br>
&gt; +CVE: CVE-2024-6387<br>
&gt; +<br>
&gt; +Upstream-Status: Backport<br>
&gt; +<a href=3D"https://git.launchpad.net/ubuntu/+source/openssh/commit/?h=
=3Dapplied/ubuntu/jammy-devel&amp;id=3Db059bcfa928df4ff2d103ae2e8f4e3136ee0=
3efc" rel=3D"noreferrer" target=3D"_blank">https://git.launchpad.net/ubuntu=
/+source/openssh/commit/?h=3Dapplied/ubuntu/jammy-devel&amp;id=3Db059bcfa92=
8df4ff2d103ae2e8f4e3136ee03efc</a><br>
<br>
Launchpad is not the upstream for openssh, please send a V2 that<br>
references the actual upstream commit.<br></blockquote><div><br></div><div>=
A similar question was made for the kirkstone version on<br><a href=3D"http=
s://lists.openembedded.org/g/openembedded-core/message/201441">https://list=
s.openembedded.org/g/openembedded-core/message/201441</a><br></div><div>As =
I responded yesterday, this patch uses the suggested fix of the regression=
=C2=A0report.<br><br></div><div><div>I can remove the Backport from the Ups=
tream-Status but I don&#39;t know what to put in this case.</div><div><br>F=
or not using this fix and using the one mentioned, I need more time to anal=
yze.<br></div></div><div><a href=3D"https://github.com/openssh/openssh-port=
able/commit/b00331402fe5c60d577f3ffcc35e49286cdc6b47">https://github.com/op=
enssh/openssh-portable/commit/b00331402fe5c60d577f3ffcc35e49286cdc6b47</a><=
br><br></div><div>Jose</div><div>=C2=A0</div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">
<br>
Thanks!<br>
<br>
Steve<br>
<br>
&gt; +<br>
&gt; +Signed-off-by: Jose Quaresma &lt;<a href=3D"mailto:jose.quaresma@foun=
dries.io" target=3D"_blank">jose.quaresma@foundries.io</a>&gt;<br>
&gt; +<br>
&gt; +--- a/log.c<br>
&gt; ++++ b/log.c<br>
&gt; +@@ -452,12 +452,14 @@ void<br>
&gt; + sshsigdie(const char *file, const char *func, int line, int showfunc=
,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0LogLevel level, const char *suffix, const char *f=
mt, ...)<br>
&gt; + {<br>
&gt; ++#if 0<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0va_list args;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0va_start(args, fmt);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0sshlogv(file, func, line, showfunc, SYSLOG=
_LEVEL_FATAL,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0suffix, fmt, args);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0va_end(args);<br>
&gt; ++#endif<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0_exit(1);<br>
&gt; + }<br>
&gt; +<br>
&gt; diff --git a/meta/recipes-connectivity/openssh/<a href=3D"http://opens=
sh_9.6p1.bb" rel=3D"noreferrer" target=3D"_blank">openssh_9.6p1.bb</a> b/me=
ta/recipes-connectivity/openssh/<a href=3D"http://openssh_9.6p1.bb" rel=3D"=
noreferrer" target=3D"_blank">openssh_9.6p1.bb</a><br>
&gt; index d941664b41..3cdf0327b0 100644<br>
&gt; --- a/meta/recipes-connectivity/openssh/<a href=3D"http://openssh_9.6p=
1.bb" rel=3D"noreferrer" target=3D"_blank">openssh_9.6p1.bb</a><br>
&gt; +++ b/meta/recipes-connectivity/openssh/<a href=3D"http://openssh_9.6p=
1.bb" rel=3D"noreferrer" target=3D"_blank">openssh_9.6p1.bb</a><br>
&gt; @@ -27,6 +27,7 @@ SRC_URI =3D &quot;<a href=3D"http://ftp.openbsd.org/=
pub/OpenBSD/OpenSSH/portable/openssh-$%7BPV%7D.tar" rel=3D"noreferrer" targ=
et=3D"_blank">http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-$=
{PV}.tar</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://add-test-support=
-for-busybox.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-regress-ban=
ner.sh-log-input-and-output-files-on-erro.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-systemd-Add=
-optional-support-for-systemd-sd_notify.patch \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2024-6387.patch \=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt;=C2=A0 SRC_URI[sha256sum] =3D &quot;910211c07255a8c5ad654391b40ee598007=
10dd8119dd5362de09385aa7a777c&quot;<br>
&gt;<br>
&gt; --<br>
&gt; 2.45.2<br>
&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#201470): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/201470" rel=3D"noreferrer" target=3D"_blank">h=
ttps://lists.openembedded.org/g/openembedded-core/message/201470</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/10701806=
1/3620601" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.=
org/mt/107018061/3620601</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org=
</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded=
.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:steve@sakoman.com" ta=
rget=3D"_blank">steve@sakoman.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></div></div></=
div>

--000000000000016e48061c582439--

