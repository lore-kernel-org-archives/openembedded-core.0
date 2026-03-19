Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A4211091929
	for <webhook@archiver.kernel.org>; Thu, 19 Mar 2026 21:55:19 +0000 (UTC)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7399.1773957317650998799
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Mar 2026 14:55:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FZiAjVU8;
 spf=pass (domain: gmail.com, ip: 209.85.128.182, mailfrom: jpewhacker@gmail.com)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-79628fb5c05so10767847b3.2
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 14:55:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773957317; cv=none;
        d=google.com; s=arc-20240605;
        b=ahwsPZ51hoMBxAYhpQwLSk28j+7VSZ3FvL30WOqn3EU3CmUKNcJf/Iigmv9Z3oOYs6
         PO4B+ypJrc+bEDwGkys2g/vzaqIpPnZArOUZkDNFcC6nLCs93d6K9tabqR6vZUuOXuZC
         sb/0tbyW3FjtsPJRfx/1Qs7svfJRsulIdDVsv1BmA8o2eM1CUjr3ZzoBA//vloPuWFja
         P1x13Q3O3v+0HCPku/lFVz2xmcyBfx2HqLQxzY7MTEQKhiiK0xsLoPv/fNJH1AEetLR/
         S4xHlGCN9T69GViaO0V6CUsomDhorlJqT0ur2w8uJS5Ahlx152JmPcWwIDQdYpLoVs/u
         PMBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LPhJoQrAMzHv2eSjgvbMkUegY2l42LtA+LwjTJbwXes=;
        fh=Tyc0Jk2T+8fGWDixU3qFe8BDCZOG+4XtkeWc0U40ryA=;
        b=bRb4LX8IeDwJKunoJVmqOuu1Q41X7Y5eQ882ubWXCN26zZNDNmbNB5i5z2Cs6GJVP5
         +1BzUaGDppJOIyUIEoD2+877aKMt6RWyFNHwr8k13GE3PBnyrROe5zJYRhckBu+xCsP9
         2ePa0neqrJK21wK6ZshTQBWDbaNA/Ggx0vsV0leMDp9BnklWC9kD4PgnS8jCiXUOzoN9
         bPfVu4oKZZTOWPiwI2LdaxCA/UO/8kxxOUkNPAXEe/JE++crxSFLgk0WUIMU1XvVI0d0
         ltR2WWoni9a0AUYuIcQ7NaYG1wKTUPE/kWfQ8WKwv9Dx/s5At4uGD69Qz6pQjdJy9Eq9
         n4Vg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773957317; x=1774562117; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LPhJoQrAMzHv2eSjgvbMkUegY2l42LtA+LwjTJbwXes=;
        b=FZiAjVU8hfQdWhNV8Qm92HD9krr2S2obiQk+UdEwgTmBumxIpVc/goN8pOQ8f7movD
         HsXH+EQ62od42voghYWAW9qfXsEtSB0MOwI0VZITLZWqf1BxyMXGnxtrpkvLn+caxjF7
         lbt2WhbwGbOrqQBQSEFG2eZeOeupU3Sve12Fn00qegGfj+Nt66JFKylUFfKQ32xrnFhW
         8wb1tIrqifi9uzSz3FD1tVkgxNpcQAkyLoVwB23V85jBHp+pHINtzHpUqWtz5xwuLR4A
         DilSxS/izgPLsnyuAlluHhHaJXgSECGA9FxUMtTfo0FVvISDzwUPMzHuwm1cDamurZIc
         02Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773957317; x=1774562117;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LPhJoQrAMzHv2eSjgvbMkUegY2l42LtA+LwjTJbwXes=;
        b=Ktd5oECbO01OrClzlxqE7sM3g8tLd30TBj0U33Z1K1eRavqZ6ysuJ6DbcKEegXwnDs
         VYUNm6Yj4armvyqZywjcp8aD10zoApfNi2iMT/hhup1UztMrKNNPapMSIl1by4jsvYrS
         RHTXcYaBUN0lU+vX+t9MUV/3U0uoqVlFMNwvZ4zCZDAJ7Hcg9mr9Nafj/L7iNWJDJNZx
         DlC+HRZopKi+Me9Q1QLi/NfXqDivkxsoufsSXWZC/OPZ16xZ+304NZxbBlPr78MrZNM6
         BrY2YQKk3q8l5Be8DYmM2EEs35Zg5hdAyp3Z42PBShnZk+VxGKd9RxdXH3aEyXw36Yn8
         wmTA==
X-Gm-Message-State: AOJu0Yxl1w+TAN6QSypxmcvG1l9y0qKaUGOUjV+Jpyeo3U1KSczNdOOr
	OQ1QswXfZz2fPFSRNaGX5q3jsprheT8xq8TX0dbPnOtNmUcnapBiZlQiCa/IIzv4bry5R3ct9Xt
	rqKTZCP9ceLA+X+I3ouKYTR+T1EU/6nM=
