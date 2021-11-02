Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4C65C433FE
	for <webhook@archiver.kernel.org>; Tue,  2 Nov 2021 17:41:17 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web09.1348.1635874877009505778
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Nov 2021 10:41:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=KX31I/qh;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id d3so34491370wrh.8
        for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Nov 2021 10:41:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=p6u9f+K8lItyVhKwq1v6inXENaXW4Jd/GlrVbTNPHyg=;
        b=KX31I/qhUw7CgH6GxRSlL4NBlo26HaE0YG/wjChNOy4nASzO7NuuLFGNph1yyUJQa5
         94H18WDzmaEOt/HtS42O5df1T5vB33KKPrCMldcSwZmQHLIJ/LBuKzcslRVOQALgSOE6
         yYlJ2xF0XHXJgkn1ZpXbMJuMgXE2Akqx4OyUc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=p6u9f+K8lItyVhKwq1v6inXENaXW4Jd/GlrVbTNPHyg=;
        b=x1GsNY5qeh2WI5M7/KxwxC6ERZ/Tfe9noxt5elpCMhWket1Um/c71ghBsrgnEaieo4
         q1FnVYSCs2EvNuvs5UMcByS26LUN3Vv/yCOdTQtUguRpZbOj1yQXRwioTgKO+jlYkq0K
         OjFBKF83NR+ui1vSdbLhYFkv/giwZkihkzrrpjWZAKEi1tBWkbIxcl5ORTfwsAlIyPpP
         BBy8YoBUVCKscWhtsjqYqqBUHM+W9k28CiRglYW7sOHTrIB0D3JIP4N9ecDP/tgW8sA/
         jhYTmArUNzkNxxmbgxc3MXL5sHf/caI+EGddfxeO6kHj0XRNdUqjYCdNUYUZFdlxBjD/
         PlBQ==
X-Gm-Message-State: AOAM532QpJGxuJ5FqgkUIJh3VKx0HkUh5rQ0+bs3FP3BP4yr2HgSGRBO
	kF/5Rlt00HAPXYsgwKPCh2MhjA==
X-Google-Smtp-Source: 
 ABdhPJxSjIfP04pUxpdnnp9CKcqXF5bfeZpU14PKugp65hZ/+n1lrv0BGTYQHuWfnbRnhnHOkPF58w==
X-Received: by 2002:a5d:6d84:: with SMTP id l4mr8473004wrs.266.1635874875439;
        Tue, 02 Nov 2021 10:41:15 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:e05:60cd:475e:19f5?
 ([2001:8b0:aba:5f3c:e05:60cd:475e:19f5])
        by smtp.gmail.com with ESMTPSA id
 b10sm2019449wrt.36.2021.11.02.10.41.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Nov 2021 10:41:14 -0700 (PDT)
Message-ID: 
 <e6706026d4bebc338889dea72bb59d7560a8ed0d.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCHv4 3/4] apt: Do not install /var/log/apt
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	openembedded-core@lists.openembedded.org
Date: Tue, 02 Nov 2021 17:41:12 +0000
In-Reply-To: <20211101000343.18979-3-pkj@axis.com>
References: <20211101000343.18979-1-pkj@axis.com>
	 <20211101000343.18979-3-pkj@axis.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Nov 2021 17:41:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157805

On Mon, 2021-11-01 at 01:03 +0100, Peter Kjellerstedt wrote:
> /var/log is normally a link to /var/volatile/log and /var/volatile is a
> tmpfs mount. So anything created in /var/log will not be available when
> the tmpfs is mounted.
> 
> Also some whitespace clean up.
> 
> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> ---
>  meta/recipes-devtools/apt/apt_2.2.4.bb | 30 ++++++++++++++------------
>  1 file changed, 16 insertions(+), 14 deletions(-)
> 
> diff --git a/meta/recipes-devtools/apt/apt_2.2.4.bb b/meta/recipes-devtools/apt/apt_2.2.4.bb
> index 29fc49fb39..3d88371169 100644
> --- a/meta/recipes-devtools/apt/apt_2.2.4.bb
> +++ b/meta/recipes-devtools/apt/apt_2.2.4.bb
> @@ -51,9 +51,8 @@ EXTRA_OECMAKE:append = " -DCURRENT_VENDOR=debian -DWITH_DOC=False \
>      -DWITH_TESTS=False \
>  "
>  
> -do_configure:prepend () {
> -    echo "set( CMAKE_FIND_ROOT_PATH_MODE_INCLUDE BOTH )" >>  ${WORKDIR}/toolchain.cmake
> -
> +do_configure:prepend() {
> +	echo "set( CMAKE_FIND_ROOT_PATH_MODE_INCLUDE BOTH )" >>  ${WORKDIR}/toolchain.cmake
>  }
>  
>  # Unfortunately apt hardcodes this all over the place
> @@ -61,7 +60,7 @@ FILES:${PN} += "${prefix}/lib/dpkg ${prefix}/lib/apt"
>  RDEPENDS:${PN} += "bash perl dpkg"
>  
>  customize_apt_conf_sample() {
> -    cat > ${D}${sysconfdir}/apt/apt.conf.sample << EOF
> +	cat > ${D}${sysconfdir}/apt/apt.conf.sample << EOF
>  Dir "${STAGING_DIR_NATIVE}/"
>  {
>     State "var/lib/apt/"
> @@ -114,22 +113,25 @@ EOF
>  }
>  
>  do_install:append:class-native() {
> -    customize_apt_conf_sample
> +	customize_apt_conf_sample
>  }
>  
>  do_install:append:class-nativesdk() {
> -    customize_apt_conf_sample
> +	customize_apt_conf_sample
>  }
>  
> -
>  do_install:append:class-target() {
> -    #Write the correct apt-architecture to apt.conf
> -    APT_CONF=${D}/etc/apt/apt.conf
> -    echo 'APT::Architecture "${DPKG_ARCH}";' > ${APT_CONF}
> +	# Write the correct apt-architecture to apt.conf
> +	APT_CONF=${D}${sysconfdir}/apt/apt.conf
> +	echo 'APT::Architecture "${DPKG_ARCH}";' > ${APT_CONF}
>  }
>  
> -# Avoid non-reproducible -src package
> -do_install:append () {
> -        sed -i -e "s,${B},,g" \
> -            ${B}/apt-pkg/tagfile-keys.cc
> +do_install:append() {
> +	# Remove /var/log/apt. /var/log is normally a link to /var/volatile/log
> +	# and /var/volatile is a tmpfs mount. So anything created in /var/log
> +	# will not be available when the tmpfs is mounted.
> +	rm -rf ${D}${localstatedir}/log
> +
> +	# Avoid non-reproducible -src package
> +	sed -i -e "s,${B},,g" ${B}/apt-pkg/tagfile-keys.cc
>  }

I didn't bisect it down but this looks likely to be from this change:

https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/2796/steps/14/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/50/builds/4279/steps/11/logs/stdio

https://autobuilder.yoctoproject.org/typhoon/#/builders/76/builds/4260/steps/14/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/115/builds/919/steps/12/logs/stdio
(and more)

Cheers,

Richard


