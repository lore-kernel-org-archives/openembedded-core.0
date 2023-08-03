Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1672C001DF
	for <webhook@archiver.kernel.org>; Thu,  3 Aug 2023 07:19:16 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web11.9044.1691047149981650106
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Aug 2023 00:19:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=hAPDCY5H;
 spf=pass (domain: gmail.com, ip: 209.85.167.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-4fe10f0f4d1so1113625e87.0
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Aug 2023 00:19:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691047148; x=1691651948;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=41KCiCSuN9noHUPfF8H1c1u+jYZHrlrANybaPuygirA=;
        b=hAPDCY5H9tFFtc+wiTNVSe6S7pMeqNIR37oFzW+NWC7NSbjaYo5V0qQ4h429lv2IzY
         YbY+shnRLYhjPWWdHuaXwjtRkMbNCLGFqB+J5IwXuARyayC7lAhrWPBo1aRU1bpl/K3P
         FAEHNlaU/qJkUremQicbYpncCT3O9Zr+aBjKAE7Q65mYuMzGZMnbdpMxBCienNtPaWvY
         4skHRg0vtkEwyaQWSR87WdeU1/qBvMQS1JsGcSlc1PBHVp7nHczSsTt/tRgqZGzCTO1l
         vEEiAY4VPjws/9BUS/0geL91G4+y0NY/riQabyUlWztz8heILWbbBoKDccZ186Mlqdrz
         JcBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691047148; x=1691651948;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=41KCiCSuN9noHUPfF8H1c1u+jYZHrlrANybaPuygirA=;
        b=fiRjHct7puedT5LahNuIsQJIWNU5nJ2KllprUGwVViNOJhPb+HRkVgugx3z71sQDN6
         9lv0hw87gicH2yzNl28r36T7KBUtEKvokGWJiaPla1nhqRZaTF3Q2SFE+SYgTXU/qpVt
         wTFy3TM8SoyjkvkYLPr1/sQN1TjQbkT8g9Ys0VvN/pPfVDhEaSQF3r9JrJXkEOlGR08C
         DkQAoqv/HfeIOeIZuy/oENATITPI+BCzEcf3Pptg3nGwSPVgyytUs61pustkHzT+LJ1Z
         8LJ/tSdXW6rJWe2uYYsa10v5sjp33pk6YgTk6B0cpCfbwgszRVs0WYbI5tInaSHZrHYW
         E+yw==
X-Gm-Message-State: ABy/qLa2Ct1pJVzTgSAkN1L8TKIhDeY5PXyLcZsbdBTGBJvLk2k+49Ze
	UgYOfw+RbaINvI+wAUkOtpZr9aOmeArlzSZvhw8=
X-Google-Smtp-Source: APBJJlG51fUup/RkiG+sP+f4euNzOR6pZZ9ak88iBN9/G2cc+BVUBRYJws20xsMajLNLQRJJmNbiC7GNGhBR+LGlh+M=
X-Received: by 2002:ac2:5058:0:b0:4f6:3677:54e with SMTP id
 a24-20020ac25058000000b004f63677054emr6441887lfm.36.1691047147820; Thu, 03
 Aug 2023 00:19:07 -0700 (PDT)
MIME-Version: 1.0
References: <20230802214019.1068795-1-charlie.johnston@ni.com> <20230802214019.1068795-6-charlie.johnston@ni.com>
In-Reply-To: <20230802214019.1068795-6-charlie.johnston@ni.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 3 Aug 2023 09:18:56 +0200
Message-ID: <CANNYZj9djkn0bxvRnNyvwNwUrMx6hHuAPwSwD9QFOWhEUb-rAA@mail.gmail.com>
Subject: Re: [oe-core][PATCH 5/6] packagefeed.bbclass: Add new bbclass for
 building feeds.
To: Charlie Johnston <charlie.johnston@ni.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Aug 2023 07:19:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185459

Same comment as before:
This does need to be tested, and it does need examples. Can you rework
create_rpm_index() from meta/classes-recipe/testimage.bbclass to use
this class instead of package-index?

Alex

On Wed, 2 Aug 2023 at 23:40, Charlie Johnston <charlie.johnston@ni.com> wrote:
>
> Add a new bbclass that allows building a feed using the
> new oe.package_manager class. Additionally, there are
> packagefeed_<type> bbclasses to define package type
> specific configurations.
>
> The do_packagefeed task currently does no use SSTATE
> data and is set to always run via [nostamp] = "1".
>
> The variable FEED_DEPENDS is used to specify feeds that
> the packagefeed depends on and will be available
> side-by-side. This prevents duplicate packages in the
> two feeds.
>
> Signed-off-by: Charlie Johnston <charlie.johnston@ni.com>
> ---
>  meta/classes-recipe/packagefeed.bbclass     | 26 +++++++++++++++++++++
>  meta/classes-recipe/packagefeed_deb.bbclass |  8 +++++++
>  meta/classes-recipe/packagefeed_ipk.bbclass |  8 +++++++
>  meta/classes-recipe/packagefeed_rpm.bbclass |  8 +++++++
>  4 files changed, 50 insertions(+)
>  create mode 100644 meta/classes-recipe/packagefeed.bbclass
>  create mode 100644 meta/classes-recipe/packagefeed_deb.bbclass
>  create mode 100644 meta/classes-recipe/packagefeed_ipk.bbclass
>  create mode 100644 meta/classes-recipe/packagefeed_rpm.bbclass
>
> diff --git a/meta/classes-recipe/packagefeed.bbclass b/meta/classes-recipe/packagefeed.bbclass
> new file mode 100644
> index 0000000000..08df96f662
> --- /dev/null
> +++ b/meta/classes-recipe/packagefeed.bbclass
> @@ -0,0 +1,26 @@
> +#
> +# Copyright OpenEmbedded Contributors
> +#
> +# SPDX-License-Identifier: MIT
> +#
> +
> +PKGFEED_INHERITS = "${@' '.join(['packagefeed_' + x for x in d.getVar('PACKAGE_CLASSES').replace("package_", "").split()])}"
> +inherit ${PKGFEED_INHERITS} nopackages
> +
> +LICENSE ?= "MIT"
> +
> +# Feeds listed in FEED_DEPENDS and their dependencies will be excluded from the feed.
> +# This allows for side-by-side feeds without duplicate packages.
> +FEED_DEPENDS ??= ""
> +
> +fakeroot python do_packagefeed() {
> +    from oe.package_manager import generate_feed_dirs, generate_index_files
> +
> +    generate_feed_dirs(d, d.getVar("FEED_DEPENDS"))
> +    generate_index_files(d, isFeed=True)
> +}
> +addtask packagefeed before do_build
> +do_packagefeed[recrdeptask] += "do_package_qa"
> +do_packagefeed[nostamp] = "1"
> +do_packagefeed[rdepends] += "${@' '.join([x + ':do_packagefeed' for x in d.getVar('FEED_DEPENDS').split()])}"
> +do_packagefeed[cleandirs] += "${DEPLOY_DIR_FEED_DEB}/${PN} ${DEPLOY_DIR_FEED_IPK}/${PN} ${DEPLOY_DIR_FEED_RPM}/${PN}"
> diff --git a/meta/classes-recipe/packagefeed_deb.bbclass b/meta/classes-recipe/packagefeed_deb.bbclass
> new file mode 100644
> index 0000000000..2decc70a4f
> --- /dev/null
> +++ b/meta/classes-recipe/packagefeed_deb.bbclass
> @@ -0,0 +1,8 @@
> +#
> +# Copyright OpenEmbedded Contributors
> +#
> +# SPDX-License-Identifier: MIT
> +#
> +
> +do_packagefeed[depends] += "apt-native:do_populate_sysroot"
> +do_packagefeed[recrdeptask] += "do_package_write_deb"
> diff --git a/meta/classes-recipe/packagefeed_ipk.bbclass b/meta/classes-recipe/packagefeed_ipk.bbclass
> new file mode 100644
> index 0000000000..89d296200b
> --- /dev/null
> +++ b/meta/classes-recipe/packagefeed_ipk.bbclass
> @@ -0,0 +1,8 @@
> +#
> +# Copyright OpenEmbedded Contributors
> +#
> +# SPDX-License-Identifier: MIT
> +#
> +
> +do_packagefeed[depends] += "opkg-native:do_populate_sysroot opkg-utils-native:do_populate_sysroot"
> +do_packagefeed[recrdeptask] += "do_package_write_ipk"
> diff --git a/meta/classes-recipe/packagefeed_rpm.bbclass b/meta/classes-recipe/packagefeed_rpm.bbclass
> new file mode 100644
> index 0000000000..8ce37cc855
> --- /dev/null
> +++ b/meta/classes-recipe/packagefeed_rpm.bbclass
> @@ -0,0 +1,8 @@
> +#
> +# Copyright OpenEmbedded Contributors
> +#
> +# SPDX-License-Identifier: MIT
> +#
> +
> +do_packagefeed[depends] += "createrepo-c-native:do_populate_sysroot"
> +do_packagefeed[recrdeptask] += "do_package_write_rpm"
> --
> 2.41.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#185439): https://lists.openembedded.org/g/openembedded-core/message/185439
> Mute This Topic: https://lists.openembedded.org/mt/100515098/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

