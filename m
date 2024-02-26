Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4C7AC5478C
	for <webhook@archiver.kernel.org>; Mon, 26 Feb 2024 18:27:35 +0000 (UTC)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
 by mx.groups.io with SMTP id smtpd.web10.518.1708972051354370342
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Feb 2024 10:27:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=OCv50sdG;
 spf=pass (domain: baylibre.com, ip: 209.85.219.43, mailfrom: tgamblin@baylibre.com)
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-68009cb4669so16296476d6.1
        for <openembedded-core@lists.openembedded.org>; Mon, 26 Feb 2024 10:27:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1708972050; x=1709576850; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=T4mANqu+3+/xIDckcTRWkRa7NcAEp9oHAfmXc1i7V/s=;
        b=OCv50sdG6E3QyzzB9MgTUjsP3U0Z/ORBMC3eigeN86aTeOBp43FuptiPLBkaqzviZC
         boSaIAUW4zuGS7PRX3C5qL2GzJh2olDh71d8WtFeiYKYmeqYKRx3scgbR301HDzKLaOG
         iPZPVVn2EttvhetiPpnqaP3BqKjheS4IVeiw1SiO4GctcNWI9ggaCgoXswFAlEmJNoN7
         lWwU8w5dkNdp0jULGHzBkFAxCt4/KgOteLIfrnly7I2yxr16cbWxtzef4lgAc8LJupp9
         tC9ZvTLA1o743MDemw2uP28kmDhRtj06keSlYWdq29d4ck7/BPi9CFgUHIcZsdlBx1S7
         vDAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708972050; x=1709576850;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T4mANqu+3+/xIDckcTRWkRa7NcAEp9oHAfmXc1i7V/s=;
        b=XEHm8TCLgs5IHscyacinekoisS0woNxKPT1qF3c2htJw4VKjfcugu1g8nbzMvdElHx
         v60xsd/Xn5V3jW4lLl2QzhvzEe06eMcPzfzNjCd2ddNzmat3kQw2PSM3hhW/e+GNxDsQ
         so58x1Ahzi1dLuLxDCqWaBDTcnwdc+ixiTj3ydxENivIiZkL6zteT05tpBSX8Aj7g4FE
         cWOu/abF1hVz4/F1ONi1BD2d7tgzR+nN2wgqSvIIbJ4E4QMoukJ/CO9Enj4aI4qMfWET
         R29vry5kEfWakWPIzS5+SNN1e3uKZg5XgwVLoSmD3G2gOlyvRIzLAmRSLiQvTLu8wAAb
         cYcQ==
X-Forwarded-Encrypted: i=1; AJvYcCXNfVSfDnkoNecnI4j4TC9O03q5K6ZTSmQDu9qdGSVD9pivG2VJArya0NICPh3judmFA/pIBK0hBATSI/ZNo8jpcpccqPfXLI85sWlNN3NJsC0EyT8B7KaH
X-Gm-Message-State: AOJu0YxFq+fxare6+M4mgLZ4wRtzuoone+Wp0faKpdFfAvZJtam2/hVN
	034a210+Dln7S0Y0k/jly4LpvwdjaYLyT9gGDzsF4Fx+nkEf3Qs/sLFi1Gt9/Ek=
X-Google-Smtp-Source: AGHT+IH2A5kV7L3jpKBlWsCARkM5ZoTGE7GPl4cfunQeqY95YHM6ei3Z5ot/i6lZ3W1W0tGz6BhUPA==
X-Received: by 2002:a05:6214:2601:b0:68f:6f1b:fa41 with SMTP id gu1-20020a056214260100b0068f6f1bfa41mr10216999qvb.4.1708972050360;
        Mon, 26 Feb 2024 10:27:30 -0800 (PST)
