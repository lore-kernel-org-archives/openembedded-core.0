Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E1B6CAC5A8
	for <webhook@archiver.kernel.org>; Mon, 22 Sep 2025 13:58:00 +0000 (UTC)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
 by mx.groups.io with SMTP id smtpd.web10.52644.1758549475851147957
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Sep 2025 06:57:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=NKJW2v1f;
 spf=softfail (domain: sakoman.com, ip: 209.85.219.174, mailfrom: steve@sakoman.com)
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-ea5bdbe191bso3249564276.3
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Sep 2025 06:57:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1758549475; x=1759154275; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RSy/NeDnJowFHAM7wcdTSpbHzMsr0wD3hl+dJ1zB+kQ=;
        b=NKJW2v1fhvYgSTzzJaM0ufLIo9SzlReJXozm4jlU4ztKYXXJWXbI/7YHXn5eC0orxo
         +LhytNcfmgtrwCN2S/FU8lOHWCX9Mc1Y91ALXtJdGY3B2C0NMm3tuyJFiIqItKa1gDXb
         n4X+Rb1NgrrCzzG5aQYPq/0HZpXqCz7qSewYZJ0aKK8gdo93sfYYlelH224jT+6OADpu
         R3P6OCSxp/Uz7fQwlqLNa7SIWpbmRG8gvi8rzyv7zEoSWxCPlLcO36fqhFn1Zb6qNBHU
         S8tDGZT6uL0DRq6kH++tWOLgBsrjG8EgJdkWWV4sJ3JvZ2afESoIi+pMwNbJESR8FotF
         TacA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758549475; x=1759154275;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RSy/NeDnJowFHAM7wcdTSpbHzMsr0wD3hl+dJ1zB+kQ=;
        b=JFLZibtWmZJ7sTIeNFVA//2JC5AlNIrlHQGl5YAs3ehry8i3y5yj/85dlcV+GOHJSy
         a9EFQuPKLf/XOlDPeYK1bvSmQbMXo+c13dCytD9L9wG+iTeifnn+qluy2FVmx0/rE+3w
         Qd4YHFSGkyK84VVzgSc90G9oNVwIG2G8eMCXRY0DeA4PY0CbR15P1u5tQHF2rGE14kNA
         0wikNmFQP3WbPjYx5Efp8I3K7QTtkDCC1ujeghScqqVd9UaIvoXXLZsRf6Qv2cUCRh9w
         Mf9wmPrHImLtW5og7aD5KXP8sXZlJrX/uOtsDWLKOfDIs/wWEKA4CgnAYpMqEcPRFU3b
         gNXg==
X-Forwarded-Encrypted: i=1; AJvYcCUDropx93TEWKvN2wUX1nlEEMiZ/rGPaEdT1C75WgOA0f6w5V7Qec4DbXaKoTFWLsZOKeYsfQcTR80m/3RRR5Jy+g==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yx2TSV3p2v+P2AAFdPvft/5clcNenTJ3bD9kdlrr9570bqW1xh0
	jTk6maM1VN/fiYx6K4sIxw2wZe/kJ84rdpIr/wbNn046RWz59dT8UCsub+2bskLDdEvEnRdlRGZ
	KmOVDXJMrKzvLfoDhB+yUc9zXUKsmdNPMogQ8DK+8vw==
X-Gm-Gg: ASbGncvRqynoXcjiHPvOj8ZP/ZxWK43OVXgt29qau36foYJGXbMxinf8AYppgJgIXzl
	FziR843+Uhmxi7QZIj8exU/GkOc86eh0BOidl9xT4xgbSyxCdqfTl/kC44sOqzZuliYcLK9Xebg
	N+87EEtXS8g5XhkEfYhlPvXLfQwB2/Oj0dV/vYkhHEygJ3VJvJAxIts7MJuH9UpQZ2Im/rtfGgO
	iYPvoEEU1ryYoX34nVv+r+wJyhUkII62Cv0fYwE6HxVkSn+bw==