X-Gm-Gg: ATEYQzwjo2NbSGvj480QcvTsNkxAT4rnV5Chky9AZun3l28VYWuptFNU72x6gm1UU4E
	QV9FQfkzQ900tEpe/60Cfkly6rNCZySs7ICuYiX/46sQ47e9N7bRzfxqKjDqZJT+ooJlBlOcEqg
	IyZtHTR0QvS6nEvWjIhUUrHSIGoQnLtE4b1Yi6sbDyeZrlfZBwv60lWXpy+mtb2u0DvV0xOFZUg
	Stm+yGTxu7cSNmOGk1zptFjXbKE4FFTsWP1t0RibJRqLoDGGNPf1fnd9fUwF1/+jzqnP+/nhwFU
	p/xaO3u7tbg0gSC+uFs35Gf/wQweLsdV
X-Received: by 2002:a05:690c:8:b0:79a:9308:9583 with SMTP id
 00721157ae682-79a93089b89mr1829417b3.47.1773957316479; Thu, 19 Mar 2026
 14:55:16 -0700 (PDT)
MIME-Version: 1.0
References: <20260310184058.533343-1-JPEWhacker@gmail.com> <20260318134655.953233-1-JPEWhacker@gmail.com>
 <CAJdd5GZUvWKb37Ys-dNjOShHYb0Gis9wU3Q2WkdA2_m6xoLdhQ@mail.gmail.com> <DH6KHVSGCDH0.DZ1GQQ228GWT@bootlin.com>
In-Reply-To: <DH6KHVSGCDH0.DZ1GQQ228GWT@bootlin.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Thu, 19 Mar 2026 15:55:04 -0600
X-Gm-Features: AaiRm50TIEZbOOpeWXFlUv_ENi6WAnY7BRPl0lgrO1t8K34gpapxvl8LmJ4g3oY
Message-ID: <CAJdd5GZ9HXHoZkz4xX64O9e3CzSWAiPHQ5BGgW6K401Jji--AQ@mail.gmail.com>
Subject: Re: [OE-core][PATCH v7 00/12] Add SPDX 3 Recipe Information
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 21:55:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233554

Richard,

These errors are caused because those recipes do:

PACKAGE_ARCH =3D "${SDK_ARCH}_${SDK_OS}"

Which is not in SSTATE_ARCHS, and therefore the required SPDX files
cannot be found. It appears this was done circa 2016: 1dbc6ec4ca
("buildtools/uninative-tarball: Fix deployment overlap issues") , but
I'm not sure it was correct before that.

IDK what the fix should be; Maybe SSTATE_PKGARCH should always be part
of SSTATE_ARCHS? Or maybe ${SDK_ARCH}_${SDK_OS} needs to be manually
added?

On Thu, Mar 19, 2026 at 1:07=E2=80=AFAM Mathieu Dubois-Briand
<mathieu.dubois-briand@bootlin.com> wrote:
>
> On Wed Mar 18, 2026 at 2:49 PM CET, Joshua Watt wrote:
> > Mathieu,
> >
> > Here is my latest SPDX patch set (finally!). I'm sorry for the delay
> > and the mix up with Stefano's patches. I believe that you can now
> > stack Stefanos patches on top of mine and everything should be OK
> >
> > Thank you,
> > Joshua
> >
>
> Thanks!
>
> I did apply this series, but got some conflicts. I did try to solve
> them, but I might have solved them wrong.
>
> For reference, the result is here:
>
> https://git.yoctoproject.org/poky-ci-archive/log/?h=3Doecore/autobuilder.=
yoctoproject.org/valkyrie/a-full-3456
>
> So with this, I've got a few issues. First an error appearing in various
> builds:
>
> ERROR: buildtools-tarball-1.0-r0 do_create_spdx: Could not find a static =
SPDX document named static-buildtools-tarball
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/2/builds/3422
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/36/builds/3405
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/2/builds/3422
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/2/builds/3422
>
> And still some selftest failures:
>
> 2026-03-18 21:56:34,082 - oe-selftest - INFO - runtime_test.TestExport.te=
st_testexport_sdk (subunit.RemotedTestCase)
> 2026-03-18 21:56:34,083 - oe-selftest - INFO -  ... FAIL
> ...
> 2026-03-18 22:25:15,422 - oe-selftest - INFO - spdx.SPDX30Check.test_down=
load_location_defensive_handling (subunit.RemotedTestCase)
> 2026-03-18 22:25:15,422 - oe-selftest - INFO -  ... FAIL
> ...
> 2026-03-18 23:06:54,297 - oe-selftest - INFO - spdx.SPDX30Check.test_vers=
ion_extraction_patterns (subunit.RemotedTestCase)
> 2026-03-18 23:06:54,297 - oe-selftest - INFO -  ... FAIL
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/3462
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/3568
>
> I will probably launch a build with this series alone a bit later today,
> to distinguish what comes from this series and what comes from the
> combination.
>
> Thank,
> Mathieu
>
> --
> Mathieu Dubois-Briand, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>

