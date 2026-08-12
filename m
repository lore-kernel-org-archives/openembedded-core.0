Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFC18C5B572
	for <webhook@archiver.kernel.org>; Wed, 12 Aug 2026 13:26:45 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7877.1786541197865897710
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Aug 2026 06:26:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=sCGKdtgb;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2cacb8416a1so11860205ad.1
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Aug 2026 06:26:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786541197; cv=none;
        d=google.com; s=arc-20260327;
        b=SXhfk8mH2DP0h/Ui7tDB4J5yq6zzMZCtoQ81v6PZEDiACPimOmMVRtZZm1Wb4LkGXl
         G2SamrKRhtKU5E/wzPkHsL0/nme2hIoXFrp+KKuJEQ+mzULjdfXMuZBuRrKUg7MsDUi1
         DyxfQUlDSj9WZ84/b6jYuYq+yNmv53GKMMqeNkbBSDVNyu0wLxJfw8H07EZ8We/0MkLk
         qp4l+wpnC2T04Ma9ZZGdKLVzEGd/Y9dJt9aT+8fA6FkXozV9d2O0ioBFP8gUgcoa4iEp
         +U2q/qNeJISOD/9gS1hzhvskTNi77IHAOzfh6+puDpFfKUhm2FFb4z1f2payVvi6fhkw
         ujRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MMsyK7U6xlLEqTLwl8l1zLhuTKy+JldD2JrrWuIadGs=;
        fh=KmJ9CWdOf1GB8YbgsFle+CAv9+gZvQ2hZnHktgnxubE=;
        b=Plu2qyAGHpuCP2IoYtEF59WjLFuMN0ix9QVGD1BAdYWvHM1tTr/I6gg/PccaAWz5tl
         u3hG12Rx/pYuHpE26V1a3J+QhwfcDzo5BbfhIWTQ6JElLI++9/VB3rwtZ4sue150hkgi
         i2wVvLqcIUeypHyuGNBW0UQAX+dRkOFSs8mFgcD6mNCioUWBzXIGoo+62hJ+yq1wyd2P
         sRFKEtK+i/ycjgTtzfjX35L/rqq6nNsO2NCMYiC/loALI20754NyjMVYxM+uBZ7Sc3Wd
         pjtuQtcICPJJIYXvWyYSuaKZ2U8XcaDBK/JLEgNYOaL5+YoKXU4DcN/0qoNcHv4s/Tgv
         tMDA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786541197; x=1787145997; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MMsyK7U6xlLEqTLwl8l1zLhuTKy+JldD2JrrWuIadGs=;
        b=sCGKdtgbxf0J425oQKRLZsLUDwc5zaZHr9dq6fPV5mviaLTpOHWLlLeb+Mld6xy1yZ
         /wcTzH+REhNaQRRMY4wC97XP6xYsxFdk5bp75ZMK7+IDq+n/Z6Rag7ipXAhQcteMbHUq
         qd10J1EDdJI4hyEqoztmPQ2EX+SJ+rcmGlmGSPXolILIupt8ux6t8YH+ygxg39W3onmV
         kl6jgLuuZyIFCKGiLZnW0XiPpRN8iCQFDOY0fwOne/kK8u9Hog8PtWTlgxE5rk8J5inK
         kA4bgJV7xsDhJ+W8S/B0dZKmZpsW0mXNdVWhmmnEotv3Mr1n9p/Sz0MPBAPx7+1cCkI4
         nv+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786541197; x=1787145997;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MMsyK7U6xlLEqTLwl8l1zLhuTKy+JldD2JrrWuIadGs=;
        b=gT+w95Jme+ZOo7GKxvztVo2Yxuot9ailq55FAUUemRQ1lQazBFIJy24bjG7kC0cwrA
         TWMVSFsRL903beRy+MLE+Gr7prO4HqijMe2LtNgFfWISnklFc/JyTEkUusTRgghRw9vi
         x/3k2Cv1GBPFJSkQfKBfjbYC7ZgBqSLtKNLX/w2+dsXjy/oligUI1NNIlE7LmD+VIKZf
         jh6wdSUhinrzR5OtR5xaUj0emasRG3B0KQRYTnCJpT9DzMDNlt3Ol6PCGh+2X7pChLg6
         ZIIT3Li3Udw2J4zMAxsB6acsYkl1fkNTBOeNCfG+ja5hLYa/e44gzph0YE3QpUCk4ZXr
         OclA==
X-Gm-Message-State: AOJu0YyH1yF17RBIAGfAbg+VWnh70Kh6OSRvYdb2+pDHU0GvgaTHeBWW
	NONfPW64Jbk5Oh6oUSlRoEcGL5iD+xEIgIMYLf3Kdjx9QPKRfPa0qWCm0SQsxgNtt3uXsvG+6PZ
	e9win1c4SAlOulU9vJs1dkSqlIq2IfGE=
