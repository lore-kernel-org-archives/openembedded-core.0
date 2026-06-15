Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57430CD98CF
	for <webhook@archiver.kernel.org>; Mon, 15 Jun 2026 14:56:57 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.131670.1781535416668524473
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jun 2026 07:56:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=ndbBdCoq;
 spf=pass (domain: smile.fr, ip: 209.85.128.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-490b8ac62baso33868255e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Jun 2026 07:56:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1781535415; x=1782140215; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gsprOZZPDenDpB3deN6TiF7NpNKDf/O8dSM9XMzk3h4=;
        b=ndbBdCoqj5fvELWcq+XY6DmCoMbrZ5O90B8+doP3cJJvdQnTJMBj8SzzYFtwefmkZZ
         TVEn464lM7XSvuHbMThchkpM6vg/ynTq+Ud2EN8+9aeR7jTgM5NqfvXcpQnwyGhrty2i
         +w1MwZOUPYuREvW2RGFUZka4u6vwXsZm4stWk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781535415; x=1782140215;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gsprOZZPDenDpB3deN6TiF7NpNKDf/O8dSM9XMzk3h4=;
        b=Di5c+ThgN+GqrMIeJ8UJ69beBOfOtRqwV0yJerTFTcS2Y/6LVokr+ntLNvM99zR/pk
         BjkUWskQMvjJ/XoK7n+sKl7yEjvettN0g80J2AuHfjt/QXLc5JV7w415yAa9O8mh3FBO
         Au7C7znWVQhD+xC2L7W+qAmcG7DDdDhmk4bfciKiaAcDaoftwCfP0HtQAo8EeDhWTgcL
         3GH/RLizXIJFUav7gs1BZ6cgaRg9TYnP546HgLfgRbtLZrkUUhz2/Rm7NjEZKqI+qcRE
         AB5u2Ebodqxy9iNwoSwLAdSh8C5Z+VR7QoF4YzvHBYAqPzM1hmna11yG0MqVUu19lc8R
         SVdw==
X-Forwarded-Encrypted: i=1; AFNElJ/hIqrZ1yILNxTTW3DNWDfUOTCzrLOZOAtCX2NWIh+Uv1JSjpZQeUz7I7DAo4nlG5v7/tqq+wt3B8NJ5QwafGj5pQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwnXPt3mRzGc+5Bdq20N0Ljz6LYb1CstPjTlbvgCXeqx/L/Kz34
	J4HofBuRdkG0NqaDR4ZWzyvdm4olCfQeu9yp3Rl6tmGeEm47lMAOUiJDrcXvsDPZN8I=
X-Gm-Gg: Acq92OHAfU0ONxwGMpJvbXcvIEQJ2iLC+T2RtqX7GaZUs0J8IM9RtScKrJ9vV6YLKFR
	Mgi3WFFRwWur0UQ2F6OKY8D54K2z+6vkcVLR+nNKMSbeF2a0lDPdsL65289xk2kee8KduG20hnD
	jRvc2kJ4xDRx0ENEVCyOgXdR5Yi5sqoBjhAZQBvMaGfGBw4LPX9uYcMamnya5xAgd7+g7d1k70b
	f4Ml8R5YxAUNZd15xdy7lyCDQA/jkOKEd07vsx9IWFXYrXl3LZJlHycXQNdJI9431oJAzPKC5GM
	XSTpTVXbzMmyz/owIf5NUSIiwgX0rSe7pnY0OMlYRxKV4THeR8UCq6uix/yBT3iWbgNh5ss3gIb
	UkXnHfU6nCka+VOmVoBN6nBT/cuPJya/5UPR4xhJDzDMbsIh/nv2sYhoQZNWh6Of66Jj1G8Fh6s
	AkwEVdVbqPT3sxQ198M3887USexbOpoHcdYxxsOJP34iRLbADzsHgmOwgRpp1pRAuQrW8XNdPSm
	5dV+WyCCyIW/1G2FyMYVvVn1A==
X-Received: by 2002:a05:600c:1d89:b0:490:ad1e:1846 with SMTP id 5b1f17b1804b1-490ec4d786emr152931035e9.9.1781535414790;
        Mon, 15 Jun 2026 07:56:54 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4922034c1cbsm215413155e9.10.2026.06.15.07.56.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jun 2026 07:56:54 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 15 Jun 2026 16:56:53 +0200
Message-Id: <DJ9PLINYS56D.SN9IE3Q5O3B2@smile.fr>
Subject: Re: [OE-core][scarthgap][PATCH] gnupg: upgrade 2.4.8 -> 2.4.9
From: "Yoann Congal" <yoann.congal@smile.fr>
To: "Marko, Peter" <Peter.Marko@siemens.com>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260110224453.395105-1-peter.marko@siemens.com>
 <DG63GSU9MVS3.304EAXA47JAF9@smile.fr>
 <AS1PR10MB5697F71F42D54E6DF1DBDA63FD6AA@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM> <DGIZMOWN2GMB.2LUW1QWT0MLRW@smile.fr> <AS1PR10MB569707821CD8C3C3AA8DC9D8FD76A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <AS1PR10MB569707821CD8C3C3AA8DC9D8FD76A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jun 2026 14:56:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238855

On Sun Feb 22, 2026 at 9:53 PM CET, Peter Marko wrote:
>
>
>> -----Original Message-----
>> From: Yoann Congal <yoann.congal@smile.fr>
>> Sent: Thursday, February 19, 2026 14:55
>> To: Marko, Peter (FT D EU SK BFS1) <Peter.Marko@siemens.com>;
>> openembedded-core@lists.openembedded.org
>> Subject: Re: [OE-core][scarthgap][PATCH] gnupg: upgrade 2.4.8 -> 2.4.9
>>=20
>> On Wed Feb 18, 2026 at 10:28 PM CET, Peter Marko wrote:
>> >
>> >
>> >> -----Original Message-----
>> >> From: Yoann Congal <yoann.congal@smile.fr>
>> >> Sent: Wednesday, February 4, 2026 11:10
>> >> To: Marko, Peter (FT D EU SK BFS1) <Peter.Marko@siemens.com>;
>> >> openembedded-core@lists.openembedded.org
>> >> Subject: Re: [OE-core][scarthgap][PATCH] gnupg: upgrade 2.4.8 -> 2.4.=
9
>> >>
>> >> On Sat Jan 10, 2026 at 11:44 PM CET, Peter Marko via
>> lists.openembedded.org
>> >> wrote:
>> >> > From: Peter Marko <peter.marko@siemens.com>
>> >> >
>> >> > Handles CVE-2025-68973.
>> >> >
>> >> > Refresh patches.
>> >> >
>> >> > Signed-off-by: Peter Marko <peter.marko@siemens.com>
>> >> > ---
>> >> >  meta/recipes-support/gnupg/gnupg/relocate.patch    | 14 +++++++---=
----
>> >> >  .../gnupg/{gnupg_2.4.8.bb =3D> gnupg_2.4.9.bb}       |  2 +-
>> >> >  2 files changed, 8 insertions(+), 8 deletions(-)
>> >> >  rename meta/recipes-support/gnupg/{gnupg_2.4.8.bb =3D> gnupg_2.4.9=
.bb}
>> >> (97%)
>> >>
>> >> Hello,
>> >>
>> >> I've tested that on autobuilder but got an error in oe-selftest-debia=
n:
>> >> https://autobuilder.yoctoproject.org/valkyrie/?#/builders/35/builds/3=
138
>> >>   ERROR: autoconf-native-2.72e-r0 do_recipe_qa: GPG exited with code =
2:
>> gpg:
>> >> signing failed: Corrupted protection
>> >>   gpg: signing failed: Corrupted protection
>> >>   ERROR: patch-native-2.7.6-r0 do_recipe_qa: GPG exited with code 2: =
gpg:
>> >> signing failed: Corrupted protection
>> >>   gpg: signing failed: Corrupted protection
>> >>
>> >> I've started a build with this gnupg upgrade reverted to confirm that
>> >> this is indeed the cause:
>> >> https://autobuilder.yoctoproject.org/valkyrie/?#/builders/35/builds/3=
142
>> >>
>> >> Can you look at this?
>> >> Thanks!
>> >
>> > Unfortunately, I'm not able to reproduce this failure.
>> >
>> > On my Debian 11 I have:
>> > SANITY_TESTED_DISTROS =3D ""
>> > PACKAGE_CLASSES =3D "package_rpm"
>> > RPM_GPG_SIGN_CHUNK =3D "1"
>> > IMAGE_CLASSES +=3D 'testimage'
>> > And run:
>> > oe-selftest -r signing -j 16
>> > And get:
>> > oe-selftest - INFO - RESULTS -
>> signing.LockedSignatures.test_locked_signatures: PASSED (122.35s)
>> > oe-selftest - INFO - RESULTS - signing.Signing.test_signing_packages:
>> PASSED (155.34s)
>> > oe-selftest - INFO - RESULTS - signing.Signing.test_signing_sstate_arc=
hive:
>> PASSED (121.11s)
>> > oe-selftest - INFO - oe-selftest - OK - All required tests passed (suc=
cesses=3D3,
>> skipped=3D0, failures=3D0, errors=3D0)
>>=20
>> FYI, the failing build:
>> https://autobuilder.yoctoproject.org/valkyrie/?#/builders/35/builds/3138
>> ... was on Debian 12
>> (It's the retry with this patch reverted that was on Debian 11)
>>=20
>> Scarthgap has since been successfully retried on Debian 12 (without this
>> patch):
>> https://autobuilder.yoctoproject.org/valkyrie/?#/builders/35/builds/3226
>>=20
>> Can you check this on Debian 12?
>
> I have retested with Debian 12 and 13 and the tests were green.
> I guess I'm missing some configuration from AB so I have no clue how to f=
ix it...
> So again, I'm just going to backport the CVE patch for now instead of upg=
rade...

I've now taken this very same upgrade but that time it has gone through
AB without errors.

Sorry I did not take yours.

>
> Peter
>
>>=20
>> Thanks!
>>=20
>> > So I guess I just backport the CVE fix instead of this upgrade.
>> >
>> > Peter
>> >
>> >>
>> >> Regards,
>> >>
>> >> --
>> >> Yoann Congal
>> >> Smile ECS
>>=20
>>=20
>> --
>> Yoann Congal
>> Smile ECS


--=20
Yoann Congal
Smile ECS


