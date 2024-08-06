Return-Path: <marc.ferland@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72126C3DA7F
	for <webhook@archiver.kernel.org>; Tue,  6 Aug 2024 01:54:08 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web11.7816.1722909243673829316
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Aug 2024 18:54:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=INasZ3/B;
 spf=pass (domain: gmail.com, ip: 209.85.218.47, mailfrom: marc.ferland@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a7aa4ca9d72so2609966b.0
        for <openembedded-core@lists.openembedded.org>; Mon, 05 Aug 2024 18:54:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722909242; x=1723514042; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DVEVWdRYL5jfQNUOSRJua2Kh0y/r7MESp2pTrGgXDbg=;
        b=INasZ3/BtCDzNUdsOP7tGFyluNFNwo5c7z1ggEMgiJBEDOOWfrlFAw1KfLmU2TP0aA
         clYjafJY5Aqhyo4T6e2W78hbtXMM35ALy9CuITncpLy+/wbKraq5w8IlU75S7NYae9h6
         fyivATZ4tf56gHWhni+usP/lVcTFRrS86pHPWnQHuEG0LH6NqsbOkx6h6czxr1SdFqh2
         sqM3xgK3ocXstVWv9r3a5u/3R6Y7ZqFQeDhLeAJ3UJHoDanNZ2pCExmyl4Uw8uzCtfy0
         4AVxGUoVXfaq11OsSnmqA4D5+pihLJtpzn5s1G1bG80MVnulttNVQKY+BuS9s5KF3uYv
         0eag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722909242; x=1723514042;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DVEVWdRYL5jfQNUOSRJua2Kh0y/r7MESp2pTrGgXDbg=;
        b=rXT+w1gyiPXgQmxs24vRRwGEYue7KTJu8AMn8MfnjFc7RB154MEi4F5nBIKqIv2XoG
         ZPyk/mihqRHfxhak7h5XyQhbFu/qFNGUprl+NswsA7KTUl6A8Zhoe7G1UCYHQZymzNcU
         64dAuRsP7ZtDU9zFZOS+h6YLGvA23OX/0KCtStT1qj52dsjaMoQQLHZCnbcyyQo+ZEo+
         /jZx190n+iBTbtPcAqqwwLX7sREu+d/0IVOTnPU5ORGrpmA3hzJ6V8AkldTKxn4x9384
         ZTLY/gVgzwXkRqaaeP22PTMQod5MMG2t4OhE62iOpvphmC6BAE/5Uqa4/j6M5xhH7b5M
         Qz4g==
X-Gm-Message-State: AOJu0Yw13/fDzHS5gO1oxlCOVWIspj6VrTXyyWQxOGH1Pl/sRLYdoC3A
	HsV/3VMdh7yuEn17dkBe+IfjaVtc+DRYp8TDY5w5BmOuHVvPgAo34VHy3YboLB312GRYVAwJQHA
	7T9Ogkx+XMEn3WGaicAT0F6qX9eY=
X-Google-Smtp-Source: AGHT+IF+1gw0wdJxb3a/ThyT9RgovF6451jgN2+X8KelKNrd3k5Jfup8nz42zd5HQJqTZ/VXrryfzo+Uzit76AYN/RQ=
X-Received: by 2002:a17:907:3f9a:b0:a7a:bbbb:6243 with SMTP id
 a640c23a62f3a-a7dc506f12amr1036802366b.51.1722909241077; Mon, 05 Aug 2024
 18:54:01 -0700 (PDT)
MIME-Version: 1.0
References: <20240731152858.3340807-1-marc.ferland@sonatest.com>
 <20240731152858.3340807-2-marc.ferland@sonatest.com> <67D06A02-501A-4362-9D7C-BC9C869E543B@arm.com>
In-Reply-To: <67D06A02-501A-4362-9D7C-BC9C869E543B@arm.com>
From: Marc Ferland <marc.ferland@gmail.com>
Date: Mon, 5 Aug 2024 21:53:49 -0400
Message-ID: <CAMRMzCBuKctnQfQD8ZXfhRYZAJrev54N2TO513V2GCk9F_i7Yg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 2/2] appstream: add qt6 PACKAGECONFIG option
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	Marc Ferland <marc.ferland@sonatest.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Aug 2024 01:54:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203007

On Mon, Aug 5, 2024 at 7:40=E2=80=AFAM Ross Burton <Ross.Burton@arm.com> wr=
ote:
>
> On 31 Jul 2024, at 16:28, Marc Ferland via lists.openembedded.org <marc.f=
erland=3Dgmail.com@lists.openembedded.org> wrote:
> > +Fixes the following build failure:
> > +
> > +| In file included from /home/marc/mnt/yocto-kde/build/tmp/work/x86_64=
-linux/appstream-native/1.0.3/recipe-sysroot-native/usr/include/QtTest/QtTe=
st:11,
> > +|                  from ../AppStream-1.0.3/qt/tests/asqt-pool-test.cpp=
:21:
> > +| ../AppStream-1.0.3/qt/tests/asqt-pool-test.cpp: In function =E2=80=
=98int main(int, char**)=E2=80=99:
> > +| ../AppStream-1.0.3/qt/tests/asqt-pool-test.cpp:117:1: error: expecte=
d primary-expression before =E2=80=98)=E2=80=99 token
> > +|   117 | QTEST_MAIN(PoolReadTest)
> > +|       | ^~~~~~~~~~
> > +
> > +Upstream-Status: Inappropriate [oe-specific]
>
> Is this actually OE-specific, and if so how? It smells like this is a gen=
uine problem in the test code.
>
To be honest, I thought that since this was test code, disabling it
would be the easiest thing to do... but it does bring in one more
patch to the layer.

I just opened a ticket upstream: https://github.com/ximion/appstream/issues=
/644

I'll update my patch accordingly.

Marc

