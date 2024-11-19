Return-Path: <danismostlikely@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E769D6C281
	for <webhook@archiver.kernel.org>; Tue, 19 Nov 2024 17:52:51 +0000 (UTC)
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
 by mx.groups.io with SMTP id smtpd.web11.28106.1732038765992081662
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Nov 2024 09:52:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=d/M+4esd;
 spf=pass (domain: gmail.com, ip: 209.85.221.181, mailfrom: danismostlikely@gmail.com)
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-514cd55403bso20696e0c.1
        for <openembedded-core@lists.openembedded.org>; Tue, 19 Nov 2024 09:52:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732038765; x=1732643565; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=evVGM6b40AYgVWVXLMUhdQf6JMVa0fsftvrvTrVCBa0=;
        b=d/M+4esdy3skUYAhY8j1+wxqMWsXm6qjpuG1Q3SE7PnD7hwkqsg6uymyc5tS/m1hVz
         YLdqIfzUWPvWUKRnPcySfS73w2ui6mKqMDwOXpeHzyspGGeDu7j5avrcP5sdVRT2la1v
         uDwbsgxiZybBjgXpAWH2FHe6O7aZEipSvEGNBaTiOXF/WQDu1boHUDQsDyWjDFC7tOPL
         +UfWNBnnyL5fUerG4/gX6tACX0SD8zf7Fp1m5lUYvjxzfM2nw1y/p2d2aj1cZWRSRMcK
         isWrAFbIBU2VrZLfZkIfqCiGtIbwAwu0xPiJe+gTRcCKbEAYo/Up21aCM/We4+mgM+H1
         YEsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732038765; x=1732643565;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=evVGM6b40AYgVWVXLMUhdQf6JMVa0fsftvrvTrVCBa0=;
        b=pvn6j3w5q8ML7n0kMcOH+fVKU28aynQABIqHky/f6xybSSNmqaNdQON4WLzaNk/kfV
         VfuV22ac+DVgPaMTgvLwcnDoVXMKzBshZ4Aim5nu4hgTNKCVOC9oen0R/DVMHSg2dh5T
         5ueJNkZRmgbJ1cFVot5bfA6+gzDoLKGt3vMCUORnpoY3IUezVrEJdivb69oWoSizknpX
         gm2Y/5jV7P+2E+PBu0w4Kd8W+4T9ZIOlJQixm37GXJulbU+Ys+Co+pWaoeAukS9X63hW
         lbk9I0oM6c54UtgW10JjkWCrriCHRHk05UZbMiwggZwn5I+s7ivQq6K7Lqu2mhp6FsIt
         7hRg==
X-Gm-Message-State: AOJu0YxjXaUA1IxmG9dn7Qw9ld+LrFuhXNmbzibth9HZ5EKtxTMwWw52
	5IQebJdRSN2SCCjynSlOyrHeKTsyJ3DPBNouv6EFJ/9S+DzrWIGbMceOH5EnoQ51zy8tmKSE+nk
	Bk6fc0VBI7ULG9fEyXDSSquBqIcU=
X-Google-Smtp-Source: AGHT+IEhGC3LkFZwGdUa2A70HKQ8YwdWcQqmzZMg0VWU8hI20UhOzJQ3qpVxjHAD4J164ZYHLghLyaXTRXtwRoHtwzU=
X-Received: by 2002:a05:6122:895:b0:50d:6cfc:ac4d with SMTP id
 71dfb90a1353d-514be119af0mr3977324e0c.5.1732038764950; Tue, 19 Nov 2024
 09:52:44 -0800 (PST)
MIME-Version: 1.0
References: <18096FFE519035FB.18574@lists.openembedded.org>
In-Reply-To: <18096FFE519035FB.18574@lists.openembedded.org>
From: Dan McGregor <danismostlikely@gmail.com>
Date: Tue, 19 Nov 2024 11:52:33 -0600
Message-ID: <CACS+7ZSiDbzDk2jY7BNzLfFmmT_v0paxCte0_Pr+PF+-OO=Vdw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] systemd: wrap mtime based time with packageconfig
To: danismostlikely@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Nov 2024 17:52:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207402

On Tue, 19 Nov 2024 at 11:51, Dan McGregor via lists.openembedded.org
<danismostlikely=gmail.com@lists.openembedded.org> wrote:
>
> From: Daniel McGregor <daniel.mcgregor@vecima.com>
>
> Recently the systemd recipe grew support for setting the epoch time
> at image build time. Unfortunately this is unconditional, and our
> use case for the set-time-epoch PACKAGECONFIG is we have a system
> requirement that our product boot with the time set to the UNIX
> epoch.
>
> Instead of trying to complicate things with either an image hook or
> overriding the systemd recipe, just make setting the epoch at image
> time optional, with the same PACKAGECONFIG that controls hardcoding
> the systemd build time as the default epoch.
>
> Signed-off-by: Daniel McGregor <daniel.mcgregor@vecima.com>
> ---
>  meta/recipes-core/systemd/systemd_256.7.bb | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/systemd/systemd_256.7.bb b/meta/recipes-core/systemd/systemd_256.7.bb
> index 3831baa511b..8b7ed2efe23 100644
> --- a/meta/recipes-core/systemd/systemd_256.7.bb
> +++ b/meta/recipes-core/systemd/systemd_256.7.bb
> @@ -870,7 +870,9 @@ ALTERNATIVE_LINK_NAME[runlevel] = "${base_sbindir}/runlevel"
>  ALTERNATIVE_PRIORITY[runlevel] ?= "300"
>
>  pkg_postinst:${PN}:append () {
> -       touch $D${libdir}/clock-epoch
> +       if ${@bb.utils.contains('PACKAGECONFIG', 'set-time-epoch', 'true', 'false', d)}; then
> +               touch $D${nonarch_libdir}/clock-epoch

I noticed this one shortly after the original patch.. systemd checks
/usr/lib/clock-epoch, libdir might be something like /usr/lib64.

> +       fi
>  }
>
>  pkg_postinst:${PN}:libc-glibc () {
> --
> 2.47.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#207401): https://lists.openembedded.org/g/openembedded-core/message/207401
> Mute This Topic: https://lists.openembedded.org/mt/109669301/3617261
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [danismostlikely@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

