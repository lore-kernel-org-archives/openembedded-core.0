Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB27FC678D4
	for <webhook@archiver.kernel.org>; Thu,  2 Mar 2023 10:10:58 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web10.11476.1677751854184523496
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Mar 2023 02:10:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=VxHjWtzZ;
 spf=pass (domain: gmail.com, ip: 209.85.167.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f51.google.com with SMTP id k14so21379851lfj.7
        for <openembedded-core@lists.openembedded.org>; Thu, 02 Mar 2023 02:10:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677751852;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xybDzOia1Nhv67wYWW6PGhZIcKb6nDbiYEjUG/la7Kk=;
        b=VxHjWtzZY4hJCl778VkDWz14KEXbacVOObnKGtCQggBCEZ8bsdvn8FeBAdD2ZKne2c
         kzJ8rLCzcDiN+2yKz3TC5kU030uAwW/K/gsc1UW69QvvPZqCUqRL5DsWyBBTmPn6j86c
         4iXDA2yod61bOQ+LTatirVNt1VNXpOLxi3iFslAHO8c2IiHp+G1kfDNycyTZW4zZhjpr
         z7tWgp0ks72QFrCFksJwHCHeLizMAOZ/pwRkiRBRTOiiHKN4DSuJ8ETx+SjPHILzUnoh
         eLbVTgTS/ONKVHl0D6sFWeECuGPt2vWswjtKriaqbkSdj4qpLJ29RUbtPI3R/ltfNIC9
         A0YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677751852;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xybDzOia1Nhv67wYWW6PGhZIcKb6nDbiYEjUG/la7Kk=;
        b=Z7Hi8Xfg201rmYI81lAcv6zccHUNGjM7s9rBFb9GKtjKaMo2b1RjwTvdVfQqansBma
         iQsD22rWxFLFxp8LJcElxmgfgrUipWjntp0WZ4UuF6btxPAvzkTWxPZRt34W3kBFb5aL
         COGHW/o4kiLck+m15Gtzw34EzjZRHId9nJXTVxdj2nPHK5QMnOPo3zTfkFbr0fZWqpfo
         af2PTsqaiTOEn5PiCts6/jjNFwcQ5ghbuSdSxEKBHnptT7tMoYqQCOspHIFYsaV/eoVY
         CcsE+3QQ/kZ7VhaNXfOuaPytx8w4+2mmwaKEl4f473uKi7NfEZdHyM/SM8aXlIcb5N1x
         gJFQ==
X-Gm-Message-State: AO0yUKUHcBvrW+T2qjXJN8te+Zny4wNv9WeF4gsoXwv+r+dD1y282TMc
	/o/LyZz9JNM/R9Qhf8U0v1zJdkiDJTO7nNW9NRw=
X-Google-Smtp-Source: AK7set8xcz4eZBxC+ruJQn+H1qCPqv7aD5yIEy8vyO8EjqkIqtVV25gaSqP6rscvyV+2kGSF44VIn+At8r5tR8wdz/U=
X-Received: by 2002:ac2:5e8d:0:b0:4d5:ca43:704a with SMTP id
 b13-20020ac25e8d000000b004d5ca43704amr2831527lfq.13.1677751852238; Thu, 02
 Mar 2023 02:10:52 -0800 (PST)
MIME-Version: 1.0
References: <1677206695-16822-1-git-send-email-wangmy@fujitsu.com>
 <1677206695-16822-2-git-send-email-wangmy@fujitsu.com> <cdfcc4e555f8093eb7672e167af45933ac27730e.camel@linuxfoundation.org>
 <OSBPR01MB1845D1E95A8383D70E6F550CDCB29@OSBPR01MB1845.jpnprd01.prod.outlook.com>
In-Reply-To: <OSBPR01MB1845D1E95A8383D70E6F550CDCB29@OSBPR01MB1845.jpnprd01.prod.outlook.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 2 Mar 2023 11:10:40 +0100
Message-ID: <CANNYZj-rBcc59H6RCFmMBJai_LW9=nqBo7-GJ9Uj5ncXAw0WJQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/4] vala: Fix install conflict when enable multilib.
To: wangmy <wangmy@fujitsu.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Mar 2023 10:10:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177959

On Thu, 2 Mar 2023 at 03:01, wangmy <wangmy@fujitsu.com> wrote:
> For the solution to this problem, can I delete this file from the target?

This looks like a packaging or dependencies problem, so before you
act, you need to investigate why these files get installed, and
whether you need two multilib copies of them.

Alex

