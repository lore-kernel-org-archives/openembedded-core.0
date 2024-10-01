Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1C4BCEB2D2
	for <webhook@archiver.kernel.org>; Tue,  1 Oct 2024 00:25:15 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web10.70138.1727742315049253808
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Sep 2024 17:25:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OEeaTMDe;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-2e07ad50a03so3687940a91.3
        for <openembedded-core@lists.openembedded.org>; Mon, 30 Sep 2024 17:25:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727742314; x=1728347114; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wlJvPNFd1DAKFvdM/6VehMU7ubH0gIRYKrsmqR4GZR8=;
        b=OEeaTMDe71RrxvKD9nffENPbMTSivfut0Ff/VWsWaT1AB3r6oPzAeo7indEtBbVxi6
         2ec+zMbzTt2W4Ux5qC43i6q+Po7r+cRoj5nJSnkGUr6/H5UIXAADpfhm7VGEJhZxDYAl
         5c2IKRu6sk+kAZFXlrFkyGX3Rvv3mJryJDdO/+Gi6FM6OMvJm0tug4pZfZvzZPyBEpfM
         B+POdQJjuogrrOcf/ZrQBsciTH7zDRzLmnHY4w2nWxsm5DA2rCvsloN3HFiOOyeOawWi
         Lhq7jLntZKvawvvtGRn4vylZtGOFEKIFjL4AHgaw5fOc+l01voiqfz4PwROtG1mFpzso
         gQjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727742314; x=1728347114;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wlJvPNFd1DAKFvdM/6VehMU7ubH0gIRYKrsmqR4GZR8=;
        b=MHBNZaq0xTLyd0EBmr5cj1qOrOfbXL4YRBJ6HVkeYnGvEw/f0VhOx6boLZGtLfKnmS
         IFs0oUKJm+3zYliNgDlVoSHr3AhpKvjTwX4IzmqBhBu+ILIizVHhHBXoWCdFIyfmcMHY
         4O+2YlzsqrLJrOUdjU50QQBftm7uTJcGsuvc8t4NCQwS+65Mk+SINXz0bcfTp1Vwb/B1
         GE7v2jizsm23EW1hy/dVk79MNdieZF6VN5/wBZSCGt8jyumue/S4g93FvQT/1jkq+PqQ
         A04PVVd92ODdbpiYR+mTyf4WLYdbLvKoucVcl0pUxCbZ4jJ+uX7UL4oTT3zxSi6XnDa7
         vDLA==
X-Gm-Message-State: AOJu0YwEC0N7udYQqCw87JK5GFafo6OayfvObr6jTQUbbCZq3LnXGDej
	xApKhPReGqWnGymNbFu+PO3WD4dX9sK72aceJuqgTLRAM9ySPctbY84BnMJnHdaL/OIDu+9G2+y
	8UV8jKBPfh5a6qABG5zjd8iYw2l8=
X-Google-Smtp-Source: AGHT+IEpqfJlC7dv4qEyaI1vcJFODET4sV5xNZzZLTGqeS7UGNbwJSUSrlA0eICXky0woMXbvG7CB5pIKwVyphDnrkA=
X-Received: by 2002:a17:90a:2dcf:b0:2e0:b741:cdc0 with SMTP id
 98e67ed59e1d1-2e0b8e8b619mr16008891a91.32.1727742314327; Mon, 30 Sep 2024
 17:25:14 -0700 (PDT)
MIME-Version: 1.0
References: <20240930222913.3981407-1-raj.khem@gmail.com> <20240930222913.3981407-2-raj.khem@gmail.com>
In-Reply-To: <20240930222913.3981407-2-raj.khem@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 30 Sep 2024 20:25:02 -0400
Message-ID: <CADkTA4MDUGCiO9OAYgEzTAjA7t3HqYzVLKaSFwJkEFN_W+P_KA@mail.gmail.com>
Subject: Re: [PATCH 2/2] linux-yocto: Enable l2tp drivers when ptest featuee
 is on
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Oct 2024 00:25:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205128

On Mon, Sep 30, 2024 at 6:29=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrote=
:
>
> openl2tp ptests from networking layer depend upon these
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Cc: Bruce Ashfield <bruce.ashfield@gmail.com>

Fine with me!

Bruce

> ---
>  meta/recipes-kernel/linux/linux-yocto_6.10.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta/recipes-kernel/linux/linux-yocto_6.10.bb b/meta/recipes=
-kernel/linux/linux-yocto_6.10.bb
> index 87f7794bbef..cee06c22ea3 100644
> --- a/meta/recipes-kernel/linux/linux-yocto_6.10.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto_6.10.bb
> @@ -66,6 +66,8 @@ KERNEL_FEATURES:append =3D " ${@bb.utils.contains("DIST=
RO_FEATURES", "ptest", " fe
>  KERNEL_FEATURES:append =3D " ${@bb.utils.contains("DISTRO_FEATURES", "pt=
est", " features/gpio/mockup.scc features/gpio/sim.scc", "", d)}"
>  # libteam ptests from meta-oe needs it
>  KERNEL_FEATURES:append =3D " ${@bb.utils.contains("DISTRO_FEATURES", "pt=
est", " features/net/team/team.scc", "", d)}"
> +# openl2tp tests from meta-networking needs it
> +KERNEL_FEATURES:append =3D " ${@bb.utils.contains("DISTRO_FEATURES", "pt=
est", " cgl/cfg/net/l2tp.scc", "", d)}"
>  KERNEL_FEATURES:append:powerpc =3D" arch/powerpc/powerpc-debug.scc"
>  KERNEL_FEATURES:append:powerpc64 =3D" arch/powerpc/powerpc-debug.scc"
>  KERNEL_FEATURES:append:powerpc64le =3D" arch/powerpc/powerpc-debug.scc"



--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

