Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8AD5C3271E
	for <webhook@archiver.kernel.org>; Mon,  8 Jul 2024 08:17:26 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web10.75067.1720426637219740843
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Jul 2024 01:17:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YFQ3WwaZ;
 spf=pass (domain: gmail.com, ip: 209.85.167.53, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-52e9f863c46so3834657e87.1
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Jul 2024 01:17:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720426635; x=1721031435; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HunQtYqqTSXUK+0+36g7aGz5bawUOxIspt7R2gQo0SU=;
        b=YFQ3WwaZjCvAB1kXSxQiCRRgIfDTAGmjcKkt6vr5Kz6dfenV6GtXnBcpzNq2MGwfkW
         oVLWYgjHEHjTjD3R4TH3qoGNQqlJr5mwgJXylEKxeNzO+hGfgLoJ8VXpbWt6zo5ZxwMz
         9G2uRzwH2EB0ZTGGUy+OEbf//7zSJ+UoWgDDHYiZvBXmnuIarCNb0fC3Qlpov/6rBKhQ
         96+tq0JvyqltCyuYCX7XpUAY6SnbLJMK9H+t1r+/6z9C5K/bTb3/6TwkU9a1SO5tZSm9
         v1n1PXA0mEl8oeaJtaRF3JsUwmamyIPNzSos88WMohiqg9xB4PrDyAQN/ZCnf0VUx+R5
         +kUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720426635; x=1721031435;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HunQtYqqTSXUK+0+36g7aGz5bawUOxIspt7R2gQo0SU=;
        b=kBqxvANS1D637LMQzRvBUdYcyI8fPTu+aQRSuaC0tPrDQgEjivjg/S7M+jnrhXvT0L
         5877scM5jJSpdbXlxeDlPazKxkYSglRnsfWQaW+LBkDxZ9E2xoPdRFDFkB6lay9l+AES
         9aEK41g2BV96G9nRdYNhvaveVI1L89aNT+SnaEeEBCeML9rBiCdEtqT8LSqTS+zKgxVU
         4rinYpxvu04jFnTRjdHh69okAKkry+6ZNGY83X70C0TBvpud50ZNZVFpxMwM/V7+eBjq
         5Iczli+c/djXogLNQk/SBdMMgwxs4tCr7+GQuZjdOwQ4DbQiMwOg5Lazl3TteZHUn+5/
         GBUA==
X-Forwarded-Encrypted: i=1; AJvYcCVM14MAAOSl46fGlDvQBPvW6+gsYdG+wTXawBYXdd9t1GjcDH41qhaNin8YCuinL+FBnCkcpgKUgbqBMFC4JRVQp9/gkW0JB/bQKqGqv63+cj9OWH7mvx3X
X-Gm-Message-State: AOJu0YyvCpSJNSiE9liZaa2hDGCsZ2+LzRP9Ks5MUSJsHcYnOV5vDE2J
	P1bRnOJELZj7bHgDueoTLwowd5rskCJzRzin6OgOd70MvupoGjRiYcTfQZDah+azvK+1INKeTC2
	raurHEm//A6SmPpvRjsUyYwuvIb0=
X-Google-Smtp-Source: AGHT+IF7a4YFKCyjuUEqb8DXbYd9R2ju/T+bScx0ub/4xxYgGadpsWCw5vxhsKVpzk9lnAhA/wlAsraozeMHeRRGCpw=
X-Received: by 2002:ac2:4a6f:0:b0:52c:9824:2780 with SMTP id
 2adb3069b0e04-52ea06d7a32mr6661508e87.64.1720426635160; Mon, 08 Jul 2024
 01:17:15 -0700 (PDT)
MIME-Version: 1.0
References: <20240627221804.599573-1-JPEWhacker@gmail.com> <bce5f93668412736c515e663d39c39696ccabf7b.camel@linuxfoundation.org>
 <CAJdd5GZd-da8+K+b3_QJaAUijUCnkxFhxp3D6235BkkZmF1RNA@mail.gmail.com>
In-Reply-To: <CAJdd5GZd-da8+K+b3_QJaAUijUCnkxFhxp3D6235BkkZmF1RNA@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 8 Jul 2024 10:17:08 +0200
Message-ID: <CA+chaQdgWxAxcYiwMiueVTusAczxOiHBxkwT9PXsJePNRuF-Vg@mail.gmail.com>
Subject: Re: [OE-core][PATCH 0/2] Update to latest version of SPDX licenses
To: JPEWhacker@gmail.com
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Jul 2024 08:17:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201630

Doesn't this cause:
ERROR: hdparm-9.65-r0 do_populate_lic: QA Issue: hdparm: hdparm is a
generic license, please don't use NO_GENERIC_LICENSE for it.
[license-no-generic]
?

On Mon, Jul 1, 2024 at 4:33=E2=80=AFPM Joshua Watt via lists.openembedded.o=
rg
<JPEWhacker=3Dgmail.com@lists.openembedded.org> wrote:
>
> Ah, right, I should have known that would happen. I'll send the fix
>
> On Mon, Jul 1, 2024 at 12:56=E2=80=AFAM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >
> > On Thu, 2024-06-27 at 16:16 -0600, Joshua Watt via lists.openembedded.o=
rg wrote:
> > > Adds a script to read the released SPDX license JSON data, and uses i=
t
> > > to update the common license files
> > >
> > > Joshua Watt (2):
> > >   scripts/pull-spdx-licenses.py: Add script
> > >   licenses: Update to SPDX license version 3.24.0
> >
> > Thanks for doing this. It does seem to upset one of the selftests:
> >
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/80/builds/6871
> >
> > 2024-06-30 21:07:48,909 - oe-selftest - INFO - =3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > 2024-06-30 21:07:48,966 - oe-selftest - INFO - FAIL: spdx.SPDXCheck.tes=
t_spdx_base_files (subunit.RemotedTestCase)
> > 2024-06-30 21:07:48,966 - oe-selftest - INFO - ------------------------=
----------------------------------------------
> > 2024-06-30 21:07:48,980 - oe-selftest - INFO - testtools.testresult.rea=
l._StringException: Traceback (most recent call last):
> >   File "/home/pokybuild/yocto-worker/oe-selftest-debian/build/meta/lib/=
oeqa/selftest/cases/spdx.py", line 55, in test_spdx_base_files
> >     self.check_recipe_spdx("packages", "base-files.spdx.json", "base-fi=
les")
> >   File "/home/pokybuild/yocto-worker/oe-selftest-debian/build/meta/lib/=
oeqa/selftest/cases/spdx.py", line 52, in check_recipe_spdx
> >     result =3D check_spdx_json(full_file_path)
> >              ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> >   File "/home/pokybuild/yocto-worker/oe-selftest-debian/build/meta/lib/=
oeqa/selftest/cases/spdx.py", line 49, in check_spdx_json
> >     result =3D runCmd("{} {} -i {}".format(python, validator, filename)=
)
> >              ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> >   File "/home/pokybuild/yocto-worker/oe-selftest-debian/build/meta/lib/=
oeqa/utils/commands.py", line 212, in runCmd
> >     raise AssertionError("Command '%s' returned non-zero exit status %d=
:\n%s" % (command, result.status, exc_output))
> > AssertionError: Command '/home/pokybuild/yocto-worker/oe-selftest-debia=
n/build/build-st-296488/tmp/work/x86_64-linux/python3-spdx-tools-native/0.8=
.2/recipe-sysroot-native/usr/bin/nativepython3 /home/pokybuild/yocto-worker=
/oe-selftest-debian/build/build-st-296488/tmp/work/x86_64-linux/python3-spd=
x-tools-native/0.8.2/recipe-sysroot-native/usr/bin/pyspdxtools -i /home/pok=
ybuild/yocto-worker/oe-selftest-debian/build/build-st-296488/tmp/deploy/spd=
x/2.2/qemux86_64/packages/base-files.spdx.json' returned non-zero exit stat=
us 1:
> > ERROR:root:There have been issues while parsing the provided document:
> > Error while parsing Document: ['Error while parsing version 3.24.0: 3.2=
4.0 is not a valid version string']
> >
> > It is coming from here:
> >
> > https://github.com/spdx/tools-python/blob/main/src/spdx_tools/spdx/mode=
l/version.py
> >
> > in spdx-tools :/.
> >
> > Cheers,
> >
> > Richard
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#201306): https://lists.openembedded.org/g/openembedde=
d-core/message/201306
> Mute This Topic: https://lists.openembedded.org/mt/106918424/3617156
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ma=
rtin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

