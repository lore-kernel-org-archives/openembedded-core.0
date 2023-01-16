Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F5A4C46467
	for <webhook@archiver.kernel.org>; Mon, 16 Jan 2023 11:01:37 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web10.163803.1673866892945227216
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Jan 2023 03:01:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=BmzCTtHh;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f41.google.com with SMTP id q10so7765678wrs.2
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Jan 2023 03:01:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CMyWWQYJOs2nVEZO67skwlPdk3S+RF2182ym4s0SS54=;
        b=BmzCTtHhpi6b63F0HkI7e2jxok4guUyyyKAlhLcYevDzysi50uK0u/8wApEFgm9k4O
         Fv1IHe+Zs6MrQjUrP0X1qovOIi+78+ey6JDwQL3LIKQ6SGZ20o0syxWoWtUGLHTqmHE/
         0jX5vjd/eS0SCmvaLy/qBk83dM7+MkrpZUODc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CMyWWQYJOs2nVEZO67skwlPdk3S+RF2182ym4s0SS54=;
        b=myGnqBfS2gapBSitTUCGWatIjP8ReXQJYteT/O0t7xK+y0aegQLj1Q2ewP/CPXX0u0
         FTydIC0Kf2FjiWClkmIjrwP7vrz8V1azXeBv9rTP3F+WPMflJa3n0Vc+40h0FF2YHQda
         2QS83TPXPfL6UIi5SCpFBfYrks88bQ3NyC8aB+nStdbhY8jnPf9EYe1KZqYHSfRLJ0ra
         OfJhHLzA0T/+NRkqQzUVNfjrgxp/lRcgb05OeT8BoifWjVeHzJI3+g6bJNAgXbSYsuNU
         UXzD5i7jf3W9EptTYFHSj+weTG15+jX24AF3QiXmO7hAcDF5yVh29wlZQzXLPdgcczp1
         J3LQ==
X-Gm-Message-State: AFqh2kqRcARW2SdCekaxkUvyjetgnJzASmhzJUd1RAKCa0DCKbRyjmDM
	pLK323yiABZ1DFW7SzKvxoX2bQ==
X-Google-Smtp-Source: AMrXdXuU5MvjkxRX1rbtEAV7bIdBTrwyyEKkcVRqQA9MQFoSMwfcdvDFF3CaLZMMEyEI11/wukJ2xg==
X-Received: by 2002:adf:e5ce:0:b0:2bd:e8e7:8580 with SMTP id a14-20020adfe5ce000000b002bde8e78580mr7568013wrn.2.1673866891409;
        Mon, 16 Jan 2023 03:01:31 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:2a31:564c:3393:642? ([2001:8b0:aba:5f3c:2a31:564c:3393:642])
        by smtp.gmail.com with ESMTPSA id j3-20020adfff83000000b002bddc1ac273sm9122533wrr.87.2023.01.16.03.01.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jan 2023 03:01:31 -0800 (PST)
Message-ID: <b982ed0c230158f65a58c3714a308ab6dfb6f5ae.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] classes: decode output data to text
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>, 
	openembedded-core@lists.openembedded.org
Date: Mon, 16 Jan 2023 11:01:30 +0000
In-Reply-To: <20221222103829.55230-1-pzalewski@thegoodpenguin.co.uk>
References: <20221222103829.55230-1-pzalewski@thegoodpenguin.co.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Jan 2023 11:01:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175972

On Thu, 2022-12-22 at 10:38 +0000, Pawel Zalewski wrote:
> The default return value from subprocess.check_output is an encoded byte.
> The applied fix will decode the value to a string.
>=20
> Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
> ---
>  meta/classes/fs-uuid.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/classes/fs-uuid.bbclass b/meta/classes/fs-uuid.bbclass
> index 9b53dfba7a..731ea575bd 100644
> --- a/meta/classes/fs-uuid.bbclass
> +++ b/meta/classes/fs-uuid.bbclass
> @@ -4,7 +4,7 @@
>  def get_rootfs_uuid(d):
>      import subprocess
>      rootfs =3D d.getVar('ROOTFS')
> -    output =3D subprocess.check_output(['tune2fs', '-l', rootfs])
> +    output =3D subprocess.check_output(['tune2fs', '-l', rootfs], text=
=3DTrue)
>      for line in output.split('\n'):
>          if line.startswith('Filesystem UUID:'):
>              uuid =3D line.split()[-1]

You mentioned running into this on kirkstone. One problem is that
text=3DTrue is python 3.7 syntax so whilst this is fine for master,
kirkstone supports older versions of python.=20

Cheers,

Richard

