Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 346A1E9A04A
	for <webhook@archiver.kernel.org>; Thu, 19 Feb 2026 13:54:45 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14144.1771509283932636904
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Feb 2026 05:54:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=NniaFRD4;
 spf=pass (domain: smile.fr, ip: 209.85.221.51, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-4362d4050c1so968390f8f.2
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Feb 2026 05:54:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1771509282; x=1772114082; darn=lists.openembedded.org;
        h=in-reply-to:references:subject:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hs4WJEjXyODPcLEujgMA6nLbOteQNCxREnwy2ydxRjQ=;
        b=NniaFRD4dEz60WWoxPcylBzqjpzbqXxbIoIbn2+IhUrJ6GkysPxT1EzptuygCworUQ
         /hVtOka2iKOKPaJrnKGSBtCuM5Ffl6OqmQh9+yPMN/ZJ7ubkaSnakWkj5NoUfddRW1A7
         yUbmJUdQV+Q+w2hQPceTH59Xi9DLKnG2HfezM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771509282; x=1772114082;
        h=in-reply-to:references:subject:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Hs4WJEjXyODPcLEujgMA6nLbOteQNCxREnwy2ydxRjQ=;
        b=wltj9j9blEOf5MaeTL/2lfHSMIlG8OOuylTu4qj3Aejf0lhatTipy0pFUETh7NlFXl
         A1ok/StFd0el+Er+1IEYC15lKIHjXNAztIJhdvTmXV3d6ZxKA420fQzqvhECCD66f6V7
         O6Hrx6OCHHkekRWhaf4R/PCpakV2vKI+Rx0+hRhVM/wMARMAnEtrDb5CyBp+Ub8LJwWo
         NWVEBlyk1YnmJLK9bfCWa3HgAfi8HobE9rtETnYc6l83Dszy6UE6oVdQJEbKlPA1D3rO
         4dD0jNUs7n6IllMbbQnPk5XAbXWFmbVTlBbrxwV7XDSoCwGaxXOifBxUA0GQ/pWXeoDS
         EtQA==
X-Forwarded-Encrypted: i=1; AJvYcCVigJpJQAUiuY/Ec4pNVM+So7r6/AXr+gnvY5PfYlslKsoihYZoF45rqJhbn57sKow5gp6M5JoSkmDq9n2CrZfA2A==@lists.openembedded.org
X-Gm-Message-State: AOJu0YypJJ2qT7pqjwTmhidZiv4RvH0inKb74yzHDwPDubt1brsMt5GL
	DlWB6p70PF4oL4YuGIZtGc050BHd9jT6YPhcmUaYFx/wU37qbZD8lIs4iTLFO65mHNk=
X-Gm-Gg: AZuq6aKmB1g1TwnGsBiGusqqNr4JIEcknTg8YLrFp5Q7mY2Z8zuJ6HIj9FquZ1tk4it
	d0e9go/wdNPk06KZcByC95J7nGDYXz0ocdVvLJ812PAKjbUA8iy9wrT5+ScNDdy9vxXtSzxMnNk
	0CJ3U7zvyYVoNHUlrgMg+tLfxdR7mFF+i44uC3f5LcVqNhc1xZNRMaXE5QvXAWl5YA/DFAKT3gO
	el/shRWeoYgRo+R61uGaSvwOd9zdi8f+ZiTfZ1AY4K7mpxUAvHmR9OwWjAL9qi3Uh9zhi7MaDfd
	gaNELg8rpyrVeBJppldQ0LKyCp05zX7pTBWI02FQYOI7PgVYNNv+7eXj0DcRMhwWBZEyheJ7sjO
	Xn/a3Bf8LFPZmWV0NBGqCYVgt8TcMq7HZP0grw0I9WEjrUK53oOjNjRK9dx8nddecyZOLozAv+d
	I2jb0qPLRPiOWC0KN3CLV3/MS1DNMTCx78DZsdgsBh2qMPqmlLCkJZ8zyLoy+qMBRUy0xrMv05Y
	E1qiUth0vDnBgY=
X-Received: by 2002:a05:6000:603:b0:432:84f9:8bea with SMTP id ffacd0b85a97d-4379791cfedmr38129869f8f.51.1771509281996;
        Thu, 19 Feb 2026 05:54:41 -0800 (PST)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796ac9d77sm44844502f8f.33.2026.02.19.05.54.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Feb 2026 05:54:41 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 19 Feb 2026 14:54:41 +0100
Message-Id: <DGIZMOWN2GMB.2LUW1QWT0MLRW@smile.fr>
From: "Yoann Congal" <yoann.congal@smile.fr>
To: "Marko, Peter" <Peter.Marko@siemens.com>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][scarthgap][PATCH] gnupg: upgrade 2.4.8 -> 2.4.9
X-Mailer: aerc 0.20.0
References: <20260110224453.395105-1-peter.marko@siemens.com>
 <DG63GSU9MVS3.304EAXA47JAF9@smile.fr>
 <AS1PR10MB5697F71F42D54E6DF1DBDA63FD6AA@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <AS1PR10MB5697F71F42D54E6DF1DBDA63FD6AA@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Feb 2026 13:54:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231426

