Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DEB8C7EE33
	for <webhook@archiver.kernel.org>; Thu, 26 Jun 2025 20:13:31 +0000 (UTC)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
 by mx.groups.io with SMTP id smtpd.web11.5524.1750968806737885302
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Jun 2025 13:13:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=FNXsGwk+;
 spf=softfail (domain: sakoman.com, ip: 209.85.219.178, mailfrom: steve@sakoman.com)
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-e740a09eae0so1299855276.1
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Jun 2025 13:13:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1750968806; x=1751573606; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r13DcJK3IWCWcHHCeE4zf6+Hf73KKCWhBRTLgg/wWWE=;
        b=FNXsGwk+wJRqUzNBSi2T0yKKyseqFbGoGyTB90KQUmgOoeCO80a0IkLXfJROXSlFYW
         QUYUkmqZ2bi9sqPU5eluODCTf+LQjBzDu0ZTNA6JJqPwXpOEGiW09dqw7jYiVABjHBkW
         xsnG3rFUqWc6/xCQzxgC9+yZeim9MBUzl3xSTxHaVMg9Nh4EXMO8aNEcQZFxI7554971
         0Ijypy2wK6ptVdeZQ6Iry4k6p4/w6ckluoa0bGJoHZpEmUN0RvP8YXB7PdY/IwGZLAwh
         QhHGigh+o+4pY8x5GHO5TW/LUbSDXzDknpa317QhSJtkM82keVA1UEsejKFWpKgs7HeG
         Pcdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750968806; x=1751573606;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r13DcJK3IWCWcHHCeE4zf6+Hf73KKCWhBRTLgg/wWWE=;
        b=BHt574pc8TjzJ4K81yTVUEgFNNDY80lFI2JWCPMB+17Eh368De3z/QDVPEKROzW25j
         tLMvS+8sYiv+txwhw5TyTjLaqV+ftVPMqnltlR+aQVv1TvnF9ZQJN6Ma6kyJw4R7mknc
         yK0s2UHqXPeYzhHc5ul93p+qBO4SeS+DUHRPev2jGkL6v7l+pDZ+LD4Wzed/1InmjR31
         mqSPHGDEVfWNvYI8TXUKu3c5IT0FXtwd749ECXgTlkrDGGox8nOtpELuIdBAYDKggHyY
         ZhktqESmCC9kJK6FavATrjtvtG2bJDGs2WT2j35wsW0ytoJYl1qy7yVKeFbLTJa1hke5
         X6VQ==
X-Gm-Message-State: AOJu0Yyp+JcBG9cz7HL00Ao7Y5HJAS1BJnAoN8Q6nKur3kuyxqA3qUuF
	zlgcu0x4IOHYVBVkqS8X+zCNBMWVBPneNrQaYT7B+E3ZN0hUZZau7tIyDpu8tHiG/0W82WONE5X
	37cD8zdxTAlTzYgE7/O3pPFRLblNnEj/3Qu81MS/itg==
X-Gm-Gg: ASbGnctlQcBf8qsppzA9JM0+63MdGOzSjgeEyUQZVRUcQirSjJf9eqP6tAQZtEKA7m+
	cMFCgako44JVGQvY/mv2SEDeLJnakO5tmtZBNoM3MTXtY3s3iNA/rBn0TQrowHMR3pJbEE0IVVP
	arPDzIDqJHzHXp1IQE0rY0gxYgOwQupdnR14a6JbbpxkFBeeeZEnTFsVjlBICwDPBo+5uKVChlA
	xc=
X-Google-Smtp-Source: AGHT+IEcqDKvYNd3SjrT4xZC/FhhYp3bMItCHNeVxr7dACLChdgQw2n0Qv2Ob8owgXSdpCq+WXsYCWo96p5oDmpXMtg=
X-Received: by 2002:a05:690c:3602:b0:714:13:3544 with SMTP id
 00721157ae682-715171618f9mr11676767b3.16.1750968805615; Thu, 26 Jun 2025
 13:13:25 -0700 (PDT)
MIME-Version: 1.0
References: <20250619084736.1940747-1-daniel.turull@ericsson.com>
 <CAOSpxdaq52nk4PmHEjnm3P2yc4EPh+A_JEAgewbLHeQJtgMotg@mail.gmail.com>
 <a041e18e26dc44c399aa86b6c8ecef15eb3dcbaa.camel@linuxfoundation.org>
 <CAOSpxdayvq2SLFEcONDG_QFvS6ma29u-oBgHO-3aWDJQczmZ2A@mail.gmail.com> <PR3PR07MB6666A8DEC30CCDC671270A678A7AA@PR3PR07MB6666.eurprd07.prod.outlook.com>
