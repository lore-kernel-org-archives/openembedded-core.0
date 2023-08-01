Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CBB9EB64DD
	for <webhook@archiver.kernel.org>; Tue,  1 Aug 2023 09:42:59 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web10.8894.1690882975953411481
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Aug 2023 02:42:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=CaeCHKzj;
 spf=pass (domain: gmail.com, ip: 209.85.167.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-4fe10f0f4d1so8979945e87.0
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Aug 2023 02:42:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690882974; x=1691487774;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bekAHoTp8OO/h7DC645YhNlESEY73jrSsNQGRIh6zoI=;
        b=CaeCHKzjDuu6wZfG04IUt/hPYT08iRN1CZ7NZK8idGC53Qmt+8RufCGgry43X1/7TJ
         i5iwkh6el7uE9+Yi/z82JlQs8XcYtdHqhU+0X8G1eSQ4lmF4s+fTzDTe5XaQ2z7BFM6f
         w3odOMgi92241ent+sIf4KN48eivjmCMu2FmlWgPRX2hRiU2amz7/6Ka4T+RowZOLCb0
         Fzoe63BoxsM9JME/DpYW9LLTZD+3yNcNIIx4pXtZ2cClOYCkGp3sOSkUvtR1h8DI4H6t
         Vdqb5NtmlaaVkcpOo0YwZX4IVeMuRuQYKWYH274hcM0h9ca75wgGKmE9wTpn7PQwRRcJ
         Hr9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690882974; x=1691487774;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bekAHoTp8OO/h7DC645YhNlESEY73jrSsNQGRIh6zoI=;
        b=IEBBgYANai/g3kK1I9GlLgkLXEP0rrX5/+GwF4jGHljGINXDxGi2YOJYqUuVFd9Yb7
         WTvXPL9UG82/6Htcamn7WAHjxYXYzPQm/7Hk8y18qCHJGw2hF2LQScd7Qx+cVhdy8Bnn
         QTAbwnT4JiufrwImlFS5ZLQyUAOz/nd+NTT6sM9OcsjmyRpPAGTL+3XJ5wjqfPjScq+x
         sXiVlaQVWTkGqExWQ2WOOXtZXTCRMP2E3Ag1Tki71kpCBww7w0vm0Fkl7oGhlhjO8DKp
         OrWNJdEYn9VJf4GgCwcT97qfyXRVqXTy71RPURdgH1oidmQhXxEYp+QZR+BtpsKqPcdt
         lyFQ==
X-Gm-Message-State: ABy/qLaXq1BNB+UE8tytADscH+4pyd3Fy218q+bf6rouxS+1YYQ9hges
	tA6A+QCdqP7prpEJili3x5YIjXZxTv46icV4sCs=
X-Google-Smtp-Source: APBJJlGi9qY77cj4s7HsgZsVPvKfkTwa5GI1Wz0VtNxVBGxF4reBITLqWqHsttGIXwSJmN7GEvjUxI/uuAqlKVN5Feo=
X-Received: by 2002:a2e:3307:0:b0:2b9:b007:c7d1 with SMTP id
 d7-20020a2e3307000000b002b9b007c7d1mr2031141ljc.4.1690882973815; Tue, 01 Aug
 2023 02:42:53 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1690795930.git.frederic.martinsons@gmail.com>
 <CANNYZj9-PaCUOp1jcuzzpNsU6Pde+LTGBSUHZGphNZPaLYPbFA@mail.gmail.com> <CA+cAkepFrqiBLztAE4nOeUakHArjzbzB+=16R2V7mGzA1D2EnA@mail.gmail.com>
In-Reply-To: <CA+cAkepFrqiBLztAE4nOeUakHArjzbzB+=16R2V7mGzA1D2EnA@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 1 Aug 2023 11:42:42 +0200
Message-ID: <CANNYZj884M3QF5N7gETUTbi2tL0PNcLoicaVjU6Pc752aUvFBw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 0/3] Use frozen flag for cargo build
To: =?UTF-8?B?RnLDqWTDqXJpYyBNYXJ0aW5zb25z?= <frederic.martinsons@gmail.com>
Cc: openembedded-core@lists.openembedded.org, Randy.MacLeod@windriver.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Aug 2023 09:42:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185225

Thanks for explaining, I suppose you can simply rework the patchset to
remove rust-hello-world, and rework all places where it's used (you
can grep the poky source tree :)

Alex

On Tue, 1 Aug 2023 at 11:09, Fr=C3=A9d=C3=A9ric Martinsons
<frederic.martinsons@gmail.com> wrote:
>
> Hello Alexander,
>
> I tried to explain in the code and commit comments, you may also want to =
read the ticket: https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15104
> and I try to explain and ask for help in a dedicated topic on this very l=
ist: see https://lists.openembedded.org/g/openembedded-core/topic/100254129
>
> But to summarize, Cargo.lock is required for various purposes and it incl=
udes the patching path process to work.
> I think having no Cargo.lock for a rust recipe built under yocto is not d=
esirable.
>
> For the  --frozen flag, it put harder constraints than --offline (--offli=
ne prevent network access but doesn't prevent modification
> of Cargo.lock)
>
> The special case to revert the behavior introduced was made to comply wit=
h rust-hello-world existence. I would like
> to suppress this recipe instead of having this patch but I don't know if =
it is desirable and I'd like to think
> for other points of views.
>
>
> On Mon, 31 Jul 2023 at 19:48, Alexander Kanavin <alex.kanavin@gmail.com> =
wrote:
>>
>> I think you need to better describe the benefits. What are the
>> improvements? Can we just stay with --offline?
>>
>> There's lots of intricate code added around cargo.lock handling, with
>> special casing to revert to previous behavior via new variable, but
>> I'm struggling to understand: to what end?
>>
>> Alex
>>
>>
>>
>>
>>
>> On Mon, 31 Jul 2023 at 11:44, Frederic Martinsons
>> <frederic.martinsons@gmail.com> wrote:
>> >
>> > From: Frederic Martinsons <frederic.martinsons@gmail.com>
>> >
>> > This patch series force the usage of --frozen instead of --offline dur=
ing cargo build.
>> > This has the advantage to be sure that Cargo.lock file will not be mod=
ified.
>> > Moreover, raise a clear error when Cargo.lock is not present.
>> > For this to work, we must modify ourself the Cargo.lock before buildin=
g
>> > in case there are git repo that have been patched.
>> >
>> > The last commit is to handle the specific case of rust-hello-world rec=
ipe.
>> > If this recipe is no more necessary, we can drop this last patch.
>> >
>> > The following changes since commit 9b5b850d6a6982bb8ff14dcfbb6769b2936=
38293:
>> >
>> >   libarchive: ignore CVE-2023-30571 (2023-07-30 12:00:13 +0100)
>> >
>> > are available in the Git repository at:
>> >
>> >   https://gitlab.com/fmartinsons/openembedded-core 15104-check-cargo-l=
ock
>> >
>> > Frederic Martinsons (3):
>> >   cargo.bbclass: Use --frozen flag for cargo operations
>> >   cargo_common.bbclass: Handle Cargo.lock modifications for git
>> >     dependencies
>> >   cargo.bbclass: Offer a way to use --offline instead of --frozen
>> >
>> >  meta/classes-recipe/cargo.bbclass             |  9 +++-
>> >  meta/classes-recipe/cargo_common.bbclass      | 43 ++++++++++++++++++=
+
>> >  .../rust-example/rust-hello-world_git.bb      |  2 +
>> >  3 files changed, 53 insertions(+), 1 deletion(-)
>> >
>> > --
>> > 2.34.1
>> >
>> >
>> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> > Links: You receive all messages sent to this group.
>> > View/Reply Online (#185128): https://lists.openembedded.org/g/openembe=
dded-core/message/185128
>> > Mute This Topic: https://lists.openembedded.org/mt/100458213/1686489
>> > Group Owner: openembedded-core+owner@lists.openembedded.org
>> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub =
[alex.kanavin@gmail.com]
>> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> >

