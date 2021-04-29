Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web09.6367.1619700671495656873
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Apr 2021 05:51:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=U7/ZpWW8;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id l2so14510153wrm.9
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Apr 2021 05:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=5gPDyKNmfynpwqS/XMQ1fjScSR2xlPcmaTL+QcI5q6c=;
        b=U7/ZpWW8cKDirBVfft8Gl4S3xQbbqH+zBhzK/tJmMkEESvPk5E3sAZ/zeqcTj44Nu/
         LK2Q0yS9zxLCYNu9g/cP6YfxI3ZaFcQdCv0FtlfHzl37Smvxe5MV7v5rGRaiR8TfDghg
         L9ZhuByzpU19m71nuMclEKJAQ9McMsxvo6YYk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=5gPDyKNmfynpwqS/XMQ1fjScSR2xlPcmaTL+QcI5q6c=;
        b=RQ6aeQ7TGNku/pqsn/+ojclrJexNNlXlmZYgL/jWoLBalv7l28VGBUhTeTSE1BgQEz
         LcoGcdaQqetO/hymioTFS/s8sEsAIVs0YTDa85bXKR3tIUuybRgJPvirGMvczNX2K70S
         4q8UbKZ9vom+SGccze48XJuw1tfUKO2ToaPHL4JZ6AfHrYNABDjgsMG4FwuTbRIK/kV4
         vM3teSgdAmlUCxtrjP+b27ke6PE0WcdrXsUANBLSLNf+ngdo8lrIkBhQZjZkHD7cyaQq
         DId3/blsULKgZz3k695fJrx8P05FGmue8DWRObNfAiIZE30JpiDcztOxcmccfvouK6qC
         rEzg==
X-Gm-Message-State: AOAM530Wz4amh6SREn+DXwxJyOoRt0SEqgDmdzvw7tNmtU54TP1xCV78
	psD3I2FuWDlh5e8pP5vYvzB4Lg==
X-Google-Smtp-Source: ABdhPJwnlU2OwrGUm0N0syy2ViXqDTwccgjfg4lHGsoGmT/HuCqTyKBXODgx/+GR/l+iyaxbapvpwQ==
X-Received: by 2002:adf:f8c8:: with SMTP id f8mr29141531wrq.267.1619700669925;
        Thu, 29 Apr 2021 05:51:09 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:e86d:6d6e:c7d5:380c? ([2001:8b0:aba:5f3c:e86d:6d6e:c7d5:380c])
        by smtp.gmail.com with ESMTPSA id j13sm6563153wrd.81.2021.04.29.05.51.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Apr 2021 05:51:09 -0700 (PDT)
Message-ID: <41abc44a9ccb16871c69d6665711fb74b56df89a.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] rootfs.py: find .ko.gz and .ko.xz kernel modules as well
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Martin Jansa <Martin.Jansa@gmail.com>, 
	openembedded-core@lists.openembedded.org
Cc: Christophe Chapuis <chris.chapuis@gmail.com>
Date: Thu, 29 Apr 2021 13:51:06 +0100
In-Reply-To: <20210429120457.3511208-1-Martin.Jansa@gmail.com>
References: <20210429120457.3511208-1-Martin.Jansa@gmail.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2021-04-29 at 14:04 +0200, Martin Jansa wrote:
> From: Christophe Chapuis <chris.chapuis@gmail.com>
> 
> * with xz PACKAGECONFIG enabled in kmod and xz module compression enabled in kernel
>   the do_rootfs task doesn't run depmod in the image, because it thinks there are no modules:
>   NOTE: No Kernel Modules found, not running depmod
> 
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> Signed-off-by: Christophe Chapuis <chris.chapuis@gmail.com>
> ---
>  meta/lib/oe/rootfs.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
> index 5f81023040..e4de0bfddf 100644
> --- a/meta/lib/oe/rootfs.py
> +++ b/meta/lib/oe/rootfs.py
> @@ -305,7 +305,7 @@ class Rootfs(object, metaclass=ABCMeta):
>      def _check_for_kernel_modules(self, modules_dir):
>          for root, dirs, files in os.walk(modules_dir, topdown=True):
>              for name in files:
> -                found_ko = name.endswith(".ko")
> +                found_ko = name.endswith(".ko") or name.endswith(".ko.gz") or name.endswith(".ko.xz")

For reference you can do name.endswith((".ko", ".ko.gz", ".ko.xz")) as endswith
takes a tuple.

Cheers,

Richard

