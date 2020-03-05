Return-Path: <andre.draszik@gmail.com>
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
	[209.85.208.67])
	by mail.openembedded.org (Postfix) with ESMTP id 79CC9610BB
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Mar 2020 16:20:29 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id n18so7462635edw.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Mar 2020 08:20:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=NgQh/rNSHYsPG1mpDXV1oVM2GR/Amb0Rf+VSLlpyOLE=;
	b=n14eakObxFQa2nkyanjVrPwFi69Xy77Gvs24CbHyj8gMbai+2Ixyz+liGJhL63ve+A
	+/ujOBz6KqVSOMHPDU77OUkiU24JnrX35Zvc2eqInDcYjrBKNN8DUoViNG5+Wz3YG51J
	e3TavtJ1XT6ZwjWBE/Az24rdbjXO0Z9L0fbsKqQWIuLDWRhXjBtwFV063nTiGiKiXEr1
	fbpmPxo5F2H4NgPpt6fIc42HTgyoKd5UTLyeuAkKyIUwXQt3uGHqFJINHHBKOjgGeiQM
	Jfj9UF6T9Oe95tBzNdGoyKQYmsP1biGBWvmf/GBeGeokqPkgATa2a9YIpCe1Ie/f2WiF
	ICoQ==
X-Gm-Message-State: ANhLgQ2X7wzGjC7HMWazTv35zB53MC6Dl7nj5jo1KS6EMscBrgY8+tPg
	7lz56CkWjDiGzQ8YW50XISToB8Ts
X-Google-Smtp-Source: ADFU+vvmNLUMwPA87BVLTWbWIcu1tbvwAnLbl7i3YHZeDa8QoWK5dWsSUqHpf5bUYa9iUcL9TjExJg==
X-Received: by 2002:a17:906:3797:: with SMTP id
	n23mr8000610ejc.368.1583425229891; 
	Thu, 05 Mar 2020 08:20:29 -0800 (PST)
Received: from tfsielt31850.fritz.box ([79.97.20.138])
	by smtp.gmail.com with ESMTPSA id
	by19sm1252291ejc.85.2020.03.05.08.20.28
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 05 Mar 2020 08:20:28 -0800 (PST)
Message-ID: <e4bb4e709193acf371cf4c5afce4e6a8d1936a52.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Thu, 05 Mar 2020 16:20:27 +0000
In-Reply-To: <20200304101307.31198-1-alex.kanavin@gmail.com>
References: <20200304101307.31198-1-alex.kanavin@gmail.com>
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Subject: Re: [PATCH] linux-firmware: use 'make install' for installation
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 05 Mar 2020 16:20:29 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2020-03-04 at 11:13 +0100, Alexander Kanavin wrote:
> Copying the source tree over was missing important symlinks
> that since recent updates can only be created with make install.

Thanks for the quick fix Alex, but unfortunately now all the -license packages
are non-existent and image creation fails, because their install: target
doesn't copy the license files.

Cheers,
Andre'

> 
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  .../linux-firmware/linux-firmware_20200122.bb | 22 +------------------
>  1 file changed, 1 insertion(+), 21 deletions(-)
> 
> diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20200122.bb b/meta/recipes-kernel/linux-firmware/linux-
> firmware_20200122.bb
> index 0d1422cfca..f7198cb56a 100644
> --- a/meta/recipes-kernel/linux-firmware/linux-firmware_20200122.bb
> +++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20200122.bb
> @@ -208,27 +208,7 @@ do_compile() {
>  }
>  
>  do_install() {
> -	install -d  ${D}${nonarch_base_libdir}/firmware/
> -	cp -r * ${D}${nonarch_base_libdir}/firmware/
> -
> -	# Avoid Makefile to be deployed
> -	rm ${D}${nonarch_base_libdir}/firmware/Makefile
> -
> -	# Remove unbuild firmware which needs cmake and bash
> -	rm ${D}${nonarch_base_libdir}/firmware/carl9170fw -rf
> -
> -	# Remove pointless bash script
> -	rm ${D}${nonarch_base_libdir}/firmware/configure
> -
> -	# Remove python script used to check the WHENCE file
> -	rm ${D}${nonarch_base_libdir}/firmware/check_whence.py
> -
> -	# Libertas sd8686
> -	ln -sf libertas/sd8686_v9.bin ${D}${nonarch_base_libdir}/firmware/sd8686.bin
> -	ln -sf libertas/sd8686_v9_helper.bin ${D}${nonarch_base_libdir}/firmware/sd8686_helper.bin
> -
> -	# fixup wl12xx location, after 2.6.37 the kernel searches a different location for it
> -	( cd ${D}${nonarch_base_libdir}/firmware ; ln -sf ti-connectivity/* . )
> +        oe_runmake 'DESTDIR=${D}' install
>  }
>  
>  
> -- 
> 2.25.1
> 


