Return-Path: <lrannou@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5AF9EB64D9
	for <webhook@archiver.kernel.org>; Thu, 29 Jun 2023 13:03:45 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web10.7585.1688043819781160676
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Jun 2023 06:03:40 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=dFiDyPRY;
 spf=pass (domain: baylibre.com, ip: 209.85.128.42, mailfrom: lrannou@baylibre.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-3fba9daf043so6523005e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Jun 2023 06:03:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1688043818; x=1690635818;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=g30U7OKEaW5Yjp5+Wpe3Ubf2Y8zvZwRMYUlxGCZ4MD0=;
        b=dFiDyPRYTVTDypXFRc+fM8PFPxx+LxEAbQeHbVyA7cCM3MvkXwQ2QnNgYAdqTiTCWz
         LQqsxMytpSYE7J3lOcwqj32OKXU0wZDvZhlfg4Zqwn8VnjvZ3EB/+twUK4f6zH75d16a
         8z2DY9fBPFwQ+mHWm2odNsh3ZeJAMCxJjeTlDIQw111zuSrzvAmf/KM3B9M0xdWwhKyL
         vm58xjPlK6ndTaYyznZZX/yH0DRByhWqDM1WDg7ZjmJrPJj7nwruqB3VQjrA++d1Hb6G
         lrn5VTszFmVZukrAa89QUpN91AcHOiKiHbBsRtSlEPc/0LA6YiFOC4R4iAfJfDiYnkOl
         uNSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688043818; x=1690635818;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g30U7OKEaW5Yjp5+Wpe3Ubf2Y8zvZwRMYUlxGCZ4MD0=;
        b=H6eLfMELMIkZCnrqqVtfv6YOJOKFHdDl2rpof71VhCt/mJnERK4mApmSN5kwF3bY40
         iHam/6wkSayqCD/Ba8RaD0C5oxMWDhH1YqWSet2T+ruSWawe4TI834yvUoit6Wp//5o8
         DuVrEbgueJc67t11geZZEBYvCCbSLPlmnCVNStQqmtlX6NRvPOpHQN+1vkk7tCE/m1yb
         7F8t6HoRl9Z29pdToPMjDkKaFpNgZzA2dLDR6cxz6uyXwBDyxP6J2JnDB5lHbr9wZjFR
         6KQT2zVx3ePyICgxXpBEHkHEUJmsvJvSxw7LpP4ArHMrLtg83CTcOsyON7yd4bo5dCMJ
         nvBQ==
X-Gm-Message-State: AC+VfDzAdXx+lkhzcESbPZfJ174zn8+hKW2+3ChygJpRv7voFtpe4osf
	J+8ythZSp3M39REkSA9MYuObNg==
X-Google-Smtp-Source: ACHHUZ7zgCF0K5KB5GU5AogQHrfCUUSAWhESwLiNWM+SEjqUolxtBoDt0sL1Nh6suHTucLJ7wTXYZQ==
X-Received: by 2002:a7b:cd13:0:b0:3fb:b8a6:33f9 with SMTP id f19-20020a7bcd13000000b003fbb8a633f9mr1391289wmj.0.1688043817527;
        Thu, 29 Jun 2023 06:03:37 -0700 (PDT)
Received: from [172.30.105.10] (lmontsouris-658-1-109-35.w92-154.abo.wanadoo.fr. [92.154.6.35])
        by smtp.gmail.com with ESMTPSA id n20-20020a7bcbd4000000b003fb739d27aesm8277849wmi.35.2023.06.29.06.03.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Jun 2023 06:03:36 -0700 (PDT)
Message-ID: <07884e63-56c0-7066-f59c-8acbdee30f11@baylibre.com>
Date: Thu, 29 Jun 2023 15:03:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [OE-core] [PATCH 2/3] systemd: replace the sysusers.d basic
 configuration
Content-Language: en-US
From: Louis Rannou <lrannou@baylibre.com>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Cc: "anuj.mittal@intel.com" <anuj.mittal@intel.com>
References: <20230613-sysusersd-v1-0-eaddf3179773@baylibre.com>
 <20230613-sysusersd-v1-2-eaddf3179773@baylibre.com>
 <DB5PR02MB102132DC9B623E4028A63D376EF58A@DB5PR02MB10213.eurprd02.prod.outlook.com>
 <5a438786-9f24-e30d-ed84-08bf48b7bfd4@baylibre.com>
In-Reply-To: <5a438786-9f24-e30d-ed84-08bf48b7bfd4@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Jun 2023 13:03:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183624

Hello, please find an answer to the last comment

On 19/06/2023 14:10, Louis Rannou wrote:
> Hello,
> 
> On 16/06/2023 18:51, Peter Kjellerstedt wrote:
>>> -----Original Message-----
>>> From: openembedded-core@lists.openembedded.org 
>>> <openembedded-core@lists.openembedded.org> On Behalf Of Louis Rannou
>>> Sent: den 15 juni 2023 13:44
>>> To: openembedded-core@lists.openembedded.org
>>> Cc: Louis Rannou <lrannou@baylibre.com>; anuj.mittal@intel.com
>>> Subject: [OE-core] [PATCH 2/3] systemd: replace the sysusers.d basic 
>>> configuration
>>>
>>> The default sysusers basic.conf.in file sets the root home directory 
>>> to `/root`
>>> and does not permit its configuration. Replace the file delivered by 
>>> systemd so
>>> the root home directory matches the `ROOT_HOME` variable.
>>>
>>> Signed-off-by: Louis Rannou <lrannou@baylibre.com>
>>> ---
>>>   meta/recipes-core/systemd/systemd/basic.conf.in | 40 
>>> +++++++++++++++++++++++++
>>>   meta/recipes-core/systemd/systemd_253.3.bb      |  5 ++++
>>>   2 files changed, 45 insertions(+)
>>>
>>> diff --git a/meta/recipes-core/systemd/systemd/basic.conf.in 
>>> b/meta/recipes-core/systemd/systemd/basic.conf.in
>>> new file mode 100644
>>> index 0000000000..fac288f7fa
>>> --- /dev/null
>>> +++ b/meta/recipes-core/systemd/systemd/basic.conf.in
>>> @@ -0,0 +1,40 @@
>>> +#  This file is part of systemd.
>>> +#
>>> +#  systemd is free software; you can redistribute it and/or modify it
>>> +#  under the terms of the GNU Lesser General Public License as 
>>> published by
>>> +#  the Free Software Foundation; either version 2.1 of the License, or
>>> +#  (at your option) any later version.
>>> +
>>> +# The superuser
>>> +u root    0     "root" :ROOT_HOME:
>>> +
>>> +# The nobody user/group for NFS file systems
>>> +g {{NOBODY_GROUP_NAME}} 65534       -            -
>>> +u {{NOBODY_USER_NAME }} 65534:65534 "Nobody"     -
>>> +
>>> +# Administrator group: can *see* more than normal users
>>> +g adm     {{ADM_GID    }}     -            -
>>> +
>>> +# Administrator group: can *do* more than normal users
>>> +g wheel   {{WHEEL_GID  }}     -            -
>>> +
>>> +# Access to shared database of users on the system
>>> +g utmp    {{UTMP_GID   }}     -            -
>>> +
>>> +# Physical and virtual hardware access groups
>>> +g audio   {{AUDIO_GID  }}     -            -
>>> +g cdrom   {{CDROM_GID  }}     -            -
>>> +g dialout {{DIALOUT_GID}}     -            -
>>> +g disk    {{DISK_GID   }}     -            -
>>> +g input   {{INPUT_GID  }}     -            -
>>> +g kmem    {{KMEM_GID   }}     -            -
>>> +g kvm     {{KVM_GID    }}     -            -
>>> +g lp      {{LP_GID     }}     -            -
>>> +g render  {{RENDER_GID }}     -            -
>>> +g sgx     {{SGX_GID    }}     -            -
>>> +g tape    {{TAPE_GID   }}     -            -
>>> +g tty     {{TTY_GID    }}     -            -
>>> +g video   {{VIDEO_GID  }}     -            -
>>> +
>>> +# Default group for normal users
>>> +g users   {{USERS_GID  }}     -            -
>>> diff --git a/meta/recipes-core/systemd/systemd_253.3.bb 
>>> b/meta/recipes-core/systemd/systemd_253.3.bb
>>> index 45dc6ab5bb..87fbf6f785 100644
>>> --- a/meta/recipes-core/systemd/systemd_253.3.bb
>>> +++ b/meta/recipes-core/systemd/systemd_253.3.bb
>>> @@ -17,6 +17,7 @@ REQUIRED_DISTRO_FEATURES = "systemd"
>>>   SRC_URI += " \
>>>              file://touchscreen.rules \
>>>              file://00-create-volatile.conf \
>>> +           file://basic.conf.in \
>>
>> Instead of including a modified copy of the basic.conf.in file
>> from systemd, include a patch that modifies the file that systemd
>> provides. Otherwise this becomes a maintenance problem where it
>> is easy to miss changes that upstream does to the file, and also
>> hard to know what you have changed.
>>
> This came to my mind, but it seems to me it's a configuration and not a 
> patch. Some distribution as debian generate their own.
> 
>>>              ${@bb.utils.contains('PACKAGECONFIG', 
>>> 'polkit_hostnamed_fallback', 
>>> 'file://org.freedesktop.hostname1_no_polkit.conf', '', d)} \
>>>              ${@bb.utils.contains('PACKAGECONFIG', 
>>> 'polkit_hostnamed_fallback', 'file://00-hostnamed-network-user.conf', 
>>> '', d)} \
>>>              file://init \
>>> @@ -252,6 +253,10 @@ EXTRA_OEMESON += "-Dkexec-path=${sbindir}/kexec \
>>>   # The 60 seconds is watchdog's default vaule.
>>>   WATCHDOG_TIMEOUT ??= "60"
>>>
>>> +do_configure:prepend() {
>>> +  sed s@:ROOT_HOME:@${ROOT_HOME}@g ${WORKDIR}/basic.conf.in > 
>>> ${S}/sysusers.d/basic.conf.in
>>
>> Please indent shell code using tabs, and change the command to:
>>
>>     sed -i s@:ROOT_HOME:@${ROOT_HOME}@g ${S}/sysusers.d/basic.conf.in
>>
>> once you have added the patch as per above.
That's incorrect as the source and destination are different. Perhaps I 
should call the initial file basic.conf.in.in if it's more clear.

>>
>> However, I am wondering if this has to be done during do_configure()?
>> It might become confusing if you ever `devtool modify systemd` (which
>> we do). Wouldn't it be better to do it on the installed file in the
>> do_install() below instead?
This file is used at compilation to produce the basic.conf file. So it's 
needed after the configuration. What would go wrong with devtool ?

>>
>>> +}
>>> +
>>>   do_install() {
>>>       meson_do_install
>>>       install -d ${D}/${base_sbindir}
>>>

Louis

