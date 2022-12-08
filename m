Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CA96C3A5A7
	for <webhook@archiver.kernel.org>; Thu,  8 Dec 2022 07:55:53 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web10.8175.1670486145052628997
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Dec 2022 23:55:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=VqFkulCe;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id k22-20020a05600c1c9600b003d1ee3a6289so416847wms.2
        for <openembedded-core@lists.openembedded.org>; Wed, 07 Dec 2022 23:55:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qIHGLxtmKB10j4zGz+TTuOtXC41XUEztJBGRA+OPLU8=;
        b=VqFkulCe1AEcjR6bHq3U/BxM7yy6gFvr0cKMh4UfNI0+OzCIFgDtOX4+2xiVu+/PnT
         evXpG4FCtNHeQkryz+sL49D6f7fZ/8xmz/cSG6y82Kupeglw1YuX+tfcrsIcDhQzKX/4
         ahf36vRHSJ7nnb9bwa53qUxdFnK9pb83urKGsVWqMwnF90y+emhZ+SRno4ZB7gZ7uDs3
         vrL2ASOyCqapJKba7LHSGjzrTfxgvMtrpajaQuP+HJM2P7gtKjVnWUiEV/pWklMSwUkK
         RIV6NrmRtFOjNxO/gR8/Ml2byxbUopXgkEFrk/20XHZZX8vbFEza0N1KeKdTKiSY6OKY
         Wc2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qIHGLxtmKB10j4zGz+TTuOtXC41XUEztJBGRA+OPLU8=;
        b=zOERag/dCmhVx0Pc/nau6lgnOFPIzZL0LUWKxB6ZacI422rgdb6wfZKwCJt3dYjiSQ
         BiVOUMfAs/fOnqdF/ASlm55hg1MHgTEGqzsKIt3aiLeEsPDg58ebVVZZsHeMmby8397c
         nQIXisMvpbnuoUEXnq9NV9DJ0FpSwum7zrhKS+jjlskDUdO1mGVQYKmFRfEoIS/93FMI
         bHOXbrQQYdtNV5vJKE5Pnqxx28v8ceEPqVY9CHUugOX/HbLYJzNEVWXvAyC9wpqXurUU
         To/9rjm2+IEPgV/RkKKLwT+0WcP3NYxJSfwUF8u7l/z6X1YY2Pg3jr8m5KEPN0OTJaQM
         Fosg==
X-Gm-Message-State: ANoB5pldjgrhOIst3dqsNMWf2aBZ7NA4fR+bRwAiEZ5yZ+kzEHFWZmiv
	d2K14//pwKc6YDcRt7I7zkg5umAR3N/QiJs0fPQ=
X-Google-Smtp-Source: AA0mqf5vS5BR8AafPsr2/MrS32yHW9YcjvRf/NLXytgOqgkHpEtfwKe1rRwBYOGW0TiU57n/7tv45olCRlWcCzqQvzU=
X-Received: by 2002:a1c:7504:0:b0:3cf:6b10:ca8d with SMTP id
 o4-20020a1c7504000000b003cf6b10ca8dmr72536883wmc.44.1670486143395; Wed, 07
 Dec 2022 23:55:43 -0800 (PST)
MIME-Version: 1.0
References: <20221201173942.1218836-1-f_l_k@t-online.de> <CAMKF1srCn0tDWAxxpVCYhTZmow3uwy0tGqLXy2VDX0qBHDx2ZA@mail.gmail.com>
 <NMLEMR.NA7JF86LUFN83@t-online.de> <CAP9ODKopgRpWZNiFHjFtw34dYhRHKH188p2_AAs_=Ptyti-ESA@mail.gmail.com>
 <CA+chaQcCzmqKquXstrcBBQGD8vJ5gDVuUJDNoN7uVNEbpjm+AA@mail.gmail.com> <AM4PR0201MB20975667EA5BA27E0326E3BEE91D9@AM4PR0201MB2097.eurprd02.prod.outlook.com>
In-Reply-To: <AM4PR0201MB20975667EA5BA27E0326E3BEE91D9@AM4PR0201MB2097.eurprd02.prod.outlook.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 8 Dec 2022 08:55:29 +0100
Message-ID: <CA+chaQeJR3NtxnMkhY1DL84ok1EL4me3AX1X1xR38E7w0keVxQ@mail.gmail.com>
Subject: Re: [oe-core][PATCH] mesa: update 22.2.3 -> 22.3.0
To: Samuli Piippo <samuli.piippo@qt.io>
Cc: Otavio Salvador <otavio.salvador@ossystems.com.br>, Markus Volk <f_l_k@t-online.de>, 
	Khem Raj <raj.khem@gmail.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000002dee0705ef4c5d37"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Dec 2022 07:55:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174392

