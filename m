Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11E29C77B7A
	for <webhook@archiver.kernel.org>; Mon, 12 Jun 2023 00:52:30 +0000 (UTC)
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
 by mx.groups.io with SMTP id smtpd.web10.48783.1686531148160215243
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Jun 2023 17:52:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=lEgtDusU;
 spf=pass (domain: gmail.com, ip: 209.85.161.50, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-55b3a245359so2498193eaf.2
        for <openembedded-core@lists.openembedded.org>; Sun, 11 Jun 2023 17:52:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686531147; x=1689123147;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=17BXdHu6uhDhi195yz02O2gZqenp0e9t+qkM4XNPG4Q=;
        b=lEgtDusU+u0QeUX5/5uJJLr8aCHnpiknTK3YxUacRGc3ZYw9BTFuWjSOhBuFH6BT6/
         sjwSKriAX5XP4H6KsemZygv7ytsvLdWyD/4NxzZs1a0rci5PbNaghDUxwV+6f826P1ql
         fpHFMDUWkE0vzpzgJmfn9ljvPX6TgBQ58hLwryOlIuVCxzdX/eEsCSMnFSjIw07G9V+E
         dDYdCnwd75Nfu+Tz8tehxRLNdR9kwea2EM8aJc57bnSN2/dmNimXGsZSBoEYm0vcKEsD
         S+6A18Xk6yFJO3CsNVqPGQb7TDtrX+AqR1GfdZNFJofxrJWQdj6jZ+JP5LX/MIbq1vUt
         j42g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686531147; x=1689123147;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=17BXdHu6uhDhi195yz02O2gZqenp0e9t+qkM4XNPG4Q=;
        b=E8sW3DfGdtfhHlaslZQ9w2tSuD9Ik39LReqO2uYE3Z/M1Hqwjl7E2tNLEUs5FZWuMy
         s+qD3z4/qf+nTExKb+sxZpguSBYNlF4lbHULhh6ZZ8zcBbKaO8DMD+uSheOIirfFT9u7
         tXhlgG1yd3YW6CRRq8Th60dMuIaNaIVUmEgR3m0UXSOs6wdK5ul+gkByqGNQnE54hTS4
         R1rNkZdjgzBQ2ttjUkIuush/DfSMJFuzBO+9YkdyGcVMlcd1PJDzcdPh24z8fV05zfeJ
         dHt8RrzuGVYFvO7QQlixyrZBq5k/ZDeya391kiLXgh+3RzWg1HOfCvtpeW7ShY0OqrDI
         Z86Q==
X-Gm-Message-State: AC+VfDz0qERNdRaaT71GWf29stsFh9Jsi81evFnlJpdrh+wWdKv8AGog
	mQdIQI9cOODseN68qCJOUpIQdbf8RSdtI5cj74Q=
X-Google-Smtp-Source: ACHHUZ5LXdbRmPXMfHheMnzWUCtAhU/Ew4p/U6rXf8k6GqjFuOyL+ctjwQlGxqjoSmoWlnW9uRGEt0y9o+R1/w1XRd4=
X-Received: by 2002:a4a:dc10:0:b0:558:b4cb:b18a with SMTP id
 p16-20020a4adc10000000b00558b4cbb18amr4497233oov.6.1686531147145; Sun, 11 Jun
 2023 17:52:27 -0700 (PDT)
MIME-Version: 1.0
References: <20230611225342.1994556-1-vince@underview.tech>
In-Reply-To: <20230611225342.1994556-1-vince@underview.tech>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 11 Jun 2023 17:52:01 -0700
Message-ID: <CAMKF1srpcJ+95QVBAJQq8G5--Xjt9rLD=pnpu+uQtSvg7UZA1g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] spirv-tools: fix base_libdir when usrmerge in DISTRO_FEATURES
To: Vincent Davis Jr <vince@underview.tech>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Jun 2023 00:52:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182643

On Sun, Jun 11, 2023 at 3:55=E2=80=AFPM Vincent Davis Jr <vince@underview.t=
ech> wrote:
>
> if usrmerge included in DISTRO_FEATURES base_libdir is set to
> "/usr/lib{64}" instead of "lib{64}". Build issues occur when
> building vulkan-validation-layers or any recipe that
> requires the output of spirv-tools (SPIRV-ToolsTarget.cmake).
>
> As INTERFACE_LINK_LIBRARIES cmake property value is set incorrectly.
> _IMPORT_PREFIX is already set to <recipes-sysroot>/usr
> if usrmerge included INTERFACE_LINK_LIBRARIES value would be
> <recipes-sysroot>/usr/usr/lib
>
> Leading to bellow error
>
> recipe-sysroot/usr/usr/lib', needed by 'layers/libVkLayer_khronos_validat=
ion.so',
> missing and no known rule to make it
>
> Solution:
>
> Remove "/usr/" from base_libdir string if present as base_libdir
> should only contain name of directory.
>
> Signed-off-by: Vincent Davis Jr <vince@underview.tech>
> ---
>  meta/recipes-graphics/spir/spirv-tools_1.3.243.0.bb | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-graphics/spir/spirv-tools_1.3.243.0.bb b/meta/r=
ecipes-graphics/spir/spirv-tools_1.3.243.0.bb
> index 21f9dd9650..dbfdbd4e0a 100644
> --- a/meta/recipes-graphics/spir/spirv-tools_1.3.243.0.bb
> +++ b/meta/recipes-graphics/spir/spirv-tools_1.3.243.0.bb
> @@ -28,11 +28,22 @@ EXTRA_OECMAKE +=3D "\
>      -DSPIRV_SKIP_TESTS=3DON \
>  "
>
> +# Removes "/usr/" from base_libdir if exist as
> +# it's already define in _IMPORT_PREFIX string
> +# leading to <recipes-sysroot>/usr/usr/lib not
> +# found as it doesn't exist.
> +def update_base_libdir(d):
> +    base_libdir=3Dd.getVar("base_libdir")
> +    if '/usr/' in base_libdir:
> +        return base_libdir.strip("/usr/")
> +    return base_libdir
> +

baselib variable exists already. Please try to use that instead.

>  do_install:append:class-target() {
> +    baselibdir=3D"${@update_base_libdir(d)}"
>      # Properly set _IMPORT_PREFIX in INTERFACE_LINK_LIBRARIES so that de=
pendent
>      # tools can find the right library
>      sed -i ${D}${libdir}/cmake/SPIRV-Tools/SPIRV-ToolsTarget.cmake \
> -        -e 's:INTERFACE_LINK_LIBRARIES.*$:INTERFACE_LINK_LIBRARIES "\$\{=
_IMPORT_PREFIX\}\${base_libdir}":'
> +        -e 's:INTERFACE_LINK_LIBRARIES.*$:INTERFACE_LINK_LIBRARIES "\$\{=
_IMPORT_PREFIX\}\${baselibdir}":'
>  }
>



>  # all the libraries are unversioned, so don't pack it on PN-dev
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#182641): https://lists.openembedded.org/g/openembedde=
d-core/message/182641
> Mute This Topic: https://lists.openembedded.org/mt/99472427/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