On Wed Feb 18, 2026 at 10:28 PM CET, Peter Marko wrote:
>
>
>> -----Original Message-----
>> From: Yoann Congal <yoann.congal@smile.fr>
>> Sent: Wednesday, February 4, 2026 11:10
>> To: Marko, Peter (FT D EU SK BFS1) <Peter.Marko@siemens.com>;
>> openembedded-core@lists.openembedded.org
>> Subject: Re: [OE-core][scarthgap][PATCH] gnupg: upgrade 2.4.8 -> 2.4.9
>>=20
>> On Sat Jan 10, 2026 at 11:44 PM CET, Peter Marko via lists.openembedded.=
org
>> wrote:
>> > From: Peter Marko <peter.marko@siemens.com>
>> >
>> > Handles CVE-2025-68973.
>> >
>> > Refresh patches.
>> >
>> > Signed-off-by: Peter Marko <peter.marko@siemens.com>
>> > ---
>> >  meta/recipes-support/gnupg/gnupg/relocate.patch    | 14 +++++++------=
-
>> >  .../gnupg/{gnupg_2.4.8.bb =3D> gnupg_2.4.9.bb}       |  2 +-
>> >  2 files changed, 8 insertions(+), 8 deletions(-)
>> >  rename meta/recipes-support/gnupg/{gnupg_2.4.8.bb =3D> gnupg_2.4.9.bb=
}
>> (97%)
>>=20
>> Hello,
>>=20
>> I've tested that on autobuilder but got an error in oe-selftest-debian:
>> https://autobuilder.yoctoproject.org/valkyrie/?#/builders/35/builds/3138
>>   ERROR: autoconf-native-2.72e-r0 do_recipe_qa: GPG exited with code 2: =
gpg:
>> signing failed: Corrupted protection
>>   gpg: signing failed: Corrupted protection
>>   ERROR: patch-native-2.7.6-r0 do_recipe_qa: GPG exited with code 2: gpg=
:
>> signing failed: Corrupted protection
>>   gpg: signing failed: Corrupted protection
>>=20
>> I've started a build with this gnupg upgrade reverted to confirm that
>> this is indeed the cause:
>> https://autobuilder.yoctoproject.org/valkyrie/?#/builders/35/builds/3142
>>=20
>> Can you look at this?
>> Thanks!
>
> Unfortunately, I'm not able to reproduce this failure.
>
> On my Debian 11 I have:
> SANITY_TESTED_DISTROS =3D ""
> PACKAGE_CLASSES =3D "package_rpm"
> RPM_GPG_SIGN_CHUNK =3D "1"
> IMAGE_CLASSES +=3D 'testimage'
> And run:
> oe-selftest -r signing -j 16
> And get:
> oe-selftest - INFO - RESULTS - signing.LockedSignatures.test_locked_signa=
tures: PASSED (122.35s)
> oe-selftest - INFO - RESULTS - signing.Signing.test_signing_packages: PAS=
SED (155.34s)
> oe-selftest - INFO - RESULTS - signing.Signing.test_signing_sstate_archiv=
e: PASSED (121.11s)
> oe-selftest - INFO - oe-selftest - OK - All required tests passed (succes=
ses=3D3, skipped=3D0, failures=3D0, errors=3D0)

FYI, the failing build:
https://autobuilder.yoctoproject.org/valkyrie/?#/builders/35/builds/3138
... was on Debian 12
(It's the retry with this patch reverted that was on Debian 11)

Scarthgap has since been successfully retried on Debian 12 (without this
patch):
https://autobuilder.yoctoproject.org/valkyrie/?#/builders/35/builds/3226

Can you check this on Debian 12?

Thanks!

> So I guess I just backport the CVE fix instead of this upgrade.
>
> Peter
>
>>=20
>> Regards,
>>=20
>> --
>> Yoann Congal
>> Smile ECS


--=20
Yoann Congal
Smile ECS


