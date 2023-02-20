Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4469C6379F
	for <webhook@archiver.kernel.org>; Mon, 20 Feb 2023 18:59:11 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web10.22051.1676919542643952358
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Feb 2023 10:59:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=e/tEs5VG;
 spf=pass (domain: gmail.com, ip: 209.85.208.54, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f54.google.com with SMTP id h16so8547039edz.10
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Feb 2023 10:59:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=r3ijnNVf+/r85YWaGMOaX4VOAcdRU0tJDXPcIj2pzU8=;
        b=e/tEs5VG0c0wwMdEhDUYEfFv93ZjWgfvJQ6AWMfJM1fTRF9hp90ETgsZ12trHaeEpn
         P0jMzbzLAxBQuyEtxsImx1rqPboDb4ZYzkwWs8U4yRujhOUbCIFfjznOEQDBOQn/3f08
         jJVYPjcSZBh2XppQ4JK7lZiQ/eMI7OrCsq2vd9DlZHuScCU6451VNPi8U9Qbj3BuNyOM
         vaupnFIo7IHy1kiwTdYjrImADiNW2v4+Y1bDXS73wQzANBptdj4QMj7jbq27fzL3qqph
         T4WLnzgpKRFl2VHZaZMFcr87Fd8GtNyRPiah8ycdxM8kTAZkn/x7xC/ZjWZTbuUxOBXr
         R3Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r3ijnNVf+/r85YWaGMOaX4VOAcdRU0tJDXPcIj2pzU8=;
        b=D4yIWT3LCk3jpDfaGBeC7Bjr/tTySFblUf8/bY1GscHUUEwr3Mizp+b9PWamN6NH9F
         MAdCcsfUYYPsBOwMMDMy9o/3r8Ky822GuoglLXQSf+HEmN6TV6tbJZlN/1ci77M/rUDh
         3Ph0JV6hJIB9TAls08AmJajr3DDUkXexMBSnFzWce40Jt8uOxX5KYuTGhXJ7dANN/Huh
         vvgDocf5DmKmmVKZN8Ky1rfJEmZsqNXwZOGfa6fO5JyGncJgbkUlVdnd+dSO9uXmVRid
         XVKva/bUce7PoqFf8ZrIpG56u8y6MUNv30gFJUqYyc0HwXEyvJEySJzpnAfFrivmLcXu
         SBaw==
X-Gm-Message-State: AO0yUKUiKssKLAO/HIvb+t3hArUm5c7FYGJixhnC8dO7cKBmsr4NvSpX
	aFXcaMpX25iiBxWT6f5EWho=
X-Google-Smtp-Source: AK7set/phsAQh1/FLAobrArdvk5U0WNmGeqsFZEBc8T3+zcJUMpth59hdJ5THrYG8UnoTeEywB5+Fw==
X-Received: by 2002:a17:907:7f04:b0:8b1:3191:286f with SMTP id qf4-20020a1709077f0400b008b13191286fmr12156487ejc.25.1676919540951;
        Mon, 20 Feb 2023 10:59:00 -0800 (PST)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id e9-20020a170906374900b008cb7473e488sm2460982ejc.12.2023.02.20.10.59.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Feb 2023 10:59:00 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 20 Feb 2023 19:58:59 +0100
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
	Alexander Kanavin <alex@linutronix.de>
Subject: Re: [OE-core] [PATCH] devtool: ignore patch-fuzz errors when
 extracting source
Message-ID: <Y/PC8wa5EYskcyCE@jama>
References: <20230220182813.2785151-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230220182813.2785151-1-alex@linutronix.de>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Feb 2023 18:59:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177451

On Mon, Feb 20, 2023 at 07:28:13PM +0100, Alexander Kanavin wrote:
> So that patch fuzz issues can actually be fixed,
> as extracting source with 'devtool modify' is the first step
> for that.
> 
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>  scripts/lib/devtool/standard.py | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
> index d64e18e179..0339d12763 100644
> --- a/scripts/lib/devtool/standard.py
> +++ b/scripts/lib/devtool/standard.py
> @@ -567,6 +567,7 @@ def _extract_source(srctree, keep_temp, devbranch, sync, config, basepath, works
>          logger.debug('writing append file %s' % appendfile)
>          with open(appendfile, 'a') as f:
>              f.write('###--- _extract_source\n')
> +            f.write('ERROR_QA:remove = "patch-fuzz"\n')

should it append it to WARN_QA so that the warning is still shown to
user while this .bbappend is acive?

>              f.write('DEVTOOL_TEMPDIR = "%s"\n' % tempdir)
>              f.write('DEVTOOL_DEVBRANCH = "%s"\n' % devbranch)
>              if not is_kernel_yocto:
> -- 
> 2.30.2
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#177450): https://lists.openembedded.org/g/openembedded-core/message/177450
> Mute This Topic: https://lists.openembedded.org/mt/97092277/3617156
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [Martin.Jansa@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


