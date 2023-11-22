Return-Path: <alb3rt0.m3rciai@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C0BDC61D97
	for <webhook@archiver.kernel.org>; Wed, 22 Nov 2023 13:49:09 +0000 (UTC)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
 by mx.groups.io with SMTP id smtpd.web11.19609.1700660939161050413
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Nov 2023 05:48:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gLRwKOqu;
 spf=pass (domain: gmail.com, ip: 209.85.208.173, mailfrom: alb3rt0.m3rciai@gmail.com)
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2c887d1fb8fso33735181fa.0
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 05:48:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700660937; x=1701265737; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BXTreMfncPdFhppROTZ/0BkE8/Revb923BQgHvFVV2I=;
        b=gLRwKOqus6xESTkAn3wcChnKc2B4AAB4yrMexg2URwMojavJQqkByhKfQYbxZUcokw
         M20O5kHE8ekWF15CmDKR3/11GLcbmYKDLAFqFhyl1VFqAJPrEng9bdhgHcv4iV1U5g/m
         nR8qQaToW5woPyqqVDqXhVLftfefQd2XlA2lB8O8ksBIkauJ3XdEfdkO3l7FOkyA4gzY
         jpPr3UO3vJ0f0JgwyLxZiUKCMOkc7mxgLQALygF7C/BzXKwupnt8plNyHbS9Mp/XysZ4
         H8lt82ylpWWHochYr9FcYPyG9KKkXiHzTxNKtn9lWN1RleuUQ3hc8ViEFjNdlpU4nAHp
         H0kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700660937; x=1701265737;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BXTreMfncPdFhppROTZ/0BkE8/Revb923BQgHvFVV2I=;
        b=ggz0A7ZxZTWif+Z/kim6T0COD6k+lOebW+YG+avKMpAOxZS8xaQLMXqXv6EdGDTBHw
         Jm8AyrEfV94G6KgpsrQK7ggfzeg1FIrciQV0Ljsh0X4AImZogsmJQfLOhhVk3y/RWHL3
         RtfM5UpbQWGU/CRHrgmDAepSlthLtWJGUmGi36LXPW5xnbJvE5rVuKJAcw/WB8SXRTWF
         1SLhv3xXX+9l9RKrgK3BZYFDDl3gVo8sa85FhOTZ+h7PDEwz6JOjWzHXlQ9bLpBJQpOo
         Lz90sYKf38W9wNxLvw2jt2zt2CNBbOeYqNS8R1Po1C/Us8z0Ftpkqb05D6Is3+xReotc
         tMqw==
X-Gm-Message-State: AOJu0YxYzUP3OGGj1H68OZu0O01HVYxxpXMmh1WIJz7fBodZd6K/BBIS
	L5m2v5R222US2SkPv7Vhtxrp8t6ORKk=
X-Google-Smtp-Source: AGHT+IG3v3LFnqtqb8CbpshR/4v2reYaHEdziPFLWcS4ozYnrYv9LDxQQsmRC3tAFPBeMPa5XlWMzA==
X-Received: by 2002:a2e:9e05:0:b0:2c8:324e:4025 with SMTP id e5-20020a2e9e05000000b002c8324e4025mr1499372ljk.15.1700660936971;
        Wed, 22 Nov 2023 05:48:56 -0800 (PST)
Received: from alb3rt0-ThinkPad-P15-Gen-1 (host-81-118-90-13.business.telecomitalia.it. [81.118.90.13])
        by smtp.gmail.com with ESMTPSA id x15-20020a2e9c8f000000b002c50ba4a047sm1524298lji.80.2023.11.22.05.48.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Nov 2023 05:48:56 -0800 (PST)
Date: Wed, 22 Nov 2023 14:48:53 +0100
From: Alberto Merciai <alb3rt0.m3rciai@gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Michael Opdenacker <michael.opdenacker@bootlin.com>,
	docs <docs@lists.yoctoproject.org>
Subject: Re: [PATCH] poky: kirkstone: eSDK: fix build-in eSDK environment
 file generation
Message-ID: <ZV4GxVD/UXIbUJXJ@alb3rt0-ThinkPad-P15-Gen-1>
References: <20231122085438.7328-1-alb3rt0.m3rciai@gmail.com>
 <CANNYZj87+-6jte1KYUNg2ueWvsYzxiOQvbTzrCZ_ooo9N7uutw@mail.gmail.com>
 <CAH=B7vfs74f-vyx8JGJyfAu3NPa5xwgumsW+_ahMBXnfUmJw2Q@mail.gmail.com>
 <CANNYZj_XcosMZQHswireb1JHJahUvSy1NuHy_3-f3Km8aWwgbg@mail.gmail.com>
 <CANNYZj-Ac_+_AG3_sW=yObw8peavCb3NfUh11-7YDy5xy91StQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANNYZj-Ac_+_AG3_sW=yObw8peavCb3NfUh11-7YDy5xy91StQ@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 13:49:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191104

On Wed, Nov 22, 2023 at 01:45:28PM +0100, Alexander Kanavin wrote:
> I've now sent a patch for it to docs@ - needed only for kirkstone.
> 
> Alex

Ok, regardig test you were asking for, I'm not able to do that right
now.
Is something that I will do in next weeks, in case I will share.

Regards,
Alberto

