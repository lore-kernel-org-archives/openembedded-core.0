Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E91FC2D0CD
	for <webhook@archiver.kernel.org>; Thu, 15 May 2025 19:39:06 +0000 (UTC)
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
 by mx.groups.io with SMTP id smtpd.web11.393.1747337938417065036
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 May 2025 12:38:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FMe7Rdi1;
 spf=pass (domain: gmail.com, ip: 209.85.167.181, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-3f6a92f234dso1241957b6e.3
        for <openembedded-core@lists.openembedded.org>; Thu, 15 May 2025 12:38:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747337937; x=1747942737; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LAZrT9crWZlBjcBblnuQ5NYJzN/v2960HVarWhMB1eo=;
        b=FMe7Rdi1SGMowg6gw3wUJ7Tjh+JLfecEm8jN+oref7S4hkR8AFJIOGzNkOmA84GT8i
         /k43oSbmrdHOe5p+/Xyajtfp21BD5G5T8h9S5kwdzQmw2pZMEELfelGGtObS4csT6sjS
         YJ2cPMtiYD2SaW0wuxdjDqc6rJZ6hCSggrIr7AeQl3UaY7n+JtSWgMLnkDBm5sln3FXn
         NH0JhrAaNQwSKy843dOdwpCELu60qdjKCUmB+7tHPkhSWnqBUQcjFDMWIEFgrG+m3MNB
         R2BCHwIqrFnIrahXQ1sUoyxgEnA0VOfzjxGbrhQhj/tR7RVtRgrYgyQ2/DOe1BtGcEG6
         zDLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747337937; x=1747942737;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LAZrT9crWZlBjcBblnuQ5NYJzN/v2960HVarWhMB1eo=;
        b=xGVnl9b/STFYExuCBcGuX9O9hz9x/B/121TSsg/gn/mSazf22g4uQd4zJPs0EFpV5N
         BynL1aBB9FG9PFMaklFF853IkQrVWim0DDvBb8hu9oaDYP0Uxthik+3fejn65RDOgfl5
         APJqWL2Qp52I+2n4pIbqeFTExI1oz/OUc3zpCu4a9icZIRt3FOECyXbPzELX/4r6jvqM
         TfeZbAVwnbPXrnbLSWPUFl2h8VuOV4Yks9bsa7uNQeLs8c1SQudBdiHTt0dNVzoRhW9l
         chS83IuZscgp3c8eENKMI/lXeZs1+gxTzm2naPlI6FJmXsYq/D79SnvkFqT/9eUZD143
         XgvA==
X-Forwarded-Encrypted: i=1; AJvYcCXJn1d8DfZkO9novBOTUTmQh9BuXMjsrZqtcWfjC0inn1G44JvAvYwtBZvXdNLxIkLFog99eVOhMVcdWv0LlrQPXw==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yx2G4tWWMAKR9Wlur7+I8JdMnHhfpkxhaUAf/rgobVBKK0ZtdPt
	JdD0/ZUbz5Mgtgs2uYz7IuVZYhPuJ93MEK62XbAykEl81h4/xQy+5Kt5rBHFn3tzpc5Dr4uMQ1J
	iBA6SnjN3FjxciQQKsw4DoyJEBOsDCj0=
X-Gm-Gg: ASbGncvcf4MkGJeg4gdlp9s1YTZ+t7d8yp9LcGKG66xyuknfQCyZ8JYS/qIUg9Safke
	BR4MLQeLMVS5013q3anQzoZvCOdbe9153MIOGeQz25r6Fsx/QLeWPxgen0OM4JX75m4Mb+rdcw1
	sSjiGUcrzc6spyx/B01Mn9RY1lEDRpYny56K079fqg+TqooB5G7lpQUpSJ8LfnGQ==
X-Google-Smtp-Source: AGHT+IHx2I9HWFp3wP+gy8hQi6PUdCusoBzAowlcauDQliwZbsNSoBy/znahHmXZ4fK+6kaxdtHPa0D3xh6p7cQxTZg=
X-Received: by 2002:a05:6808:4449:b0:401:ea99:537 with SMTP id
 5614622812f47-404d86b445cmr704134b6e.16.1747337937590; Thu, 15 May 2025
 12:38:57 -0700 (PDT)
MIME-Version: 1.0
References: <20250515130753.326236-1-luca.fancellu@arm.com>
 <CANNYZj9qTsHiDK-hHgNUN72+i--RamkCNt760Fa3ZjWkEzqSAA@mail.gmail.com>
 <6C8DA825-0E82-4776-9E56-55B17CF1052A@arm.com> <CANNYZj-71JnUvJb1tAZ34TGQX8RTwGB9ATUVc7-ptf+CemP+XA@mail.gmail.com>
 <1CB83516-B9EF-4381-85DE-59B4C55A031C@arm.com> <CAMKF1sr68GCyfXRMuS4cUBRL4jCEd4RUZ4GZrKN84R01w_gfSg@mail.gmail.com>
 <BEB697EE-4F8F-4832-9C8C-F149BE8E862B@arm.com>
In-Reply-To: <BEB697EE-4F8F-4832-9C8C-F149BE8E862B@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 15 May 2025 12:38:31 -0700
X-Gm-Features: AX0GCFueXZTeEmwAcpwmYQdttCNZTLBQRpQvl7nMdxS5qrANUxE70CfbtciOO5M
Message-ID: <CAMKF1srHjmPo-tcx2u5c15oZCNzFKu=NagkFFHQ1UCYdCWe9bA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] clang: Include the libclang python bindings in
 the build
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 May 2025 19:39:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216704

On Thu, May 15, 2025 at 11:48=E2=80=AFAM Luca Fancellu <Luca.Fancellu@arm.c=
om> wrote:
>
> Hi Khem,
>
> > On 15 May 2025, at 16:47, Khem Raj via lists.openembedded.org <raj.khem=
=3Dgmail.com@lists.openembedded.org> wrote:
> >
> > On Thu, May 15, 2025 at 6:52=E2=80=AFAM luca fancellu via
> > lists.openembedded.org <luca.fancellu=3Darm.com@lists.openembedded.org>
> > wrote:
> >>
> >> Hi Alex
> >>
> >>> On 15 May 2025, at 14:38, Alexander Kanavin <alex.kanavin@gmail.com> =
wrote:
> >>>
> >>> On Thu, 15 May 2025 at 15:36, Luca Fancellu <Luca.Fancellu@arm.com> w=
rote:
> >>>>> Why? Can that be a PACKAGECONFIG?
> >>>>
> >>>> I used the same approach as lldb, why do you think we should use a d=
ifferent approach?
> >>>
> >>> The request was to explain why this is beneficial, and should be
> >>> always enabled. What is the use case specifically in clang?
> >>
> >> ok I see what you mean, the module will use some python bindings for l=
ibclang, so I guess
> >> some recipe could switch the feature on if using the module, otherwise=
 it should stay off
> >> by default.
> >>
> >> Make sense, I=E2=80=99ll try to implement in that way
> >
> > Just measure build times before and after this change, my guess is it
> > is not adding a significant amount, but do measure it.
>
> Is there a standard way to do that?

enable buildstats and do a build before and after
it should capture task times

>
> Otherwise I=E2=80=99ll do just: time bitbake -c build <recipe>
>
> Let me know.
>
> Cheers,
> Luca
>

