Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 476B2EB64D9
	for <webhook@archiver.kernel.org>; Mon, 19 Jun 2023 14:04:14 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web10.8428.1687183448718380492
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Jun 2023 07:04:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=VSdacpZm;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.43, mailfrom: steve@sakoman.com)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5187aa18410so3591620a12.0
        for <openembedded-core@lists.openembedded.org>; Mon, 19 Jun 2023 07:04:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1687183447; x=1689775447;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7ZZw3lxfSea2YB/EFhJ3vfjer4RpjS83RL8HM5g+fGQ=;
        b=VSdacpZmBjhmaW1vtV2JpuDTV2KGZVZTk7otcu3wGf/qHGqVOeOgJm3L5nxiG//VIZ
         wG6C/l+a5IHnyeQ1Jp+JR4zKuk/z/bjWzDJu8Nr92plQmwKnxWXK/JU8jA39u503c4jz
         7WJSsLWMCxHFQ9MBtm5FgpffGhNKtlysUBVx4SGvuCjXe7bMnj/ogyHCzOHZJ/LX7Eho
         ApkblpcgBWyDSDK4YKneQ/EcUyhYDNzPN7aNdq/WxyQfhTJTUfxLUi/cso+yhpHJR30a
         zSRA77aeRPawD/XVuDG5MIQB8RQARZQlUPHv9JvhUINvroby5aM9R8Grcor1zt4ax3ur
         Mi4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687183447; x=1689775447;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7ZZw3lxfSea2YB/EFhJ3vfjer4RpjS83RL8HM5g+fGQ=;
        b=W59V7MgKEzGQ2GeztHyF452JL9HClDy+SAAQH8mWrYlJjGARpCSUCXtGiL6izvdK9B
         +G4NM83zzBK/QMy7D7SIvARz8mL5SCGmtjJtN1OLI5/5xlDSLwDlfUs+Y21WfuJBIchI
         uguJAHifEJVsd5CF18BzAFYkZHQTxHa92oLRMjMzfetQqCpgDs48W3Se9NuGPdTalvFQ
         wkk6tQJ8wisYNtP7UPYxKP/K40SnKHLc3BHkWl7+lTTMpg/Bi8eB6ycRc4PhdB6KudLV
         6Y73gk7VyiwOR/TeZGNYok7uK/KlQ3xJnCSq/OiZKrwh2X9G81N8Ono4Pn0XwdfYaWkL
         naFA==
X-Gm-Message-State: AC+VfDwSlorZ9ESVnlujUVUHSwb2dmWiQbzL2vRwjCPKx1F0Q07bXZ/U
	TFNpgZxOVwpL7jBGG/I2b6z97s4zVVyAUcza5vAOe/HDkPkW5drf
X-Google-Smtp-Source: ACHHUZ4AIuqty1WSRAggRGiPBLIqUTIz4/Mi4OUH3wKTTd+K+KPXwwutfU8bflLkJNJ4NW96TDaSLzJiyr7+rMSB1VY=
X-Received: by 2002:aa7:c74c:0:b0:51a:41cc:2578 with SMTP id
 c12-20020aa7c74c000000b0051a41cc2578mr4705744eds.21.1687183446939; Mon, 19
 Jun 2023 07:04:06 -0700 (PDT)
MIME-Version: 1.0
References: <20230609140908.3465521-1-yogita.urade@windriver.com> <20230609140908.3465521-5-yogita.urade@windriver.com>
In-Reply-To: <20230609140908.3465521-5-yogita.urade@windriver.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Mon, 19 Jun 2023 04:03:55 -1000
Message-ID: <CAOSpxdatayHuoCS-qJVo=B43gYs9afYAa2mtkpOnuW5i9TY5Vw@mail.gmail.com>
Subject: Re: [oe-core][kirkstone][PATCH V2 5/6] webkitgtk: fix CVE-2023-23517 CVE-2023-23518
To: Yogita.Urade@windriver.com
Cc: openembedded-core@lists.openembedded.org, hari.gpillai@windriver.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Jun 2023 14:04:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183113

I wasn't able to take this patch because it too failed during do_patch
at build time.  Please submit a v2 with this corrected.

I was able to take the other patches in this series though, so you
only need to submit v2 for the two that I wasn't able to take.

Steve

