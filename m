Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A3A3C6FD1F
	for <webhook@archiver.kernel.org>; Sun, 12 Mar 2023 13:17:23 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
 by mx.groups.io with SMTP id smtpd.web11.65990.1678627033608756385
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Mar 2023 06:17:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=flCfl+w8;
 spf=pass (domain: gmail.com, ip: 209.85.208.182, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f182.google.com with SMTP id i20so9969191lja.11
        for <openembedded-core@lists.openembedded.org>; Sun, 12 Mar 2023 06:17:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678627032;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=l0Ka6QiEcaB+yn9/IY70WMGj76Om8KyfHz42vBtpqkk=;
        b=flCfl+w8TtIPcjKxdQUYe1jpWHzkA7MbAOnPpsDUkH4+yiXHMZ0cgA6YGh+5pOeK42
         4af4ccecm7kWzhpLkglAg4qvXbNjO/mKMHk+tRy8+14DUmY87HaDcGeoSoYxij0XhBNx
         1OkSc2xOFgo1p9Wd4Ygl0hqLXw3kho5o4MCy6/MqXwtbiyiz/w6EpUPJhkQZOuRLczsG
         nvJV/7wS08mBpi6m/7BvM0obfj1t+rRgcjNfeeAfIa6H3AFXHr9Z7+sZ/meNfPCaF7A3
         u/8ECi1gv4t1VXP0s+7n8ySooD+BXk5iv/iRKwzIrAQWd+5xT8YxuIctZj1qzwk/GvDG
         c6fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678627032;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l0Ka6QiEcaB+yn9/IY70WMGj76Om8KyfHz42vBtpqkk=;
        b=BXn4c9jA8UJXDKFGwNR8s2dD9msM9PjUcO5x+rB5dhTPzjoKLi4qwYB7nbn85lxg2c
         c6ceBdNkcvRsH5CXj7xkzoInQogBwU/92xyy9WZSjNyIKOYJbAdFFFKy76KV/b49DWKl
         jMpuE7LfyQnVv6Bll/osjsMX2F4V5mshEopbNqrv7XDQzEkqIV5ja5djIq6lFAiO2qVT
         +B/1NleKekD58HGHkiHDDxkusAd8YmeDAOVBGJ1GpwDu8hMs07LrznDK52MpoAeyPDRM
         u5gxhQkeBf9z3wtw3qyGHUzM/oZq/uv64mZQbDrW+qCrymve37X0UOW5HXw9bT2Ypykc
         AxAg==
X-Gm-Message-State: AO0yUKUTtOAUHSVZ3ukSn4AA1D5cCRNgeB6av2LUgI8xZS4kFBaJUUiO
	ctXr/AkYfyCV/Gr33WS13K4rCTRPNMtvfQVTjPI=
X-Google-Smtp-Source: AK7set+L4o4meTJ9k3ILdQPjY3s4WnX4T+li4e6VRR0XNHU63WG102/ZIZcTmfL5YUkvwbXvpQA2bbDfsGX0YEs0QAU=
X-Received: by 2002:a2e:aaa3:0:b0:295:a64f:9d50 with SMTP id
 bj35-20020a2eaaa3000000b00295a64f9d50mr9677131ljb.5.1678627031537; Sun, 12
 Mar 2023 06:17:11 -0700 (PDT)
MIME-Version: 1.0
References: <20230311224155.3442306-1-richard.purdie@linuxfoundation.org> <20230311224155.3442306-7-richard.purdie@linuxfoundation.org>
In-Reply-To: <20230311224155.3442306-7-richard.purdie@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sun, 12 Mar 2023 14:17:00 +0100
Message-ID: <CANNYZj9iktYo1a=+0zZTwnW1PqucFE9FJMrZaLj4ktEz88VCzQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 7/8] core-image-ptest: Switch to BBCLASSEXTEND
 parallel execution
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Mar 2023 13:17:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178385

Nice! Is there some other low(ish) hanging fruit for making a-full faster?

(one thing that springs to mind is more arm hardware; the one
available seems overloaded)

Alex

