Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4042BC433FE
	for <webhook@archiver.kernel.org>; Wed, 12 Oct 2022 07:47:07 +0000 (UTC)
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com [209.85.166.46])
 by mx.groups.io with SMTP id smtpd.web11.17675.1665560819425790377
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Oct 2022 00:46:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=C2QOAG2a;
 spf=pass (domain: gmail.com, ip: 209.85.166.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-io1-f46.google.com with SMTP id 137so8525435iou.9
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Oct 2022 00:46:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2ANxV4EWO4iZdh03E4TgyUg8fRUSvsDJ3fWTBJSANpo=;
        b=C2QOAG2ahjNdAxMgnT/4SbMNVjds824uVuKYfVdtF9TVRkg93vXAdME+Zh5jUk3PJz
         7oF8aUwpAEY51TFc8YgFtpIaQAeCyuE+9SU4oImg+mkZXi41bnvDsNxZaY6OxiLrdUsW
         CuQmdta386IpKrS2rW81UuL+nLxwi8x5/4W33JpgVWp73nRvWTGSmQgazkw7QdLiarLE
         ZZVLML7xj/h4MKFuq2Lwhm6FzN3yNNIPk3vfmbmE+af7IsL3j0atXOSGD+i5DUxMCnjU
         wKSDPWBsqEIf2ls5E4fIw8qE/zxxOhs0/ci2x1jbXQqkuj5W1LSBGbqaOCla38l7fBam
         VKkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2ANxV4EWO4iZdh03E4TgyUg8fRUSvsDJ3fWTBJSANpo=;
        b=OVYJgmoHWw4ru5TvhASnw7s0zKZogf5qQwFWLKKoAIjnVfa4+3Q5B1gtGI1LOL1nAy
         6UtJWjwqGtk/SdxxmM+vsOsCVe6O2awqqZ6ItFTPXJJdNMaEBHcEyPPktyVKgd4ckTg8
         YDcSScvUxY3hpXHpzzVwC5wYYcUMQ1disJVKOnL9cIQcTOQvNwfPVg/H0tf4xDAj6ehq
         hBAuaDuiVWq1mnEmD70Pl3FtAj+i97S4bHz9ZHGW7ebEoYX9VhG2btyLnl6t5ih5+bU/
         35BNZPmgD5wmWM2ycQHIfTHSJBrBrA4/ZrlM/tEKPJtthJh45Ck1vdaVZGwU9VRbFl7g
         0TkA==
X-Gm-Message-State: ACrzQf0Qj582G6B6VeF5w5ApHs6jPjs1e2epLCOvn+sqN6v/TN043cCa
	t3qiuNRUUkPcIrKbgtWnJq5DDpQxwxXdDQiGoa8=
X-Google-Smtp-Source: AMsMyM54Rypmwu2AQtXjs/fS3qwR4vfczsdj0uVoo38a7geTWmBVp6JvYQD845HVFzhc2THgrNor8WUeHN0kmjgzIW0=
X-Received: by 2002:a05:6638:14c3:b0:363:b026:9989 with SMTP id
 l3-20020a05663814c300b00363b0269989mr9134447jak.254.1665560818680; Wed, 12
 Oct 2022 00:46:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220929025056.2799287-1-liambeguin@gmail.com> <Y0Xl75mvvCkli/9d@shaak>
In-Reply-To: <Y0Xl75mvvCkli/9d@shaak>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 12 Oct 2022 09:46:46 +0200
Message-ID: <CANNYZj81k8JC1UEGCtujXJjvRgbBw+FBdRYp-qbQSS=i2Xsdtg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3] meson: make wrapper options sub-command specific
To: Liam Beguin <liambeguin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, alexandre.belloni@bootlin.com, 
	peter.kjellerstedt@axis.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Oct 2022 07:47:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171656

No one seems to have objections, it's that there is no explicit
confirmation that your patch (or anyone's) is in staging branches, and
integration is currently on pause for a couple weeks.

Alex

On Tue, 11 Oct 2022 at 23:53, Liam Beguin <liambeguin@gmail.com> wrote:
>
> Hi,
>
> On Wed, Sep 28, 2022 at 10:50:56PM -0400, Liam Beguin wrote:
> > The meson-wrapper adds setup options to facilitate cross-compilation.
> > The current options are exclusive to the setup sub-command and might
> > cause issues with other sub-commands.
> >
> > Update the wrapper to make options sub-command specific.
> >
> > Signed-off-by: Liam Beguin <liambeguin@gmail.com>
> > ---
> >  .../meson/meson/meson-wrapper                 | 21 +++++++++++++++----
> >  1 file changed, 17 insertions(+), 4 deletions(-)
>
> Any comments on this patch?
>
> Cheers,
> Liam
>
> > diff --git a/meta/recipes-devtools/meson/meson/meson-wrapper b/meta/recipes-devtools/meson/meson/meson-wrapper
> > index c62007f5077e..fca64a569299 100755
> > --- a/meta/recipes-devtools/meson/meson/meson-wrapper
> > +++ b/meta/recipes-devtools/meson/meson/meson-wrapper
> > @@ -5,7 +5,7 @@ if [ -z "$OECORE_NATIVE_SYSROOT" ]; then
> >  fi
> >
> >  if [ -z "$SSL_CERT_DIR" ]; then
> > -    export SSL_CERT_DIR="${OECORE_NATIVE_SYSROOT}/etc/ssl/certs/"
> > +    export SSL_CERT_DIR="$OECORE_NATIVE_SYSROOT/etc/ssl/certs/"
> >  fi
> >
> >  # If these are set to a cross-compile path, meson will get confused and try to
> > @@ -13,7 +13,20 @@ fi
> >  # config is already in meson.cross.
> >  unset CC CXX CPP LD AR NM STRIP
> >
> > +for arg in "$@"; do
> > +    case "$arg" in
> > +    -*) continue ;;
> > +    *) SUBCMD="$arg"; break ;;
> > +    esac
> > +done
> > +
> > +if [ "$SUBCMD" = "setup" ] || [ -d "$SUBCMD" ]; then
> > +    MESON_SUB_OPTS=" \
> > +        --cross-file="$OECORE_NATIVE_SYSROOT/usr/share/meson/${TARGET_PREFIX}meson.cross" \
> > +        --native-file="$OECORE_NATIVE_SYSROOT/usr/share/meson/meson.native" \
> > +        "
> > +fi
> > +
> >  exec "$OECORE_NATIVE_SYSROOT/usr/bin/meson.real" \
> > -     --cross-file "${OECORE_NATIVE_SYSROOT}/usr/share/meson/${TARGET_PREFIX}meson.cross" \
> > -     --native-file "${OECORE_NATIVE_SYSROOT}/usr/share/meson/meson.native" \
> > -     "$@"
> > +    "$@" \
> > +    $MESON_SUB_OPTS
> >
> > base-commit: a2659cc2bf5d3f1cedf5c52c3b45e0427d40732d
> > --
> > 2.37.1.223.g6a475b71f8c4
> >
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#171643): https://lists.openembedded.org/g/openembedded-core/message/171643
> Mute This Topic: https://lists.openembedded.org/mt/93987385/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

