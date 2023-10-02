Return-Path: <dse@thaumatec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2144DE784AC
	for <webhook@archiver.kernel.org>; Mon,  2 Oct 2023 13:25:03 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web10.81593.1696253101814147468
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Oct 2023 06:25:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@thaumatec-com.20230601.gappssmtp.com header.s=20230601 header.b=WKj5dQzZ;
 spf=pass (domain: thaumatec.com, ip: 209.85.214.181, mailfrom: dse@thaumatec.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1c7373cff01so20760525ad.1
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Oct 2023 06:25:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thaumatec-com.20230601.gappssmtp.com; s=20230601; t=1696253101; x=1696857901; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m7fxqsX7Zpba1Iu57g0oEC9pOn9p7F2GZafzlASFSzo=;
        b=WKj5dQzZS7+ypp4/6trfPEQbIh++L4D7EltXJv+lPgFcTii2AXOpDBml7JFdFbhd4n
         d0cc7YkMUUfeVqO7Tw26TDxegrimluKgCR9jJDs8upZfBjbIy1eQ/2NfNboKgHoYVwy7
         j/HfdX4IFy4eqqiqVaIr1ahdd6V6DE7I3KqP2Md33ju0QSi38iM6LNvG2N3Tc9aYJreD
         3PtZUWOxNPuKOdg/IStaE6Mn5FpvAG71Qwz7pGu6NEXSEFBN34J3ho7faAME2GM5/+T1
         BgtS1V9jstBJgHZa6/R9lGtj8Q5ZnFRpWxmQjgafBscokDkll+eSVGHGv++dyYl+0OEB
         dh3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696253101; x=1696857901;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m7fxqsX7Zpba1Iu57g0oEC9pOn9p7F2GZafzlASFSzo=;
        b=LwFlunmrvxjFswWTOR92vQExmLrzsRPELw10t8+KqI66Atis0NuU5S102mntvZ+UkY
         bENke8qNsq0Qr36wi3D3IbAZSDmdiB5Lo8kWcb9aqO8Sy0fLmUu5MSG5Q7fUROyfdYj7
         yqco53GnRhp1CbD/4cXn05kRqs1ylt9O6S+ox8FzMi09ZDtWRR4e4jT0lJ3Oth6tRTR3
         J3Hz69GsqtPwECI9RV1oXIOp8DYXYUstUh4elFN+Esek3HHWNweGUKKwHiEZqtwOzfQT
         HtSQQvtOr0Ex7O95RaNqYDGqWHvYcyCfz3brWPhiPZ2R5bNKKxG5ayVwJZLP3X9SfKuH
         ngnQ==
X-Gm-Message-State: AOJu0YySdlC5Bo6BzqVtMjtRNfGJkuccsd6J09/WPJnlel6BITldtmVv
	6UgJTOIDeag72PXSb7qxmNoWsWPsTk1N9qj5+8dsng==
X-Google-Smtp-Source: AGHT+IHVmzaIu6iPlUzdCD2uIY/pL5jLbZ4n5m9+vNTqfqMdNg/RZP+6HKUqA/8QXOgmoRHgj2NwnCeDWKUuwHtWarI=
X-Received: by 2002:a17:90a:d14a:b0:268:2af6:e48c with SMTP id
 t10-20020a17090ad14a00b002682af6e48cmr17962736pjw.4.1696253101170; Mon, 02
 Oct 2023 06:25:01 -0700 (PDT)
MIME-Version: 1.0
References: <20231002121936.133895-1-dse@thaumatec.com> <24e9ad263e69414d450bdaaede58b994a271b015.camel@linuxfoundation.org>
In-Reply-To: <24e9ad263e69414d450bdaaede58b994a271b015.camel@linuxfoundation.org>
From: Daniel Semkowicz <dse@thaumatec.com>
Date: Mon, 2 Oct 2023 15:24:50 +0200
Message-ID: <CAHgnY3nBZhaZP6Luts5HGqaheT-mbJapyKPhvYXqbW3pGWom=Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] wic: bootimg-partition: Allow root placeholder
 in custom config
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Oct 2023 13:25:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188606

Hello Richard,


On Mon, Oct 2, 2023 at 2:24=E2=80=AFPM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Mon, 2023-10-02 at 14:19 +0200, Daniel Semkowicz wrote:
> > Allow using `<<uuid-of-rootfs>>` placeholder in the custom configuratio=
n
> > file. This placeholder is then replaced with the actual UUID of the
> > root partition, generated during do_image_wic().
> >
> > This allows making use of dynamically generated partition UUID instead
> > of hard-coding it in the WKS file.
> >
> > For consistency, the same root device placeholder tag was used
> > as in the `fs-uuid.bbclass`.
> >
> > Signed-off-by: Daniel Semkowicz <dse@thaumatec.com>
> > ---
> >  scripts/lib/wic/engine.py                           | 10 ++++++++++
> >  scripts/lib/wic/plugins/source/bootimg-partition.py |  4 ++--
> >  2 files changed, 12 insertions(+), 2 deletions(-)
> >
> > diff --git a/scripts/lib/wic/engine.py b/scripts/lib/wic/engine.py
> > index 674ccfc244..c68e5adacb 100644
> > --- a/scripts/lib/wic/engine.py
> > +++ b/scripts/lib/wic/engine.py
> > @@ -626,3 +626,13 @@ def get_custom_config(boot_file):
> >          with open(cfg_file, "r") as f:
> >              config =3D f.read()
> >          return config
> > +
> > +def configure_custom_config(config, creator):
> > +    """
> > +    Replace placeholders in the configuration file with the actual val=
ues.
> > +    Does nothing if no placeholder is found.
> > +    """
> > +    rootdev_placeholder =3D '<<uuid-of-rootfs>>'
> > +    if rootdev_placeholder in config:
> > +        config =3D config.replace(rootdev_placeholder, creator.rootdev=
)
> > +    return config
> > diff --git a/scripts/lib/wic/plugins/source/bootimg-partition.py b/scri=
pts/lib/wic/plugins/source/bootimg-partition.py
> > index 58f6da72c3..969f99476b 100644
> > --- a/scripts/lib/wic/plugins/source/bootimg-partition.py
> > +++ b/scripts/lib/wic/plugins/source/bootimg-partition.py
> > @@ -19,7 +19,7 @@ import re
> >  from glob import glob
> >
> >  from wic import WicError
> > -from wic.engine import get_custom_config
> > +from wic.engine import get_custom_config, configure_custom_config
> >  from wic.pluginbase import SourcePlugin
> >  from wic.misc import exec_cmd, get_bitbake_var
> >
> > @@ -110,7 +110,7 @@ class BootimgPartitionPlugin(SourcePlugin):
> >              custom_cfg =3D get_custom_config(configfile)
> >              if custom_cfg:
> >                  # Use a custom configuration for extlinux.conf
> > -                extlinux_conf =3D custom_cfg
> > +                extlinux_conf =3D configure_custom_config(custom_cfg, =
cr)
> >                  logger.debug("Using custom configuration file "
> >                               "%s for extlinux.conf", configfile)
> >              else:
>
> Do we need to add a test case to "oe-selftest -r wic" for this?

This makes sense. I will push v2 with a test case.

>
> Cheers,
>
> Richard

Best regards
Daniel

