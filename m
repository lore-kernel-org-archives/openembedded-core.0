Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B013C61DA4
	for <webhook@archiver.kernel.org>; Wed, 22 Feb 2023 11:10:06 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web10.6138.1677064200323551883
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Feb 2023 03:10:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=IYqyB/F1;
 spf=pass (domain: gmail.com, ip: 209.85.167.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f42.google.com with SMTP id s20so9236545lfb.11
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Feb 2023 03:10:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dH29YeP5L3DUrxGmANdyDNeDT0JQPuoEDyosXPeFT8I=;
        b=IYqyB/F1YcekK0WyyAg6NNBFvubJAXv3jizIFxB77N6x5iSU7EIPm39q1KjnBF//Uz
         A1oQDHHa6b2+ZcczQ3fzrhJYheIZdI0NJH9r0ZOt4bKYeEDC4PgoDHxfEb05Yr5YrLI/
         hmIi2c1lCFtJcnr3H6kCA1mfc/DYaHYHryvkuBB8kfxYrgxr4Yr5uQzHCKmw1FhLLsw7
         DtOY/4f068FGQ/72KXikEF+Ai6EVl28cdr5n2WUDaYJC6zTVd6GawQS2yw2stpOrVLcE
         HYpKvJ0OGhvWlYx+hv0QoDTFFK/poMENTmVDq60G5lvO7hbN3cKbVys2TJz+MpbZB90u
         Mh2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dH29YeP5L3DUrxGmANdyDNeDT0JQPuoEDyosXPeFT8I=;
        b=c6RdpV+xFbXUHB1qdBTVQlo1DkBLRLrgoc6Ldd1ZbXAfcup1SmjRUJoxqo8LkRdCzF
         W5dlQfvh3EsaUU+gZSiduCqK2QdA9HbITIzNPVsxSF8nh5OEwTS3NQFTi9Uk26PCSIcE
         5Tr4lGgUT4Y4MUIhOVK6D3qusEChfujyOIsRBw1POQSvN4i5EBdJFIwSlvaWcFqJKQ9P
         pl3AR4ZarCkpLI0QhL5ryrOekroLizNgWIn0z7fBrW4raltrToz2igA6cOqOA0y6h5m7
         K3HT8jbZqhXUIMoKFmNUvMM1mJ8u1wdVPsVyHw/Dl9k9Wjn0/dqZPT35H+8ERNQmtDaW
         Vkeg==
X-Gm-Message-State: AO0yUKXRv+b7nfAie3IKf2dVR1KLNfst5iax1yzJoZBeVUoOfwmsIQlV
	o2KX6dtzqMhV5G4RRCdduq6r4VKcJaAeJ/b1JgSnuoQx
X-Google-Smtp-Source: AK7set9r8USBhQcyWknHgZunXDeM7d4CXKxNx5rhGuPfn2Mw+Ktw/kAozQLf3VnFt6SLM73Q4pAse20miqBqdXzCUYk=
X-Received: by 2002:ac2:5095:0:b0:4d5:ca32:6aed with SMTP id
 f21-20020ac25095000000b004d5ca326aedmr2678611lfm.13.1677064197901; Wed, 22
 Feb 2023 03:09:57 -0800 (PST)
MIME-Version: 1.0
References: <CANNYZj8T1Ex=5ti2ENWjcjcHSCMBubqu18rnenLQWcJdr_QQ=Q@mail.gmail.com>
 <24955.1677038318936477992@lists.openembedded.org>
In-Reply-To: <24955.1677038318936477992@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 22 Feb 2023 12:09:46 +0100
Message-ID: <CANNYZj8g2ybosu2VQ+G+LfpdF6J-2fFCQV1wr89BR1jsjjfk=g@mail.gmail.com>
Subject: Re: [OE-core] Yocto reproducibilty issue :: rust-llvm binary differences
To: Sundeep KOKKONDA <sundeep.kokkonda@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Feb 2023 11:10:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177565

I took a look at libRemarks.so and libLTO.so. If you run 'objdump -s'
on them, you'll see that they differ only in 'gnu.build-id' property,
and are otherwise identical. So you need to look into why the id is
different, I don't remember right now how it is created. Probably the
compile log can give a clue.

You can also confirm that it is indeed these two files that cause
divergence in target rust by for example copying them from the A build
into the B build just prior to building rust.

Alex

On Wed, 22 Feb 2023 at 04:58, Sundeep KOKKONDA
<sundeep.kokkonda@windriver.com> wrote:
>
> Hello Alex,
>
> files are here... https://we.tl/t-ijJJZnBvKh
>
>
>
> Thanks,
> Sundeep K.
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#177559): https://lists.openembedded.org/g/openembedded-core/message/177559
> Mute This Topic: https://lists.openembedded.org/mt/97113152/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

