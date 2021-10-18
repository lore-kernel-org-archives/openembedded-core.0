Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29D6BC433EF
	for <webhook@archiver.kernel.org>; Mon, 18 Oct 2021 14:45:57 +0000 (UTC)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com
 [209.85.222.46])
 by mx.groups.io with SMTP id smtpd.web12.37679.1634568356198101978
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Oct 2021 07:45:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=QIT8VF7B;
 spf=pass (domain: gmail.com, ip: 209.85.222.46,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f46.google.com with SMTP id r17so1776308uaf.8
        for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Oct 2021 07:45:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=iFk30OtXWPi7I18OOfXg9n44mJobVPJLUI39LKFZNSA=;
        b=QIT8VF7BiWVmyxxfk6kUWZtbUtafUmy6kcpqG9mDWsm0Rv/ao7pTA8BqbdSGiB9nnf
         gK0l6TK2owajRQ+HdmiMBroQs7TJCicvtvhaO31KNQn3LfC25DGPtauwGKFf7Ft1e7tr
         VIB63YSlWCCDvZCdfSM+Ug82Z57mzzwfGRocVtcY34ShBzJnrkqBp/3lP8cfKDSl8vj1
         r8Q3oAOE/X0OU043c+ZFCvtiQBGLROwLhQvbehtigTdEaCq6qmj6Fwx2KSewyGaMaznF
         2HiNgokeaNvgLICgOQzYun8Z4Bm6eCk8FfYnGpy/b/yljkakAfMn6OISPky6CWGC+7gr
         i6HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iFk30OtXWPi7I18OOfXg9n44mJobVPJLUI39LKFZNSA=;
        b=cldwCy/tNvaE8qaGnhbuoW/1tezC4KPGUCAvH5AvU6LdCqj64e87QKyVDSnyEDA650
         FCt/NbsgAywIerPZU2SSH9ZNbOOZHMKQMGmzMF/w82Wxnx+q/a/FACCc1R/mqZUYaB3a
         ib8e+uWwUyfoxjzfVaMuaPcsKcb0Hz8ExWeUzS/6r8UXB332jEJ/MKLmhN9xEihB7iQt
         gmGJNoSi8FD7VdpIqn4pJbyLBpOrgvJW6m+GJZzYiRkt4mwo4Yl/P2PAsVQylmo2VS6S
         ++mrQGKL0jWR7jqvhCLX+Ri0QZ1RLrA5S3SQTKYr/mTOoeP5gWCblMsTJjaVA2F2TRCs
         PHLw==
X-Gm-Message-State: AOAM533HjrUbymvaEcimDzqIlDokUff1IS7vzj4wQ51EivBEpXR2WZiq
	OuCl5rY3Lb43t491P/eTVgj+PFGNTs3LX1tT8no=
X-Google-Smtp-Source: 
 ABdhPJzYUiH/42lvrmb+aSAUJ6PADjsaLvA/UicE4DGVvMNAuQI6Y8BD79S5BUnlJGrnZXCiLCX/cbnI3FluLS1dSQQ=
X-Received: by 2002:ab0:3c93:: with SMTP id a19mr27273438uax.93.1634568355257;
 Mon, 18 Oct 2021 07:45:55 -0700 (PDT)
MIME-Version: 1.0
References: <20211018135322.246963-1-Martin.Jansa@gmail.com>
 <CANNYZj-A0eNR=GWz+-xdZQSxmWYNuU=0PGNQA-1d0w2tSp+NiA@mail.gmail.com>
 <CA+chaQf06t-OSB-x321YRUcWTTuooP=E4o1a0C+asiJJmQzn4g@mail.gmail.com>
 <CANNYZj_7uKo5qJSqVq0gfc2yjeiEW=oLh3Xvkk+JXb0bkGAQiA@mail.gmail.com>
 <CA+chaQe8qS+GrVA5+hYUH_aSrQKFLssOrg1BzLM-fC4gjXUs+g@mail.gmail.com>
 <CANNYZj_-scmARFF6BmDU-fpG3-me+AfyDyCtrt-0V9f4_-e5vQ@mail.gmail.com>
 <CA+chaQc3Y-yrP45-uYBLNMPigXzGtmZPWThMzRHvsTx2SoU7Fg@mail.gmail.com>
In-Reply-To: 
 <CA+chaQc3Y-yrP45-uYBLNMPigXzGtmZPWThMzRHvsTx2SoU7Fg@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 18 Oct 2021 16:45:43 +0200
Message-ID: 
 <CANNYZj8JsSFxV8AyRvYWN7zfLGroW3XSnu3FgxXOHmrmbthqng@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] webkitgtk: add PACKAGECONFIG for opengl-or-es
To: Martin Jansa <martin.jansa@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000002d231e05cea19af7"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Oct 2021 14:45:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157075

--0000000000002d231e05cea19af7
Content-Type: text/plain; charset="UTF-8"

On Mon, 18 Oct 2021 at 16:38, Martin Jansa <martin.jansa@gmail.com> wrote:

>
>> I do test all my upgrades on the AB. For major ones like python or
>> openssl, I run meta-oe builds too.
>>
>> If the AB gives a green pass (which it did), then the upgrade works as
>> intended. If you think AB is not doing enough testing, find the gaps in the
>> AB matrix and address them.
>>
>
>  nodistro build with default oe-core setup obviously isn't covered by AB.
>

nodistro core-image-sato build is there, but not world. Sato doesn't
include webkit:

http://git.yoctoproject.org/cgit/cgit.cgi/yocto-autobuilder-helper/tree/config.json#n234

Alex

--0000000000002d231e05cea19af7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Mon, 18 Oct 2021 at 16:38, Martin Jansa &lt;<a href=3D"mailto:mar=
tin.jansa@gmail.com">martin.jansa@gmail.com</a>&gt; wrote:<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div class=3D"g=
mail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"l=
tr"><div dir=3D"ltr"><br><div class=3D"gmail_quote">I do test all my upgrad=
es on the AB. For major ones like python or openssl, I run meta-oe builds t=
oo.<br></div><div class=3D"gmail_quote"><br></div><div class=3D"gmail_quote=
">If the AB gives a green pass (which it did), then the upgrade works as in=
tended. If you think AB is not doing enough testing, find the gaps in the A=
B matrix and address them.</div></div></div></blockquote><div><br></div><di=
v>=C2=A0nodistro build with default oe-core setup obviously isn&#39;t cover=
ed by AB.</div></div></div></blockquote><div><br></div><div>nodistro core-i=
mage-sato build is there, but not world. Sato doesn&#39;t include webkit:<b=
r></div><div><br></div><div><a href=3D"http://git.yoctoproject.org/cgit/cgi=
t.cgi/yocto-autobuilder-helper/tree/config.json#n234">http://git.yoctoproje=
ct.org/cgit/cgit.cgi/yocto-autobuilder-helper/tree/config.json#n234</a></di=
v><div><br></div><div></div><div>Alex<br></div><div> <br></div></div></div>

--0000000000002d231e05cea19af7--

