Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 4290F7C1D8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jan 2019 23:01:18 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id y185so2187552wmd.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jan 2019 15:01:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=UzyBMVmEfKduKprBXHubkD9ZJKotJ+uYz4ceBeF2XaI=;
	b=UTjVsMa5hgqRRAvjgqD+HwtdKya7R8dB8VnBxjGeF690MBJ44dxkWEhM1EZia1C35Z
	TYPnzWofxUksXwlB6EI/y4N3DCQ2livLr7XB8FzsVt/kDcSKqi0ApztaHKfkA0a7i+Jy
	jO/GQc3EnCSttL/sKnvnlAhStWlCU6mk7uxbA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=UzyBMVmEfKduKprBXHubkD9ZJKotJ+uYz4ceBeF2XaI=;
	b=bRwR60oK8KFGUK2nBt/U6cXH4eVBIhzQkwIAdakrkAIRdLrCoxPC3TklpY1z9ORIG7
	mwxq/3TOm5dgB2vZobOxXv/93eFvJYqoqpN38+bGAJH8FipZckxpsdMBOkvk1MgJcFeG
	FWvuo3joBkf8ukHCneGjk4Z7/2iy8YvCSiT1dCaXCp0p5O7UaYrZw446LLu2ui/8INJi
	N42C/ynE2YCld5OIH0p2k5eMC/xF1xZFtdEuEqM2TgVbvgx8Etqr4tuEiHRLw63nwuXJ
	23M1AmdA8r4q1y4Llsx713kXslhSRsv/itc6h5knxACWTQb7NK9WueBDOeO1VLbs2jip
	9YFA==
X-Gm-Message-State: AJcUukfR0kzT//QzsjA67SrEfpm409EXaVKP/EsmsuE6NUmndob5HPhb
	S4f3XD2F5/TkDbyvlfVZYz+zgw==
X-Google-Smtp-Source: ALg8bN4gFKwSwmJzHQyAnKhxWl67QZxaAFIRhHcbqQFc7EWi5rIir12lKd/H34GvJlXqzYEsZjaePg==
X-Received: by 2002:a1c:a70a:: with SMTP id q10mr8719950wme.58.1547679679567; 
	Wed, 16 Jan 2019 15:01:19 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	p139sm71645051wmd.31.2019.01.16.15.01.18
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 16 Jan 2019 15:01:18 -0800 (PST)
Message-ID: <b08ee857fa323713a81f69c756169807f62a2ba2.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Douglas Royds <douglas.royds@taitradio.com>, 
	openembedded-core@lists.openembedded.org
Date: Wed, 16 Jan 2019 23:01:17 +0000
In-Reply-To: <20190116225154.12180-1-douglas.royds@taitradio.com>
References: <20190116225154.12180-1-douglas.royds@taitradio.com>
User-Agent: Evolution 3.30.4-1 
Mime-Version: 1.0
Subject: Re: [PATCH] cmake.bbclass: make cleaning of build directory on configure optional
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
X-List-Received-Date: Wed, 16 Jan 2019 23:01:19 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2019-01-17 at 11:51 +1300, Douglas Royds wrote:
> From: Sam Nobs <samuel.nobs@taitradio.com>
> 
> The do_configure task is sensitive to changes in recipes and
> configuration files.
> This can be time consuming because cmake.bbclass deletes the ${B}
> directory
> at the beginning of the do_configure task. CMake figures
> out what to do when it's run again, so unless your cmake files are
> buggy, there shouldn't
> be any need to erase the build directory and start afresh.
> 
> This change allows you to turn this behaviour off, either globally or
> on a per-recipe basis, e.g.
> 
> OECMAKE_CLEAN_BUILDDIR_ON_CONFIGURE_pn-yourrecipe = ""
> 
> Signed-off-by: Sam Nobs <samuel.nobs@taitradio.com>
> ---
>  meta/classes/cmake.bbclass | 23 ++++++++++++++++++-----
>  1 file changed, 18 insertions(+), 5 deletions(-)

This may give a speed boost for some cases but it does come at a
potential risk of determinism issues.

I appreciate you've made it configurable but that actually further
concerns me as we now have two code paths which potentially both have
to be tested.

Is this change really worth it?

Cheers,

Richard

> diff --git a/meta/classes/cmake.bbclass b/meta/classes/cmake.bbclass
> index fa7f68c99b..b9ec68ac9a 100644
> --- a/meta/classes/cmake.bbclass
> +++ b/meta/classes/cmake.bbclass
> @@ -63,6 +63,11 @@ EXTRA_OECMAKE_BUILD_prepend_task-install =
> "${PARALLEL_MAKEINST} "
>  OECMAKE_TARGET_COMPILE ?= "all"
>  OECMAKE_TARGET_INSTALL ?= "install"
>  
> +# Clean the build directory before configuring.
> +# Some recipes don't want/need this as cmake is perfectly
> +# capable of figuring out what to do, so we allow it to be turned
> off
> +OECMAKE_CLEAN_BUILDDIR_ON_CONFIGURE ??= "true"
> +
>  # CMake expects target architectures in the format of uname(2),
>  # which do not always match TARGET_ARCH, so all the necessary
>  # conversions should happen here.
> @@ -133,12 +138,20 @@ cmake_do_configure() {
>  		bbnote "cmake.bbclass no longer uses
> OECMAKE_BUILDPATH.  The default behaviour is now out-of-tree builds
> with B=WORKDIR/build."
>  	fi
>  
> -	if [ "${S}" != "${B}" ]; then
> -		rm -rf ${B}
> -		mkdir -p ${B}
> -		cd ${B}
> +	if [ ${@oe.types.boolean('${OECMAKE_CLEAN_BUILDDIR_ON_CONFIGURE
> }')} = True ]; then
> +		if [ "${S}" != "${B}" ]; then
> +			rm -rf ${B}
> +			mkdir -p ${B}
> +			cd ${B}
> +		else
> +			# For an in-tree build, delete all object files
> and CMake artefacts
> +			find ${B} -name CMakeFiles -or -name Makefile
> -or -name cmake_install.cmake -or -name CMakeCache.txt -delete
> +		fi
>  	else
> -		find ${B} -name CMakeFiles -or -name Makefile -or -name
> cmake_install.cmake -or -name CMakeCache.txt -delete
> +		# Selectively delete CMake artefacts to ensure that -c
> configure has a consistent result
> +		rm -f CMakeCache.txt
> +		cmake_version=$(cmake --version | head -1 | sed
> 's#^[^0-9]*\([0-9.]*\).*$#\1#' )
> +		rm -fr CMakeFiles/$cmake_version/
>  	fi
>  
>  	# Just like autotools cmake can use a site file to cache result
> that need generated binaries to run
> -- 
> 2.17.1
> 


