Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19E53C3DA78
	for <webhook@archiver.kernel.org>; Tue, 17 Jan 2023 11:01:34 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web11.193548.1673953285763461119
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Jan 2023 03:01:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=cJQa9AmJ;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id e3so20941013wru.13
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Jan 2023 03:01:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5J2I2sCtQFRSUdmmEJY7OwztuB0W8hLf9zi3m7NDX2k=;
        b=cJQa9AmJXJz8fpbf6L1lzMOGNr1v3P+qLNK16u4V1CcG/pkvAO+gFGBoxx+rXMC6Qf
         Rl0bxWUX3Zg12oyAuScihOM5JEt2LNcOe6p44XxdsSoHhsvMd6nOM0EP2qn1tKQbBL6s
         bF5Sb2dQBzU8I6iK9hCgntt88LEhDkhFWlnlqboBqd4HoyfbYcWZ9sjLVFpz+k0z8Qhq
         g7U/4WbhU21fzzI7Be3p9XyVS415GECtC95eweNtkNuCpuLmLGI6jmqiQvefVFVAHhxP
         BiqrlcDb1XX/c8DmunwAkYytDJ3421eoU+YEllwH1vCWvUSE/nwNwlWw51ERPgmdwsHF
         hs1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5J2I2sCtQFRSUdmmEJY7OwztuB0W8hLf9zi3m7NDX2k=;
        b=uKLEG7pQ9ABb39bzgrPd84uhIYNYRzQmZbeLn29P4s8GjWVdxMGdzTLHlkcA3wcvJw
         mD58nSWWNUESKSQmcKMURpnyn15IP2aDagb55Ak/0OChi9avoWkFx/xICZoctxRkHNHv
         qOJv1bz2F0t6FAU9GUhNQtBbFYxGLIPAF9KyRKwtCRLrSRXkCAdw3LSsy2uLsVZXIMhy
         uEDaFHjt+aL4NdmC43+hi0C9t76tH69NYo3MTzM6DeDBaX1i1zxHHV+SZ58xCs5/V1lV
         QLJrd4vk9+vRa/IEJ9T/r+BtMncOFNbW2qQm5Tj4bVPKBGzm8i2x8HoQsbnKWn6dka5Z
         wahg==
X-Gm-Message-State: AFqh2kp5AwFUgex5eg7X4HkE3LsQZhEj3A7OZxN+xoZ3t/SLZSpzVH22
	Gt/rDvuzXnVecBq7FiNQxV4v5G7B21/FxlfKyRc=
X-Google-Smtp-Source: AMrXdXu/mbFAWYdZ+b3wFeU29q7v2CYKNgV8ocGrxB2wxeY36UNW7zVJ3wjUVTsGLFd9sqDADBXx0xFY9iTlpVLALOk=
X-Received: by 2002:adf:efc9:0:b0:2bd:dac9:f25b with SMTP id
 i9-20020adfefc9000000b002bddac9f25bmr76483wrp.129.1673953283925; Tue, 17 Jan
 2023 03:01:23 -0800 (PST)
MIME-Version: 1.0
References: <20221201173942.1218836-1-f_l_k@t-online.de> <CAMKF1srCn0tDWAxxpVCYhTZmow3uwy0tGqLXy2VDX0qBHDx2ZA@mail.gmail.com>
 <NMLEMR.NA7JF86LUFN83@t-online.de> <CAP9ODKopgRpWZNiFHjFtw34dYhRHKH188p2_AAs_=Ptyti-ESA@mail.gmail.com>
 <CA+chaQcCzmqKquXstrcBBQGD8vJ5gDVuUJDNoN7uVNEbpjm+AA@mail.gmail.com>
 <AM4PR0201MB20975667EA5BA27E0326E3BEE91D9@AM4PR0201MB2097.eurprd02.prod.outlook.com>
 <172EC24C7596EDC7.3782@lists.openembedded.org>
In-Reply-To: <172EC24C7596EDC7.3782@lists.openembedded.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 17 Jan 2023 12:01:12 +0100
Message-ID: <CA+chaQeOeCGm=ZPV7JzNNOQTbkKFfZWU8dbU0JQu6CLY_wboDQ@mail.gmail.com>
Subject: Re: [oe-core][PATCH] mesa: update 22.2.3 -> 22.3.0
To: Martin.Jansa@gmail.com
Cc: Samuli Piippo <samuli.piippo@qt.io>, Otavio Salvador <otavio.salvador@ossystems.com.br>, 
	Markus Volk <f_l_k@t-online.de>, Khem Raj <raj.khem@gmail.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000dbeb7105f2739e85"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Jan 2023 11:01:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176031

--000000000000dbeb7105f2739e85
Content-Type: text/plain; charset="UTF-8"

Samuli:

