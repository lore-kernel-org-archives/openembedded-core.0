Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AA15C001B5
	for <webhook@archiver.kernel.org>; Fri,  2 Sep 2022 15:35:26 +0000 (UTC)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com
 [209.85.128.174])
 by mx.groups.io with SMTP id smtpd.web09.76.1662132925213431637
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Sep 2022 08:35:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ndAdCTX+;
 spf=pass (domain: gmail.com, ip: 209.85.128.174,
 mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f174.google.com with SMTP id
 00721157ae682-334dc616f86so19987147b3.8
        for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Sep 2022 08:35:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=dXcPaFEIpAhgChqIsKB2SZnW8SCurx4swOHKsi1OP/A=;
        b=ndAdCTX+AIj1BClDPcJrjSyVWEJyldc3/hn2kenUryASt/xgBl9mkVNii+eMFP0ehx
         3LLsJQHENJBPOzyrGSo/OJb4Nw+KNCT1I2UyNWV5hkWztGbIcmcPW2c4i8hZlQ7w6xFW
         eyVHzQipIC2zvw/kKJWkVxkyrEKXZQzDmhyjueILPZgQdrn4AMLYk12Hx+Wn4XZ1AMh1
         gaKIKX/FbIXzTRALLJJa6/4rXufCtANBREfBMHhEkagvIdJ8NYbI5wH5HgWN3QQkf98Q
         T8bpGwjkYyMuQp+j7AmWgI4xtiQoG+YtSADZxufmNtNzfcSdXVxpg3POyRLZS9eVoGub
         +0jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=dXcPaFEIpAhgChqIsKB2SZnW8SCurx4swOHKsi1OP/A=;
        b=QD5kUAgA5pMWM3P0t2DlxJhqmiQwSuyE3OV8u+qJT8cHX89rlXinH1isueUh8gSPkG
         MNc+kU0notYFhUEIGvNrNN6pnoolTVUD9+1cZitosmrK89iyhQdp6YxjbhU08fkGQdEm
         /O2pG4dHm8xMijuewk9K4g3wMOP1hMsyY30Vfvu5QRj7ts2fWRbRSCSrNNRfo7GmkpoG
         Rg0tcq43ez7xepO6KXfgXajzlkgnzPz6sqfJYm1yj4YoRgXz97kP9Ze660sYx2nxrvrD
         1idx4KRWc8rhxHZuXhKLS0DiTXCvJWoegeq42eOeRani2hpLlIL9Nha5zOZXmiOvgdJ9
         rYVQ==
X-Gm-Message-State: ACgBeo1X2Kd++VAkSGHcFmDpSpUYql2JruXqF8eF6D+DJG1najFLFthV
	1Fz5gHD7DDEmIg76nTxkdmPcOp5zsSus45wOpmU=
X-Google-Smtp-Source: 
 AA6agR6aVq2RcybkM7CpGsMuHA4IJulY7tSkIxyj6lLq3QJiEoOgoDjnfmyQW+SDyUNDb9Jah4M2q3jFTTJo/U5Jmyk=
X-Received: by 2002:a0d:f204:0:b0:333:c23f:d793 with SMTP id
 b4-20020a0df204000000b00333c23fd793mr28982218ywf.71.1662132924336; Fri, 02
 Sep 2022 08:35:24 -0700 (PDT)
MIME-Version: 1.0
References: <20220902144145.313486-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20220902144145.313486-1-richard.purdie@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 2 Sep 2022 08:34:58 -0700
Message-ID: 
 <CAMKF1soobZ-LTB3ao8HiGNraaWhhADxg=Ryvbar8gQtF3CMMyg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] gcc-multilib-config: Fix i686 toolchain
 relocation issues
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Sep 2022 15:35:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170255

On Fri, Sep 2, 2022 at 7:41 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> This code wasn't changing the linux.h on i686. Make the entry match that
> for i586 which was correct.
>
> This fixes problems where the wrong dynamic loader path was used by
> nativesdk-gcc on i686 SDK targets by ensuring SYSTEMLIBS_DIR is replaced
> by %r in the correct header files.
>

Thanks for fixing it, I was hovering around similar places :) but
hasn't had enough time to get to root of it.

> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/recipes-devtools/gcc/gcc-multilib-config.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-devtools/gcc/gcc-multilib-config.inc b/meta/recipes-devtools/gcc/gcc-multilib-config.inc
> index 26bfed9507b..2dbbc23c940 100644
> --- a/meta/recipes-devtools/gcc/gcc-multilib-config.inc
> +++ b/meta/recipes-devtools/gcc/gcc-multilib-config.inc
> @@ -154,7 +154,7 @@ python gcc_multilib_setup() {
>      gcc_header_config_files = {
>          'x86_64'    : ['gcc/config/linux.h', 'gcc/config/i386/linux.h', 'gcc/config/i386/linux64.h'],
>          'i586'      : ['gcc/config/linux.h', 'gcc/config/i386/linux.h', 'gcc/config/i386/linux64.h'],
> -        'i686'      : ['gcc/config/linux.h', 'gcc/config/i386/linux64.h'],
> +        'i686'      : ['gcc/config/linux.h', 'gcc/config/i386/linux.h', 'gcc/config/i386/linux64.h'],
>          'mips'      : ['gcc/config/linux.h', 'gcc/config/mips/linux.h', 'gcc/config/mips/linux64.h'],
>          'mips64'    : ['gcc/config/linux.h', 'gcc/config/mips/linux.h', 'gcc/config/mips/linux64.h'],
>          'powerpc'   : ['gcc/config/linux.h', 'gcc/config/rs6000/linux64.h'],
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#170249): https://lists.openembedded.org/g/openembedded-core/message/170249
> Mute This Topic: https://lists.openembedded.org/mt/93420704/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