On Fri, Jun 9, 2023 at 4:09=E2=80=AFAM Urade, Yogita via
lists.openembedded.org
<Yogita.Urade=3Dwindriver.com@lists.openembedded.org> wrote:
>
> The issue was addressed with improved memory handling.
> This issue is fixed in macOS Ventura 13.2, macOS Monterey
> 12.6.3, tvOS 16.3, Safari 16.3, watchOS 9.3, iOS 16.3 and
> iPadOS 16.3, macOS Big Sur 11.7.3. Processing maliciously
> crafted web content may lead to arbitrary code execution.
>
> References:
> https://nvd.nist.gov/vuln/detail/CVE-2023-23517
> https://support.apple.com/en-us/HT213638
> https://bugs.webkit.org/show_bug.cgi?id=3D248268
> https://github.com/WebKit/WebKit/pull/6756
>
> Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
> ---
>  .../CVE-2023-23517-CVE-2023-23518.patch       | 131 ++++++++++++++++++
>  meta/recipes-sato/webkit/webkitgtk_2.36.8.bb  |   1 +
>  2 files changed, 132 insertions(+)
>  create mode 100644 meta/recipes-sato/webkit/webkitgtk/CVE-2023-23517-CVE=
-2023-23518.patch
>
> diff --git a/meta/recipes-sato/webkit/webkitgtk/CVE-2023-23517-CVE-2023-2=
3518.patch b/meta/recipes-sato/webkit/webkitgtk/CVE-2023-23517-CVE-2023-235=
18.patch
> new file mode 100644
> index 0000000000..721f045e0d
> --- /dev/null
> +++ b/meta/recipes-sato/webkit/webkitgtk/CVE-2023-23517-CVE-2023-23518.pa=
tch
> @@ -0,0 +1,131 @@
> +From f44648f07471b6c34f61993baa8997f7519a18a1 Mon Sep 17 00:00:00 2001
> +From: Youenn Fablet <youennf@gmail.com>
> +Date: Mon, 28 Nov 2022 00:43:35 -0800
> +Subject: [PATCH] Type getter is not needed for internal ReadableStream s=
ources
> + https://bugs.webkit.org/show_bug.cgi?id=3D248268 rdar://102338913
> +
> +Reviewed by Eric Carlson.
> +
> +Make ReadableStreamSource method privates.
> +In ReadableStream, use @getters instead of private getters to allow gett=
ing private values from prototype.
> +Covered by added test.
> +
> +* LayoutTests/http/wpt/fetch/fetch-stream-source-expected.txt: Added.
> +* LayoutTests/http/wpt/fetch/fetch-stream-source.html: Added.
> +* Source/WebCore/Modules/streams/ReadableStream.js:
> +(initializeReadableStream):
> +* Source/WebCore/Modules/streams/ReadableStreamSource.idl:
> +* Source/WebCore/bindings/js/JSDOMOperationReturningPromise.h:
> +(WebCore::IDLOperationReturningPromise::call):
> +
> +Canonical link: https://commits.webkit.org/257063@main
> +
> +CVE: CVE-2023-23517 CVE-2023-23518
> +
> +Upstream-Status: Backport
> +[https://github.com/WebKit/WebKit/commit/f44648f07471b6c34f61993baa8997f=
7519a18a1]
> +
> +Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
> +---
> + .../fetch/fetch-stream-source-expected.txt    |  3 +++
> + .../http/wpt/fetch/fetch-stream-source.html   | 24 +++++++++++++++++++
> + .../WebCore/Modules/streams/ReadableStream.js |  4 ++--
> + .../Modules/streams/ReadableStreamSource.idl  |  8 +++----
> + .../js/JSDOMOperationReturningPromise.h       |  4 +++-
> + 5 files changed, 36 insertions(+), 7 deletions(-)
> + create mode 100644 LayoutTests/http/wpt/fetch/fetch-stream-source-expec=
ted.txt
> + create mode 100644 LayoutTests/http/wpt/fetch/fetch-stream-source.html
> +
> +diff --git a/LayoutTests/http/wpt/fetch/fetch-stream-source-expected.txt=
 b/LayoutTests/http/wpt/fetch/fetch-stream-source-expected.txt
