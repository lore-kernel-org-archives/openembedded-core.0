Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBC75C3DA49
	for <webhook@archiver.kernel.org>; Fri, 26 Jul 2024 11:26:38 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web10.58692.1721993191265234965
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jul 2024 04:26:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IxWEFgiX;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4266f3e0df8so14189775e9.2
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Jul 2024 04:26:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721993189; x=1722597989; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nmQKQYvBlC1QHHAF+DLrowZmg3mTlYucpvWWcN87H28=;
        b=IxWEFgiX4Smq4yFhMdUBQO+kP2+l35moSQ8P9y5Q2OHpNVUj7DvfOPjbYnMWbqDLPN
         Kq7Nf3AK3XeHvE8BMz2lo6nwENIsimSJMFkxNljR4kDdi+UF+HisIgiD1RIFi+oW83Pf
         Lrr6XD58+imMS4iovG0Vm00Ve/2LxYQWdI6n47p3drzZ2nlREyrvpW/bXYccQdaSIZzf
         PxTVahSN3IliG7PhFxfYxIM6e01i4eplKnR9vHpJHn6yk5xh05grOtkAdGXLdhZqr6Ma
         kQGFmavH2s1NVgzC/3yfHMcYvLTM/tXQNoIO8/VLoH8Nt1pvwXQrYq0VAVIbBt900QmF
         N8pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721993189; x=1722597989;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nmQKQYvBlC1QHHAF+DLrowZmg3mTlYucpvWWcN87H28=;
        b=nxY2ZKYqBjv6e4dHoco7ZggcmWQb0hmvgrm7cjBp9OLrItzs8Mc9GRZ65wbSOk/AiC
         cbKYrxwMjbHnmOYvhkw4gaJb9hlQ3rRC5PyhtfaFFWOXLtCbcEG5GsIQZNXlbo/ImmfH
         BxIAuQx1ubYiV3DxJbHcSWdD8m+Vq/RHwHK+p6JEFSSSx0n1tj6onnqGNMdFb76hDaRj
         7BHjC1/1F1Ua+M2oXYFURs7R7j3nmsYOC4ZJubiQYBF2tS1UNJZlpLleCG93xaanGhIO
         xMFuJSDH/KeBH8wTK3Y/89iWojXJ78gA7ca1Ql2wjTwhkEhKQrXc+oQ7tuXiS6w7cVTk
         A/BA==
X-Forwarded-Encrypted: i=1; AJvYcCXZfh4Y5pfxJZ49I96XwEaozOZsHs1dLj7aSVQyLpvfATz6V/nBcr3V+Kx8Wt0a9XsEy4/LK6ajxOgPxWYnIb19ta70NacfVHezJo43oCh4Bx+3h8Cn2EVF
X-Gm-Message-State: AOJu0YyjXDr5WXskuBIDG8yI8iRyKQIhurZx00Fznft/jw6eSPNqv+cU
	ayo2ggFTVhQwDZKES+ABt+otOJePfIyZg6geqoWA/NmlwAeXPP5F
X-Google-Smtp-Source: AGHT+IEFG20eSUTr56Dzm86hJKoAGrqMGQ7NpL4rFk+elFHQIhbV8HIxps9RrXjyvOJ+ING7esR9IA==
X-Received: by 2002:a5d:43c7:0:b0:368:5858:826e with SMTP id ffacd0b85a97d-36b31b658c3mr3582932f8f.59.1721993188670;
        Fri, 26 Jul 2024 04:26:28 -0700 (PDT)
Received: from [192.168.2.143] (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36b368709fdsm4875270f8f.116.2024.07.26.04.26.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jul 2024 04:26:28 -0700 (PDT)
Message-ID: <8e788807-a066-4fb3-b7df-0828fb0145d1@gmail.com>
Date: Fri, 26 Jul 2024 13:26:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][nanbield 12/12] rpcbind: Specify state directory under
 /run
