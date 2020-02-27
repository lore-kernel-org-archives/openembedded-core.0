Return-Path: <andre.draszik@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 55938610BB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Feb 2020 14:24:26 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id r17so3584165wrj.7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Feb 2020 06:24:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=W2APeX0NAREUPKpe+qwEYIJdIbKCnzn1qCIcjhfR2iU=;
	b=noIwQf0hYrZcO+h4Y61ETAqoQuYGHK6KKxuH54AMOip7wv+FaMwiWB0+/oLBx8uwmc
	X3tiSGrHDY57a66W6NhRXkQ3qdKtZhcPZ/APK3ljBMa2QVSM804GSh51Pv928ZeDqjiF
	3+WFnuULPmJq0BxxF8sfeS1DObt2R/3qlWK8tlllcNVO5MZgZJGrerRu3nlXgb9WOFum
	mNqPll07YwOPDmpiKF+x8iap8hFNH1/WkvAvPUtzQqSVvnH//YuEIu9+kL2zX8g2IFI2
	f3Tol6cB9GuYic+ngVTJait1a/wMhDHZHi2GWtBD5OuCvH4TubJ5KIemX6zxfS7QgWaX
	nzgw==
X-Gm-Message-State: APjAAAWkeC0GaXmhcEwbCJcwVqTolV039UZNK+sJu34R/T9LFXu/UTu+
	kmZ3pEwyz8VNviqyxHVvN4UjsEEPbBc=
X-Google-Smtp-Source: APXvYqxDvQG1Nwj6dD735rPS3vlOooG34R99WTHkYbU4p42Y7qGaW2ZThLH3D8smJxdF4EBWzC1i7Q==
X-Received: by 2002:a5d:4f8a:: with SMTP id d10mr5285208wru.143.1582813466741; 
	Thu, 27 Feb 2020 06:24:26 -0800 (PST)
Received: from tfsielt31850 ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id n2sm8494936wro.96.2020.02.27.06.24.25
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 27 Feb 2020 06:24:25 -0800 (PST)
Message-ID: <050fca8857e5e56a038562c3d1858bc69c9d3518.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: openembedded-core@lists.openembedded.org, Yevhenii Shchehlov
	<eugenyshcheglov@gmail.com>
Date: Thu, 27 Feb 2020 14:24:25 +0000
In-Reply-To: <20200225141733.54584-1-eugenyshcheglov@gmail.com>
References: <20200225141733.54584-1-eugenyshcheglov@gmail.com>
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Subject: Re: [PATCH] utils.bbclass: Avoid recursive symlink in oe_soinstall
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
X-List-Received-Date: Thu, 27 Feb 2020 14:24:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2020-02-25 at 16:17 +0200, Yevhenii Shchehlov wrote:
> This patch fixes an issue when oe_soinstall function creates
> non-functional recursive symlinks in case library soname is equal
> to library real (file) name.
> 
> Signed-off-by: Yevhenii Shchehlov <eugenyshcheglov@gmail.com>
> ---
>  meta/classes/utils.bbclass | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/classes/utils.bbclass b/meta/classes/utils.bbclass
> index cd3d05709e..dea824f54f 100644
> --- a/meta/classes/utils.bbclass
> +++ b/meta/classes/utils.bbclass
> @@ -25,7 +25,7 @@ oe_soinstall() {
>  	libname=`basename $1`
>  	case "$libname" in
>  	    *.so)
> -	        bbfatal "oe_soinstall: Shared library must haved versioned filename (e.g. libfoo.so.1.2.3)"
> +	        bbfatal "oe_soinstall: Shared library must haved versioned filename (e.g. libfoo.so.1.2.3 instead of
> libfoo.so)"
>  	        ;;
>  	esac
>  	install -m 755 $1 $2/$libname
> @@ -33,8 +33,12 @@ oe_soinstall() {
>  	if [ -z $sonamelink ]; then
>  		bbfatal "oe_soinstall: $libname is missing ELF tag 'SONAME'."
>  	fi
> +	if [ "$sonamelink" == "$libname" ]; then

                           ^^
== is a bashism, please use only one (1) =


Cheers,
Andre'
  
> +		bbwarn "oe_soinstall: $libname soname is equal to real (file) name. Minor version should be added to a
> real name (e.g. libfoo.so.1.2 instead of libfoo.so.1)"
> +	else
> +		ln -sf $libname $2/$sonamelink
> +	fi
>  	solink=`echo $libname | sed -e 's/\.so\..*/.so/'`
> -	ln -sf $libname $2/$sonamelink
>  	ln -sf $libname $2/$solink
>  }
>  
> -- 
> 2.25.1
> 


