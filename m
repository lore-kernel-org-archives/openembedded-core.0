Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
 by mx.groups.io with SMTP id smtpd.web08.9454.1620308368877365427
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 May 2021 06:39:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=snzB3dwT;
 spf=pass (domain: gmail.com, ip: 209.85.167.174, mailfrom: jpewhacker@gmail.com)
Received: by mail-oi1-f174.google.com with SMTP id u16so5504697oiu.7
        for <openembedded-core@lists.openembedded.org>; Thu, 06 May 2021 06:39:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:subject:to:references:cc:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=chSqFb1g1Z95OTyz0EakrM7GWCFQb56TkH1GIMapNbk=;
        b=snzB3dwTBGb7elHuUSEeHrGbRdTWSQTh1fMwZEz4V774wjYAQ6+jUdiF+JHXwU3i5t
         ycp66FgwTywA+juMYwGG+//EmZQ46WAvVnAo4yGYI+IPYl5o8WD7lZAjBDAwx/vaLCvH
         5lu9QgvDf7s5iCu7YOUKBhFUjUIeMjjDa5nX3Oiz7E869N8/0Rf0TaiUUm58RDL8a6/B
         NUcKlDBPUAiAAcDAi51Uun3Bgpxuaf0jePz4nfOGTS86z+A/x5+GaM70fP2JaCeABaZD
         tfd29OebU0iI/8PWYHVw7f205aAb3JEkLkUrNLsVizk4pA93Ta7vFSOfhnebkCR/L8Xy
         CY+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:references:cc:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=chSqFb1g1Z95OTyz0EakrM7GWCFQb56TkH1GIMapNbk=;
        b=UBZ7HxvU0zZvzLGyDmreTrpb5sv4m/pymhghVWDVFPIhpUUuzWMs9yiwlvvjSEuWvu
         i+R1MUUgo29f47baFsA5ty84XPQezjxNY7Fp6IXW2ig1pJJoCnfrFI6AQ0BhQ2h1Lw5U
         txZX3hZIq4XzvCiYh0pjPJLAWRMpBrOReqNp/rN/5N0QiD55gQZxBTW/2LZ6baoF14Gs
         F58A+lcWo8cDouT7BgeTvH/398KxOyBgcHMKdajzYsdUQ2Q4n7p3Y0JkVNswBPX4lRLw
         mAw7BBdgDQftQy8/imna4V04I47Hzejc2ogTPXwgIEHlCfxgNlXkZWCuI/bY9hHvWvai
         6tHg==
X-Gm-Message-State: AOAM533ztBi/L3tOQB+w8//DyDkWWlV2K7QbT89MaoYVOlu0Xc4nnarF
	gqUXD/D/EqSwIYx/Ig5NyXw=
X-Google-Smtp-Source: ABdhPJzF68mAICZoWtwX1WVCL8xBfqIPI/xl2IA6OKPuqby4qCyL4Fg4MToSpUFHqHt/6R6dr2NCyg==
X-Received: by 2002:aca:5845:: with SMTP id m66mr10828027oib.0.1620308368240;
        Thu, 06 May 2021 06:39:28 -0700 (PDT)
Return-Path: <jpewhacker@gmail.com>
Received: from ?IPv6:2605:a601:ac3d:c100:e3e8:d9:3a56:e27d? ([2605:a601:ac3d:c100:e3e8:d9:3a56:e27d])
        by smtp.gmail.com with ESMTPSA id r14sm588596oth.3.2021.05.06.06.39.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 May 2021 06:39:27 -0700 (PDT)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
Subject: Re: [OE-core][PATCH] classes/image: Use xargs to set file timestamps
To: openembedded-core@lists.openembedded.org
References: <20210505214006.10382-1-JPEWhacker@gmail.com>
Cc: Anuj Mittal <anuj.mittal@intel.com>, Steve Sakoman <steve@sakoman.com>
Message-ID: <5ae0a2df-0ea1-a23f-6932-8088739fee29@gmail.com>
Date: Thu, 6 May 2021 08:39:27 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210505214006.10382-1-JPEWhacker@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Can we backport this to hardknott and dunfell (and gatesgarth if it's 
still active)?

On 5/5/21 4:40 PM, Joshua Watt wrote:
> Instead of having find directly invoke touch for each file in the root
> file system, pass a list to xargs for batching. This significantly
> reduces the number of times the touch program is invoked and speeds up
> the do_image task time:
>
>      PKG           TASK      ABSDIFF  RELDIFF  CPUTIME1 -> CPUTIME2
>      my-image      do_image   -45.3s   -94.2%     48.1s -> 2.8s
>
>      Cumulative cputime:
>        -44.3s    -92.3%    00:48.1 (48.1s) -> 00:03.7 (3.7s)
>
> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> ---
>   meta/classes/image.bbclass | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
> index 013455f492..353cc67175 100644
> --- a/meta/classes/image.bbclass
> +++ b/meta/classes/image.bbclass
> @@ -657,7 +657,7 @@ reproducible_final_image_task () {
>           fi
>           # Set mtime of all files to a reproducible value
>           bbnote "reproducible_final_image_task: mtime set to $REPRODUCIBLE_TIMESTAMP_ROOTFS"
> -        find  ${IMAGE_ROOTFS} -exec touch -h  --date=@$REPRODUCIBLE_TIMESTAMP_ROOTFS {} \;
> +        find  ${IMAGE_ROOTFS} -print0 | xargs -0 touch -h  --date=@$REPRODUCIBLE_TIMESTAMP_ROOTFS
>       fi
>   }
>   
