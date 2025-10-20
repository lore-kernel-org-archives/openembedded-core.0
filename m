Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB5FCCCD19F
	for <webhook@archiver.kernel.org>; Mon, 20 Oct 2025 16:39:24 +0000 (UTC)
Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
 by mx.groups.io with SMTP id smtpd.web11.1983.1760978362366629530
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Oct 2025 09:39:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KH1ykd9T;
 spf=pass (domain: gmail.com, ip: 74.125.224.54, mailfrom: jpewhacker@gmail.com)
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-63e365693c8so1265330d50.3
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Oct 2025 09:39:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760978361; x=1761583161; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s/pG7Dl5GLWnQmTy3b0dUmsZDduXrhtwOuv5Akh11CI=;
        b=KH1ykd9TDMdEeDlCP61tcX1yKZmHXFcV6woibBE42/be80AgsZaBCXNn0nBR3+CCSY
         60vXBVkk0v7k3zOTlYhPc4qQylOeCcMnorI0Cg3L1TE6dkQ1G1Tb88b1BC+lt0/PmvN5
         GmK/8EKtOx702CVjxa6DeriWkyVXlj9Ttr47rcUE3KP9NOiz36lbpmN9XP/F7/Q8dKq4
         V+3yNTO4K6DTcW+COTBHVa6cXnnVPnHuxb2KK0Xt/+wPi8bQL0/66ppfO1VNG8ylhJlz
         B9Q3AMjW6K3aVlts8KJmEWa7gn0hGbS5ZrYkxRVuSrZs0OZTaoZGxcRpQwjhZCGodf6e
         3dKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760978361; x=1761583161;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s/pG7Dl5GLWnQmTy3b0dUmsZDduXrhtwOuv5Akh11CI=;
        b=qkKfWPlB4+k8xp2wH128LlnfYdAYJsjRrEKV1R4NcPb3vet4+C7489YGorNUYM4rVh
         VSojUeWPxor+CPIptjanzA1RG4/mzPuVzvSgv8yHuH3k9d/5RN7GPx2ZHkyuoi0cn4Pw
         a3lCwmgjKND/QEJLnu4GEx5XCtwWVAcaC3gKgAmntVtiSaYQnWI9XCZDbdkneIB1KdUu
         tEEIvv1NxuqOKfW41I6EWzecji3cMywitPf1h7eXxgLaDfKZhQS12+5cMVdSHA8uO8D2
         rvITuoyjvX7fwLw9e47W3vZ3GznwE6z1mFLiIJ4TILQOvYXrwdEB34g7xMisBnKPiXJE
         QyKg==
X-Gm-Message-State: AOJu0YwcHuPKf4tn0IuEzsfSQRZlF/cF5yYgkOSE73wVt0YZ9sou7aOG
	QJ20UikOOfb8hGUYsdJ8Z1b+WeZoTGrlwfRIsgJsE6VhDzanZfhyxBxtNGHJfE5WmMF9ngNGJT4
	vhLAJ2tiEPJo7kbe/4G27mLXmK5BhIc4=
X-Gm-Gg: ASbGncteRe34h8mQFSa4hldNl+PG6JVkBMQK1syeaD451YRbLKbQvWFHJVux5WCs3Cf
	1vKWjlytZAfD2XC/iOo+anuW2QXTVz+Tols8nz0YN75X9GQFbrVbWtS950SkgQWsmnp+D8DiV3v
	/5o+qZKW0P3vepQprnO1zJ5clZLmzzYEjxVNT5LMq3+TUZ1UJam8O6sOHjO/EvIHQLHxb6UaPb/
	VKCupspnoQLQKPe/gUBe9q83H5a5jgp5ej0lKsI/pL2mCYZrrZFttBcwTZ6n5aQh3JzyKfX3R5t
	OWBAiusXkg==
X-Google-Smtp-Source: AGHT+IG4n86UcX4nYU04tE2GdsY4DOLMEYk5jXjWsSdM0yBkhDiNYA8qMqRgQaGIxJueMxaGrJRwq0J7ykGnLV8PmpQ=
X-Received: by 2002:a53:c401:0:b0:63b:8ed2:f996 with SMTP id
 956f58d0204a3-63e161c6f44mr8891560d50.33.1760978361389; Mon, 20 Oct 2025
 09:39:21 -0700 (PDT)
MIME-Version: 1.0
References: <20251010094034.4107881-1-Maganuru.Jayasurya@windriver.com>
In-Reply-To: <20251010094034.4107881-1-Maganuru.Jayasurya@windriver.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Mon, 20 Oct 2025 10:39:09 -0600
X-Gm-Features: AS18NWD1ydMlLJJ6eiS2jYehetXrkZUUr-o17Lig3-hgsreDw3zOn7x3arWEvuI
Message-ID: <CAJdd5GZLv=TtpsEXPNTjcivptECw2sR0+zGvsMxm3NRozR1HZw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] populate_sdk_ext: include image SPDX tasks in
 locked signatures
