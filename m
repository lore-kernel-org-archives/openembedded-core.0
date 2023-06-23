Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2305EB64D7
	for <webhook@archiver.kernel.org>; Fri, 23 Jun 2023 11:07:54 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web10.39361.1687518466192830147
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Jun 2023 04:07:46 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=bO3YeMeg;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-3f9c532f9e3so6664665e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 23 Jun 2023 04:07:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1687518464; x=1690110464;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=WgRBh6AoOOY+A7XTAaq+QEF873D8T1bMvY8ywd6wb0I=;
        b=bO3YeMeg2wdTWu7YtnnGtwlGm5ZIrvjZC7sR3/XCVOlyK00hdTj9dLYdYtvETBMcxd
         +26zQOTkyGDFb9cPIrDunEKKfM4BGBOE0kHaWxt32Qot8OqljIPJt9TShh1n70BG9B5Y
         aYxfCTApYnVHyI64TzXpBVGAT7de0GT1ge1FI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687518464; x=1690110464;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WgRBh6AoOOY+A7XTAaq+QEF873D8T1bMvY8ywd6wb0I=;
        b=eRtAku1jlDrn/mAWGSCvEq2vfJ+RfsQn9O0ogncss25pWqSP+TdSymOWB7eEN9BFst
         QhWjDW46smj8XU/6MizgjGY6SGlOkig7TQBb10LnfuV7Y25ByMjiW7llvIk2oe33QkiH
         2z81zwndXnABiYFl/9nOoeY6zBHmet3nIBcyDP88j5bBkmy4TKJBy7o00gi/blMd/sYt
         itIBULQ8oXEIA/sAgz2XKsm74diSiltj+W7jVDy+fEzQ3i/6pBpgmXbrO8EVRC96KtA2
         S+O4RWLY/QyAdX1W45hP/pfYBe8uY9hapDgX0R3TPgyfYaK2VSZb2YEg2RyT0kkydGrA
         GJzA==
X-Gm-Message-State: AC+VfDzallnekCLMjTMhXKxn3WurFIaLhjwEFxxGbBi3U8ozUmYZ/f9N
	TiI3pDyWbq6VRyMKlxAfEXqBmA==
X-Google-Smtp-Source: ACHHUZ6Vs3pIFcY5w8+DLFks0CRBm+1VYEx9bJzzp4MKA7yMjFFIQZwxwwDcDvbPRJDPVvDcszq5xg==
X-Received: by 2002:a7b:c045:0:b0:3f8:d0e7:dad8 with SMTP id u5-20020a7bc045000000b003f8d0e7dad8mr17471757wmc.3.1687518464462;
        Fri, 23 Jun 2023 04:07:44 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:aeb7:8756:e8c1:1c97? ([2001:8b0:aba:5f3c:aeb7:8756:e8c1:1c97])
        by smtp.gmail.com with ESMTPSA id z18-20020a1c4c12000000b003f7361ca753sm2028453wmf.24.2023.06.23.04.07.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jun 2023 04:07:44 -0700 (PDT)
Message-ID: <674d0a964611cc1e5451318976f17a4a24cbca5a.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] kernel.bbclass: hoist up "unset S" bbfatal
 from kernel-yocto.bbclass to kernel.bbclass
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: luca.ceresoli@bootlin.com, openembedded-core@lists.openembedded.org
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 23 Jun 2023 12:07:43 +0100
In-Reply-To: <20230605141319.532136-1-luca.ceresoli@bootlin.com>
References: <20230605141319.532136-1-luca.ceresoli@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 Jun 2023 11:07:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183320

Hi Luca,

On Mon, 2023-06-05 at 16:13 +0200, Luca Ceresoli via lists.openembedded.org=
 wrote:
