Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E92781125855
	for <webhook@archiver.kernel.org>; Wed, 11 Mar 2026 16:40:10 +0000 (UTC)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.732.1773247202329511660
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Mar 2026 09:40:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=J8OJzRDU;
 spf=pass (domain: gmail.com, ip: 209.85.128.179, mailfrom: jpewhacker@gmail.com)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-79863ab8478so212867b3.3
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Mar 2026 09:40:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773247201; cv=none;
        d=google.com; s=arc-20240605;
        b=CBp0F+rcSlNcaBSn53yATBsXx7L4CGhY5YLnacisSQAOq9jSuo9hVbYHpVqQyADFcE
         4S4QONACC4L3iDWRv56ojkruED09Zb2WfwNWecRL8tFKZS6VDHPHy+HOZhz34hv0n8yd
         edbfxe3wzm4Skh8I2ljOrfqg9RLw8PtsEwrhvNnBJEovcCI9PU9e7E0uwdeuNr9yta32
         YU4rG4IRSfBO1HgrFvQspf9TyqPD7sioh1QOE+gUB5HvqA0qO1ysga7Q5COoLOBCST1D
         pYicuxtGJirLfZzs68cit/AIXUpgyYO7PtUHVPeL//0/rZiZQHmDy41zA1FEc7XdnIGw
         BhLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=C9mbEoh2fh+FFK33Qhr4rxvEs7rLX4dwmOfBmi1Tlv4=;
        fh=5FeuB6Nh36J1DVYPjKP4u0QVwEi2/Jb/Hh7Dj6M+nzk=;
        b=M08IZYWvJ0G6ARcBjtaDPkrno3PwLbeh0Orx5BX3nKIzQlmEj5xOqrXUyMONGv8LTo
         fLrf46M91GAAW3QZjRiejDbHAZC42ENfWWuNSpxeb7G2/LhsIGsdbho5qUEFNeGFpu8v
         Lf/hrmOCwDVUto7R+inRhWT526SIwPtiaubm5ZP1xPvP4N2N+Em+PC8/MtG678fH7F1r
         NFhSBeRCx5rKw6QRnVmZ24PTmtJMgeuVhVYpx3QUX7VEMzIdCkLjokLWLMVhYWhXxME9
         vRfBmBEJolkJ2YWArNJVbj6YeZXgU4Sz4fkypnwEQqIVdvQr0eGUfaxFQa0+7BDR48kz
         Fpsw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773247201; x=1773852001; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C9mbEoh2fh+FFK33Qhr4rxvEs7rLX4dwmOfBmi1Tlv4=;
        b=J8OJzRDU23SYZiGDsmk4OysEeSHduXM/VJoaS4jZnM7e6aKG70q4Jyb4yqXukDRMyZ
         D7U3Sk/Wtz5kQn2TLRUyoj7MG0J0/8+7oEShH99ktL1vG2MScT95lzVPyGMb0MryIxTc
         3w8LmJ32wcB9p7pnKlosN0yL0mQK9+yCOHhH7H69xSyvt6z/AAy8BnySzGQ4+oTenBFp
         MtjjxNm5sghT7laiTBTrLI9XVkz4SKM2pmxS583atVsjvppX8tWl1Z/g4gm/W1mub59x
         HLakSj93CbYo9nAl43vWZRyDD1hhUMul4/b5nfiWXjQPxpE3XuTxcisK5bqIhTwr2h9G
         v/gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773247201; x=1773852001;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=C9mbEoh2fh+FFK33Qhr4rxvEs7rLX4dwmOfBmi1Tlv4=;
        b=tLbFaIakZoV8pDv+Sc42vatqfTYqlEuzOBJzrf3FzNGH0tCPMkU/3kEdsjcvV6Iug4
         0wGAlgqv80b1joRQM7Zusne27Q1KLOxCZUFWZX3SN3U0z592BopvmgYUu1WuGmis9CKT
         XFVjV9SDbrz2sX3t9AuRquFVv3QXaM9BQ6VwFV7T7g5GARuqQ+95UcucOu1CkjMpLN1I
         FvR/O/sC/MVCadGuBopjOodEEwVZ465WxKkg1y3W2qW4yk4EwTMAOxEZS2G0uIcUlHHg
         Z+/A6Z9++A5TYR8KD77+SO8d+NvtFBTM2cIW/gBH80a0Q20+KQlnP3/Y9btmRAwbQDCL
         5m+w==
