Return-Path: <lrannou@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6979EB64D9
	for <webhook@archiver.kernel.org>; Thu, 29 Jun 2023 13:51:05 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web10.8882.1688046661473272350
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Jun 2023 06:51:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=f0Gw0H8t;
 spf=pass (domain: baylibre.com, ip: 209.85.128.44, mailfrom: lrannou@baylibre.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-3fbac8b01b3so5768085e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Jun 2023 06:51:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1688046659; x=1690638659;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=de8C26nywCWmDFsAZffdkBkjvgmQCs6vkiQT0jX0Mxs=;
        b=f0Gw0H8tB0lIcwUx7wvhK081Gx/J16eq8CDsGNbSYIgu8V+jpMAfivb0GkAvmTMJYN
         lRxCaAvb2AQpXpMer5VfRWmnMvx2z+y1gbJSpANsFFEFL4aKxS6qL/gUx58GmXtycuFP
         41WVhfy9WaOGVQWEVozGjwLGb6MefPL2LSURQY9ghDYSr2kQ3qvnOiEIvsxBMTgg9MOJ
         tv9BGmy/uT0jhlkh+vgz8iEacC/CsSQnRg61DAfAPBX0pIXaZKEhotGMfuWA27cCsPXC
         ujIFW6jfF6u1bhrhycl+DCnjvQ13imJfB1NmXrwHq2LTGrP//E+i2UOagP6MXIzEisyz
         kVRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688046659; x=1690638659;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=de8C26nywCWmDFsAZffdkBkjvgmQCs6vkiQT0jX0Mxs=;
        b=KhYZWIwMeEfMJ1T2bAUQMw8t1mVIf+Ge92QDroUqwiA4ABk78w+HItQ6iwDTPocvWg
         /7oUXjdt5H0eiZFMaCZIP478yxNlbuf0uqkKnQNcgJbLl4QtItHl0n5pN1SRB77IfqN9
         IJ/UtwtpU0goAgbpKNYBtP51S9rFiJqC0+i3cibfIwydyQ9cOt1MjJ2RhTJMGEPP64TS
         7UmW5ioRASuFirnEwzNdbzYpu5Hbr4JttWzM0H19TWph5q1Rlfl8YrHZL1kqt/sJPShA
         Ya7y84LJGSx4V+GsyiIoIcEvlK+/ELkgxIiIRX4DiS6fZXcsKqgduYPGA90sZr5MRUTz
         4URg==
X-Gm-Message-State: AC+VfDzOV3TtXKfhmW3o9edePJB+0ZvsRQgYaVLfetgEi2aAGNMUNyF/
	Ag0bfgPGNXt1yEeLPFjXGMd5SQ==
X-Google-Smtp-Source: ACHHUZ7yylmc6Zky3WRPCzYvEIBT6vMEhV+7/9h83Ym1s4332e3PDkI5aGUe2kK6O0UiI8FQFJiulg==
X-Received: by 2002:a05:600c:4196:b0:3fa:ef97:1fa5 with SMTP id p22-20020a05600c419600b003faef971fa5mr4774292wmh.6.1688046659656;
        Thu, 29 Jun 2023 06:50:59 -0700 (PDT)
Received: from [172.30.105.10] (lmontsouris-658-1-109-35.w92-154.abo.wanadoo.fr. [92.154.6.35])
        by smtp.gmail.com with ESMTPSA id y9-20020a7bcd89000000b003fbb5506e54sm3020930wmj.29.2023.06.29.06.50.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Jun 2023 06:50:59 -0700 (PDT)
Message-ID: <e46ffe6a-662e-4559-b0f2-73e7d4679616@baylibre.com>
Date: Thu, 29 Jun 2023 15:50:58 +0200
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
From: Louis Rannou <lrannou@baylibre.com>
In-Reply-To: <496effdc79d480db0c0b3067c9d75b34b32acd8d.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Jun 2023 13:51:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183627

On 29/06/2023 14:59, Richard Purdie wrote:
> On Thu, 2023-06-29 at 12:37 +0000, Louis Rannou wrote:
>> Append the install task to move the python library from ${base_libdir}
>> to ${PYTHON_SITEPACKAGES_DIR}.
>>
>> Signed-off-by: Louis Rannou <lrannou@baylibre.com>
>> ---
>> As we install libraries of util-linux in ${base_libdir} (/lib), the
>> python library pylibmount is also installed there. An issue was raised
>> when pylibmount was added to PACKAGECONFIG.
>> ---
>>   meta/recipes-core/util-linux/util-linux_2.38.1.bb | 11 ++++++++++-
>>   1 file changed, 10 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-core/util-linux/util-linux_2.38.1.bb b/meta/recipes-core/util-linux/util-linux_2.38.1.bb
>> index 9ea7a04e8a..f9a9fdcfaf 100644
>> --- a/meta/recipes-core/util-linux/util-linux_2.38.1.bb
>> +++ b/meta/recipes-core/util-linux/util-linux_2.38.1.bb
>> @@ -1,7 +1,7 @@
>>   require util-linux.inc
>>   
>>   #gtk-doc is not enabled as it requires xmlto which requires util-linux
>> -inherit autotools gettext manpages pkgconfig systemd update-alternatives python3-dir bash-completion ptest
>> +inherit autotools gettext manpages pkgconfig systemd update-alternatives python3-dir python3targetconfig bash-completion ptest
>>   DEPENDS = "libcap-ng ncurses virtual/crypt zlib util-linux-libuuid"
>>   
>>   PACKAGES =+ "${PN}-swaponoff"
>> @@ -320,3 +320,12 @@ do_install_ptest() {
>>           rm -rf ${D}${PTEST_PATH}/tests/ts/chfn
>>       fi
>>   }
>> +
>> +do_install:append() {
>> +    if [ -d ${D}${base_libdir}/${PYTHON_DIR}/site-packages/libmount ]
>> +    then
>> +        install -d ${D}${PYTHON_SITEPACKAGES_DIR}
>> +        mv ${D}${base_libdir}/${PYTHON_DIR}/site-packages/libmount ${D}${PYTHON_SITEPACKAGES_DIR}/
>> +        rm -rf ${D}${base_libdir}/${PYTHON_DIR}
>> +    fi
>> +}
> 
> When it is being installed, can we not pass the right path into the
> build system so it ends up in the right place?
I would love that. But the build system installs the libraries and the 
python package using the same prefix which we specify to ${base_libdir}. 
I have asked a quick question on IRC. I'll send a mail to the util-linux 
mailing list if I get no answer.

Louis