Similar mesa upgrade was merged recently:
https://git.openembedded.org/openembedded-core/commit/?id=3bf4341ef6a681574a1c6f393bf241f412e26eac

qtbase still fails the same, more details in:
https://github.com/shr-project/meta-webosose/commit/c96010fe4df28397a33e447bde650932a3463a9e

The change you've mentioned is the one which actually breaks some
PACKAGECONFIG combinations, hopefully now you'll be able to reproduce it.

Regards,

On Thu, Dec 8, 2022 at 8:55 AM Martin Jansa via lists.openembedded.org
<Martin.Jansa=gmail.com@lists.openembedded.org> wrote:

> On Thu, Dec 8, 2022 at 8:42 AM Samuli Piippo <samuli.piippo@qt.io> wrote:
>
>> Qt6 should handle this already with
>> https://codereview.qt-project.org/c/qt/qtbase/+/371780 in place.
>> I tried test build with the mesa upgrade and didn't catch any build
>> errors.
>>
>
> I've tried qemux86-64 build with 6.4.1 and 6.5.0 from yesterday's dev
> branch and both failed after including this mesa upgrade with:
> | In file included from
> qtbase/6.4.1-r0/recipe-sysroot/usr/include/EGL/egl.h:20,
> |                  from
> qtbase/6.4.1-r0/build/include/QtGui/6.4.1/QtGui/private/../../../../../../git/src/gui/opengl/platform/egl/qt_egl_p.h:43,
> |                  from
> qtbase/6.4.1-r0/build/include/QtGui/6.4.1/QtGui/private/qt_egl_p.h:1,
> |                  from
> qtbase/6.4.1-r0/git/src/gui/opengl/platform/egl/qeglstreamconvenience_p.h:20,
> |                  from
> qtbase/6.4.1-r0/git/src/gui/opengl/platform/egl/qeglstreamconvenience.cpp:4:
> | qtbase/6.4.1-r0/recipe-sysroot/usr/include/EGL/eglplatform.h:109:10:
> fatal error: X11/Xlib.h: No such file or directory
> |   109 | #include <X11/Xlib.h>
> |       |          ^~~~~~~~~~~~
> | compilation terminated.
>
>>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#174392):
> https://lists.openembedded.org/g/openembedded-core/message/174392
> Mute This Topic: https://lists.openembedded.org/mt/95388063/3617156
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> Martin.Jansa@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000dbeb7105f2739e85
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Samuli:<div><br></div><div>Similar mesa upgrade was merged=
 recently:</div><div><a href=3D"https://git.openembedded.org/openembedded-c=
ore/commit/?id=3D3bf4341ef6a681574a1c6f393bf241f412e26eac">https://git.open=
embedded.org/openembedded-core/commit/?id=3D3bf4341ef6a681574a1c6f393bf241f=
412e26eac</a><br></div><div><br></div><div>qtbase still fails the same, mor=
e details in:</div><div><a href=3D"https://github.com/shr-project/meta-webo=
sose/commit/c96010fe4df28397a33e447bde650932a3463a9e">https://github.com/sh=
r-project/meta-webosose/commit/c96010fe4df28397a33e447bde650932a3463a9e</a>=
<br></div><div><br></div><div>The change you&#39;ve mentioned is the one wh=
ich actually breaks some PACKAGECONFIG combinations, hopefully now you&#39;=
ll be able to reproduce it.</div><div><br></div><div>Regards,</div></div><b=
r><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, =
Dec 8, 2022 at 8:55 AM Martin Jansa via <a href=3D"http://lists.openembedde=
d.org">lists.openembedded.org</a> &lt;Martin.Jansa=3D<a href=3D"mailto:gmai=
l.com@lists.openembedded.org">gmail.com@lists.openembedded.org</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"l=
tr"><div dir=3D"ltr">On Thu, Dec 8, 2022 at 8:42 AM Samuli Piippo &lt;<a hr=
ef=3D"mailto:samuli.piippo@qt.io" target=3D"_blank">samuli.piippo@qt.io</a>=
&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex"><div>




<div dir=3D"ltr">
<div><span style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-siz=
e:12pt;color:rgb(0,0,0);background-color:rgb(255,255,255)">Qt6 should handl=
e this already with
<a href=3D"https://codereview.qt-project.org/c/qt/qtbase/+/371780" id=3D"m_=
-2196537923583286084m_-2294924994488092156LPlnk780937" target=3D"_blank">
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
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div><=
div dir=3D"ltr"><div><div dir=3D"ltr"><div>
</div>
</div>
</div>
</div>

</div></blockquote></div></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#174392): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/174392" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/174392</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/95388063/3617=
156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/95388063/3617156</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:Martin.Jansa@gmail.com" ta=
rget=3D"_blank">Martin.Jansa@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000dbeb7105f2739e85--