To: maganuru.jayasurya@windriver.com
Cc: openembedded-core@lists.openembedded.org, Sundeep.Kokkonda@windriver.com, 
	SunilKumar.Dora@windriver.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Oct 2025 16:39:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225126

On Fri, Oct 10, 2025 at 3:41=E2=80=AFAM Jayasurya Maganuru via
lists.openembedded.org
<maganuru.jayasurya=3Dwindriver.com@lists.openembedded.org> wrote:
>
> From: Jayasurya Maganuru <Maganuru.Jayasurya@windriver.com>
>
> Fixes [YOCTO #15726]
> Fixes [YOCTO #15853]
>
> After the switch to SPDX 3.0, eSDK installation can fail with errors like=
:
>
>   gcc-source-1*:do_fetch attempted to execute unexpectedly
>   This is usually due to missing setscene tasks.
>
> This is caused by image-related SPDX tasks, such as do_create_image_sbom_=
spdx,
> being excluded from the locked signatures. Without these, the correspondi=
ng
> sstate-cache artifacts are missing during eSDK installation.
>
> Previously (under SPDX 2.2), these image SPDX/SBOM tasks were not
> dependencies of do_populate_sdk_ext task, so their sstate artifacts
>  were not required at install time.
>
> Fix:
> - do_create_image_sbom_spdx is added to do_sdk_depends[recrdeptask] to
>  ensure it is included in the eSDK build and corresponding sstate cache.
> - SDK_TARGETS (and multilib variants) are removed from the excluded targe=
t
>  list in prepare_locked_cache(), so their image SPDX/SBOM tasks are retai=
ned
> in locked-sigs.inc.
>
> With this fix, eSDK installs work without unexpected task runs, even
> for custom distros or "tar" images.
>
> Signed-off-by: Jayasurya Maganuru <Maganuru.Jayasurya@windriver.com>
> ---
>  meta/classes-recipe/populate_sdk_ext.bbclass | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
>
> diff --git a/meta/classes-recipe/populate_sdk_ext.bbclass b/meta/classes-=
recipe/populate_sdk_ext.bbclass
> index 36a3e9c836..769672ec80 100644
> --- a/meta/classes-recipe/populate_sdk_ext.bbclass
> +++ b/meta/classes-recipe/populate_sdk_ext.bbclass
> @@ -465,6 +465,15 @@ def prepare_locked_cache(d, baseoutpath, derivative,=
 conf_initpath):
>
>      # Filter the locked signatures file to just the sstate tasks we are =
interested in
>      excluded_targets =3D get_sdk_install_targets(d, images_only=3DTrue)
> +    sdk_targets =3D d.getVar('SDK_TARGETS')
> +    ext_sdk_target_set =3D set(multilib_pkg_extend(d, sdk_targets).split=
())
> +    excluded_set =3D set(excluded_targets.split())
> +
> +    # Ensure SDK_TARGETS and their image SPDX/SBOM tasks are included in=
 the locked signatures,
> +    # as they are required during eSDK installation.
> +    filtered_excluded_set =3D excluded_set - ext_sdk_target_set
> +    excluded_targets =3D ' '.join(filtered_excluded_set)
> +
>      sigfile =3D d.getVar('WORKDIR') + '/locked-sigs.inc'
>      lockedsigs_pruned =3D baseoutpath + '/conf/locked-sigs.inc'
>      #nativesdk-only sigfile to merge into locked-sigs.inc
> @@ -821,7 +830,7 @@ addtask sdk_depends
>  do_sdk_depends[dirs] =3D "${WORKDIR}"
>  do_sdk_depends[depends] =3D "${@get_ext_sdk_depends(d)} meta-extsdk-tool=
chain:do_populate_sysroot"
>  do_sdk_depends[recrdeptask] =3D "${@d.getVarFlag('do_populate_sdk', 'rec=
rdeptask', False)}"
> -do_sdk_depends[recrdeptask] +=3D "do_populate_lic do_package_qa do_popul=
ate_sysroot do_deploy ${SDK_RECRDEP_TASKS}"
> +do_sdk_depends[recrdeptask] +=3D "do_populate_lic do_package_qa do_popul=
ate_sysroot do_deploy do_create_image_sbom_spdx ${SDK_RECRDEP_TASKS}"

The SPDX dependencies are generally added in
creates-spdx-sdk-3.0.bbclass so as not to cause problems when SPDX is
disabled. Is it possible to add it there instead?

>  do_sdk_depends[rdepends] =3D "${@' '.join([x + ':do_package_write_${IMAG=
E_PKGTYPE} ' + x + ':do_packagedata' for x in d.getVar('TOOLCHAIN_HOST_TASK=
_ESDK').split()])}"
>
>  do_populate_sdk_ext[dirs] =3D "${@d.getVarFlag('do_populate_sdk', 'dirs'=
, False)}"
> --
> 2.49.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#224675): https://lists.openembedded.org/g/openembedde=
d-core/message/224675
> Mute This Topic: https://lists.openembedded.org/mt/115686400/3616693
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [JP=
EWhacker@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

