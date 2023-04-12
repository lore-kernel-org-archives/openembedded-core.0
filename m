Return-Path: <jan.vermaete@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CA61C7619A
	for <webhook@archiver.kernel.org>; Wed, 12 Apr 2023 11:45:58 +0000 (UTC)
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
 by mx.groups.io with SMTP id smtpd.web10.40861.1681299957639103329
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Apr 2023 04:45:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=nFe782c3;
 spf=pass (domain: gmail.com, ip: 209.85.160.47, mailfrom: jan.vermaete@gmail.com)
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-1842e8a8825so13379586fac.13
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Apr 2023 04:45:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681299957;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hAU0Ta810mA7L2K1JCkymzEhmHCVcM8esMx2v1AiGdU=;
        b=nFe782c3jLw4ILLIX8oELSaq6sQ/lfYW4gta/amT851WUMlcM1YsZ34F11Uy1uwkCv
         UvIjT+yfAhbthvgI7jyyCj8DdHc4veQ0ipdRfTissBWao4yhW5RnZZAISAI+HOFysHa2
         DWUmZG0FFvbVLxcez4EeTxsRxGUgIoplcAkW2RTbtph8eJFNkLNYwIX1VMtsu2YmOzHQ
         bqeon+cU9KjFsEaBDsNopRgqgSpRo4H/IYvRZQfG+Hil9rmc/db0MfeYAS6kRZjOVkPr
         5bH8dV5hQCXGXy+FfZGmwMRK/7FuqbjqWQND3h64/yebrfMMXIAkuUBC94AtlXQTBLnQ
         4AUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681299957;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hAU0Ta810mA7L2K1JCkymzEhmHCVcM8esMx2v1AiGdU=;
        b=unq1/zSN6JFgCjf2mj2EVZyAR2GsIekBJ4kHvSeDHUC0UJJufqcecFNOP22mQBbju5
         dZVGbJ+Bi7SWZzMP24kpjr0QBSetrdZ/dkabDYLb6ibuBpVoDDpACTDKusvoXvf8LRRh
         U1j61PtkUkCY4AfJQ2/k49xSCSVlOql+2raJcLmsiY7Myu7cfU1IMGYBRr/7jl7Kl+wT
         wRpADcr3zDwbqdrQ7DF3l61DJ5djzH2XKDZjQxN2m8jT1VIaQcjvvKfmEONEBYp7BgKi
         HOA3VYyO7bBPJ58ZbUUVs6H8TrwPn7Vu+Jf8BcjZ/wFuH3ZxokAkvdsdnICTjXwwKqux
         N9mg==
X-Gm-Message-State: AAQBX9eNbPDg6Cfjoa3b5OwuS4BWMjF36Kyu2MRCKGvKW7Qp4oV7MqVT
	g8SvaxlGIor+XT9W2xLCp17zPDA0aPaBQKWx/TU=
X-Google-Smtp-Source: AKy350YUMTtUJ/BA/jB//7fGeH7fZxLG3rGwEgQRjuXczBIjL9ejGD0LIZczaJJKjSs+Weqk2OuWfNpxlFooNBW+8W4=
X-Received: by 2002:a05:6870:1114:b0:177:9150:e7ba with SMTP id
 20-20020a056870111400b001779150e7bamr6527597oaf.3.1681299956857; Wed, 12 Apr
 2023 04:45:56 -0700 (PDT)
MIME-Version: 1.0
References: <20230412101926.1135184-1-jan.vermaete@gmail.com> <9b8d0c0c-3893-d5d5-18af-8ffe2561e498@smile.fr>
In-Reply-To: <9b8d0c0c-3893-d5d5-18af-8ffe2561e498@smile.fr>
From: jan vermaete <jan.vermaete@gmail.com>
Date: Wed, 12 Apr 2023 13:45:46 +0200
Message-ID: <CABF_=yhq-53m331N2zP0hwZ6iw7WPQkRX2=2PgdG5uhGSvRC+g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] cve-update-nvd2-native: added the missing http import
To: Yoann Congal <yoann.congal@smile.fr>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Apr 2023 11:45:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179947

Hi,

I have no preference on how to fix it.
I intended to stay as close as possible to the code of Marta

Br.

On Wed, Apr 12, 2023 at 1:36=E2=80=AFPM Yoann Congal <yoann.congal@smile.fr=
> wrote:
>
> Hi,
>
> On 4/12/23 12:19, Jan Vermaete wrote:
> > Signed-off-by: Jan Vermaete <jan.vermaete@gmail.com>
> > ---
> >  meta/recipes-core/meta/cve-update-nvd2-native.bb | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/meta/recipes-core/meta/cve-update-nvd2-native.bb b/meta/re=
cipes-core/meta/cve-update-nvd2-native.bb
> > index 1c14481c21..2b585983ac 100644
> > --- a/meta/recipes-core/meta/cve-update-nvd2-native.bb
> > +++ b/meta/recipes-core/meta/cve-update-nvd2-native.bb
> > @@ -118,6 +118,7 @@ def nvd_request_next(url, api_key, args):
> >      import urllib.request
> >      import urllib.parse
> >      import gzip
> > +    import http
>
> If this is only for the "except http.client.IncompleteRead:" line 146[1],=
 wouldn't it be better to fix the catched exception to match what urllib ca=
n
>  throw or to remove the except block entirely?
>
> I've triggered the same error as you but chose to remove the except block=
 to get my code running.
>
> [1]: https://git.yoctoproject.org/poky/tree/meta/recipes-core/meta/cve-up=
date-nvd2-native.bb#n146
>
> >
> >      headers =3D {}
> >      if api_key:
>
> Regards,
> --
> Yoann Congal
> Smile ECS - Tech Expert
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#179946): https://lists.openembedded.org/g/openembedde=
d-core/message/179946
> Mute This Topic: https://lists.openembedded.org/mt/98216121/2167232
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ja=
n.vermaete@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
Jan Vermaete
=E2=80=9CSuccess is a self-correcting phenomenom.=E2=80=9D -- Gary Hamel

