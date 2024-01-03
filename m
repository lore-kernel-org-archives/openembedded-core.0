Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31035C3DA6E
	for <webhook@archiver.kernel.org>; Wed,  3 Jan 2024 07:22:23 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web10.13009.1704266532816173101
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Jan 2024 23:22:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TFpNf9YU;
 spf=pass (domain: gmail.com, ip: 209.85.167.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-50e7aed09adso8181259e87.0
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Jan 2024 23:22:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704266531; x=1704871331; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TPY89kZlGKdnBznraxDgqYHWHJMSHvtVtEw64zyjzvw=;
        b=TFpNf9YUIHpPWMgclbgFJhDWCPc5mg+A4zLSJq/bkEZAY6l7n7usmMKjazj4nHrHSm
         weaE6+1fqnwidEqgTfeJVGcHggVWptodz0xaF1AW18fx2wMwnJHsXd7R5/bsOY1M5HVw
         TDmkUjrrFGlAMBfhI2GYZmQWuZpNjxcFf531KKEvnBg/GxfM0CKoDfGFKM+pvaRjQ96+
         7vsCHqwZ6e8jD90ddhGeYkAiref0Ay/RZEVCWrOpKEM5WrSToITGkYDK4J5hGWbg3AvA
         TrItqnubZIms65uwTSuJuQHMKSMtZD1ITuxOVRw+cZdH9qzx3EtQEZgzc7qUYwrCk84P
         gcwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704266531; x=1704871331;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TPY89kZlGKdnBznraxDgqYHWHJMSHvtVtEw64zyjzvw=;
        b=Sq5GuyL1MQ+/vU00WngMoIxfzB4cSrGSFX8sUPLwI0oDGBXsHJNXw97m/ubxwQEcgM
         Uo3Naw6gRaR7hlqeGkiQoSLDBhA4EzlMgiGjfJ+/aF9VnwPxm4RtbwXwdP5qImAwazCD
         +j8sy0eNkjh/k+QS3HVWQcmCfxRiUlkJc1YiFbgjkgD6wTl64N+NXq7cUpqlM1IvUO4r
         j9cKqnIf2xTwbJ+n8hPY1sDdBG61rTH3jVhaGLoou8wazrNK+rUKhi8XlPtkrTrjrucK
         KVCjO329LZLmbhQ04tyLE440k8JGmkagrgTcNIR+1rPHM3Ju5M0WqD6OsScB7d8QbKBw
         Ot4Q==
X-Gm-Message-State: AOJu0YwumD00u32Wfs21RU23WjW81kTrSl+DFxGEkBVGnS6/rDPRJVeF
	E5X1+oTIb334RPqOyU9GbVvTt/Fj9XyfcrYEjCk=
X-Google-Smtp-Source: AGHT+IE1/3vcbIifsYMFicUyep9YBRyeZ3frEVxLSktyaxC6DJAAYbv3/uPPdwhPrVtfnQ23rqTRYet3ZrUsENfU++I=
X-Received: by 2002:a05:6512:3b82:b0:50e:6ddb:551d with SMTP id
 g2-20020a0565123b8200b0050e6ddb551dmr8741355lfv.73.1704266530329; Tue, 02 Jan
 2024 23:22:10 -0800 (PST)
MIME-Version: 1.0
References: <20240102083755.316126-1-Qi.Chen@windriver.com>
 <CANNYZj97wWSw-uyEUEppnkXQZ6XROr3BWoCz0KanmMknUTcF4w@mail.gmail.com> <06339c1f-9523-71f0-a6da-0b627ae1d480@windriver.com>
In-Reply-To: <06339c1f-9523-71f0-a6da-0b627ae1d480@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 3 Jan 2024 08:21:59 +0100
Message-ID: <CANNYZj8URXrhQm3i=xZb+R0n8tZg3C5tzd1jRD-DBEzygX06rA@mail.gmail.com>
Subject: Re: [OE-core][PATCH] debugedit: add UPSTREAM_CHECK settings
To: ChenQi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000249682060e05793b"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Jan 2024 07:22:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193272

--000000000000249682060e05793b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This works as expected. What made you think it=E2=80=99s broken and needs c=
hanging?

Alex

On Wed 3. Jan 2024 at 3.47, ChenQi <Qi.Chen@windriver.com> wrote:

> On 1/3/24 00:54, Alexander Kanavin wrote:
> > The check already works, at least for me it correctly checks both the
> > top level directory and the 'latest' directory:
> > ...
> > --2024-01-02 16:51:30--  https://sourceware.org/ftp/debugedit/
> > ...
> > --2024-01-02 16:51:30--  https://sourceware.org/ftp/debugedit/5.0/
> > ...
> > INFO: debugedit                 5.0             MATCH           Chen
> > Qi <Qi.Chen@windriver.com>
> >
> > What does devtool output for you, without the patch?
> >
> > Alex
>
> The command and output are as below. Pure poky master. No local patches.
>
> $ devtool check-upgrade-status debugedit
> NOTE: Starting bitbake server...
> NOTE: Reconnecting to bitbake server...
> NOTE: Retrying server connection (#1)... (18:44:43.533538)
> Loading cache: 100%
> |########################################################################=
###################################################|
>
> Time: 0:00:00
> Loaded 1848 entries from dependency cache.
> --2024-01-02 18:44:46--  https://sourceware.org/ftp/debugedit/
> Resolving sourceware.org (sourceware.org)... 8.43.85.97,
> 2620:52:3:1:0:246e:9693:128c
> Connecting to sourceware.org (sourceware.org)|8.43.85.97|:443...
> connected.
> HTTP request sent, awaiting response... 200 OK
> Length: 2602 (2.5K) [text/html]
> Saving to: =E2=80=98/tmp/wget-index-e1dsj90e/wget-listing-vrofeac4=E2=80=
=99
>
>
> 2024-01-02 18:44:46 (330 MB/s) -
> =E2=80=98/tmp/wget-index-e1dsj90e/wget-listing-vrofeac4=E2=80=99 saved [2=
602/2602]
>
> --2024-01-02 18:44:46--  https://sourceware.org/ftp/debugedit/5.0/
> Resolving sourceware.org (sourceware.org)... 8.43.85.97,
> 2620:52:3:1:0:246e:9693:128c
> Connecting to sourceware.org (sourceware.org)|8.43.85.97|:443...
> connected.
> HTTP request sent, awaiting response... 200 OK
> Length: 1353 (1.3K) [text/html]
> Saving to: =E2=80=98/tmp/wget-index-qwu98rgj/wget-listing-8esd1gn0=E2=80=
=99
>
>
> 2024-01-02 18:44:47 (179 MB/s) -
> =E2=80=98/tmp/wget-index-qwu98rgj/wget-listing-8esd1gn0=E2=80=99 saved [1=
353/1353]
>
> --2024-01-02 18:44:47-- https://sourceware.org/ftp/debugedit/sha512/
> Resolving sourceware.org (sourceware.org)... 8.43.85.97,
> 2620:52:3:1:0:246e:9693:128c
> Connecting to sourceware.org (sourceware.org)|8.43.85.97|:443...
> connected.
> HTTP request sent, awaiting response... 404 Not Found
> 2024-01-02 18:44:47 ERROR 404: Not Found.
>
>
> >
> > On Tue, 2 Jan 2024 at 09:38, Chen Qi via lists.openembedded.org
> > <Qi.Chen=3Dwindriver.com@lists.openembedded.org> wrote:
> >> From: Chen Qi <Qi.Chen@windriver.com>
> >>
> >> Add UPSTREAM_CHECK_URI(REGEX) to allow for checking new releases
> >> for debugedit recipe.
> >>
> >> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> >> ---
> >>   meta/recipes-devtools/debugedit/debugedit_5.0.bb | 3 +++
> >>   1 file changed, 3 insertions(+)
> >>
> >> diff --git a/meta/recipes-devtools/debugedit/debugedit_5.0.bb
> b/meta/recipes-devtools/debugedit/debugedit_5.0.bb
> >> index 63ad7babd9..3a596f5fea 100644
> >> --- a/meta/recipes-devtools/debugedit/debugedit_5.0.bb
> >> +++ b/meta/recipes-devtools/debugedit/debugedit_5.0.bb
> >> @@ -9,6 +9,9 @@ LIC_FILES_CHKSUM =3D
> "file://COPYING;md5=3D59530bdf33659b29e73d4adb9f9f6552 \
> >>
>  file://COPYING.LIB;md5=3D2d5025d4aa3495befef8f17206a5b0a1 \
> >>
>  file://COPYING3;md5=3Dd32239bcb673463ab874e80d47fae504"
> >>
> >> +UPSTREAM_CHECK_URI =3D "https://sourceware.org/ftp/debugedit/"
> >> +UPSTREAM_CHECK_REGEX =3D "(?P<pver>(\d\.\d))/"
> >> +
> >>   SRC_URI =3D "
> https://sourceware.org/ftp/debugedit/${PV}/debugedit-${PV}.tar.xz"
> >>
> >>   SRC_URI:append:libc-musl =3D "\
> >> --
> >> 2.34.1
> >>
> >>
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >> Links: You receive all messages sent to this group.
> >> View/Reply Online (#193220):
> https://lists.openembedded.org/g/openembedded-core/message/193220
> >> Mute This Topic: https://lists.openembedded.org/mt/103478272/1686489
> >> Group Owner: openembedded-core+owner@lists.openembedded.org
> >> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub =
[
> alex.kanavin@gmail.com]
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >>
>
>

--000000000000249682060e05793b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">This works as expected. What made you think it=E2=80=99s =
broken and needs changing?</div><div dir=3D"auto"><br></div><div dir=3D"aut=
o">Alex</div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"=
gmail_attr">On Wed 3. Jan 2024 at 3.47, ChenQi &lt;<a href=3D"mailto:Qi.Che=
n@windriver.com">Qi.Chen@windriver.com</a>&gt; wrote:<br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1=
px;border-left-style:solid;padding-left:1ex;border-left-color:rgb(204,204,2=
04)">On 1/3/24 00:54, Alexander Kanavin wrote:<br>
&gt; The check already works, at least for me it correctly checks both the<=
br>
&gt; top level directory and the &#39;latest&#39; directory:<br>
&gt; ...<br>
&gt; --2024-01-02 16:51:30--=C2=A0 <a href=3D"https://sourceware.org/ftp/de=
bugedit/" rel=3D"noreferrer" target=3D"_blank">https://sourceware.org/ftp/d=
ebugedit/</a><br>
&gt; ...<br>
&gt; --2024-01-02 16:51:30--=C2=A0 <a href=3D"https://sourceware.org/ftp/de=
bugedit/5.0/" rel=3D"noreferrer" target=3D"_blank">https://sourceware.org/f=
tp/debugedit/5.0/</a><br>
&gt; ...<br>
&gt; INFO: debugedit=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A05.0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0MATCH=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Chen<br>
&gt; Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com" target=3D"_blank">Qi.C=
hen@windriver.com</a>&gt;<br>
&gt;<br>
&gt; What does devtool output for you, without the patch?<br>
&gt;<br>
&gt; Alex<br>
<br>
The command and output are as below. Pure poky master. No local patches.<br=
>
<br>
$ devtool check-upgrade-status debugedit<br>
NOTE: Starting bitbake server...<br>
NOTE: Reconnecting to bitbake server...<br>
NOTE: Retrying server connection (#1)... (18:44:43.533538)<br>
Loading cache: 100% <br>
|##########################################################################=
#################################################| <br>
Time: 0:00:00<br>
Loaded 1848 entries from dependency cache.<br>
--2024-01-02 18:44:46--=C2=A0 <a href=3D"https://sourceware.org/ftp/debuged=
it/" rel=3D"noreferrer" target=3D"_blank">https://sourceware.org/ftp/debuge=
dit/</a><br>
Resolving <a href=3D"http://sourceware.org" rel=3D"noreferrer" target=3D"_b=
lank">sourceware.org</a> (<a href=3D"http://sourceware.org" rel=3D"noreferr=
er" target=3D"_blank">sourceware.org</a>)... 8.43.85.97, <br>
2620:52:3:1:0:246e:9693:128c<br>
Connecting to <a href=3D"http://sourceware.org" rel=3D"noreferrer" target=
=3D"_blank">sourceware.org</a> (<a href=3D"http://sourceware.org" rel=3D"no=
referrer" target=3D"_blank">sourceware.org</a>)|8.43.85.97|:443... connecte=
d.<br>
HTTP request sent, awaiting response... 200 OK<br>
Length: 2602 (2.5K) [text/html]<br>
Saving to: =E2=80=98/tmp/wget-index-e1dsj90e/wget-listing-vrofeac4=E2=80=99=
<br>
<br>
<br>
2024-01-02 18:44:46 (330 MB/s) - <br>
=E2=80=98/tmp/wget-index-e1dsj90e/wget-listing-vrofeac4=E2=80=99 saved [260=
2/2602]<br>
<br>
--2024-01-02 18:44:46--=C2=A0 <a href=3D"https://sourceware.org/ftp/debuged=
it/5.0/" rel=3D"noreferrer" target=3D"_blank">https://sourceware.org/ftp/de=
bugedit/5.0/</a><br>
Resolving <a href=3D"http://sourceware.org" rel=3D"noreferrer" target=3D"_b=
lank">sourceware.org</a> (<a href=3D"http://sourceware.org" rel=3D"noreferr=
er" target=3D"_blank">sourceware.org</a>)... 8.43.85.97, <br>
2620:52:3:1:0:246e:9693:128c<br>
Connecting to <a href=3D"http://sourceware.org" rel=3D"noreferrer" target=
=3D"_blank">sourceware.org</a> (<a href=3D"http://sourceware.org" rel=3D"no=
referrer" target=3D"_blank">sourceware.org</a>)|8.43.85.97|:443... connecte=
d.<br>
HTTP request sent, awaiting response... 200 OK<br>
Length: 1353 (1.3K) [text/html]<br>
Saving to: =E2=80=98/tmp/wget-index-qwu98rgj/wget-listing-8esd1gn0=E2=80=99=
<br>
<br>
<br>
2024-01-02 18:44:47 (179 MB/s) - <br>
=E2=80=98/tmp/wget-index-qwu98rgj/wget-listing-8esd1gn0=E2=80=99 saved [135=
3/1353]<br>
<br>
--2024-01-02 18:44:47-- <a href=3D"https://sourceware.org/ftp/debugedit/sha=
512/" rel=3D"noreferrer" target=3D"_blank">https://sourceware.org/ftp/debug=
edit/sha512/</a><br>
Resolving <a href=3D"http://sourceware.org" rel=3D"noreferrer" target=3D"_b=
lank">sourceware.org</a> (<a href=3D"http://sourceware.org" rel=3D"noreferr=
er" target=3D"_blank">sourceware.org</a>)... 8.43.85.97, <br>
2620:52:3:1:0:246e:9693:128c<br>
Connecting to <a href=3D"http://sourceware.org" rel=3D"noreferrer" target=
=3D"_blank">sourceware.org</a> (<a href=3D"http://sourceware.org" rel=3D"no=
referrer" target=3D"_blank">sourceware.org</a>)|8.43.85.97|:443... connecte=
d.<br>
HTTP request sent, awaiting response... 404 Not Found<br>
2024-01-02 18:44:47 ERROR 404: Not Found.<br>
<br>
<br>
&gt;<br>
&gt; On Tue, 2 Jan 2024 at 09:38, Chen Qi via <a href=3D"http://lists.opene=
mbedded.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.org</a=
><br>
&gt; &lt;Qi.Chen=3D<a href=3D"mailto:windriver.com@lists.openembedded.org" =
target=3D"_blank">windriver.com@lists.openembedded.org</a>&gt; wrote:<br>
&gt;&gt; From: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com" target=
=3D"_blank">Qi.Chen@windriver.com</a>&gt;<br>
&gt;&gt;<br>
&gt;&gt; Add UPSTREAM_CHECK_URI(REGEX) to allow for checking new releases<b=
r>
&gt;&gt; for debugedit recipe.<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com=
" target=3D"_blank">Qi.Chen@windriver.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 =C2=A0meta/recipes-devtools/debugedit/<a href=3D"http://debu=
gedit_5.0.bb" rel=3D"noreferrer" target=3D"_blank">debugedit_5.0.bb</a> | 3=
 +++<br>
&gt;&gt;=C2=A0 =C2=A01 file changed, 3 insertions(+)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/meta/recipes-devtools/debugedit/<a href=3D"http://deb=
ugedit_5.0.bb" rel=3D"noreferrer" target=3D"_blank">debugedit_5.0.bb</a> b/=
meta/recipes-devtools/debugedit/<a href=3D"http://debugedit_5.0.bb" rel=3D"=
noreferrer" target=3D"_blank">debugedit_5.0.bb</a><br>
&gt;&gt; index 63ad7babd9..3a596f5fea 100644<br>
&gt;&gt; --- a/meta/recipes-devtools/debugedit/<a href=3D"http://debugedit_=
5.0.bb" rel=3D"noreferrer" target=3D"_blank">debugedit_5.0.bb</a><br>
&gt;&gt; +++ b/meta/recipes-devtools/debugedit/<a href=3D"http://debugedit_=
5.0.bb" rel=3D"noreferrer" target=3D"_blank">debugedit_5.0.bb</a><br>
&gt;&gt; @@ -9,6 +9,9 @@ LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D59=
530bdf33659b29e73d4adb9f9f6552 \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0file://COPYING.LIB;md5=3D2d5025d4aa3495befef8f17206a5b0a1 =
\<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0file://COPYING3;md5=3Dd32239bcb673463ab874e80d47fae504&quo=
t;<br>
&gt;&gt;<br>
&gt;&gt; +UPSTREAM_CHECK_URI =3D &quot;<a href=3D"https://sourceware.org/ft=
p/debugedit/" rel=3D"noreferrer" target=3D"_blank">https://sourceware.org/f=
tp/debugedit/</a>&quot;<br>
&gt;&gt; +UPSTREAM_CHECK_REGEX =3D &quot;(?P&lt;pver&gt;(\d\.\d))/&quot;<br=
>
&gt;&gt; +<br>
&gt;&gt;=C2=A0 =C2=A0SRC_URI =3D &quot;<a href=3D"https://sourceware.org/ft=
p/debugedit/$%7BPV%7D/debugedit-$%7BPV%7D.tar.xz" rel=3D"noreferrer" target=
=3D"_blank">https://sourceware.org/ftp/debugedit/${PV}/debugedit-${PV}.tar.=
xz</a>&quot;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0SRC_URI:append:libc-musl =3D &quot;\<br>
&gt;&gt; --<br>
&gt;&gt; 2.34.1<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;&gt; Links: You receive all messages sent to this group.<br>
&gt;&gt; View/Reply Online (#193220): <a href=3D"https://lists.openembedded=
.org/g/openembedded-core/message/193220" rel=3D"noreferrer" target=3D"_blan=
k">https://lists.openembedded.org/g/openembedded-core/message/193220</a><br=
>
&gt;&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/1034=
78272/1686489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembed=
ded.org/mt/103478272/1686489</a><br>
&gt;&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.ope=
nembedded.org" target=3D"_blank">openembedded-core+owner@lists.openembedded=
.org</a><br>
&gt;&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembed=
ded-core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembe=
dded.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.kanavin@gmai=
l.com" target=3D"_blank">alex.kanavin@gmail.com</a>]<br>
&gt;&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;&gt;<br>
<br>
</blockquote></div></div>

--000000000000249682060e05793b--

