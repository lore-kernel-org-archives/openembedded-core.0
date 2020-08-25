Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web12.12616.1598359678380600046
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Aug 2020 05:47:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fastree3d-com.20150623.gappssmtp.com header.s=20150623 header.b=aKqvJnqv;
 spf=none, err=SPF record not found (domain: fastree3d.com, ip: 209.85.218.47, mailfrom: adrian.fiergolski@fastree3d.com)
Received: by mail-ej1-f47.google.com with SMTP id dp2so11063344ejc.4
        for <openembedded-core@lists.openembedded.org>; Tue, 25 Aug 2020 05:47:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fastree3d-com.20150623.gappssmtp.com; s=20150623;
        h=from:subject:to:cc:message-id:date:user-agent:mime-version
         :content-transfer-encoding:content-language;
        bh=ZfB4j0jVJWxo6U0pbT2lq6zxprrSK4gCuZa7qQgmQAM=;
        b=aKqvJnqv1ITFx2dwC3j2AaChyfOLGLYboPIgevhXjRHOMUWEZYapcbCkN34LvemJ+w
         Glvy+pLPvhnl7E9OU/ylWIyFll1O4UTk5Tb5MTblXGgvatCnZ+8Zmi45vI2vuFyJsse/
         oCBOGHptCblcgcBhF9lM7h0j7P883xhScDquo5/scSXQbyM9sX+sjT/Sn8Jofdg0U9Hh
         LuHr8sx6mqMzbBs3dz3wJVm9A8UYo1bTpY2SdljbM1eSVBCWSt8i4sW4z9wFbbPmdJjG
         xSMQ5Wn6dCTMCM7J8TwqLsPqu1sjC3pv5RCjlOHV4JpUxP4dgI90iRo1IvsTWDB160DJ
         SVig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:message-id:date:user-agent
         :mime-version:content-transfer-encoding:content-language;
        bh=ZfB4j0jVJWxo6U0pbT2lq6zxprrSK4gCuZa7qQgmQAM=;
        b=E3OO8xOTtpCaDJU1TbkurEYr2hvZ5MKxSmXsFu2h7xuwRUBE4G2u26jqS2YyLjspot
         F7uwbaZ8V2s+ydtNcDvDQOCp2QUj3QephJLzScQKJnstnM9M4mFKbGYCCohEi3QkT6y/
         qM1vqq2DCIXQ89BV2169U03Hgj2m8MJgd6fqaJyw4lqgZHDxxbIhU/GAM4+cTcfrs0X8
         yx8fsKcZLtPptT9IJkflSjh4V3DCKWG4qtNoz89aQTmxY1CXsEBV37Q9l2kIZjLzJ8m1
         sIgRylgnRinQ1dxN5SecnjeNe78k3JExpEnLGRvbm6v6x05yLuOPBESqfv9zyIJMsX66
         Yqwg==
X-Gm-Message-State: AOAM530Vio3QvNtORG38kjVV642w7p71Sxj89vKuXLHiCj9KTY0saaPF
	7Y8Hb8Q2aKgZOL5qtZ8v9lkojBjXAJHg
X-Google-Smtp-Source: ABdhPJwwSizCmjIXs2FWGlVZCZrhCrtdaObEywSc1yC2jKC4wZtGfSgGT9RJO/UfPIZsCUuGsAEa8Q==
X-Received: by 2002:a17:906:f6c9:: with SMTP id jo9mr8709880ejb.152.1598359676476;
        Tue, 25 Aug 2020 05:47:56 -0700 (PDT)
Return-Path: <adrian.fiergolski@fastree3d.com>
Received: from [192.168.33.195] (fastree1.epfl.ch. [192.26.37.52])
        by smtp.gmail.com with ESMTPSA id bu19sm12821958edb.34.2020.08.25.05.47.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Aug 2020 05:47:56 -0700 (PDT)
From: "Adrian" <adrian.fiergolski@fastree3d.com>
X-Google-Original-From: Adrian Fiergolski <Adrian.Fiergolski@fastree3d.com>
Subject: [devtool] problem with PACKAGE_ARCH and TARGET_OS
To: yocto@lists.yoctoproject.org
Cc: openembedded-core@lists.openembedded.org
Message-ID: <05aa33d7-b90a-f20d-9a55-a066681df83a@fastree3d.com>
Date: Tue, 25 Aug 2020 14:47:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Firefox/68.0 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-GB

Hi,

After recent update of poky, I started to experience an issue with
devtool. Currently, I am using the latest zeus version. I have a
multiconfig environment (Xilinx ZynqMP+ with ARM64 and Microblaze). I am
modifying my recipe compiled from local sources. The custom target
machine configuration sets DEAULTTUNE="cortexa53"

When I call:

$> devtool build peary
$>devtool deploy-target peary root@192.168.33.167

I get the error:

ERROR: No files to deploy - have you built the peary recipe? If so, the
install step has not installed any files.

In fact, I see that 'devtool build' creates image under
'/home/afiergol/poky/build/tmp/work/aarch64-poky-linux/peary/1.0+git999-r0/image',
while 'devtool deploy-target' search for files under
'/home/afiergol/poky/build/tmp/work/cortexa53-poky-linux-gnueabi/peary/1.0+git999-r0/image'

If in the 'peary' recipe I add a line

PACKAGE_ARCH = "${MACHINE_ARCH}"

'devtool deploy-target' starts to search under
'/home/afiergol/poky/build/tmp/work/aarch64-poky-linux-gnueabi/peary/1.0+git999-r0/image'

If further, I fix in the 'peary' recipe:

TARGET_OS = "linux"

'devtool deploy-target' properly deploys the binaries to the target machine.

However, as I explained, I had to fix in the recipe PACKAGE_ARCH and
TARGET_OS variables. It is required only for devtool to work, as bitbake
builds properly my custom Linux image containing the recipe without
those variables being set anywhere in my layer.

Has anybody else experienced a similar issue? Could somebody give a
reference (I didn't find) to documentation which explains why and how
those variables need to be set (I especially concerned about TARGET_OS)?

Regards,

Adrian

