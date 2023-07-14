Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E5CAC001B0
	for <webhook@archiver.kernel.org>; Fri, 14 Jul 2023 16:13:45 +0000 (UTC)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
 by mx.groups.io with SMTP id smtpd.web10.2969.1689351217823282238
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Jul 2023 09:13:38 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=Tcepvkuv;
 spf=softfail (domain: sakoman.com, ip: 209.85.219.172, mailfrom: steve@sakoman.com)
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-ca9804dc6e4so2973390276.0
        for <openembedded-core@lists.openembedded.org>; Fri, 14 Jul 2023 09:13:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1689351217; x=1691943217;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qU6EbpIsB3V7FIv8jflUcTLOkIIup0R1yGL5K229S4A=;
        b=TcepvkuvB9AChuIx0rjFPIKc1H/zn49cs2/bbWSwJP/Atzt9JsN243dPMnOwgMCYtN
         ez18516EvrJXuo4sCTZAA9lJJHr95HawyVflH1VxYFe1vTIYPmX7RJivsiQIKcGmtf5g
         UrH+O6DDfJA6V058GUW2O57rszntbkA5d8yaq921bkSbgEx6RuffgKP4CnPVSESeW0ys
         j2hqicJ3ciISozos+nOgyS+u+rI9yMTd4eYwcjiSEUtzqluWkTSPSvBQtJQfPpnc5041
         NihWYN4Iqin92Y358dSVWBgiDMrs2YxMx0F84CH3aaSayX2hR6uSL/MQ1cHJYhY0/2ag
         iDAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689351217; x=1691943217;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qU6EbpIsB3V7FIv8jflUcTLOkIIup0R1yGL5K229S4A=;
        b=QqZKjZm5FCIu3aa42LG51+uCFdbG3EMVMvBxHkjLMT12sNqm2uaMcqQxY7cFftOviF
         NgcX5/gup8KBjBpescs94GO4hVQhyJVoP0JZAW7hHzxHnIWxyd8UCE4wUwX7KXWfh5fr
         RNBUqgWppcM6yU1V2ldPGhBkMyKA0DltSEio42JCTKBiMuzTMWbVGmk4LezOzToM0fgo
         hxNGCLcjVGopbzCjs9/K3Blo85aUD5nM2ta/hLq65yRAK+xsaB9ux17JKf1apGYo8q6/
         ij053PGjTO88imimHkUadWL2k29XvdHknRvZQqRT+/Vti6U+sVcCfVPV/DsdY9lfZQVe
         Lhog==
X-Gm-Message-State: ABy/qLY6EqoXuNjukbMwcjbqXHlnbN/pT5XC0DjQLbda/WQKSalSF2EN
	9cqTs8y6+KakR9eNt58zjRmVqMrq3DwDAQb4TiJjKQ==
X-Google-Smtp-Source: APBJJlG8sHZhZVEeRnzYVMLRY9xBhoqXYoHuOGUCprZ7ifQS5yQijUiwILJ6JKACFteBt83EosHj+TmJNSrn8XLzwdc=
X-Received: by 2002:a25:ba85:0:b0:c6e:a92c:70e3 with SMTP id
 s5-20020a25ba85000000b00c6ea92c70e3mr2875921ybg.31.1689351216943; Fri, 14 Jul
 2023 09:13:36 -0700 (PDT)
MIME-Version: 1.0
References: <20230714150551.3431226-1-kai.kang@windriver.com>
In-Reply-To: <20230714150551.3431226-1-kai.kang@windriver.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Fri, 14 Jul 2023 06:13:25 -1000
Message-ID: <CAOSpxdbV17_3xhjNenniRfibF6r6Crx_+R8=+bebDeXNPcBKyQ@mail.gmail.com>
Subject: Re: [OE-core] [mickledore][PATCH] libx11: fix CVE-2023-3138
To: Kai Kang <kai.kang@eng.windriver.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Jul 2023 16:13:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184272

