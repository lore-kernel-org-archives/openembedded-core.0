Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
	[209.85.221.49])
	by mail.openembedded.org (Postfix) with ESMTP id 5AB9260557
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Sep 2018 09:12:47 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id k5-v6so3109927wre.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Sep 2018 02:12:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=QuO+YMkWC2+mr51wRvLMKEjaBb1mZIkEsTNxFBm2LZI=;
	b=RSJ7wKxMP5CpRr7ZMmXNWE0wVuKGPL+pR8x/zzr/F5pmiXohEpNY6eEdwuaRWqGDKK
	cHk8rcEIf8h0jKN+FZlNFYH3ne5Rti6mMngDBm8X5yqeiL3lV8t8D+Feg4Ap3lM5jvI7
	aptasBDVU/4FpMK0ndyunPzJ1zxuxWd3s4JBg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=QuO+YMkWC2+mr51wRvLMKEjaBb1mZIkEsTNxFBm2LZI=;
	b=LGWEdw4A9keq6NS9siC8760ROi75tWtABdm4i6v9urDSqlaEbYGac3XDHruxGeCJF9
	lcW3MZhIVR9BTbchNzz/deHXxO4YqRMp/i9yx4Zq4HYGUDDDREBejSaw4qXV0+6F8ctg
	kxRyj5Utr0entS3OrVRwd26eDIrqavspYvODH7PP7WuOwccqE5Gww2acIEGnNZoBq240
	1s2/kaKOR4aWvUIj1y0Rx1abt8QrB8qUWNbYzprhy9OLC8syfB6ZAs+tXj0PJ6m15zuI
	ZuQvxCjmpGb4e4U2ByTdMPgouMRMrlmOuEl+h6fd/QyM75s6Neyj/YP+Xgx+Jj8iKcpS
	Cwqw==
X-Gm-Message-State: APzg51AessUUn6RmD/dIu9Z0aBWyIPUAeneW2XmV7wzI8zwbya7z6Er8
	wCNua8kKpw2R/gsamnwaK5WyEQ==
X-Google-Smtp-Source: ANB0Vdbk0JHlQzMz9YWjxiGGeIwGJegvNLAkq0+7BRSnuTA/Cb3CuQtVKMerlaO5AH2LHTxt6ZnKhQ==
X-Received: by 2002:adf:9081:: with SMTP id
	i1-v6mr22667209wri.271.1536052368164; 
	Tue, 04 Sep 2018 02:12:48 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	h17-v6sm19439154wrq.73.2018.09.04.02.12.46
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 04 Sep 2018 02:12:47 -0700 (PDT)
Message-ID: <040ce37698d169827043fa7ca17e2509a45cd58f.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Kai Kang <kai.kang@windriver.com>
Date: Tue, 04 Sep 2018 10:12:45 +0100
In-Reply-To: <9ae08680d92897330510b0de660a9b2afc7d00bb.1535288685.git.kai.kang@windriver.com>
References: <cover.1535288685.git.kai.kang@windriver.com>
	<9ae08680d92897330510b0de660a9b2afc7d00bb.1535288685.git.kai.kang@windriver.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/6] update_font_cache: update script for multilib
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
X-List-Received-Date: Tue, 04 Sep 2018 09:12:47 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2018-08-26 at 06:06 -0700, Kai Kang wrote:
> Packages which inherit fontcache.bbclass call postinstall script
> update_font_cache. And in update_font_cache, it calls ${bindir}/fc-
> cache
> by qemuwrapper. When multilib is enabled, both packages foo and
> lib32-foo
> will call ${bindir}/fc-cache and one of them will fail to run
> obviously.
> 
> Duplicate install file fc-cache to ${libexecdir} with ${MLPREFIX} and
> call proper fc-cache in update_font_cache.
> 
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>  meta/recipes-graphics/fontconfig/fontconfig_2.12.6.bb | 8 +++++++-
>  scripts/postinst-intercepts/update_font_cache         | 2 +-
>  2 files changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/recipes-graphics/fontconfig/fontconfig_2.12.6.bb
> b/meta/recipes-graphics/fontconfig/fontconfig_2.12.6.bb
> index d4cbce80b45..db36c867741 100644
> --- a/meta/recipes-graphics/fontconfig/fontconfig_2.12.6.bb
> +++ b/meta/recipes-graphics/fontconfig/fontconfig_2.12.6.bb
> @@ -35,9 +35,15 @@ do_configure_prepend() {
>      rm -f ${S}/src/fcobjshash.h ${S}/src/fcobjshash.gperf
>  }
>  
> +do_install_append_class-target() {
> +    # duplicate fc-cache for postinstall script
> +    mkdir -p ${D}${libexecdir}
> +    cp ${D}${bindir}/fc-cache ${D}${libexecdir}/${MLPREFIX}fc-cache

We may as well hardlink this, same for the following patch too.

Cheers,

Richard

