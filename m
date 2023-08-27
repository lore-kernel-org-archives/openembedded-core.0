Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3245C83F10
	for <webhook@archiver.kernel.org>; Sun, 27 Aug 2023 14:17:33 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web11.27794.1693145849465222069
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Aug 2023 07:17:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=KhN5T4Cj;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.45, mailfrom: steve@sakoman.com)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-99c93638322so503115066b.1
        for <openembedded-core@lists.openembedded.org>; Sun, 27 Aug 2023 07:17:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1693145848; x=1693750648;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JM8DXleUKn4cuJjkFPt9R3AR/TEY4pjfV2M+CV2RAgs=;
        b=KhN5T4CjeLllo4eYkra4oLRqVva2AWd/J84IDWHc+24wbpzkDRFa273HOu9hDMHQ+q
         zD3hEKjteTw0UzKl0W97naIfdvC9lNpB4D7bGKa3syPkFR53zU1kfsMMTLcKTcNkKfui
         fZ+VSjhaXeTYNSS43Xvg/ndHNLu0GvKtI1qvYM63GzsoIbafD841ThHCHjsLxgLBYAOt
         6QtpFEsod06aSwBVSpdV1n7DrYsDhO6L7KikA1OQeudZx4ALsb3xOZ6zzMXQcCXa9jld
         tPK3eGcQSPj4I2me7ADMQVBdoZS7X0caBDBHAGmKRurpqvPj3qSsclQdu6g25Xr7Soa5
         dqSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693145848; x=1693750648;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JM8DXleUKn4cuJjkFPt9R3AR/TEY4pjfV2M+CV2RAgs=;
        b=QWuf1xTf2/wHmgObNo42g6QRgih7nw+HZVtxGLnbulBistwo8U4r0w1h56eGzrDJUv
         o87jzhUhVO2Y0oPlnaoLsm3aXx8nESzDmHLj7oWF0HVUwlegdea4KeuyhEN0kvRFPBx4
         WudZU4GDHL8rD3Si13Iq3CTTqLY/XOha2jLGHHu40hbChR1604aPRAXU4KLKDDZy3d3+
         2mTNYHe8dGtK0q8dpWI9AtOY3mNW5P7IBJgfVzFZPVuozqzl8+q0w6H4t/FAfagD6pDA
         07Q1jjlepSvAiHs62+/nOjZJE3fUwi8qD1BrwnRTMOcu0RgSz+hR3IvOJ9wpd3dMlLo7
         gS9g==
X-Gm-Message-State: AOJu0YyDC1wuEFC9GSV+//CytOMxR0P3vr9zexOmsMrJJ83lPw7bbxup
	Wq9jO3P5wGdNGTpG/+iNJEZ07tld/Jgwq+yh32wN0w==
X-Google-Smtp-Source: AGHT+IESEvwVTUaH4cPUo62tQdtHkYWrMuNY06dFkewXH2Ca1Wj4xu+MwNs5NHZ2lQspmH2goh5X4MCjABqIf/tsgoI=
X-Received: by 2002:a17:906:dc91:b0:9a1:e0b1:e919 with SMTP id
 cs17-20020a170906dc9100b009a1e0b1e919mr13728309ejc.4.1693145847814; Sun, 27
 Aug 2023 07:17:27 -0700 (PDT)
MIME-Version: 1.0
References: <ced8242798e2472292457eedcfe5d607@avnet.eu>
In-Reply-To: <ced8242798e2472292457eedcfe5d607@avnet.eu>
From: Steve Sakoman <steve@sakoman.com>
Date: Sun, 27 Aug 2023 04:17:17 -1000
Message-ID: <CAOSpxdb486X1AMdNaerZKxdf7Dwi4JgZ8P--GYoKGsQLn1D-2Q@mail.gmail.com>
Subject: Re: [kirkstone][PATCH] Qemu: Resolve undefined reference issue in CVE-2023-2861
To: "Weihmann, Konrad (Avnet Embedded)" <Konrad.Weihmann@avnet.eu>, Siddharth <sdoshi@mvista.com>, 
	Archana Polampalli <archana.polampalli@windriver.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	"chee.yang.lee@intel.com" <chee.yang.lee@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Aug 2023 14:17:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186773

On Sat, Aug 26, 2023 at 10:08=E2=80=AFPM Weihmann, Konrad (Avnet Embedded)
<Konrad.Weihmann@avnet.eu> wrote:
>
> Hi all,
>
>
>
> this mentioned patch is needed to fix the currently broken Yocto 4.0.12 r=
elease.
>
> This there a plan to issue a hotfix tag release, or will this be part of =
the next 4.0.13 in roughly 6 weeks?

The above referenced patch is in my current test queue. If all goes
well in testing it should be pushed to the poky kirkstone branch
mid-week.

> I=E2=80=99m also wondering how the original patch could have not failed a=
t least two times on the auto-builder (patch and release level).
> That might need to be investigated.

The fix patch mentions that the issue leads to "undefined symbol error
on certain architectures", but doesn't identify which architectures
specifically.

Siddarth, Archana: Do you know which architectures display the issue?

Once we know this, I can comment on why local and autobuilder testing
didn't catch this.  At this point all I can say is that none of the
architectures tested on my local machine or the autobuilder displayed
this issue.

Steve

> Regards
>
> Konrad
>
>
>
> We continuously commit to comply with the applicable data protection laws=
 and ensure fair and transparent processing of your personal data.
> Please read our privacy statement including an information notice and dat=
a protection policy for detailed information on our website.