On Sat, 11 Mar 2023 at 23:42, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> Replace the two images where tests are run serially with an image
> per ptest in the form core-image-ptest-XXX using class extensions.
>
> The original two images are then replaced with dependencies on these
> images. This allows parallel execution of the tests.
>
> The downside to this approach is the parsing time of an image generating
> this number of class extensions is slow but making it easier to execute
> and collect test data should outweigh that.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  .../images/core-image-ptest-all.bb            | 29 ++++++--------
>  .../images/core-image-ptest-fast.bb           | 24 ++----------
>  meta/recipes-core/images/core-image-ptest.bb  | 39 +++++++++++++++++++
>  3 files changed, 53 insertions(+), 39 deletions(-)
>  create mode 100644 meta/recipes-core/images/core-image-ptest.bb
>
> diff --git a/meta/recipes-core/images/core-image-ptest-all.bb b/meta/recipes-core/images/core-image-ptest-all.bb
> index 1472451675e..1a3e979d7e3 100644
> --- a/meta/recipes-core/images/core-image-ptest-all.bb
> +++ b/meta/recipes-core/images/core-image-ptest-all.bb
> @@ -1,25 +1,18 @@
> -inherit features_check
> +DESCRIPTION = "Recipe to trigger execution of all ptest images."
> +HOMEPAGE = "https://www.yoctoproject.org/"
> +
> +LICENSE = "MIT"
> +
> +inherit features_check nopackages
>  REQUIRED_DISTRO_FEATURES = "ptest"
>
> -require core-image-minimal.bb
>  require conf/distro/include/ptest-packagelists.inc
>
> -DESCRIPTION += "Also includes ptest packages."
> -HOMEPAGE = "https://www.yoctoproject.org/"
> -
>  # Include the full set of ptests
> -IMAGE_INSTALL += "${PTESTS_FAST} ${PTESTS_SLOW}"
> -
> -# This image is sufficiently large (~1.8GB) that we need to be careful that it fits in a live
> -# image (which has a 4GB limit), so nullify the overhead factor (1.3x out of the
> -# box) and explicitly add just 1100MB.
> -# strace-ptest in particular needs more than 500MB
> -IMAGE_OVERHEAD_FACTOR = "1.0"
> -IMAGE_ROOTFS_EXTRA_SPACE = "1124288"
> +PTESTS = "${PTESTS_FAST} ${PTESTS_SLOW}"
>
> -# ptests need more memory than standard to avoid the OOM killer
> -# also lttng-tools needs /tmp that has at least 2G
> -QB_MEM = "-m 4096"
> +addtask do_testimage
> +do_testimage[noexec] = "1"
> +do_testimage[depends] = "${@' '.join(['core-image-ptest-'+x.replace('-ptest', '')+':do_testimage' for x in d.getVar('PTESTS').split()])}"
>
> -# Sadly at the moment the full set of ptests is not robust enough and sporadically fails in random places
> -PTEST_EXPECT_FAILURE = "1"
> +do_build[depends] = "${@' '.join(['core-image-ptest-'+x.replace('-ptest', '')+':do_build' for x in d.getVar('PTESTS').split()])}"
> diff --git a/meta/recipes-core/images/core-image-ptest-fast.bb b/meta/recipes-core/images/core-image-ptest-fast.bb
> index 40df274c4c1..e768afb302b 100644
> --- a/meta/recipes-core/images/core-image-ptest-fast.bb
> +++ b/meta/recipes-core/images/core-image-ptest-fast.bb
> @@ -1,24 +1,6 @@
> -inherit features_check
> -REQUIRED_DISTRO_FEATURES = "ptest"
> +require core-image-ptest-all.bb
>
> -require core-image-minimal.bb
> -require conf/distro/include/ptest-packagelists.inc
> +DESCRIPTION = "Recipe to trigger execution of all fast ptest images."
>
> -# Include only fast (< 30 sec) ptests
> -IMAGE_INSTALL += "${PTESTS_FAST}"
> +PTESTS = "${PTESTS_FAST}"
>
> -DESCRIPTION += "Also includes ptest packages with fast execution times to allow for more automated QA."
> -HOMEPAGE = "https://www.yoctoproject.org/"
> -
> -# This image is sufficiently large (~1.8GB) that it can't actually fit in a live
> -# image (which has a 4GB limit), so nullify the overhead factor (1.3x out of the
> -# box) and explicitly add just 1500MB.
> -# strace-ptest in particular needs more than 500MB
> -IMAGE_OVERHEAD_FACTOR = "1.0"
> -IMAGE_ROOTFS_EXTRA_SPACE = "1524288"
> -
> -# ptests need more memory than standard to avoid the OOM killer
> -QB_MEM = "-m 1024"
> -
> -# Sadly at the moment the fast set of ptests is not robust enough and sporadically fails in a couple of places
> -PTEST_EXPECT_FAILURE = "1"
> diff --git a/meta/recipes-core/images/core-image-ptest.bb b/meta/recipes-core/images/core-image-ptest.bb
> new file mode 100644
> index 00000000000..0c67943b057
> --- /dev/null
> +++ b/meta/recipes-core/images/core-image-ptest.bb
> @@ -0,0 +1,39 @@
> +inherit features_check
> +REQUIRED_DISTRO_FEATURES = "ptest"
> +
> +require core-image-minimal.bb
> +require conf/distro/include/ptest-packagelists.inc
> +
> +DESCRIPTION += "Also including the ${MCNAME} ptest package."
> +HOMEPAGE = "https://www.yoctoproject.org/"
> +
> +PTESTS = "${PTESTS_SLOW} ${PTESTS_FAST}"
> +
> +IMAGE_INSTALL:append = " ${MCNAME}-ptest openssh"
> +
> +BBCLASSEXTEND = "${@' '.join(['mcextend:'+x.replace('-ptest', '') for x in d.getVar('PTESTS').split()])}"
> +
> +# The image can sufficiently large (~1.8GB) that we need to be careful that it fits in a live
> +# image (which has a 4GB limit), so nullify the overhead factor (1.3x out of the
> +# box) and explicitly add up to 1500MB.
> +# strace-ptest in particular needs more than 500MB
> +IMAGE_OVERHEAD_FACTOR = "1.0"
> +IMAGE_ROOTFS_EXTRA_SPACE = "324288"
> +IMAGE_ROOTFS_EXTRA_SPACE:virtclass-mcextend-strace = "1024288"
> +IMAGE_ROOTFS_EXTRA_SPACE:virtclass-mcextend-lttng-tools = "1524288"
> +
> +# ptests need more memory than standard to avoid the OOM killer
> +QB_MEM = "-m 1024"
> +QB_MEM:virtclass-mcextend-lttng-tools = "-m 4096"
> +QB_MEM:virtclass-mcextend-python3-cryptography = "-m 4096"
> +
> +TEST_SUITES = "ping ssh parselogs ptest"
> +
> +# Sadly at the moment the full set of ptests is not robust enough and sporadically fails in random places
> +PTEST_EXPECT_FAILURE = "1"
> +
> +python () {
> +    if not d.getVar("MCNAME"):
> +        raise bb.parse.SkipRecipe("No class extension set")
> +}
> +
> --
> 2.38.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#178373): https://lists.openembedded.org/g/openembedded-core/message/178373
> Mute This Topic: https://lists.openembedded.org/mt/97550253/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

