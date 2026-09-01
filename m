Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E422C624C6
	for <webhook@archiver.kernel.org>; Tue,  1 Sep 2026 08:32:36 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3209.1788251549208070796
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Sep 2026 01:32:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=mNOgFm2t;
 spf=pass (domain: smile.fr, ip: 209.85.221.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-482e2fdf6ebso3702781f8f.1
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Sep 2026 01:32:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1788251547; x=1788856347; darn=lists.openembedded.org;
        h=in-reply-to:references:subject:to:cc:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1sjmNhol8J3KJuF2xQ/pzyyIdUt3pPQ8PidV5UQ1WQs=;
        b=mNOgFm2tTymDnc2/LLHeWpOsOg/TXAbeqsVWuLuOC5Gjqsx3t3pVkWrNMEjBGYRGR8
         f9nCRO1YeUks5MKRXzDEMTIZ31vCY+xzb4GbBRRB6p1oDnJzbjbbrV+zYqicjRIwi826
         jK7FXS46bfP1EG85ABRPXQYtjxKhz+2kCxXH0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788251547; x=1788856347;
        h=in-reply-to:references:subject:to:cc:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1sjmNhol8J3KJuF2xQ/pzyyIdUt3pPQ8PidV5UQ1WQs=;
        b=f8I2vblqZMttGTqToVCbt+S56NMd1euDXAd7283BJY4X/oIT05gWizNFmCYk9szzxT
         r+3yneFRgUyLWtd+RG4TIGk9bI3S68q/SwzlFsOf//DVcQn4KUz1LHHi+xJZu7t/XIrl
         ht3pCfijhTls8sU/cdvrkFEivKUj8oNBaB3YXrL9MIvl0WeQt1qa6amqdTg7u8b6BvUW
         Ao6sXjhObmlWIg16fClqxdvmyIvmOZutXCfQqCmMBYHe1g7ncEj+Nu+jddIz9FtMiXta
         J9IMRv4raQnm5FUZLmZiktoAJhSq0doTlJtVxGoEnMSaVSgYbX8T8UaM8t+PNZLfi6nj
         b6Rw==
X-Forwarded-Encrypted: i=1; AKwUvBx8SB7FHPB7yY7Slcbd3gTDJIlP2/0wNxYsLK6LYU0xqiYKpULajlmGWT6K514bh9rJHyhPr4tnuWRoEZiK5OFk9g==@lists.openembedded.org
X-Gm-Message-State: AFuF++kQPEzzaZuAEb2W8mr82gUgMW3NaTNcuVlqnjUlLt3x62LxrnWK
	XJlRU+8FjA1M0ntPgedN87lHF208YbqMzyJqapiywvBiizq34tsIuIJEfxMrsu5OE/SL+wojLIB
	GfZGyq6o=
X-Gm-Gg: AYBFou24KqKvHx/7WgT4u4afgiJEif1OkvrMe9ydsZMkGLt03F8nE5ubDbgDawqHWGz
	R1ro6Hnj2gvRP5FecKXtp16NnBlBZTMQViI/dmR7A5Vo0ZBmX8fBOWFsZWz4ZAl9aH1fYZTP17D
	dXWwLa2Rt0YApxDMjuI8JOybqwLCHZa4jcrbKKb1DQfewv6wjr6Y2ZxnVVjmA7wHpQztKUfVAYA
	bs0qUzLZ7ZHJkBz8YL1IHZqXqocPEGsXE+ga85wbTE/3v3pWg9WC2hI0wr3Y3HxUY7tOvBy0m6r
	N7sUXNKB0nwK7ygh62Ub/FHD49dn6iJ37BKs7crq+Sf+NV/PBcqt/m4oAeKShCST2kuNzUl9hmN
	Jpj63wXmEXtltHShzCpklvqcucDZQ5VXEhiSOsW5p6ZH2gxj7mFZ4mI2zzhI125LdK+UMT49TqU
	5GOMqAhgW0S9wjg4VWgUr/HSwDDNuTxy/1LcCmzSExr8N0bUNk9JR14XZyUXVilplpOfJ2VtDJ2
	4BPGKREjdG4oA5N7xtDtu8fg6LNwEdsX7ec88japA9QphZQ
X-Received: by 2002:a5d:6847:0:b0:482:ea9b:962c with SMTP id ffacd0b85a97d-48441033005mr10152567f8f.22.1788251547393;
        Tue, 01 Sep 2026 01:32:27 -0700 (PDT)
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48442d3c94bsm3113950f8f.12.2026.09.01.01.32.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 01:32:27 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 01 Sep 2026 10:32:26 +0200
Message-Id: <DL3U9NAEHMUS.1CB70WHCB86EJ@smile.fr>
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: "Colin Pinnell McAllister" <colinmca242@gmail.com>
To: <jason.stasiak@gmail.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [scarthgap][PATCH] libsoup-2.4: fix CVE-2026-1467
X-Mailer: aerc 0.20.0
References: <20260831211324.635049-1-jason.stasiak@garmin.com>
In-Reply-To: <20260831211324.635049-1-jason.stasiak@garmin.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Sep 2026 08:32:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244808

On Mon Aug 31, 2026 at 11:13 PM CEST, Jason Stasiak via lists.openembedded.=
org wrote:
> From: Jason Stasiak <jason.stasiak@gmail.com>
>
> Backport fix for CVE-2026-1467 from meta-oe to OE-core.
> Update CVE patch to address a use case where a uri validation
> failure was not handled.
>
> (From meta-oe rev: 07d67228162018f5f619dce7183f85e79293378d)
>
> Signed-off-by: Jason Stasiak <jason.stasiak@gmail.com>
> ---
>  .../libsoup/libsoup-2.4/CVE-2026-1467.patch   | 276 ++++++++++++++++++
>  .../libsoup/libsoup-2.4_2.74.3.bb             |   1 +
>  2 files changed, 277 insertions(+)
>  create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2026-146=
7.patch

Hello,

Isn't that the patch Colin McAllister "colin-pm" (CC'd) asked about on
IRC #yocto?
https://libera.catirclogs.org/yocto/2026-08-28#1787933879-1787935062;

Is the trouble he mentioned fixed in this version of the patch?

Thanks!
--=20
Yoann Congal
Smile ECS


