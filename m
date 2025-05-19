Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25FEEC2D0CD
	for <webhook@archiver.kernel.org>; Mon, 19 May 2025 15:48:55 +0000 (UTC)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
 by mx.groups.io with SMTP id smtpd.web10.54635.1747669731473459756
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 May 2025 08:48:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=1VZvXUtz;
 spf=softfail (domain: sakoman.com, ip: 209.85.128.169, mailfrom: steve@sakoman.com)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-70b4e497d96so41209887b3.2
        for <openembedded-core@lists.openembedded.org>; Mon, 19 May 2025 08:48:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1747669730; x=1748274530; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+73/IlZ/bRwpftr+JJ2jCBGcW5DC8H7Q4LsYLQcpyhQ=;
        b=1VZvXUtz77rwWhjthbDAFbtWdVb0a2Fk/L9115G83yAn6KMn7huVnKMBEWt/BuojyN
         ol0CV3E/PHKd8Dk0mwB3XV8McaPkEFdbvS8QpVs686UbRyZxz+gKWX52P+odGKqN62iF
         +rf4WXJtbRoxUGEqFlGLRB6xfndTef9t3ctak9c3JxIYLzXush/AA7B+k7zvoJT1J+vM
         Z7JcUMJdRmUg3YfJxJqSeOSaPBhAt95bTafMe+m7HsppaG5YD9igRZEQLUimJzJcu91l
         wanUUMBriLh04Q9RUWv0WON7nGa1TXqs7CDZVLE8QLzKe49xvYeLR6F9p/UgEJCtTWht
         7bGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747669730; x=1748274530;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+73/IlZ/bRwpftr+JJ2jCBGcW5DC8H7Q4LsYLQcpyhQ=;
        b=cRgbmL27W0my55rty2rzuk5YVFjXDCyvgvHfe1KbiMjv6N/QaRfPL5kgREatGNGeOn
         2UwzOnJyAgLp87b+BskadNBWr/gEqoDqqSwj16BAZRN4oQvR6goAi10OqjdWRdelaxOW
         1qZ/DSaFHIbjMUX+ONWwzG1c25oHmEngd8vseo91QUlVycOjYcwF1TkYS0W3c5joKBQ3
         98veDBsa0XU2uA7LzOsrs5ip2w9y0sLtdd8SWUUyGkjXIQ2SfUQElJyUp5TnEG143bOc
         6mPZ//XAf1rJSeABSI9WBrOS5YrEQRjSpPo2KX8GXxqnGZrOBJcceNV9QrER6nfyjtPb
         /bsg==
X-Gm-Message-State: AOJu0Yx7sNxAw+NheAsK4WFlAjHlyrASMdV/K5bIppw4zXnRQk5Ctyek
	HsCwpDphGhEoi8CTXU170LAXaZu7wsG+DtPnzVqO8E4vs5zTdZUYnlw0TJ096eeamHFa+8tAoth
	SVFbE92BfFQ5fQk6/d5ZnoHZqZp7nfSWGknsawxbltkdwC3ci2HTw
X-Gm-Gg: ASbGncv4DyUXQ5ZtcjRHrYjyzCvag5mtc+y4HZvSgVH/sF5Bc79QIi3KRO2MeK8fqvk
	qUtqmDo60NP5wDAgz5K1E+o+jjGJ1dAi690igJhu7uKBzW50Zgi1I0JJpo9tWBdXxdoM6f+0dx8
	TsWPpCFt1srkSHPmsx+HeGMyfVo6ITjW+R+u983ZhpF+R23/0GRtb7bQQ5i8n4Sp5m
X-Google-Smtp-Source: AGHT+IFe0LDicALqm7epuocXnXYJ4IDvamLPxx8VOrHHFaIkYrRQAXIowwEc6j2nwg2Or+3lV3aFIyiXiyVD/JYpnIE=
X-Received: by 2002:a05:690c:9b12:b0:709:1d50:87d with SMTP id
 00721157ae682-70ca7bade72mr194367567b3.34.1747669730509; Mon, 19 May 2025
 08:48:50 -0700 (PDT)