> +new file mode 100644
> +index 000000000000..856ea8180ca2
> +--- /dev/null
> ++++ b/LayoutTests/http/wpt/fetch/fetch-stream-source-expected.txt
> +@@ -0,0 +1,3 @@
> ++
> ++PASS Only JS streams should check type
> ++
> +diff --git a/LayoutTests/http/wpt/fetch/fetch-stream-source.html b/Layou=
tTests/http/wpt/fetch/fetch-stream-source.html
> +new file mode 100644
> +index 000000000000..fbebfa5e524f
> +--- /dev/null
> ++++ b/LayoutTests/http/wpt/fetch/fetch-stream-source.html
> +@@ -0,0 +1,24 @@
> ++<!doctype html>
> ++<html>
> ++  <head>
> ++    <meta charset=3D"utf-8">
> ++    <title>Fetch and source</title>
> ++    <script src=3D"/resources/testharness.js"></script>
> ++    <script src=3D"/resources/testharnessreport.js"></script>
> ++  </head>
> ++  <body>
> ++    <script>
> ++promise_test(async () =3D> {
> ++    let counter =3D 0;
> ++    Object.prototype.__defineGetter__("type", function() {
> ++        counter++;
> ++    });
> ++
> ++    const response =3D await fetch('/');
> ++    const fetchReadableStream =3D response.body;
> ++    const [r1, r2] =3D fetchReadableStream.tee();
> ++    assert_equals(counter, 0);
> ++}, "Only JS streams should check type");
> ++    </script>
> ++  </body>
> ++</html>
> +diff --git a/Source/WebCore/Modules/streams/ReadableStream.js b/Source/W=
ebCore/Modules/streams/ReadableStream.js
> +index ddef56ecd460..7f0def325d84 100644
> +--- a/Source/WebCore/Modules/streams/ReadableStream.js
> ++++ b/Source/WebCore/Modules/streams/ReadableStream.js
> +@@ -48,10 +48,10 @@ function initializeReadableStream(underlyingSource, =
strategy)
> +
> +     // FIXME: We should introduce https://streams.spec.whatwg.org/#crea=
te-readable-stream.
> +     // For now, we emulate this with underlyingSource with private prop=
erties.
> +-    if (@getByIdDirectPrivate(underlyingSource, "pull") !=3D=3D @undefi=
ned) {
> ++    if (underlyingSource.@pull !=3D=3D @undefined) {
> +         const size =3D @getByIdDirectPrivate(strategy, "size");
> +         const highWaterMark =3D @getByIdDirectPrivate(strategy, "highWa=
terMark");
> +-        @setupReadableStreamDefaultController(this, underlyingSource, s=
ize, highWaterMark !=3D=3D @undefined ? highWaterMark : 1, @getByIdDirectPr=
ivate(underlyingSource, "start"), @getByIdDirectPrivate(underlyingSource, "=
pull"), @getByIdDirectPrivate(underlyingSource, "cancel"));
> ++        @setupReadableStreamDefaultController(this, underlyingSource, s=
ize, highWaterMark !=3D=3D @undefined ? highWaterMark : 1, underlyingSource=
.@start, underlyingSource.@pull, underlyingSource.@cancel);
> +         return this;
> +     }
> +
> +diff --git a/Source/WebCore/Modules/streams/ReadableStreamSource.idl b/S=
ource/WebCore/Modules/streams/ReadableStreamSource.idl
> +index cce9ea37ce80..ae7f1403b8ac 100644
> +--- a/Source/WebCore/Modules/streams/ReadableStreamSource.idl
> ++++ b/Source/WebCore/Modules/streams/ReadableStreamSource.idl
> +@@ -30,10 +30,10 @@
> +     LegacyNoInterfaceObject,
> +     SkipVTableValidation
> + ] interface ReadableStreamSource {
> +-    [Custom] Promise<undefined> start(ReadableStreamDefaultController c=
ontroller);
> +-    [Custom] Promise<undefined> pull(ReadableStreamDefaultController co=
ntroller);
> +-    undefined cancel(any reason);
> ++    [Custom, PrivateIdentifier] Promise<undefined> start(ReadableStream=
DefaultController controller);
> ++    [Custom, PrivateIdentifier] Promise<undefined> pull(ReadableStreamD=
efaultController controller);
> ++    [PrivateIdentifier] undefined cancel(any reason);
> +
> +     // Place holder to keep the controller linked to the source.
> +-    [CachedAttribute, CustomGetter] readonly attribute any controller;
> ++    [CachedAttribute, CustomGetter, PrivateIdentifier] readonly attribu=
te any controller;
> + };
> +diff --git a/Source/WebCore/bindings/js/JSDOMOperationReturningPromise.h=
 b/Source/WebCore/bindings/js/JSDOMOperationReturningPromise.h
> +index c4d1513ad5c4..1dda9d3834f7 100644
> +--- a/Source/WebCore/bindings/js/JSDOMOperationReturningPromise.h
> ++++ b/Source/WebCore/bindings/js/JSDOMOperationReturningPromise.h
> +@@ -43,8 +43,10 @@ public:
> +             if constexpr (shouldThrow !=3D CastedThisErrorBehavior::Ass=
ert) {
> +                 if (UNLIKELY(!thisObject))
> +                     return rejectPromiseWithThisTypeError(promise.get()=
, JSClass::info()->className, operationName);
> +-            } else
> ++            } else {
> ++                UNUSED_PARAM(operationName);
> +                 ASSERT(thisObject);
> ++            }
> +
> +             ASSERT_GC_OBJECT_INHERITS(thisObject, JSClass::info());
> +
> +--
> +2.40.0
> diff --git a/meta/recipes-sato/webkit/webkitgtk_2.36.8.bb b/meta/recipes-=
sato/webkit/webkitgtk_2.36.8.bb
> index cf1b8b2cc0..69663c1cb7 100644
> --- a/meta/recipes-sato/webkit/webkitgtk_2.36.8.bb
> +++ b/meta/recipes-sato/webkit/webkitgtk_2.36.8.bb
> @@ -21,6 +21,7 @@ SRC_URI =3D "https://www.webkitgtk.org/releases/${BP}.t=
ar.xz \
>             file://CVE-2022-46699.patch \
>             file://CVE-2022-42867.patch \
>             file://CVE-2022-42856.patch \
> +           file://CVE-2023-23517-CVE-2023-23518.patch \
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
> View/Reply Online (#182555): https://lists.openembedded.org/g/openembedde=
d-core/message/182555
> Mute This Topic: https://lists.openembedded.org/mt/99429027/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

