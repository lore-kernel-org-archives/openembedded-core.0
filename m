Return-Path: <lrannou@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDF1EEB64DA
	for <webhook@archiver.kernel.org>; Fri, 30 Jun 2023 08:55:56 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web10.7887.1688115353295366319
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Jun 2023 01:55:53 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=hxhRbVg1;
 spf=pass (domain: baylibre.com, ip: 209.85.167.50, mailfrom: lrannou@baylibre.com)
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-4f96d680399so2676363e87.0
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Jun 2023 01:55:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1688115351; x=1690707351;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iIfcLYvMaI/pK1A7ShR57OhDFu9NtFmxgRykI4HbySA=;
        b=hxhRbVg1q4+C0yyEvHQVjV60p9Ym2+zQ54T6X8Ep9YHgbEos2+Yh4LnSyEBgz0v4Zd
         bZDZFcBRYLiaf2FkQA6zwiQL8L+a3TkyFjbrrV6MbXRvf1h7YYvVPr1Ga6WrVO9XRdDX
         KvMGZzDm4eE0oaYG2M49owaq8adk3VhujlGTSkjHhCCIcxiyCQuSwwM9l+X1tZasPJhC
         AVDgCDB1U+CX9sagYw4JZ8388j4dpKMeTa91+Nvso9k+1EbzYPLV3ueqwTQ3tI4xMNYq
         DJ+b0uzvIpaphMicT/+Wesn0AiiwdGKkedV4k25m2YxR1onA5STLSytjqbMsb4APYozv
         DwvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688115351; x=1690707351;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iIfcLYvMaI/pK1A7ShR57OhDFu9NtFmxgRykI4HbySA=;
        b=J2xAVFnHxTQ83/iHp3uDr1lO7Sp3iitjlM5JLI17P2ag2nNkQ8k7o+BwDdHNYobWPu
         R/L5airGhtTiZ4VwBsuHg6At1JN9DXTDUK3tT/g7GB3AOXfnoVNCdkFjOXd1+PvtkI/h
         oc4asJ8x+MbiRuPUiwAESvYCt9w3I8XR/RDx4IRPeGlOWfrbza8+Kj4TVDVC0vV2CTOw
         4WTTfg3oE/gXr8CwRY5KUCnXxv6OHkSu+NEHOcNn+IFApSpn1OVNTIBC3ym2b6WdugfX
         RV7m6FeZdA/LhwD5XEyyRo/2mWlF4kU9bEfGjeCi0nsk7rusbw7ks3xJoQ4u66lHHpRj
         wg2Q==
X-Gm-Message-State: ABy/qLbfyOmmUoQ8YEZZFQIjz887dJE+q+QGeS8QWqcl8Ie0r+teoPVX
	ycvGXQSIbPwhn/x1JPraijnz9w==
X-Google-Smtp-Source: APBJJlFlJ9Xg0dGp9ixAoDLoTyet6q2Rs8PR26bmq+FNOyGOJEM/kMjonz2DLtvZdOHzpM10paUoIQ==
X-Received: by 2002:a05:6512:2214:b0:4fb:94fd:6465 with SMTP id h20-20020a056512221400b004fb94fd6465mr2200994lfu.15.1688115351015;
        Fri, 30 Jun 2023 01:55:51 -0700 (PDT)
Received: from [172.30.105.10] (lmontsouris-658-1-109-35.w92-154.abo.wanadoo.fr. [92.154.6.35])
        by smtp.gmail.com with ESMTPSA id f4-20020a1c6a04000000b003fba2734f1esm9619688wmc.1.2023.06.30.01.55.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Jun 2023 01:55:50 -0700 (PDT)
