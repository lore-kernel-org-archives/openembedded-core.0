Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 411BDD49C6B
	for <webhook@archiver.kernel.org>; Fri, 30 Jan 2026 07:44:28 +0000 (UTC)
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5903.1769759064743913769
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Jan 2026 23:44:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cNQD5FGy;
 spf=pass (domain: gmail.com, ip: 209.85.160.42, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-4042fe53946so662880fac.3
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Jan 2026 23:44:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769759064; cv=none;
        d=google.com; s=arc-20240605;
        b=MLQvGsvqqqcgKLuB8tdkKuZYXQOfv8TCB5rCruah8flpvk6lZMmsQAralQAb1Anq23
         JJLSIoQDN1MuhS2WkQ00bvozx+gQkN4ZWqAQvimfd1TqNsAWnA5Pq/K1dglhxTHmgLdU
         0Wu+TiMaBXlCBMLGvabejf1eDvJimB5o+ok1dzn0m6iGrdPwzAVEHgohb+9IO5CI7GDa
         1OgfKOyqPoE8a4VH6+FUYupBA4/OPeQJDoAfeUgl112fVQp92c1AHTahU98GCDZQg14J
         A4ZielLhuy+xQNHZ7ciAvkIDOsw6yLO/e8vy3VK+z5QQr7j1bijQdd4tKR7oH9j64pp1
         5YMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=weooHC/VaT+wP3IISmWhfGN3n5jTfhelnMQBxcLp3gg=;
        fh=TGF7TVa5Eshw5M6K2XLmjdIMKFhrsPaliuC+tv7wzuY=;
        b=kcQV8Y7RKUq7ingmLHZtsNAj3z9QaDWogknzGMKoNbWd8rwykYKa0w2RHNSSgHLkax
         vGtefLaGSPisvvLEANC2T4EtKQngElJzoywDkviXAg5VphbPlYBN8jEg9g0HEw7J50nA
         10Pqdq38xFiKR6i2+ebenq+Grey0jvDrVMuNzg3E4s1oZX08+fWgGkN9TfJg73czR+bs
         vQo3l9BWQUHZBo6+BsoCtZA4CbQ7PQcE2Dr/js5HF12QAYugJ7MsO1CvmWSEt1bhN956
         LFhXxtGIjrb0MThIbxuHW0PCgn6QG1fW7cxp8loa7J0k5ThJbfzNQJ+EFBSv4aFkqbw6
         FTqw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769759064; x=1770363864; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=weooHC/VaT+wP3IISmWhfGN3n5jTfhelnMQBxcLp3gg=;
        b=cNQD5FGyc1G0F/kngX60Lcxxh1+GNWoyEfFa/zRJ0vPudTa1YIdlsfOU3ZdOUvCFDD
         n1LAKoX5+20sIQlcGQwHTsb3kd0xIu3uJ/5j2PePAB8RIQAgtTRXLCfHy6y3NIYVW0VJ
         E+AibI+KOq8kbnrWX/udYlA0EwQMP58/SVQZPWkig4UuKXJnvWnjJ9fwBHzWUtzTAvq+
         CfuYbOsP12f+lSGsmjm2GyIF82gALolrovM7kS3TRtZvy6Xk/rdhk6/A5PLqqH9mq9ZZ
         VwCdH0apj+soe+LU9wwGvi8PsXfc4GI96Cj1roy1CDW2FlzpQ3lT5PGvjU4s7BihnEHm
         UAYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769759064; x=1770363864;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=weooHC/VaT+wP3IISmWhfGN3n5jTfhelnMQBxcLp3gg=;
        b=AHIpVzDnhhvZInh2RfYhDr267F5aVM425re0f+PrCbP1Y8+1mqxEdmjnLYvAAV9fFQ
         KUtZbnpdnrfXKMh6N7iCtTEddCSYNu2ORoAHOkCfrbaZY8KkcCudDk1yU4SqyoRMt2C1
         Da2JMSclqgHwTi6M4uT2GEQkYJUZs58aUV0qLKLZTCRHSgODZ2KhURu+9iJscTslvvmS
         EibkdkJmcQepscP0JY7+LvcWA5+KkfiSMLgLi+pcXsqpq7Gm3fi5FnC2bq9gg9XXiIoC
         kB7v083WorsyiRASUv3FWlDdyXgOS7C2tMIV+LEbz+OJ3+pbJbKtDFOmUENVNUjxUGc/
         GUPA==
X-Gm-Message-State: AOJu0YyaTQF+HtF11JOzdT4l/7j7DO2ApT7IbGDYtviFsiZArxCAiYXd
	zG7JSj0GrGaBTw7i5Hcj4yRFCor3roO3sq4OFzEvC8aG92FcBND+NJf1wrghOuzXkm3iTWMzTgH
	2hpZOl5bJADPHLl10y5Ksw1rYMzO8hRucEimm
X-Gm-Gg: AZuq6aLArpKWkczyvfgRYdDmSVDK2pPDZlVaO5q4o6D6OczIWbM+qprqK8mSof+fV8Z
	Weed1KGYwAuwmpp4dlcG9SIzgYqFc3z2LPteIFZ7ca+wFNujp7mh9R48a5w2Pw1cpW/KzLEru9N
	7Qk6OugHrYxk2WVZhznU+sagGUEzt/aeoFKFA7DFbxl+AJfhugy81CKodlMV7NYw92DI7Q/swKf
	g4S6dlw9bzYbVx1yP9DQmw02Zx8edOhmgzt+T9f4vqMfHz1zDqwm1f8YTlMpQoaCKnXh16L
X-Received: by 2002:a05:6871:4704:b0:409:54a3:6aa6 with SMTP id
 586e51a60fabf-409a6cea567mr1249157fac.33.1769759062123; Thu, 29 Jan 2026
 23:44:22 -0800 (PST)
MIME-Version: 1.0
References: <20260126102747.1077552-1-ankur.tyagi85@gmail.com>
 <20260126102747.1077552-4-ankur.tyagi85@gmail.com> <DG1QD2UPJMSH.2VRUB1QKCB6VG@bootlin.com>
In-Reply-To: <DG1QD2UPJMSH.2VRUB1QKCB6VG@bootlin.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Fri, 30 Jan 2026 20:44:11 +1300
X-Gm-Features: AZwV_QjsisPr-eDHfrTLFbywvyPL-4kQYfCYvg0xC5IR0_m4sUz83Od7g3OUvfM
Message-ID: <CADySD0Gw2sPx=bQ4YjMrsQgou2RWiiQFv4B8552yaigBtihYbQ@mail.gmail.com>
Subject: Re: [OE-core][PATCH 4/4] mdadm: upgrade 4.4 -> 4.5
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 Jan 2026 07:44:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230181

On Fri, Jan 30, 2026 at 8:03=E2=80=AFPM Mathieu Dubois-Briand
<mathieu.dubois-briand@bootlin.com> wrote:
>
> On Mon Jan 26, 2026 at 11:27 AM CET, Ankur Tyagi via lists.openembedded.o=
rg wrote:
> > From: Ankur Tyagi <ankur.tyagi85@gmail.com>
> >
> > Changelog:
> > https://git.kernel.org/pub/scm/utils/mdadm/mdadm.git/tree/CHANGELOG.md?=
h=3Dmdadm-4.5
> >
> > Replaced 0001-restripe.c-Use-_FILE_OFFSET_BITS-to-enable-largefile.patc=
h
> > with 0001-raid6check.c-restripe.c-Use-64-bit-off_t-across-both.patch as
> > partial changes from first patch are part of the upstream version[1].
> >
> > Dropped xmalloc.patch which is part of upstream version[2].
> >
> > Also refreshed other patches.
> >
> > [1] https://github.com/md-raid-utilities/mdadm/commit/787cc1b60130b8031=
be59e49d54463c58cd8cf74
> > [2] https://git.kernel.org/pub/scm/utils/mdadm/mdadm.git/commit/raid6ch=
eck.c?h=3Dmdadm-4.5&id=3De0df6c4c984d564e9e40913727e916a6cd8f466e
> >
> > Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> > ---
>
> Hi Ankur,
>
> Thanks for your patch.
>
> > --- a/meta/recipes-extended/mdadm/mdadm_4.4.bb
> > +++ b/meta/recipes-extended/mdadm/mdadm_4.5.bb
> > @@ -13,12 +13,11 @@ SRC_URI =3D "git://git.kernel.org/pub/scm/utils/mda=
dm/mdadm.git;protocol=3Dhttps;bra
> >             file://0001-Fix-the-path-of-corosync-and-dlm-header-files-c=
heck.patch \
> >             file://mdadm.init \
> >             file://0001-Makefile-install-mdcheck.patch \
> > -           file://0001-restripe.c-Use-_FILE_OFFSET_BITS-to-enable-larg=
efile.patch \
> >             file://0002-Create.c-include-linux-falloc.h-for-FALLOC_FL_Z=
ERO_R.patch \
> > -           file://xmalloc.patch \
> > +           file://0001-raid6check.c-restripe.c-Use-64-bit-off_t-across=
-both.patch \
> >             "
>
> You should also remove the two unused patches from git.
>
>
> Also, we have a second issue: I suspect this upgrade is responsible of
> some intermittent reproducibility issue. I already had it twice on my
> branch:
>
> AssertionError: The following deb packages are different and not in exclu=
sion list:
> /srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-ext=
ended/tmp/deploy/deb/./x86-64-v3/mdadm_4.5-r0_amd64.deb
> The following ipk packages are different and not in exclusion list:
> /srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-ext=
ended/tmp/deploy/ipk/./x86-64-v3/mdadm_4.5-r0_x86-64-v3.ipk
> The following rpm packages are different and not in exclusion list:
> /srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-ext=
ended/tmp/deploy/rpm/./x86_64_v3/mdadm-4.5-r0.x86_64_v3.rpm
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/37/builds/3278
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/37/builds/3274
>
> Corresponding diffoscope output can be found here:
>
> https://valkyrie.yocto.io/pub/repro-fail/oe-reproducible-20260129-v__phvn=
k/packages/diff-html/
> https://valkyrie.yocto.io/pub/repro-fail/oe-reproducible-20260129-5hbi93f=
k/packages/diff-html/
>
> It looks like the difference is some path that is sometimes appearing as
> "BINDIR/mdadm" and sometimes as "/sbin/mdadm".
>
> I know these reproducibility issues are not the easiest ones to debug,
> but I would appreciate if you could have a look for obvious failure
> reasons.
>

Thanks for your review, I will look into the issues and try to resolve them=
.

> Thanks,
> Mathieu
>
> --
> Mathieu Dubois-Briand, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>