X-Gm-Message-State: AOJu0YyewAqpWpyUBqvEBc/QV29j1eB1jkvs61pEWNs+2MVz1cMXJ2+4
	pElJ2mT+000g1Tzut3mSEd8k5kdL3/GBopbjB31sR2TO2HoVtAGdIMEng4WBYhkNXHmHpiuZlXy
	zZzznC6Lq/Gns/AcGyQKk30k8nRtSkNI=
X-Gm-Gg: ATEYQzwr+KqHfhaMbGyCcFQpY56SONiJ/OD2t/DD3nrrVHSYyhLrTT3CqDB8ShifeBo
	WeTFq4Cd+13CXMFwTnv+lkzjmo9hltrF6uCy949MA9sBYjsb24U5IT6986BZwXlUo2QQ7UpcnpU
	psgwWZcwF8N8vksgaZZhKSLsDJ6oLmDj8M3Sdul8QLg+5PLt/p131rUgtfsJN26riXNz+ix9s5C
	38+KtMgNJ8y901ixnFD92lJP+S0G5WL6KUAk+khTtFnoWEAfqtkUbN010OHRB95FaU/9CEWLx2L
	rQOs08Kewpb3gWevTH+SNA==
X-Received: by 2002:a05:690c:c4f9:b0:798:6e69:245b with SMTP id
 00721157ae682-79917f898ebmr28762177b3.44.1773247201222; Wed, 11 Mar 2026
 09:40:01 -0700 (PDT)
MIME-Version: 1.0
References: <20260304164835.3072507-1-JPEWhacker@gmail.com>
 <20260310184058.533343-1-JPEWhacker@gmail.com> <DH00629IS6EY.1W6LCNY88LTHL@bootlin.com>
In-Reply-To: <DH00629IS6EY.1W6LCNY88LTHL@bootlin.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Wed, 11 Mar 2026 10:39:49 -0600
X-Gm-Features: AaiRm52ALVuej4i_tA-GpRNUTVQGlMez6Bo_KX_IqTR6Db1dD9o1JA54rekIzaw
Message-ID: <CAJdd5GajmhYOAO_+5G5ou0fUMeCcRxzDo0-yYLzmzk1-PHJrNA@mail.gmail.com>
Subject: Re: [OE-core][PATCH v6 00/15] Add SPDX 3 Recipe Information
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Cc: openembedded-core@lists.openembedded.org, 
	Stefano Tondo <stefano.tondo.ext@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Mar 2026 16:40:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232896

