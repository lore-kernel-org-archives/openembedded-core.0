Return-Path: <jstephan@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B384EB64D9
	for <webhook@archiver.kernel.org>; Thu,  6 Jul 2023 12:48:40 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web11.21346.1688647717032799403
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Jul 2023 05:48:37 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=Pv7MFfdA;
 spf=pass (domain: baylibre.com, ip: 209.85.221.50, mailfrom: jstephan@baylibre.com)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-307d58b3efbso548877f8f.0
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Jul 2023 05:48:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1688647715; x=1691239715;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=G7G4+ZdVutbjD3I/LeLjX9vhB28opwCz6IMideaiXNE=;
        b=Pv7MFfdAQDTqBtGmYa6sbIvZhl1NH25pcjJeJS9DmrSPzYEXMS0SspmBZ2j3MKGD4E
         Pu2qc1J0Mmw4YygjZxUBwzL+t9y0A7l4FF3CBH8CLdWvzvVmEC2Zuon414hDsY34SCIP
         MxEYM7FzZ7rZA9rdG7MCQKtJFpiK8Ap6MrswpRzyF1MqDFAnQ2q8XGX5x9Zgl/OOEd16
         OhwVgRv+9sIMzHcjoq2UNYZgzhLU8ToGDHG6zUZ0Vzx/Y/ACCiGtGYT/gAG+K6xu6Bul
         RtWYI+W+nyLDOLOx5CSRaw3ZIdn4s0AzjrYed9FP8sk8BSIiilSnGnD7a3pDg12hRHOS
         WQDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688647715; x=1691239715;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G7G4+ZdVutbjD3I/LeLjX9vhB28opwCz6IMideaiXNE=;
        b=B1UwmYSUpiyw6gCDPhkhxABVYTtJlR5FtM+sMzPE0UbWEH+rcMwSCqew0tcc5KzBCz
         F/jYQkPKN2Y53zDuG3d16bYX9vmXMDiXfh998RL0giMuKOAyEMwuHH5FGSnL9WrAqNXH
         qlIvRq+NRy0lgYp0LKjZzKBfZZXvoW1eLpgw/kqpVUxWo0JkNysNmNkoyLCEtrqifqgo
         KN+noahZ2x1QZq4ggdRAkRC0j9san6kq8yEePISVq7coSfYyW0HUluI7ltR5lyX7msUc
         TxTUKC5EuD2IdhLXsiKj4/5OkEx5L/BtcpSzOVdcL0/QwsWH3zoLw/xM4+xsCPT0J9//
         5Iqw==
X-Gm-Message-State: ABy/qLbjQTyYVNLmrzrOtPQp0DyyaS/6w9lW1yr5+AM+IFEq32Id9yEh
	QJfSif/AthJyaB9FJ7BYyi27mwf3FQcEwnxebYCD3w==
X-Google-Smtp-Source: APBJJlFnlGU8Ap64AMYo9rhiGHyp0OQ/IiZUTGPs1SUPEhFWCvTTz5I3c+cJ+7RXQMu77czAvhrE9A==
X-Received: by 2002:adf:f60c:0:b0:311:1aee:4e1d with SMTP id t12-20020adff60c000000b003111aee4e1dmr1351613wrp.33.1688647715415;
        Thu, 06 Jul 2023 05:48:35 -0700 (PDT)
Received: from localhost ([2a01:e0a:55f:21e0:9e19:4376:dea6:dbfa])
        by smtp.gmail.com with ESMTPSA id v18-20020a5d6792000000b003063a92bbf5sm1800282wru.70.2023.07.06.05.48.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jul 2023 05:48:35 -0700 (PDT)
Date: Thu, 6 Jul 2023 14:48:31 +0200
From: Julien Stephan <jstephan@baylibre.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH v3 1/2] less: switch to github URI
Message-ID: <vfbabgctr6i6zah37ctmlbu7e7bc6gmml5ttrdcaynb7nvwet2@lpfagv3gbnne>
References: <20230706120105.553140-1-jstephan@baylibre.com>
 <20230706120105.553140-2-jstephan@baylibre.com>
 <CANNYZj8AhEXqdQpSYZA4hJEcA2jzbeHcMp1OtkRzPXGKA7dp2A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANNYZj8AhEXqdQpSYZA4hJEcA2jzbeHcMp1OtkRzPXGKA7dp2A@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Jul 2023 12:48:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183937

