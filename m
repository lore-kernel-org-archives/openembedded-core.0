Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8EDCD13C18
	for <webhook@archiver.kernel.org>; Mon, 26 Jan 2026 14:01:47 +0000 (UTC)
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20012.1769436099433738631
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Jan 2026 06:01:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TUNGrxK9;
 spf=pass (domain: gmail.com, ip: 209.85.128.66, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wm1-f66.google.com with SMTP id 5b1f17b1804b1-4801c1ad878so50494735e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 26 Jan 2026 06:01:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769436098; x=1770040898; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=0dQ/vb0j+EM9s6WgPORsPz1t0/Bi+5CgR85jmd5AO0Y=;
        b=TUNGrxK9+nHt7m1PsGqohZ5Tr6Qv8Ijbz8+iwCVlbFzgHcwPMBG8Jm3pTm0K2Va17G
         ZY5o1F4oF/fq8x39m+tDOjQwkO+vYIFvfWMp7OjHh58pFwhzDxcKPP8h6RNoOkdkcvWd
         +BkhNti/eEgBVeJrHWiZlTKdNQiC7577Kii19PEkpYKVtInVk57hPndIVTJHEIJhn1H5
         7dYQ8pIibZQJlc7mX2ncdKzzskM/Lk0LBvYWL8dUK9Tk4Z5p59P+gBVXEP5M3cGBGoB3
         a+MjVoHJ0l7b3DvbaXnH9W3lSd7/FZiehhqqdC0wD4Hdy5pmGda2h6juFMfq8OiOXsuv
         liFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769436098; x=1770040898;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0dQ/vb0j+EM9s6WgPORsPz1t0/Bi+5CgR85jmd5AO0Y=;
        b=nQVbMWStBhUvY6Ngpun1xKGJARNg0W+5JQ/8EleKKJBdiSKgZFbU34Wg2ry0YfBMZu
         TKfBtYXAdITwASGwHhLFQYddcVNjHzojhHjrIXkVk1ov0C7al6Qs1UaRbv2o7Rj1+Kwc
         gCgo7bZu1IwLrCqaNm4nnKCd5yPCvDcyxYQgJ55s4lu5Iis4gIVumcInKczdUd8FJLaU
         9EBYEcTRWl/Sps8ApbydmRc1GwIOAwNZ9BnIk0qGNQHCwO5ijw3DJIykpXREFN5y7L5z
         1fHRjjJFPF2tp4a90wHFx2O0afEG8ISPZRnWhejT5lz/DY6aeCJ0x50K/q8KPpMXtVIi
         vusg==
X-Gm-Message-State: AOJu0Yw9s+olI1HL0+5L6Xs9i9ARfUn6st9+XmTBjDXKgPc+BYDAD1nB
	YP+d91u0AMSKaP63JTOf7ToJpPyuOuR6Fhze2yAaa49HbM1efklikePE
X-Gm-Gg: AZuq6aJqmvvPq8GHHRM7U7u17gv75oHWji2ndEiJS1AneEuxRgNxDTVQQEKIkG5funm
	30fBChAxt/mpMmnxfggqTIciiVbpU4J/vzJafLO6axDv0jedVl+39cvxIhq0nyiHnoh4pxYpUWP
	4npl1xjaUV8CGycusMT2gwiD20moBzLZXF5LHPmJzJuwEVYEfFhGXsIrbTu0pQGsVU8JV5iS7hp
	l/VxuGtOsDK0iCSSTCUPp/0YQiECVA8QYPo0SwE7BKVhP9nxoD2RTsZXsrcAAEsk1+yHBNc1F2R
	QwlwdTybLeEou2MlvfHJvubSVt6wFGiGdumLDqwJwa59ASrEiQgA7IxSPxQE1CYP2NBwv8SvZ9Z
	DNdPSZV44k0SFRXhGsnspgLmjotVT7kB/fY4LIfdU5kH80YILMBQdfAY1dzjqG6Av15F5MdHdBV
	oBuQj0hyBsDZhybEavqXHNXVOyjpKgD7r9R2RQcojQYoVqYQAZ0NJ7KKtz9d4o7WIIPZ6uo6I=
X-Received: by 2002:a05:600c:1382:b0:477:7a53:f493 with SMTP id 5b1f17b1804b1-4805cf66be0mr68129275e9.23.1769436097344;
        Mon, 26 Jan 2026 06:01:37 -0800 (PST)
Received: from ?IPv6:2a02:169:59a6:0:55c4:f628:91f3:4287? ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4804d85cff5sm280887045e9.7.2026.01.26.06.01.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 06:01:36 -0800 (PST)
Message-ID: <a791396b22547baabda7c43fc2b2c4e57e1a2103.camel@gmail.com>
Subject: Re: [OE-core] [PATCH v3 01/13] useradd_base.bbclass: do not use awk
From: adrian.freihofer@gmail.com
To: alex.kanavin@gmail.com, Qi.Chen@windriver.com
Cc: openembedded-core@lists.openembedded.org
Date: Mon, 26 Jan 2026 15:01:30 +0100
In-Reply-To: <CANNYZj9GrL4UTaMKz2gsmUFimRkFCqjyNmy8SPa8i_o9BqfNjg@mail.gmail.com>
References: <20260126073809.468495-1-adrian.freihofer@siemens.com>
	 <20260126073809.468495-2-adrian.freihofer@siemens.com>
	 <eba59226-122f-40c1-a83e-184df0e8ffcf@windriver.com>
	 <CANNYZj9GrL4UTaMKz2gsmUFimRkFCqjyNmy8SPa8i_o9BqfNjg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Jan 2026 14:01:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230008

On Mon, 2026-01-26 at 13:28 +0100, Alexander Kanavin via
lists.openembedded.org wrote:
> On Mon, 26 Jan 2026 at 09:18, Chen Qi via lists.openembedded.org
> <Qi.Chen=3Dwindriver.com@lists.openembedded.org> wrote:
> >=20
> > I have concern on this patch.
> >=20
> > You're modifying a basic bbclass to fix one case without finding
> > out the
> > root cause.
> > By doing this, you're putting unnecessary restriction on the use of
> > commands in this bbclass. Other commands with similar dependencies
> > could
> > potentially encounter the same issue in the future.
> > I think if you find out the root cause, you'll come up with a
> > better
> > fix. This would not only resolve the current case but also prevent
> > similar issues.
>=20
> I agree, even before the search for the root cause, this does need
> steps to reproduce, so others can also look properly into what the
> issue is.
>=20
> Alex


I think the root cause is that awk is called without having a
dependency on it. A proper fix would be adding this dependency.
Question is: where? I guess it is from the build-sysroots-1.0-r0
do_build_target_sysroot task on itself.

How to reproduce this is more or less described in the commit message.

My patches add:
  +USERADD_PACKAGES =3D "${PN}"
  +GROUPADD_PARAM:${PN} =3D "--system ${BPN}"
  +USERADD_PARAM:${PN} =3D "--system --home /var/lib/${BPN}
   --no-create-home --shell /bin/false --gid ${BPN} ${BPN}"
to a package.

Then the test case
devtool.DevtoolIdeSdkTests.test_devtool_ide_sdk_shared_sysroots
creates an dynamic SDK including this package.

That means, in the context of
  build-sysroots-1.0-r0 do_build_target_sysroot

postinst-base-passwd explodes like this:

  Exception: subprocess.CalledProcessError: Command
  '/srv/pokybuild/yocto-worker/oe-selftest-debian/build/
   build-st-254283/tmp/sysroots/qemux86-64/usr/bin/
   postinst-base-passwd' returned non-zero exit status 1.

  awk: error while loading shared libraries: libtinfo.so.5:
       cannot open shared object file: No such file or directory

https://autobuilder.yoctoproject.org/valkyrie/api/v2/logs/4983396/raw_inlin=
e
I'm not sure if this is solvable in a better way because my
understanding is that the dependency is circular.

If the task gets restarted, it works because the missing libraries are
then available.


Another fix is removing this dependency by not calling awk, what I
propose here.


Adrian

>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#229983):
> https://lists.openembedded.org/g/openembedded-core/message/229983
> Mute This Topic: https://lists.openembedded.org/mt/117464897/4454582
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe:
> https://lists.openembedded.org/g/openembedded-core/unsub=C2=A0[
> adrian.freihofer@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