> From: Luca Ceresoli <luca.ceresoli@bootlin.com>
>=20
> Writing a simple recipe that inherits kernel.bbclass and downloads a kern=
el
> tarball (e.g. a mainline release from kernel.org) via http or ftp fails
> with either:
>=20
>   ERROR: linux-acme-6.3.3-r0 do_configure: oe_runmake failed
>   ...
>   | make: *** No rule to make target 'oldnoconfig'.  Stop.
>=20
> or (seen on a different setup, based on kirkstone):
>=20
>   ... do_populate_lic: QA Issue: ... LIC_FILES_CHKSUM points to an invali=
d file: .../work-shared/.../kernel-source/COPYING [license-checksum]
>=20
> This happens when not setting S in the recipe. In this case, kernel.bbcla=
ss
> sets it to ${STAGING_KERNEL_DIR}
> (${TMPDIR}/work-shared/${MACHINE}/kernel-source).  This means that in
> do_symlink_kernsrc(), the 'if s !=3D kernsrc' never triggers and thus the
> kernel tree will not me moved into work/shared, which results in an empty
> work-shared/.../kernel-source directory.
>=20
> When downloading a tarball it is usually not required to set S in recipes=
,
> so this is not obvious here and the error message does not point to the
> problem or its solution.
>=20
> There is such a check in kernel-yocto.bbclass though, so move it to
> kernel.bbclass so that also kernel recipes not based on kernel-yocto can
> benefit from it.
>=20
> The check is moved:
>=20
>  - from the beginning of do_kernel_checkout() in kernel-yocto
>  - to the end of do_symlink_kernsrc() in kernel.bbclass
>=20
> and since do_kernel_checkout is executed 'after do_symlink_kernsrc', the
> code flow does not change in a relevant way when using linux-yocto.
>=20
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
>  meta/classes-recipe/kernel-yocto.bbclass | 8 --------
>  meta/classes-recipe/kernel.bbclass       | 6 ++++++
>  2 files changed, 6 insertions(+), 8 deletions(-)
>=20
> diff --git a/meta/classes-recipe/kernel-yocto.bbclass b/meta/classes-reci=
pe/kernel-yocto.bbclass
> index 108b7e675212..ceb451b69969 100644
> --- a/meta/classes-recipe/kernel-yocto.bbclass
> +++ b/meta/classes-recipe/kernel-yocto.bbclass
> @@ -394,16 +394,8 @@ do_kernel_checkout() {
>  		# case: we have no git repository at all.=20
>  		# To support low bandwidth options for building the kernel, we'll just=
=20
>  		# convert the tree to a git repo and let the rest of the process work =
unchanged
> -	=09
> -		# if ${S} hasn't been set to the proper subdirectory a default of "lin=
ux" is=20
> -		# used, but we can't initialize that empty directory. So check it and =
throw a
> -		# clear error
> =20
>  	        cd ${S}
> -		if [ ! -f "Makefile" ]; then
> -			bberror "S is not set to the linux source directory. Check "
> -			bbfatal "the recipe and set S to the proper extracted subdirectory"
> -		fi
>  		rm -f .gitignore
>  		git init
>  		check_git_config
> diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/ker=
nel.bbclass
> index 9c8036f4df01..5ed4a2e03c72 100644
> --- a/meta/classes-recipe/kernel.bbclass
> +++ b/meta/classes-recipe/kernel.bbclass
> @@ -195,6 +195,12 @@ python do_symlink_kernsrc () {
>              import shutil
>              shutil.move(s, kernsrc)
>              os.symlink(kernsrc, s)
> +
> +    # When not using git, we cannot figure out automatically the extract=
ed
> +    # directory. So check it and throw a clear error.
> +    if not os.path.isdir(os.path.join(d.getVar("WORKDIR"), "git")) and \
> +       not os.path.exists(os.path.join(s, "Makefile")):
> +        bb.fatal("S is not set to the linux source directory. Check the =
recipe and set S to the proper extracted subdirectory.")
>  }
>  # do_patch is normally ordered before do_configure, but
>  # externalsrc.bbclass deletes do_patch, breaking the dependency of

Sorry this has taken a bit of time to get to.

We can't check for "git" as the workdir directory in this test as it
can be overridden in the fetcher. We'll need to find some other better
approach.=C2=A0Can't we just use ${S}/Makefile ?

Please also copy Bruce on these changes going forward.

Cheers,

Richard




