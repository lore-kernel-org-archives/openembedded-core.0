Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2630CC001DF
	for <webhook@archiver.kernel.org>; Tue,  1 Aug 2023 09:06:59 +0000 (UTC)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
 by mx.groups.io with SMTP id smtpd.web10.8568.1690880808846581088
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Aug 2023 02:06:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=dAtUMwYN;
 spf=pass (domain: gmail.com, ip: 209.85.217.49, mailfrom: quaresma.jose@gmail.com)
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-44799de68f3so967492137.1
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Aug 2023 02:06:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690880808; x=1691485608;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=EluCPzpVU/b6afPDFOU9ovCCXQ76i3swPFOrImv95nw=;
        b=dAtUMwYNCrMxhc5TLmVVto3leb8WW+7TkNUfzhyJK42Apxslh9YfTZt/zjCGieEU+x
         C9wr4RogibfvsaOxH6/BP/B/P/mdIBc2YvcSeDygx8K/GVKtnhyGJMvIXACK9bblzd2y
         5CxWcNTnSmufDkCBjXHkzZJV9snD8Pzljh48Y6SLIgifnlTolnN31TU/nnzbt6kr9SHX
         Hd9zZQ5wFgW5MGmUz2TAZ90hUFbUnIogGDNcTw5/KCZpAx/aMCoLIRfuAuYKRGnZgBYR
         7nSeA1G6R9hdQlG/6R/muHNK/3ihZFUGAnTBQNlfGrHkKfBy5MTqBoiChqCLSddrIqv7
         Rd0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690880808; x=1691485608;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EluCPzpVU/b6afPDFOU9ovCCXQ76i3swPFOrImv95nw=;
        b=MoDWMqy0g0oSltos/I9nnPY3P66XLMyWvddZY6+1TZeQ7+iTnmPKZ3H8/OP029us/y
         fMO6AWz6czxIZGf2SXjzC1eqH4lrsIGixlqwC5AwhYNj539crN5G814Wo5rg4RDI9hJ2
         dxP4qfc3I7swyjNY5jmkL1R3UkA6YCW7SrouPXTE/qrO8dJfN3rU4euYGo6Ik1looZ/o
         E1VKHR17k7p+ZrBshUNcgDQZpSOp3NynG3TAkQ8cm307rQyOu2nTEWzfnQV3BUmKEVl8
         bht+L2iv3cLLo6nC7t0D9zopAltvC5L4DFRzxudWY8+NnKgOJsS4szbxVDgvl7gmbKM2
         EKRg==
X-Gm-Message-State: ABy/qLbB0rRkwzZn0T3g4n689oVRc7HpjLBS4j81/so/NBLAHdmx5RdQ
	mPvQXR5qqHCNDwu/Oz+CwBUhOYO0YCTu9vVvTRw=
X-Google-Smtp-Source: APBJJlH/l2CNflyWC/WTTcSAE5VnblbwMS8fULF/asJNd5YbN3ADhtQcu0Ada4vUbQxavNgdZFk7iovNSeoh5I3KuIE=
X-Received: by 2002:a05:6102:508a:b0:439:3e26:990e with SMTP id
 bl10-20020a056102508a00b004393e26990emr1032698vsb.6.1690880807856; Tue, 01
 Aug 2023 02:06:47 -0700 (PDT)
MIME-Version: 1.0
References: <20230731082138.92309-1-zboszor@gmail.com> <2023073117111183e153dc@mail.local>
 <2e251892-014d-4b33-e11c-d6c46897b7ef@gmail.com>
In-Reply-To: <2e251892-014d-4b33-e11c-d6c46897b7ef@gmail.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Tue, 1 Aug 2023 10:06:37 +0100
Message-ID: <CANPvuRmF-qsN7ApViG6LZx2VTjd-Y-c1X=QH=n1NZ-iDpb7KKw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v5] rpm: Allow setting platform macro settings externally
To: Zoltan Boszormenyi <zboszor@gmail.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, openembedded-core@lists.openembedded.org, 
	Ross Burton <Ross.Burton@arm.com>, Alexander Kanavin <alex.kanavin@gmail.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: multipart/alternative; boundary="000000000000e8eda00601d8dd05"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Aug 2023 09:06:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185218

--000000000000e8eda00601d8dd05
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Zoltan Boszormenyi <zboszor@gmail.com> escreveu no dia ter=C3=A7a, 1/08/202=
3
=C3=A0(s) 06:26:

