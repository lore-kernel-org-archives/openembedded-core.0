Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 157E3CD3420
	for <webhook@archiver.kernel.org>; Tue,  3 Sep 2024 11:10:50 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
 by mx.groups.io with SMTP id smtpd.web11.20852.1725361841643633427
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Sep 2024 04:10:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AFp54U29;
 spf=pass (domain: gmail.com, ip: 209.85.208.170, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2f3ffc7841dso3246091fa.0
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Sep 2024 04:10:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725361840; x=1725966640; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9lSeDablAdxJtZcr7eHEg2/fIcnuSMghyJ+rIWfvV7s=;
        b=AFp54U29xzCL+t4S7/kPireqoZUH0tCc4A/p4VtIdSjpQyGq+oA3MA32ByfTDn8pxd
         SehN6+IS4CkSCSBVVPZNyhpylGiCuEhnS2/o1dlkwK0diQtuGm5+BqEuMe5vTW0PBqUQ
         b8oYqnf8nyhQ7bTzJb0rjfzSR0P6Q7CQpyMZ3qCwnMy7AfDUHYxx96/qNDtQW0ta7a0S
         EkfBrK8VYoaCVtkJSYZUJCbQWlpqYHE0qWbRrf5+SGEAisUFAqFxEwr/fuBoZ9BCGdl2
         /qH0Y/SKgdDzmwUa9g5MaQUre1fZgoRMQRTIu2Dm0PQa4Yqi6x29cUqrDT/SeBhym5it
         2GTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725361840; x=1725966640;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9lSeDablAdxJtZcr7eHEg2/fIcnuSMghyJ+rIWfvV7s=;
        b=IRUZwRc7Uky1rT8rBs8060o95TVXY394Cg7IzCag29qVL5N53FVJZOTPoqA78rD2Fu
         HsTAkfzxwzs+2NemxAsomMKkly6jY3fieFoSIsvahXEdbTZeVJakXvvProm0TRmvnZQW
         i/v+HQ1ZAOAojPmmf/tr5cTHZz63IElQQkP6wiywVT8NKqsMgyazS0t8WlLYHnU7VlRa
         wAgmexn5wV5XoSFIo1fVy3oWX2RK/vxiwu8pcwq7al0Z93zOXOIPKwGuiT3tGNecQBYi
         QJdhOZzjFsQ8cTASV7OtgPb2S45+LWwb2YWPY/aypw4s6Jj7jTok2E4r4YxAjRi9aGBR
         r1Cg==
X-Gm-Message-State: AOJu0Yxn8/SHE2TGCq2eA06GiTogSUOGEJaM+84uXB4Y29BvMgpOdShu
	ZIgG/E5P63pXUMp068kzSOSsDVsqAz1/2N8YWiPNpzDpj434OopnoVIlZKLFDTJyLS8WyJV6TZi
	gIvEvYy37sSqOObHbJVW4rEi/Hug=
X-Google-Smtp-Source: AGHT+IGi1ImwcOcLhD00PedifvMajLgrIoVqV25vfawV4619V7ca/hTjRWRhSe/NkcpjA7iTfHHu7n7+u0wvqrzgmXo=
X-Received: by 2002:a05:651c:b0a:b0:2ef:2bac:bb50 with SMTP id
 38308e7fff4ca-2f644408336mr24206981fa.11.1725361838772; Tue, 03 Sep 2024
 04:10:38 -0700 (PDT)
MIME-Version: 1.0
References: <f33c3781-fab7-dee3-79b9-9385584076d3@crashcourse.ca>
In-Reply-To: <f33c3781-fab7-dee3-79b9-9385584076d3@crashcourse.ca>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 3 Sep 2024 13:10:27 +0200
Message-ID: <CANNYZj95DCZ4m+yMRyebSa2zF93TJdWn2tQrQj3sjTH--oLLvg@mail.gmail.com>
Subject: Re: [OE-core] does do_install_ptest() need to check "PTEST_ENABLED"?
To: rpjday@crashcourse.ca
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Sep 2024 11:10:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204157

The whole install_ptest_base task is deleted if PTEST_ENABLED is not
set to 1, so yes it's unnecessary.

Generally, it helps to find the point in code history where the
now-questionable code was introduced, check out the whole tree at that
point and see if that code was necessary back then, e.g. if ptest
class used to work differently.

Alex


On Tue, 3 Sept 2024 at 12:56, Robert P. J. Day via
lists.openembedded.org <rpjday=crashcourse.ca@lists.openembedded.org>
wrote:
>
>
>   another quirk in my travels through the ptest feature so i can write
> a tutorial, i ran across precisely two OE recipes that check
> PTEST_ENABLED in their definition of do_install_ptest():
>
> https://git.openembedded.org/openembedded-core/tree/meta/recipes-core/gettext/gettext_0.22.5.bb#n147
> https://git.openembedded.org/openembedded-core/tree/meta/recipes-devtools/elfutils/elfutils_0.191.bb#n68
>
> that test *seems* unnecessary, or is there something particularly
> subtle that might require that? i don't see any compelling reason to
> have to check that variable.
>
> rday
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#204155): https://lists.openembedded.org/g/openembedded-core/message/204155
> Mute This Topic: https://lists.openembedded.org/mt/108242664/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

