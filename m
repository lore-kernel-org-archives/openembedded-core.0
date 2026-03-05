Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66AD4F33A72
	for <webhook@archiver.kernel.org>; Thu,  5 Mar 2026 14:26:54 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.45330.1772720805278663488
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Mar 2026 06:26:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NGNHB1XW;
 spf=pass (domain: gmail.com, ip: 209.85.167.45, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5a12cd0bd79so1104339e87.2
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Mar 2026 06:26:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772720803; cv=none;
        d=google.com; s=arc-20240605;
        b=jd3WLJ6JB6wfs7uIwnJe3zSByRRoW8qbWID81RRwzVaGXbfdjMhTMyBBVw36c3eKmQ
         /lqqpVZKlvjN4nsh/qcjY1m7xTAoqHAheNGc2lFi+3V/ge3Mr0L7gqM0HJHehlHNN9tl
         5G+aao7RdHJoekITNzQWwIvHaEulDnx6Gj3hUjGox0uWW24rSw0pyU74CJVWKC4pV60s
         Qi1e6YViaPeqh7otDf19MPnYnUWYvOmrQP3tVm4gDZjX1dQVkwU6X281828tW7pSLQFC
         6ZIiW7H0wRkXcjvOTXEhL+bRGbRffqeCawDZvKmyxrgx30hM8vsoxXMzTIjBq5RltcJ+
         diBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+EH5WudM3GqKGKpI7EIDJCF22lDFL8GD0oa4N2jeY+8=;
        fh=TGF7TVa5Eshw5M6K2XLmjdIMKFhrsPaliuC+tv7wzuY=;
        b=UnSwT+nwW14UdJ8LnpUZ2amRzoJQ/4bWTj6LSOXD4XGKdE00ZHwspABxZXluxQVnhN
         4Owx4BZCRQ/ZiGzLBymZQ4Ih0vqExqb4mo/osewJNL//OMG1fe5BSCnggzHhJ9rrf2+J
         MJV1RLl8lFj03yV5jaW3wz6d7tRUZh/NKoeH6B19IRNOuvSt2iSdm1sxpqIt9mG9Ycv3
         SiGDOWXLw+DVq+x24T9dhues6Iqp8CwJFXkeyu637vj4cFrUuMoBQMfHLTdvV2C4oiru
         BDNKp9nAVYyfrVBIS8MgG2iFTrsxSJQdYRQFhqQLNZ1X0VC/C2UnuMXnLgxI86SWUiIl
         V58A==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772720803; x=1773325603; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+EH5WudM3GqKGKpI7EIDJCF22lDFL8GD0oa4N2jeY+8=;
        b=NGNHB1XWhry1m8Yqpbu2FMh8Ti6JLkTwnJhHWmlWT0BjeR7+oDn1tyyzAcCmuFKb0w
         YRb4Hf+wvQTykZ7qGDGXDxtqQ5bKSaHrDdXcoiZp5HJouJVKe6ZlejmvuKOc3Yp4Lhf0
         0mLYLuILru9SlOeGoiJ31mmqttqWVlSujyrLO3wIAVTQ42j9Qf1a19l9owA/6weJ2Vet
         bYYizZ6Rza2vbYKkaoju12GLypcnxus30XN23rbQHehtRMCqY7FvvlM7TvLymEAhrAD0
         ESi/a3la1EoAjyQOo3jH0m2RAyqQOJ5KtSqYnNwHSf6qRl7rifJw1OrTp0U9RD21ClaB
         Dr7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772720803; x=1773325603;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+EH5WudM3GqKGKpI7EIDJCF22lDFL8GD0oa4N2jeY+8=;
        b=ut2d4hdclZ1E13oEUf20PM/vEtBMi8kmzVE8FoSqYbocc0F1q5kQGEZpba+AQJYHlu
         JXSN2N3Nz/UDTL5N3VnW7UOD1iuMnl2Gcr98HOwcZ5Pcu6y/hd1tbfomxBpMkr19ymz5
         0QnGvmZwtkDaOGpWjfxJbtIYeSTcIuRWVD/9cEkqudGBD+JBmSijFjrzcgnEz6nFthRZ
         UX71fQhs4p4VDNhKDTn5WEk8RIF9Pcke/fashqxcPSSfaD4EnJdYnVu/n4elHeMkJ8jP
         tnOFA5/5qCJlpNYX4cKkO0axd09+9Vog+f0A6jrhGjYhsL8jzhBgftPn35J30bu7Zqa8
         j7iA==
X-Gm-Message-State: AOJu0YwtgJB1XMUv73Gf1N+eWQtqA5yd+oj/AcF+OtjoidZ8m5O2pL0p
	ofZtvyqhS4uDrFE3COvQbfJkJyTVVHANbB8RXnKM5GFai1sWIoP7Av75X+YE4khyJcQVxY/4/91
	TgAUHna7kH6uMkFDUks7k+KqSocit+Tc=
X-Gm-Gg: ATEYQzwS70Zcojyq6MEtc/1H/eoiwO8QGtx7fSnE6oJiJGkQqF0BCCpZxHBJfV7P1gr
	twE8Ske2RFruJ2RLEoL4MEMA+2R5w1RMvt/jj2PG4h+ENNB5xgl6k8CxSnTY8crGWbRAGT7RHdp
	0mzPSPBA/kh+CeUFnt2f+4NErcpZhUILqa2xSCSTziwBmvxAQYIMf9sNCVqzcsOeLJhnhecah4L
	2/sHjVe9RaKVonptEQdrR8d5vZ4r9nux01K2coDOQQTa0/J3bY4SZaXQMH+4nmqu2/Iez8FVQxe
	7JCdnwmqTR/2Bv6SGZyX
X-Received: by 2002:a05:6512:31c1:b0:5a1:3591:d612 with SMTP id
 2adb3069b0e04-5a13591d7c1mr503017e87.10.1772720803066; Thu, 05 Mar 2026
 06:26:43 -0800 (PST)
MIME-Version: 1.0
References: <20260303234247.8034-1-martin.jansa@gmail.com> <DGUT04JKG45O.52KWQ22NS2A1@bootlin.com>
In-Reply-To: <DGUT04JKG45O.52KWQ22NS2A1@bootlin.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 5 Mar 2026 15:26:29 +0100
X-Gm-Features: AaiRm521Mwaqv6lBBh4_cCd-xrQ_fGjXZiD-PCUxfeftxbeo5Rbwtjg3vihxSxY
Message-ID: <CA+chaQf3riGkKhuoj1iyB-fmzQMP4yPUx2M_1yLipTrkUjEz=g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] license_image.bbclass: report all packages with
 incompatible license
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Mar 2026 14:26:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232492

