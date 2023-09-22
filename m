Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB5FBE7D0D4
	for <webhook@archiver.kernel.org>; Fri, 22 Sep 2023 06:47:30 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
 by mx.groups.io with SMTP id smtpd.web11.16000.1695365246788585332
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Sep 2023 23:47:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JJeTf2YB;
 spf=pass (domain: gmail.com, ip: 209.85.208.179, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2c007d6159aso30427421fa.3
        for <openembedded-core@lists.openembedded.org>; Thu, 21 Sep 2023 23:47:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695365245; x=1695970045; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=e87pUgExFWcpNf0L0VIq5ShZX6PUY9+E5bqw1yTHNYY=;
        b=JJeTf2YBPiBQgYg1sxtfzvfHdRWfV3+1U4sZuPZxgrXs6xdZZAQppmF855P9dXDj/5
         8L13Gf65F1SMma1WxEzovo/1l4qilqD+x1dHy8gsLHY7GJxF+mpKlmFoBAYPgH3CY7pX
         Sd41ycWDrS2hBs7zkp79YhJ4BGmi2a1Ru6jk4KbYJUXXXPp19X4Qyah3VvWxJP4eSz9n
         TsY/NorwZmCYm/yohfflgEJfLdUywUDx0eonotzHXvWZ+N5CUsKphzEWeJwVKkm+aDpn
         y2RMPxksjlpci1MxCgUF4S+GHgniiOWE+26BU5kOwYlSy0PZumTC/vK+74sWaAFgIQNu
         sS4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695365245; x=1695970045;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e87pUgExFWcpNf0L0VIq5ShZX6PUY9+E5bqw1yTHNYY=;
        b=Hiz8scqmWl5m/SwHG/pkiX+771bRylpeNetzrIfVS+Q6u9OpmnhedW4WnAvGhcFHlP
         TbqZy54VbkWX/3mdgJy9Xtnfl2xf7wpapV6LIoNjr/UunFtBuWgBmwpTlkFVfCWjO8NR
         jQrtiiFxAMBzsugwUCfOgAwDp6tmNkIIdSQHQouquWUL/ZT4OiBp/xoEZsVt74ES0yYS
         drfms/Svk9KjDkVSB27gaNeH4CbFuKnM4vSMj3dtuteJIoh6fGqsFuYcRaZz6wAF4QF7
         W8J8sDfZwTlD5149RLy52aEDPDM6ZDIjWzZBX7p69en+VugCASGWkW3UxMiKao/yvcbb
         fczQ==
X-Gm-Message-State: AOJu0YyTOneoZnhhXWAk03wCrlCkhePvJgEje1J3Mv13HzgoPmkMdYvN
	WXubKyt2J6J+UKYALOzImAz+ukdkzXr6s6Zo46Temws8
X-Google-Smtp-Source: AGHT+IFjHl2KAtLlauVdcjRyBdyEZK9N2Y+kyBEBsDLyJiCx51VO5m9HYVO+emBlhuL17fHQT7B08qW+AYPMPR2ZUys=
X-Received: by 2002:a2e:9006:0:b0:2c0:21b6:e82e with SMTP id
 h6-20020a2e9006000000b002c021b6e82emr6763224ljg.4.1695365244546; Thu, 21 Sep
 2023 23:47:24 -0700 (PDT)
MIME-Version: 1.0
References: <1695364850-2892-1-git-send-email-qiutt@fujitsu.com>
In-Reply-To: <1695364850-2892-1-git-send-email-qiutt@fujitsu.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 22 Sep 2023 08:47:13 +0200
Message-ID: <CANNYZj8AiH5de9QOiUj28Jhjh_Z=-OxCPq+ro3hjAo8HRnUckA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH V4] tar: add ptest support
To: "qiutt@fujitsu.com" <qiutt@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org, 
	Yan Xinkuan <yanxk.fnst@fujitsu.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Sep 2023 06:47:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188042

On Fri, 22 Sept 2023 at 08:41, qiutt@fujitsu.com <qiutt@fujitsu.com> wrote:
> +tar: add support of --am-fmt
> +
> +Add --am-fmt into testsuites.
> +
> +Upstream-Status: Inappropriate [oe specific]
> +
> +Signed-off-by: Qiu Tingting <qiutt@fujitsu.com>
> +
> +diff -rNu a/tests/testsuite b/tests/testsuite
> +--- a/tests/testsuite  2023-09-22 13:42:29.696287678 +0800
> ++++ b/tests/testsuite  2023-09-22 13:54:54.592276865 +0800

This file a generated from a template, and so patching it after the
fact it isn't correct, even if a generated version is included into
the upstream tarball.

You need to find a way to regenerate it from the template in sysroot
that comes from autoconf, and is already correctly patched. This
requires finding out where the generating code is and how to trigger
it.

Alex

