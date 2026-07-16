Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFA2FC44512
	for <webhook@archiver.kernel.org>; Thu, 16 Jul 2026 14:58:02 +0000 (UTC)
Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14876.1784213881601962813
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Jul 2026 07:58:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=DC2guxB4;
 spf=pass (domain: gmail.com, ip: 74.125.224.45, mailfrom: jpewhacker@gmail.com)
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-66826484b67so1422666d50.1
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Jul 2026 07:58:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784213881; cv=none;
        d=google.com; s=arc-20260327;
        b=V7Xe2DIff96exA26a9DsG0cjf3T7AIgwi8tndkrKzvUNxvLw31YDY35EW16/5yxEqG
         +3ZFAiqb8WHH1SDtiSjyRcpB6PwNfPeDVVbZtLnxx3cwALuY2upQrw4niPgrzUrlUzT7
         78Liq8fxnZl/Mo5/2EkUbi4AcZ9AzTXuC5raA0TWewrIN7EKJMymIvW53CbftL5m1thZ
         Dp7maMc5V4Z0GizO3hAKR+b/XV8805eM6m5M83q9vIrW//m451fbH+V6A3oHobssYUSY
         hzZBiVUD8uTjvmwWHyswo0UlZ3tkazOUAe6I+TbP7ssGhTph7tScbV5I3QKn8ASoMY7p
         aNDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=aaCocvdHV2LKSM+yAiPLsT1ihYVl5MfB+KpDTCRCbhY=;
        fh=qBGF+mCe7pJqWslyU3y2+S0GKhyjCAH5b0SlfgGlM3I=;
        b=njRYncD2JzDqY7qtEYsxMFdrYLTiTk0jQVh9PxZSuYGa4NKATXba/anPB2ngqKIIPm
         wVKsUNoh99KOROEnBj1UiUFEfCfF2s7mQOplWqjVxjohHZ2voZTLygdf/l0rsj2e8YL6
         CzlZ61UaXzUWcpJ+SgFwTaNxUuyyfdDp4k0mHQkkrQmCBRTtcXhYjfb1+xqaf+JewuWM
         GZbYVNypPHTxIh9bg3srOVbI6V6t4lsHM4G6WCeK5aYBrZxtHWItUa3zAyKsZQHmHJd6
         80y2V6PyvaJ4HG6sF46E4YnjAp0C3vaWrjVEuy3AoZhnw9c6hPRIn87cAFAQm3huUSkN
         zS0A==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784213881; x=1784818681; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aaCocvdHV2LKSM+yAiPLsT1ihYVl5MfB+KpDTCRCbhY=;
        b=DC2guxB4/ZsyBgqYZXgKiv51i6k8H1Rp346/rqVDa/uzNGr6uU2wMTWjTNVG/Rrv3P
         BnUy8VOoZfG75b5WgkZbXjyKHlUDX2nK2447qfQLzdOZ7LvN7KF+KiO7If0MMsH9N2mi
         j9E9LOSTBy43Y9IuG5GNcX5Dgdg9jnpYF6OYnsCXANlVT/z1qTb3df6cSJawdZ18ZQPu
         K5kwB2OJCXUQ67egBW39YdTau+TLgf5T+1nQ1O1n0cJhrF53ECcTyybgpjROxfBdbidh
         iW/XSAHcI6JV6Msfmc0FV6LZ+z8X3z52INKx0K7cWFc7WxCsMmXDbwcx6it8yZ1UjoZP
         TzDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784213881; x=1784818681;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=aaCocvdHV2LKSM+yAiPLsT1ihYVl5MfB+KpDTCRCbhY=;
        b=n4kgK00J65Fek7LimmLbdx4+RHXVIFPQQ+k8mvE8bQ++NeqE+HeyX0/vfkK9I0DJDv
         A+PWo5ABx9+y1wTm0D9Z8+onh9ZIok9mn/MxDDIAIix650lFVilba68HcoZl0W1LvIKn
         P/4iF36hwwfudK15xVFWjQFLi3ROUfxJsR6OePsyEWKykVYeJHt0JTZniCCoIw/6FJwO
         XrFRpS7CPmM50Pc32eerduyVZXrycmg1VwCkW800Rc7TdZVbi+dXUfwFiX+b6oy101dL
         eNJpX/f8m5I0aq65cTvR2F9GbXgNNqJXlNlU2nSvCCEzFRYYLM+Ytm3cFbeCqLEUQJxo
         v+bg==
X-Gm-Message-State: AOJu0YxcvVIwd7Rsg40ZyFKOa2XP3W2CViTDfEzdvshmEfLanw7jlnfJ
	GABPNAjOn5IauHxFi1+5tzG4bQf93Y7IezMArBE//KJwF1jP3Un6LPA97qVaAxlsXe4ScMaklLY
	Lt8oxZlWIKRSnrfg3ICIioGooA3tHfUk=
X-Gm-Gg: AfdE7cnpwUE/0dgx59zBnvQISq0CiRS7KZiq3CWIXL2SsdWLuBiKevSAcDZuQn0JY9O
	YvydJDS/aQ0swvQnjJElGl/5GouN/oNHW9U5yVOSURhIAWqN6mAv+pCFCvXloXDPaPt8U4okX46
	m2kJiRy69K+20mJE+ztBJ2+hoRLU57nj7dWlJXad54Al4XllS1WVyaRP2549JlPUEDX4e23lK8R
	lVmgf03z0ccOGi/UNPy6fIlvuQ12wy0qxpmEIwm797wBc9lG+gIrDB9dha16tTKMicYQ/aMwNbd
	6G6ZAiVAhTU=
