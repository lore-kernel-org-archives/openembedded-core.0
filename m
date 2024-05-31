Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECB18C25B75
	for <webhook@archiver.kernel.org>; Fri, 31 May 2024 07:51:43 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web11.6332.1717141895370146649
 for <openembedded-core@lists.openembedded.org>;
 Fri, 31 May 2024 00:51:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GkstoJfe;
 spf=pass (domain: gmail.com, ip: 209.85.167.45, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-52b89fcdcc7so433023e87.3
        for <openembedded-core@lists.openembedded.org>; Fri, 31 May 2024 00:51:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717141893; x=1717746693; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BpXmKVWTAabKjfInap9VqnQJ+h6TK5rcaGrQb7YEcLI=;
        b=GkstoJfeUmvsEGCtYSF3Mxr53MgzncdZQflx4jEFNoc/XFwfifuWsb5Hf/irUOFbdh
         Ile3a3yegpbFSVhuf0yzscC88V1OkVeh7eMwR+zXSGDtqU19AgII5sZDRxbMFoirKaFd
         YSXhtQmj9GUzLL9vjHp3/2zEqsW3EJuaAFaXcV+Sm3g3hupH9qmXTkDuxsV56ATPKb3K
         bpSwsNuoBDqAEX+EDNtceJE/eERRvANz1jH02b7tAe/UlDIUok3C9NZ4LHPfuKQbzwQJ
         ACNzDgmt3XTF4icpXVlOfZZjD4hozdKHi7Xo/99a+oGyQhIDu8sEywe1SzJdrFsIS7E2
         AfCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717141893; x=1717746693;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BpXmKVWTAabKjfInap9VqnQJ+h6TK5rcaGrQb7YEcLI=;
        b=Mw1ESgLTiTKnx1NWJxXR2FWtE0Jz5m/N/OHPTfKaz0OaPwdByXMJNuuDHBeJy09msw
         OXj4w80LlTzOXAMrQMMvbMHmMdkNRPPj+VpFc9yZCVqfOds2TdYlnsEU9DVZF0HMhE8x
         KyDDXmallJop2PxWlhZGSBDGJLWaPNYRNjq5ONhJa336Di6G65lx7adA+F3B8WAXx/B0
         ogBpf5G8ZS4o7FD0zm9LqwTW4PJDP6edPUHFrmr2bk/2QGemzCn1+zWrl5bX2u0haqJl
         L3pkkNOwdcm5qPOpEqnnHJj8RLfQfHWPNl3Pm0QFFquC1ZBZcYwFgKW5MuiGLiNSIOxw
         lcmw==
X-Forwarded-Encrypted: i=1; AJvYcCUyWHA6BQiDAHcELv5zQvkxhAL+JVbCKZ1hec0qNw7tNeynXFgN6WWz5EDIzVeXj2aqxJHUFWP8emv8qIItzMEEobcHyWx614v4WMEKzCrlLD5CdE47ORXm
X-Gm-Message-State: AOJu0YyeZeIPKNxyavjYMwtCM7vLF71bZ4+jBvgYfTx388VodO2s6eOa
	tCRQNQLi76Q/JBKJ1snQeU2BRRHwdetF825OTqYN6d4H08xEvvfb2++eXYVz4tV8ZvWN3S3tT7C
	T8FrDkLrdZMeAGvne7qY78ebJ+kE=
X-Google-Smtp-Source: AGHT+IFVWB+55qiwqfZAooyuv1wqtHvaBzFwZxjYhJImHJlj8v2/CKWjmTpwLSn6oXew38PK1FY2FMRmmqYvTvrEtq8=
X-Received: by 2002:a05:6512:4ce:b0:51a:f2fb:b13c with SMTP id
 2adb3069b0e04-52b89565039mr661153e87.11.1717141892891; Fri, 31 May 2024
 00:51:32 -0700 (PDT)
MIME-Version: 1.0
References: <20240531063027.2050793-1-bin.lan.cn@eng.windriver.com> <AS1PR10MB5697A2B6A2AFDBFC2E5C5D4AFDFC2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <AS1PR10MB5697A2B6A2AFDBFC2E5C5D4AFDFC2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 31 May 2024 09:51:09 +0200
Message-ID: <CA+chaQd=ZzzbGSFyXdsx4d3m+KKp36TT9Nt=8ARr-KU-CGQTXg@mail.gmail.com>
Subject: Re: [OE-core][scarthgap][PATCH] opencl: fix virtual PROVIDES warnings
To: peter.marko@siemens.com
Cc: "bin.lan.cn@eng.windriver.com" <bin.lan.cn@eng.windriver.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	Bin Lan <bin.lan.cn@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 May 2024 07:51:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200058

And you're changing the build time dependencies, the warning is about
runtime dependencies, so I don't think this is correct.

On Fri, May 31, 2024 at 8:59=E2=80=AFAM Peter Marko via lists.openembedded.=
org
<peter.marko=3Dsiemens.com@lists.openembedded.org> wrote:
>
> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> On Behalf Of Bin Lan via lists.openembedded.org
> Sent: Friday, May 31, 2024 8:30
> To: openembedded-core@lists.openembedded.org
> Cc: Bin Lan <bin.lan.cn@windriver.com>
> Subject: [OE-core][scarthgap][PATCH] opencl: fix virtual PROVIDES warning=
s
>
> > From: Bin Lan <bin.lan.cn@windriver.com>
> >
> > oe-core has started to warn when virtual/ is used outside of
> > the RPROVIDES (build) context.
> >
> > We tweak provides/depends to use virtual- instead to
> > avoid the warning:
> >
> >   RPROVIDES is set to virtual/opencl-icd, the substring 'virtual/'
> >   holds no meaning in this context. It is suggested to use the 'virtual=
-'
>
> You have old version of master/scarthgap, current warning is:
> %s is set to %s but the substring 'virtual/' holds no meaning in this con=
text. It only works for build time dependencies, not runtime ones. It is su=
ggested to use 'VIRTUAL-RUNTIME_' variables instead.
>
> Also you should send this to master first as it applies to that branch, t=
oo.
>
> >
> > Signed-off-by: Bin Lan <bin.lan.cn@windriver.com>
> > ---
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#200057): https://lists.openembedded.org/g/openembedde=
d-core/message/200057
> Mute This Topic: https://lists.openembedded.org/mt/106403372/3617156
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ma=
rtin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

