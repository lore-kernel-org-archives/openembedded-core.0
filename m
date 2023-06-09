Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9029BC7EE29
	for <webhook@archiver.kernel.org>; Fri,  9 Jun 2023 15:54:39 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web10.17033.1686326075098273150
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Jun 2023 08:54:35 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=EiaeS1Jj;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.50, mailfrom: steve@sakoman.com)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-51493ec65d8so3399841a12.2
        for <openembedded-core@lists.openembedded.org>; Fri, 09 Jun 2023 08:54:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1686326073; x=1688918073;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IIVB8xPG4ts55sNAYXSmPv3OwHAVi3AGGO8jR8AHtgU=;
        b=EiaeS1JjZT/KZZTUFG5H0XIpIqSJsQg+lhWHEkOEXxGr49ReAcUlH5qRddYsfBRgtx
         5XlBeNrXtaIZCs8WNw+Rs8xIyxluqY6iBPoZIcttwc8O/KO2sUBo2DAZAryYNHHemPkE
         uIK/hrGUbizLQyA0fXtBynQEQpvkTJ6aCrA8JMl0PP6Jyj0Rqu0PaqvEnTt90lnrIgFb
         mWs2nzezRmLJ5Xo1iRJwGq76nIMmSh84KLvo23Y8eY4XPSdWiGrYt13wV8vYTErXCH7O
         6N/9jNqEmzbH4q0Zq8wz/QRS5rGml8JuVi717MH97TQVJUn4mfX4yMeD1o/SvR9yBO+Z
         Dypw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686326073; x=1688918073;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IIVB8xPG4ts55sNAYXSmPv3OwHAVi3AGGO8jR8AHtgU=;
        b=MlmhyB5TpUh4Xy3MPqZrXqyPPol4TtgjnFooiXeQr56NVrhYvjavbJK+P0LUrxgl0m
         oKz0iqJvDkrn/cqVoUd+DtE6KN8W3urSeK7ft7M29zGKhe9bBhGdr9Y2KnmRFfYigktv
         o7BSj/rT7/SiPH0mH9WDt8w3vjinQvQHWhVSF8G0AFi+YjFJDvJvcUx2iU4YFGbBp3lM
         eEXn1fvEEQVfiCFIm0VNDL8I+sxTftytb6n3NVft9LSxeqFLpDWnK2JeYNzqpxNS5t0W
         GJ/6oZScTRdgPjirdfCVBR69syjBuOMlFoebHO+b0sHXBWwSO4nYZmMqWWE0ZNuJSP8s
         Hmfw==
X-Gm-Message-State: AC+VfDwSxXk2ayDDr2Fnaq0ANdeRVajIuvAshndKYMyN2m1NvZUrBmjV
	4cp0cT0IzY53BxHmQf/jr+QQTzUloijjJ8xttTQUmZXjGCjAov9zhOs=
X-Google-Smtp-Source: ACHHUZ4FxwmDY9pwLCLXxkbQ9mVkOvQQktMxCPnBGiUGQAszFe84Ccnh8ZLtNp4CLHbJmqk8zqHB7ogZmf76QdVEDZA=
X-Received: by 2002:a17:907:6ea4:b0:96a:8c13:8dc0 with SMTP id
 sh36-20020a1709076ea400b0096a8c138dc0mr2584617ejc.37.1686326073220; Fri, 09
 Jun 2023 08:54:33 -0700 (PDT)
MIME-Version: 1.0
References: <20230609140908.3465521-1-yogita.urade@windriver.com> <20230609140908.3465521-4-yogita.urade@windriver.com>
In-Reply-To: <20230609140908.3465521-4-yogita.urade@windriver.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Fri, 9 Jun 2023 05:54:22 -1000
Message-ID: <CAOSpxdaLG9VS=boPjQB18WtGO8gP6irY9KHA=wM+4tdXMTqx0A@mail.gmail.com>
Subject: Re: [oe-core][kirkstone][PATCH V2 4/6] webkitgtk: fix CVE-2022-42856
To: Yogita.Urade@windriver.com
Cc: openembedded-core@lists.openembedded.org, hari.gpillai@windriver.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Jun 2023 15:54:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182565