X-Google-Smtp-Source: AGHT+IHeXdHzj2IsZi0PohF0e7yEnerQ8lfwRRDeJ0xKVBLChYQ/ZrOtUY3NV/esqgTtLbTByarO5NSRjfdAdLGj2gM=
X-Received: by 2002:a05:6902:6b09:b0:e95:1dc3:8838 with SMTP id
 3f1490d57ef6-ea89b12f64cmr12219153276.21.1758549474868; Mon, 22 Sep 2025
 06:57:54 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1758250424.git.liezhi.yang@windriver.com>
 <c33930b39db477506067200c5c4f19cec0079b95.1758250424.git.liezhi.yang@windriver.com>
 <CANNYZj8_iTg7ukB=Zhimh5cDuUKs520AojDta3UyM7jDHFscNQ@mail.gmail.com>
 <DB5PR02MB10213D9AC1AC7D4603BD982E4EF11A@DB5PR02MB10213.eurprd02.prod.outlook.com>
 <859a5fd7-7293-406c-a1e5-a4b0737914cb@windriver.com>
In-Reply-To: <859a5fd7-7293-406c-a1e5-a4b0737914cb@windriver.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Mon, 22 Sep 2025 06:57:42 -0700
X-Gm-Features: AS18NWAP3CBn4iVOtzrmjVSf0fBEYzMUMDMjZpKbtgkLRcS_xb77omTuraw57LA
Message-ID: <CAOSpxda7Jdtm0ewuCQ2JSoF_E7r6NKs--q1_4YUa6GsWUof7OA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/1] openssl: 3.4.2 -> 3.5.2
To: liezhi.yang@windriver.com
Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>, 
	"alex.kanavin@gmail.com" <alex.kanavin@gmail.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Sep 2025 13:58:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223823

On Sun, Sep 21, 2025 at 8:19=E2=80=AFAM Robert Yang via lists.openembedded.=
org
<liezhi.yang=3Dwindriver.com@lists.openembedded.org> wrote:
>
>
>
> On 9/19/25 22:00, Peter Kjellerstedt wrote:
> >> -----Original Message-----
> >> From: openembedded-core@lists.openembedded.org <openembedded-core@list=
s.openembedded.org> On Behalf Of Alexander Kanavin via lists.openembedded.o=
rg
> >> Sent: den 19 september 2025 12:21
> >> To: liezhi.yang@windriver.com
> >> Cc: openembedded-core@lists.openembedded.org
> >> Subject: Re: [OE-core] [PATCH 1/1] openssl: 3.4.2 -> 3.5.2
> >>
> >> On Fri, 19 Sept 2025 at 04:55, Robert Yang via lists.openembedded.org =
<liezhi.yang=3Dwindriver.com@lists.openembedded.org> wrote:
> >>> The benefit of OpenSSL 3.5 is that it is an LTS supported to 2030, wh=
ich can
> >>> save the maintenance time in the long run.
> >>
> >> Yes, and it also add new features, breaking the promise the project
> >> makes to its users.
> >>
> >> This update cannot be done without TSC approval. You need to get that
> >> first.
> >>
> >> Alex
> >
> > Also, this proposal was for Walnascar, which will be EoL after the
> > next release (or two). Thus updating OpenSSL to a new minor version
> > now makes no sense.
>  > > If it had been suggested for Scarthgap and the meta-lts-mixins layer=
,
> > then I would have more understood it.
>
> I haven't tested it for Scarthgap, I think we need do it firstly for Waln=
ascar,
> then Scarthgap if it works.

I will be building the final walnascar release on Friday.

I don't feel comfortable doing this just prior to EOL with minimal
testing and bake time.

The TSC can of course decide to do it, but I'd push for scheduling at
least one more release afterwards to deal with any breakage.

Steve

>
> // Robert
>
> >
> > //Peter
> >
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#223801): https://lists.openembedded.org/g/openembedde=
d-core/message/223801
> Mute This Topic: https://lists.openembedded.org/mt/115322467/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

