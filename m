Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 163FBC48BC4
	for <webhook@archiver.kernel.org>; Sat, 17 Feb 2024 21:21:48 +0000 (UTC)
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
 by mx.groups.io with SMTP id smtpd.web10.6179.1708204906960756787
 for <openembedded-core@lists.openembedded.org>;
 Sat, 17 Feb 2024 13:21:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=l0WolHvB;
 spf=pass (domain: gmail.com, ip: 209.85.161.42, mailfrom: twoerner@gmail.com)
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-59d78deb469so1968430eaf.1
        for <openembedded-core@lists.openembedded.org>; Sat, 17 Feb 2024 13:21:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708204905; x=1708809705; darn=lists.openembedded.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:to:from:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oE3VVdT/Fr2PVgFsJAmxABD2ibIIoqqSLf4WJBxWqNk=;
        b=l0WolHvBFcG8yuVoSTAhB8eiW2E0mVu5kS3ZP4L8G5LTZNWxUVcMIehfAHmln3LCs4
         IWtA90Sqr+yWm3gRcAZue72sjkxcPHZ/5R2AdzreMFhmOnD+OT4rJ5ivFuwu7TSZUgg/
         hlpxpzWwrCziWk2eLq61ZRUPwAxr+YTxhxSU1hHEe5P/5oS9BmMYCa0EgmV4O4T32+33
         zoYyUau9ohGWt4b052rfsbnVGmVRqSY5Vf9txt47T3bSYpfAYIJefewSbFaOUyxOutaR
         kcGR1rxw8B5KqSRtAKCvFmvIETJL2nt6KW4uxhvN60JGfnQEoWDGlh1GsSbw779RfQF9
         IHXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708204905; x=1708809705;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oE3VVdT/Fr2PVgFsJAmxABD2ibIIoqqSLf4WJBxWqNk=;
        b=nrVI8QTKcbKK8xkfZAVIHReRhYCcMn/O3Dyz+nQV+KPcVPc+9PgB6qdTHssG5408K3
         paOxBFdW+t54OydpOCLwjTEDELB5tYzg8/JX3TJFZ+kYkhEnVYONqelWUWDI+vo2xzbD
         BP53SeyzjxuaOS2i+NWHXiFqFhR3EhoJaU7jokNbFlRv6iTDKDkh40FU1nJYSMNk1SDw
         U8s1gKBKJGxpZ13qGpq7ZMVmmRbbRw8RDqBDF3cgEaK6VYKi+a9GzD6Tk2+QgkxO2pjO
         yyYWLVh+rgiXC3G6c3DPR2BRbJdYrByACQcLDa4Selmz6y9li9TwZnxrMeYK0TvEBGch
         cEAA==
X-Gm-Message-State: AOJu0YxfE5qun/KnQXqh4pbQSi6sRBg7bCp6XDiqY/P5H+NeBmU7OrPk
	gQuwiXfV9y8NHwD9SnKeHS2SCpJH0/NjOvYVjx/MUxXuRw6a5ZF2oUfAjN9+
X-Google-Smtp-Source: AGHT+IEVc9KJPOUqalp8qKzXgCR1Kv21kOwGcJABfIKk2VLQEDBm5yi1d28i9cIK97s1w8wrCK1Tog==
X-Received: by 2002:a05:6358:7e04:b0:176:9bfd:d092 with SMTP id o4-20020a0563587e0400b001769bfdd092mr10020212rwm.18.1708204904890;
        Sat, 17 Feb 2024 13:21:44 -0800 (PST)
Received: from localhost (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id k19-20020a05620a0b9300b00785c29ccb23sm1124969qkh.25.2024.02.17.13.21.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Feb 2024 13:21:44 -0800 (PST)
Date: Sat, 17 Feb 2024 16:21:42 -0500
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] wic: allow sizes to be specified in sectors
Message-ID: <20240217212142.GA34693@localhost>
References: <20240217205103.27285-1-twoerner@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240217205103.27285-1-twoerner@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 17 Feb 2024 21:21:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195817

Sorry, please ignore.

The assumption that everything is a multiple of 1024 runs very deep throughout
wic and is hard-coded in too many places for a patch this simple to work.


On Sat 2024-02-17 @ 03:51:03 PM, Trevor Woerner wrote:
> The partition layout of boot devices for some SBCs (e.g. Rockchip[1])
> are specified in multiples of sectors (which are multiples of 512 bytes,
> instead of 1024). Therefore allow wic to understand partition sizing
> specified in sectors as well.
> 
> [1] https://opensource.rock-chips.com/wiki_Partitions
> 
> Signed-off-by: Trevor Woerner <twoerner@gmail.com>
> ---
>  scripts/lib/wic/ksparser.py | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/scripts/lib/wic/ksparser.py b/scripts/lib/wic/ksparser.py
> index 7ef3dc83ddce..35681bdc8d13 100644
> --- a/scripts/lib/wic/ksparser.py
> +++ b/scripts/lib/wic/ksparser.py
> @@ -178,8 +178,8 @@ class KickStart():
>          # --error, but since nesting mutually exclusive groups does not work,
>          # ----extra-space/--overhead-factor are handled later
>          sizeexcl = part.add_mutually_exclusive_group()
> -        sizeexcl.add_argument('--size', type=sizetype("M"), default=0)
> -        sizeexcl.add_argument('--fixed-size', type=sizetype("M"), default=0)
> +        sizeexcl.add_argument('--size', type=sizetype("M", True), default=0)
> +        sizeexcl.add_argument('--fixed-size', type=sizetype("M", True), default=0)
>  
>          part.add_argument('--source')
>          part.add_argument('--sourceparams')
> -- 
> 2.43.0.76.g1a87c842ece3
> 

