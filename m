Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 192C3C27C76
	for <webhook@archiver.kernel.org>; Wed, 25 Jan 2023 12:32:56 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web11.44013.1674649974760088292
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Jan 2023 04:32:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=nMPDS89q;
 spf=pass (domain: linaro.org, ip: 209.85.218.48, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-ej1-f48.google.com with SMTP id vw16so47199966ejc.12
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Jan 2023 04:32:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=h2bAsLE8O53Pyr0+FYtzX1KN80BtWkhLSSefqRYT3ww=;
        b=nMPDS89qx1d/wApAIK8o7KJoW/9KrJu/hn4g6FccWAHrgp46ly7FSN/tsopqsdWDrU
         VsmcFQGiB7YQQjSgpaZqrIGulb0F7onE0hSG1ULxWGOEP9UttLiig7vsJAX6lOfhICqL
         igxQl2hMVeJOAlQJEWO7wqfeUYKWiuay3wAkcFXQ48eMwSxeqSF5sK4BkNvyHo8rdFGK
         8Q98IHsCmE8eQ9plnpam9M6fYb0p9sAgPit7yB4IkGlPdYrB0SgPRG+5/JQudYqgolTx
         dEHReCpQzCijv9y/9AeMr9CgrzEYCAuBVEuFpcyfSz3mFYLTccHRc/zYs1cTWmOyaWAg
         wgNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h2bAsLE8O53Pyr0+FYtzX1KN80BtWkhLSSefqRYT3ww=;
        b=kkxy8tXuudlAnGosRBySJyTDWWEGv4qy/IRZditvKiBFCPJDy657Ds5vzDB/AYRaiz
         5DMEbWM2qgfaEUqQWZr1oy/WQb3gFXWT0tynI3eXk/NBopXApXn70phl61BbBkkA+ETz
         90eEiKc0R765rDhBK1LWdO4PwTvc7UJJDHF2soMLcgdB1dWiFh0zHvbC+vBJBN4d/rhH
         d6qMUEZYCDa4wdV3+LAEy1tAsbURzP11NppFBUc+h3nsOYzeObWURj4SyKbTmUrau54i
         uTqA2aMvEymW1RbgHS3e6fQrK/ZkZvQNFQYZc0xW164BOLq8Cuzl6ny9rfNtdkngdVwB
         fN/A==
X-Gm-Message-State: AFqh2kpPs/H0FTKBblZ/iXJ/xk79dKbwQH2oFH0H7fHhRr5+qf8+NIkm
	HTwaVIrCzyLxkDzTJIIBfuiokA==
X-Google-Smtp-Source: AMrXdXsQ2JbbpuYFGWK5NQr1/7NveJyI3jDg5vyaxPQi5bnulD+eeNRVKcZq9VrZcADVC62Nu1dzyg==
X-Received: by 2002:a17:907:924d:b0:7c1:8f78:9562 with SMTP id kb13-20020a170907924d00b007c18f789562mr25404998ejb.50.1674649973019;
        Wed, 25 Jan 2023 04:32:53 -0800 (PST)
Received: from nuoska (dsl-olubng11-54f814-94.dhcp.inet.fi. [84.248.20.94])
        by smtp.gmail.com with ESMTPSA id z18-20020a1709060ad200b0086f40238403sm2291829ejf.223.2023.01.25.04.32.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jan 2023 04:32:52 -0800 (PST)
Date: Wed, 25 Jan 2023 14:32:50 +0200
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 00/14] oeqa runtime tests when qemu hangs
Message-ID: <Y9EhcnpE3gtLKAOR@nuoska>
References: <173C0B9603DBAB46.24231@lists.openembedded.org>
 <Y9DgI+HyBTGNmiFa@nuoska>
 <CANNYZj-Qq8rOob5y2mkdLczFzwNx3Hr_CHKbn370fe3CVa7EQQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANNYZj-Qq8rOob5y2mkdLczFzwNx3Hr_CHKbn370fe3CVa7EQQ@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Jan 2023 12:32:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176346

On Wed, Jan 25, 2023 at 09:03:03AM +0100, Alexander Kanavin wrote:
> Perhaps you could show a sample output before and after all the changes?

With kirkstone and build config:

MACHINE ??= "qemuarm64"
PACKAGE_CLASSES = "package_ipk"
INHERIT += "rm_work"
INHERIT += "buildhistory"
BUILDHISTORY_COMMIT = "1"
DISTRO_FEATURES:append = " systemd"
VIRTUAL-RUNTIME_init_manager = "systemd"
DISTRO_FEATURES_BACKFILL_CONSIDERED = "sysvinit"
VIRTUAL-RUNTIME_initscripts = ""
IMAGE_CLASSES += "testimage"
IMAGE_FEATURES += "ssh-server-openssh package-management"
TEST_RUNQEMUPARAMS = "slirp nographic novga"
TEST_SUITES = "\
    ping \
    ssh \
    date \
    df \
    parselogs \
    ptest \
"
QEMU_USE_SLIRP = "1"
# only localhost to access via ssh
QB_SLIRP_OPT = "-netdev user,id=net0,hostfwd=tcp:127.0.0.1:2222-:22"
TEST_SERVER_IP = "127.0.0.1"

With this I compiled core-image-minimal and ran do_testimage:

 * before this patch series: https://pastebin.com/raw/rzhgRGix

 * with this patch series: https://pastebin.com/raw/3R5mUutS

Major difference is that with the series full boot log is do_testimage
task debug output. It's not in bitbake output though, that remains
unchanged. Now if there are any hangs, timeouts or other problems, the
do_testimage logs with the patch series will contain information where
exactly the failure happened. And without this patch series, a hang in
qemu goes undetected and whole test execution hangs, and in multiple
locations: first in test ssh command output select() read() loop for
every command executed on target and then in the QMP debug output
for every ssh command which fails with return value 255.

Cheers,

-Mikko

