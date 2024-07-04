Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8533DC31D97
	for <webhook@archiver.kernel.org>; Thu,  4 Jul 2024 10:53:55 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web11.7518.1720090434577274439
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Jul 2024 03:53:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AaEMVr4D;
 spf=pass (domain: gmail.com, ip: 209.85.167.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-52e98087e32so516946e87.2
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Jul 2024 03:53:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720090433; x=1720695233; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cxhivx4ZdaYJNnVCY1ZcjciECh7P4JX+ASLXNj19R+I=;
        b=AaEMVr4DK0nrinyU//gnfkT2H3HoPaieH48l0wXOlTu9+XaOa5EFPzrps8KjImYz3d
         v63Gx3ls14breECC2ubohZBr4T4d9FyTmLP5tRflr3gB0ZhbL398uVPq0EY5qBbFdAE6
         MD65eZLKkJFXyOADTnMP+Jj5/16AXfZ+P30sov576ls2cibh9D8MBY6a+JEzHUsKqR0t
         UoEvQK1DfK+eaARWpqFhTNs3UWYHVGbMqhzi5AT70WSjEG9FtDCJuBNel9mwrHkox8EC
         rTOuwhWS/7c7L7ugB/iaPVWrEIHuYrpWbLcQl3KBRkUpNiqmVB8wACkWc9daLdHONCrB
         6Dhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720090433; x=1720695233;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cxhivx4ZdaYJNnVCY1ZcjciECh7P4JX+ASLXNj19R+I=;
        b=sfA3kb8W8CHv4VAXvdoo6Wa9sv3wv0iZjY1QCHykfpLg4mgIIUZInQMCrmVl9G2Q52
         3SOHNJmpevFIsyjAjitEOBZ7mHilLXWGCdxxoAq07aSqBCEDXZBa1jEixveidj9QtVd5
         uGgXrCL/QtuwRyQW6BEeT6IiPN4QwXgevakmn8LzuFcpLJidlZuatIItkHm8NoeEHN6S
         1KhMvvhOT7aqtZwtMBcTrL9K8mguZHMqDuu0c8XAcUI0Idgvj6AIuVYtKREaH/SwEIV3
         3tMbhgGD0w1dC6qHlldl08faRKA6kQ8kBJSIHxvljwu0yYCV4g1yJwYQ/1XIQ/NNNWsH
         5qdA==
X-Gm-Message-State: AOJu0Yybq0zoawfYLTgEGTDr5UbNNKqVsULMx6P2CXOvXy5lW8wLjrRu
	Xjupw/e6MT0ocgyCgc2TbdoQ+ZPVK/fj65DQjVHISzC337IgQ5xkHN1URnmlljcAzjAGsglMIkx
	n6AzDPlwR9rS4M78TvuPjTgYUcTQ=
X-Google-Smtp-Source: AGHT+IHfzY7F/umZu/8C3GSV/FYQSpjzlkdffnpM52qvA5eX1Sr2RB3uX22T4VPPy/iom6J/cXYvqobhUYcvi3J0Ly8=
X-Received: by 2002:a19:ee12:0:b0:52e:9ebe:7318 with SMTP id
 2adb3069b0e04-52ea06b7845mr879728e87.43.1720090432486; Thu, 04 Jul 2024
 03:53:52 -0700 (PDT)
MIME-Version: 1.0
References: <CANNYZj9G2fCXGDT4fhMq8C=Dg7vOFDNM9hhiEkOrzs4P4vvNbQ@mail.gmail.com>
 <31491.1720090219472440122@lists.openembedded.org>
In-Reply-To: <31491.1720090219472440122@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 4 Jul 2024 12:53:41 +0200
Message-ID: <CANNYZj_THLneH0uhKCEtDD0WSoZsJmV0U1jkEo9pU4ZWotAKBA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] bluez5: upgrade 5.72 -> 5.76
To: gudni.m.g@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Jul 2024 10:53:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201533

That's right. I think the submission instructions are here?
https://github.com/bluez/bluez/blob/master/HACKING

Alex

On Thu, 4 Jul 2024 at 12:50, Gu=C3=B0ni M=C3=A1r Gilbert via
lists.openembedded.org <gudni.m.g=3Dgmail.com@lists.openembedded.org>
wrote:
>
> Hi Alex,
>
> I can try, I=E2=80=99ve already subscribed to the linux-bluetooth mailing=
 list. Just need to read more into their patch submission guidelines.
>
> I don=E2=80=99t think they=E2=80=99re accepting pull requests via Github.
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#201531): https://lists.openembedded.org/g/openembedde=
d-core/message/201531
> Mute This Topic: https://lists.openembedded.org/mt/107029827/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