On Fri, Jun 9, 2023 at 4:09=E2=80=AFAM Urade, Yogita via
lists.openembedded.org
<Yogita.Urade=3Dwindriver.com@lists.openembedded.org> wrote:
>
> A type confusion issue was addressed with improved state handling.
> This issue is fixed in Safari 16.2, tvOS 16.2, macOS Ventura 13.1,
> iOS 15.7.2 and iPadOS 15.7.2, iOS 16.1.2. Processing maliciously
> crafted web content may lead to arbitrary code execution. Apple is
> aware of a report that this issue may have been actively exploited
> against versions of iOS released before iOS 15.1.
>
> References:
> https://support.apple.com/en-us/HT213531
>
> Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
> ---
>  .../webkit/webkitgtk/CVE-2022-42856.patch     | 110 ++++++++++++++++++
>  meta/recipes-sato/webkit/webkitgtk_2.36.8.bb  |   1 +
>  2 files changed, 111 insertions(+)
>  create mode 100644 meta/recipes-sato/webkit/webkitgtk/CVE-2022-42856.pat=
ch
>
> diff --git a/meta/recipes-sato/webkit/webkitgtk/CVE-2022-42856.patch b/me=
ta/recipes-sato/webkit/webkitgtk/CVE-2022-42856.patch
> new file mode 100644
> index 0000000000..97d58c955a
> --- /dev/null
> +++ b/meta/recipes-sato/webkit/webkitgtk/CVE-2022-42856.patch
> @@ -0,0 +1,110 @@
> +From 71cdc1c09ef199db74b2b60ed5de781250d96a56 Mon Sep 17 00:00:00 2001
> +From: Mark Lam <mark.lam@apple.com>
> +Date: Wed, 23 Nov 2022 13:48:49 -0800
> +Subject: [PATCH] The provenType filtering in FTL's speculateRealNumber i=
s
> + incorrect. https://bugs.webkit.org/show_bug.cgi?id=3D248266
> + <rdar://problem/102531234>
> +
> +Reviewed by Justin Michaud.
> +
> +speculateRealNumber does a doubleEqual compare, which filters out double=
 values which
> +are not NaN.  NaN values will fall through to the `intCase` block.  In t=
he `intCase` block,
> +the isNotInt32() check there was given a proven type that wrongly filter=
s out ~SpecFullDouble.
> +
> +Consider a scenario where the edge was proven to be { SpecInt32Only, Spe=
cDoubleReal,
> +SpecDoublePureNaN }.  SpecFullDouble is defined as SpecDoubleReal | Spec=
DoubleNaN, and
> +SpecDoubleNaN is defined as SpecDoublePureNaN | SpecDoubleImpureNaN.  He=
nce, the filtering
> +of the proven type with ~SpecFullDouble means that isNotInt32() will eff=
ectively be given
> +a proven type of
> +
> +    { SpecInt32Only, SpecDoubleReal, SpecDoublePureNaN } - { SpecDoubleR=
eal, SpecDoublePureNaN }
> +
> +which yields
> +
> +    { SpecInt32Only }.
> +
> +As a result, the compiler will think that that isNotIn32() check will al=
ways fail.  This
> +is not correct if the actual incoming value for that edge is actually a =
PureNaN.  In this
> +case, speculateRealNumber should have OSR exited, but it doesn't because=
 it thinks that