X-Gm-Gg: AR+sD13ynrpw6R2SohmWixI2cH3QWi6NRaCGOwZgs6687iO7DYgpLynDR4JpPass8KX
	wxppAyJBAWsWdpor/O/Zplax9K+4HQLCk1/LxHLfbqYrzVZJIps4HfgmBsgskMl+sYRoHdN9qIt
	RimMmOHUMjas0FoyKLMgtVJR1SiXq5U8z6I7ki1Ya1O3l5V+ceXvQEoEMl8jYHptENdw5ie4LQP
	YsQpI0JmLMcr9TOzY4fVX+C7mxMl+vpwBmPA1I36dPe3ouYYoIexeoepja/Art2IpAwLf/kFcKx
	hYVcO5Zkyp6uS0UnkJ0n6VZ3aBP34F/id0CQvkHAouzdaP2bJayzn/MKaFvYCHGIAy5JWTnbyHS
	ImzbWZqmU/vJ27+zTjKrOaf+HkNp6acn+3HD3VOQBtQzpyC4oXH6DlD+ATqYLSl4=
X-Received: by 2002:a17:903:1aab:b0:2cf:9344:b80c with SMTP id
 d9443c01a7336-2d3456cd849mr66052975ad.18.1786541196914; Wed, 12 Aug 2026
 06:26:36 -0700 (PDT)
MIME-Version: 1.0
References: <20260812130655.15109-1-anis.bougrine10@gmail.com>
In-Reply-To: <20260812130655.15109-1-anis.bougrine10@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 12 Aug 2026 09:26:23 -0400
X-Gm-Features: AUfX_mzsbo0NO3hn_0ASfY5ONO7g6g4D_xh0bICuMCrIWR8wpc8T-IZXZQ7LyHM
Message-ID: <CADkTA4MeK0aFZ8-TtybH6ZrfOnwfxKJNQmUc3TfF6E_B0BfGQw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] kernel.bbclass: add strip process for signed
 kernel modules
To: anis.bougrine10@gmail.com
Cc: openembedded-core@lists.openembedded.org, ross.burton@arm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Aug 2026 13:26:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243291

On Wed, Aug 12, 2026 at 9:07=E2=80=AFAM Anis Bougrine via
lists.openembedded.org
<anis.bougrine10=3Dgmail.com@lists.openembedded.org> wrote:
>
> Currently, signed kernel modules skip the stripping process in order
> to preserve the file contents after signing. See commit:
> 4c47e5f171fa2603355e2f9183065ce8137a18c7
>
> However, the kernel install Makefile supports stripping modules before
> signing them. This allows signed modules to be stripped while preserving
> a valid signature.
>
> Make non-signed kernel modules follow the standard Yocto stripping flow,
> while signed kernel modules use the kernel Makefile stripping flow.
>
> Fixes [YOCTO #12927]
>
> Reported-by: ross.burton@arm.com
> Signed-off-by: Anis Bougrine <anis.bougrine10@gmail.com>
> ---
>  meta/classes-recipe/kernel.bbclass | 16 +++++++++++++++-
>  1 file changed, 15 insertions(+), 1 deletion(-)
>
> diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/ker=
nel.bbclass
> index a82bdf7ecb..0d8d370e9d 100644
> --- a/meta/classes-recipe/kernel.bbclass
> +++ b/meta/classes-recipe/kernel.bbclass
> @@ -453,7 +453,21 @@ kernel_do_install() {
>         #
>         unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE
>         if (grep -q -i -e '^CONFIG_MODULES=3Dy$' .config); then
> -               oe_runmake DEPMOD=3Decho MODLIB=3D${D}${nonarch_base_libd=
ir}/modules/${KERNEL_VERSION} INSTALL_FW_PATH=3D${D}${firmwaredir} modules_=
install
> +               # If the module will be auto-signed, perform stripping be=
fore signing.
> +               if grep -q '^CONFIG_MODULE_SIG=3Dy$' .config && grep -q '=
^CONFIG_MODULE_SIG_ALL=3Dy$' .config; then
> +                       oe_runmake \
> +                               INSTALL_MOD_STRIP=3D"--strip-debug --remo=
ve-section=3D.comment --remove-section=3D.note --preserve-dates" \
> +                               DEPMOD=3Decho \
> +                               MODLIB=3D${D}${nonarch_base_libdir}/modul=
es/${KERNEL_VERSION} \
> +                               INSTALL_FW_PATH=3D${D}${nonarch_base_libd=
ir}/firmware \
> +                               modules_install
> +               else
> +                       oe_runmake \
> +                               DEPMOD=3Decho \
> +                               MODLIB=3D${D}${nonarch_base_libdir}/modul=
es/${KERNEL_VERSION} \
> +                               INSTALL_FW_PATH=3D${D}${nonarch_base_libd=
ir}/firmware \
> +                               modules_install

Am I misreading the patch (it has been known to happen :)) ? is the
only differnece
between the two conditions the INSTALL_MOD_STRIP ? if so, why not just use =
a
variable and put $INSTALL_MOD_STRIP (or whatever) in the oe_runmake line ?

Better to have the variable be conditional, than duplicating the
actual call to strip
the modules.

Bruce

> +               fi
>                 rm -f "${D}${nonarch_base_libdir}/modules/${KERNEL_VERSIO=
N}/build"
>                 rm -f "${D}${nonarch_base_libdir}/modules/${KERNEL_VERSIO=
N}/source"
>                 # Remove empty module directories to prevent QA issues
> --
> 2.50.1 (Apple Git-155)
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#243287): https://lists.openembedded.org/g/openembedde=
d-core/message/243287
> Mute This Topic: https://lists.openembedded.org/mt/120717114/1050810
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [br=
uce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

