Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7111FEB64DD
	for <webhook@archiver.kernel.org>; Tue,  1 Aug 2023 10:10:39 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web10.9203.1690884633568291031
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Aug 2023 03:10:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=mjMvP5rF;
 spf=pass (domain: gmail.com, ip: 209.85.167.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-4fe21e7f3d1so6081562e87.3
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Aug 2023 03:10:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690884632; x=1691489432;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RcYb/USu3Ug6riUtcvYWZeF7Mckn/mQBwIdsybcRwAM=;
        b=mjMvP5rFt17DcoS69f3JKhQLk+uwZh9yFnTN5ceOAbwzkCKUZ/zMKka99oron8CWeI
         EGJtV5qtZGighpeX96knU68yPMG36pf2LmKoy2pAvpKf6NUEHuVOoDhjQdsPFyF+UK58
         JvLMndOkNacdArz24Gqjw7sRCArMkutRQyNzB5O0bK25SMyuIue9yqA/+hNcR5ZAvHag
         9nESB26BNtHVbpufHtTb1K5GvreRnBxwEDhHAjMeyuKThNyI3cpDE3+6dn5jaCFz6DEN
         HWBKjTbNCK4BrhPiJaHP0KuvMGybtb6sC/qqVNvyfCt0tjwvzXsJb1gg8cBddaE/QWrW
         //rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690884632; x=1691489432;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RcYb/USu3Ug6riUtcvYWZeF7Mckn/mQBwIdsybcRwAM=;
        b=kMA3HPlc+2R9Yf3538vZpE/49vBbyLZZxxhYu/IHv8UDKKw41dPA/FsCBjsuXWwu/u
         3ZMQyqSIEZ29fmJggz5jd7u8QX5FoftBztrYYT7UDOlw5GNUVEFsZODQQU+mn7Y8iGK8
         MJVK6Yli2S+a6j2IcV47V7m8yPfs4DflwN5/93375dj0F5BeZSoOymNd9xe1hp1a2lyi
         rC7G7co3Zoz1dtT6wiWi+eA1pv1R6RZ6c3eXakhsNwuhiU/a7zzTlaqMvsSHXdZRon/x
         RzrAyw+yTBBnIdPGncQgnKr5UHuWdmcf3VgzLg5ef+T4w4vCohGICDhjTKnbCwLlrW4i
         sZ/Q==
X-Gm-Message-State: ABy/qLbZNSLr9/0NYqWSclTza3/WqRiaB3s0lHkW423RFFu10SNnDW7j
	Mdjvb9SU450eMdYNgfJhAaB6OzCTuA0O+9fDqXnQctrkd1Q=
X-Google-Smtp-Source: APBJJlGDu5WpH9JBp34v7hpUrgiN5xpVwbfgfeEYqPwqfcweCOh1fK0RXagu+0bC4H3lhvdU76NuzNwnYFtXNwgLT/8=
X-Received: by 2002:a19:4f18:0:b0:4fe:af1:c3ae with SMTP id
 d24-20020a194f18000000b004fe0af1c3aemr1762457lfb.15.1690884631573; Tue, 01
 Aug 2023 03:10:31 -0700 (PDT)
MIME-Version: 1.0
References: <20230731215310.3949441-1-charlie.johnston@ni.com> <20230731215310.3949441-6-charlie.johnston@ni.com>
In-Reply-To: <20230731215310.3949441-6-charlie.johnston@ni.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 1 Aug 2023 12:10:19 +0200
Message-ID: <CANNYZj8fG0GSM3rFJHEBKwrXd3qYfMV1ZCkyjBfWe-7KXinT6Q@mail.gmail.com>
Subject: Re: [oe-core][RFC PATCH v2 5/6] packagefeed.bbclass: Add new bbclass
 for building feeds.
To: Charlie Johnston <charlie.johnston@ni.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Aug 2023 10:10:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185233

This does need to be tested, and it does need examples. Can you rework
create_rpm_index() from meta/classes-recipe/testimage.bbclass to use
this class instead of package-index?

Alex

On Mon, 31 Jul 2023 at 23:53, Charlie Johnston <charlie.johnston@ni.com> wrote:
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
>  meta/classes-recipe/packagefeed.bbclass     | 27 +++++++++++++++++++++
>  meta/classes-recipe/packagefeed_deb.bbclass |  8 ++++++
>  meta/classes-recipe/packagefeed_ipk.bbclass |  8 ++++++
>  meta/classes-recipe/packagefeed_rpm.bbclass |  8 ++++++
>  4 files changed, 51 insertions(+)
>  create mode 100644 meta/classes-recipe/packagefeed.bbclass
>  create mode 100644 meta/classes-recipe/packagefeed_deb.bbclass
>  create mode 100644 meta/classes-recipe/packagefeed_ipk.bbclass
>  create mode 100644 meta/classes-recipe/packagefeed_rpm.bbclass
>
> diff --git a/meta/classes-recipe/packagefeed.bbclass b/meta/classes-recipe/packagefeed.bbclass
> new file mode 100644
> index 0000000000..04b45e7723
> --- /dev/null
> +++ b/meta/classes-recipe/packagefeed.bbclass
> @@ -0,0 +1,27 @@
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
> +    pn = d.getVar("PN")
> +    generate_feed_dirs(d, pn, d.getVar("FEED_DEPENDS"))
> +    generate_index_files(d, pn)
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
> View/Reply Online (#185179): https://lists.openembedded.org/g/openembedded-core/message/185179
> Mute This Topic: https://lists.openembedded.org/mt/100471807/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

