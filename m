Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web08.7901.1631778322186710239
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Sep 2021 00:45:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=VhHNzJaz;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id u18so6182120wrg.5
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Sep 2021 00:45:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=IRd9B4MNZHFh9YQyFaK8yhImCpZYJjNFIB+RSUO/bUQ=;
        b=VhHNzJazvE3PZ5NoXFsDBoO22tnqhY9UI46vCaE0PpfO5b6G3go83jpR1bBLQhJFlM
         zI19kAYx1xcsDfZcUKq4dwaQLid0jKH45XYbQ+U+0MtzGGBvLXQBIg7CSYGt5sPA44oA
         XyM5SCXRf/APRwKrVIPUp/TXeqACTZFklCdio=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=IRd9B4MNZHFh9YQyFaK8yhImCpZYJjNFIB+RSUO/bUQ=;
        b=EUuc44lQtcYW8y99KKjZjkD9IommYTaK3r7aPd3uswByEWANpC4oFhpsUOCpXDcgwY
         zP38bYhfOs+MR1i9aM6eCxQgb3DUj6P4Oesu+OEXuQ1lku6GOk5HlmDRwbaxUVgZeJeD
         Dz/Odtaa7dl+3rHE1DG6r9Lr7Gs29weSr3OJda0cnIcDeoNOPwJoZB4mJD+SNQOcp0q/
         nORG7SWCxLN8wswUvIfKe6kmwzIaPNTHVM3JdNqXEOcl3vMJvNgs41UXEBWudJBpXjKG
         CrD5AJBjkPuloWDY91wQjZu6yCu/qTIKmNkPN9lg1tcrIWdHpOIsGhzTFsiJn0jd3KLw
         9NMg==
X-Gm-Message-State: AOAM533gE+ZoBeZs8OUQWlYko0TOsIU5A1zjdhAWDGYoViD54hxzxrhI
	7EX0WvYzSlBWx5nybUy3N3uTlg==
X-Google-Smtp-Source: ABdhPJwRQgLwEg1WXnQH6fn3Q2fw2tLrtviGmyGCFGHxarfR9p+zxWFXouXBhOpQAP5Nld3vse/D/A==
X-Received: by 2002:a5d:46cb:: with SMTP id g11mr4476576wrs.60.1631778320368;
        Thu, 16 Sep 2021 00:45:20 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:f11f:8fd1:42b2:e87c? ([2001:8b0:aba:5f3c:f11f:8fd1:42b2:e87c])
        by smtp.gmail.com with ESMTPSA id n186sm6464039wme.31.2021.09.16.00.45.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Sep 2021 00:45:20 -0700 (PDT)
Message-ID: <1a06ce8d46532871daac149988790c38244f4514.camel@linuxfoundation.org>
Subject: Re: [PATCH] state/staging: Fix directory not deleted for race
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Pgowda <pgowda.cve@gmail.com>, openembedded-core@lists.openembedded.org
Cc: rwmacleod@gmail.com, umesh.kalappa0@gmail.com, vinay.m.engg@gmail.com
Date: Thu, 16 Sep 2021 08:45:16 +0100
In-Reply-To: <20210915114618.157245-1-pgowda.cve@gmail.com>
References: <20210915114618.157245-1-pgowda.cve@gmail.com>
User-Agent: Evolution 3.40.2-1build1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2021-09-15 at 04:46 -0700, Pgowda wrote:
> The race issue resulted in some empty directories not being deleted.
> During staging_copyfile, it results in "file already exists error" on
> creating link for directories during do_prepare_recipe_sysroot.
> The following patch checks whether the directory and its sub directories
> have no files in it and removes them.
> 
> The issue was observed on running rust-hello-world for glibc and musl
> one after the other.
> TCLIBC=glibc MACHINE=qemuarm bitbake rust-hello-world
> TCLIBC=musl MACHINE=qemuarm bitbake rust-hello-world
> 
> On fixing the above issue, it was found that
> arm-poky-linux-musleabi.json files are not being generated.
> $/del/build/tmp/work/x86_64-linux/rust-cross-arm/1.54.0-r0/targets/
> arm-poky-linux-musleabi.json': No such file or directory
> 
> It is generated and builds successfully when musl lib is built standalone.
> However, when musl is built after glibc or viceversa results in the
> latter json file not being generated.
> 
> Signed-off-by: Pgowda <pgowda.cve@gmail.com>
> ---
>  meta/classes/staging.bbclass | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/meta/classes/staging.bbclass b/meta/classes/staging.bbclass
> index af3397bab6..4b751af4d3 100644
> --- a/meta/classes/staging.bbclass
> +++ b/meta/classes/staging.bbclass
> @@ -145,6 +145,16 @@ def staging_copyfile(c, target, dest, postinsts, seendirs):
>      if os.path.islink(c):
>          linkto = os.readlink(c)
>          if os.path.lexists(dest):
> +            # Check if directory is not deleted for race issue
> +            if os.path.isdir(dest):
> +                count = 0
> +                for root, dirs, files in os.walk(dest):
> +                    for Files in files:
> +                        count += 1
> +                if count == 0:
> +                    import shutil
> +                    shutil.rmtree(dest)
> +                    os.symlink(linkto, dest)
>              if not os.path.islink(dest):
>                  raise OSError(errno.EEXIST, "Link %s already exists as a file" % dest, dest)
>              if os.readlink(dest) == linkto:

This change looks like a good fix but it can be improved a little.

Firstly, rather than the count and os.walk, we can just use
"if not os.listdir(dest):".

Secondly, if we know the directory is empty and is a directory, we don' need
rmtree, we can just use os.rmdir() which should be much faster.

I'd also clarify the comment to something like:

# Empty directories are not removed due to race issues but if we
# find a conflict, we can remove empty directories here.

Cheers,

Richard