MIME-Version: 1.0
References: <20250519110649.35526-1-oliver.rohe@wago.com> <DB4PR08MB8102778287B8B1408AF455BB9E9CA@DB4PR08MB8102.eurprd08.prod.outlook.com>
In-Reply-To: <DB4PR08MB8102778287B8B1408AF455BB9E9CA@DB4PR08MB8102.eurprd08.prod.outlook.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Mon, 19 May 2025 08:48:39 -0700
X-Gm-Features: AX0GCFsk4jJ5uW--vd97KUNt3UqMkvI4-ls3UR-U8SjLrIix3fCBqA1A2643WGU
Message-ID: <CAOSpxdZAxDj4N+kohxF4Bmg_G_AshEYCzdV+9k_PTEN2wLfYRg@mail.gmail.com>
Subject: Re: [OE-core] [scarthgap] kernel-fitImage: allow overwrite the
 configuration dtb label
To: Oliver.Rohe@wago.com
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 May 2025 15:48:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216861

Does the master branch allow this?  I can't see a similar commit
there, so it would need to be submitted there first.

Since this is a new feature, there would need to be some discussion as
to whether this would be appropriate for stable branches.

Steve

On Mon, May 19, 2025 at 4:14=E2=80=AFAM Oliver ROHE via lists.openembedded.=
org
<Oliver.Rohe=3Dwago.com@lists.openembedded.org> wrote:
>
> This allows to provide a custom label for each dtb
> without having to overwrite the whole function.
>
> Signed-off-by: Oliver Rohe <oliver.rohe@wago.com>
> Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
> ---
>  meta/classes-recipe/kernel-fitimage.bbclass | 25 ++++++++++++++-------
>  1 file changed, 17 insertions(+), 8 deletions(-)
>
> diff --git a/meta/classes-recipe/kernel-fitimage.bbclass b/meta/classes-r=
ecipe/kernel-fitimage.bbclass
> index 4b74ddc201..53b5acb0fc 100644
> --- a/meta/classes-recipe/kernel-fitimage.bbclass
> +++ b/meta/classes-recipe/kernel-fitimage.bbclass
> @@ -382,6 +382,15 @@ symlink_points_below() {
>         echo "$realpath"
>  }
>
> +#
> +# Simple function to allow overwriting the configuration node label
> +#
> +# $1 ... DTB image name
> +fitimage_emit_section_config_dtb_label() {
> +       dtb_img=3D"$1"
> +       echo "${FIT_CONF_PREFIX}${dtb_img}"
> +}
> +
>  #
>  # Emit the fitImage ITS configuration section
>  #
> @@ -442,7 +451,7 @@ fitimage_emit_section_config() {
>         # conf node name is selected based on dtb ID if it is present,
>         # otherwise its selected based on kernel ID
>         if [ -n "$dtb_image" ]; then
> -               conf_node=3D$conf_node$dtb_image
> +               conf_node=3D$(fitimage_emit_section_config_dtb_label $dtb=
_image)
>         else
>                 conf_node=3D$conf_node$kernel_id
>         fi
> @@ -480,13 +489,13 @@ fitimage_emit_section_config() {
>                 # default node is selected based on dtb ID if it is prese=
nt,
>                 # otherwise its selected based on kernel ID
>                 if [ -n "$dtb_image" ]; then
> -                       # Select default node as user specified dtb when
> -                       # multiple dtb exists.
> -                       if [ -n "$default_dtb_image" ]; then
> -                               default_line=3D"default =3D \"${FIT_CONF_=
PREFIX}$default_dtb_image\";"
> -                       else
> -                               default_line=3D"default =3D \"${FIT_CONF_=
PREFIX}$dtb_image\";"
> -                       fi
> +                       # Select default node as user specified dtb when
> +                       # multiple dtb exists.
> +                               img=3D$default_dtb_image
> +                       else
> +                               img=3D$dtb_img
> +                       fi
> +                       default_line=3D"default =3D \"$(fitimage_emit_sec=
tion_config_dtb_label $img)\";"
>                 else
>                         default_line=3D"default =3D \"${FIT_CONF_PREFIX}$=
kernel_id\";"
>                 fi
> --
> 2.43.0
>
>
>
> Internal
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#216854): https://lists.openembedded.org/g/openembedde=
d-core/message/216854
> Mute This Topic: https://lists.openembedded.org/mt/113189715/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