In-Reply-To: <PR3PR07MB6666A8DEC30CCDC671270A678A7AA@PR3PR07MB6666.eurprd07.prod.outlook.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Thu, 26 Jun 2025 13:13:14 -0700
X-Gm-Features: Ac12FXz35eOprJGm6CUiKSjbTl9J2C0IErJ9Tb0YvT4vtWSCsMEEj-NuYdxY9lY
Message-ID: <CAOSpxdYnMh5c-S1i93b-qStspjiHZ+GXkcGgSBVRSBg56koOMQ@mail.gmail.com>
Subject: Re: [OE-core] [scarthgap][PATCH 1/2] package: export debugsources in
 PKGDESTWORK as json
To: Daniel Turull <daniel.turull@ericsson.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, Yocto TSC <tsc@lists.yoctoproject.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Jun 2025 20:13:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219370

Hi Daniel,

On Thu, Jun 26, 2025 at 4:37=E2=80=AFAM Daniel Turull
<daniel.turull@ericsson.com> wrote:
>
> Hi Steve,
> I looked at the log and it is a bit strange. The failure in the log seems=
 to be related to sstate. From what I see in the log sstatetests.SStatePrin=
tdiff.test_gcc_runtime_vs_gcc_source  is failing but my patch is not touchi=
ng gcc neither sstate. It is only creating a new zstd file with existing da=
ta in do_package.
>
> 2025-06-24 22:32:42,764 - oe-selftest - INFO - sstatetests.SStatePrintdif=
f.test_gcc_runtime_vs_gcc_source (subunit.RemotedTestCase)
> 2025-06-24 22:32:42,764 - oe-selftest - INFO -  ... FAIL
>
>   File "/srv/pokybuild/yocto-worker/oe-selftest-debian/build/meta/lib/oeq=
a/selftest/cases/sstatetests.py", line 884, in test_gcc_runtime_vs_gcc_sour=
ce
>     self.run_test_printdiff_changerecipe("gcc-runtime", "gcc-source", "-c=
 do_preconfigure {}".format(gcc_source_pn),
>   File "/srv/pokybuild/yocto-worker/oe-selftest-debian/build/meta/lib/oeq=
a/selftest/cases/sstatetests.py", line 818, in run_test_printdiff_changerec=
ipe
>     result_sametmp =3D bitbake("-S printdiff {}".format(target))
>                      ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>   File "/srv/pokybuild/yocto-worker/oe-selftest-debian/build/meta/lib/oeq=
a/utils/commands.py", line 234, in bitbake
>     return runCmd(cmd, ignore_status, timeout, output_log=3Doutput_log, *=
*options)
>            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^=
^^^^^^^
>   File "/srv/pokybuild/yocto-worker/oe-selftest-debian/build/meta/lib/oeq=
a/utils/commands.py", line 212, in runCmd
>     raise AssertionError("Command '%s' returned non-zero exit status %d:\=
n%s" % (command, result.status, exc_output))
> AssertionError: Command 'bitbake  -S printdiff gcc-runtime' returned non-=
zero exit status 1:
>
>
> When I run the same failing test in my local machine, it passes.
> oe-selftest -r sstatetests.SStatePrintdiff.test_gcc_runtime_vs_gcc_source=
 -j 20 -T machine -T toolchain-user -T toolchain-system
>
> 2025-06-26 09:44:35,119 - oe-selftest - INFO - Adding layer libraries:
> 2025-06-26 09:44:35,119 - oe-selftest - INFO -  /local/x/yocto-scarthgap/=
meta-yocto/meta-poky/lib
> 2025-06-26 09:44:35,119 - oe-selftest - INFO -  /local/x/yocto-scarthgap/=
meta/lib
> 2025-06-26 09:44:35,120 - oe-selftest - INFO -  /repo/x/yocto-scarthgap/m=
eta-yocto/meta-yocto-bsp/lib
> 2025-06-26 09:44:35,120 - oe-selftest - INFO -  /repo/x/yocto-scarthgap/o=
penembedded-core/meta-skeleton/lib
> 2025-06-26 09:44:35,120 - oe-selftest - INFO -  /local/x/yocto-scarthgap/=
openembedded-core/meta-selftest/lib
> 2025-06-26 09:44:35,121 - oe-selftest - INFO - Checking base configuratio=
n is valid/parsable
> NOTE: Starting bitbake server...
> 2025-06-26 09:46:05,270 - oe-selftest - INFO - sstatetests.SStatePrintdif=
f.test_gcc_runtime_vs_gcc_source (subunit.RemotedTestCase)
> 2025-06-26 09:46:05,271 - oe-selftest - INFO -  ... ok
> 2025-06-26 09:46:05,271 - oe-selftest - INFO - 0: 1/1 1/1 (89.19s) (0 fai=
led) (sstatetests.SStatePrintdiff.test_gcc_runtime_vs_gcc_source)
> 2025-06-26 09:46:14,303 - oe-selftest - INFO - --------------------------=
--------------------------------------------
> 2025-06-26 09:46:14,303 - oe-selftest - INFO - Ran 1 test in 98.415s
> 2025-06-26 09:46:14,303 - oe-selftest - INFO - OK
> 2025-06-26 09:46:18,464 - oe-selftest - INFO - RESULTS:
> 2025-06-26 09:46:18,464 - oe-selftest - INFO - RESULTS - sstatetests.SSta=
tePrintdiff.test_gcc_runtime_vs_gcc_source: PASSED (89.20s)
> 2025-06-26 09:46:18,465 - oe-selftest - INFO - SUMMARY:
> 2025-06-26 09:46:18,465 - oe-selftest - INFO - oe-selftest () - Ran 1 tes=
t in 98.418s
> 2025-06-26 09:46:18,466 - oe-selftest - INFO - oe-selftest - OK - All req=
uired tests passed (successes=3D1, skipped=3D0, failures=3D0, errors=3D0)
>
> Is it possible that was a temporally glitch in the CI, or related to the =
latest update to gcc 13.4?

It is possible!  I ran the test 4 times on that first day, both with
and without your patches.  Failed both times with and passed both
times without. And oe-selftest failed on all distros tested.

So my assumption was that it was patch related.

I added back your patches and tried again this morning.  All
oe-selftests passed!

So I'm going to leave them in my test queue for a few days to see if
the issue reappears.  If not, I'll merge them.

Steve

> > -----Original Message-----
> > From: Steve Sakoman <steve@sakoman.com>
> > Sent: Wednesday, 25 June 2025 17:27
> > To: Daniel Turull <daniel.turull@ericsson.com>
> > Cc: openembedded-core@lists.openembedded.org; Mathieu Dubois-Briand
> > <mathieu.dubois-briand@bootlin.com>; Yocto TSC <tsc@lists.yoctoproject.=
org>;
> > Richard Purdie <richard.purdie@linuxfoundation.org>
> > Subject: Re: [OE-core] [scarthgap][PATCH 1/2] package: export debugsour=
ces in
> > PKGDESTWORK as json
> >
> > On Mon, Jun 23, 2025 at 2:33=E2=80=AFPM Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> > >
> > > On Thu, 2025-06-19 at 08:23 -0700, Steve Sakoman wrote:
> > > > Since this is a feature addition the TSC will need to approve it
> > > > before I can take this backport.
> > > >
> > > > I've copied the TSC so they can add this to the agenda for their
> > > > next meeting.
> > >
> > > The TSC discussed this today. The change adds a single data file to
> > > packagedata based on existing information we already calculate during
> > > the build so the potential risk and impact on existing users is low.
> > >
> > > Whilst this is a feature change, the uses for security and handling
> > > CVEs are extremely useful so on balance the TSC thinks this can be
> > > merged.
> >
> > Unfortunately this patch is causing oe-selftest failures on the autobui=
lder, here's a
> > sample log:
> >
> > https://errors.yoct/
> > oproject.org%2FErrors%2FDetails%2F862388%2F&data=3D05%7C02%7Cdaniel.tur=
u
> > ll%40ericsson.com%7Cdefa9e6dee2e4d7b179308ddb3fcc9fd%7C92e84cebfbfd4
> > 7abbe52080c6b87953f%7C0%7C0%7C638864620472989564%7CUnknown%7CT
> > WFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4
> > zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3DyfloJxqQl8r
> > qqBSwuFZdlk62PfAx0RD%2ByfILVfmTgI8%3D&reserved=3D0
> >
> > This will need to be addressed before I can merge.
> >
> > Thanks,
> >
> > Steve

