Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40635C02198
	for <webhook@archiver.kernel.org>; Tue, 18 Feb 2025 04:25:37 +0000 (UTC)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
 by mx.groups.io with SMTP id smtpd.web11.12632.1739852728018342457
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Feb 2025 20:25:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FCSOIzn7;
 spf=pass (domain: gmail.com, ip: 209.85.219.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-6e66a7e2754so24830246d6.3
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Feb 2025 20:25:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739852727; x=1740457527; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=H2Emv55yILjf3qrnW2MmrItcoa9gRNYHDGRgD2+7mc0=;
        b=FCSOIzn7Y76cGL307mm16vbL6wltCuWHhmyI2OCPsrFwAy29Ytgref/HDBbq8feRsM
         fctbwvSIApGGsutyeJImLLh9xORe4w8STTe9z2B1LKges3U2XCnmxcbGbh1fTQwU2LCv
         JMAxImaTonZ6GVuVxgaHycertJUtzHRFUfG1a+wgt7BTX0iYjx7Q6CoFidS9LWQyOErv
         bLNrZdEdETtlWNVCWGurM+R28vdIrx6a9VkUptscdlx9Rd7S0eGZga4MakkDXaOlPQ7X
         FR5b4PtvCXywR7n3awODKeR/XOReVpNkIMWt+ygi4W/HWD7I/VVr6//rbQOsNm2SfiqW
         0yDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739852727; x=1740457527;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H2Emv55yILjf3qrnW2MmrItcoa9gRNYHDGRgD2+7mc0=;
        b=N5AG+8zDJlZ4r4zht7HtWGWWbtsJqE5Hwikw1+jyXoIX/gIglN5gCPNfqXi/XnB63Q
         OP1m5WJ+dq/bSmiAgI0YChVFsZHMz8dhbZd92fL0B6kZMFbd5Zz8abDvH+UhxybggeMS
         bvG/zqbtz/jDYlMrPVPMq7S+OqIiAxiBRWMgTsEOLLnV7egEPnjkHfqONWlgA9LZ26Sc
         BngsiW/sHVJ2mRE5fMsN/LzdVl4kWkon4ZMtvnSjPMOFMjC/vVUp9ya0Rqtic9udRJCF
         vayLodjme2KAHOeD2XHXvWftOFh02LTyASZanQgXDBt8WwjwZ2gquGpMuK+/KIseofWF
         Rl+Q==
X-Gm-Message-State: AOJu0Yyoty47vPt0PqQKsyl/C/OLIpiHWOXu1pt4oCrCZdUuSguWTWYW
	5NkTNX+HOnVInRaTbnMk4PS0eeAd2NOuuqN8dJUs8vNXmkRWpGjC29w/6K/dW8r6eJ/p7yQAd6T
	YhXZXr+0zJC77FP2+bLjfoUgYIyw=
X-Gm-Gg: ASbGncvS4WbK7+g8gmnujv9qfaPynepK/3EHZFq2nC8J1yUhtvUQb/bmCp0Xrf4Jm4k
	RbGcBcFiBWfkLk18rGOiu4AcYAu09wdbV/tpJmLD7meArqHK8Vh7lmfxKpBvuAH7CI1ZyOxSDdB
	MLPDUXb0PL0crlBlR8Ut90yIuOj6NG3v8=
X-Google-Smtp-Source: AGHT+IEbs7R6CMkYATiX80q01jc/axNGJ/9vnQyoSSDgphYJtkegzcbzEZ/nGk0Rjct30/uFVq4cYbHYqUwx3ois7Qg=
X-Received: by 2002:ad4:5d6f:0:b0:6e4:4331:aae6 with SMTP id
 6a1803df08f44-6e66cf38b4bmr179822736d6.39.1739852726977; Mon, 17 Feb 2025
 20:25:26 -0800 (PST)
MIME-Version: 1.0
References: <DAC5A0B2-4F3D-4338-9EC0-68037A53FBBF@arm.com> <24821.1739835549438079665@lists.openembedded.org>
In-Reply-To: <24821.1739835549438079665@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 18 Feb 2025 05:25:16 +0100
X-Gm-Features: AWEUYZmG6r-oVfcT33W6BlCa5h4rT4zvHU0lCacFbuY50SWuKPVo_db_sIxRYys
Message-ID: <CANNYZj8R6ycBUpf6mUCVxVy=2c7OxpDHD3rMyKSkn7WvRbF5RQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH V3] setuptools3-base.bbclass: override default
 subprocess timeout
To: hongxu.jia@eng.windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000c0ce9d062e630722"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 04:25:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211562

--000000000000c0ce9d062e630722
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

But why should this be set in core for everyone, and to ten minutes? Your
farm is misconfigured if 40 seconds is not enough got =E2=80=98git status=
=E2=80=99.

Alex

On Tue 18. Feb 2025 at 0.39, hongxu via lists.openembedded.org <hongxu.jia=
=3D
eng.windriver.com@lists.openembedded.org> wrote:

> It happens occasionally, in our build farm, similar Yocto Autobuilder, th=
e
> build test controller  starts up multiple containers for the build on  th=
e
> host, and each container is allocated for the world build.
> It should be some kind of limit testing or stress testing for yocto build
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#211558):
> https://lists.openembedded.org/g/openembedded-core/message/211558
> Mute This Topic: https://lists.openembedded.org/mt/111228031/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000c0ce9d062e630722
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">But why should this be set in core for everyone, and to t=
en minutes? Your farm is misconfigured if 40 seconds is not enough got =E2=
=80=98git status=E2=80=99.</div><div dir=3D"auto"><br></div><div dir=3D"aut=
o">Alex</div><div><br><div class=3D"gmail_quote gmail_quote_container"><div=
 dir=3D"ltr" class=3D"gmail_attr">On Tue 18. Feb 2025 at 0.39, hongxu via <=
a href=3D"http://lists.openembedded.org">lists.openembedded.org</a> &lt;hon=
gxu.jia=3D<a href=3D"mailto:eng.windriver.com@lists.openembedded.org">eng.w=
indriver.com@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;=
border-left-style:solid;padding-left:1ex;border-left-color:rgb(204,204,204)=
"><div dir=3D"auto">It happens occasionally, in our build farm, similar Yoc=
to Autobuilder, the build test controller=C2=A0 starts up multiple containe=
rs for the build on =C2=A0the host, and each container is allocated for the=
 world build.</div>
<div>It should be some kind of limit testing or stress testing for yocto bu=
ild</div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#211558): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/211558" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/211558</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/111228031/168=
6489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/111228031/1686489</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.kanavin@gmail.com" ta=
rget=3D"_blank">alex.kanavin@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000c0ce9d062e630722--

