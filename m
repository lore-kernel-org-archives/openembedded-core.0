Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1641C52D7B
	for <webhook@archiver.kernel.org>; Wed, 14 Aug 2024 14:33:51 +0000 (UTC)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
 by mx.groups.io with SMTP id smtpd.web10.99422.1723646025214397426
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Aug 2024 07:33:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=HhW8k3+/;
 spf=softfail (domain: sakoman.com, ip: 209.85.128.179, mailfrom: steve@sakoman.com)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-66599ca3470so64359407b3.2
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Aug 2024 07:33:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1723646024; x=1724250824; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ukll55ES7VWBTNYGMAA1ygUJm3vJ/Gw7ra7McpBAdmE=;
        b=HhW8k3+/lHP8FGHXhWt8y1Wt9PmmMOZcp52Fz5sFjFyF5r1ThYB2uZd1ho2g/JdXmi
         wj86qH1XyyDGRY4wNXStXtmx/lf9WTFAsOkGuUjrgixF/k6AvR2cuLxdPwpaoivRvnDJ
         dN4SEvw6FPuOsQImvlUF9hoSy/qBDkbnUUOVB0I8Y9aOMuN/hiEV/kyQIVH/h0IpeCck
         0tr0jvW37vd2O+aoFU7dfxfjH/eGX2K8nChAJfVRCVEmEYOenwvRR/KeCorShhbUUM5x
         26n2Qur4/a/GgusOwBig8EyB9/itnJ1WZRnXYN6AzAOTQ5zI4BpUhVLK9kiPvaA5ygiG
         EXaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723646024; x=1724250824;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ukll55ES7VWBTNYGMAA1ygUJm3vJ/Gw7ra7McpBAdmE=;
        b=Zfl/uutsMINdi132hIE5oZWhlTODMvEQSvT8vmpRrK620vDz82X6qt3EN6U9Uha6oM
         CtdFpugweCpd5CAzL/V6Mt6NcwkbWKxSBI9KQDix334PTDLeErjrRdiVU8/EQEK5KHj8
         l3EecvQyviOPh24iEKNfaff5JC+xAjPqIasf8L/q9/3hDqlZH7imE9YYTMIUcFpzDrRN
         xgqhSME8qmDHM+vdgXo05Mq96HCo1s6dOHortrDm0lPbdUCwu2iIIIXttO3GFmhjYZ9t
         C+6vnkE8Y17p/YRtVawNbBgXg1HDpVPploaSjILO79OAEG/Mc37L3PXmfRBEO97TYsEZ
         Ldfw==
X-Gm-Message-State: AOJu0Yyiy+otQ+UweY9knFpTlG5aykgCRwvHu/I9lUvnOh5D/Uzy806/
	YYai/YNs6mQDBVLyna3dITEzOYS5nuIn/3YfWksTaQeFiD9Rv0J8vN1KpEBMWnUJs8SMNYnwDnS
	XjLBJv5y/0NwxCdiElf3ea2iZ1zI0hVSod/NZgg==
X-Google-Smtp-Source: AGHT+IE1p5gUJ90ULEB6OtaZhwyuG8cKTrUIvK4mjfHYGioGUvt6+w0ivF1UUZ7gVOczJi4jkXnFJzBR/McX1hrCe6Q=
X-Received: by 2002:a05:690c:4584:b0:665:b351:25e7 with SMTP id
 00721157ae682-6ac96bb6a13mr28204907b3.14.1723646024219; Wed, 14 Aug 2024
 07:33:44 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1723636705.git.steve@sakoman.com> <468a9077d9b3466d60ee8c5b6144529ea5e5c849.1723636705.git.steve@sakoman.com>
 <CAApg2=Q13Q7mHWMOuC4=oL2AJVMBJpHAOPV_3xCphiotCrVuMg@mail.gmail.com>
In-Reply-To: <CAApg2=Q13Q7mHWMOuC4=oL2AJVMBJpHAOPV_3xCphiotCrVuMg@mail.gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Wed, 14 Aug 2024 07:33:33 -0700
Message-ID: <CAOSpxdYMmwa8gATPk+jS6ujuLkpGUUbb01FU9JoLwDoriZyOjQ@mail.gmail.com>
Subject: Re: [OE-core][scarthgap 1/9] cve_check: Use a local copy of the
 database during builds
To: Marta Rybczynska <rybczynska@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Aug 2024 14:33:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203323

Thanks for reviewing Marta!

I'll drop this backported patch for both scarthgap and kirkstone and
wait for appropriate versions of the patch to be submitted.

Steve

On Wed, Aug 14, 2024 at 7:25=E2=80=AFAM Marta Rybczynska <rybczynska@gmail.=
com> wrote:
>
>
>
> On Wed, Aug 14, 2024 at 2:02=E2=80=AFPM Steve Sakoman via lists.openembed=
ded.org <steve=3Dsakoman.com@lists.openembedded.org> wrote:
>>
>> From: Richard Purdie <richard.purdie@linuxfoundation.org>
>>
>> Rtaher than trying to use a sqlite database over NFS from DL_DIR, work f=
rom
>> a local copy in STAGING DIR after fetching.
>>
>> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>> (cherry picked from commit 03596904392d257572a905a182b92c780d636744)
>> Signed-off-by: Steve Sakoman <steve@sakoman.com>
>
>
>
> This patch is changing the ABI (well... variables). I think we should com=
e back to the old naming
> for the downloaded copy before backporting.
>
> Regards,
> Marta

