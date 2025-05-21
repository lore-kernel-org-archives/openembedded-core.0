Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E478C54E65
	for <webhook@archiver.kernel.org>; Wed, 21 May 2025 08:55:35 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web10.6671.1747817729711599486
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 May 2025 01:55:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dzlHpV/A;
 spf=pass (domain: gmail.com, ip: 209.85.218.42, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-ac3eb3fdd2eso1160319066b.0
        for <openembedded-core@lists.openembedded.org>; Wed, 21 May 2025 01:55:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747817728; x=1748422528; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=40Y4iBeEqMUHnsWNAv7deSsJpdVf9HNAJZHQggoB/EQ=;
        b=dzlHpV/ArmltOxpIm2nUrptnzXSIDbl9NYfCc0dWmZFXW4OYZakh89OqZsakCK+9TN
         o8h7Wnos5gq2be0nYCSPb7xcY5DeQbHwjPPVsj80cjiiXtgxEqujPTc0TOtdXoOjLaD4
         HwVwh1N8eXTlypl2zbDYe5mZ/lYARlQ90xN8d8JBVq3bxDljto0Fz0IkdDOQozE5YwRq
         ffxrVkGFORFsjXPcq1wsXHYqxY5KcxYqbW/IFMncm+/EPDLcS5UQLNnvAPCGOz3Jyeve
         JLACsvWbo5ax6gcXumN7gSFGLeIQT9ZgjIlBlzrZ03q7ptIMZD3d2QNzoiesElznkLze
         mzBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747817728; x=1748422528;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=40Y4iBeEqMUHnsWNAv7deSsJpdVf9HNAJZHQggoB/EQ=;
        b=gG0staN098P05PKzMSDHMzANjh3oCHnEc1STOtYDh/rHvhujkmZplvo4IwCZTrCMmd
         P3dTKYv3lblZnmg9vD9tRNU2QuJ3GAHY5RRTIAtaLdCkYDqqKTVDPMVMkp094K30i3nB
         ImmqxYEMzHmIn57oRMLByDwdKtjM7F2OPp8FC+iaC3KCX0XomUA8+YshWt0XMwlx6t4A
         F4Mbti8FwI+svazeH53T8yvtUgEK9OGXfPKPbDlAbntPJx4pb9RrIUk8exwdvcr7XMno
         +ejWnXrlYxPi8qqPap2d/6QDPrXnDy5+8V3VX3Kc6EePl/IIZu/YBiMCwswcpahYYg2/
         CF0Q==
X-Forwarded-Encrypted: i=1; AJvYcCVzC3Q0TaMxFm4oAa19QKMTSwA3wVuN1L4yHPqQEcy/0XnJc7uiOLrvL8wsN3+RShhFzUOvQRjB2vsgsLrLPbY9IQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yz0vS8B90o9E4RbS0k1CnSIMmO50PrTnjraKomT8gKsoOQ+8vkL
	vXAYYrlLNueCoChLIUUFG7JCRJSKIuMA/8HHvK0pxb5HT6JnrVEAu0rHW89t30XR
X-Gm-Gg: ASbGncvFc+zcORcEA9a5yLZ5Rnnlle+RBHtPL7riIjpXCqx33KdBd/eHL2Vpd8ZPZlg
	cUShH4IYPG0rEHn9TJPD6e1hnlMWLFmygOYoCw7TUMCK3y6x65/ashEM9sllUvYzp7M5kB/llKr
	BwEXRO+TKBQnAwKBNL/TEBzNLAniC3x2Smmig7cKsuBDE+0toz4ltZMJDSw2PMFzSx6akD2H+hH
	2boPmJPesKccsCAXqp8mGZrPApsPHS7fJrT41A+t/dSJoCVcU4Mdg3+uocMGVRbTJNeQ5NyxmUP
	7GPusde3ozj/1XWuDSHl2ZECeZCu1pinmr8e35Q5SB7s4vTl6OwWeIQIXS8=
X-Google-Smtp-Source: AGHT+IEf5SyhM9kPw216LSmayto4vTJysHyQRU+LM92iPPdlDlxltKLF0t85HOXv+qsSo/envJbLCQ==
X-Received: by 2002:a17:907:7254:b0:ad5:7234:e4a9 with SMTP id a640c23a62f3a-ad57234e7e0mr1025734566b.28.1747817727571;
        Wed, 21 May 2025 01:55:27 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d4383f8sm860845966b.113.2025.05.21.01.55.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 May 2025 01:55:26 -0700 (PDT)
Message-ID: <a4e6e52e-b27a-496f-a715-24ceca866ab6@gmail.com>
Date: Wed, 21 May 2025 10:55:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 1/1] autotools.bbclass: Copy
 gettext/po/Makefile.in.in to all po/Makefile.in.in
