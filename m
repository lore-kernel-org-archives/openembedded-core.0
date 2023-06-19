Return-Path: <lrannou@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E3DFEB64D9
	for <webhook@archiver.kernel.org>; Mon, 19 Jun 2023 12:27:33 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web11.6193.1687177644426212018
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Jun 2023 05:27:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=Ff7gbhi2;
 spf=pass (domain: baylibre.com, ip: 209.85.128.41, mailfrom: lrannou@baylibre.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-3f90b4ac529so18020115e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 19 Jun 2023 05:27:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1687177642; x=1689769642;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KFG32g8+0l5x/QJWzntZ9P7RfhuE6rlQ3CzUB7m7Ym0=;
        b=Ff7gbhi2+v0W/z6K/84zfnj0HP6WFyhETooyh8fABkZCcgsw4WLlLYybFbOKHIb+TD
         RO8gVVNdLT1zOZRbaNvbNOYqouCShPHXPIOnu53hruOxz9RAhf+bfsLRwhvHkRRmtK9c
         yyEdIh205DpdMoOEcHQky2CNRufUxd2+UK48/59p5xe5KfRTfbHMKkfE9j/49hh+bh27
         OXguCFs5BcWujQtBoLw0oCIac8MPH0CJb7GGgTfDVt+iWZ2pR7pDBGNzcVZPatb9tOk2
         JNLmERsP3B+96xR08GqdFSXP38Xs3LiKKZZm+HiI2msxrGflsn7epsq+2rPMWaKueRIh
         DymA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687177642; x=1689769642;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KFG32g8+0l5x/QJWzntZ9P7RfhuE6rlQ3CzUB7m7Ym0=;
        b=ctN5xby4+EUP1vsyC46y/GNqjQ8eHohuxqQkHMb5skLPmLEC/o+paYNKR23qM9J194
         g1Dmmc25p0dIZCIs0WsIEBf5UM4InCjFvFJrpEJvJ6jT6p2IZYYsiPhH6pj6gPUPIDaM
         DwWqquNk5AWagBVyC5HrjkapraNuFDXbHaAC4p1U6IqGW7n24z//YUvLBSxJBDHUWdR4
         644YKi0jNUvAz6dm1ilDqjLth/PSdBUVq8O/BU0vRCJMdNC8DbNbHqAmicKYnZ+v4G82
         e1RkDiBK92J3EqDm95okOOcThkvUvxsDuVHxybrs/Tj6yanUQ77bajXayIaB5jU2EGwP
         I/4A==
X-Gm-Message-State: AC+VfDwk6/K44+tFDhq7kShlSXsh4dlGMArUCZgtsY67XTRKCkUb7+oV
	ZUXzcKHoWPvwUCDERIKbM3znNw==
X-Google-Smtp-Source: ACHHUZ7o7r+6O8Xn2T3KnT39ZNid0Hk87NKeNRqwtX9H06bL/7HbJHD6cxl5Bzd9zqMEr/UL+17RWw==
X-Received: by 2002:a05:600c:3782:b0:3f8:d66f:db3b with SMTP id o2-20020a05600c378200b003f8d66fdb3bmr7957440wmr.30.1687177641814;
        Mon, 19 Jun 2023 05:27:21 -0700 (PDT)
Received: from [172.30.105.10] (lmontsouris-658-1-109-35.w92-154.abo.wanadoo.fr. [92.154.6.35])
        by smtp.gmail.com with ESMTPSA id e40-20020a5d5968000000b002fda1b12a0bsm31635447wri.2.2023.06.19.05.27.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jun 2023 05:27:21 -0700 (PDT)
Message-ID: <96ab9d01-6ba4-0ed7-de6d-6a938e7a28ef@baylibre.com>
Date: Mon, 19 Jun 2023 14:27:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [OE-core] [PATCH 2/3] systemd: replace the sysusers.d basic
 configuration
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Cc: "anuj.mittal@intel.com" <anuj.mittal@intel.com>
References: <20230613-sysusersd-v1-0-eaddf3179773@baylibre.com>
 <20230613-sysusersd-v1-2-eaddf3179773@baylibre.com>
 <DB5PR02MB102132DC9B623E4028A63D376EF58A@DB5PR02MB10213.eurprd02.prod.outlook.com>
Content-Language: en-US
From: Louis Rannou <lrannou@baylibre.com>
In-Reply-To: <DB5PR02MB102132DC9B623E4028A63D376EF58A@DB5PR02MB10213.eurprd02.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Jun 2023 12:27:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183104

Hello,

On 16/06/2023 18:51, Peter Kjellerstedt wrote:
>> -----Original Message-----
>> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.openembedded.org> On Behalf Of Louis Rannou
>> Sent: den 15 juni 2023 13:44
>> To: openembedded-core@lists.openembedded.org
>> Cc: Louis Rannou <lrannou@baylibre.com>; anuj.mittal@intel.com
>> Subject: [OE-core] [PATCH 2/3] systemd: replace the sysusers.d basic configuration
>>
>> The default sysusers basic.conf.in file sets the root home directory to `/root`
>> and does not permit its configuration. Replace the file delivered by systemd so
>> the root home directory matches the `ROOT_HOME` variable.
>>
>> Signed-off-by: Louis Rannou <lrannou@baylibre.com>
>> ---
>>   meta/recipes-core/systemd/systemd/basic.conf.in | 40 +++++++++++++++++++++++++
>>   meta/recipes-core/systemd/systemd_253.3.bb      |  5 ++++
>>   2 files changed, 45 insertions(+)
>>
>> diff --git a/meta/recipes-core/systemd/systemd/basic.conf.in b/meta/recipes-core/systemd/systemd/basic.conf.in
>> new file mode 100644
>> index 0000000000..fac288f7fa
>> --- /dev/null
>> +++ b/meta/recipes-core/systemd/systemd/basic.conf.in
>> @@ -0,0 +1,40 @@
>> +#  This file is part of systemd.
>> +#
>> +#  systemd is free software; you can redistribute it and/or modify it
>> +#  under the terms of the GNU Lesser General Public License as published by
>> +#  the Free Software Foundation; either version 2.1 of the License, or
>> +#  (at your option) any later version.
>> +
>> +# The superuser
>> +u root    0     "root" :ROOT_HOME:
>> +
>> +# The nobody user/group for NFS file systems
>> +g {{NOBODY_GROUP_NAME}} 65534       -            -
>> +u {{NOBODY_USER_NAME }} 65534:65534 "Nobody"     -
>> +
>> +# Administrator group: can *see* more than normal users
>> +g adm     {{ADM_GID    }}     -            -
>> +
>> +# Administrator group: can *do* more than normal users
>> +g wheel   {{WHEEL_GID  }}     -            -
>> +
>> +# Access to shared database of users on the system
>> +g utmp    {{UTMP_GID   }}     -            -
>> +
>> +# Physical and virtual hardware access groups
>> +g audio   {{AUDIO_GID  }}     -            -
>> +g cdrom   {{CDROM_GID  }}     -            -
>> +g dialout {{DIALOUT_GID}}     -            -
>> +g disk    {{DISK_GID   }}     -            -
>> +g input   {{INPUT_GID  }}     -            -
>> +g kmem    {{KMEM_GID   }}     -            -
>> +g kvm     {{KVM_GID    }}     -            -
>> +g lp      {{LP_GID     }}     -            -
>> +g render  {{RENDER_GID }}     -            -
>> +g sgx     {{SGX_GID    }}     -            -
>> +g tape    {{TAPE_GID   }}     -            -
>> +g tty     {{TTY_GID    }}     -            -
>> +g video   {{VIDEO_GID  }}     -            -
>> +
>> +# Default group for normal users
>> +g users   {{USERS_GID  }}     -            -
>> diff --git a/meta/recipes-core/systemd/systemd_253.3.bb b/meta/recipes-core/systemd/systemd_253.3.bb
>> index 45dc6ab5bb..87fbf6f785 100644
>> --- a/meta/recipes-core/systemd/systemd_253.3.bb
>> +++ b/meta/recipes-core/systemd/systemd_253.3.bb
>> @@ -17,6 +17,7 @@ REQUIRED_DISTRO_FEATURES = "systemd"
>>   SRC_URI += " \
>>              file://touchscreen.rules \
>>              file://00-create-volatile.conf \
>> +           file://basic.conf.in \
> 
> Instead of including a modified copy of the basic.conf.in file
> from systemd, include a patch that modifies the file that systemd
> provides. Otherwise this becomes a maintenance problem where it
> is easy to miss changes that upstream does to the file, and also
> hard to know what you have changed.
> 
This came to my mind, but it seems to me it's a configuration and not a 
patch. Some distribution as debian generate their own. It could also be 
replaced by the user to set its own preferences. It is not supposed to 
change the default configuration, but to set the one we need.

>>              ${@bb.utils.contains('PACKAGECONFIG', 'polkit_hostnamed_fallback', 'file://org.freedesktop.hostname1_no_polkit.conf', '', d)} \
>>              ${@bb.utils.contains('PACKAGECONFIG', 'polkit_hostnamed_fallback', 'file://00-hostnamed-network-user.conf', '', d)} \
>>              file://init \
>> @@ -252,6 +253,10 @@ EXTRA_OEMESON += "-Dkexec-path=${sbindir}/kexec \
>>   # The 60 seconds is watchdog's default vaule.
>>   WATCHDOG_TIMEOUT ??= "60"
>>
>> +do_configure:prepend() {
>> +  sed s@:ROOT_HOME:@${ROOT_HOME}@g ${WORKDIR}/basic.conf.in > ${S}/sysusers.d/basic.conf.in
> 
> Please indent shell code using tabs, and change the command to:
> 
> 	sed -i s@:ROOT_HOME:@${ROOT_HOME}@g ${S}/sysusers.d/basic.conf.in
> 
> once you have added the patch as per above.
I understand '@' is easier to read than ':'. I have used the colon 
because its usage is very restricted in the sysusers.d file. But it's 
fine to me as this is supposed to be a path. Also, the input file and 
the output are not in the same directory. I am not sure about the "-i" 
option.

> 
> However, I am wondering if this has to be done during do_configure()?
> It might become confusing if you ever `devtool modify systemd` (which
> we do). Wouldn't it be better to do it on the installed file in the
> do_install() below instead?
> 
This file is parsed at systemd compilation. The file has to be correct 
before that.

>> +}
>> +
>>   do_install() {
>>   	meson_do_install
>>   	install -d ${D}/${base_sbindir}
>>
>> --
>> 2.41.0
> 
> //Peter
> 

Louis

