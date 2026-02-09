Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B52B8E81BC3
	for <webhook@archiver.kernel.org>; Mon,  9 Feb 2026 13:39:09 +0000 (UTC)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.47394.1770644344459032805
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Feb 2026 05:39:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AP2zWT/x;
 spf=pass (domain: gmail.com, ip: 209.85.222.173, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-8c533228383so273244485a.3
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Feb 2026 05:39:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770644343; cv=none;
        d=google.com; s=arc-20240605;
        b=jRDcBYzKOIQroI2gYkZCTBvb5gDo4cdaJLAQdAfTFRou2ExNPCuyXHrRIZd7Z5Pypv
         /rJUTRZ8X85fi00NS/b4eQUFeZX6K+KJumtr8MxvKMkaOKOxHbDc0xNruVQqfYR0ZkIz
         07sHTbdmNPJ9S7vNLwCrI1kWAxqUgWo2Adb/ygAkES9gEPi0CooPIadXSPmHaOXQO0d9
         4XxYWOTeXLIbgvfUfy/rF4Nu4qbEtJf26XuhUsUHbGkVpe7zgpVJAo2M4hegSFA2Jp2F
         EC1jj4SwnRTO1UZR7Q30197yVYBOjp2Uh5MkNKxbISG0OvK1ItWmNwggmJCte29DUwnK
         zKmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ocbaTd0yCcKnBhuEFMUDyvhNQuftADoFVG/tR0X8nwM=;
        fh=AHtmURagFq+oUx9zaGctUCuR+koUQlBMcEcaAcrTDz4=;
        b=bnYantWkXbKGIkcYGop/N9aIT5jzc34j+rxTXY1U3qVBPm78+Jk0LOwmo2lux+fTCf
         L7GAyDgkkSu2KL036yu3PfCvMbcf2ZoYG3AHurCXB2UXmqaRseQLHgSjKc9vmDCeGpb0
         mDCg9CW2rTXfcPIHxpuGgbcdeYqsdg3LN3L5NHaHUwvJl12XfhY4UIGGVteANvugLIdm
         V5SeZOddLY1/ivsUwMi1cGMhGq1llR9tjD5BAww/Hk3Jhwq/B17R8ZisVlIzX4YNrf7C
         1lURlgIeEhGnWSjExM651ASZ1Sv8NzAIfGS5tNpVyE38RKMCZuGStzXE6rpMcJGIwDQS
         N9uQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770644343; x=1771249143; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ocbaTd0yCcKnBhuEFMUDyvhNQuftADoFVG/tR0X8nwM=;
        b=AP2zWT/xzriV9aDk2jhScazndsvWpqJ0PpjFifedaFYasq5qyHupTPwC7k5gBtkzU5
         NoC2gk59rYD2XVdl6uhrSgsQN0NmmXd1T+epp61JTsUbewiRDpLuSD9vbwhgvjqWeg8+
         26XCqcMypAKRUQ885Ped2ZaKcDDckwTNlncN9Bgr64ram4Bu1iPCKNs8OweXFqvl/xhH
         YiPb3muz3q0XLMN4Wz4jsVh8oPPbuoCDn8FT0tbBrZ3boP0pRePdiijYOREuaiem2EY4
         UirH0RnmnwxJlqrHSFLRdhWnu2sRhN7iHCmRipMynA45eH9W3pBknytd9dRuR23MHpCJ
         4Wzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770644343; x=1771249143;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ocbaTd0yCcKnBhuEFMUDyvhNQuftADoFVG/tR0X8nwM=;
        b=ij4IkH/glMhx3sUFKZkrZB+QU2FP2MPi5IhCIAEkz/6oUhqhvaU/XlXY8rxDQ5griP
         2x/2lBwIKnTRX+aE1m3lMUzvVBb4Q8zPkk4X0BpczHsE8AeKInGtkv9+dA1+zi+BChYu
         VTT/ZeFagk7BbhCxLJBbNFwk9mgb8/smnFL71IuncJR1WKwdrP6fLpg18SFw5JhNMVFr
         fnd14M3sPIXh+hGyrasbVJpXLi9tpNagWYYeWfQEiYhFnF0ZPwSyPkZrvuF/EoAGIGxJ
         g0BEpiJGq+9t4LBr1zdaTE7T2liHOXrm3XucC/+TMIcF2AC6tBFN74sS14dSTGZVcuLG
         dQ2A==
X-Gm-Message-State: AOJu0Yybrp4uSMz/bSzkaBsUmPDK1qFAm9RmkpkxA8G9URjYWhXNJqi6
	xbFqzXoc1OUkvkBnC1nMYZY3lFNugW8GXZG5mNvii8pN1IhNLFKNK61sNxkJzAZenaeYp5OliXl
	P7UeflFLLQVJoejVbNeL6ysxQ1cYNxTaFtROH
X-Gm-Gg: AZuq6aIjaUT8yJpyH1nWRidMHKGXd9r32yqfrPea0fFG9V7Y0o6SNmt8QeAEV1nQAog
	fIjEGVEmTUqzpzdPO5fNarxbATRf9dsWi/09A9O+8bf7sGUTEKVDNRbwM7TzfsnNhXxrc15DA2e
	XQv8b+XuALKJBndvYA1zQewGZI9p1LKkIy69FoHXM+em/eBbtTbBOls/MvlGYsB5kKlsV2i012e
	8gH6V9NXuH3ZeW5lUWLjpqT/GRNHBrSSwjUv0h58+BpHgwdfyjVFkUj5gdEVE7TWAFsgFObOH0V
	bkdWLgOwy3Bl1aj54WonhvgQxkqDoA==
X-Received: by 2002:a05:620a:440a:b0:892:7dd2:9f0f with SMTP id
 af79cd13be357-8caef02764amr1426923585a.19.1770644342782; Mon, 09 Feb 2026
 05:39:02 -0800 (PST)
MIME-Version: 1.0
References: <20260202023457.133774-1-ankur.tyagi85@gmail.com>
In-Reply-To: <20260202023457.133774-1-ankur.tyagi85@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 9 Feb 2026 14:38:51 +0100
X-Gm-Features: AZwV_QgzNgr4v4UDsVrLvniJN6lUktkkXKwUq292Y1_yDsUA-1YtAonhBPIjPUs
Message-ID: <CANNYZj90xJsK-COQF9XPbvT37gcdTuS7=M6QJu-KBf+3D6G=ig@mail.gmail.com>
Subject: Re: [OE-core][PATCH v2] mdadm: upgrade 4.4 -> 4.5
To: ankur.tyagi85@gmail.com
Cc: openembedded-core@lists.openembedded.org, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, Paul Barker <paul@pbarker.dev>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Feb 2026 13:39:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230797

On Mon, 2 Feb 2026 at 03:35, Ankur Tyagi via lists.openembedded.org
<ankur.tyagi85=gmail.com@lists.openembedded.org> wrote:
> - dropped mdcheck install patch to address reproducibility issue

>  EXTRA_OEMAKE = 'CHECK_RUN_DIR=0 CWFLAGS="" CXFLAGS="${CFLAGS}" SYSTEMD_DIR=${systemd_system_unitdir} \
>                  BINDIR="${base_sbindir}" UDEVDIR="${nonarch_base_libdir}/udev" LDFLAGS="${LDFLAGS}" \
> -                SYSROOT="${STAGING_DIR_TARGET}" STRIP='
> +                SYSROOT="${STAGING_DIR_TARGET}" MISCDIR="${datadir}/${BPN}" STRIP='
>

This has merged, and unfortunately the same reproducibility issue
appeared in nightly master:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/37/builds/3317

The issue seems to be that sometimes the sed command to patch BINDIR
in mdcheck works, and sometimes it does not. I am baffled as to why
that would be, but we can't have such fails in master, so for now I'm
afraid this should be reverted.

Alex

