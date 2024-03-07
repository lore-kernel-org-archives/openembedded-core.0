Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7A62C48BF6
	for <webhook@archiver.kernel.org>; Thu,  7 Mar 2024 15:21:30 +0000 (UTC)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
 by mx.groups.io with SMTP id smtpd.web11.25852.1709824884294703308
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Mar 2024 07:21:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=giIK4gyk;
 spf=softfail (domain: sakoman.com, ip: 209.85.128.181, mailfrom: steve@sakoman.com)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-609eb2cbeccso9694067b3.2
        for <openembedded-core@lists.openembedded.org>; Thu, 07 Mar 2024 07:21:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1709824883; x=1710429683; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vZfcTN0ozWEXODE3ZVu+c+Tt0/ARo3rteKNwV9FV7qE=;
        b=giIK4gykk/p20qZPlQmCZ9pdY1YPLG5saH5CRwFKFXAr3uOZuqWMwnrdmHZ60gsZCi
         z4aA2lwAeNB3HUazxGbSgbAgyWKs0hAvekwi84EseHzUKrPSNNPjDsiOeu4iGy2iHsgB
         JFCXAHBrcGfnCjQ7bj5GbPh6U24YLTy001vhpnNIRU6AKOUj5/xqjD5k49Jyb87fZkD6
         Ah6Ne40X4lSG70s+iM1YCXtNZk9ViIm5v4cJCAFRypCZQS8HzqQwHnnmJpbAm/M/V3d7
         VduhkTjBg5qh7Q3KN9rb2QczBKYFakNGmTSSkBCVkjA2jgsLUOXBhW2eM2H0YKFxV/Dk
         fZMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709824883; x=1710429683;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vZfcTN0ozWEXODE3ZVu+c+Tt0/ARo3rteKNwV9FV7qE=;
        b=Bb54ZU0X6x3/yi4ApgpOBw6fFXv8klgXdDYEoAJVutxQsbsGAcTcG6aoEkwvZR0kUy
         LNIBz92zioUF34hM5eH1CVmFMPajfQWVDu45c3XeZIneteSn9sQmtDFa5SYkfr8kQ7RE
         1VAS1v6jZKRb6IevC1oPU03gXLwCKNBKjPXnXyiPOFIZhfCMNtaSj6vJGFDEggbSAoYy
         2A0y9YxpBW5ivsIUShWBYE9Mz4+BS4l5GuRnIk/DHiT9IND5dMGYqfu2OKJZnKaVNGuQ
         5RRxvxgmVDzsor3z7KT9znOcsvOsrQayBon29ZIncKJk0nGBZB1A5cNGgo/e/GEACRYg
         kk9A==
X-Gm-Message-State: AOJu0YxOvxAZgNqJG2hVHjH0UXD0u3TANtqIisnEHm9LX1xkFD52uGnv
	u73DEVkIfj3+15ITMlEctEi9QfCuzTGHyDp6tk4OWa/UWsLt6zloo3Y+xofnZER11IGdeOYCeWM
	B+z5abcRBa56wNpW+Ymv3MxHaDVdez+ibnhPcO75ioQ3EcHmDtUQ=
X-Google-Smtp-Source: AGHT+IH9hskWgnd3vs6dCQOxLFSycceU4ZeNm17UTTXpdv0NKTo6H87JHAIJm7z02fw9Qs5a5Q6q4tGAF5K06Lmh268=
X-Received: by 2002:a25:b47:0:b0:dc3:696f:167e with SMTP id
 68-20020a250b47000000b00dc3696f167emr14652648ybl.64.1709824883293; Thu, 07
 Mar 2024 07:21:23 -0800 (PST)
MIME-Version: 1.0
References: <20240208064030.118190-1-vanusuri@mvista.com> <CAOSpxdYeRmheWtPVkTHXO=8EOorxG+2p8nFkEOa5oK6FTf-Zpg@mail.gmail.com>
 <CANQUz1_eEm4sci6C0n27zn=CuuMLX4QjP+1Cp3LUMAM4F33BZQ@mail.gmail.com>
In-Reply-To: <CANQUz1_eEm4sci6C0n27zn=CuuMLX4QjP+1Cp3LUMAM4F33BZQ@mail.gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Thu, 7 Mar 2024 05:21:12 -1000
Message-ID: <CAOSpxdYgOuo8qzV1CePPy1XOb_GyDqj5v+pFWNugQyZ=WfgBcw@mail.gmail.com>
Subject: Re: [OE-core][kirkstone][PATCH] ghostscript: ignore CVE-2020-36773
To: Vijay Anusuri <vanusuri@mvista.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Mar 2024 15:21:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196798

On Sun, Mar 3, 2024 at 3:50=E2=80=AFPM Vijay Anusuri <vanusuri@mvista.com> =
wrote:
>
> Hi Steve,
>
> I've sent mail to cpe_dictionary@nist.gov to update the information.
>
> Now it was updated in https://nvd.nist.gov/vuln/detail/CVE-2020-36773

Thanks!

Steve

> On Thu, Feb 8, 2024 at 8:40=E2=80=AFPM Steve Sakoman <steve@sakoman.com> =
wrote:
>>
>> On Wed, Feb 7, 2024 at 8:42=E2=80=AFPM Vijay Anusuri via
>> lists.openembedded.org <vanusuri=3Dmvista.com@lists.openembedded.org>
>> wrote:
>> >
>> > From: Vijay Anusuri <vanusuri@mvista.com>
>> >
>> > Artifex Ghostscript before 9.53.0 has an out-of-bounds write and use-a=
fter-free in devices/vector/gdevtxtw.c (for txtwrite) because a single char=
acter code in a PDF document can map to more than one Unicode code point (e=
.g., for a ligature).
>> >
>> > Reference: https://ubuntu.com/security/CVE-2020-36773
>> >
>> > Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
>> > ---
>> >  meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb | 4 ++++
>> >  1 file changed, 4 insertions(+)
>> >
>> > diff --git a/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb b=
/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb
>> > index e0d1e4618f..cc06d092c1 100644
>> > --- a/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb
>> > +++ b/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb
>> > @@ -26,6 +26,10 @@ CVE_CHECK_IGNORE +=3D "CVE-2013-6629"
>> >  # Issue in the GhostPCL. GhostPCL not part of this GhostScript recipe=
.
>> >  CVE_CHECK_IGNORE +=3D "CVE-2023-38560"
>> >
>> > +# This CVE affects Ghostscript before 9.53.0
>> > +# https://ubuntu.com/security/CVE-2020-36773
>> > +CVE_CHECK_IGNORE +=3D "CVE-2020-36773"
>>
>> When there is an error in the upstream database it is preferred that
>> you send an email to cpe_dictionary@nist.gov requesting an update
>> (giving links that justify the change to make it easy for them to
>> research)
>>
>> They are usually quite responsive, and this is much preferred to
>> carrying an IGNORE in our metadata.
>>
>> Thanks!
>>
>> Steve
>>
>> > +
>> >  def gs_verdir(v):
>> >      return "".join(v.split("."))
>> >
>> > --
>> > 2.25.1
>> >
>> >
>> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> > Links: You receive all messages sent to this group.
>> > View/Reply Online (#195101): https://lists.openembedded.org/g/openembe=
dded-core/message/195101
>> > Mute This Topic: https://lists.openembedded.org/mt/104234914/3620601
>> > Group Owner: openembedded-core+owner@lists.openembedded.org
>> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub =
[steve@sakoman.com]
>> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> >

