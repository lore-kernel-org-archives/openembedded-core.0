Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11808C54E67
	for <webhook@archiver.kernel.org>; Sat, 23 Mar 2024 17:43:10 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
 by mx.groups.io with SMTP id smtpd.web10.13799.1711215783895468492
 for <openembedded-core@lists.openembedded.org>;
 Sat, 23 Mar 2024 10:43:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RqhxhH9M;
 spf=pass (domain: gmail.com, ip: 209.85.208.176, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2d4515ec3aaso24761671fa.1
        for <openembedded-core@lists.openembedded.org>; Sat, 23 Mar 2024 10:43:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711215782; x=1711820582; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BJC11i3QHEp7j7uZwO9BrFzM5fpvlhkRG0aUYaL893k=;
        b=RqhxhH9MgzJEihiTjap5Uv3nBzdVIiFXj5kOvQ0rgkgz5E1gICC+0ht8+goWvoXFT1
         O5MPOU0GXL7WPrZ6YF7uT5eCJP4ESfNNHl0tKhKrzZ9bznQ5BhHCVy8Y/X3zAiz1oM2n
         TX9f/VFSBfIPbR2WpCVjV8ooc+rdj3W5OHMSm/bQ4TdlQ2uyLp9h9N8Ep/0VTQXIIm7J
         XDNdnxk5VI0eQnqmIeZMzee/KoTnDThFMpBT9i4zsNRmYO0A09znVSM8WaTES4B4avGv
         /m9cEk5SVIbCuP/BGk2l/XPjlwP5PPOqLLtb9CJ8X338TOEchWRlTYRxPXqXWGz1aJk9
         FAJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711215782; x=1711820582;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BJC11i3QHEp7j7uZwO9BrFzM5fpvlhkRG0aUYaL893k=;
        b=Ig0qk6LxevDK5yybPm6oHt74lbgJyY+ohOax8nbN8yF6gLIeZ4ATMTl/IAWUncxqim
         koUQUcggHSp836GAEgsDUdhSf6OK0/5ZSjkmeJhbnlRAEJSmEMTRFjL+6nej0NLx1OYL
         60IY+J1BA5fa2XzHrqDMpniZJZ/TM8TL3+VDNoxHV3JqB6IgocK6xxjYQ0onvV0o8n/q
         WBuqRJ/hdKcnaLszEwAUs+BT0c8k7Eh4xKudVPjLoLw6hC9YP2opBwahsR9q8mqrsOp9
         B/q4hjr/EQETFaU6k31PZFs7YgoIYpdq2WcN/4b9X02Zj64pPvo5djk8ccQTLalcqBRu
         CkQA==
X-Gm-Message-State: AOJu0YyQyWSibAtaW4olfTgZJUz6++s3dHjNCxk3z0j0ege4kFCf6Csp
	YtGLz5iKUqm/4sAzN0uQPqrmRSdMcSUlRUG4M3XMlG0Cot+PbIlYJdWR3+kMMVNebI1VciC1RXz
	+mG5IsKslbQCksc7nvV5Ee6+A5jk=
X-Google-Smtp-Source: AGHT+IHBz4epN2AEroYQF33FRYFLtKpU361Rtt44LDO7DTNX8ZefS+Xb50t5wuShNQZW9SKDv7UJM9uRtCoMR3NTg/A=
X-Received: by 2002:a2e:b176:0:b0:2d4:9334:3c11 with SMTP id
 a22-20020a2eb176000000b002d493343c11mr631643ljm.16.1711215781842; Sat, 23 Mar
 2024 10:43:01 -0700 (PDT)
MIME-Version: 1.0
References: <28d65e80-cba-d930-736a-c55c3b9dc8d@crashcourse.ca>
 <CANNYZj_U7AXtWd88nqvzr9ABvw2qZWZ5sL1ypXkCA+2faG1RQg@mail.gmail.com> <f4bd7649-611-7223-6e38-1a251691e241@crashcourse.ca>
In-Reply-To: <f4bd7649-611-7223-6e38-1a251691e241@crashcourse.ca>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sat, 23 Mar 2024 18:42:50 +0100
Message-ID: <CANNYZj_d=gRHYRpT7DM_BRVYyGTnqdvxyAy7YNq7HOC20NacXw@mail.gmail.com>
Subject: Re: [OE-core] is there any reason to use .ipk packaging if devs are
 using ubuntu?
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 23 Mar 2024 17:43:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197462

On Sat, 23 Mar 2024 at 18:34, Robert P. J. Day <rpjday@crashcourse.ca> wrote:
>   all of this being accurate, the one advantage i can see is that, if
> developers are familiar with deb package management on their ubuntu
> dev systems, then they would be familiar with having package
> management on their target systems (provided, as you say, they
> understand that they should work only with YP-generated packages).

Nah, I don't see that familiarity helping anything. Reading output of
opkg and finding out that you need to issue 'opkg install' takes 10
seconds. That's such a minor hurdle compared to learning yocto in
general (especially when to do when bitbake ends with an error) that
I'd say any time saved there is statistical noise.

Alex

