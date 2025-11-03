Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1ED25CCF9F8
	for <webhook@archiver.kernel.org>; Mon,  3 Nov 2025 17:46:45 +0000 (UTC)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3821.1762192003367307398
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Nov 2025 09:46:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WTwBtdH0;
 spf=pass (domain: gmail.com, ip: 209.85.128.182, mailfrom: jpewhacker@gmail.com)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-7817c2d909cso50958177b3.1
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Nov 2025 09:46:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762192002; x=1762796802; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vZgDUW0LdXG98Ghiit04rRYRCGY4KRuM9cGPpF12rUE=;
        b=WTwBtdH0P66Knq0j6spNewv4h5Sg24a3DoHPOIPSMVj6sfbK6z/xWXQW1eAho3tHm2
         X50vrBCSpTcVb1gerXd+pjmSWYloEK9gqpgs4sT1AMldpXktDPJD9ZJDZTrEzV9M/ncW
         eqhbYXrv+f+CiVLaCX4BlILZCFonVNBkMynLca0P+XwLLceFKPTnc0OHLfA8/WURcg7+
         QcVuNUUkZC3l9BVjwSLQSQz0n+9rg1TdFyTPqOgrEAYQmdhqF98xBG8A8Y+mWcRQoaMQ
         19N6CCBF525kiEGZjM3xut6TsTsjy8BcMgyCYTdQOIDgaXdeFoZMVs8AE4eudCukNzUc
         ZVsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762192002; x=1762796802;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vZgDUW0LdXG98Ghiit04rRYRCGY4KRuM9cGPpF12rUE=;
        b=SMt/jP8Retc9WXnIGli02bz+C7ZvURbAuzg/kafWitIYIlpZUatPr41RJF2xfbXPVb
         CcGRiU6f8iA5crM+CxpIJ6zP41ykC6Jx4G1VIsSIwNKjibRCqDVAzuH383nxue5GVG+4
         IQXnWnoK+fNwQtKB/CYBlLDWe0bxwCN66NLGxsmxrJJoVcs6BKnm4ZFCq3XN4uzhwINb
         DKdWWgQSKB6akISgr9EIJn72AMAWknsgObbQHbORnnRYAKktUcJEkRHVvkFZc6YjeWTv
         ngSrdqPSblquThUtjA+czs7VDYUWTn4e2SWwN6Na7eyn+yXmjDib2tJfzGYiUc2VbjQW
         zvoQ==
X-Gm-Message-State: AOJu0YwzY67TNllVtvLAgvZkkAD6hLmX8QW/babFuwJ7OGrs2yrfiCaP
	otKqfFeULr9h+73WRh1aFaQOs7LoU/0SRAgGtoYKCweShLn1S3TPgfFgr58pGKbWGKAHaNFaSs4
	Pd9mOxXLiGiBegxRbKkuuVYL9v3MJUNQ=
X-Gm-Gg: ASbGncv9G0e2r8gdcDPaWIMPxQ3mRlBIMmq90AOOKUutE+CHRo4SBruxG7kPziUtfDB
	3N+P7GCh5OpUoSlH5sru6FIomiMSBwDvOG5S9jUF/ux/dafA8QmJm39ssSapNMo1OjXk9AYp/rZ
	dS6EjmXoNWhhbM80TjywBKeIprBSdqPszKSNhFdIj/sKyB7oI9s5LVQj/bxj/jwu3sgetsJSO+t
	ewGinkw7As//8T+evMNWfXAwgMCh0r/XKTLVdG1qeqLTqQRV6Dn4Q+/qavxK4sLz5rPSAKuL/92
	q7E+mmy40w==
X-Google-Smtp-Source: AGHT+IF20BGkhdD0YjTTk7539y5xs7w1rCer1nreleXyML/73vTab1FQ32cN7dAU3SZwpZZBCGNv0OtXF44ileBstI0=
X-Received: by 2002:a05:690c:305:b0:786:6ea6:aeb4 with SMTP id
 00721157ae682-7866ea6b42emr94344807b3.62.1762192002325; Mon, 03 Nov 2025
 09:46:42 -0800 (PST)
MIME-Version: 1.0
References: <20251010094034.4107881-1-Maganuru.Jayasurya@windriver.com>
 <CAJdd5GZLv=TtpsEXPNTjcivptECw2sR0+zGvsMxm3NRozR1HZw@mail.gmail.com> <783b200b-f1df-40da-8f03-333b23369bd2@windriver.com>
In-Reply-To: <783b200b-f1df-40da-8f03-333b23369bd2@windriver.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Mon, 3 Nov 2025 10:46:30 -0700
X-Gm-Features: AWmQ_bkVBUVOi3w0OcCrkqTxLJPhuJclip9dStmvwGQmg97hGzHRVdGUiBj7CJI
Message-ID: <CAJdd5GY-JnUnRYjmR4X4yyxPUTamF039AZKU16+OmxJGwoLSqw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] populate_sdk_ext: include image SPDX tasks in
 locked signatures
To: Maganuru Jayasurya <Maganuru.Jayasurya@windriver.com>
Cc: openembedded-core@lists.openembedded.org, Sundeep.Kokkonda@windriver.com, 
	SunilKumar.Dora@windriver.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Nov 2025 17:46:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225685

On Wed, Oct 29, 2025 at 5:36=E2=80=AFAM Maganuru Jayasurya
<Maganuru.Jayasurya@windriver.com> wrote:
>
>
> On 20/10/2025 22:09, Joshua Watt wrote:
>
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender an=
d know the content is safe.
>
> On Fri, Oct 10, 2025 at 3:41=E2=80=AFAM Jayasurya Maganuru via
> lists.openembedded.org
> <maganuru.jayasurya=3Dwindriver.com@lists.openembedded.org> wrote:
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
>
> The SPDX dependencies are generally added in
> creates-spdx-sdk-3.0.bbclass so as not to cause problems when SPDX is
> disabled. Is it possible to add it there instead?
>
>
> Hi Joshua,
>
> Following your review, I=E2=80=99ve moved the logic to create-spdx-sdk-3.=
0.bbclass and sent V2.
> https://lists.openembedded.org/g/openembedded-core/message/225440
>
> While exploring create-spdx-image-3.0.bbclass, we could alternatively pla=
ce the do_create_image_sbom_spdx task like this:
>
> -addtask do_create_image_sbom_spdx after do_create_rootfs_spdx do_create_=
image_spdx before do_build
> +addtask do_create_image_sbom_spdx after do_create_rootfs_spdx do_create_=
image_spdx before do_build do_sdk_depends

Yes, this approach is preferred; I don't really like addtask in
multiple locations.

Thanks

>
> Do you think the current V2 approach is sufficient, or would this alterna=
te placement be preferable?
>
> Thanks,
> Jayasurya
>
>
>
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

