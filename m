Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8321C369B4
	for <webhook@archiver.kernel.org>; Mon, 14 Apr 2025 17:00:37 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web10.89.1744650029361115175
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Apr 2025 10:00:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bajy3psz;
 spf=pass (domain: gmail.com, ip: 209.85.167.44, mailfrom: jpewhacker@gmail.com)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-54b10594812so5389600e87.1
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Apr 2025 10:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744650027; x=1745254827; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EVY5qQODpCBI1WSIUzwI8cwPXN/MzuHt0ApnhtJ7if4=;
        b=bajy3pszUb3KWCFiTwSUtT3i6rl2vhzFTAAPL7LZ9CUv0oOhlE/O+A7rCOfACLtNOM
         sGvbIu6OCUd451SSaBqIQ1QFBnl3ad+mRJ3yfDLi8YT5U8HIJ/6OhZniHIpIZDblKCvx
         6Ahf4BHQeEvJcvyNUNeZcxT1AfgXsiqYSCNA3ghivYYL0+x+UbKVg/7cJOPTGPP+zH8d
         sRlVPN8UfEhAv4NG4KX2CKqlO1yn8VF4jst9EKkvzW2clo2foQc+kAp1Ms1JkWsUzbEI
         g098V9mS3x2HbY7AgU6LDvgMokuh7mOuRq/PZzLVTAK0mQcymCEW94iRa0ARciKBpzsN
         J6ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744650027; x=1745254827;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EVY5qQODpCBI1WSIUzwI8cwPXN/MzuHt0ApnhtJ7if4=;
        b=I2yry35FuI10d7EOFn8su0PeaEDdZt1pqDoQ2xVLD9BHQbx/F1Jzb2fHsYb5Iq4rvA
         wNC6FL0ZsxqzmvlShCbJUHU03Ie4I/Ov8N6JDZUBvwmilkzJspY1xDPEmdRO4zWjCfe8
         IAzOf0Zj70c4jOwn0jdg/ihofgV1t1ukTGxDm1OPcNbCV/j/QPLBVl7s0/3dH1oPEG8Y
         KVfwsIlGiiCYSvu113h1hJPyyglr22a0Fy3OuKV8vyKO3s0uvxCuS7T51F0HERJK6ArA
         K26p9eSWZ3SyRZxSIryXzNHm0rmzT1VdUpJnvIXzGVPC1dUNeQ3ZCRSa+a1WMd4tmoUG
         eSZw==
X-Gm-Message-State: AOJu0YxQfAV1NwxXP2g8ZSliz5+eGAmrkldOuLmtZlSh5A12hqdBP4wy
	7e/jt7YF2UyRjdhMq8yHtJd9CQdb3FEtl+u2hZOlidCgvpGbaQA5uEhDpt3nytRRLu7Uds8PmLT
	ssZXWHCAzQpWbhzk1YhViBQlt/Io=
X-Gm-Gg: ASbGncsZ16pgP2Pfsz9tPVhB9A1YiK2b4RHcXggTMz02UXUNmUSfkqAojjjcubnqFfM
	785E3JSquE9nb3wFn1aNd5DxCwUnFI2Uyp+EOLfL9aUrjQwVgLsMX3R+R/jv/V7Yv4NPCbtOFmJ
	nhF4UML2f7VyDeMftiUovn6r+fSp7p4rdPWmFl
X-Google-Smtp-Source: AGHT+IF+wOzlBrSy/yvRU2p9z4os6yom+OISuJmnYmE69/+EFbBzfEUsNgJ7w17RjsLDJh1bwo+6GqAbpb9yv9mwkps=
X-Received: by 2002:a05:6512:23a1:b0:549:7590:ff24 with SMTP id
 2adb3069b0e04-54d452945b9mr3994883e87.22.1744650027022; Mon, 14 Apr 2025
 10:00:27 -0700 (PDT)
MIME-Version: 1.0
References: <20250409221851.1005988-1-dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <20250409221851.1005988-1-dmitry.baryshkov@oss.qualcomm.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Mon, 14 Apr 2025 11:00:14 -0600
X-Gm-Features: ATxdqUFzJngCyfUJyo1Vzcf5V4KOQO_57i-fwCZ-QwYhBTSMxXqJmvGJbYZz6FY
Message-ID: <CAJdd5Ga=iKtV7KE0mYTTdWW5XsXgaa3ct+tBg=80azzYV7uNNQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] u-boot: add hook to prepare binaries before copying
To: dmitry.baryshkov@oss.qualcomm.com
Cc: openembedded-core@lists.openembedded.org, 
	Koen Kooi <koen.kooi@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Apr 2025 17:00:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214805

On Wed, Apr 9, 2025 at 4:18=E2=80=AFPM Dmitry Baryshkov via
lists.openembedded.org
<dmitry.baryshkov=3Doss.qualcomm.com@lists.openembedded.org> wrote:
>
> BSP layers might need to perform additional steps on the U-Boot binary,
> which are not a part of the oe_runmake invocation. For example, the
> binary might need to be signed or converted to the Android boot image.
>
> In order to let BSP recipes to perform such tasks without duplicating
> u-boot.inc functions, add a special hook to be called before
> uboot_compile_config_copy_binary().
>
> Note: it is of course possible to push necessary steps into
> uboot_compile_config_copy_binary() itself, but it doesn't look as clean
> as just adding a hook.

It's unclear why a _prepare is necessary, when it passes the exact
same argument to _copy, and _copy is only one line (so you could do
the same thing by making your _copy contain what you want in _prepare
and the one `cp` line from _copy)

Is there some distinct advantage to _prepare, beyond allowing keeping
the one line default _copy?

>
> Cc: Koen Kooi <koen.kooi@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  meta/recipes-bsp/u-boot/u-boot.inc | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot=
/u-boot.inc
> index 9464736b8418..fe86ba0ad011 100644
> --- a/meta/recipes-bsp/u-boot/u-boot.inc
> +++ b/meta/recipes-bsp/u-boot/u-boot.inc
> @@ -81,6 +81,7 @@ uboot_compile_config () {
>      for binary in ${UBOOT_BINARIES}; do
>          k=3D$(expr $k + 1);
>          if [ $k -eq $i ]; then
> +            uboot_compile_config_prepare_binary $config $type $binary
>              uboot_compile_config_copy_binary $config $type $binary
>          fi
>      done
> @@ -93,6 +94,13 @@ uboot_compile_config () {
>      fi
>  }
>
> +# Do nothing by default, this is a hook to be extended by BSP recipes
> +uboot_compile_config_prepare_binary () {
> +    config=3D$1
> +    type=3D$2
> +    binary=3D$3
> +}
> +
>  uboot_compile_config_copy_binary () {
>      config=3D$1
>      type=3D$2
> --
> 2.47.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#214598): https://lists.openembedded.org/g/openembedde=
d-core/message/214598
> Mute This Topic: https://lists.openembedded.org/mt/112181580/3616693
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [JP=
EWhacker@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

