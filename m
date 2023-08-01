Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BBFAC001DF
	for <webhook@archiver.kernel.org>; Tue,  1 Aug 2023 10:25:29 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
 by mx.groups.io with SMTP id smtpd.web10.9442.1690885521148143602
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Aug 2023 03:25:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=CgQJ/uYE;
 spf=pass (domain: gmail.com, ip: 209.85.208.170, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2b9338e4695so82057331fa.2
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Aug 2023 03:25:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690885519; x=1691490319;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pzCdX8aCbJ2G5xyZZM0TFV8Lc1qHF6dw18NGWlYvBws=;
        b=CgQJ/uYE8ZG/W18tTzN52zTBZ+J+BGDKAuvhgAYog5erpT0VneChdoVDAdYorS+dZP
         IDxmYTXvzEyC5RyZ/vb86tHCdGvD05f3JNzZ5lOsUvyE3MgNrjbCXgbzXlxQCn+jFGv0
         wfMyvLamTTTjiFEpEAyxHykVuDAk9WOM6Yf/faeCKjS1E7was8bjv6ICfx1/Evh2n+Pb
         KPZVkWtfx0Y/MG7G/TLa6Cs/tzxLUg67tCxv23O5IrVWm1qHTuXOUamFr9wjvJ+2FvLV
         mb6Hcc64HdqbbuSK206gMR5t9/BHaWwAMpld+1FB96BJ73UCGfqr4unt/omOcaClKG9N
         4lQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690885519; x=1691490319;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pzCdX8aCbJ2G5xyZZM0TFV8Lc1qHF6dw18NGWlYvBws=;
        b=ffw6xqqgT77H9hi5p6QxpIB/jAZDb3ilHdVvyBGqTew+x8jxHoHDICVZeaf1s+2d5+
         D2KEnrOTHnG3q2UcXtvT7YoZIT8Hon0TAD14TmOkT33ZyLqZU94hwK9Lj727yJnz0B0v
         uwiCDxHXnaojJjXL8MzJqsWt7IUFl1nFoaFb4ok/wAeFptkxaNHNu9ATVSXeBFuAazgn
         VtNt26CzLPkmFgCB9H7AlhRRls0WLnwDoqW41+Cw86+SX5yWWiKyipx/yCfxuwBVBv3a
         /QZHO77IGd8jgCaFFbFptbxroMJtkIAdY6F8r1VwJKxAilnmHF5HL+vv7j6HLlFQenD6
         A2ng==
X-Gm-Message-State: ABy/qLbu6/QQO/5DArYoT7mhuonzVty1j6n2IxZW8hEUVjIgtCMe3pi3
	EGMCWAsq5r49QUZSGFVfo76I8KzVkvDqeIGaIbQ=
X-Google-Smtp-Source: APBJJlGaNgY6l8EOPGAI3NfEDbKADsp/cbH1XhWqTIxyeacWxnb/oVlaG805s48MI6DQS5OY4Uj4ggL9SuV4aLjlLRY=
X-Received: by 2002:a2e:a306:0:b0:2b5:9778:7ce2 with SMTP id
 l6-20020a2ea306000000b002b597787ce2mr2114198lje.15.1690885519072; Tue, 01 Aug
 2023 03:25:19 -0700 (PDT)
MIME-Version: 1.0
References: <20230731215310.3949441-1-charlie.johnston@ni.com> <20230731215310.3949441-2-charlie.johnston@ni.com>
In-Reply-To: <20230731215310.3949441-2-charlie.johnston@ni.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 1 Aug 2023 12:25:07 +0200
Message-ID: <CANNYZj-Q0FD=1Bvczk=m9HhLBBk+Sfzx0TFQQci0+n=wOfOBZg@mail.gmail.com>
Subject: Re: [oe-core][RFC PATCH v2 1/6] bitbake.conf: Add new DEPLOY_DIR_FEED variables.
To: Charlie Johnston <charlie.johnston@ni.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Aug 2023 10:25:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185235

As these directories will be written into by multiple recipes that use
the packagefeed class, won't they race and step on each other? Should
there be a ${PN} in these definitions?

Alex

On Mon, 31 Jul 2023 at 23:53, Charlie Johnston <charlie.johnston@ni.com> wrote:
>
> This change adds a new variable that defines where
> feeds should be created when building a packagefeed.
> A feed location for each package type is also added
> to allow multiple package type feeds to be created
> in parallel.
>
> The location is ${DEPLOY_DIR}/feeds/<pkg_type>
>
> Signed-off-by: Charlie Johnston <charlie.johnston@ni.com>
> ---
>  meta/conf/bitbake.conf | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 8daaaad615..fd1738069f 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -450,6 +450,10 @@ DEPLOY_DIR_RPM = "${DEPLOY_DIR}/rpm"
>  DEPLOY_DIR_DEB = "${DEPLOY_DIR}/deb"
>  DEPLOY_DIR_IMAGE ?= "${DEPLOY_DIR}/images/${MACHINE}"
>  DEPLOY_DIR_TOOLS = "${DEPLOY_DIR}/tools"
> +DEPLOY_DIR_FEED ?= "${DEPLOY_DIR}/feeds/"
> +DEPLOY_DIR_FEED_IPK = "${DEPLOY_DIR_FEED}/ipk"
> +DEPLOY_DIR_FEED_RPM = "${DEPLOY_DIR_FEED}/rpm"
> +DEPLOY_DIR_FEED_DEB = "${DEPLOY_DIR_FEED}/deb"
>
>  PKGDATA_DIR = "${TMPDIR}/pkgdata/${MACHINE}"
>  PKGDATA_DIR_SDK = "${TMPDIR}/pkgdata/${SDK_SYS}"
> --
> 2.41.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#185175): https://lists.openembedded.org/g/openembedded-core/message/185175
> Mute This Topic: https://lists.openembedded.org/mt/100471799/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

