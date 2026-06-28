Return-Path: <jan.vermaete@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0986AC43458
	for <webhook@archiver.kernel.org>; Sun, 28 Jun 2026 11:38:47 +0000 (UTC)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16774.1782646716940118457
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Jun 2026 04:38:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=pUTAp2cI;
 spf=pass (domain: gmail.com, ip: 209.85.128.171, mailfrom: jan.vermaete@gmail.com)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-80cebd41372so6196327b3.3
        for <openembedded-core@lists.openembedded.org>; Sun, 28 Jun 2026 04:38:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782646716; cv=none;
        d=google.com; s=arc-20260327;
        b=WvnN4CFMovJjbyG1qz9wjH7EnvzmlRZfomZYzCMvOiYheHMF+pZ0levc2HhdFN0rL4
         rdj0hmIYkmcEF+Joy7P7WQF0YiAJ+iD35N0Bwe2CSaZly95TRqF7MVHpXAfWVvoyAsVT
         SXdTinoECf0W+0jNv9MC7denMeXKbWfDWT4CH9ldKjwLqfbTaM3L1xVQum/DZLQlO1Fu
         5l9GO3s5YkUBNYFcuhuHzqkeC2+E915OMCBRHO3f/Jshg+/RT88aodoZVab8psNFlr8b
         Cw10jmAdqWqxUO6AnMwnXMUUAOkQpUyeaSdA1LTCMzr+DR01iPc2aocsVXB9S/1FN+Q9
         rObw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7EiWwjDHmm3sBpSP7m5NaU0C09Bj4218gVmjqMxTtIo=;
        fh=x04p8img93tda512L7Uc/GJVxFSsE3/4wpZWux3OJi4=;
        b=pjlQNUQNx91J9DM9flS7ZVZVX9DdQosn5CBwf2SfnoV/GQ8ipl+3QZWUQ/HbaePAgp
         Cr7NT5qLo6Kj6fl1grgIWLo12/bQzRPSZgH5J/jy20c8v+HSIKkEp9VRhf3uN6uMU/CB
         hkp142ea5YZxAwJdDkns9UVmLGS65rpvRGsLRYeN8548RQpGFWYYni9jQtqB1SQi41iA
         M3ClQ+4YQ9rLQoqJOq9CRP/A9kY3Rmjm7S31tby2Yst3tdfdyVGQOq23+T5Cywa23uO/
         oAKAZCF3qm1uZynSU0tUKkz1irpxqgNObq9syPPhzf8LS7YBmgC74Wvaw/kM6/9daGhy
         8tVw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782646716; x=1783251516; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7EiWwjDHmm3sBpSP7m5NaU0C09Bj4218gVmjqMxTtIo=;
        b=pUTAp2cIEmOkmHWnoXlaUtsg8hnV/UGs6+Jz1KlEsj5Yu0XDydr/ysXvP7keMcDyVN
         hODKsjMSBPADZjUMwQNky+navYqP0PiaHW0wvGVYrqjVbBlhLIKcsNioppPidQeV+BZ6
         KuI1O+C0rFlLdZhHX31ww6rnsQGF0wUuHM3anpjv0E+WeDFpghvD98VQIq6k13Ik7/fd
         ZkiO3cjDwpeQ/OGu04S2ctnP6RsrDA1g2Nhc4484DmUyStIrjTarWZ1ILMx7+cS/OdvB
         QT/HDJEgZwU9HooAg7cfbtIwmS8kXtzXXikLdcfWAMDRmisQBapLZc7QFhLUeNJAvut9
         vnog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782646716; x=1783251516;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7EiWwjDHmm3sBpSP7m5NaU0C09Bj4218gVmjqMxTtIo=;
        b=XVUBAZvFkGpJkJ0XiDq/i6bdQz/Gh3c7Izsxa6pR+zHruilnezYTBEyPCBaoe2c1AG
         iqk1lNkBflZofGLLG21VOgQaMbenasUKYGAB/rHxXKZesqYiU8ot0j7PDfT/hVskq0JX
         DO0viSV2DQm5fbkdZsHKeWzJBIYkiEJTHj/Jzvh5u6jnraYgV4Kc5rBTLQ4hx4UkY4u7
         NjmXo3vv9x3WGmBwp0gUlo75o+8HmdZqFCjaiAqBGYkRnEp8WKLkeZSIW/FtirzxBCPc
         4nS5Ijaek4MfhPbUt8H9xXCBa2QHUn2exvecFzBwQO2bN5DBQmW8fCjplhqChq2Ntb3B
         8Tuw==
