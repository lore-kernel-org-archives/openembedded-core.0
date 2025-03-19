Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49BB9C35FF1
	for <webhook@archiver.kernel.org>; Wed, 19 Mar 2025 06:57:28 +0000 (UTC)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
 by mx.groups.io with SMTP id smtpd.web11.2123.1742367443572349185
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Mar 2025 23:57:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=P/PZuncI;
 spf=pass (domain: gmail.com, ip: 209.85.219.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-6eb16dfa988so25280736d6.2
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Mar 2025 23:57:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742367442; x=1742972242; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NfNj5ursLuWlx+0QgFTd4B9dFcWaN/1G1x2T8Pwztew=;
        b=P/PZuncIrkASQHX1LQV6zvqNdRa78Fzt0wjJ5QtCKLre2AELnGJB0EVYDhy7EdsY+o
         R4b5I2hmq6Agh9XZ3g1D4p4u/PUGHJnWr7I+KXH2+6CmV3AL153wyUlHOevfI+N8V8JQ
         b0h7BegifB6WDCR/rYRF+iKKR2Mpkt3kUXBskeV93Z5HL5QwnB5M3XtnL+/nDc1IBCDE
         +9u1MiHMZnmui8DKZinuZj1VFhFSxiGO2tgY8QNkF94mb+LqTQ/L1BcPa1GDZHOaIKUG
         6TLwOiAA02R0AunRGILwr74b8dqG2nMfcdjMkoor0RklKP5fykybed2iXc6Js9IHhKDt
         thBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742367442; x=1742972242;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NfNj5ursLuWlx+0QgFTd4B9dFcWaN/1G1x2T8Pwztew=;
        b=QAZBMqpUI7MixGaVJzBgS/l7Jdo9xcomNWnXi3f4oLPHsMALOKABGv+PVdTQxbl/SL
         GPeXynAJbTvu++sBFWF0zU0vJFWlF0xMYQi+YdTEeeEpougZ/MyvfSQRj6G9jj8ZGN8u
         ZF5a7zwNZp6ziK35IqTNU6mEgLsH7ggRROnVgp4HGFQtxjspqz3x8GtSFDyKtG4wg6a6
         H+4S6GpqlPPbyuvdOsYoG1PF3ZTmnswFrUQ8QADH0bXJG274BVzYkwS05YDzS1yzM8Kf
         tTGRycBEc3AYnXv5LotACwuTEefHM3T4Eic7thcUuPCgspqthBQ9kpI10J8oqB0YCqEo
         2u1w==
X-Gm-Message-State: AOJu0YzXROFu6ZTAwo0zrfqUGdkZ1ZrQaHSAmKJm4W3hAjH4FitrMFf1
	oor1xPaVImVjN9xuvE5udJSzkelPaXCTMDeqyHU7BNTR/wQeQ2AT5iN1aaCR76hxdOpOp7207uV
	xl+PDeHCXU0OR9frmEBdv/Dvp1+c=
X-Gm-Gg: ASbGncsa4okdHpMQo8b+wp2MIv13EyYlKgySs6Jqh//xm5u2WWDJOJf5GUDMxA01+KH
	aDeR9Py6M6navBVYZYLJt7seIEoIYkMzsPy05oAPHr0OClpJMdK5aP3DqHFl/rHFCghxRJWxR4c
	nSfCmjwmKWGdnU2UgJWj5Ns3ZGL6WkgimCb+5/BEGj5QkepBtlWunUxcLjobKUwQD9TqDfJ4Y=
X-Google-Smtp-Source: AGHT+IG0nbljdOA9/XWKMM9GtMoK1F/hmQBfiW1tBCM3X6RDgumNHZ5ZdZANYHYaa6bFeuSQ9oeDPEDkTuutIT2/54c=
X-Received: by 2002:a05:6214:301b:b0:6ea:d393:962a with SMTP id
 6a1803df08f44-6eb29279ebcmr22246206d6.1.1742367442523; Tue, 18 Mar 2025
 23:57:22 -0700 (PDT)
MIME-Version: 1.0
References: <83c9c92162d9c0bc1387c633f1464e67f57c70bc.camel@linuxfoundation.org>
 <29973.1742340247475380282@lists.openembedded.org>
In-Reply-To: <29973.1742340247475380282@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 19 Mar 2025 07:57:11 +0100
X-Gm-Features: AQ5f1JpLMYLnG6gWKW0kYZU0IXQnYETZd7a9JYqXWHbxyq0m1kSwS5nLmn1Xtjg
Message-ID: <CANNYZj87YRoQ1CZniNppV2FRxPFmTei=jmx_t=A2C44LXt7HdA@mail.gmail.com>
Subject: Re: [OE-core] Issue: /var/tmp does not persist due to /var/volatile
 being tmpfs in fstab #scarthgap
To: vs.yocto@outlook.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Mar 2025 06:57:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213265

You can probably propose a patch to change the default in master, but
this wouldn't be eligible for a backport to scarthgap. Once they're
out, stable releases simply can't change behaviour like this.

Also it would be nice if you introduce yourself and your company.

Alex



On Wed, 19 Mar 2025 at 00:24, Vish via lists.openembedded.org
<vs.yocto=3Doutlook.com@lists.openembedded.org> wrote:
>
> Thanks for the reply.
>
> Do maintainers recognize this as an issue with having this as default opt=
ion? There are chances that similar to us other devs/orgs are planning migr=
ation in phases to Scarthgap considering Kirkstone getting updates, so this=
 could potentially become issue for others as well. We do have sizable amou=
nt of edge systems in production with various CI, and this change broke an =
important feature and took some time for us to find root cause.
>
> I believe correcting is still a proper thing to do and can be planned dur=
ing any releases.
> Additional reference -
> https://refspecs.linuxfoundation.org/FHS_3.0/fhs/ch05s15.html
>
> Also, it would be good to know what scenarios were considered with this c=
hange, probably we are missing some context.
>
>
> Regards,
> VS.
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#213259): https://lists.openembedded.org/g/openembedde=
d-core/message/213259
> Mute This Topic: https://lists.openembedded.org/mt/111764066/1686489
> Mute #scarthgap:https://lists.openembedded.org/g/openembedded-core/muteha=
shtag/scarthgap
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

