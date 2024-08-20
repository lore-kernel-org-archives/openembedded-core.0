Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC7E1C5320E
	for <webhook@archiver.kernel.org>; Tue, 20 Aug 2024 08:01:49 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web11.13587.1724140899949284621
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Aug 2024 01:01:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FbeYA6LE;
 spf=pass (domain: gmail.com, ip: 209.85.167.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-530e2548dfdso5765676e87.1
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Aug 2024 01:01:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724140898; x=1724745698; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ODv0RKpntFfWMIzUTDqjxCstjlqSuIGG4dAt8nPUV68=;
        b=FbeYA6LE87k+VBPxkGoRBP+C5HqJl2Ou/rSadkrmOXhkjSdRvMwEGIJbswpkaB4+yl
         OqbK+6wNamxOolGHCoQOHd0XcNb1WBjZ8uAVqVe28vPZVilvfojPRHH+XEGOC3XoOqwK
         IRnw430xAnKZDdlNm6rRwXz3UuXF9RXUSiHPV9nhqNEfOJAvpWW8/r0o9p8yLKqTqGkD
         v6jJW9avYZlFnyLGKJXTpgEKl4xQibAVyagtO8N1WRQihyc9TwgnasE91lhiZ8rKX8Rn
         qnSuIKu3oEmXzY3gHlj3ytIkZ8o3lLd2ZFpPCxqS4UkfYrCuuvQo9ONOS6z0fO/3Xz8S
         /LzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724140898; x=1724745698;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ODv0RKpntFfWMIzUTDqjxCstjlqSuIGG4dAt8nPUV68=;
        b=Z/6rN+oYTlvd2hX0x1i8j0GlX4QUXTwVJ4OLCpMQ16BhhfhVFmEQH7huJqVOBl/F9b
         3RQaOtsV4BY9c3JVrWGodmQm8NsEGuUlTfNZJbrFwRccHgzctkbrUccrVwj36PdthdO+
         oXJqM8MHrJD1hNlQJ9VrpLxBmZubVZ5ZUSCJj1LBldJ1pFk/gPjy8icg9KBXedT4i/Nk
         V09acM74xLjmc9KUoJI4GrhNyQMtVX9LsYFI0lTz1xP0HDrBwsogJQrCqMITniO9j86G
         R61Z2acjeKGOVeKVFjM+9vpvjyjdQSnyger+/KMl4KFoE9FktnknxN86eV9Y8u0L/5/x
         XjQQ==
X-Forwarded-Encrypted: i=1; AJvYcCU+UXBpQAZHuT93ifm0+m3E25hZ0n/CR11lulr4phfiT8f2Bw5aGConx10v1XZ6InBZS618NngJ0niGlsvOkRVoHLjP5kXdbC2YuAxnaa7mokgNMrhpsPti
X-Gm-Message-State: AOJu0Yya4wws8MKKQvuWm7npJviRxzQ1dTGJM1TnwiPXi4PizElejiwN
	drp3eCIAuiZz0VFfa13qMVABGDQvqSXRJ4RGy/JcWSl8+zBA00pOBWs/HsW8A2OXedarDdHQYJ2
	fec1SN4au1DZnw7IZSAXWtK19tvo=
X-Google-Smtp-Source: AGHT+IEZHf9ER0IXeNYByz0oarpApdM75Z91ekOM4O8iVCM+j97m9A41jYsZ+uQVMyMj0eh2ZuwbrzovTeBe8CD7pbk=
X-Received: by 2002:a05:6512:1256:b0:52c:d56f:b2cc with SMTP id
 2adb3069b0e04-533407d9787mr924860e87.58.1724140897380; Tue, 20 Aug 2024
 01:01:37 -0700 (PDT)
MIME-Version: 1.0
References: <1724136703-20023-1-git-send-email-wangmy@fujitsu.com>
 <1724136703-20023-22-git-send-email-wangmy@fujitsu.com> <ZsRHESGsxYyOkv5Y@nuoska>
In-Reply-To: <ZsRHESGsxYyOkv5Y@nuoska>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 20 Aug 2024 10:01:26 +0200
Message-ID: <CANNYZj_g1FY_QYVkm12=-d1vyhW=jDscaNUm9mxhUOofn6i7Dw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 22/24] systemd-boot: upgrade 256.4 -> 256.5
To: mikko.rapeli@linaro.org
Cc: wangmy@fujitsu.com, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Aug 2024 08:01:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203550

Yes; the git revision is shared between systemd-boot and systemd
recipes via .inc, so they both need renaming.

Alex

On Tue, 20 Aug 2024 at 09:34, Mikko Rapeli via lists.openembedded.org
<mikko.rapeli=linaro.org@lists.openembedded.org> wrote:
>
> Hi,
>
> Only systemd-boot? Surely all systemd recipes need the update.
>
> Cheers,
>
> -Mikko
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#203549): https://lists.openembedded.org/g/openembedded-core/message/203549
> Mute This Topic: https://lists.openembedded.org/mt/107996511/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