X-Gm-Message-State: AOJu0YykHoe5hUAOFu+8VWAr9VNF22LKlQasz8v/jnt2k31/4IYCLSuW
	AnvrJoIfKacmMpdk+sO2g34Pbaf3YjmRnG/gDjUlLarejYGbXTg7M3Nxo1PBB004gbMrBboYpW0
	2SGDD/5XN60GGySKDPaCuY8EyprRapKd2OtF2
X-Gm-Gg: AfdE7clXaLlM7QDK6rEUF2rhYTupbjOA3eG6VZJBYcwrznnJbDdhof1+OzSX3YGuG7l
	h0sm11psF1UL4rICAUeIpWgeIP0Ozqgd3Bju9Ujq36Hmfuz3A7Ii/lBYBrV16TGU423DOFdGLe2
	wNgN2ls3lqXjc4t/7XJZpMXoslhgDpdIORs80PsFrPvJ2xwk0VfmEEvuH97bbR8O7HwHCuY/lm4
	Eb0kdW4uVlH18Lmve4PuGR3RgL4L0I0yBgmIxUeCtWnE4DONiqsEQ5C5XfP8/DAiaQc9qZZziQ3
	XUuugSq21npz+cT8/41KlsTYAknjKtMZcAmt99qKd65RIPaa2DsM5fqmCxRSpA==
X-Received: by 2002:a05:690c:6887:b0:7ff:1a06:472 with SMTP id
 00721157ae682-80a67806545mr125451127b3.4.1782646715792; Sun, 28 Jun 2026
 04:38:35 -0700 (PDT)
MIME-Version: 1.0
References: <CABF_=yhLuHYF6MAW03=CbgUMFdBXaNBpQ=OEVe8d-bCimYv9eA@mail.gmail.com>
 <CANNYZj_=-X6Q_7r4qcSOT2f9f+pT=+E2TbHrpyM1Ksfv08neqA@mail.gmail.com>
In-Reply-To: <CANNYZj_=-X6Q_7r4qcSOT2f9f+pT=+E2TbHrpyM1Ksfv08neqA@mail.gmail.com>
From: jan vermaete <jan.vermaete@gmail.com>
Date: Sun, 28 Jun 2026 13:38:25 +0200
X-Gm-Features: AVVi8CdkmOkmyBwTORmCyXmy6VKyq6OH8bj6ntop0mrKXBh2eULSjE_JggpLt6w
Message-ID: <CABF_=ygeFfSHEEk3SXZqh63cPLHEtVkZj6MRz=hUviQWGs6dOA@mail.gmail.com>
Subject: Re: [OE-core] -native: which tests should be done
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 28 Jun 2026 11:38:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239712

Hi Alexander,

The recipe is in meta-python, not openembedded-core.  Sorry for
sending to the wrong mailinglist.

Does it make a difference between openembedded-core and
meta-openembedded/meta-python.

The  recipe that requests the -native version of python3-unidiff is in meta=
-ros.
Is this enough to consider it as 'general'?

Br and thanks for the fast answer.

On Sun, Jun 28, 2026 at 1:34=E2=80=AFPM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> Maybe just tweaking BBCLASSEXTEND in a private .bbappend is fine? Any pat=
ch to oe-core needs a general use case, before considering tests.
>
> Alex
>
> On Sun 28. Jun 2026 at 14.07, Jan Vermaete via lists.openembedded.org <ja=
n.vermaete=3Dgmail.com@lists.openembedded.org> wrote:
>>
>> Question:
>> I need the python3-unidiff in the -native format.
>> And the -native is missing at the moment.
>>
>> Which tests should I do before submitting the patch to add BBCLASSEXTEND=
?
>> Is loading the python package in qemu enough?
>> Or is there a kind of ptest for -native?
>>
>> br
>> --
>> Jan Vermaete
>> =E2=80=9CSuccess is a self-correcting phenomenom.=E2=80=9D -- Gary Hamel
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#239710): https://lists.openembedded.org/g/openembedd=
ed-core/message/239710
>> Mute This Topic: https://lists.openembedded.org/mt/120014516/1686489
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [a=
lex.kanavin@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>


--=20
Jan Vermaete
=E2=80=9CSuccess is a self-correcting phenomenom.=E2=80=9D -- Gary Hamel

