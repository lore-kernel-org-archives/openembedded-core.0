Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6006EC46CA1
	for <webhook@archiver.kernel.org>; Mon, 18 Sep 2023 17:21:37 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
 by mx.groups.io with SMTP id smtpd.web10.57628.1695057690473791741
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Sep 2023 10:21:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=E532FqmP;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.174, mailfrom: steve@sakoman.com)
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2b962535808so76243301fa.0
        for <openembedded-core@lists.openembedded.org>; Mon, 18 Sep 2023 10:21:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1695057688; x=1695662488; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nIvSo3C4IheED7T+I0NXGbEpqwkJGssP4c1tIOKlqkg=;
        b=E532FqmPxGTKSkQDS+wKMxKmgYqTANSYYZVz/5Te1CEPyphP8IUbwofNB8rRAxkmnE
         UYDp0VozGulb/gmaFiHhaSmMhwAjio5SMI4PFAGO506uJWGlUHF4/P4EHkHghmBNkedm
         t3MxMowqEg5I+MZfM83HLN1RREL82pf488AKHx9k3LU5KHshaupzhuOorNlRgJHtJ34S
         5mf6efd3uVW0RlDGlnQRY3q8c3sj9M4iOwhfdT3YTAbbMYhaoJPKkDs3ORNSbYNV9jPd
         AZRQWnJ9jeAj0sop0EbwR7Jr5GPNsVRhtbgI/I+tTikimuUJQYO8mhw/Pow+bHAkDxOC
         ERxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695057688; x=1695662488;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nIvSo3C4IheED7T+I0NXGbEpqwkJGssP4c1tIOKlqkg=;
        b=IC6cLnUEj1bnLhOgVem8t/59shfTc8uMS54nfTkOqrxaaG/KXiRxzQZPRIvyEOPCiJ
         Lv21+WQskYOKfBC+NC+F/bu51rEZmviJER6TqTqyXOyjyS8ZDWAYkQQqUzx3wschpsXi
         H5qdCgv7p9LqFedlxDgztMKwZEvUBzTeMcp4pgqviQ9QK6LnFBNTRt0l/87z5PioXoLj
         fA9bO7cDyuz4ZNpbaz9R8OH1XBWzG/zrIE/QfqPZEtHNLHb/BDHwP6gjQnrE0lu5KYFv
         ZYIxSHBZAxwDQjCzBQFWfcVaeL0upSZ354j6zDHXMCKLct0nRM26fYFu7g/n6O2esdhY
         WuIg==
X-Gm-Message-State: AOJu0YzlrcVMQaPzBmH5nyZkJyWQPEBqNZVGngC+sOX/nJKN7Fz/HwEN
	X3RPzss91hypfWihktoygGnmvMvMpdYkktkzIvE0tjrRlvlgcHMokwE=
X-Google-Smtp-Source: AGHT+IFnumCnl8xRiX/M5opk3OXoo8Fn70ayLWldEfuL4ZrITG7i2MaUvqcLQjDEh3/NCssXPSiEaf7/y835yVkm6jo=
X-Received: by 2002:a2e:9395:0:b0:2bd:f8:1b6a with SMTP id g21-20020a2e9395000000b002bd00f81b6amr8011357ljh.36.1695057688276;
 Mon, 18 Sep 2023 10:21:28 -0700 (PDT)
MIME-Version: 1.0
References: <20230915204234.3547739-1-martin.jansa@gmail.com>
 <CAOSpxda40yQJrJCXhS-rtQ9T89auc52zwibD6qjCWYKSLZfB5g@mail.gmail.com>
 <DC0F0107-7850-4099-A201-6F6C1DB5D0CB@arm.com> <CAOSpxdYY8WWTknuN8Dayi8Q1fF1Q_=gJ67E7W3gJDEbx_eNG3g@mail.gmail.com>
 <CA+chaQeQ5F1HWdrS76XMS3NmTxgOcMUTWzHqrh5wZ3176qKb5A@mail.gmail.com>
In-Reply-To: <CA+chaQeQ5F1HWdrS76XMS3NmTxgOcMUTWzHqrh5wZ3176qKb5A@mail.gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Mon, 18 Sep 2023 07:21:16 -1000
Message-ID: <CAOSpxdZFRS1P4+ZY1jQM=Y02DV+-6+C2drWthBdNJ8u5TxK_cA@mail.gmail.com>
Subject: Re: [OE-core] [mickledore][PATCH] gcc: backport a fix for ICE caused
 by CVE-2023-4039.patch
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Ross Burton <Ross.Burton@arm.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Sep 2023 17:21:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187840

On Mon, Sep 18, 2023 at 7:10=E2=80=AFAM Martin Jansa <martin.jansa@gmail.co=
m> wrote:
>
> I've intentionally sent it only for mickledore as the gcc version in kirk=
stone and dunfell isn't affected by this (at least my reproducer isn't).

So, just to clarify, is it OK to take the CVE-2023-4039.patch for
kirkstone and dunfell?

Steve

>
> On Mon, Sep 18, 2023 at 6:42=E2=80=AFPM Steve Sakoman <steve@sakoman.com>=
 wrote:
>>
>> On Mon, Sep 18, 2023 at 6:08=E2=80=AFAM Ross Burton <Ross.Burton@arm.com=
> wrote:
>> >
>> > On 18 Sep 2023, at 16:48, Steve Sakoman <steve@sakoman.com> wrote:
>> > >
>> > > The CVE-2023-4039.patch was also submitted for kirkstone and dunfell=
.
>> > > Should I attempt to cherry-pick this fix for those branches too?
>> >
>> > The bug says that the patch only applies cleaning to GCC 12/13, I=E2=
=80=99m seeking clarification as to whether that means it=E2=80=99s not rel=
evant for older branches or whether a proper backport will be needed.
>>
>> I did a quick experiment with kirkstone and there were two issues with
>> cherry-picking:
>>
>> 1. The test suite hunk failed since the test file doesn't exist in gcc 1=
1
>> 2. The first hunk fails to apply since the file name being modified in
>> gcc 11 is a .c, apparently it was changed to .cc in later releases.
>> You took this into account in the CVE patch file
>>
>> Removing the testsuite hunk and hacking the filename allowed the first
>> hunk to apply (but with fuzz errors).
>>
>> So I'd say we definitely need a proper backport if the issue is
>> relevant for older branches.
>>
>> I'll pull CVE-2023-4039.patch from kirkstone and dunfell until we have
>> clarification.
>>
>> Thanks!
>>
>> Steve

