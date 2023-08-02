Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47586C00528
	for <webhook@archiver.kernel.org>; Wed,  2 Aug 2023 07:26:37 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web10.9228.1690961191233789001
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Aug 2023 00:26:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=AG01RvGk;
 spf=pass (domain: gmail.com, ip: 209.85.167.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-4fe0e23a4b1so10318988e87.3
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Aug 2023 00:26:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690961189; x=1691565989;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Ecw3/xqtwawcitsNib0mZdf3+EdONwUvwS6oH9ky8g0=;
        b=AG01RvGkhU0xKhmRSTW+UdyXqOTc4EsZvRYfHji7ZUakKZnNUa1vO5953hp5NeW42/
         KJUilRCtGBcHOdTKgVijtUd23MygQFp9eoK6/rlLDNzuDG2vUrbo5+4ond5MbMxh27DR
         nYa+z/Vf5eYdggBV4RpMTt1+InCiMClR95BxJ5ry3DiJWkZcLpLMTbRffRRSsE+udR3r
         ic3J1V9o/bS54WMBRIz57qhb9EjL6YKTYu2k7JsdVw4ZmsALOCM1uagX6Fu21Xf63Xz5
         vi7I6ZRxNsbWgWdt5OmYl/tmnJLKHmyUBzEA1fQ2mv7H8igEtVeJONiXJhUsiBcQ+ZuO
         5jjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690961189; x=1691565989;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ecw3/xqtwawcitsNib0mZdf3+EdONwUvwS6oH9ky8g0=;
        b=RIHWT8cRc0Se7Iwb4BDUmjb5YBfYSORY5RmMOkJB9wCwBESFMkAH87o+TgyMfbFyT6
         YzlREI/Rwobj0D8uh9lEyA95l11pGpEl0QyUFVmjgZ6/YXyxxbp29Gn5kqggN0SJHVXX
         LrsAGQ8CUP3liaGZD8pFXIxxY5kx86BfwL1vtKkmVCJN5PuG/zAhhyNRiPQ62Jcmho8e
         u3pjoGHs0N65XI/IuKeP9l2TPrkBvYktg0P6/8IvVAn1ziJ4iuUfiHuPGkqOhkOs17Dw
         ZlDOy/C/Fym2I0TNHM1H+6mXrSo45rihdPtcUMI72YJxxrnN1+ygAaEecA0f8hpAttyO
         er8A==
X-Gm-Message-State: ABy/qLbZlQJa6N2PBuUtp6ExP69inkhKP5NmTiix/+YLt8cY73GPB6L9
	V49Vi5nZEFaa7nYjesK9m//+E/5ii/bhv4D26Kc=
X-Google-Smtp-Source: APBJJlF8/UafMpdGbbPSn9pRSGzKpuIhIhUP6PSFRMqpQQ04AnqHGQjggI/P+iIncdYsW1PPlwj7wNwmXkfeupKZuNc=
X-Received: by 2002:a05:6512:3b0d:b0:4fb:7c40:9f95 with SMTP id
 f13-20020a0565123b0d00b004fb7c409f95mr5254412lfv.47.1690961189130; Wed, 02
 Aug 2023 00:26:29 -0700 (PDT)
MIME-Version: 1.0
References: <01010189b1ee533c-9d06d28e-1ac4-48ec-9c61-acc24630bbad-000000@us-west-2.amazonses.com>
 <CANNYZj8AmqfvSzO=buyS9j6kAo2L4d_Q+FfsQHmwYvidnt++bQ@mail.gmail.com> <CANx9H-D=YBxeCLuF-2ssxzGsKTrSGTyG2gak=PKban9jgrJWmg@mail.gmail.com>
In-Reply-To: <CANx9H-D=YBxeCLuF-2ssxzGsKTrSGTyG2gak=PKban9jgrJWmg@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 2 Aug 2023 09:26:17 +0200
Message-ID: <CANNYZj8nOdYzddAE1WWVPG+fKE5a3HtGbw032qOt6C2a=BgA5g@mail.gmail.com>
Subject: Re: [OE-core] [AUH] Upgrade status: 2023-08-01
To: Tim Orling <ticotimo@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Aug 2023 07:26:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185380

On Tue, 1 Aug 2023 at 22:48, Tim Orling <ticotimo@gmail.com> wrote:
> I did the meta-perl/meta-python run on Sunday 30th and noticed the same much higher preponderance of devtool errors.
> I did a run of the recipes in oe-core that I maintain on 25th July and it had less devtool errors (3 of my recipes passed,
> only python3-sphinx failed and that was not devtool related). So that 5 day window is where something regressed.

I just sent patches for this. You are welcome to do a respin with
them, ahead of them landing in master.

Alex