X-Received: by 2002:a05:690e:1505:b0:660:4473:6eba with SMTP id
 956f58d0204a3-66807775852mr7438387d50.47.1784213880565; Thu, 16 Jul 2026
 07:58:00 -0700 (PDT)
MIME-Version: 1.0
References: <20260710160238.214808-1-jose.quaresma@oss.qualcomm.com>
In-Reply-To: <20260710160238.214808-1-jose.quaresma@oss.qualcomm.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Thu, 16 Jul 2026 08:57:48 -0600
X-Gm-Features: AUfX_myhDVQCHzjHImVVYgKW5kLvRSwuvXE1tofdjPh8Dxm8oub11Pj45i6Rw0Y
Message-ID: <CAJdd5GY3dfgb=SXPcisj4HuV8HehFhN4hm8Xo31goZpEBXeHqQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] oe/spdx30_tasks: fix image deploy dir
To: jose.quaresma@oss.qualcomm.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000008df0970656bbaaf1"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Jul 2026 14:58:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241093

--0000000000008df0970656bbaaf1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 10, 2026 at 10:02=E2=80=AFAM Jose Quaresma via lists.openembedd=
ed.org
<jose.quaresma=3Doss.qualcomm.com@lists.openembedded.org> wrote:

> IMGDEPLOYDIR is not populated when the artifacts comes from sstate-cache.
>
> Instead of the task input, we should use the output because the input is
> not guaranteed to remain in the file system. For example, `rm_work`
> also deletes the IMGDEPLOYDIR file.
>

LGTM, thanks.

Reviewed-by: Joshua Watt <JPEWhacker@gmail.com>


>
> Signed-off-by: Jose Quaresma <jose.quaresma@oss.qualcomm.com>
> ---
>  meta/lib/oe/spdx30_tasks.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
> index 79e18db11d..52255108a6 100644
> --- a/meta/lib/oe/spdx30_tasks.py
> +++ b/meta/lib/oe/spdx30_tasks.py
> @@ -1435,7 +1435,7 @@ def create_rootfs_spdx(d):
>  def create_image_spdx(d):
>      import oe.sbom30
>
> -    image_deploy_dir =3D Path(d.getVar("IMGDEPLOYDIR"))
> +    image_deploy_dir =3D Path(d.getVar("DEPLOY_DIR_IMAGE"))
>      manifest_path =3D Path(d.getVar("IMAGE_OUTPUT_MANIFEST"))
>      spdx_work_dir =3D Path(d.getVar("SPDXIMAGEWORK"))
>
> --
> 2.55.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#240660):
> https://lists.openembedded.org/g/openembedded-core/message/240660
> Mute This Topic: https://lists.openembedded.org/mt/120209270/3616693
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> JPEWhacker@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000008df0970656bbaaf1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Jul 10,=
 2026 at 10:02=E2=80=AFAM Jose Quaresma via <a href=3D"http://lists.openemb=
edded.org">lists.openembedded.org</a> &lt;jose.quaresma=3D<a href=3D"mailto=
:oss.qualcomm.com@lists.openembedded.org">oss.qualcomm.com@lists.openembedd=
ed.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">IMGDEPLOYDIR is not populated when the artifacts comes from sstate-ca=
che.<br>
<br>
Instead of the task input, we should use the output because the input is<br=
>
not guaranteed to remain in the file system. For example, `rm_work`<br>
also deletes the IMGDEPLOYDIR file.<br></blockquote><div><br></div><div>LGT=
M, thanks.</div><div><br></div><div>Reviewed-by: Joshua Watt &lt;<a href=3D=
"mailto:JPEWhacker@gmail.com">JPEWhacker@gmail.com</a>&gt;</div><div>=C2=A0=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Signed-off-by: Jose Quaresma &lt;<a href=3D"mailto:jose.quaresma@oss.qualco=
mm.com" target=3D"_blank">jose.quaresma@oss.qualcomm.com</a>&gt;<br>
---<br>
=C2=A0meta/lib/oe/spdx30_tasks.py | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py<br>
index 79e18db11d..52255108a6 100644<br>
--- a/meta/lib/oe/spdx30_tasks.py<br>
+++ b/meta/lib/oe/spdx30_tasks.py<br>
@@ -1435,7 +1435,7 @@ def create_rootfs_spdx(d):<br>
=C2=A0def create_image_spdx(d):<br>
=C2=A0 =C2=A0 =C2=A0import oe.sbom30<br>
<br>
-=C2=A0 =C2=A0 image_deploy_dir =3D Path(d.getVar(&quot;IMGDEPLOYDIR&quot;)=
)<br>
+=C2=A0 =C2=A0 image_deploy_dir =3D Path(d.getVar(&quot;DEPLOY_DIR_IMAGE&qu=
ot;))<br>
=C2=A0 =C2=A0 =C2=A0manifest_path =3D Path(d.getVar(&quot;IMAGE_OUTPUT_MANI=
FEST&quot;))<br>
=C2=A0 =C2=A0 =C2=A0spdx_work_dir =3D Path(d.getVar(&quot;SPDXIMAGEWORK&quo=
t;))<br>
<br>
-- <br>
2.55.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#240660): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/240660" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/240660</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/120209270/361=
6693" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/120209270/3616693</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:JPEWhacker@gmail.com" targ=
et=3D"_blank">JPEWhacker@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--0000000000008df0970656bbaaf1--