This is being handled with a stable branch version bump which is in
the current test queue: "libx11: upgrade 1.8.5 -> 1.8.6"

Steve

On Fri, Jul 14, 2023 at 5:05=E2=80=AFAM Kai Kang <kai.kang@eng.windriver.co=
m> wrote:
>
> From: Kai Kang <kai.kang@windriver.com>
>
> CVE: CVE-2023-3138
>
> Backport patch to fix CVE-2023-3138 for libx11.
>
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>  .../xorg-lib/libx11/CVE-2023-3138.patch       | 113 ++++++++++++++++++
>  .../recipes-graphics/xorg-lib/libx11_1.8.5.bb |   4 +-
>  2 files changed, 116 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-graphics/xorg-lib/libx11/CVE-2023-3138.p=
atch
>
> diff --git a/meta/recipes-graphics/xorg-lib/libx11/CVE-2023-3138.patch b/=
meta/recipes-graphics/xorg-lib/libx11/CVE-2023-3138.patch
> new file mode 100644
> index 0000000000..0d9397dd95
> --- /dev/null
> +++ b/meta/recipes-graphics/xorg-lib/libx11/CVE-2023-3138.patch
> @@ -0,0 +1,113 @@
> +From 304a654a0d57bf0f00d8998185f0360332cfa36c Mon Sep 17 00:00:00 2001
> +From: Alan Coopersmith <alan.coopersmith@oracle.com>
> +Date: Sat, 10 Jun 2023 16:30:07 -0700
> +Subject: [PATCH] InitExt.c: Add bounds checks for extension request, eve=
nt, &
> + error codes
> +
> +Fixes CVE-2023-3138: X servers could return values from XQueryExtension
> +that would cause Xlib to write entries out-of-bounds of the arrays to
> +store them, though this would only overwrite other parts of the Display
> +struct, not outside the bounds allocated for that structure.
> +
> +Reported-by: Gregory James DUCK <gjduck@gmail.com>
> +Signed-off-by: Alan Coopersmith <alan.coopersmith@oracle.com>
> +
> +CVE: CVE-2023-3138
> +Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/lib/libx1=
1/-/commit/304a654]
> +
> +Signed-off-by: Kai Kang <kai.kang@windriver.com>
> +---
> + src/InitExt.c | 42 ++++++++++++++++++++++++++++++++++++++++++
> + 1 file changed, 42 insertions(+)
> +
> +diff --git a/src/InitExt.c b/src/InitExt.c
> +index 4de46f15..afc00a6b 100644
> +--- a/src/InitExt.c
> ++++ b/src/InitExt.c
> +@@ -33,6 +33,18 @@ from The Open Group.
> + #include <X11/Xos.h>
> + #include <stdio.h>
> +
> ++/* The X11 protocol spec reserves events 64 through 127 for extensions =
*/
> ++#ifndef LastExtensionEvent
> ++#define LastExtensionEvent 127
> ++#endif
> ++
> ++/* The X11 protocol spec reserves requests 128 through 255 for extensio=
ns */
> ++#ifndef LastExtensionRequest
> ++#define FirstExtensionRequest 128
> ++#define LastExtensionRequest 255
> ++#endif
> ++
> ++
> + /*
> +  * This routine is used to link a extension in so it will be called
> +  * at appropriate times.
> +@@ -242,6 +254,12 @@ WireToEventType XESetWireToEvent(
> +       WireToEventType proc)   /* routine to call when converting event =
*/
> + {
> +       register WireToEventType oldproc;
> ++      if (event_number < 0 ||
> ++          event_number > LastExtensionEvent) {
> ++          fprintf(stderr, "Xlib: ignoring invalid extension event %d\n"=
,
> ++                  event_number);
> ++          return (WireToEventType)_XUnknownWireEvent;
> ++      }
> +       if (proc =3D=3D NULL) proc =3D (WireToEventType)_XUnknownWireEven=
t;
> +       LockDisplay (dpy);
> +       oldproc =3D dpy->event_vec[event_number];
> +@@ -263,6 +281,12 @@ WireToEventCookieType XESetWireToEventCookie(
> +     )
> + {
> +       WireToEventCookieType oldproc;
> ++      if (extension < FirstExtensionRequest ||
> ++          extension > LastExtensionRequest) {
> ++          fprintf(stderr, "Xlib: ignoring invalid extension opcode %d\n=
",
> ++                  extension);
> ++          return (WireToEventCookieType)_XUnknownWireEventCookie;
> ++      }
> +       if (proc =3D=3D NULL) proc =3D (WireToEventCookieType)_XUnknownWi=
reEventCookie;
> +       LockDisplay (dpy);
> +       oldproc =3D dpy->generic_event_vec[extension & 0x7F];
> +@@ -284,6 +308,12 @@ CopyEventCookieType XESetCopyEventCookie(
> +     )
> + {
> +       CopyEventCookieType oldproc;
> ++      if (extension < FirstExtensionRequest ||
> ++          extension > LastExtensionRequest) {
> ++          fprintf(stderr, "Xlib: ignoring invalid extension opcode %d\n=
",
> ++                  extension);
> ++          return (CopyEventCookieType)_XUnknownCopyEventCookie;
> ++      }
> +       if (proc =3D=3D NULL) proc =3D (CopyEventCookieType)_XUnknownCopy=
EventCookie;
> +       LockDisplay (dpy);
> +       oldproc =3D dpy->generic_event_copy_vec[extension & 0x7F];
> +@@ -305,6 +335,12 @@ EventToWireType XESetEventToWire(
> +       EventToWireType proc)   /* routine to call when converting event =
*/
> + {
> +       register EventToWireType oldproc;
> ++      if (event_number < 0 ||
> ++          event_number > LastExtensionEvent) {
> ++          fprintf(stderr, "Xlib: ignoring invalid extension event %d\n"=
,
> ++                  event_number);
> ++          return (EventToWireType)_XUnknownNativeEvent;
> ++      }
> +       if (proc =3D=3D NULL) proc =3D (EventToWireType) _XUnknownNativeE=
vent;
> +       LockDisplay (dpy);
> +       oldproc =3D dpy->wire_vec[event_number];
> +@@ -325,6 +361,12 @@ WireToErrorType XESetWireToError(
> +       WireToErrorType proc)   /* routine to call when converting error =
*/
> + {
> +       register WireToErrorType oldproc =3D NULL;
> ++      if (error_number < 0 ||
> ++          error_number > LastExtensionError) {
> ++         fprintf(stderr, "Xlib: ignoring invalid extension error %d\n",
> ++                  error_number);
> ++         return (WireToErrorType)_XDefaultWireError;
> ++      }
> +       if (proc =3D=3D NULL) proc =3D (WireToErrorType)_XDefaultWireErro=
r;
> +       LockDisplay (dpy);
> +       if (!dpy->error_vec) {
> +--
> +GitLab
> +
> diff --git a/meta/recipes-graphics/xorg-lib/libx11_1.8.5.bb b/meta/recipe=
s-graphics/xorg-lib/libx11_1.8.5.bb
> index cf2e29471a..028a757d39 100644
> --- a/meta/recipes-graphics/xorg-lib/libx11_1.8.5.bb
> +++ b/meta/recipes-graphics/xorg-lib/libx11_1.8.5.bb
> @@ -22,7 +22,9 @@ PE =3D "1"
>
>  XORG_PN =3D "libX11"
>
> -SRC_URI +=3D "file://disable_tests.patch"
> +SRC_URI +=3D "file://disable_tests.patch \
> +            file://CVE-2023-3138.patch \
> +            "
>
>  SRC_URI[sha256sum] =3D "e362c6f03c793171becd1ce2078c64789504c7d7ff48ee40=
a76ff76b59f6b561"
>
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#184270): https://lists.openembedded.org/g/openembedde=
d-core/message/184270
> Mute This Topic: https://lists.openembedded.org/mt/100142997/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

