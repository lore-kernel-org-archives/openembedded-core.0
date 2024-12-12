Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E9C1E77182
	for <webhook@archiver.kernel.org>; Thu, 12 Dec 2024 07:59:09 +0000 (UTC)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
 by mx.groups.io with SMTP id smtpd.web11.15137.1733990343732263366
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Dec 2024 23:59:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QP76pbsX;
 spf=pass (domain: gmail.com, ip: 209.85.222.179, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-7b6c3629816so14140985a.1
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Dec 2024 23:59:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733990342; x=1734595142; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=aznc0t4+cumuGUxX4Vc6yBS+xvN5EJicufzf0r2LjKI=;
        b=QP76pbsXAa8uB3VZ3uXnpbwnD8nQb37ILpRPEyc8NUTR3+VCjkSn3S9+0R4ahA1x3S
         yXItQ+iUkWA7kU5h2I4K8NNA+d8RH1c1J8dODkKsH/Ye/tP6Axj/XiaLRkPLutIBqysi
         tUroGtQ4F9GbDyZYSh8yEhwZoxjWzwjKrhy/yKPyA0QD5HXCWbqkzIFWvmjR2AAOmWqC
         CkSm9RPQBHLmBEmMXt1WK2i7XBFM80p2ylkrJnTbcdpC/zzxc4j8pvnlmwXaZrYonjXh
         SUZilH0IhIuhoKX1JJOaOh81Xmk8gEZEDDVskmsBzPHDozLPW/x4woBav4wOtQEqMqw5
         ejnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733990342; x=1734595142;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aznc0t4+cumuGUxX4Vc6yBS+xvN5EJicufzf0r2LjKI=;
        b=cNsW9pQCDArjdfEp5j9MabjukhTv/sRvHux/gr7iAYLiw4Ta0KV89MFBTV5WkNTVWS
         3E6FxoaLQODt3CyuRD4HD+Z42KA8NOwUetZHdSlAnBIuSaOcyRN2z7ETEIjuzWR5akR5
         JDPTkPlRBbhEWlNhRCrznp/kaz8TC8l/h1E71pKIuYqd7iAekmfdZf9GNILD+YvTw2Sp
         YeqBQd+wJBT5ZTy5UeVbFXt5obTPGjiwXd1s6pHDMsHe4dFNHSwdQrppLxy2slEB+r5x
         KuimX8YuNNuUUnvtKeukXJ4MWUPYa3DKe2nlIl+FKWIyX7QR22NxVO5w5tUe5gSS13DI
         HjsQ==
X-Forwarded-Encrypted: i=1; AJvYcCXIeXN0/IZK6tPccQmWhvG9P45pd/OEgtlLcb+ARZIUWAfa3npyzZTG4K0rfWy2Am53nmycFcAsH9C/9xolsfK45A==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwOJmFTjtvakhD8fe2rtQ1EryuxmAknHV/Uq2m7nZLW9i1ih7TK
	HZ9ezkwZijFEb44tHYu/hq3eWNARBBLe2WM3PWgB+G/Ck9rJ6O+a8umUZS1eS0s4CLoL3RZ6yhR
	0l6p9ACxB3JlAW+yjPMQsXDkfE7w=
X-Gm-Gg: ASbGncsz3/TD2EWkEBUBUi29Sq3N8aFwV/Wy1Uf/Xebg0PR71deIXNSwkoRcJtZmBbA
	IneLfmLQyk0D9pZkBtOxDOt/i2hbbj/V1IBUVYvTiXP39T7QRt7W5MfpgkggPSnkZPuVBFE8r
X-Google-Smtp-Source: AGHT+IHgCAmQ1CF53pa4SeC8C+eIb9tRc4hIz85famxsPCr9BEzgS6mhL8VvaCLy9+tWw2iDvNupb/+GTPHv8ZX/8Dk=
X-Received: by 2002:a05:6214:1d01:b0:6d8:b189:5419 with SMTP id
 6a1803df08f44-6dae38e694emr45922536d6.8.1733990342552; Wed, 11 Dec 2024
 23:59:02 -0800 (PST)
MIME-Version: 1.0
References: <1733964540-5537-1-git-send-email-wangmy@fujitsu.com>
 <1733964540-5537-2-git-send-email-wangmy@fujitsu.com> <Z1qT2DQ_jGIstNcY@nuoska>
In-Reply-To: <Z1qT2DQ_jGIstNcY@nuoska>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 12 Dec 2024 08:58:51 +0100
Message-ID: <CANNYZj86YOBLurL4n774DPS-GQeqSPv8Zzw4DOoGVi_a57pS+Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] systemd-boot: upgrade 256.8 -> 256.9
To: mikko.rapeli@linaro.org
Cc: wangmy@fujitsu.com, openembedded-core@lists.openembedded.org, 
	Wang Mingyu <wangmy@cn.fujitsu.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Dec 2024 07:59:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208627

On Thu, 12 Dec 2024 at 08:42, Mikko Rapeli via lists.openembedded.org
<mikko.rapeli=linaro.org@lists.openembedded.org> wrote:
> >  ...ystemd-boot-native_256.8.bb => systemd-boot-native_256.9.bb} | 0
> >  .../systemd/{systemd-boot_256.8.bb => systemd-boot_256.9.bb}    | 0
> >  meta/recipes-core/systemd/systemd.inc                           | 2 +-
> >  .../recipes-core/systemd/{systemd_256.8.bb => systemd_256.9.bb} | 0


> NACK: must also update systemd and systemd-boot-native recipe versions since
> systemd, systemd-boot and systemd-boot-native all use systemd.inc.

The patch actually does this. Is something still missing?

Alex

