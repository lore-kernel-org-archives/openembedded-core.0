Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com [209.85.215.193])
 by mx.groups.io with SMTP id smtpd.web10.7693.1592400715371275267
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Jun 2020 06:31:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=tZUvn6xa;
 spf=pass (domain: gmail.com, ip: 209.85.215.193, mailfrom: jpewhacker@gmail.com)
Received: by mail-pg1-f193.google.com with SMTP id r18so1272574pgk.11
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Jun 2020 06:31:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:subject:to:references:cc:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=KBD9sI8XNRnoacwEIHqqeepewv886NHvx2vUIC6Do+c=;
        b=tZUvn6xabxV9ll6xI+u8wb2+Cv48heZ/FlbrWtJsiOYw95uTTrWslsk331yyDOYvaO
         TIoq4nUXHIikm3PxykL4ACIWEYO7U2YULkhfh3aAoidMlEN+ugPw3luPdx3ovVpafwMA
         R7oo/UfvLbd3l9BzeHU33mkUftIkLbzPHVTcLB9IWvjVTWNdhm+dLrixnVgD49rEV1ib
         21w+biQ/jEvx/l/iCagTSG61PoZXf78C0ojhnciJRrmhK1QYfXppCrrvFigxrWjpOxYW
         CFwnuWxOnOrrZBu8YRDM3gjJvizI1VBqyWrmqrxL22EniGTWnFOkEYnNW0M3uQV7EY2I
         1GKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:references:cc:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=KBD9sI8XNRnoacwEIHqqeepewv886NHvx2vUIC6Do+c=;
        b=nw6c2MD8710qvDGZKH0CDtGKVVLaEAXdfdAnNghQoaLafgvGb59DPi3/kfGQPVAoPU
         3007NrwPqhWmbjqcIXIUVu44gdb86zvkEuiaLlTYApxwp8I/ZkgAVPHE4Ri52nnfZ/vf
         5nOnF+OQ9W8liQreKya3bgt2XY2sOQBg42w5KUAhTotqx6w0W70GNlrRMD4EzpXdQpDS
         59w2LFSbJu3ZILhPxX7Yh4JNO7aZJBDjJUL9/4EP6AmxZ0lslzWyAMI3G2AjWEXqPw70
         jXXJuIhMV293veKcOCXLE430z6Rf1wWhtKvhkPKLD90v2PEkYg4b2VajUiWm7DWN/EtU
         n3vQ==
X-Gm-Message-State: AOAM532k42k3UygVZWja8T1hiYtr3L0lZ/90DQ+/GKG2b4AxXuhmzDmN
	gQCqY73fgg+8ixpgFFQhQg4=
X-Google-Smtp-Source: ABdhPJyBII0YUditNFvoiiHN8BKJV4A6M0BWZrb2kbOqFFixd0r3/cQGnb48n6v3TRwQ2N2iXgezJQ==
X-Received: by 2002:a63:c64c:: with SMTP id x12mr6504611pgg.362.1592400714723;
        Wed, 17 Jun 2020 06:31:54 -0700 (PDT)
Return-Path: <jpewhacker@gmail.com>
Received: from ?IPv6:2605:a601:ac3d:c100:65f3:9208:f078:7d0d? ([2605:a601:ac3d:c100:65f3:9208:f078:7d0d])
        by smtp.gmail.com with ESMTPSA id nv9sm395338pjb.6.2020.06.17.06.31.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2020 06:31:54 -0700 (PDT)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
Subject: Re: [OE-core][PATCH] classes/archiver: Create patched archive before configuring
To: openembedded-core@lists.openembedded.org
References: <20200616143917.34003-1-JPEWhacker@gmail.com>
Cc: steve@sakoman.com
Message-ID: <d670246f-50c9-c4fa-fc52-eee977dd72eb@gmail.com>
Date: Wed, 17 Jun 2020 08:31:52 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200616143917.34003-1-JPEWhacker@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Steve,

I believe this patch should be backported to dunfell.

Thanks

On 6/16/20 9:39 AM, Joshua Watt wrote:
> do_configure and do_preconfigure can modify source files, which causes
> race conditions if these tasks run in parallel with do_ar_patched. Add
> explicit task dependencies to ensure that do_ar_patched finishes before
> these tasks start. Specifically, this fixes a race condition with
> gcc-source where do_ar_patched races with do_preconfigure deleting
> gcc/gengtype-lex.c
>
> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> ---
>   meta/classes/archiver.bbclass | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
> index c2c049c343..e221fff695 100644
> --- a/meta/classes/archiver.bbclass
> +++ b/meta/classes/archiver.bbclass
> @@ -583,7 +583,7 @@ addtask do_deploy_archives_setscene
>   
>   addtask do_ar_original after do_unpack
>   addtask do_unpack_and_patch after do_patch
> -addtask do_ar_patched after do_unpack_and_patch
> +addtask do_ar_patched after do_unpack_and_patch before do_preconfigure do_configure
>   addtask do_ar_configured after do_unpack_and_patch
>   addtask do_ar_mirror after do_fetch
>   addtask do_dumpdata