On Wed, Mar 11, 2026 at 7:55=E2=80=AFAM Mathieu Dubois-Briand
<mathieu.dubois-briand@bootlin.com> wrote:
>
> On Tue Mar 10, 2026 at 7:38 PM CET, Joshua Watt via lists.openembedded.or=
g wrote:
> > Changes the SPDX 3 output to include a "recipe" package that describe
> > static information available at parse time (without building). This is
> > primarily useful for gathering SPDX 3 VEX information about some or all
> > recipes, enabling SPDX 3 to be used in place of cve_check.bbclass and
> > vex.bbclass.
> >
> > Special thanks to Benjamin Robin <benjamin.robin@bootlin.com> for
> > helping work through this.
> >
> > V2: Fixes a bug where do_populate_sysroot was running when it should no=
t
> > be. Drops the patch to ignore ASSUME_PROVIDES recipes, since this is
> > incorrect (this is already handled by bitbake in the taskgraph, and
> > doesn't need to be manually removed).
> >
> > V3: Fixes a bug where meta-world-recipe-sbom was reporting a circular
> > dependency. meta-world-recipe-sbom also no longer runs in world builds,
> > as there's no reason to this. Finally, fixes a bug where
> > NO_GENERIC_LICENSE files would fail to be found in do_create_spdx
> > (because do_unpack was not run).
> >
> > V4: Fixes test cases. Adds SPDX_PACKAGE_INCLUDE_VEX to control if VEX
> > information is linked to binary packages, or just recipes. Defaults to
> > "0" to significantly reduce the size of the SPDX output.
> >
> > V5: Fixes dummy-sdk-packages to not generate SPDX output, since it
> > does funny things with its arch which prevents it from rebuilding SPDX
> > data properly, and no SPDX data is needed for it anyway
> >
> > V6: Fixes a bug where SPDX task would not correctly re-run when they
> > change, which would cause errors about missing SPDX document. Also
> > updates to the latest version of the SPDX bindings which improves
> > performance
> >
>
> Hi Joshua,
>
> Ok, we are almost there!
>
> I suspect it would work fine on master, but we have a fail on two tests
> that were recently added by Stefano, and were not merged so far.
>
> As both series might still evolve or get reviews, I will probably keep
> both in my branch, but some changes are needed if we want to merge both
> series.

This is actually semi-intentional. I renamed the "recipe-" SPDX files
to "build-". The fix is simple, but it either needs to be applied to
my changes or Stephanos, depending on the order. Do you have a
preference?

>
> 2026-03-11 11:31:27,495 - oe-selftest - INFO - spdx.SPDX30Check.test_down=
load_location_defensive_handling (subunit.RemotedTestCase)
> 2026-03-11 11:31:27,495 - oe-selftest - INFO -  ... FAIL
> ...
>   File "/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/layers/open=
embedded-core/meta/lib/oeqa/selftest/cases/spdx.py", line 451, in test_down=
load_location_defensive_handling
>     objset =3D self.check_recipe_spdx(
>   File "/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/layers/open=
embedded-core/meta/lib/oeqa/selftest/cases/spdx.py", line 123, in check_rec=
ipe_spdx
>     return self.check_spdx_file(filename)
>   File "/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/layers/open=
embedded-core/meta/lib/oeqa/selftest/cases/spdx.py", line 81, in check_spdx=
_file
>     self.assertExists(filename)
>   File "/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/layers/open=
embedded-core/meta/lib/oeqa/selftest/case.py", line 249, in assertExists
>     raise self.failureException(msg)
> AssertionError: '/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/bu=
ild-st-1004290/tmp/deploy/spdx/3.0.1/cortexa57/recipes/recipe-m4.spdx.json'=
 does not exist
> ...
> 2026-03-11 12:39:25,602 - oe-selftest - INFO - spdx.SPDX30Check.test_vers=
ion_extraction_patterns (subunit.RemotedTestCase)
> 2026-03-11 12:39:25,603 - oe-selftest - INFO -  ... FAIL
> ...
> 2026-03-11 12:39:25,611 - oe-selftest - INFO - 6: 45/55 656/681 (14.27s) =
(2 failed) (spdx.SPDX30Check.test_version_extraction_patterns)
> 2026-03-11 12:39:25,611 - oe-selftest - INFO - testtools.testresult.real.=
_StringException: Traceback (most recent call last):
>   File "/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/layers/open=
embedded-core/meta/lib/oeqa/selftest/cases/spdx.py", line 479, in test_vers=
ion_extraction_patterns
>     objset =3D self.check_recipe_spdx(
>   File "/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/layers/open=
embedded-core/meta/lib/oeqa/selftest/cases/spdx.py", line 123, in check_rec=
ipe_spdx
>     return self.check_spdx_file(filename)
>   File "/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/layers/open=
embedded-core/meta/lib/oeqa/selftest/cases/spdx.py", line 81, in check_spdx=
_file
>     self.assertExists(filename)
>   File "/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/layers/open=
embedded-core/meta/lib/oeqa/selftest/case.py", line 249, in assertExists
>     raise self.failureException(msg)
> AssertionError: '/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/bu=
ild-st-1004290/tmp/deploy/spdx/3.0.1/cortexa57/recipes/recipe-tar.spdx.json=
' does not exist
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/3499
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/3380
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/3270
>
> For reference, this oe-core branch was used during the build:
> https://git.yoctoproject.org/poky-ci-archive/log/?h=3Doecore/autobuilder.=
yoctoproject.org/valkyrie/a-full-3385
>
> Thanks,
> Mathieu
>
> --
> Mathieu Dubois-Briand, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>

