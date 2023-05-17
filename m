Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5269C77B7D
	for <webhook@archiver.kernel.org>; Wed, 17 May 2023 16:16:30 +0000 (UTC)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
 by mx.groups.io with SMTP id smtpd.web11.54776.1684340183804186262
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 May 2023 09:16:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=xjt7pud9;
 spf=pass (domain: baylibre.com, ip: 209.85.160.176, mailfrom: tgamblin@baylibre.com)
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-3f529239e4aso10821261cf.0
        for <openembedded-core@lists.openembedded.org>; Wed, 17 May 2023 09:16:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1684340183; x=1686932183;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BI1Hyjur6XdaOKZG8wtcaRegU83gbQ1AFc7op1i6gpA=;
        b=xjt7pud9tKu49w3iX3gqvHIE4kIYjBsDbAa5TO1jnNLi0XdCkJRRogFV4jEqAjpQrw
         iTVU8XfV5uwJipwpAJqc0rGF5uaC8roUJPjoDmsieWxNEyCaEXbDsiWQk1m5tQa65WnA
         vs9X8Kj0yxFJjbKMMk0XYnzx4D7cW4Pj8pn+TYCnsdOqis5Itmz1m2RC2eI0HpvsjfDd
         xQ496dilMPQkgZhD/iuY/XXMbsuCaHdWIhPLTmVzZNAS0R+bmGBomf61UulJ0lGrfnxa
         mSq3ZfXwTu86ikVXUfw87NyKgjlv4B88v69hc2Z8aoG3ESchvvdxUfbhOVIFbdVFp7Oj
         jUhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684340183; x=1686932183;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BI1Hyjur6XdaOKZG8wtcaRegU83gbQ1AFc7op1i6gpA=;
        b=g+FaJAMeL82gy1CcAUSNIlsdkBZqE8rw8J5sHGeYoMT+DhR4MUD4PupnApe9OEw18T
         K+NVok0pXg6AKvNJlxTtkXSCxyM9OB+dw1rUmf3GY/k6PYT1U2yJjHNUjeyRaHm2TO6L
         EvK18CkbE882ruRwnHWW8SWHF24hLqymAcRvQG9a6P+U+m+CuJ2HAgP9YWvp1NOgynoW
         /2nwGLYdxz4PZOiu8LoLdw2c/94jEEftT9Ptxu9PtiOKCEcN/fA6z7ZiFUr/EXKA7xD0
         sE9W24fPLcOUkYlcegvdlAZJZ2sJfiVPk2/3gBNhTcchYqN1vnd3fprICgdpQSevCXRI
         moyg==
X-Gm-Message-State: AC+VfDx4DROcTF7z2bjOEgr9cfHsmrBTrJylEQ2KMhXHVc39C5GvPDlY
	ug+9DrI6SPCQoRVkE4KNXtiOGw==
X-Google-Smtp-Source: ACHHUZ5IChSBLx5JMBP8UW7Mz/zJgXm5DEMyOoRKXtI2taFf2NZeBHh3Gq6KPL7eGLEjyvNO256kUQ==
X-Received: by 2002:a05:622a:1013:b0:3f4:fc61:983f with SMTP id d19-20020a05622a101300b003f4fc61983fmr388970qte.17.1684340182951;
        Wed, 17 May 2023 09:16:22 -0700 (PDT)
Received: from [192.168.0.195] (cpe64777de11593-cm64777de11590.cpe.net.cable.rogers.com. [174.115.224.47])
        by smtp.gmail.com with ESMTPSA id ey16-20020a05622a4c1000b003f3941ba4d9sm4568441qtb.32.2023.05.17.09.16.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 May 2023 09:16:22 -0700 (PDT)
Message-ID: <6c6ca6c1-3052-5a3b-5173-df780d77a64b@baylibre.com>
Date: Wed, 17 May 2023 12:16:21 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [OE-core][PATCH 06/20] python3-libfdt: new package
Content-Language: en-US
To: Bartosz Golaszewski <brgl@bgdev.pl>, Khem Raj <raj.khem@gmail.com>,
 Bruce Ashfield <bruce.ashfield@gmail.com>,
 openembedded-core@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20230517080639.9336-1-brgl@bgdev.pl>
 <20230517080639.9336-7-brgl@bgdev.pl>
From: Trevor Gamblin <tgamblin@baylibre.com>
In-Reply-To: <20230517080639.9336-7-brgl@bgdev.pl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 May 2023 16:16:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181495


On 2023-05-17 04:06, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Add a recipe for python bindings for libfdt (spun out of upstream dtc)
> fetched from pypi.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>   .../python/python3-libfdt_1.7.0.post1.bb      | 20 +++++++++++++++++++
>   1 file changed, 20 insertions(+)
>   create mode 100644 meta/recipes-devtools/python/python3-libfdt_1.7.0.post1.bb
>
> diff --git a/meta/recipes-devtools/python/python3-libfdt_1.7.0.post1.bb b/meta/recipes-devtools/python/python3-libfdt_1.7.0.post1.bb
> new file mode 100644
> index 0000000000..1ff3decbb9
> --- /dev/null
> +++ b/meta/recipes-devtools/python/python3-libfdt_1.7.0.post1.bb
> @@ -0,0 +1,20 @@
> +SUMMARY = "Python bindings for libfdt."
> +LICENSE = "GPL-2.0-only | BSD-2-Clause"
> +LIC_FILES_CHKSUM = " \
> +    file://BSD-2-Clause;md5=5d6306d1b08f8df623178dfd81880927 \
> +    file://GPL;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
> +"
> +
> +inherit pypi setuptools3
> +
> +PYPI_PACKAGE = "pylibfdt"
> +
> +SRC_URI[sha256sum] = "2d048f9f8ce9a0527d497f423dea1f1135f9811c05b009cc5d5753771c1f9ba1"
> +
> +BBCLASSEXTEND = "native nativesdk"
> +
> +DEPENDS += " \
> +    python3-pip-native \
> +    python3-setuptools-scm-native \
> +    swig-native \
> +"
Can you also add this recipe to the 
meta/conf/distro/include/maintainers.inc file?
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#181455): https://lists.openembedded.org/g/openembedded-core/message/181455
> Mute This Topic: https://lists.openembedded.org/mt/98944002/7611679
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [tgamblin@baylibre.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

