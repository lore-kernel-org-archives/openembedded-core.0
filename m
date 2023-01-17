Return-Path: <samuli.piippo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 838BAC677F1
	for <webhook@archiver.kernel.org>; Tue, 17 Jan 2023 15:50:35 +0000 (UTC)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
 by mx.groups.io with SMTP id smtpd.web11.200165.1673970632276267087
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Jan 2023 07:50:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=iluiKDci;
 spf=pass (domain: gmail.com, ip: 209.85.217.41, mailfrom: samuli.piippo@gmail.com)
Received: by mail-vs1-f41.google.com with SMTP id d66so20184607vsd.9
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Jan 2023 07:50:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4DMzAkGwchaW8h7HiipP9Gr3wXI5ew6azyUHfjSvWeY=;
        b=iluiKDciWe13M2DcROQM/O5XnY+P+jb735cB+M2Ss84hz1kcfZIKwC/Snu5vpc7jPt
         CvzSXaUxKagrQgxTkQq1UKce4oE/Z1BC4rYTaleDKwvHXzn/6hHDrCgW9URtiiFrFXbk
         5FuZxe/icUyGRcoeTfiY7xa38sLbpCabMYBRV4s3nP6FRah7d0WNoBVWOihwQ/drkxWL
         SzgB3I3TgP7Cbdr3jiIlAIEgxw1f63KWqtbwyhLUNEC/p+Q+Hv8bce1/yiBhJ8f/B3nv
         QJAXlAA+BRs0lwe2+FlijQQurARP5v4syI8AdeCBx5mpKdf+NB5zrMp2fCN3rRkxTnwz
         fzCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4DMzAkGwchaW8h7HiipP9Gr3wXI5ew6azyUHfjSvWeY=;
        b=IZ8BM2gcYNaRu5g04iDyifnyhqWesTLaA8YuGIMu2EsIy9VCSIlFb/N7/XH3golznu
         RE5/HJ+YXZ1PcufdmI6SexWzbDksqQIxhh6IisDUtAuGxAyJjS70YeygxXhTNM0gsMPP
         Xyfs5JYiRos8r+Fyny92oUQpiOvngeBbG7b12PVgSO6vsFI39sSdJ9jnf46ev/oN6OrV
         CI9RJc6/n6nnGbhrLkWXA3UPl0WI/kl2OCA9qOXbjPnlslRr0RCQkJzvNjxDHV4zRptc
         1r7Y4NHM2JmXtMKbTAWIK47VX/u0ew7Q3oXU+/sDJEhtxJKFnz/QkPQyIphoAClApZ43
         eObQ==
X-Gm-Message-State: AFqh2ko63UqjlILczVT/o92WzzUH2tK7Laa36jZb6EhKmbL2+h9Ar3kt
	Hd/ISeqlZKMmuyWGRh21A6EmFOqkK0GHHmdJx18=
X-Google-Smtp-Source: AMrXdXvOeq341W7pyqLwQ7qy+fBhYW7pVR/NzD48o29EEPHakUggPTDIks+WrDcwdrPCxmhKuQn06tLk4Q6jX0LT5Yo=
X-Received: by 2002:a05:6102:50a4:b0:3d0:a4bf:8c9c with SMTP id
 bl36-20020a05610250a400b003d0a4bf8c9cmr463235vsb.15.1673970631256; Tue, 17
 Jan 2023 07:50:31 -0800 (PST)
MIME-Version: 1.0
References: <20221201173942.1218836-1-f_l_k@t-online.de> <CAMKF1srCn0tDWAxxpVCYhTZmow3uwy0tGqLXy2VDX0qBHDx2ZA@mail.gmail.com>
 <NMLEMR.NA7JF86LUFN83@t-online.de> <CAP9ODKopgRpWZNiFHjFtw34dYhRHKH188p2_AAs_=Ptyti-ESA@mail.gmail.com>
 <CA+chaQcCzmqKquXstrcBBQGD8vJ5gDVuUJDNoN7uVNEbpjm+AA@mail.gmail.com>
 <AM4PR0201MB20975667EA5BA27E0326E3BEE91D9@AM4PR0201MB2097.eurprd02.prod.outlook.com>
 <172EC24C7596EDC7.3782@lists.openembedded.org> <CA+chaQeOeCGm=ZPV7JzNNOQTbkKFfZWU8dbU0JQu6CLY_wboDQ@mail.gmail.com>
