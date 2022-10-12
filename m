Return-Path: <liambeguin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1358C4332F
	for <webhook@archiver.kernel.org>; Wed, 12 Oct 2022 22:01:37 +0000 (UTC)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
 by mx.groups.io with SMTP id smtpd.web12.635.1665612090046302685
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Oct 2022 15:01:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=iCX7Xcm0;
 spf=pass (domain: gmail.com, ip: 209.85.219.41, mailfrom: liambeguin@gmail.com)
Received: by mail-qv1-f41.google.com with SMTP id df9so163071qvb.9
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Oct 2022 15:01:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tpTb8kEeYLgcJhaSTfQqWNxRgQ7RQf2/pcQwjvTj7i4=;
        b=iCX7Xcm0WKK4gk5TtBSeUq/z0tgefxBBnHSRKVvTnAdQzSX5qlYtfJw73IQtCVxwi1
         S1qAJxo8pHp1oKe0hvvsUSWadjpRD6p51FwRBb22drnBy4BAquMaCWLDa+Cd//QZhWi6
         Cuuz0cxuSvzCQigIg/f7qn8zcb1mwhs7C7/FqvDz4KLT05WHkFhZKB/jiQE/CfUdTIhV
         0xwTzxqvpG7JPySV/JdaM5e3aw0On3jmt8H1OytYP8tX/3dQzJwiltixA1ypOBWHkMat
         f1vi+Ed/nlXlDbmK9EopuAhXpAfAfeyr0UD737gLMWqOMRTiRGvg4rMule/WIfRDPSUD
         OCNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tpTb8kEeYLgcJhaSTfQqWNxRgQ7RQf2/pcQwjvTj7i4=;
        b=fYdh4njJdPsS3UqXPiowQkbd+Vr7g3YRNDcSmhmhdt4vktoUEFTAbC7PW/hGzkvSP8
         hJocCGZl4sCkE/bg8fxKdPF5st+hfUKUO6hr1LQZPE7iGI6alwkw6WxqF0WjarzYYFii
         9MldcyQQc0sbba3oXTaSGhM7ye87qfl1vfGMpLwafm/uH1aBxSR/Ze+OAALltu9xLo55
         ShfzZiDur0QIceTIdP0MCOA0tglqubqffutCUyn++x4eD+NmWuIne6ngemwDX/FzmBJw
         GrYiDJZeFhRa4Op6Vf+Z3Ile8HW+RAfN07ZVbatmx8TLkDkV+Cs3CTWFHDlq6gWKS09m
         Yr5Q==
X-Gm-Message-State: ACrzQf3uT4vs+tAepW0t/C3O3eI6Em7VFpddZJoNeknSgTbGKRtoZfWA
	PVVjabaPsnZoxEEj/zLwJj8=
X-Google-Smtp-Source: AMsMyM52TClFcGtwYc9X+nsjyVq2jQ2SV09FI8EHfoZKmDEUBp1cWZauHRzbvw4bcw4+09d7mAM01A==
X-Received: by 2002:a0c:e011:0:b0:4b1:70c3:79ec with SMTP id j17-20020a0ce011000000b004b170c379ecmr25113286qvk.28.1665612089006;
        Wed, 12 Oct 2022 15:01:29 -0700 (PDT)
Received: from shaak (modemcable055.92-163-184.mc.videotron.ca. [184.163.92.55])
        by smtp.gmail.com with ESMTPSA id u5-20020a05620a454500b006b640efe6dasm16371464qkp.132.2022.10.12.15.01.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Oct 2022 15:01:28 -0700 (PDT)
Date: Wed, 12 Oct 2022 18:01:26 -0400
From: Liam Beguin <liambeguin@gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, alexandre.belloni@bootlin.com,
	peter.kjellerstedt@axis.com
Subject: Re: [OE-core] [PATCH v3] meson: make wrapper options sub-command
 specific
