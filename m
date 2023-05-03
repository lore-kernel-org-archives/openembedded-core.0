Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31919C77B75
	for <webhook@archiver.kernel.org>; Wed,  3 May 2023 10:02:29 +0000 (UTC)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
 by mx.groups.io with SMTP id smtpd.web10.15194.1683108148516026626
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 May 2023 03:02:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=o7O2l7kY;
 spf=pass (domain: gmail.com, ip: 209.85.217.47, mailfrom: quaresma.jose@gmail.com)
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-42e3909fd58so3817648137.3
        for <openembedded-core@lists.openembedded.org>; Wed, 03 May 2023 03:02:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683108147; x=1685700147;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RoCrtL2AJx0nilg7sl/ds8nsZCs20yb+BpVw8R35SaI=;
        b=o7O2l7kYNeIvAKqaRE2d67QIAx1qmGW/3mO8FEaigTLCQ3XYObePH3tAK2Vrbq4tSV
         zg/N6efP90u4yqjkXRDvAfu2xkDEsA8ZBDJi3hx6V3rcrwbkdHpshPjylyhFjAjxz5Sx
         yEx+qe7xN/Puy9O8fyyaVW6y48o5ZKPqmnZzvovu3UIk1PAzJORHBCUvfAmJ5y/1S+Nu
         ehoeokTlpXJIckl3vwZtlZssMuYrO13WXLcwfhetyqAuAcTfK39jp6sF27qXSfuSlmMS
         lOT97QQ6ZE20yISqxinY0SLTv6tKv8tuyAhhl11DGDBtjaM9TIuIENkRBT6USup1jibU
         3YJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683108147; x=1685700147;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RoCrtL2AJx0nilg7sl/ds8nsZCs20yb+BpVw8R35SaI=;
        b=iJmoqlgU8Gs7UGOvles7Q08vJ4FyigEGDmpNMVW7yViY8Qzu+fzEya4fHTi29uITj2
         2pCzERL/E9FXUlg8BV1oWAkZeJx3r1N6/VS3o5hL/9kEB6HQq4S8Ud0pi9jmf+FfKeAP
         lkJBk9xCw4tIWkSFCy6zLdq6IN/yMksiBl3KGDTiRQ/wLGG2sLfeA0sVh0Nkr1K++vo2
         BRbSr5IHLCmHtcmyv/EwI7B7zXXxB51xfPI5gNOJbzWbZ3iEVmhk4iFjbDOrCRYjpSoT
         4KlYzmyzvquZpMvWPNPEepkvfu7oJYQLvDExqgFowVfmNnSZPYIUCSrEG+yv3EyV9a61
         9O6g==
X-Gm-Message-State: AC+VfDzziEjpbj64kiCLNzOwqKekWliFgju1Q8+KeDP+A5sPe1RTJ0d/
	TnSxyuqHiS6fMFAU39h3DWSgORf3PkOA+ZOjfmA=
X-Google-Smtp-Source: ACHHUZ7cIrZAUnfzV5Oh4zdx4G8iob7CfiN26UPbmhxpXH8Dk1IASC8JwN2T4Jg/0l/gHSM8JdL4h1b2faNIGEzCzDw=
X-Received: by 2002:a67:f95a:0:b0:42c:9a74:c724 with SMTP id
 u26-20020a67f95a000000b0042c9a74c724mr1070647vsq.3.1683108147359; Wed, 03 May
 2023 03:02:27 -0700 (PDT)
MIME-Version: 1.0
References: <20230502195932.2196823-1-ross.burton@arm.com> <CANNYZj9hNOKAD2=ZbEc9ywHaU=vR2wVDg999=yGF=oJ46tU1nQ@mail.gmail.com>
 <7113C985-FF04-411B-A1C3-B30337067A6F@arm.com> <CANNYZj-eVO3_KuvE27t4Y_bsRUuyokMKkhbAKNa-0w+21oBP2A@mail.gmail.com>
In-Reply-To: <CANNYZj-eVO3_KuvE27t4Y_bsRUuyokMKkhbAKNa-0w+21oBP2A@mail.gmail.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Wed, 3 May 2023 11:02:16 +0100
Message-ID: <CANPvuR=Fb7R8cced69NNXTqVRqEAMBvEPk+8qAU6RLzGGmqyUA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/3] vulkan-headers: upgrade to 1.3.249
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Ross Burton <Ross.Burton@arm.com>, OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000003df3a205fac727f8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 May 2023 10:02:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180804

--0000000000003df3a205fac727f8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Alexander Kanavin <alex.kanavin@gmail.com> escreveu no dia quarta,
3/05/2023 =C3=A0(s) 09:47:

> On Wed, 3 May 2023 at 10:39, Ross Burton <Ross.Burton@arm.com> wrote:
> > > Please respect the upstream version check; vulkan should be updated t=
o
> > > sdk-x.y.z versions, which currently means 1.3.243.
> >
> > If that=E2=80=99s a policy and not just because of historical branch st=
ructure,
> please add a comment explaining this to the recipes.
>
> Vulkan items need to be updated in lockstep with things like glslang,
> and those only get tags for vulkan sdk releases:
> https://github.com/KhronosGroup/glslang/tags
>
>
The spirv-headers and the spirv-tools usually also go together with the
vulkan update.

https://github.com/KhronosGroup/SPIRV-Headers/tags
https://github.com/KhronosGroup/SPIRV-Tools/tags

Jose

Also, there's less upgrade churn that way, as we can skip over many
> intermediate development versions that happen weekly or more often.
>
> I'll add a comment, but checking the version with devtool and then
> performing the upgrade with it would've done the correct thing.
>
> Alex
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#180789):
> https://lists.openembedded.org/g/openembedded-core/message/180789
> Mute This Topic: https://lists.openembedded.org/mt/98647309/5052612
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--0000000000003df3a205fac727f8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi,</div><br><div class=3D"gmail_quote"><div dir=3D"l=
tr" class=3D"gmail_attr">Alexander Kanavin &lt;<a href=3D"mailto:alex.kanav=
in@gmail.com">alex.kanavin@gmail.com</a>&gt; escreveu no dia quarta, 3/05/2=
023 =C3=A0(s) 09:47:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">On Wed, 3 May 2023 at 10:39, Ross Burton &lt;<a href=3D"mailto:Ross.Bu=
rton@arm.com" target=3D"_blank">Ross.Burton@arm.com</a>&gt; wrote:<br>
&gt; &gt; Please respect the upstream version check; vulkan should be updat=
ed to<br>
&gt; &gt; sdk-x.y.z versions, which currently means 1.3.243.<br>
&gt;<br>
&gt; If that=E2=80=99s a policy and not just because of historical branch s=
tructure, please add a comment explaining this to the recipes.<br>
<br>
Vulkan items need to be updated in lockstep with things like glslang,<br>
and those only get tags for vulkan sdk releases:<br>
<a href=3D"https://github.com/KhronosGroup/glslang/tags" rel=3D"noreferrer"=
 target=3D"_blank">https://github.com/KhronosGroup/glslang/tags</a><br>
<br></blockquote><div><br></div><div>The spirv-headers=C2=A0and the=C2=A0sp=
irv-tools=C2=A0usually also go together with the vulkan update.<br><br><a h=
ref=3D"https://github.com/KhronosGroup/SPIRV-Headers/tags">https://github.c=
om/KhronosGroup/SPIRV-Headers/tags</a></div><div><a href=3D"https://github.=
com/KhronosGroup/SPIRV-Tools/tags">https://github.com/KhronosGroup/SPIRV-To=
ols/tags</a><br><br></div><div>Jose</div><div><br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
Also, there&#39;s less upgrade churn that way, as we can skip over many<br>
intermediate development versions that happen weekly or more often.<br>
<br>
I&#39;ll add a comment, but checking the version with devtool and then<br>
performing the upgrade with it would&#39;ve done the correct thing.<br>
<br>
Alex<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#180789): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/180789" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/180789</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/98647309/5052=
612" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/98647309/5052612</a><br>
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

--0000000000003df3a205fac727f8--