--0000000000002dee0705ef4c5d37
Content-Type: text/plain; charset="UTF-8"

On Thu, Dec 8, 2022 at 8:42 AM Samuli Piippo <samuli.piippo@qt.io> wrote:

> Qt6 should handle this already with
> https://codereview.qt-project.org/c/qt/qtbase/+/371780 in place.
> I tried test build with the mesa upgrade and didn't catch any build errors.
>

I've tried qemux86-64 build with 6.4.1 and 6.5.0 from yesterday's dev
branch and both failed after including this mesa upgrade with:
| In file included from
qtbase/6.4.1-r0/recipe-sysroot/usr/include/EGL/egl.h:20,
|                  from
qtbase/6.4.1-r0/build/include/QtGui/6.4.1/QtGui/private/../../../../../../git/src/gui/opengl/platform/egl/qt_egl_p.h:43,
|                  from
qtbase/6.4.1-r0/build/include/QtGui/6.4.1/QtGui/private/qt_egl_p.h:1,
|                  from
qtbase/6.4.1-r0/git/src/gui/opengl/platform/egl/qeglstreamconvenience_p.h:20,
|                  from
qtbase/6.4.1-r0/git/src/gui/opengl/platform/egl/qeglstreamconvenience.cpp:4:
| qtbase/6.4.1-r0/recipe-sysroot/usr/include/EGL/eglplatform.h:109:10:
fatal error: X11/Xlib.h: No such file or directory
|   109 | #include <X11/Xlib.h>
|       |          ^~~~~~~~~~~~
| compilation terminated.

>

--0000000000002dee0705ef4c5d37
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Thu, Dec 8, 2022 at 8:42 AM Samuli Pii=
ppo &lt;<a href=3D"mailto:samuli.piippo@qt.io">samuli.piippo@qt.io</a>&gt; =
wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex"><div class=3D"msg-6257577558531904790">




<div dir=3D"ltr">
<div><span style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-siz=
e:12pt;color:rgb(0,0,0);background-color:rgb(255,255,255)">Qt6 should handl=
e this already with
<a href=3D"https://codereview.qt-project.org/c/qt/qtbase/+/371780" id=3D"m_=
-2294924994488092156LPlnk780937" target=3D"_blank">
https://codereview.qt-project.org/c/qt/qtbase/+/371780</a> in place.</span>=
</div>
<div><span style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-siz=
e:12pt;color:rgb(0,0,0);background-color:rgb(255,255,255)">I tried test bui=
ld with the mesa upgrade and didn&#39;t catch any build
 errors.</span></div></div></div></blockquote><div><br></div><div>I&#39;ve =
tried qemux86-64 build with 6.4.1 and 6.5.0 from yesterday&#39;s dev branch=
 and both failed after including this mesa upgrade with:</div><div>| In fil=
e included from qtbase/6.4.1-r0/recipe-sysroot/usr/include/EGL/egl.h:20,<br=
>| =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from qtbas=
e/6.4.1-r0/build/include/QtGui/6.4.1/QtGui/private/../../../../../../git/sr=
c/gui/opengl/platform/egl/qt_egl_p.h:43,<br>| =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from qtbase/6.4.1-r0/build/include/QtGui/=
6.4.1/QtGui/private/qt_egl_p.h:1,<br>| =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0from qtbase/6.4.1-r0/git/src/gui/opengl/platform=
/egl/qeglstreamconvenience_p.h:20,<br>| =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0from qtbase/6.4.1-r0/git/src/gui/opengl/platform=
/egl/qeglstreamconvenience.cpp:4:<br>| qtbase/6.4.1-r0/recipe-sysroot/usr/i=
nclude/EGL/eglplatform.h:109:10: fatal error: X11/Xlib.h: No such file or d=
irectory<br>| =C2=A0 109 | #include &lt;X11/Xlib.h&gt;<br>| =C2=A0 =C2=A0 =
=C2=A0 | =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^~~~~~~~~~~~<br>| compilation te=
rminated.<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div c=
lass=3D"msg-6257577558531904790"><div dir=3D"ltr"><div><div dir=3D"ltr"><di=
v>
</div>
</div>
</div>
</div>

</div></blockquote></div></div>

--0000000000002dee0705ef4c5d37--