To: Steve Sakoman <steve@sakoman.com>,
 openembedded-core@lists.openembedded.org
References: <cover.1706104658.git.steve@sakoman.com>
 <3d5a85f173dffa14a6829edb9e6adbd5a3946d9c.1706104658.git.steve@sakoman.com>
Content-Language: en-US
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <3d5a85f173dffa14a6829edb9e6adbd5a3946d9c.1706104658.git.steve@sakoman.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Jul 2024 11:26:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202525

2024. 01. 24. 15:01 keltezéssel, Steve Sakoman írta:
> From: Joshua Watt <JPEWhacker@gmail.com>
>
> The state directory must be correctly specified as under /run because
> RequiresMountsFor doesn't follow symbolic links which means the unit may
> run before /run is mounted if the default of /var/run/rpcbind is kept
>
> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> (cherry picked from commit 561e853e97e2cfa325ed310233577a5e124d9049)
> Signed-off-by: Steve Sakoman <steve@sakoman.com>
> ---
>   meta/recipes-extended/rpcbind/rpcbind_1.2.6.bb | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-extended/rpcbind/rpcbind_1.2.6.bb b/meta/recipes-extended/rpcbind/rpcbind_1.2.6.bb
> index dd89726afc..dbd4d32e0a 100644
> --- a/meta/recipes-extended/rpcbind/rpcbind_1.2.6.bb
> +++ b/meta/recipes-extended/rpcbind/rpcbind_1.2.6.bb
> @@ -40,7 +40,7 @@ PACKAGECONFIG[systemd] = "--with-systemdsystemunitdir=${systemd_system_unitdir}/
>                             systemd \
>   "
>   
> -EXTRA_OECONF += " --enable-warmstarts --with-rpcuser=rpc"
> +EXTRA_OECONF += " --enable-warmstarts --with-rpcuser=rpc --with-statedir=${runtimedir}/rpcbind"

This backport didn't fix the rpcbind.service failure that
I can also reproduce in scarthgap.

The change requires "runtimedir" to be set, but it's empty.
rpcbind.service ends up with:

RequiresMountsFor=/rpcbind

instead of

RequiresMountsFor=/run/rpcbind

When editing the service manually or leaving it as,
rpcbind.service fails during boot with:

rpcbind[455]: rpcbind: /var/run/rpcbind.lock: Read-only file system

FWIW, the "runtimedir" variable in bitbake.conf was introduced
in scarthgap

commit 90bc18108230f6d41a50cebc8348444e119e95bf
Author: Joshua Watt <JPEWhacker@gmail.com>
Date:   Mon Dec 18 08:38:02 2023 -0700

     bitbake.conf: Add runtimedir

     Adds the path to the runtime state directory (/run). In particular,
     systemd units need to have the correct path to the runtime directory
     because RequiresMountsFor doesn't follow symbolic links. This means that
     if a unit calls out a directory in /var/run (a symbolic link to /run),
     it may actually start before /run is mounted. The fix is to have the
     unit specify a directory in /run instead.

     Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
     Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index e7826e7af9..83b12cbc15 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -31,6 +31,7 @@ export sysconfdir = "${base_prefix}/etc"
  export servicedir = "${base_prefix}/srv"
  export sharedstatedir = "${base_prefix}/com"
  export localstatedir = "${base_prefix}/var"
+runtimedir = "${base_prefix}/run"
  export datadir = "${prefix}/share"
  export infodir = "${datadir}/info"
  export mandir = "${datadir}/man"

This commit (with or without the export that other variables have around it)
applied to nanbield does not fix the rpcbind.service failure.

I just sent the hopefully proper fix for master that will also need
to be backported to scarthgap and nanbield, plus the runtimedir
commit to nanbield.

>   
>   do_install:append () {
>   	install -d ${D}${sysconfdir}/init.d
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#194288): https://lists.openembedded.org/g/openembedded-core/message/194288
> Mute This Topic: https://lists.openembedded.org/mt/103931999/3617728
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [zboszor@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