> 2023. 07. 31. 19:11 keltez=C3=A9ssel, Alexandre Belloni =C3=ADrta:
> > Hello,
> >
> > On 31/07/2023 10:21:38+0200, Zoltan Boszormenyi wrote:
> >> Feed platform settings to installplatform externally. Based on the pat=
ch
> >> submitted under
> https://github.com/rpm-software-management/rpm/pull/2585
> >>
> >> Patch against INSTALL was backported for rpm 4.18.1
> >>
> >> Signed-off-by: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszor@gmail.c=
om>
> >> ---
> >>   ...atform-macro-settings-externally-258.patch | 118 ++++++++++++++++=
++
> >>   meta/recipes-devtools/rpm/rpm_4.18.1.bb       |  20 +++
> >>   2 files changed, 138 insertions(+)
> >>   create mode 100644
> meta/recipes-devtools/rpm/files/0001-Allow-setting-platform-macro-setting=
s-externally-258.patch
> >>
> >> diff --git
> a/meta/recipes-devtools/rpm/files/0001-Allow-setting-platform-macro-setti=
ngs-externally-258.patch
> b/meta/recipes-devtools/rpm/files/0001-Allow-setting-platform-macro-setti=
ngs-externally-258.patch
> >> new file mode 100644
> >> index 0000000000..f4c3630b8c
> >> --- /dev/null
> >> +++
> b/meta/recipes-devtools/rpm/files/0001-Allow-setting-platform-macro-setti=
ngs-externally-258.patch
> >> @@ -0,0 +1,118 @@
> >> +From e58c607dcdb303ff3ba1b22fd23eb20e374b6ed3 Mon Sep 17 00:00:00 200=
1
> >> +From: =3D?UTF-8?q?Zolt=3DC3=3DA1n=3D20B=3DC3=3DB6sz=3DC3=3DB6rm=3DC3=
=3DA9nyi?=3D
> >> + <zboszor@gmail.com>
> >> +Date: Fri, 28 Jul 2023 12:16:56 +0200
> >> +Subject: [PATCH] Allow setting platform macro settings externally
> (#2585)
> >> +MIME-Version: 1.0
> >> +Content-Type: text/plain; charset=3DUTF-8
> >> +Content-Transfer-Encoding: 8bit
> >> +
> >> +* Allow setting platform macro settings externally
> >> +
> >> +By default, rpm installs a series of default platforms based on
> >> +the CPU architecture names in subdirectories called
> >> +
> >> +    /usr/lib/platform/<arch>-<os>
> >> +
> >> +This is enough for regular Linux distributions. However, some
> >> +distributions may use more specific platform names that refer to
> >> +particular computer systems, like SBCs or specific CPU tuning when
> >> +compiling.
> >> +
> >> +If the platform subdirectory does not exist in /usr/lib/platform
> >> +then rpmbuild does not work.
> >> +
> >> +Allow creating such custom platform subdirectory with feeding
> >> +the necessary data using external variables: RPM_CUSTOM_ARCH,
> >> +RPM_CUSTOM_ISANAME, RPM_CUSTOM_ISABITS, RPM_CUSTOM_CANONARCH
> >> +and RPM_CUSTOM_CANONCOLOR
> >> +
> >> +Signed-off-by: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszor@gmail.=
com>
> >> +
> >> +---------
> >> +
> >> +Signed-off-by: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszor@gmail.=
com>
> >> +Co-authored-by: Florian Festi <ffesti@redhat.com>
> > This is missing the Upstream-Status tag.
>
> "Upstream-Status: Backport" ?
>

Yes as it is already merged on master.

Upstream-Status: Backport [
https://github.com/rpm-software-management/rpm/commit/fde03ae33d55b160a31a6=
c54946880dcdf8fd0d6
]

Jose


>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#185191):
> https://lists.openembedded.org/g/openembedded-core/message/185191
> Mute This Topic: https://lists.openembedded.org/mt/100457649/5052612
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--000000000000e8eda00601d8dd05
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Zoltan Boszormenyi &lt;<a href=3D"mai=
lto:zboszor@gmail.com">zboszor@gmail.com</a>&gt; escreveu no dia ter=C3=A7a=
, 1/08/2023 =C3=A0(s) 06:26:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">2023. 07. 31. 19:11 keltez=C3=A9ssel, Alexandre Belloni =C3=AD=
rta:<br>
&gt; Hello,<br>
&gt;<br>
&gt; On 31/07/2023 10:21:38+0200, Zoltan Boszormenyi wrote:<br>
&gt;&gt; Feed platform settings to installplatform externally. Based on the=
 patch<br>
&gt;&gt; submitted under <a href=3D"https://github.com/rpm-software-managem=
ent/rpm/pull/2585" rel=3D"noreferrer" target=3D"_blank">https://github.com/=
rpm-software-management/rpm/pull/2585</a><br>
&gt;&gt;<br>
&gt;&gt; Patch against INSTALL was backported for rpm 4.18.1<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi &lt;<a href=
=3D"mailto:zboszor@gmail.com" target=3D"_blank">zboszor@gmail.com</a>&gt;<b=
r>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 =C2=A0...atform-macro-settings-externally-258.patch | 118 ++=
++++++++++++++++<br>
&gt;&gt;=C2=A0 =C2=A0meta/recipes-devtools/rpm/<a href=3D"http://rpm_4.18.1=
.bb" rel=3D"noreferrer" target=3D"_blank">rpm_4.18.1.bb</a>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 20 +++<br>
&gt;&gt;=C2=A0 =C2=A02 files changed, 138 insertions(+)<br>
&gt;&gt;=C2=A0 =C2=A0create mode 100644 meta/recipes-devtools/rpm/files/000=
1-Allow-setting-platform-macro-settings-externally-258.patch<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/meta/recipes-devtools/rpm/files/0001-Allow-setting-pl=
atform-macro-settings-externally-258.patch b/meta/recipes-devtools/rpm/file=
s/0001-Allow-setting-platform-macro-settings-externally-258.patch<br>
&gt;&gt; new file mode 100644<br>
&gt;&gt; index 0000000000..f4c3630b8c<br>
&gt;&gt; --- /dev/null<br>
&gt;&gt; +++ b/meta/recipes-devtools/rpm/files/0001-Allow-setting-platform-=
macro-settings-externally-258.patch<br>
&gt;&gt; @@ -0,0 +1,118 @@<br>
&gt;&gt; +From e58c607dcdb303ff3ba1b22fd23eb20e374b6ed3 Mon Sep 17 00:00:00=
 2001<br>
&gt;&gt; +From: =3D?UTF-8?q?Zolt=3DC3=3DA1n=3D20B=3DC3=3DB6sz=3DC3=3DB6rm=
=3DC3=3DA9nyi?=3D<br>
&gt;&gt; + &lt;<a href=3D"mailto:zboszor@gmail.com" target=3D"_blank">zbosz=
or@gmail.com</a>&gt;<br>
&gt;&gt; +Date: Fri, 28 Jul 2023 12:16:56 +0200<br>
&gt;&gt; +Subject: [PATCH] Allow setting platform macro settings externally=
 (#2585)<br>
&gt;&gt; +MIME-Version: 1.0<br>
&gt;&gt; +Content-Type: text/plain; charset=3DUTF-8<br>
&gt;&gt; +Content-Transfer-Encoding: 8bit<br>
&gt;&gt; +<br>
&gt;&gt; +* Allow setting platform macro settings externally<br>
&gt;&gt; +<br>
&gt;&gt; +By default, rpm installs a series of default platforms based on<b=
r>
&gt;&gt; +the CPU architecture names in subdirectories called<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 /usr/lib/platform/&lt;arch&gt;-&lt;os&gt;<br>
&gt;&gt; +<br>
&gt;&gt; +This is enough for regular Linux distributions. However, some<br>
&gt;&gt; +distributions may use more specific platform names that refer to<=
br>
&gt;&gt; +particular computer systems, like SBCs or specific CPU tuning whe=
n<br>
&gt;&gt; +compiling.<br>
&gt;&gt; +<br>
&gt;&gt; +If the platform subdirectory does not exist in /usr/lib/platform<=
br>
&gt;&gt; +then rpmbuild does not work.<br>
&gt;&gt; +<br>
&gt;&gt; +Allow creating such custom platform subdirectory with feeding<br>
&gt;&gt; +the necessary data using external variables: RPM_CUSTOM_ARCH,<br>
&gt;&gt; +RPM_CUSTOM_ISANAME, RPM_CUSTOM_ISABITS, RPM_CUSTOM_CANONARCH<br>
&gt;&gt; +and RPM_CUSTOM_CANONCOLOR<br>
&gt;&gt; +<br>
&gt;&gt; +Signed-off-by: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi &lt;<a href=
=3D"mailto:zboszor@gmail.com" target=3D"_blank">zboszor@gmail.com</a>&gt;<b=
r>
&gt;&gt; +<br>
&gt;&gt; +---------<br>
&gt;&gt; +<br>
&gt;&gt; +Signed-off-by: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi &lt;<a href=
=3D"mailto:zboszor@gmail.com" target=3D"_blank">zboszor@gmail.com</a>&gt;<b=
r>
&gt;&gt; +Co-authored-by: Florian Festi &lt;<a href=3D"mailto:ffesti@redhat=
.com" target=3D"_blank">ffesti@redhat.com</a>&gt;<br>
&gt; This is missing the Upstream-Status tag.<br>
<br>
&quot;Upstream-Status: Backport&quot; ?<br></blockquote><div><br></div><div=
>Yes as it is already merged on master.</div><div><br></div><div>Upstream-S=
tatus: Backport [<a href=3D"https://github.com/rpm-software-management/rpm/=
commit/fde03ae33d55b160a31a6c54946880dcdf8fd0d6">https://github.com/rpm-sof=
tware-management/rpm/commit/fde03ae33d55b160a31a6c54946880dcdf8fd0d6</a>]<b=
r></div><div><br></div><div>Jose</div><div><br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">
<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#185191): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/185191" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/185191</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/100457649/505=
2612" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/100457649/5052612</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:quaresma.jose@gmail.com" t=
arget=3D"_blank">quaresma.jose@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></div></div></=
div>

--000000000000e8eda00601d8dd05--