Received: from [192.168.40.12] (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id oo5-20020a056214450500b0068fda0c74b6sm3168845qvb.27.2024.02.26.10.27.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Feb 2024 10:27:30 -0800 (PST)
Message-ID: <25f1235a-c76c-44a9-95d9-242a3e32b8b4@baylibre.com>
Date: Mon, 26 Feb 2024 13:27:28 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [AUH] rpm: upgrading to 4.19.1.1 FAILED
Content-Language: en-US
To: Auto Upgrade Helper <auh@yoctoproject.org>,
 openembedded-core@lists.openembedded.org
References: <0101018dadd3a49b-174678c4-e621-443b-a9ca-ad0a257a6260-000000@us-west-2.amazonses.com>
From: Trevor Gamblin <tgamblin@baylibre.com>
In-Reply-To: <0101018dadd3a49b-174678c4-e621-443b-a9ca-ad0a257a6260-000000@us-west-2.amazonses.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Feb 2024 18:27:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196215


On 2024-02-15 12:32, Auto Upgrade Helper wrote:
> Hello,
>
> this email is a notification from the Auto Upgrade Helper
> that the automatic attempt to upgrade the recipe *rpm* to *4.19.1.1* has Failed (devtool error).
>
> Detailed error information:
>
> Running 'devtool upgrade' for recipe rpm failed.
> NOTE: Reconnecting to bitbake server...
> Loading cache...done.
> Loaded 1857 entries from dependency cache.
> Removing 1 recipes from the x86_64 sysroot...done.
> NOTE: Resolving any missing task queue dependencies
>
> Build Configuration:
> BB_VERSION           = "2.7.2"
> BUILD_SYS            = "x86_64-linux"
> NATIVELSBSTRING      = "universal"
> TARGET_SYS           = "x86_64-poky-linux"
> MACHINE              = "qemux86-64"
> DISTRO               = "poky"
> DISTRO_VERSION       = "4.3+snapshot-8b3825b16a5ea263dd8fd0ee1de903f09ea83409"
> TUNE_FEATURES        = "m64 core2"
> TARGET_FPU           = ""
> meta
> meta-poky
> meta-yocto-bsp
> workspace            = "tmp-auh-upgrades:8b3825b16a5ea263dd8fd0ee1de903f09ea83409"
>
> Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
> Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
> done.
> NOTE: Executing Tasks
> NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
> NOTE: Writing buildhistory
> NOTE: Writing buildhistory took: 1 seconds
> INFO: Extracting current version source...
> INFO: Extracting upgraded version source...
> INFO: Rebasing devtool onto 13b4521341781293c41ac898aa9c2d2f6bc1f21d
> WARNING: Command 'git rebase 13b4521341781293c41ac898aa9c2d2f6bc1f21d' failed:
> Auto-merging docs/CMakeLists.txt
> CONFLICT (content): Merge conflict in docs/CMakeLists.txt
>
> You will need to resolve conflicts in order to complete the upgrade.
> INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/workspace/sources/rpm
> INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/workspace/recipes/rpm/rpm_4.19.1.1.bb

I've got an upgrade ready for this, but it seems to be introducing a 
buildpaths QA issue:

WARNING: rpm-1_4.19.1.1-r0 do_package_qa: QA Issue: File 
/usr/lib/cmake/rpm/rpm-targets.cmake in package rpm-dev contains 
reference to TMPDIR [buildpaths]

I've traced it to this part of 
tmp/work/core2-64-poky-linux/rpm/4.19.1.1/image/usr/lib/cmake/rpm/rpm-targets.cmake, 
but I'm not sure how to fix it (my CMake-fu is weak):

set_target_properties(rpm::librpm PROPERTIES
   INTERFACE_INCLUDE_DIRECTORIES 
"/workspace/yocto/poky/build/tmp/work/core2-64-poky-linux/rpm/4.19.1.1/recipe-sysroot/usr/include" 

   INTERFACE_LINK_LIBRARIES "rpm::librpmio"
)


Anyone know how to fix that?

>
>
>
> Please review the attached files for further information and build/update failures.
> Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler
>
> Regards,
> The Upgrade Helper
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#195611): https://lists.openembedded.org/g/openembedded-core/message/195611
> Mute This Topic: https://lists.openembedded.org/mt/104377506/7611679
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [tgamblin@baylibre.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

