Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
 by mx.groups.io with SMTP id smtpd.web09.11977.1606837552721861946
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Dec 2020 07:45:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=GMy3wSMF;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.66, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f66.google.com with SMTP id r3so3343187wrt.2
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Dec 2020 07:45:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=sDBJKIZWPIPXYRcQbEiVyTZFLfj5kjIJ0stIddCCN0c=;
        b=GMy3wSMF5kBpyJnMxatgCYyzhfJPRxMe/V4chBNqeGORx+5CJjefy5t7TLYJaKf38g
         7xfNUcouYMacwxb8tAZVl0odbYK96+Cqi2hTsbWGavt/ND7vMwK8bKJkh4SGzvRzf3sl
         5ziOEODnlAJ0MxrucnggNg6q5SQiFyi2ffQwU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=sDBJKIZWPIPXYRcQbEiVyTZFLfj5kjIJ0stIddCCN0c=;
        b=fbyNwQo6kMkGTWgSBkGVCl8SNErMImFeGET7v0V5hu6Ty4dTfgD6YyOeo6sXxSezTC
         i/cWmmGUPfbSYp8sWxIP3dziYdkpfRVe9DOKm1l3UYlqgk5kakZh+s5s7QUh5xgAzLPb
         9jIzXYy1P2AKMm8i22NYNemS8n8RgKt7zU28PXo3H0WbroZRg4JXu4CApcqJRUQZpYPK
         VLWYLlJupADqKI+tZg4EKIxFSSNruGrHUtUkjJzMjl7nLa0aoftzPg7eY3pRR9QPo6lV
         6Izhz6d32vlX8YWa5q7LvnLEXRwWLxIath/NR120vBaBDg1inoAbZc8pnVIDZl10x2w0
         ej3w==
X-Gm-Message-State: AOAM533xheUpXaOeSX0vtY2amyqVJjto8kxSMtaTtd2Fxu83JvCfNtoR
	eaKCaHkZAQRMZGrHzomhLZrlHw==
X-Google-Smtp-Source: ABdhPJyS5ufeGyGLgwfoAHR1MYyCNk/2CJGZ1PZnU4DPHOldl0+YR18BnMOai13eLI5hw21fIwC4vw==
X-Received: by 2002:adf:f2c7:: with SMTP id d7mr4513396wrp.142.1606837551244;
        Tue, 01 Dec 2020 07:45:51 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from 6.8.4.7.c.c.2.8.a.5.e.3.8.c.1.b.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (6.8.4.7.c.c.2.8.a.5.e.3.8.c.1.b.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:b1c8:3e5a:82cc:7486])
        by smtp.gmail.com with ESMTPSA id b4sm459914wmc.1.2020.12.01.07.45.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Dec 2020 07:45:50 -0800 (PST)
Message-ID: <04b925bedf42ef5a8828bf262a39c5f85fdc2f85.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 4/6] reproducible_build: clamp the rootfs tarball mtime to the epoch
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Ross Burton <ross@burtonini.com>, 
	openembedded-core@lists.openembedded.org
Date: Tue, 01 Dec 2020 15:45:47 +0000
In-Reply-To: <20201201152305.2375723-4-ross.burton@arm.com>
References: <20201201152305.2375723-1-ross.burton@arm.com>
	 <20201201152305.2375723-4-ross.burton@arm.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2020-12-01 at 15:23 +0000, Ross Burton wrote:
> To handle files being written to the rootfs outside of the package
> manager,
> clamp the mtimes to the epoch.
> 
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta/classes/reproducible_build.bbclass | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/meta/classes/reproducible_build.bbclass
> b/meta/classes/reproducible_build.bbclass
> index 2f3bd90b073..28a25fb492d 100644
> --- a/meta/classes/reproducible_build.bbclass
> +++ b/meta/classes/reproducible_build.bbclass
> @@ -116,3 +116,6 @@ python () {
>      if d.getVar('BUILD_REPRODUCIBLE_BINARIES') == '1':
>          d.appendVarFlag("do_unpack", "postfuncs", "
> create_source_date_epoch_stamp")
>  }
> +
> +# Clamp the mtimes of the tarball image filesystem type
> +IMAGE_CMD_tar_append = " --clamp-mtime --
> mtime=@${SOURCE_DATE_EPOCH}"
> 

I'm not convinced this is correct as it could mess up the timestamps of
stamps set in other recipes? 

It's also tar specific and should really be across all image types?

Cheers,

Richard