On Thu, Mar 5, 2026 at 12:15=E2=80=AFPM Mathieu Dubois-Briand
<mathieu.dubois-briand@bootlin.com> wrote:
>
> On Wed Mar 4, 2026 at 12:42 AM CET, Martin Jansa via lists.openembedded.o=
rg wrote:
> > From: Martin Jansa <martin.jansa@gmail.com>
> >
> > When multiple packages cannot be installed it shows only first one it
> > finds, because of bb.fatal use. It might require many iterations to fin=
d
> > all packages to avoid.
> >
> > e.g. with ptest enabled and GPL-3.0-or-later, GPL-3.0-only set as
> > incompatible licenses you might get list like this for relatively small
> > image:
> >
> > Some packages cannot be installed into the image because they have inco=
mpatible licenses: bzip2-ptest (GPL-3.0-or-later), coreutils (GPL-3.0-or-la=
ter), coreutils-stdbuf (GPL-3.0-or-later), diffutils (GPL-3.0-or-later), fi=
ndutils (GPL-3.0-or-later), gawk (GPL-3.0-or-later), gnutls-openssl (GPL-3.=
0-or-later), gnutls-ptest (GPL-3.0-or-later), grep (GPL-3.0-only), make (GP=
L-3.0-only), mpfr (LGPL-3.0-or-later), python3-dbusmock (GPL-3.0-only), rea=
dline (GPL-3.0-or-later), sed (GPL-3.0-or-later)
> >
> > Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
> > ---
>
> Hi Martin,
>
> Thanks for your patch.
>
> I believe this is making some selftests fail:
>
> 2026-03-05 09:01:35,428 - oe-selftest - INFO - incompatible_lic.Incompati=
bleLicensePerImageTests.test_bash_and_license (subunit.RemotedTestCase)
> 2026-03-05 09:01:35,429 - oe-selftest - INFO -  ... FAIL
> ...
> ERROR: core-image-minimal-1.0-r0 do_rootfs: QA Issue: The license listed =
SomeLicense was not in the licenses collected for recipe bash [license-file=
-missing]
> ERROR: core-image-minimal-1.0-r0 do_rootfs: Some packages cannot be insta=
lled into the image because they have incompatible licenses: bash (GPL-3.0-=
or-later)
> ...
> 2026-03-05 09:02:33,821 - oe-selftest - INFO - incompatible_lic.Incompati=
bleLicensePerImageTests.test_bash_default (subunit.RemotedTestCase)
> 2026-03-05 09:02:33,821 - oe-selftest - INFO -  ... FAIL
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/3225
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/3336
>
> Can you have a look at these?

Sure, will have a look. Needs the update for expected error_msg in
meta/lib/oeqa/selftest/cases/incompatible_lic.py. Will send v3 soon
(running selftest to confirm it works), please ignore v2 I've sent
earlier which just updates the formatting based on Peter's suggestion.

Regards,

