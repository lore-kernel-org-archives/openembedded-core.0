Return-Path: <mikko.rapeli@bmw.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB640C433EF
	for <webhook@archiver.kernel.org>; Tue, 11 Jan 2022 07:34:33 +0000 (UTC)
Received: from esa12.hc324-48.eu.iphmx.com (esa12.hc324-48.eu.iphmx.com
 [207.54.72.34])
 by mx.groups.io with SMTP id smtpd.web11.4159.1641886471474608712
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Jan 2022 23:34:32 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bmw.de header.s=mailing1
 header.b=iCbDRF8D;
 spf=pass (domain: bmw.de, ip: 207.54.72.34,
 mailfrom: prvs=0031a2844=mikko.rapeli@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1641886471; x=1673422471;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=IXHsq/RLpJXYKjIQH2uZT4L7c7svFx+6S0uPdMgUmV8=;
  b=iCbDRF8D4Ix57d+OcIP0otdJoOnrA3s02X4rpOIH6p1dsApEOohbdjt2
   TLg1idHlsrIu0mlK2WLytstXPQO3vqU4MaP+H/TQ+tB4tGrRrGfhlh3FC
   J6suspKY3slJOK7gM4sLyDYyqNTaGhCj4eumhqF2X6p2gRm8xcwUy2b81
   8=;
IronPort-SDR: 
 hzJauN+PiscT/+o6ci8U5M5uRahfgYLHQKuV/Wc3WCzKcGoR+uzzg4OhwqoMMTfZyBLDWdvBXp
 aDxU+ZlnxZm2wB/gOsrm6qHG7Gt3Yevwlk48YmbKAd9aKS7HwaxidBHlV8gmwS7FA9VPEmG+0+
 05CHYGQf037mUSWO5yOF5tdqcQobEq9O6VQ4k6jrlm/9zt77sAnUAPaWq8J8jPLdgsih+kC2+7
 huCnVy0n4pzSSqX8EFGs985nunNU/o5AFDVFxjub2VHTg1hAuh/qlxcHklW2xS6fpwPdqRZX7b
 jYbpuXaYOSoP4ysbIjhYcEzW
Received: from esagw1.bmwgroup.com (HELO esagw1.muc) ([160.46.252.34]) by
 esa12.hc324-48.eu.iphmx.com with ESMTP/TLS; 11 Jan 2022 08:34:28 +0100
Received: from esabb4.muc ([160.50.100.33])  by esagw1.muc with ESMTP/TLS;
 11 Jan 2022 08:34:28 +0100
Received: from smucm33k.bmwgroup.net (HELO smucm33k.europe.bmw.corp)
 ([160.46.167.67])
 by esabb4.muc with ESMTP/TLS; 11 Jan 2022 08:34:28 +0100
Received: from smucm33l.europe.bmw.corp (160.46.167.68) by
 smucm33k.europe.bmw.corp
 (160.46.167.67) with Microsoft SMTP Server (TLS;
 Tue, 11 Jan 2022 08:34:27 +0100
Received: from smucm33l.europe.bmw.corp ([160.46.167.68]) by
 smucm33l.europe.bmw.corp ([160.46.167.68]) with mapi id 15.00.1497.026; Tue,
 11 Jan 2022 08:34:27 +0100
From: <Mikko.Rapeli@bmw.de>
To: <steve@sakoman.com>
CC: <Akash.Hadke@kpit.com>, <raj.khem@gmail.com>,
	<openembedded-core@lists.openembedded.org>, <ranjitsinh.rathod@kpit.com>,
	<hadkeakash4@gmail.com>
Subject: Re: [OE-core] [poky][dunfell][PATCH] glibc: Add fix for data races in
 pthread_create and TLS access
Thread-Topic: [OE-core] [poky][dunfell][PATCH] glibc: Add fix for data races
 in pthread_create and TLS access
Thread-Index: AQHX+LMJJPOwZF+MWEyQKZTdPgcNxKxBw1qAgBu1zYA=
Date: Tue, 11 Jan 2022 07:34:27 +0000
Message-ID: <Yd0zAZUFQNz4+yR4@korppu>
References: <1640342548-4520-1-git-send-email-akash.hadke@kpit.com>
 <CAOSpxdbAzun=edOR9fjNfG01upta+N5oFukCPW1MNSmSHsed_A@mail.gmail.com>
In-Reply-To: 
 <CAOSpxdbAzun=edOR9fjNfG01upta+N5oFukCPW1MNSmSHsed_A@mail.gmail.com>
Accept-Language: en-US, de-DE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
Content-Type: text/plain; charset="us-ascii"
Content-ID: <F7E425E38986E64182E37CC4E469B2DD@bmwmail.corp>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Jan 2022 07:34:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160386

On Fri, Dec 24, 2021 at 06:24:43AM -1000, Steve Sakoman wrote:
> On Fri, Dec 24, 2021 at 12:42 AM akash hadke via
> lists.openembedded.org <akash.hadke=3Dkpit.com@lists.openembedded.org>
> wrote:
> >
> > Inconsistency detected by ld.so: dl-tls.c: 493: _dl_allocate_tls_init: =
Assertion `listp->slotinfo[cnt].gen <=3D _rtld_local._dl_tls_generation' fa=
iled!
> > caused by dlopen (in _dl_add_to_slotinfo and in dl_open_worker) doing
> >   listp->slotinfo[idx].gen =3D GL(dl_tls_generation) + 1;
> >   //...
> >   if (any_tls && __builtin_expect (++GL(dl_tls_generation) =3D=3D 0, 0)=
)
> > while pthread_create (in _dl_allocate_tls_init) concurrently doing
> >   assert (listp->slotinfo[cnt].gen <=3D GL(dl_tls_generation));
> >
> > Backported below patch that can fix the following bugs with a lock
> > that prevents DTV setup running concurrently with dlopen or dlclose.
> >
> > Bug 19329: https://sourceware.org/bugzilla/show_bug.cgi?id=3D19329
> > Bug 27111: https://sourceware.org/bugzilla/show_bug.cgi?id=3D27111
> >
> > Patch: 0031-elf-Fix-data-races-in-pthread_create-and-TLS-access-BZ-1932=
9.patch
> > Link: https://sourceware.org/git/?p=3Dglibc.git;a=3Dpatch;h=3D1387ad622=
5c2222f027790e3f460e31aa5dd2c54
> >
> > It requires a supporting patch
> > 0030-elf-Refactor_dl_update-slotinfo-to-avoid-use-after-free.patch
> > Link: https://sourceware.org/git/?p=3Dglibc.git;a=3Dpatch;h=3Dc0669ae1a=
629e16b536bf11cdd0865e0dbcf4bee
> >
> > After adding the above fix there is a number of racy read accesses
> > to globals that will be changed to relaxed MO atomics in follow-up
> > patch given below.
> >
> > This fixes the regressions and avoids cluttering the main part
> > of the fix.
> >
> > 0032-elf-Use-relaxed-atomics-for-racy-accesses-BZ-19329.patch
> > Link: https://sourceware.org/git/?p=3Dglibc.git;a=3Dpatch;h=3Df4f8f4d4e=
0f92488431b268c8cd9555730b9afe9
> >
> > Backported the below patch to add the test to check the added fix.
> > 0033-elf-Add-test-case-for-BZ-19329.patch
> > Link: https://sourceware.org/git/?p=3Dglibc.git;a=3Dpatch;h=3D9d0e30329=
c23b5ad736fda3f174208c25970dbce
> >
> > Previously modids were never resused for a
> > different module, but after dlopen failure all gaps are reused
> > not just the ones caused by the unfinished dlopened.
> >
> > The code has to handle reused modids already which seems to
> > work, however the data races at thread creation and tls access
> > (see bug 19329 and bug 27111) may be more severe if slots are
> > reused. Fixing the races are not simpler if reuse is disallowed
> > and reuse has other benefits so upstream added fix
> > https://sourceware.org/git/?p=3Dglibc.git;a=3Dcommit;h=3D572bd547d57a39=
b6cf0ea072545dc4048921f4c3
> > for the following bug.
> >
> > Bug 27135: https://sourceware.org/bugzilla/show_bug.cgi?id=3D27135
> >
> > But in glibc upstream the commit 572bd547d57a was reverted as the
> > issue with 572bd547d57a patch was the DTV entry only updated on
> > dl_open_worker() with the update_tls_slotinfo() call after all
> > dependencies are being processed by _dl_map_object_deps(). However
> > _dl_map_object_deps() itself might call _dl_next_tls_modid(),
> > and since the _dl_tls_dtv_slotinfo_list::map was not yet set the
> > entry can be wrongly reused.
> >
> > So added below patch to fix Bug 27135.
> > 0034-elf-Fix-DTV-gap-reuse-logic-BZ-27135.patch
> > Link: https://sourceware.org/git/?p=3Dglibc.git;a=3Dpatch;h=3Dba33937be=
210da5d07f7f01709323743f66011ce
> >
> > Not all TLS access related data races got fixed by adding
> > 0031-elf-Fix-data-races-in-pthread_create-and-TLS-access-BZ-19329.patch=
,
> > there are additional races at lazy tlsdesc relocations.
> > Bug 27137: https://sourceware.org/bugzilla/show_bug.cgi?id=3D27137
> >
> > Backported below patches to fix this issue.
> >
> > 0035-x86_64-Avoid-lazy-relocation-of-tlsdesc-BZ-27137.patch
> > Link: https://sourceware.org/git/?p=3Dglibc.git;a=3Dpatch;h=3D8f7e09f4d=
bdb5c815a18b8285fbc5d5d7bc17d86
> >
> > 0036-i386-Avoid-lazy-relocation-of-tlsdesc-BZ-27137.patch
> > Link: https://sourceware.org/git/?p=3Dglibc.git;a=3Dpatch;h=3Dddcacd91c=
c10ff92d6201eda87047d029c14158d
> >
> > The fix 0031-elf-Fix-data-races-in-pthread_create-and-TLS-access-BZ-193=
29.patch
> > for bug 19329 caused a regression such that pthread_create can
> > deadlock when concurrent ctors from dlopen are waiting for it
> > to finish.
> > Bug 28357: https://sourceware.org/bugzilla/show_bug.cgi?id=3D28357
> >
> > Backported below patch to fix this issue.
> > 0037-Avoid-deadlock-between-pthread_create-and-ctors.patch
> > Link: https://sourceware.org/git/?p=3Dglibc.git;a=3Dpatch;h=3D024a7640a=
b9ecea80e527f4e4d7f7a1868e952c5
> >
> > Signed-off-by: Akash Hadke <akash.hadke@kpit.com>
> > Signed-off-by: Akash Hadke <hadkeakash4@gmail.com>
>=20
> This is a quite extensive change set.  I'd like to get Khem's opinion
> as glibc maintainer.  Thoughts, Khem?

If not clear, this fixes a rare crash in dlopen(). Saw this in automated te=
sting
but it is quite rare and non-trivial to hit.

-Mikko=

