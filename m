Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C8A4EB64D9
	for <webhook@archiver.kernel.org>; Mon, 19 Jun 2023 14:02:34 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web11.8279.1687183351319366311
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Jun 2023 07:02:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=08WANpNS;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.46, mailfrom: steve@sakoman.com)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-51a2160a271so4486097a12.1
        for <openembedded-core@lists.openembedded.org>; Mon, 19 Jun 2023 07:02:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1687183349; x=1689775349;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ht4DacDp+chnbdBPIQ2Ys6wK3x9W2Q3C0oZZ5ThLtM4=;
        b=08WANpNSMSis3sSo0Km8zL0HM2/Zd9KUQtnZEJo1EteMIgkZVoHwhHVzvi2fWC8OuF
         SdR7xvtwvAVcmHZ0qmlB4Vx4dSTfjFezqcO02vUoLQ9TkXbs5dvxtLh1tobTZdNTj5YJ
         6/LaPdfQMq0wy6u1lE5Qicgx4XLxlR+l/xbHAtQ61drACeuI/CuZX4NA6GLN+nmj7o4h
         +49hg5VChb8srpV+YxfAZCd+VxfRzyQ3bRDNBZBA0WMECQVcvlXxI09pB1bOx7yidpyh
         HHgXXYeIz+pwuVDvdSvpWXmjYrmh7xtUNCza0EAGZ0QmLxuZ+XsSkSX9GgPpA7AexiO7
         /bWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687183349; x=1689775349;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ht4DacDp+chnbdBPIQ2Ys6wK3x9W2Q3C0oZZ5ThLtM4=;
        b=DYufvHFArLCWDuqP+Fph0e99ukuWnBKRX9w4ifinClf4n8G7y/v3ym4vcjZXNvdync
         YUNY1oTKB9tjV4luz49e3Tas4hqJYRHKT4Bv2p3vBARMiM3avs48Fj2VwPBPpJ9e1+ti
         o6Q7LumNyng8BPPAi8svR3poXEvcz+lgPiH3kPu0qfSnRgedPKIZ7OgDCc6Lq5TOXWx2
         sc+4mfBo+5dpWsytdAL3J5Is+m4H7hWDvQvRKXPWG4hBTFp2PFw+43KEP1haDOT6s8Bd
         1zTqerNMdke3QGbMluIwGD4/OIMENKeHqioIzysI6fknxRbOaLzPdIa6dsyNJ6lrKWfh
         wJPg==
X-Gm-Message-State: AC+VfDxTEVY6jsHxO4ZsMrfVx1mnL+ie2gtecuwFon4CBpJ+qU+0l74n
	/GGDDiqeTsQ7HERNVoqa+9BTv7OZcQkZiagjEp5ZDQ==
X-Google-Smtp-Source: ACHHUZ7aTh9mlyF8XE0gxwl0JPVoXiTclnSb7YZP8GLLb6vYWPWpOqHD2mxUF1eNAhKwWh3mad+PMTdqazg8AuT48Xk=
X-Received: by 2002:aa7:ccc8:0:b0:51a:33ce:dd0d with SMTP id
 y8-20020aa7ccc8000000b0051a33cedd0dmr4655323edt.18.1687183348957; Mon, 19 Jun
 2023 07:02:28 -0700 (PDT)
MIME-Version: 1.0
References: <20230609140908.3465521-1-yogita.urade@windriver.com>
 <20230609140908.3465521-4-yogita.urade@windriver.com> <176708A1B2B246B6.28667@lists.openembedded.org>
In-Reply-To: <176708A1B2B246B6.28667@lists.openembedded.org>
From: Steve Sakoman <steve@sakoman.com>
Date: Mon, 19 Jun 2023 04:02:17 -1000
Message-ID: <CAOSpxdYTt52TNYGn7dAJ80h4pHvEOCBii6FCgjOYDye2Ao0Gxw@mail.gmail.com>
Subject: Re: [oe-core][kirkstone][PATCH V2 4/6] webkitgtk: fix CVE-2022-42856
To: steve@sakoman.com
Cc: Yogita.Urade@windriver.com, openembedded-core@lists.openembedded.org, 
	hari.gpillai@windriver.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Jun 2023 14:02:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183111

