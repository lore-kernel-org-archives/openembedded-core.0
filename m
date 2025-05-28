Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C79BC5AD49
	for <webhook@archiver.kernel.org>; Wed, 28 May 2025 13:21:58 +0000 (UTC)
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
 by mx.groups.io with SMTP id smtpd.web11.15468.1748438512529431344
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 May 2025 06:21:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fAOYKokX;
 spf=pass (domain: gmail.com, ip: 209.85.160.177, mailfrom: twoerner@gmail.com)
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-47662449055so21959641cf.1
        for <openembedded-core@lists.openembedded.org>; Wed, 28 May 2025 06:21:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748438511; x=1749043311; darn=lists.openembedded.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FJLT+1MrIFl+nCgqYnEGwHV3cuU+034ArJDqed1/nKw=;
        b=fAOYKokX7egwaiwx4dJWDvORYt0oYZ5yKfge+r129gfNhgIbVjmSK6XFosXwp/4iTk
         oNexK5gFJxMSeoHCC0PCzS2uGKkWmRQwPQDWS7UXaVfWbrpSDlWFovfWHjD+fUQBYnVK
         ibgr0W7wozWvBqZTfH4ATbjYpF1Khe+S3P10YDr3pj5CxxRn44FVzCDzvdTmnS9pA3CQ
         xU72KuXkpQFBcHL8Gx7qMAYiFzd/ZUBoqDTMeg3vyTm0FhAUovZWlA+JXdMhYCGV0D1P
         6mri+6d2fX77GC6lyXLiU/mqmME9wM8WvRLTA2hB7+7+4QKLCJepvrRA0itk6Sa/4HZL
         fA8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748438511; x=1749043311;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FJLT+1MrIFl+nCgqYnEGwHV3cuU+034ArJDqed1/nKw=;
        b=RhQW+yAcNUJJuvf3jTVqinniOoUUBNoi1odRb+0M1V8wnC7JUXS3BgfL2n9I8zD1kd
         jKjCX0Hs8nTOAffI0svNM9Z6jATNXce8lfTEqLFVeYyM7+Kdp/xZbAmYbjxZ97cNDynv
         jZiwHLh1Z2I6N6XVfkLwV/WDx6IFR1xn8rzhrnXa2ImJlfSTdjqe39OxDhVKrP/pcdZi
         B2QCjAfAXt+lU8F1zovQ4FhAvWET6KTbom+aFFMsBnO0tLIkGySozGXQ6oh2HMB2ALWC
         Jo5riHuetdoiKq5Fk10ZtWTXyyjdjUQ7/M8ROSQcYTWf32tAYsXO0EXu2L5A1cu+qEFb
         JzqA==
X-Gm-Message-State: AOJu0YxpnPIbaidDb2HQHDMQd0ykuvUVFpuzNqJbAmMqEnNbuGK/amqm
	fPu7cOLF9M6kTHcMF/gha2so8zqJtwfS0oemZ2x/vpQcOOlaRVP/Ai4C
X-Gm-Gg: ASbGncvBmgwBGqpRKCBZTri+2dVVCiXgUmbjkBxRJIqY2Ujt6+V6Pus3HzFtYjw41IH
	DVxU4t7+otawJ9BjAOXRjqi7pYt/1MhFCJn4kjkoKN2NTFVEupQco75+Yq44gbmTSrnf5F+Z9g/
	Ouy9vC+3PzruzLDFd+XoKGNwQwlCSkhPYn3lr0PYWt2Px/MegxibpovWeptjs30xsLtBly/jQ+2
	3jVfainOxs/cpyl/9Pqn++XBrwmS5WC6eypAveEJb+txSJ+jp0958RE6+hWw7c9y+VWh7Za+CVY
	TmtDjZI22nE0WG5I81m3fjOv/zxFSVST0dGXP7fwX5MrsQwwfezdBaWIS735b8Gyi8EtR98IFdR
	bcGE=
X-Google-Smtp-Source: AGHT+IE2R5adCtYDsqCA7Ej0RjODry896eXWxjESJjojgfIYRfZ1L3jN5lKezG6V+FlaEmAT0CNS4g==
X-Received: by 2002:ac8:5cca:0:b0:494:7ca0:2ff with SMTP id d75a77b69052e-49f4665832cmr270030381cf.15.1748438511440;
        Wed, 28 May 2025 06:21:51 -0700 (PDT)
Received: from localhost (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a3c8008f53sm6054431cf.42.2025.05.28.06.21.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 06:21:50 -0700 (PDT)
Date: Wed, 28 May 2025 09:21:48 -0400
From: Trevor Woerner <twoerner@gmail.com>
To: raj.khem@gmail.com
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] mesa-gl: Remove osmesa dependency
Message-ID: <20250528132148.GA33574@localhost>
References: <20250527153956.1870056-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250527153956.1870056-1-raj.khem@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 May 2025 13:21:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217348

On Tue 2025-05-27 @ 08:39:56 AM, Khem Raj via lists.openembedded.org wrote:
> osmesa has been removed from recently upgrade mesa recipes
> remove it from the fallback for non-x11 systems
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-graphics/mesa/mesa-gl.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/recipes-graphics/mesa/mesa-gl.bb b/meta/recipes-graphics/mesa/mesa-gl.bb
> index ca160f1bfce..680fda1be5c 100644
> --- a/meta/recipes-graphics/mesa/mesa-gl.bb
> +++ b/meta/recipes-graphics/mesa/mesa-gl.bb
> @@ -10,6 +10,6 @@ TARGET_CFLAGS = "-I${STAGING_INCDIR}/drm"
>  
>  # At least one DRI rendering engine is required to build mesa.
>  # When no X11 is available, use osmesa for the rendering engine.

^^ should probably also fixup the comment too

> -PACKAGECONFIG ??= "opengl gallium ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', 'osmesa', d)}"
> -PACKAGECONFIG:class-target = "opengl gallium ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', 'osmesa', d)}"
> +PACKAGECONFIG ??= "opengl gallium ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
> +PACKAGECONFIG:class-target = "opengl gallium ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
>  

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#217312): https://lists.openembedded.org/g/openembedded-core/message/217312
> Mute This Topic: https://lists.openembedded.org/mt/113327839/900817
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [twoerner@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


