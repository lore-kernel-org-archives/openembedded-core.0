Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
 by mx.groups.io with SMTP id smtpd.web10.55.1592254077279637236
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jun 2020 13:47:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=cPGIVUNr;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.66, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f66.google.com with SMTP id j10so18520961wrw.8
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Jun 2020 13:47:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=pgQ4COiIVKUn7zI8Uwh8v3UpPvt9IxUwoBCrjNr9BMY=;
        b=cPGIVUNrYmNZ1XKNPQMVemuplWwA5j6Nv2GVhGjFaYWpA/wHPWRcuRU/kpzit/cTtH
         amMLBi0X1n93k4od0dqzOEsDjTOu87GGfoUCvL32BB31gRvDwGc38C6mL5BW3zKwD3e6
         i0VLGAFmA60xt0F0Qb41qrt7qWgcQtfMu1UD8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=pgQ4COiIVKUn7zI8Uwh8v3UpPvt9IxUwoBCrjNr9BMY=;
        b=Ukp3g2w360buq1debwIrnJMGmmSZo1xj+s3a4r1nw0ij91Cq0DXd/ZgakLMRClKh8M
         SymW3LGbixviebww1kndHFuxq4xlN4+rKPTpSIgxk2kGNcLXw0RRbGWpuegJEH2LKDtw
         sxI8w74JmrdoETnafcKMj2MrLNQSISq+yauISlRuhdTHnTCzUx1oCVxIIpBTCKM85nHh
         6RiBhejmxmOWGLYeAofMuLlc87ZlivfpIPQG2W8k9gdfYPxDGhItmPNECMIONOYzHLlZ
         kB/5Op2G4DM859Dn3t+YVyjZhQDlqlMKKwQcwpZ40qBzcXc1A1ffBsu2BFLiIyT3OuoT
         w7GQ==
X-Gm-Message-State: AOAM531gLIp+fde0nG8CE2xZGoSnqDkSc3hIVILDzq4bJZK9zhKB/Lk8
	e/zbqiI+Lm8yMzNtYg3o1WpPoQ==
X-Google-Smtp-Source: ABdhPJwfHTMlX/q3woN7eUVvBH4+letOtWGMKQhfVbUc97zDYeauHXNxgWrs5CLVSMgNNVWXDfGzKw==
X-Received: by 2002:a5d:4204:: with SMTP id n4mr32424763wrq.247.1592254075665;
        Mon, 15 Jun 2020 13:47:55 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id b18sm25271185wrn.88.2020.06.15.13.47.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2020 13:47:55 -0700 (PDT)
Message-ID: <1a10f4ab0edc44730a6e20bb7fe522787177e142.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] zlib: build and package minigzip
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Sergio Prado <sergio.prado@e-labworks.com>, 
	openembedded-core@lists.openembedded.org
Date: Mon, 15 Jun 2020 21:47:53 +0100
In-Reply-To: <20200612204520.7818-1-sergio.prado@e-labworks.com>
References: <20200612204520.7818-1-sergio.prado@e-labworks.com>
User-Agent: Evolution 3.36.2-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2020-06-12 at 17:45 -0300, Sergio Prado wrote:
> minigzip is a minimal implementation of the gzip utility that
> simulates
> gzip using the zlib compression library.
> 
> Having a package with minigzip could be useful in some cases.
> 
> Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
> ---
>  meta/recipes-core/zlib/zlib_1.2.11.bb | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-core/zlib/zlib_1.2.11.bb b/meta/recipes-
> core/zlib/zlib_1.2.11.bb
> index ef9431ae475c..3ecb90de2b5f 100644
> --- a/meta/recipes-core/zlib/zlib_1.2.11.bb
> +++ b/meta/recipes-core/zlib/zlib_1.2.11.bb
> @@ -19,6 +19,14 @@ CFLAGS += "-D_REENTRANT"
>  
>  RDEPENDS_${PN}-ptest += "make"
>  
> +PACKAGES =+ "${PN}-minigzip"
> +
> +FILES_${PN}-minigzip += "\
> +                         ${sbindir}/minigzip \
> +                         ${sbindir}/minigzipsh \
> +                         ${sbindir}/minigzip64 \
> +                         "
> +
>  inherit ptest
>  
>  do_configure() {
> @@ -26,11 +34,16 @@ do_configure() {
>  }
>  
>  do_compile() {
> -	oe_runmake shared
> +	oe_runmake shared minigzip minigzip64
>  }
>  
>  do_install() {
>  	oe_runmake DESTDIR=${D} install
> +
> +	install -d ${D}${sbindir}
> +	install -m 0755 ${B}/minigzip ${D}${sbindir}
> +	install -m 0755 ${B}/minigzipsh ${D}${sbindir}
> +	install -m 0755 ${B}/minigzip64 ${D}${sbindir}
>  }
>  
>  do_install_ptest() {

Breaks oe-selftest:

https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/1039

Reproducer:
oe-selftest -r pkgdata.OePkgdataUtilTests.test_list_pkgs

Also breaks meta-mingw:

https://autobuilder.yoctoproject.org/typhoon/#/builders/89/builds/2031

Cheers,

Richard


