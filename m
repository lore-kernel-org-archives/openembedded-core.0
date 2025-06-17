Return-Path: <victor.kamensky7@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC5B4C71136
	for <webhook@archiver.kernel.org>; Tue, 17 Jun 2025 08:20:09 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web11.13542.1750148405377033888
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Jun 2025 01:20:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=i5/VL0VZ;
 spf=pass (domain: gmail.com, ip: 209.85.218.47, mailfrom: victor.kamensky7@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ad8826c05f2so1069363466b.3
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Jun 2025 01:20:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750148404; x=1750753204; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JS6dUgumftNfUnsEFz+FhakBzP7GHT7sDTCpy5XIN48=;
        b=i5/VL0VZmB/ChQHDsNNH8CbxS390p+cchg2+9uihR9pA3fL4NBQv8haleZF1iubxS9
         SnhTb6du2JWrJkDFEs38xoOPcV04ERstFgX/EG8Vo+yPA1GqdbaT02TFCiidOdTDq0fU
         RYp50XlFXr7MTjvK0B+AObW11EpS1v0iZtY5GW3PiWD8tNJBPgpzdDUVT4iULtHRl34x
         7t7GswVE/dkDsJ7w16DvtkUrYN5oEv1JdHo/LqowyWeRNW9F/sSbxexHP6t/1eznch2k
         4PoL63rd95J4+5gt3K5murxwbRvs9tMlKIj/uCiCcC8uWjep44uJZos8tGwToFFBJ0bq
         fAxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750148404; x=1750753204;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JS6dUgumftNfUnsEFz+FhakBzP7GHT7sDTCpy5XIN48=;
        b=i2F0Lx775ZM8vKe6Y4wrJiPoLox7B8pDfqeoEnp229bPdI3SiFhSasqaVIAwpX56b0
         EIQMVHjeFWQJT8AODVbYkZ9Ank42Honw57LX8eT9reF6jw7ptkvHUHYTexUjQ1LQeWCu
         fFbgE1FdtyPBWPz7JueSGH2gGfIqos5JnQyumxnKJFXj1ACviE4Ae8tFtToyHE1n2mxi
         kZ2vlG3WenDoWDmlnmks2r1Xy5uTu77569+m/Ol7hPdrzv2xlzJ+wuZL3TeEX3LpNO3Z
         mdxzMUn/cfpE1sgHfPrq8JA1utpUgVonqyZQHu+6J3YJHye2Ox4IvDac0NVr+RzWjPA2
         dOBQ==
X-Gm-Message-State: AOJu0Yx+2VQfiBj2c9ouBP3osZU2hmyny4boNkuhX49Dd2WxEe8Rr9/z
	Lu/lPgIQXZMddxnkJ0cyAazo4dzOlbS9tz4q5OwCEn6ni+Wt9LfNY86H4o/Zmrx8CrzHJ3V3EjO
	gBUZdo7OwuqjMNdKTFfiQ5yjxLMPalqc=
X-Gm-Gg: ASbGncsOratEi9JwtqCKt0l99tAHil/QOv3qpxSlkWFuM5TFssoufjxWNaasDCGS5QG
	5v66VR9yWTXjmRrYOFAff85gj/ReFC+lZ4YVhCjNekJDMLeuZWQh/aifRv5k4zEFBNhBS8payAx
	CKe5c+PnjJS5GBMRF9q2PZK+nS7j3/RjPzn8g1Vn0iTbbqTLEcKL/bGnY7Zg==
X-Google-Smtp-Source: AGHT+IEpW24lFlelagQVXwx3OV/j4XAnCcBDi9VFSt/DQvlhzGCz8b28J/HysS+wLjMuzNQdMQnJaese6HsC27mt6m8=
X-Received: by 2002:a17:906:6a25:b0:ad8:96d2:f38 with SMTP id
 a640c23a62f3a-adfad35b30amr1078055266b.18.1750148403413; Tue, 17 Jun 2025
 01:20:03 -0700 (PDT)
MIME-Version: 1.0
References: <20250617052540.8256-1-victor.kamensky7@gmail.com> <CANNYZj9np2KGj20Khpgfa2Z_dnd0qNZKh_Q1Bp-E9HThdnB8ZA@mail.gmail.com>
In-Reply-To: <CANNYZj9np2KGj20Khpgfa2Z_dnd0qNZKh_Q1Bp-E9HThdnB8ZA@mail.gmail.com>
From: Victor Kamensky <victor.kamensky7@gmail.com>
Date: Tue, 17 Jun 2025 01:19:52 -0700
X-Gm-Features: AX0GCFtFbFmuEeMWySzjouURqy9zeHXQa87OeeruYhGv9q9AMpjrMOYd78V2HNM
Message-ID: <CAHSqoWtbgnjMMPtaauzgXD+a6P_zRkm85sTxDnBPE-W05zqSdQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/3] systemtap: upgrade 5.2 -> 5.3
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, Ross Burton <ross.burton@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Jun 2025 08:20:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218863

Hi Alexander,

On Mon, Jun 16, 2025 at 11:11=E2=80=AFPM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> On Tue, 17 Jun 2025 at 07:26, Victor Kamensky via
> lists.openembedded.org
> <victor.kamensky7=3Dgmail.com@lists.openembedded.org> wrote:
>
> > @@ -7,7 +7,7 @@ SRC_URI =3D "git://sourceware.org/git/systemtap.git;pro=
tocol=3Dhttps;branch=3Dmaster \
>
> Please add a tag parameter here to enable verification that the commit
> hash matches the version tag. There are several examples in oe-core.

May I use "nobranch=3D1" as well? I.e
"git://sourceware.org/git/systemtap.git;protocol=3Dhttps;nobranch=3D1;tag=
=3Drelease-${PV}".

Note in the SystemTap project I've run into situations when the release tag=
 was
not on any branch. I.e release-5.0 was not on any branch:

[vkamensky@vkamensky-fc38 systemtap]$ git branch --contains release-5.3
  master
[vkamensky@vkamensky-fc38 systemtap]$ git branch --contains release-5.0
[vkamensky@vkamensky-fc38 systemtap]$

Because of that for 5.0 I had to do shenanigans: specify githash from
master branch
and explicitly add their patches to reach release-5.0 tag. Otherwise,
if they repeat it again
in future versions I will have to take 'tag' off because githash from
main branch won't
match it.

Although I don't see 'nobranch=3D1' used in any places now.

Thanks,
Victor

> Alex

