Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFCC3C77B7A
	for <webhook@archiver.kernel.org>; Mon, 17 Apr 2023 18:32:11 +0000 (UTC)
Received: from mail-il1-f178.google.com (mail-il1-f178.google.com [209.85.166.178])
 by mx.groups.io with SMTP id smtpd.web11.4300.1681756323593187991
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Apr 2023 11:32:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=nkVdRGlG;
 spf=pass (domain: gmail.com, ip: 209.85.166.178, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-il1-f178.google.com with SMTP id e9e14a558f8ab-32b1c8ff598so4740375ab.3
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Apr 2023 11:32:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681756323; x=1684348323;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o46QQYRhoCNZ4PducUzn+8qQ+8bFEjc1vXbgptMO8BE=;
        b=nkVdRGlG/WPTCEy5f3NcmCntDY2V/TA6S9Qhf4AOtUQ5i4O/GxscxFJCcL2V1l5rwW
         X8+irJ+XO+5tTMvkxfp/MeTYDTGWpHdRfFO6aBZyJ4ao0ceVNAPpLj/KZDDvUnFd0Cvb
         8z4N16yHQoViDrUC6GFsNVT95n47647YL4Lj/YwzMhoQMwy7Dy9ISdlc7VtdXa5ckzaU
         NaY5uDXyT257O38ME+GCmUVK/fkIzNFBUjiYVGaIJ2IHHFAWwKirTuShijqF4Hw0qF0h
         JCSOWVzViwivObeLFtoQL1HVyVCQHO6R3k6Wyabg9rhHoaBZRlzxW0bF8yc0f6B9S5iu
         OOiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681756323; x=1684348323;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o46QQYRhoCNZ4PducUzn+8qQ+8bFEjc1vXbgptMO8BE=;
        b=EKYdrB0uoMYaROWeD+Hffk2kEWT92cKBKSkspIzDkTYcGvJgOaQsPcYZqXT3Hw7vcZ
         tv9fXlw8rN89jJnCkhri3vLEzA3flBNQGSuntq6C2MvUpPwRxJgFp+9kU9s43CqXJUbg
         79WwfWjbz+QYHJdGYAZkHGYD8uH3O2ndMTTEcH0kw5bmBb03hmc6sWXldoZLJI6qhcZm
         /Rt3pU4xUw4Bh4chkmc2zSm5pWt7ITeHhcxh8dw9R63m8ybRDS0MN4cPWr46ZZl6dmmj
         cuedOYphLup+NDKkDVs7+ZQ+F8b1BIqS3AgWGo+NcnwqT2RjKK5LrLNspaYHnktDkELC
         dJZA==
X-Gm-Message-State: AAQBX9fFgxiOQe7vfuNQTGxjgGMWWKCEb+lE0bnETPrFTwFdbvrzuDeH
	0xVIhV1mdzMmnVBO/STJI0RvQ4xIHE9lkQTaMOI=
X-Google-Smtp-Source: AKy350Z5zK2ppdp0Yxat9HzqeIjOXndBUDg3lEB+CVVZdRZ6oZnZQCwqkPOcM+MdUalGRj2kRzOvFrzLkn2sNhXIVQ0=
X-Received: by 2002:a05:6e02:6c9:b0:328:7b75:a5fe with SMTP id
 p9-20020a056e0206c900b003287b75a5femr6843377ils.5.1681756322869; Mon, 17 Apr
 2023 11:32:02 -0700 (PDT)
MIME-Version: 1.0
References: <20230416103052.28268-1-christoph.lauer@email.de>
In-Reply-To: <20230416103052.28268-1-christoph.lauer@email.de>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 17 Apr 2023 14:31:51 -0400
Message-ID: <CADkTA4M5g793YQgJK9ABWWt35ukQKvp9yT0qT1HngqESaaULjQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] make-mod-scripts: preserve libraries when
 rm_work is used
To: Christoph Lauer <christoph.lauer@email.de>
Cc: openembedded-core@lists.openembedded.org, 
	Christoph Lauer <christoph.lauer@xtronic.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Apr 2023 18:32:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180166

On Sun, Apr 16, 2023 at 6:31=E2=80=AFAM Christoph Lauer
<christoph.lauer@email.de> wrote:
>
> From: Christoph Lauer <christoph.lauer@xtronic.de>
>
> With rm_work active, external module signing throws an error:
> scripts/sign-file: error while loading shared libraries: libcrypto.so.3: =
cannot open shared object file: No such file or directory
> Preserve libraries that sign-file script needs during runtime.
>

We are by design installing the output of the scripts target to the
staging kernel build dir.

If there's some part of the build and install that isn't going to the
shared location, then we should be making sure it goes to that shared
location (and is cleaned with the rest of the artifacts).

Users of those same scripts need to be able to locate and load the
artifacts from the staging kernel build dir, but that's
solvable/preferable.

If you've tried the above and it doesn't work, it would be useful to
capture that in the commit log.

Bruce

> Signed-off-by: Christoph Lauer <christoph.lauer@xtronic.de>
> ---
>  meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb=
 b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
> index 28e0807d1d..0e24efc597 100644
> --- a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
> +++ b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
> @@ -32,3 +32,6 @@ do_configure() {
>                 -C ${STAGING_KERNEL_DIR} O=3D${STAGING_KERNEL_BUILDDIR} $=
t
>         done
>  }
> +
> +# keep native libraries required for module signing
> +RM_WORK_EXCLUDE_ITEMS +=3D "recipe-sysroot-native"
> --
> 2.17.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#180113): https://lists.openembedded.org/g/openembedde=
d-core/message/180113
> Mute This Topic: https://lists.openembedded.org/mt/98296212/1050810
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [br=
uce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