On Fri, Jun 9, 2023 at 5:54=E2=80=AFAM Steve Sakoman via
lists.openembedded.org <steve=3Dsakoman.com@lists.openembedded.org>
wrote:
>
> On Fri, Jun 9, 2023 at 4:09=E2=80=AFAM Urade, Yogita via
> lists.openembedded.org
> <Yogita.Urade=3Dwindriver.com@lists.openembedded.org> wrote:
> >
> > A type confusion issue was addressed with improved state handling.
> > This issue is fixed in Safari 16.2, tvOS 16.2, macOS Ventura 13.1,
> > iOS 15.7.2 and iPadOS 15.7.2, iOS 16.1.2. Processing maliciously
> > crafted web content may lead to arbitrary code execution. Apple is
> > aware of a report that this issue may have been actively exploited
> > against versions of iOS released before iOS 15.1.
> >
> > References:
> > https://support.apple.com/en-us/HT213531
> >
> > Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
> > ---
> >  .../webkit/webkitgtk/CVE-2022-42856.patch     | 110 ++++++++++++++++++
> >  meta/recipes-sato/webkit/webkitgtk_2.36.8.bb  |   1 +
> >  2 files changed, 111 insertions(+)
> >  create mode 100644 meta/recipes-sato/webkit/webkitgtk/CVE-2022-42856.p=
atch
> >
> > diff --git a/meta/recipes-sato/webkit/webkitgtk/CVE-2022-42856.patch b/=
meta/recipes-sato/webkit/webkitgtk/CVE-2022-42856.patch
> > new file mode 100644
> > index 0000000000..97d58c955a
> > --- /dev/null
> > +++ b/meta/recipes-sato/webkit/webkitgtk/CVE-2022-42856.patch
> > @@ -0,0 +1,110 @@
> > +From 71cdc1c09ef199db74b2b60ed5de781250d96a56 Mon Sep 17 00:00:00 2001
> > +From: Mark Lam <mark.lam@apple.com>
> > +Date: Wed, 23 Nov 2022 13:48:49 -0800
> > +Subject: [PATCH] The provenType filtering in FTL's speculateRealNumber=
 is
> > + incorrect. https://bugs.webkit.org/show_bug.cgi?id=3D248266
> > + <rdar://problem/102531234>
> > +
> > +Reviewed by Justin Michaud.
> > +
> > +speculateRealNumber does a doubleEqual compare, which filters out doub=
le values which
> > +are not NaN.  NaN values will fall through to the `intCase` block.  In=
 the `intCase` block,
> > +the isNotInt32() check there was given a proven type that wrongly filt=
ers out ~SpecFullDouble.
> > +
> > +Consider a scenario where the edge was proven to be { SpecInt32Only, S=
pecDoubleReal,
> > +SpecDoublePureNaN }.  SpecFullDouble is defined as SpecDoubleReal | Sp=
ecDoubleNaN, and
> > +SpecDoubleNaN is defined as SpecDoublePureNaN | SpecDoubleImpureNaN.  =
Hence, the filtering
> > +of the proven type with ~SpecFullDouble means that isNotInt32() will e=
ffectively be given
> > +a proven type of
> > +
> > +    { SpecInt32Only, SpecDoubleReal, SpecDoublePureNaN } - { SpecDoubl=
eReal, SpecDoublePureNaN }
> > +
> > +which yields
> > +
> > +    { SpecInt32Only }.
> > +
> > +As a result, the compiler will think that that isNotIn32() check will =
always fail.  This
> > +is not correct if the actual incoming value for that edge is actually =
a PureNaN.  In this
> > +case, speculateRealNumber should have OSR exited, but it doesn't becau=
se it thinks that
> > +the isNotInt32() check will always fail and elide the check altogether=
.
> > +
> > +In this patch, we fix this by replacing the ~SpecFullDouble with ~Spec=
DoubleReal.  We also
> > +rename the `intCase` block to `intOrNaNCase` to document what it actua=
lly handles.
> > +
> > +* JSTests/stress/speculate-real-number-in-object-is.js: Added.
> > +(test.object_is_opt):
> > +(test):
> > +* Source/JavaScriptCore/ftl/FTLLowerDFGToB3.cpp:
> > +(JSC::FTL::DFG::LowerDFGToB3::compileCompareStrictEq):
> > +
> > +Canonical link: https://commits.webkit.org/252432.839@safari-7614-bran=
ch
> > +
> > +CVE: CVE-2022-42856
> > +
> > +Upstream-Status: Backport
> > +[https://github.com/WebKit/WebKit/commit/71cdc1c09ef199db74b2b60ed5de7=
81250d96a56]
> > +
> > +Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
> > +---
> > + .../speculate-real-number-in-object-is.js     | 22 ++++++++++++++++++=
+
> > + Source/JavaScriptCore/ftl/FTLLowerDFGToB3.cpp |  8 +++----
> > + 2 files changed, 26 insertions(+), 4 deletions(-)
> > + create mode 100644 JSTests/stress/speculate-real-number-in-object-is.=
js
> > +
> > +diff --git a/JSTests/stress/speculate-real-number-in-object-is.js b/JS=
Tests/stress/speculate-real-number-in-object-is.js
> > +new file mode 100644
> > +index 000000000000..0b10799954da
> > +--- /dev/null
> > ++++ b/JSTests/stress/speculate-real-number-in-object-is.js
> > +@@ -0,0 +1,22 @@
> > ++function test() {
> > ++    function object_is_opt(value) {
> > ++        const tmp =3D {p0: value};
> > ++
> > ++        if (Object.is(value, NaN))
> > ++            return 0;
> > ++
> > ++        return value;
> > ++    }
> > ++
> > ++    object_is_opt(NaN);
> > ++
> > ++    for (let i =3D 0; i < 0x20000; i++)
> > ++        object_is_opt(1.1);
> > ++
> > ++    return isNaN(object_is_opt(NaN));
> > ++}
> > ++
> > ++resultIsNaN =3D test();
> > ++if (resultIsNaN)
> > ++    throw "FAILED";
> > ++
> > +diff --git a/Source/JavaScriptCore/ftl/FTLLowerDFGToB3.cpp b/Source/Ja=
vaScriptCore/ftl/FTLLowerDFGToB3.cpp
> > +index 8621b554d578..588298eba350 100644
> > +--- a/Source/JavaScriptCore/ftl/FTLLowerDFGToB3.cpp
> > ++++ b/Source/JavaScriptCore/ftl/FTLLowerDFGToB3.cpp
> > +@@ -20285,18 +20285,18 @@ IGNORE_CLANG_WARNINGS_END
> > +         LValue value =3D lowJSValue(edge, ManualOperandSpeculation);
> > +         LValue doubleValue =3D unboxDouble(value);
> > +
> > +-        LBasicBlock intCase =3D m_out.newBlock();
> > ++        LBasicBlock intOrNaNCase =3D m_out.newBlock();
> > +         LBasicBlock continuation =3D m_out.newBlock();
> > +
> > +         m_out.branch(
> > +             m_out.doubleEqual(doubleValue, doubleValue),
> > +-            usually(continuation), rarely(intCase));
> > ++            usually(continuation), rarely(intOrNaNCase));
> > +
> > +-        LBasicBlock lastNext =3D m_out.appendTo(intCase, continuation=
);
> > ++        LBasicBlock lastNext =3D m_out.appendTo(intOrNaNCase, continu=
ation);
> > +
> > +         typeCheck(
> > +             jsValueValue(value), m_node->child1(), SpecBytecodeRealNu=
mber,
> > +-            isNotInt32(value, provenType(m_node->child1()) & ~SpecFul=
lDouble));
> > ++            isNotInt32(value, provenType(m_node->child1()) & ~SpecDou=
bleReal));
> > +         m_out.jump(continuation);
> > +
> > +         m_out.appendTo(continuation, lastNext);
> > +--
> > +2.35.5
> > diff --git a/meta/recipes-sato/webkit/webkitgtk_2.36.8.bb b/meta/recipe=
s-sato/webkit/webkitgtk_2.36.8.bb
> > index 062f209932..cf1b8b2cc0 100644
> > --- a/meta/recipes-sato/webkit/webkitgtk_2.36.8.bb
> > +++ b/meta/recipes-sato/webkit/webkitgtk_2.36.8.bb
> > @@ -20,6 +20,7 @@ SRC_URI =3D "https://www.webkitgtk.org/releases/${BP}=
.tar.xz \
> >             file://CVE-2022-46691.patch \
> >             file://CVE-2022-46699.patch \
> >             file://CVE-2022-42867.patch \
> > +           file://CVE-2022-42856.patch \

