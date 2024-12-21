Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 253CAE7718B
	for <webhook@archiver.kernel.org>; Sat, 21 Dec 2024 20:11:02 +0000 (UTC)
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
 by mx.groups.io with SMTP id smtpd.web10.13440.1734811852014934521
 for <openembedded-core@lists.openembedded.org>;
 Sat, 21 Dec 2024 12:10:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fC9mgHHn;
 spf=pass (domain: gmail.com, ip: 209.85.160.45, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-2a3bf796cccso1302643fac.1
        for <openembedded-core@lists.openembedded.org>; Sat, 21 Dec 2024 12:10:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734811851; x=1735416651; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BEy/hEQYAchTEUjraF2XDUYi/XOwSigYLIA4q1VeSpQ=;
        b=fC9mgHHnXXpr97/3sF7WKk+9FxRRf9i5rxdmXXNBgyZ5DLvIY+zgvqYQSmh7axEMUc
         blvEhbYpLsaVx5sAsiDVe6JJ77jDurCGPb7opGuH1aOPOIiSHPSGl+aK9plUqH+9AS7S
         05Hwz1bSyaXGcaeQvpWD4yvJdBLO2aE75sdnGKTtiAnzur4sq0F+oMCtPgK4sjCUWT7f
         yOrS5/9Dnk7i+pvwAPA4b0BS2KDZWuQcQ8PB2H1P4ltpR7KUPDZMl1+1x2p2W+5gnBUk
         LSM9Szfo/kyf291tlEREaaM8hl6itoLHlmttEfo614Y9m890huyqXM/t2nn2BrPCaIoC
         lp/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734811851; x=1735416651;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BEy/hEQYAchTEUjraF2XDUYi/XOwSigYLIA4q1VeSpQ=;
        b=t9reHfEqiHM+BXt6AWf9RLA719UrEPD2QViW4Uc7d+kGCLX3TPGpabPnfcpSQ3Fr8v
         rI5k/BMnAPKblwI8Ht+TKxeMM7cnqJnfdJhPXsN+rmSlLcKuXHuDBDQ3cu/Hn+ZAPe2s
         Hc1cqMUVElwXM859V6jQNVXL1Zv3QfdGMnqrkgO64tq0g2FJyZBamUQNzetvXVHpKXrw
         CGkxIYrOirfHz75vs35px0jMu3k1qZJ7IfBXCUkZKd2AGB/7pPpftqUcGI5Ucb1WnV4t
         knmHz3HJTzgCVwL33ut+gSlWnEAqB8IQX8uxZmtTRT5W1yBSoQnaPhM8gaF7RqnVgq5o
         nKYQ==
X-Forwarded-Encrypted: i=1; AJvYcCVOSbAJxHw6YX7PrVAMVXzOITlcm0i+JUnayztE3r8hfpwmJgYpTDy8qbTyQaD8+Kjn+dviokWgnjfxJL27TTrOhg==@lists.openembedded.org
X-Gm-Message-State: AOJu0Ywszb5X2MOcPdVu3748TrgnVgTbTzd2KVmjkhdXqSav7OlB6mtM
	mZqPlxYAH0ZhOXVW/wv86eJloWcdMP1xV0UrQT/hEHPF5yazBdFJlvIB0TStfnqMGGSrqRhp2Po
	6wG6bsfwHse66iPIGfti0/gJZ/Y4=
X-Gm-Gg: ASbGncskStTZFjoDgVBzn24G9Z2EW7R8y+calwApX99GUPAJV0bhTJYN6iLOLw1DBop
	BC9k7dFuHXUWXMT09JnoSqY0VE873b07wVOzP
X-Google-Smtp-Source: AGHT+IFt9gaKt7Qg1NcA8oZb3xZBnzyLJi8hrzURknyEDcMqvSJNz+tRiLvlB4S04RA0SFlNGPMGkr6ueOteAwdm3Ls=
X-Received: by 2002:a05:6870:7e0c:b0:29e:547f:e1ec with SMTP id
 586e51a60fabf-2a7fb3cba43mr4126520fac.41.1734811851299; Sat, 21 Dec 2024
 12:10:51 -0800 (PST)
MIME-Version: 1.0
References: <20241219222120.1188742-1-tom.hochstein@oss.nxp.com>
 <20241219222120.1188742-4-tom.hochstein@oss.nxp.com> <CANNYZj-9Jdf6eeW=SdVPnSd8vVq3m+bhO=m9SZF5KKggcfKGvA@mail.gmail.com>
 <f1df3290-445e-4525-a3e5-7d156c5a45a5@oss.nxp.com> <CANNYZj_V5sxoaN=FpvpaFxfKSRNrrarR1Mcv9nuxKAADtbYXGQ@mail.gmail.com>
 <28220675-1c81-4e19-a935-0b001150ab9a@oss.nxp.com>
In-Reply-To: <28220675-1c81-4e19-a935-0b001150ab9a@oss.nxp.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 21 Dec 2024 12:10:25 -0800
Message-ID: <CAMKF1soxnjO=PaP92265dSfX7G9zjoeRu2hfrHV0c_8Mg19cfQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 4/4] weston: Add xcb-util-cursor dependency
To: tom.hochstein@oss.nxp.com
Cc: Alexander Kanavin <alex.kanavin@gmail.com>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 21 Dec 2024 20:11:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208991

On Sat, Dec 21, 2024 at 11:59=E2=80=AFAM Tom Hochstein via
lists.openembedded.org
<tom.hochstein=3Doss.nxp.com@lists.openembedded.org> wrote:
>
> On 12/20/2024 3:42 AM, Alexander Kanavin wrote:
> > On Fri, 20 Dec 2024 at 00:13, Tom Hochstein <tom.hochstein@oss.nxp.com>=
 wrote:
> >> Good question, I actually made a guess that xcb-util-cursor is missing
> >> from the rootfs because nothing actually links to it, so Yocto doesn't
> >> automatically add it to the runtime. Adding it explicitly to the runti=
me
> >> forces it into the SDK as well and fixes the above error.
> >
> > This can't be the correct fix. RDEPENDS is intended only for things
> > necessary at runtime that aren't discovered automatically (like for
> > example shared library dependencies are). SDK content is determined
> > via DEPENDS, particularly, by taking everything in it, and adding -dev
> > to it. You need to see why that doesn't work in this case.
> >
> > Alex
>
> Unfortunately, this is beyond my ability to fix. I can see that xcb-
> util-cursor is in the DEPENDS of weston, but xcb-util-cursor-dev does
> not make it into the core-image-weston SDK. I've done some grepping of
> the build folder with and without this patch and can find no clue.
>
> Note that xcb-util-cursor doesn't make it into core-image-weston image
> either. Perhaps adding this to RDEPENDS is necessary anyway? This is the
> error message reported:
>
> tests/meson.build:357:2: ERROR: Problem encountered: xcb and xcb-cursor
> required for running xwayland tests

Tests sometimes do require additional packages and at times
development headers and libs
on target for different reasons and these dependencies may not be
needed for normal
functioning of the package. I would suggest to add them into image as
rdeps (if they are needed)
conditional upon ptests being enabled.

>
> Tom
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#208990): https://lists.openembedded.org/g/openembedde=
d-core/message/208990
> Mute This Topic: https://lists.openembedded.org/mt/110206258/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