On Thu, Jul 06, 2023 at 02:05:25PM +0200, Alexander Kanavin wrote:
> This is still a no. Please read the feedback.
>
> Alex

Hi Alex,

Sorry I did read your previous comment but I sent the v3 before answering to
you (I was going to answer right after but you were too fast)

I understand the issue but I was thinking of pushing a v3 to fix the 2
failing tests so we can have a fully working patch when ready to apply.
(I will also push a v4 to add more verbose output on error as suggested
by Ross).

Do you want me to update the Bug 15073 with a comment explaining the
situation and a link to the latest series? So one can eventually (maybe
me?) start from what I've done?

Best
Julien

>
> On Thu 6. Jul 2023 at 14.01, Julien Stephan <jstephan@baylibre.com> wrote:
>
> > as of today, release tarballs are fetched from [1] but the less test code
> > is not
> > bundled within these releases. A github issue has been opened asking for
> > maintainer to bundle it [2]
> >
> > In order to add ptest for less, switch to github URI. This commit can be
> > reverted
> > if release tarballs from [1] bundle the test code in the future.
> >
> > [YOCTO #15073]
> >
> > [1]: http://www.greenwoodsoftware.com/
> > [2]: https://github.com/gwsw/less/issues/344
> >
> > Signed-off-by: Julien Stephan <jstephan@baylibre.com>
> > ---
> >  meta/recipes-extended/less/less_633.bb | 17 ++++++++++++-----
> >  1 file changed, 12 insertions(+), 5 deletions(-)
> >
> > diff --git a/meta/recipes-extended/less/less_633.bb
> > b/meta/recipes-extended/less/less_633.bb
> > index 2defb5ccb7a..e6535d16a78 100644
> > --- a/meta/recipes-extended/less/less_633.bb
> > +++ b/meta/recipes-extended/less/less_633.bb
> > @@ -23,16 +23,23 @@ LICENSE = "GPL-3.0-or-later | BSD-2-Clause"
> >  LIC_FILES_CHKSUM = "file://COPYING;md5=1ebbd3e34237af26da5dc08a4e440464 \
> >                      file://LICENSE;md5=1b2446f5c8632bf63a97d7a49750e1c6 \
> >                      "
> > -DEPENDS = "ncurses"
> > +DEPENDS = "ncurses groff-native"
> >
> > -SRC_URI = "http://www.greenwoodsoftware.com/${BPN}/${BPN}-${PV}.tar.gz"
> > +SRC_URI = "git://github.com/gwsw/less.git;protocol=https;branch=master"
> > +SRCREV = "0d7ca880375bde651313f03f7115d26921b43722"
> >
> > -SRC_URI[sha256sum] =
> > "2f201d64b828b88af36dfe6cfdba3e0819ece2e446ebe6224813209aaefed04f"
> > -
> > -UPSTREAM_CHECK_URI = "http://www.greenwoodsoftware.com/less/download.html
> > "
> > +S = "${WORKDIR}/git"
> >
> >  inherit autotools update-alternatives
> >
> > +# According to the README of the project when getting code from git we
> > should run
> > +# the following command before running the configure script
> > +do_configure:prepend () {
> > +        cd ${S}
> > +        make -f Makefile.aut distfiles
> > +        cd -
> > +}
> > +
> >  do_install () {
> >          oe_runmake 'bindir=${D}${bindir}' 'mandir=${D}${mandir}' install
> >  }
> > --
> > 2.41.0
> >
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#183932):
> > https://lists.openembedded.org/g/openembedded-core/message/183932
> > Mute This Topic: https://lists.openembedded.org/mt/99984034/1686489
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> > alex.kanavin@gmail.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >
> >

