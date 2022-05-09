Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80003C433EF
	for <webhook@archiver.kernel.org>; Mon,  9 May 2022 08:44:33 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
 [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web12.29686.1652085868148318414
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 May 2022 01:44:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=MGi83jRX;
 spf=pass (domain: gmail.com, ip: 209.85.208.178,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f178.google.com with SMTP id v4so16135410ljd.10
        for <openembedded-core@lists.openembedded.org>;
 Mon, 09 May 2022 01:44:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=PmNmd7WUNdtFvilWH4sqJfFKg5/w0rTYvMa7F839EtI=;
        b=MGi83jRXthKvTAN5JeVU6WiuboUNW08Siz3LTMGjIgY1POSEeBOrU+f1IJs8BZV+OG
         RhXdD84uQzYvbdnw+Vv7ItRxE4E3ZhaZFOfQX305a9MiQI5lOzyibsGcet8kj3GTK7QS
         jOnDlwbb81SDfwvtPF9izIuFw5L9ht/NZ7WI24viTapXvsZXDiaa2LQqE1diQkVBS/MT
         8DjK9aaH2qGCXFPB3aUImQKcE6wDYFGa7BEhxEflGHA21aU3m0tS7ellHtnZAfNm/mDI
         0jlsgYqQSv+KCRfqthEp7fKi6l8DHykNCPKjrl0WMgkAw5N8ulHf5Oh7Jz/V6oFWwULe
         P2LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=PmNmd7WUNdtFvilWH4sqJfFKg5/w0rTYvMa7F839EtI=;
        b=PRJ9y7CLX7sASW3YV4ViHv8IfZ5iJP/1ycMjsOgS49N/voSBPdtUYHS7xX8aTOsv34
         Qn+P0Cwh7adNOjATjo4WoNlMSD/0rxEgLAhxRTSvlxe5e1tf2YwYn0NluSohQxrOoD6T
         hlUh24VsoxZREyI+o58CD7Vjn18MA9qxPMt9AXHGhYFZQgne466Jl40kZA64B/OLKy8K
         3O+ydrXjqnCXsAeoLZx2z1PW0k1g1abwxpgbHiYJbwe5cEKXhaZvM9cYMicTTR1SqFqp
         7C13sJmpw7hFnn3uHL3N1+BFr+r56xdHWPbZaKeG1Aw2oHxN09IfQBb0LCiQlKNiU98m
         aXNw==
X-Gm-Message-State: AOAM531HdJ1o+9jHtaYjqrDyP7FNS3RVmM3Awsd9BtyVedgBVMsmK4rD
	D1NcloXk/IDBUTPH9yAqXtH00jHuAs+4xf0fJHg=
X-Google-Smtp-Source: 
 ABdhPJz0EfyxGos3DZ5FqjXbgVrh2gdBiRUgaJqqsHRP81jgFMUXRCBSA1n1IYTn2PnXz9Z4Iy0uT5rLnQTDN0l+Y4Q=
X-Received: by 2002:a2e:824b:0:b0:24d:c247:c928 with SMTP id
 j11-20020a2e824b000000b0024dc247c928mr9933621ljh.68.1652085866348; Mon, 09
 May 2022 01:44:26 -0700 (PDT)
MIME-Version: 1.0
References: <1651808269-3775-1-git-send-email-leimaohui@fujitsu.com>
 <CANNYZj96-SMiUCmTMhZ3uoLSHN8mH0js6e2k2JJQOW3Tp3MV5w@mail.gmail.com>
 <OS0PR01MB6178F9B577423A035BD3CCDDA0C49@OS0PR01MB6178.jpnprd01.prod.outlook.com>
 <CANNYZj_wg3r2smGwNVoN34L0ai-pPjPEfjg0P7LoQEirfL8rhQ@mail.gmail.com>
 <OS0PR01MB61785EBD9D1441B3201AC1A2A0C69@OS0PR01MB6178.jpnprd01.prod.outlook.com>
In-Reply-To: 
 <OS0PR01MB61785EBD9D1441B3201AC1A2A0C69@OS0PR01MB6178.jpnprd01.prod.outlook.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 9 May 2022 10:44:14 +0200
Message-ID: 
 <CANNYZj_K42tgo7kRVV4fOHkFXQBxEs86KdGBX_vbYsahip9FVg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] gnutls: Added fips support option.
To: "leimaohui@fujitsu.com" <leimaohui@fujitsu.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 May 2022 08:44:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165388

On Mon, 9 May 2022 at 03:30, leimaohui@fujitsu.com
<leimaohui@fujitsu.com> wrote:
> > PACKAGECONFIG[fips] =3D "--enable-fips140-mode
> > --with-libdl-prefix=3D${STAGING_BASELIBDIR},--disable-fips140-mode,gnut=
ls-nativ
> > e"
> > PACKAGECONFIG[fips-native] =3D "--enable-fips140-mode
> > --with-libdl-prefix=3D${STAGING_BASELIBDIR},--disable-fips140-mode"
>
> I'm sorry that this way doesn=E2=80=99t work, because PACKAGECONFIG[fips-=
native] means PACKAGECONFIG is set for fips-native not for fips.
> And I don't find any existing recipes that config PACKAGECONFIG[xxx] for =
native or target separately.
> I wonder If you can tell me any recipe for reference.
> Thank you.

You can issue this in poky/meta and plenty of examples will come up:
[ak@fedora meta]$ grep -ir PACKAGECONFIG *|grep class-native

Alex