To: liezhi.yang@windriver.com, openembedded-core@lists.openembedded.org
References: <cover.1747817251.git.liezhi.yang@windriver.com>
 <ec444128381202080ec89649e127d0e6ae6cbdf5.1747817251.git.liezhi.yang@windriver.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <ec444128381202080ec89649e127d0e6ae6cbdf5.1747817251.git.liezhi.yang@windriver.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 May 2025 08:55:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217007



On 5/21/25 10:50, Robert Yang via lists.openembedded.org wrote:
> From: Robert Yang <liezhi.yang@windriver.com>
>
> The previous code only copied to ${S}/po/Makefile.in.in, but there might be
> other po/Makefile.in.in in ${S}, for example:
> * bison:
>   runtime-po/Makefile.in.in
>   gnulib-po/Makefile.in.in
>
> * gawk:
>   extension/po/Makefile.in.in
>
> * fontconfig
>   po-conf/Makefile.in.in
>
> * There might be more recipes in oe-core, and more recipes from other layers.
>
> The build would be failed after upgrade gettext to 0.24.1 since gettext changed
> the way to include Makevars, so we have to fix the recipes one by one, such as:
> do_configure:prepend() {
>     cp -f ${STAGING_DATADIR_NATIVE}/gettext/po/Makefile.in.in ${S}/runtime-po/
>     cp -f ${STAGING_DATADIR_NATIVE}/gettext/po/Makefile.in.in ${S}/gnulib-po/
> }
>
> Even if we don't upgrade gettext to 0.24.1, have different po/Makefile.in.in in
> the same ${S} is a kind of bug, this patch can fix the issues.
>
> The fix way is:
> Find all possible po/Makefile.in.in, if it is the same as ${S}/po/Makefile.in.in,
> then override it with ${STAGING_DATADIR_NATIVE}/gettext/po/Makefile.in.in.
>
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  meta/classes-recipe/autotools.bbclass | 22 +++++++++++++++++++++-
>  1 file changed, 21 insertions(+), 1 deletion(-)
>
> diff --git a/meta/classes-recipe/autotools.bbclass b/meta/classes-recipe/autotools.bbclass
> index 948f8c183a..d4138bfc57 100644
> --- a/meta/classes-recipe/autotools.bbclass
> +++ b/meta/classes-recipe/autotools.bbclass
> @@ -188,8 +188,28 @@ autotools_do_configure() {
>  		elif [ "${BPN}" != "gettext" ] && grep -q "^[[:space:]]*AM_GNU_GETTEXT" $CONFIGURE_AC; then
>  			# We'd call gettextize here if it wasn't so broken...
>  			cp ${STAGING_DATADIR_NATIVE}/gettext/config.rpath ${AUTOTOOLS_AUXDIR}/
> +			# Find all possible po/Makefile.in.in, if it is the same as
> +			# po/Makefile.in.in, then override it with
> +			# ${STAGING_DATADIR_NATIVE}/gettext/po/Makefile.in.in.
>  			if [ -d ${S}/po/ ]; then
> -				cp -f ${STAGING_DATADIR_NATIVE}/gettext/po/Makefile.in.in ${S}/po/
> +				makefile_in_in_top=${S}/po/Makefile.in.in
> +				need_copy=$makefile_in_in_top
> +				if [ -f $makefile_in_in_top ]; then
> +					makefile_in_ins="$(find ${S} -name Makefile.in.in)"
> +					for makefile_in_in in $makefile_in_ins; do
> +						if [ $makefile_in_in != $makefile_in_in_top ]; then
> +							diff="$(diff ${S}/po/Makefile.in.in $makefile_in_in)"
> +							if [ -z $difff ]; then
There seems to be an extra f (difff vs diff)
> +								need_copy="$need_copy $makefile_in_in"
> +							fi
> +						fi
> +					done
> +				fi
> +				for makefile in $need_copy; do
> +					cmd="cp -f ${STAGING_DATADIR_NATIVE}/gettext/po/Makefile.in.in $makefile"
> +					bbnote "Running $cmd"
> +					$cmd
> +				done
>  				if [ ! -e ${S}/po/remove-potcdate.sed ]; then
>  					cp ${STAGING_DATADIR_NATIVE}/gettext/po/remove-potcdate.sed ${S}/po/
>  				fi
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#217006): https://lists.openembedded.org/g/openembedded-core/message/217006
> Mute This Topic: https://lists.openembedded.org/mt/113225997/6084445
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