In-Reply-To: <CA+chaQeOeCGm=ZPV7JzNNOQTbkKFfZWU8dbU0JQu6CLY_wboDQ@mail.gmail.com>
From: Samuli Piippo <samuli.piippo@gmail.com>
Date: Tue, 17 Jan 2023 17:50:19 +0200
Message-ID: <CABXoSoWCK0EJdQ49eVn=t8cpLusXG_sGECCRyJc8Yvg+4-xc4w@mail.gmail.com>
Subject: Re: [oe-core][PATCH] mesa: update 22.2.3 -> 22.3.0
To: Martin Jansa <Martin.Jansa@gmail.com>
Cc: Samuli Piippo <samuli.piippo@qt.io>, Otavio Salvador <otavio.salvador@ossystems.com.br>, 
	Markus Volk <f_l_k@t-online.de>, Khem Raj <raj.khem@gmail.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000d72d3305f277a8b9"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Jan 2023 15:50:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176052

--000000000000d72d3305f277a8b9
Content-Type: text/plain; charset="UTF-8"

I think this is now a webos specific issue since they have disabled xlib
feature (
https://github.com/shr-project/meta-webosose/blob/c96010fe4df28397a33e447bde650932a3463a9e/meta-webos/recipes-qt/qt6/qtbase_git.bbappend#L56
)
While the qtbase cmake configuration could be improved to better handle
situation where x11 dependencies are found but shouldn't be used, I think
the simplest solution would be to disable egl on X11 in the webos bbappend
(-DFEATURE_egl_x11=OFF)

-samuli

On Tue, 17 Jan 2023 at 13:01, Martin Jansa <Martin.Jansa@gmail.com> wrote:

> Samuli:
>
> Similar mesa upgrade was merged recently:
>
> https://git.openembedded.org/openembedded-core/commit/?id=3bf4341ef6a681574a1c6f393bf241f412e26eac
>
> qtbase still fails the same, more details in:
>
> https://github.com/shr-project/meta-webosose/commit/c96010fe4df28397a33e447bde650932a3463a9e
>
> The change you've mentioned is the one which actually breaks some
> PACKAGECONFIG combinations, hopefully now you'll be able to reproduce it.
>
> Regards,
>
> On Thu, Dec 8, 2022 at 8:55 AM Martin Jansa via lists.openembedded.org
> <Martin.Jansa=gmail.com@lists.openembedded.org> wrote:
>
>> On Thu, Dec 8, 2022 at 8:42 AM Samuli Piippo <samuli.piippo@qt.io> wrote:
>>
>>> Qt6 should handle this already with
>>> https://codereview.qt-project.org/c/qt/qtbase/+/371780 in place.
>>> I tried test build with the mesa upgrade and didn't catch any build
>>> errors.
>>>
>>
>> I've tried qemux86-64 build with 6.4.1 and 6.5.0 from yesterday's dev
>> branch and both failed after including this mesa upgrade with:
>> | In file included from
>> qtbase/6.4.1-r0/recipe-sysroot/usr/include/EGL/egl.h:20,
>> |                  from
>> qtbase/6.4.1-r0/build/include/QtGui/6.4.1/QtGui/private/../../../../../../git/src/gui/opengl/platform/egl/qt_egl_p.h:43,
>> |                  from
>> qtbase/6.4.1-r0/build/include/QtGui/6.4.1/QtGui/private/qt_egl_p.h:1,
>> |                  from
>> qtbase/6.4.1-r0/git/src/gui/opengl/platform/egl/qeglstreamconvenience_p.h:20,
>> |                  from
>> qtbase/6.4.1-r0/git/src/gui/opengl/platform/egl/qeglstreamconvenience.cpp:4:
>> | qtbase/6.4.1-r0/recipe-sysroot/usr/include/EGL/eglplatform.h:109:10:
>> fatal error: X11/Xlib.h: No such file or directory
>> |   109 | #include <X11/Xlib.h>
>> |       |          ^~~~~~~~~~~~
>> | compilation terminated.
>>
>>>
>>
>>
>>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#176031):
> https://lists.openembedded.org/g/openembedded-core/message/176031
> Mute This Topic: https://lists.openembedded.org/mt/95388063/3617605
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> samuli.piippo@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000d72d3305f277a8b9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div></div><div dir=3D"ltr"><div>I think this is now a web=
os specific issue since they have disabled xlib feature (<a href=3D"https:/=
/github.com/shr-project/meta-webosose/blob/c96010fe4df28397a33e447bde650932=
a3463a9e/meta-webos/recipes-qt/qt6/qtbase_git.bbappend#L56">https://github.=
com/shr-project/meta-webosose/blob/c96010fe4df28397a33e447bde650932a3463a9e=
/meta-webos/recipes-qt/qt6/qtbase_git.bbappend#L56</a>)</div><div>While the=
 qtbase cmake configuration could be improved to better handle situation wh=
ere x11 dependencies are found but shouldn&#39;t be used, I think the simpl=
est solution would be to disable egl on X11 in the webos bbappend (-DFEATUR=
E_egl_x11=3DOFF)</div></div><div><br></div><div>-samuli<br></div><div><br><=
/div><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tu=
e, 17 Jan 2023 at 13:01, Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gm=
ail.com">Martin.Jansa@gmail.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex"><div dir=3D"ltr">Samuli:<div><br></div><di=
v>Similar mesa upgrade was merged recently:</div><div><a href=3D"https://gi=
t.openembedded.org/openembedded-core/commit/?id=3D3bf4341ef6a681574a1c6f393=
bf241f412e26eac" target=3D"_blank">https://git.openembedded.org/openembedde=
d-core/commit/?id=3D3bf4341ef6a681574a1c6f393bf241f412e26eac</a><br></div><=
div><br></div><div>qtbase still fails the same, more details in:</div><div>=
<a href=3D"https://github.com/shr-project/meta-webosose/commit/c96010fe4df2=
8397a33e447bde650932a3463a9e" target=3D"_blank">https://github.com/shr-proj=
ect/meta-webosose/commit/c96010fe4df28397a33e447bde650932a3463a9e</a><br></=
div><div><br></div><div>The change you&#39;ve mentioned is the one which ac=
tually breaks some PACKAGECONFIG combinations, hopefully now you&#39;ll be =
able to reproduce it.</div><div><br></div><div>Regards,</div></div><br><div=
 class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Dec 8,=
 2022 at 8:55 AM Martin Jansa via <a href=3D"http://lists.openembedded.org"=
 target=3D"_blank">lists.openembedded.org</a> &lt;Martin.Jansa=3D<a href=3D=
"mailto:gmail.com@lists.openembedded.org" target=3D"_blank">gmail.com@lists=
.openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr">On Thu, Dec 8, 2022 at 8=
:42 AM Samuli Piippo &lt;<a href=3D"mailto:samuli.piippo@qt.io" target=3D"_=
blank">samuli.piippo@qt.io</a>&gt; wrote:<br></div><div class=3D"gmail_quot=
e"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex"><div>




<div dir=3D"ltr">
<div><span style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-siz=
e:12pt;color:rgb(0,0,0);background-color:rgb(255,255,255)">Qt6 should handl=
e this already with
<a href=3D"https://codereview.qt-project.org/c/qt/qtbase/+/371780" id=3D"m_=
-4802139656687153021m_-2196537923583286084m_-2294924994488092156LPlnk780937=
" target=3D"_blank">
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
<br>
<br>
</blockquote></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#176031): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/176031" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/176031</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/95388063/3617=
605" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/95388063/3617605</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:samuli.piippo@gmail.com" t=
arget=3D"_blank">samuli.piippo@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000d72d3305f277a8b9--