Message-ID: <Y0c5Ngq/bCoi9KhY@shaak>
References: <20220929025056.2799287-1-liambeguin@gmail.com>
 <Y0Xl75mvvCkli/9d@shaak>
 <CANNYZj81k8JC1UEGCtujXJjvRgbBw+FBdRYp-qbQSS=i2Xsdtg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANNYZj81k8JC1UEGCtujXJjvRgbBw+FBdRYp-qbQSS=i2Xsdtg@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Oct 2022 22:01:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171676

Hi Alex,

On Wed, Oct 12, 2022 at 09:46:46AM +0200, Alexander Kanavin wrote:
> No one seems to have objections, it's that there is no explicit
> confirmation that your patch (or anyone's) is in staging branches, and
> integration is currently on pause for a couple weeks.

Understood, thanks for taking the time to explain.
I'll keep monitoring the tree.

Cheers,
Liam

> Alex
> 
> On Tue, 11 Oct 2022 at 23:53, Liam Beguin <liambeguin@gmail.com> wrote:
> >
> > Hi,
> >
> > On Wed, Sep 28, 2022 at 10:50:56PM -0400, Liam Beguin wrote:
> > > The meson-wrapper adds setup options to facilitate cross-compilation.
> > > The current options are exclusive to the setup sub-command and might
> > > cause issues with other sub-commands.
> > >
> > > Update the wrapper to make options sub-command specific.
> > >
> > > Signed-off-by: Liam Beguin <liambeguin@gmail.com>
> > > ---
> > >  .../meson/meson/meson-wrapper                 | 21 +++++++++++++++----
> > >  1 file changed, 17 insertions(+), 4 deletions(-)
> >
> > Any comments on this patch?
> >
> > Cheers,
> > Liam
> >
> > > diff --git a/meta/recipes-devtools/meson/meson/meson-wrapper b/meta/recipes-devtools/meson/meson/meson-wrapper
> > > index c62007f5077e..fca64a569299 100755
> > > --- a/meta/recipes-devtools/meson/meson/meson-wrapper
> > > +++ b/meta/recipes-devtools/meson/meson/meson-wrapper
> > > @@ -5,7 +5,7 @@ if [ -z "$OECORE_NATIVE_SYSROOT" ]; then
> > >  fi
> > >
> > >  if [ -z "$SSL_CERT_DIR" ]; then
> > > -    export SSL_CERT_DIR="${OECORE_NATIVE_SYSROOT}/etc/ssl/certs/"
> > > +    export SSL_CERT_DIR="$OECORE_NATIVE_SYSROOT/etc/ssl/certs/"
> > >  fi
> > >
> > >  # If these are set to a cross-compile path, meson will get confused and try to
> > > @@ -13,7 +13,20 @@ fi
> > >  # config is already in meson.cross.
> > >  unset CC CXX CPP LD AR NM STRIP
> > >
> > > +for arg in "$@"; do
> > > +    case "$arg" in
> > > +    -*) continue ;;
> > > +    *) SUBCMD="$arg"; break ;;
> > > +    esac
> > > +done
> > > +
> > > +if [ "$SUBCMD" = "setup" ] || [ -d "$SUBCMD" ]; then
> > > +    MESON_SUB_OPTS=" \
> > > +        --cross-file="$OECORE_NATIVE_SYSROOT/usr/share/meson/${TARGET_PREFIX}meson.cross" \
> > > +        --native-file="$OECORE_NATIVE_SYSROOT/usr/share/meson/meson.native" \
> > > +        "
> > > +fi
> > > +
> > >  exec "$OECORE_NATIVE_SYSROOT/usr/bin/meson.real" \
> > > -     --cross-file "${OECORE_NATIVE_SYSROOT}/usr/share/meson/${TARGET_PREFIX}meson.cross" \
> > > -     --native-file "${OECORE_NATIVE_SYSROOT}/usr/share/meson/meson.native" \
> > > -     "$@"
> > > +    "$@" \
> > > +    $MESON_SUB_OPTS
> > >
> > > base-commit: a2659cc2bf5d3f1cedf5c52c3b45e0427d40732d
> > > --
> > > 2.37.1.223.g6a475b71f8c4
> > >
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#171643): https://lists.openembedded.org/g/openembedded-core/message/171643
> > Mute This Topic: https://lists.openembedded.org/mt/93987385/1686489
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >

