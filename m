Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 300F7C2BD09
	for <webhook@archiver.kernel.org>; Wed,  3 Jul 2024 13:41:26 +0000 (UTC)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
 by mx.groups.io with SMTP id smtpd.web10.50599.1720014076256806986
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Jul 2024 06:41:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=KHLdDWO6;
 spf=softfail (domain: sakoman.com, ip: 209.85.219.182, mailfrom: steve@sakoman.com)
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-e02b79c6f21so5837362276.2
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Jul 2024 06:41:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1720014075; x=1720618875; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=80i+xP96T4ZZ0ryHwCk+CnKC6OlCbcu9EaUi8wxHu3M=;
        b=KHLdDWO6CcpTTpcLa9eFtQaY12oPPeXjRyp9fIyUojY5svnUF07hhojoomG5F39BoS
         r2Ph5okjCVujiGZFwofVf0fneYneAzXTj3fBMXgAnCr6JI71sjzzmiWHs4qfhGSqSm42
         aLtQIL7fOkgTOjgXF70/RmHjP4VVerYPiIq74QvlUvVm64v2v5Mrl9FJjnGBki97/qGX
         ycH5nvCtgot9aqNPWIttxiCWOSZiTG0mqOIa0kgQpC1zTOualwC8FHBxXxjJhvXlHRHc
         ONTNZtEmj5nWb3R4ZtHU2lqfpSaD5BiEQEOfXfTmPWQzyK/+dgjnKRSEMUUfGwPRbusZ
         koZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720014075; x=1720618875;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=80i+xP96T4ZZ0ryHwCk+CnKC6OlCbcu9EaUi8wxHu3M=;
        b=Eu6wzBPJLYFBs9odGv5qGH6/R7RSEMF6qzzxAU6ItC4rMZUENl5LuyTEIxeazKtxqt
         cx73pqM2/MehoscM9COp5gciWpECYOwf+sLZOINOyu+HyHCholtqFOWYbMI8jdgBVEGQ
         uWK8hiSoNgb9KqHWmOru7d+jVoKudTPD7n9sdkJu89mu7jyn1bhyl46INqOeefZnELpc
         YWvWWIEkF1FUU6h6uHz7oOCLMLF1/jY+EJf8SrPFUanTXojjAMM8TsybEmMF2ydIXhU/
         wborybc1Fev4pQyAulrZjWdagfkAnmZ9U9gHDI3GRhpXyrvhGxQ9Fnp6Zi76gypi7Tnn
         elmA==
X-Forwarded-Encrypted: i=1; AJvYcCWo6517BVWny0Ope3Jbu0ZsEbKRCKLvFRSNuQTFlO98xetb2puCrkAtNsSxfUQb3Qvx+7wKDalQgT7Xeetw1iJDYzKvMRzb09C6qAAYz+zIll8XtKuCZJiC
X-Gm-Message-State: AOJu0YxJKoVr4Vq00OmiT8WS6RAlVT3zZxbnWMGpWtM5tmiS4ccN2H5x
	YbXAXuo/EWsENr/uEeMpKU5M8a/rHsHtkobI6n1gnpfZnSuNtC/5yogtk9s9CZInICwdDsOPiJ3
	gG+fxWrkJ59sS2imT/1IMHY5hPTZBk0GiNO+ZGg==
X-Google-Smtp-Source: AGHT+IGSy9jk7Z4l5ep8cvOfj9FcVg6tD+IiX/yB5VhBbSMDK8Qxq1CPfqLXtCbj4XbrCJTp6Y8iY1onZ0PjBRoURV0=
X-Received: by 2002:a25:ce08:0:b0:e03:9c35:1712 with SMTP id
 3f1490d57ef6-e039c351c66mr4738312276.20.1720014075276; Wed, 03 Jul 2024
 06:41:15 -0700 (PDT)
MIME-Version: 1.0
References: <20240702163336.75537-2-jose.quaresma@foundries.io>
 <CAL5uAqzSdk6cpDOfM7KpUr94h5QLNbD0-a1CdjJBDX_aNVXYkA@mail.gmail.com> <CANPvuRkKcLTUp28yLa2c3WEFe3ZTFpZVbO0aD-nUBvaRc-oPdw@mail.gmail.com>
In-Reply-To: <CANPvuRkKcLTUp28yLa2c3WEFe3ZTFpZVbO0aD-nUBvaRc-oPdw@mail.gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Wed, 3 Jul 2024 06:41:04 -0700
Message-ID: <CAOSpxdajUXd4fSFXC4890SMkkJn9GoD2fqSZtN0pmUCHt1O0xg@mail.gmail.com>
Subject: Re: [OE-core][kirkstone][PATCH v2] openssh: fix CVE-2024-6387
To: quaresma.jose@gmail.com
Cc: Matthew Bullock <mbullock@thegoodpenguin.co.uk>, openembedded-core@lists.openembedded.org, 
	Jose Quaresma <jose.quaresma@foundries.io>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Jul 2024 13:41:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201477

On Tue, Jul 2, 2024 at 10:15=E2=80=AFAM Jose Quaresma via
lists.openembedded.org
<quaresma.jose=3Dgmail.com@lists.openembedded.org> wrote:
>
> Hi Matthew,
>
> Matthew Bullock <mbullock@thegoodpenguin.co.uk> escreveu (ter=C3=A7a, 2/0=
7/2024 =C3=A0(s) 18:00):
>>
>> On Tue, 2 Jul 2024 at 17:34, Jose Quaresma via lists.openembedded.org
>> <quaresma.jose=3Dgmail.com@lists.openembedded.org> wrote:
>> >
>> > sshd(8) in Portable OpenSSH versions 8.5p1 to 9.7p1 (inclusive).
>> > Race condition resulting in potential remote code execution.
>> > A race condition in sshd(8) could allow remote code execution as root =
on non-OpenBSD systems.
>> > This attack could be prevented by disabling the login grace timeout (L=
oginGraceTime=3D0 in sshd_config)
>> > though this makes denial-of service against sshd(8) considerably easie=
r.
>> > For more information, please refer to the release notes [1] and the
>> > report from the Qualys Security Advisory Team [2] who discovered the b=
ug.
>>
>> Wouldn't it be better to use the much cleaner fix from openssh-portable:
>> https://github.com/openssh/openssh-portable/commit/b00331402fe5c60d577f3=
ffcc35e49286cdc6b47
>>
>> I realise that most of the distros seem to have copied the same early
>> patch but I assume that was to get the fix done prior to public
>> exposure. As there's a proper fix isn't that better?
>>
>> Matthew
>
>
> On the regression report [1] the suggested way to fix this is this one as=
 you can see below:
> [1] https://www.qualys.com/2024/07/01/cve-2024-6387/regresshion.txt
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> Patches and mitigation
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> Because this fix is part of a large commit (81c1099), on top of an even
> larger defense-in-depth commit (03e3de4, "Start the process of splitting
> sshd into separate binaries"), it might prove difficult to backport. In

Thanks for this additional explanation. You can disregard my previous
request for a V2 on the scarthgap version since there is no upstream commit=
!

Steve

> that case, the signal handler race condition itself can be fixed by
> removing or commenting out the async-signal-unsafe code from the
> sshsigdie() function; for example:
>
> ------------------------------------------------------------------------
> sshsigdie(const char *file, const char *func, int line, int showfunc,
>     LogLevel level, const char *suffix, const char *fmt, ...)
> {
> #if 0
>         va_list args;
>
>         va_start(args, fmt);
>         sshlogv(file, func, line, showfunc, SYSLOG_LEVEL_FATAL,
>             suffix, fmt, args);
>         va_end(args);
> #endif
>         _exit(1);
> }
> ------------------------------------------------------------------------
>
>
> Jose
>
> --
> Best regards,
>
> Jos=C3=A9 Quaresma
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#201441): https://lists.openembedded.org/g/openembedde=
d-core/message/201441
> Mute This Topic: https://lists.openembedded.org/mt/107003224/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

