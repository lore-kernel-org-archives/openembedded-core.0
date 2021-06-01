Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web12.3304.1622578324950692326
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Jun 2021 13:12:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=BWnjufT2;
 spf=pass (domain: gmail.com, ip: 209.85.218.50, mailfrom: fntoth@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id gb17so295995ejc.8
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Jun 2021 13:12:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:subject:to:references:message-id:date:user-agent:mime-version
         :in-reply-to:content-transfer-encoding:content-language;
        bh=JbgzgsV2WIXM+QhdNgqpxwaBirxstiJXs9rjU8bOXAQ=;
        b=BWnjufT2knsqNotYM4E/4CnMWokcX+CA2mBJKLt1c+yJm5Cl60E8ZId2ujQFEgWbpU
         cF9UvalKHYUo3zv5IXJmiWjjrp7zeXOKjuvRBXfAaqfbdn9wekqFSSL27MeOVku8RCJD
         WNd8C3wWq+c7kUfVjghX+NZFIagqahA8m6JQ1onBrsgZBL3lOJCEeP82Wy+rn+TukMWq
         mbETLGkGNoNuudWBewaEHRmIfFov/1zuvmRcHCmjQ7+qTnhVQj7F8X0ndajm8JzGxdPI
         +qdP9NLsyEWbqD+hsuCxGRU7JkARKA1A2DMcYNkXwcXF67phaTXy5ZIVOf/QaGn8MOro
         KA3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=JbgzgsV2WIXM+QhdNgqpxwaBirxstiJXs9rjU8bOXAQ=;
        b=bMexH6SyHyATzt5Q3AxTinTIGyhp0c4Zbz93eE49KOFdz6BbE0OZvJHbGgAEb+xUqs
         mryucw/TuUrL5VGXG8q7VvWz6LFYrV7G6Yy8fwZHDBuhEzEGjL7P86vqMS0yQMu++sZc
         eOOz2QbMNrxGbVbdDelK7Bs4gn8LqKr4KLS9k6Zlbt8ibrsD6MQk0FkNbL71/z3M93rt
         PqekcbXXFp5lPzq9O68N1WMHujRbXQpSupRJG3PUJAuMQyZDqE2fyG/Rnf10sljwSqYz
         9vAG+3iTFU8N3FtXoCE2YF5spKmN+iE/bkeI2hlt9COuA8d9GS/dLXryAtl4/QVPUPQM
         Rcrw==
X-Gm-Message-State: AOAM532ST5sq/K62Dmc1AyNoAu+hatgK+1uhEbtsmLk1XQuXT7Qdvl7q
	01HG5GwTu4Ce53gQqE+W8yddsLUCRF0=
X-Google-Smtp-Source: ABdhPJxuTwiUfthQsgLvrNeD82zalGWJMMN6JvRQfsTCOTMwB/a8ogsRtjABilL/EQfgGGbImQHYVA==
X-Received: by 2002:a17:906:b317:: with SMTP id n23mr13498878ejz.324.1622578323567;
        Tue, 01 Jun 2021 13:12:03 -0700 (PDT)
Return-Path: <fntoth@gmail.com>
Received: from ?IPv6:2001:981:6fec:1:5fc5:5b18:b64:a93a? ([2001:981:6fec:1:5fc5:5b18:b64:a93a])
        by smtp.gmail.com with ESMTPSA id m16sm49645edq.56.2021.06.01.13.12.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jun 2021 13:12:03 -0700 (PDT)
From: "Ferry Toth" <fntoth@gmail.com>
Subject: Re: [RFC PATCH 1/1] image-live.bbclass: order do_bootimg after do_rootfs
To: Guillaume Champagne <champagne.guillaume.c@gmail.com>,
 openembedded-core@lists.openembedded.org
References: <20210526183250.27433-1-champagne.guillaume.c@gmail.com>
 <20210526183250.27433-2-champagne.guillaume.c@gmail.com>
Message-ID: <efc2fc26-5784-8afe-b310-e5ea3b83b604@gmail.com>
Date: Tue, 1 Jun 2021 22:12:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210526183250.27433-2-champagne.guillaume.c@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hi

Op 26-05-2021 om 20:32 schreef Guillaume Champagne:
> do_bootimg expects IMGDEPLOYDIR to exist, since it stores its artifacts
> there. Therefore, do_bootimg should run after do_rootfs because
> IMGDEPLOYDIR is created before do_rootfs runs since IMGDEPLOYDIR is
> contained in do_rootfs' [cleandirs] varflag.
>
> When do_bootimg depends on ${PN}:do_image_${LIVE_ROOTFS_TYPE},
> do_bootimg is correctly ordered after do_rootfs because
> do_image_${FSTYPE} tasks are added after do_image and do_image itself is
> added after do_rootfs.
>
> However, when do_bootimg doesn't depend on
> ${PN}:do_image_${LIVE_ROOTFS_TYPE}
> (introduced by: 96f47c39f1d17f073243913d524bde84add41d8f), do_bootimg
> can run before do_rootfs, thus before IMGDEPLOYDIR is created. To
> avoid this situation, do_bootimg is now explicitly ordered after
> do_rootfs.
>
> Signed-off-by: Guillaume Champagne <champagne.guillaume.c@gmail.com>
> ---
> meta/classes/image-live.bbclass | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes/image-live.bbclass 
> b/meta/classes/image-live.bbclass
> index 8b08305cdb..fd876ed8e1 100644
> --- a/meta/classes/image-live.bbclass
> +++ b/meta/classes/image-live.bbclass
> @@ -261,4 +261,4 @@ python do_bootimg() {
> do_bootimg[subimages] = "hddimg iso"
> do_bootimg[imgsuffix] = "."
> -addtask bootimg before do_image_complete
> +addtask bootimg before do_image_complete after do_rootfs

I can not answer your question if this is the right way to go. But I'll 
try this patch next weekend and return here with the results.

Thanks!


