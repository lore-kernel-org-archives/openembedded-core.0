Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AC5EC64ED8
	for <webhook@archiver.kernel.org>; Mon, 27 Feb 2023 21:03:54 +0000 (UTC)
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
 by mx.groups.io with SMTP id smtpd.web10.6874.1677531830558080125
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Feb 2023 13:03:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=hKaYfE8f;
 spf=pass (domain: gmail.com, ip: 209.85.167.170, mailfrom: jpewhacker@gmail.com)
Received: by mail-oi1-f170.google.com with SMTP id bi17so6341724oib.3
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Feb 2023 13:03:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=iFVIaJdXGZytIpTcrxM2DLiEqFeBCtkPWU1bkcacDw8=;
        b=hKaYfE8f/8LlpkwpLsWaNjXqEPbFKtI7FnXrmNua8RSrQqcjxamtWoxAG9pulVxkk4
         vltk/HfJX9SzZi39z3P03PINXTumgKvJuR3g/gqPfM0s466cIb9o6zc04zE3DbL2ntDE
         qEF3FXjblwnWhcWflNWJbeQnRLEvA+r6eZ8TkHDh86IV7gBy+lmcjcvWh4MrTIVLu6J3
         +YnhmukNvb7XGahEQvCrIFMpTlP64KFibS5Ea9+/jWJYoMTpKFe9efjF89DRrvt56O8W
         vkh3CFttD8IUad4IaVSwOgFq7tbEIvdrPEsl8tikLa73Gf7TJM3kMqoa6flnq36hSr85
         dgjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iFVIaJdXGZytIpTcrxM2DLiEqFeBCtkPWU1bkcacDw8=;
        b=0XJS73IY6Bve0Z4Kr8kvIdUACGyhra08PHhzJ73kb2PzN9Uj09htPdB6BxoJu1UeWG
         lq7rP++fvTeXzlUfqezn2QWLv1iouH/5Z48+wfdaHPfofrxOnZLrX6lWntEY10c0Acgg
         w2CWiMZ7VCp6ykS7Ej7DIRD/WAFkb0N4wBSQStplOlZ9Kps5XFlqBQbJOG8iFQmWh3Fg
         BqVm5o8KK1hwq+eAWeZWFCEeG9wZxqC9p4t+gDImH7GTZTNDU2ApPtYBG1coNaES4tr/
         7ORVYVjqBqXL2wOlojwPl13shxNqqZs1QyvnkyrhnHA1Hy0PRcpU7jyMgLuIZENQ3fv8
         P61A==
X-Gm-Message-State: AO0yUKWzLoMVJVTWofMRA3Crp1LZWL5CPGc60cP2c3gB6fqJN5X0vpJv
	c3VZzh9E9CMjzBhUZf7ArPM=
X-Google-Smtp-Source: AK7set/Pce61GMIEfFu53LU6EtNbdgE36VVMxbhex8RNYvPUqz52Fex1TM1rJskQUjBEo8nuOZvlPA==
X-Received: by 2002:aca:230d:0:b0:37f:a9df:63c2 with SMTP id e13-20020aca230d000000b0037fa9df63c2mr303033oie.26.1677531829811;
        Mon, 27 Feb 2023 13:03:49 -0800 (PST)
Received: from ?IPV6:2605:a601:ac3d:c100:e3e8:d9:3a56:e27d? ([2605:a601:ac3d:c100:e3e8:d9:3a56:e27d])
        by smtp.gmail.com with ESMTPSA id x124-20020acae082000000b0038440f0f63dsm696138oig.37.2023.02.27.13.03.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Feb 2023 13:03:49 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
Message-ID: <fb887f22-01c3-e202-18f4-f0c499c4d3d1@gmail.com>
Date: Mon, 27 Feb 2023 15:03:48 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [OE-core] multiconfig: Build breaks parsing recipes for other
 config layer
Content-Language: en-US
To: Bryan Evenson <bevenson@melinkcorp.com>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <CH0PR20MB4122DCF26110929D2A178451BBAF9@CH0PR20MB4122.namprd20.prod.outlook.com>
In-Reply-To: <CH0PR20MB4122DCF26110929D2A178451BBAF9@CH0PR20MB4122.namprd20.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Feb 2023 21:03:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177809


On 2/27/23 14:35, Bryan Evenson wrote:
> I'm testing a new board with a BSP that is setup on the gatesgarth branch.  I've been able to build and load the demo images for this board.  I'm now trying to use multiconfig to build images for my old board and my new board.  So far the build hasn't got past parsing recipes and I'm wondering what I'm doing wrong.
>
> For my setup, I have two separate layers for the two different boards.  Each layer has its own MACHINE and DISTRO definitions.  I setup the multiconfig files as follows:
>
> conf/local.conf:
> Added the following line:
> BBMULTICONFIG = "configA configB"
>
> conf/multiconfig/configA.conf: (config for old board)
> MACHINE = "machineA"
> TMPDIR = "${TOPDIR}/tmpConfigA"
> DISTRO = "distroA"
>
> conf/multiconfig/configB.conf: (config for new board)
> MACHINE = "machineB"
> TMPDIR = "${TOPDIR}/tmpConfigB"
> DISTRO = "distroB"
>
> If I try building the old image by doing:
> bitbake mc:configA:image-nameA
>
> I get errors while parsing the files.  It complains about a Network Manager bbappend in layer B that uses variables that depends on MACHINE being set to "machineB".  The image for configA does not use Network Manager.  I also tried removing the MACHINE and DISTRO settings from local.conf to make sure the multiconfig settings are used, but then I get an error that MACHINE has not been set.
>
> Does layerB need something added to it so parsing ignores recipes in this layer when they aren't needed?  Or do the recipes need to change so they build for other machines?

When you use multiconfig, all of you layers need to parse for all 
configurations (although this is generally good layer practice in 
general, not just when using multiconfig). Usually this involves writing 
the recipes to use overrides where appropriate


Although, if you _really_ don't want to do that, the BBMASK variable 
(https://docs.yoctoproject.org/ref-manual/variables.html#term-BBMASK) 
can now be set per-multiconfig so you can have layerA mask out layerB 
recipes and vice-versa.

>
> Thanks,
> Bryan
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#177808): https://lists.openembedded.org/g/openembedded-core/message/177808
> Mute This Topic: https://lists.openembedded.org/mt/97276005/3616693
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [JPEWhacker@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