I wasn't able to take this patch due to the below error.  Please
submit a v2 with this corrected.

Thanks!

Steve

> The patch fails to apply at build time:
>
> ERROR: webkitgtk-2.36.8-r0 do_patch: Applying patch
> 'CVE-2022-42856.patch' on target directory
> '/home/steve/builds/poky-contrib-kirkstone/build/tmp/work/core2-64-poky-l=
inux/webkitgtk/2.36.8-r0/webkitgtk-2.36.8'
> CmdError('quilt --quiltrc
> /home/steve/builds/poky-contrib-kirkstone/build/tmp/work/core2-64-poky-li=
nux/webkitgtk/2.36.8-r0/recipe-sysroot-native/etc/quiltrc
> push', 0, 'stdout: Applying patch CVE-2022-42856.patch
> patching file JSTests/stress/speculate-real-number-in-object-is.js
> patching file Source/JavaScriptCore/ftl/FTLLowerDFGToB3.cpp
> Hunk #1 FAILED at 20285.
> 1 out of 1 hunk FAILED -- rejects in file
> Source/JavaScriptCore/ftl/FTLLowerDFGToB3.cpp
> Patch CVE-2022-42856.patch does not apply (enforce with -f)
>
> stderr: ')
> ERROR: Logfile of failure stored in:
> /home/steve/builds/poky-contrib-kirkstone/build/tmp/work/core2-64-poky-li=
nux/webkitgtk/2.36.8-r0/temp/log.do_patch.313789
> ERROR: Task (/home/steve/builds/poky-contrib-kirkstone/meta/recipes-sato/=
webkit/webkitgtk_2.36.8.bb:do_patch)
> failed with exit code '1'
>
> Steve
>
> >             "
> >  SRC_URI[sha256sum] =3D "0ad9fb6bf28308fe3889faf184bd179d13ac1b46835d21=
36edbab2c133d00437"
> >
> > --
> > 2.40.0
> >
> >
> >
> >
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#182565): https://lists.openembedded.org/g/openembedde=
d-core/message/182565
> Mute This Topic: https://lists.openembedded.org/mt/99429024/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