> +the isNotInt32() check will always fail and elide the check altogether.
> +
> +In this patch, we fix this by replacing the ~SpecFullDouble with ~SpecDo=
ubleReal.  We also
> +rename the `intCase` block to `intOrNaNCase` to document what it actuall=
y handles.
> +
> +* JSTests/stress/speculate-real-number-in-object-is.js: Added.
> +(test.object_is_opt):
> +(test):
> +* Source/JavaScriptCore/ftl/FTLLowerDFGToB3.cpp:
> +(JSC::FTL::DFG::LowerDFGToB3::compileCompareStrictEq):
> +
> +Canonical link: https://commits.webkit.org/252432.839@safari-7614-branch
> +
> +CVE: CVE-2022-42856
> +
> +Upstream-Status: Backport
> +[https://github.com/WebKit/WebKit/commit/71cdc1c09ef199db74b2b60ed5de781=
250d96a56]
> +
> +Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
> +---
> + .../speculate-real-number-in-object-is.js     | 22 +++++++++++++++++++
> + Source/JavaScriptCore/ftl/FTLLowerDFGToB3.cpp |  8 +++----
> + 2 files changed, 26 insertions(+), 4 deletions(-)
> + create mode 100644 JSTests/stress/speculate-real-number-in-object-is.js
> +
> +diff --git a/JSTests/stress/speculate-real-number-in-object-is.js b/JSTe=
sts/stress/speculate-real-number-in-object-is.js
> +new file mode 100644
> +index 000000000000..0b10799954da
> +--- /dev/null
> ++++ b/JSTests/stress/speculate-real-number-in-object-is.js
> +@@ -0,0 +1,22 @@
> ++function test() {
> ++    function object_is_opt(value) {
> ++        const tmp =3D {p0: value};
> ++
> ++        if (Object.is(value, NaN))
> ++            return 0;
> ++
> ++        return value;
> ++    }
> ++
> ++    object_is_opt(NaN);
> ++
> ++    for (let i =3D 0; i < 0x20000; i++)
> ++        object_is_opt(1.1);
> ++
> ++    return isNaN(object_is_opt(NaN));
> ++}
> ++
> ++resultIsNaN =3D test();
> ++if (resultIsNaN)
> ++    throw "FAILED";
> ++
> +diff --git a/Source/JavaScriptCore/ftl/FTLLowerDFGToB3.cpp b/Source/Java=
ScriptCore/ftl/FTLLowerDFGToB3.cpp
> +index 8621b554d578..588298eba350 100644
> +--- a/Source/JavaScriptCore/ftl/FTLLowerDFGToB3.cpp
> ++++ b/Source/JavaScriptCore/ftl/FTLLowerDFGToB3.cpp
> +@@ -20285,18 +20285,18 @@ IGNORE_CLANG_WARNINGS_END
> +         LValue value =3D lowJSValue(edge, ManualOperandSpeculation);
> +         LValue doubleValue =3D unboxDouble(value);
> +
> +-        LBasicBlock intCase =3D m_out.newBlock();
> ++        LBasicBlock intOrNaNCase =3D m_out.newBlock();
> +         LBasicBlock continuation =3D m_out.newBlock();
> +
> +         m_out.branch(
> +             m_out.doubleEqual(doubleValue, doubleValue),
> +-            usually(continuation), rarely(intCase));
> ++            usually(continuation), rarely(intOrNaNCase));
> +
> +-        LBasicBlock lastNext =3D m_out.appendTo(intCase, continuation);
> ++        LBasicBlock lastNext =3D m_out.appendTo(intOrNaNCase, continuat=
ion);
> +
> +         typeCheck(
> +             jsValueValue(value), m_node->child1(), SpecBytecodeRealNumb=
er,
> +-            isNotInt32(value, provenType(m_node->child1()) & ~SpecFullD=
ouble));
> ++            isNotInt32(value, provenType(m_node->child1()) & ~SpecDoubl=
eReal));
> +         m_out.jump(continuation);
> +
> +         m_out.appendTo(continuation, lastNext);
> +--
> +2.35.5
> diff --git a/meta/recipes-sato/webkit/webkitgtk_2.36.8.bb b/meta/recipes-=
sato/webkit/webkitgtk_2.36.8.bb
> index 062f209932..cf1b8b2cc0 100644
> --- a/meta/recipes-sato/webkit/webkitgtk_2.36.8.bb
> +++ b/meta/recipes-sato/webkit/webkitgtk_2.36.8.bb
> @@ -20,6 +20,7 @@ SRC_URI =3D "https://www.webkitgtk.org/releases/${BP}.t=
ar.xz \
>             file://CVE-2022-46691.patch \
>             file://CVE-2022-46699.patch \
>             file://CVE-2022-42867.patch \
> +           file://CVE-2022-42856.patch \

The patch fails to apply at build time:

ERROR: webkitgtk-2.36.8-r0 do_patch: Applying patch
'CVE-2022-42856.patch' on target directory
'/home/steve/builds/poky-contrib-kirkstone/build/tmp/work/core2-64-poky-lin=
ux/webkitgtk/2.36.8-r0/webkitgtk-2.36.8'
CmdError('quilt --quiltrc
/home/steve/builds/poky-contrib-kirkstone/build/tmp/work/core2-64-poky-linu=
x/webkitgtk/2.36.8-r0/recipe-sysroot-native/etc/quiltrc
push', 0, 'stdout: Applying patch CVE-2022-42856.patch
patching file JSTests/stress/speculate-real-number-in-object-is.js
patching file Source/JavaScriptCore/ftl/FTLLowerDFGToB3.cpp
Hunk #1 FAILED at 20285.
1 out of 1 hunk FAILED -- rejects in file
Source/JavaScriptCore/ftl/FTLLowerDFGToB3.cpp
Patch CVE-2022-42856.patch does not apply (enforce with -f)

stderr: ')
ERROR: Logfile of failure stored in:
/home/steve/builds/poky-contrib-kirkstone/build/tmp/work/core2-64-poky-linu=
x/webkitgtk/2.36.8-r0/temp/log.do_patch.313789
ERROR: Task (/home/steve/builds/poky-contrib-kirkstone/meta/recipes-sato/we=
bkit/webkitgtk_2.36.8.bb:do_patch)
failed with exit code '1'

Steve

>             "
>  SRC_URI[sha256sum] =3D "0ad9fb6bf28308fe3889faf184bd179d13ac1b46835d2136=
edbab2c133d00437"
>
> --
> 2.40.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#182554): https://lists.openembedded.org/g/openembedde=
d-core/message/182554
> Mute This Topic: https://lists.openembedded.org/mt/99429024/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