Message-ID: <ec23aac0-2e00-70c8-b89c-258a8bdfb4a6@baylibre.com>
Date: Fri, 30 Jun 2023 10:55:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [OE-core] [PATCH] util-linux: fix the pylibmount installation
 path
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
Cc: khilman@baylibre.com, tgamblin@baylibre.com
References: <20230629-pylibmount-v1-1-342da6733d5d@baylibre.com>
 <496effdc79d480db0c0b3067c9d75b34b32acd8d.camel@linuxfoundation.org>
 <e46ffe6a-662e-4559-b0f2-73e7d4679616@baylibre.com>
 <c60fb36b244f721f2b2e9e47a18482724cc8a233.camel@linuxfoundation.org>
From: Louis Rannou <lrannou@baylibre.com>
In-Reply-To: <c60fb36b244f721f2b2e9e47a18482724cc8a233.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 Jun 2023 08:55:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183687

On 29/06/2023 16:04, Richard Purdie wrote:
> On Thu, 2023-06-29 at 15:50 +0200, Louis Rannou wrote:
>> On 29/06/2023 14:59, Richard Purdie wrote:
>>> On Thu, 2023-06-29 at 12:37 +0000, Louis Rannou wrote:
>>>> Append the install task to move the python library from ${base_libdir}
>>>> to ${PYTHON_SITEPACKAGES_DIR}.
>>>>
>>>> Signed-off-by: Louis Rannou <lrannou@baylibre.com>
>>>> ---
>>>> As we install libraries of util-linux in ${base_libdir} (/lib), the
>>>> python library pylibmount is also installed there. An issue was raised
>>>> when pylibmount was added to PACKAGECONFIG.
>>>> ---
>>>>    meta/recipes-core/util-linux/util-linux_2.38.1.bb | 11 ++++++++++-
>>>>    1 file changed, 10 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/meta/recipes-core/util-linux/util-linux_2.38.1.bb b/meta/recipes-core/util-linux/util-linux_2.38.1.bb
>>>> index 9ea7a04e8a..f9a9fdcfaf 100644
>>>> --- a/meta/recipes-core/util-linux/util-linux_2.38.1.bb
>>>> +++ b/meta/recipes-core/util-linux/util-linux_2.38.1.bb
>>>> @@ -1,7 +1,7 @@
>>>>    require util-linux.inc
>>>>    
>>>>    #gtk-doc is not enabled as it requires xmlto which requires util-linux
>>>> -inherit autotools gettext manpages pkgconfig systemd update-alternatives python3-dir bash-completion ptest
>>>> +inherit autotools gettext manpages pkgconfig systemd update-alternatives python3-dir python3targetconfig bash-completion ptest
>>>>    DEPENDS = "libcap-ng ncurses virtual/crypt zlib util-linux-libuuid"
>>>>    
>>>>    PACKAGES =+ "${PN}-swaponoff"
>>>> @@ -320,3 +320,12 @@ do_install_ptest() {
>>>>            rm -rf ${D}${PTEST_PATH}/tests/ts/chfn
>>>>        fi
>>>>    }
>>>> +
>>>> +do_install:append() {
>>>> +    if [ -d ${D}${base_libdir}/${PYTHON_DIR}/site-packages/libmount ]
>>>> +    then
>>>> +        install -d ${D}${PYTHON_SITEPACKAGES_DIR}
>>>> +        mv ${D}${base_libdir}/${PYTHON_DIR}/site-packages/libmount ${D}${PYTHON_SITEPACKAGES_DIR}/
>>>> +        rm -rf ${D}${base_libdir}/${PYTHON_DIR}
>>>> +    fi
>>>> +}
>>>
>>> When it is being installed, can we not pass the right path into the
>>> build system so it ends up in the right place?
>> I would love that. But the build system installs the libraries and the
>> python package using the same prefix which we specify to ${base_libdir}.
>> I have asked a quick question on IRC. I'll send a mail to the util-linux
>> mailing list if I get no answer.
> 
> Perhaps we should just let util-linux install to libdir instead of
> base_libdir. The reasons for using base_libdir are effectively
> historical now anyway...

I can do that, but if /lib and /usr/lib are distincts we probably 
require util-linux to be in /lib, don't we ? For example, if /usr is a 
separate partition.

Thanks,
Louis

