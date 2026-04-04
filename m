Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E9F4E88D8E
	for <webhook@archiver.kernel.org>; Sat,  4 Apr 2026 08:16:52 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12640.1775290605093609549
 for <openembedded-core@lists.openembedded.org>;
 Sat, 04 Apr 2026 01:16:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=hrDTgqeA;
 spf=pass (domain: mvista.com, ip: 209.85.208.46, mailfrom: vanusuri@mvista.com)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-66c304dbfd2so1122258a12.0
        for <openembedded-core@lists.openembedded.org>; Sat, 04 Apr 2026 01:16:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775290603; cv=none;
        d=google.com; s=arc-20240605;
        b=IeCXymKLN/ErktYRvxJ6gtjjrIWZNBCKkYoAiJ12A6o3Kt+mvFJQ43c8bXzwbZU++x
         pMgSGJhvaW3NaixuyDisPs4YiQ3iL7vNm5NX2vgyLt8Zs8+L9mUaLIr8M6pedppdSEKa
         NiOVh5N+imZbamayIc7aDipj0F8U6y256r7/RH2/KefTpOQCkAGCun0r98XV/t1q2uW6
         1ixqUjjPPCg292MUXLJvNhGnb2KX4QIW9d8BoR0d+NmkgYYuKRereg/eHoCAES4UDFjH
         yr2lcPjyoGsd458Bkd5xDoHrjoim2ArxZsTV9JFllOqGhuKNq9IMUhgSB5I4gCdd7xCf
         ig2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=hFd5m+AXokr3SVlBkDfJ6ink9/jTwZ+LyqvNC+kinMs=;
        fh=5VpxgiaFCw99hmUxvV+/er63fRX0UWM338mat0ljUv0=;
        b=jKkkzUcU1IG4/6CO4TZgvL8cAPtdEzYq1/r9G5XOphtDIUEYl8gzQypnhLwHkWV/QQ
         LsEjmDv93t3vHxN5AVgQ+8ImWioE4V6Z0HztJSNlpBZtZdjRLCJSRvMVT4BZJAV/l+lJ
         36SZej7PdWJbEpyqWNpCh8dELeoNoHRAqrNR3DYb+sRFaytn8yMbhcrEXj+7V73aL3yK
         H/SaCHihMpGkzU4ucOyKYcR0/3k0ENZ70ANxZd3vgM3t+yAnyaN4/61K/y496GSE1Gl+
         uWtZNQ/5lniTIP9R4VPbw8GSdiE1lbqGM9l0O0tUx5QmRBpukCAWBkegNME5hnI2fx3d
         RcYw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1775290603; x=1775895403; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hFd5m+AXokr3SVlBkDfJ6ink9/jTwZ+LyqvNC+kinMs=;
        b=hrDTgqeA/h8tFImV+JrvQS7VupAXIjHfeO6xXGZtR38rdfvrZggZ1S7FFPMXTfWyat
         fFqYxYTUsrkmFdy0lx82+NtNZKkYC0ivPCs/GDaztLVdL+O8Sd7rmyaYxHqppJVpXspf
         xPXJd9UCEnY/z18ck0DvlaTodLpLR9n/H751Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775290603; x=1775895403;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hFd5m+AXokr3SVlBkDfJ6ink9/jTwZ+LyqvNC+kinMs=;
        b=i9TyGIAidlBe45tA3ISJzgzs5PFXUiQmuN1C20iQSLWlomhIQz6LQum7hEnGP2ECEt
         o8VgeIlZcKlmzmD4G5Juoc5ahnKFrZ2V6OIj1Fd+cqYvPGLWaBfjs5Ppnp21BJsCi86E
         58ho9yGGEIAc73FneyHSeZLVUcDWsh2SjcZvE1MZB9IvqxwpkAP8kpQoYxyCOcYiZlSZ
         92kFS52zsHcPZO3DpfInGjJ4jSHHezOQ8p/AfY2wEaeYnXJD9ZcZR9x+x9mUQxpxwzzs
         ZF5gsfC2afeRRcHCWtWhFFt5ISSPlAlzysfyhDWkTou5ABFC4HRmMVq32afJRn9onI/s
         sLdQ==
X-Gm-Message-State: AOJu0Yy0kKU5mWqA4LJj/ZGjmCU4arKxUBNOLupncLFicvm4JOhUiCZU
	fbPpSPXBLhMYiw6K75xSZtbO1qOrb7DpkzUtuTnn4i2M/VuwsfZKzhJ6fLgvves54shyGsScDVn
	dKycKSGWCMnV7a8+bP01SzX7Dc5zWxYBY99CrDI9i9wCDYt82lBzsxLCVHg==
X-Gm-Gg: AeBDiesRDLXFv55r8Tp/toVdtKiuRcfrjAdq2tmMmg+ezA+iDUjXQbrEPX2tNyA7B1k
	2kmpPf14XHx1r2lzIaenkB13vWvqZ34D/vwZzXVKvSrTy63eYezz14KyNe6vFxqdU9GQusk5aBV
	JXvoxf++FaCKUhhL+2+1a83sNFXxMUweMWHO1Y/Vu/QvoE3Mf3lycsHY6AQdGgyl/RY5deKS45K
	u2L7A2KPk3C6uwQao4GFgDV7yYl9QPqoubL4D7Z9qamGCWNnam11+/MmNFf8BSwlMFiZMSZWoov
	SMm67nKxB9qounDvxVhaBGfuN5WrCD277MV9yt56Cw==
X-Received: by 2002:a05:6402:2c3:b0:66e:a5c2:6d02 with SMTP id
 4fb4d7f45d1cf-66ea5c272a2mr70984a12.17.1775290602979; Sat, 04 Apr 2026
 01:16:42 -0700 (PDT)
MIME-Version: 1.0
References: <20260326075847.312211-1-vanusuri@mvista.com> <DHJV1CGLXDFY.1T23NFX2R5HE8@smile.fr>
In-Reply-To: <DHJV1CGLXDFY.1T23NFX2R5HE8@smile.fr>
From: Vijay Anusuri <vanusuri@mvista.com>
Date: Sat, 4 Apr 2026 13:46:31 +0530
X-Gm-Features: AQROBzAQWMSyB3hrZR3C3eqmS_OTfalUP-YtuQGDF_TZPwHRUtsVBH7c1QotXZo
Message-ID: <CANQUz1_zvRNo3ydbnLHQX50Zp=BrSTugD3qJHR8D7yGPjP7GRg@mail.gmail.com>
Subject: Re: [OE-core][kirkstone][PATCH] libarchive: Fix CVE-2026-4111
To: Yoann Congal <yoann.congal@smile.fr>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000c3994f064e9e0d5b"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 04 Apr 2026 08:16:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234611

--000000000000c3994f064e9e0d5b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Yoann,

This CVE fix already included in libarchive version 3.8.6 on the master
branch.

https://github.com/libarchive/libarchive/releases/tag/v3.8.6 .

I will cherry-pick libarchive-3.8.6 from master and submit the patch to
Whinlatter branch.

Thanks & Regards,
Vijay

On Sat, Apr 4, 2026 at 3:37=E2=80=AFAM Yoann Congal <yoann.congal@smile.fr>=
 wrote:

> On Thu Mar 26, 2026 at 8:58 AM CET, Vijay Anusuri via
> lists.openembedded.org wrote:
> > From: Vijay Anusuri <vanusuri@mvista.com>
> >
> > Pick patch according to [1]
> >
> > [1] https://security-tracker.debian.org/tracker/CVE-2026-4111
> > [2] https://github.com/libarchive/libarchive/pull/2877
> > [3] https://access.redhat.com/errata/RHSA-2026:5080
> >
> > Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> > ---
>
> Hello,
>
> As far as I can tell, this CVE applies to whinlatter and master.
> Since this is the end of kirkstone soon, I'll take it into the reviews
> series but can only merge it if there is a patch sent for this CVE in
> those branches.
>
> Regards,
>
> >  .../libarchive/CVE-2026-4111-1.patch          |  32 ++
> >  .../libarchive/CVE-2026-4111-2.patch          | 308 ++++++++++++++++++
> >  .../libarchive/libarchive_3.6.2.bb            |   2 +
> >  3 files changed, 342 insertions(+)
> >  create mode 100644
> meta/recipes-extended/libarchive/libarchive/CVE-2026-4111-1.patch
> >  create mode 100644
> meta/recipes-extended/libarchive/libarchive/CVE-2026-4111-2.patch
> >
> > diff --git
> a/meta/recipes-extended/libarchive/libarchive/CVE-2026-4111-1.patch
> b/meta/recipes-extended/libarchive/libarchive/CVE-2026-4111-1.patch
> > new file mode 100644
> > index 0000000000..1f065b1364
> > --- /dev/null
> > +++ b/meta/recipes-extended/libarchive/libarchive/CVE-2026-4111-1.patch
> > @@ -0,0 +1,32 @@
> > +From 7273d04803a1e5a482f26d8d0fbaf2b204a72168 Mon Sep 17 00:00:00 2001
> > +From: Tim Kientzle <kientzle@acm.org>
> > +Date: Sun, 1 Mar 2026 20:24:56 -0800
> > +Subject: [PATCH] Reject filters when the block length is nonsensical
> > +
> > +Credit: Grzegorz Antoniak @antekone
> > +
> > +Upstream-Status: Backport [
> https://github.com/libarchive/libarchive/commit/7273d04803a1e5a482f26d8d0=
fbaf2b204a72168
> ]
> > +CVE: CVE-2026-4111
> > +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> > +---
> > + libarchive/archive_read_support_format_rar5.c | 4 +++-
> > + 1 file changed, 3 insertions(+), 1 deletion(-)
> > +
> > +diff --git a/libarchive/archive_read_support_format_rar5.c
> b/libarchive/archive_read_support_format_rar5.c
> > +index 38979cb..867f0a8 100644
> > +--- a/libarchive/archive_read_support_format_rar5.c
> > ++++ b/libarchive/archive_read_support_format_rar5.c
> > +@@ -2914,7 +2914,9 @@ static int parse_filter(struct archive_read* ar,
> const uint8_t* p) {
> > +     if(block_length < 4 ||
> > +         block_length > 0x400000 ||
> > +         filter_type > FILTER_ARM ||
> > +-        !is_valid_filter_block_start(rar, block_start))
> > ++        !is_valid_filter_block_start(rar, block_start) ||
> > ++        (rar->cstate.window_size > 0 &&
> > ++         (ssize_t)block_length > rar->cstate.window_size >> 1))
> > +     {
> > +             archive_set_error(&ar->archive, ARCHIVE_ERRNO_FILE_FORMAT=
,
> > +                 "Invalid filter encountered");
> > +--
> > +2.25.1
> > +
> > diff --git
> a/meta/recipes-extended/libarchive/libarchive/CVE-2026-4111-2.patch
> b/meta/recipes-extended/libarchive/libarchive/CVE-2026-4111-2.patch
> > new file mode 100644
> > index 0000000000..243a03a8e5
> > --- /dev/null
> > +++ b/meta/recipes-extended/libarchive/libarchive/CVE-2026-4111-2.patch
> > @@ -0,0 +1,308 @@
> > +From ef53e2023d75a205cf7cbddb5d01c4cc592e9ce4 Mon Sep 17 00:00:00 2001
> > +From: Tim Kientzle <kientzle@acm.org>
> > +Date: Sun, 1 Mar 2026 10:04:01 -0800
> > +Subject: [PATCH] Infinite loop in Rar5 decompression
> > +
> > +Found by: Elhanan Haenel
> > +
> > +Upstream-Status: Backport [
> https://github.com/libarchive/libarchive/commit/ef53e2023d75a205cf7cbddb5=
d01c4cc592e9ce4
> ]
> > +CVE: CVE-2026-4111
> > +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> > +---
> > + Makefile.am                                   |   2 +
> > + libarchive/test/CMakeLists.txt                |   1 +
> > + .../test/test_read_format_rar5_loop_bug.c     |  53 +++++
> > + .../test_read_format_rar5_loop_bug.rar.uu     | 189 +++++++++++++++++=
+
> > + 4 files changed, 245 insertions(+)
> > + create mode 100644 libarchive/test/test_read_format_rar5_loop_bug.c
> > + create mode 100644
> libarchive/test/test_read_format_rar5_loop_bug.rar.uu
> > +
> > +diff --git a/Makefile.am b/Makefile.am
> > +index dd1620d..14edb2a 100644
> > +--- a/Makefile.am
> > ++++ b/Makefile.am
> > +@@ -507,6 +507,7 @@ libarchive_test_SOURCES=3D \
> > +     libarchive/test/test_read_format_rar_invalid1.c \
> > +     libarchive/test/test_read_format_rar_overflow.c \
> > +     libarchive/test/test_read_format_rar5.c \
> > ++    libarchive/test/test_read_format_rar5_loop_bug.c \
> > +     libarchive/test/test_read_format_raw.c \
> > +     libarchive/test/test_read_format_tar.c \
> > +     libarchive/test/test_read_format_tar_concatenated.c \
> > +@@ -869,6 +870,7 @@ libarchive_test_EXTRA_DIST=3D\
> > +
>  libarchive/test/test_read_format_rar5_invalid_dict_reference.rar.uu \
> > +     libarchive/test/test_read_format_rar5_leftshift1.rar.uu \
> > +     libarchive/test/test_read_format_rar5_leftshift2.rar.uu \
> > ++    libarchive/test/test_read_format_rar5_loop_bug.rar.uu \
> > +     libarchive/test/test_read_format_rar5_multiarchive.part01.rar.uu =
\
> > +     libarchive/test/test_read_format_rar5_multiarchive.part02.rar.uu =
\
> > +     libarchive/test/test_read_format_rar5_multiarchive.part03.rar.uu =
\
> > +diff --git a/libarchive/test/CMakeLists.txt
> b/libarchive/test/CMakeLists.txt
> > +index 05c6fd7..c8f2e90 100644
> > +--- a/libarchive/test/CMakeLists.txt
> > ++++ b/libarchive/test/CMakeLists.txt
> > +@@ -156,6 +156,7 @@ IF(ENABLE_TEST)
> > +     test_read_format_rar_filter.c
> > +     test_read_format_rar_overflow.c
> > +     test_read_format_rar5.c
> > ++    test_read_format_rar5_loop_bug.c
> > +     test_read_format_raw.c
> > +     test_read_format_tar.c
> > +     test_read_format_tar_concatenated.c
> > +diff --git a/libarchive/test/test_read_format_rar5_loop_bug.c
> b/libarchive/test/test_read_format_rar5_loop_bug.c
> > +new file mode 100644
> > +index 0000000..77dd78c
> > +--- /dev/null
> > ++++ b/libarchive/test/test_read_format_rar5_loop_bug.c
> > +@@ -0,0 +1,53 @@
> > ++/*-
> > ++ * Copyright (c) 2026 Tim Kientzle
> > ++ * All rights reserved.
> > ++ *
> > ++ * Redistribution and use in source and binary forms, with or without
> > ++ * modification, are permitted provided that the following conditions
> > ++ * are met:
> > ++ * 1. Redistributions of source code must retain the above copyright
> > ++ *    notice, this list of conditions and the following disclaimer.
> > ++ * 2. Redistributions in binary form must reproduce the above copyrig=
ht
> > ++ *    notice, this list of conditions and the following disclaimer in
> the
> > ++ *    documentation and/or other materials provided with the
> distribution.
> > ++ *
> > ++ * THIS SOFTWARE IS PROVIDED BY THE AUTHOR(S) ``AS IS'' AND ANY
> EXPRESS OR
> > ++ * IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
> WARRANTIES
> > ++ * OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
> DISCLAIMED.
> > ++ * IN NO EVENT SHALL THE AUTHOR(S) BE LIABLE FOR ANY DIRECT, INDIRECT=
,
> > ++ * INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
> (INCLUDING, BUT
> > ++ * NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS
> OF USE,
> > ++ * DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON
> ANY
> > ++ * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TOR=
T
> > ++ * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE
> USE OF
> > ++ * THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
> > ++ */
> > ++#include "test.h"
> > ++
> > ++DEFINE_TEST(test_read_format_rar5_loop_bug)
> > ++{
> > ++  const char *reffile =3D "test_read_format_rar5_loop_bug.rar";
> > ++  struct archive_entry *ae;
> > ++  struct archive *a;
> > ++  const void *buf;
> > ++  size_t size;
> > ++  la_int64_t offset;
> > ++
> > ++  extract_reference_file(reffile);
> > ++  assert((a =3D archive_read_new()) !=3D NULL);
> > ++  assertEqualIntA(a, ARCHIVE_OK, archive_read_support_filter_all(a));
> > ++  assertEqualIntA(a, ARCHIVE_OK, archive_read_support_format_all(a));
> > ++  assertEqualIntA(a, ARCHIVE_OK, archive_read_open_filename(a,
> reffile, 10240));
> > ++
> > ++  // This has just one entry
> > ++  assertEqualIntA(a, ARCHIVE_OK, archive_read_next_header(a, &ae));
> > ++
> > ++  // Read blocks until the end of the entry
> > ++  while (ARCHIVE_OK =3D=3D archive_read_data_block(a, &buf, &size,
> &offset)) {
> > ++  }
> > ++
> > ++  assertEqualIntA(a, ARCHIVE_EOF, archive_read_next_header(a, &ae));
> > ++
> > ++  assertEqualIntA(a, ARCHIVE_OK, archive_read_close(a));
> > ++  assertEqualInt(ARCHIVE_OK, archive_free(a));
> > ++}
> > +diff --git a/libarchive/test/test_read_format_rar5_loop_bug.rar.uu
> b/libarchive/test/test_read_format_rar5_loop_bug.rar.uu
> > +new file mode 100644
> > +index 0000000..3e47004
> > +--- /dev/null
> > ++++ b/libarchive/test/test_read_format_rar5_loop_bug.rar.uu
> > +@@ -0,0 +1,189 @@
> > ++begin 644 test_read_format_rar5_loop_bug.rar
> > ++M4F%R(1H'`0#%&C,R`P$``)T-9%L.`@+P0`"`@`P`@`,``6'(WFP@`?\7_U/^
> > ++M8@!.`B`H````````````````````````````````````````````````````
> > ++M````````````````````````````````````````````````````````````
> > ++M````````````````````````````````````````````````````````````
> > ++M````````````````````````````````````````````````````````````
> > ++M````````````````````````````````````````````````````````````
> > ++M````````````````````````````````````````````````````````````
> > ++M````````````````````````````````````````````````````````````
> > ++M````````````````````````````````````````````````````````````
> > ++M````````````````````````````````````````````````````````````
> > ++M````````````````````````````````````````````````````````````
> > ++M````````````````````````````````````````````````````````````
> > ++M````````````````````````````````````````````````````````````
> > ++M````````````````````````````````````````````````````````````
> > ++M````````````````````````````````````````````````````````````
> > ++M````````````````````````````````````````````````````````````
> > ++M````````````````````````````````````````````````````````````
> > ++M````````````````````````````````````````````````````````````
> > ++M````````````````````````````````````````````````````````````
> > ++M````````````````````````````````````````````````````````````
> > ++M````````````````````````````````````````````````````````````
> > ++M````````````````````````````````````````````````````````````
> > ++M````````````````````````````````````````````````````````````
> > ++M````````````````````````````````````````````````````````````
> > ++M````````````````````````````````````````````````````````````
> > ++M````````````````````````````````````````````````````````````
> > ++M````````````````````````````````````````````````````````````
> > ++M````````````````````````````````````````````````````````````
> > ++M````````````````````````````````````````````````````````````
> > ++M````````````````````````````````````````````````````````````
> > ++M````````````````````````````````````````````````````````````
> > ++M````````````````````````````````````````````````````````````
> > ++M````````````````````````````````````````````````````````````
> > ++M````````````````````````````````````````````````````````````
> > ++M````````````````````````````````````````````````````````````
> > ++M````````````````````````````````````````````````````````````
> > ++M````````````````````````````````````````````````````````````
> > ++M````````````````````````````````````````````````````````````
> > ++M````````````````````````````````````````````````````````````
> > ++M````````````````````````````````````````````````````````````
> > ++M````````````````````````````````````````````````````````````
> > ++M````````````````````````````````````````````````````````````
> > ++M````````````````````````````````````````````````````````````
> > ++M````````````````````````````````````````````````````````````
> > ++M````````````````````````````````````````````````````````````
> > ++M````````````````````````````````````````````````````````````
> > ++M````````````````````````````````````````````````````````````
> > ++M````````````````````````````````````````````````````````````
> > ++M````````````````````````````````````````````````````````````
> > ++M````````````````````````````````````````````````````````````
> > ++M````````````````````````````````````````````````````````````
> > ++M````````````````````````````````````````````````````````````
> > ++M````````````````````````````````````````````````````````````
> > ++M````````````````````````````````````````````````````````````
> > ++M````````````````````````````````````````````````````````````
> > ++M````````````````````````````````````````````````````````````
> > ++M````````````````````````````````````````````````````````````
> > ++M````````````````````````````````````````````````````````````
> > ++M````````````````````````````````````````````````````````````
> > ++M````````````````````````````````````````````````````````````
> > ++M````````````````````````````````````````````````````````````
> > ++M````````````````````````````````````````````````````````````
> > ++M````````````````````````````````````````````````````````````
> > ++M````````````````````````````````````````````````````````````
> > ++M````````````````````````````````````````````````````````````
> > ++M````````````````````````````````````````````````````````````
> > ++M````````````````````````````````````````````````````````````
> > ++M````````````````````````````````````````````````````````````
> > ++M````````````````````````````````````````````````````````````
> > ++M````````````````````````````````````````````````````````````
> > ++M````````````````````````````````````````````````````````````
> > ++M````````````````````````````````````````````````````````````
> > ++M````````````````````````````````````````````````````````````
> > ++M````````````````````````````````````````````````````````````
> > ++M````````````````````````````````````````````````````````````
> > ++M````````````````````````````````````````````````````````````
> > ++M````````````````````````````````````````````````````````````
> > ++M````````````````````````````````````````````````````````````
> > ++M````````````````````````````````````````````````````````````
> > ++M````````````````````````````````````````````````````````````
> > ++M````````````````````````````````````````````````````````````
> > ++M````````````````````````````````````````````````````````````
> > ++M````````````````````````````````````````````````````````````
> > ++M````````````````````````````````````````````````````````````
> > ++M````````````````````````````````````````````````````````````
> > ++M````````````````````````````````````````````````````````````
> > ++M````````````````````````````````````````````````````````````
> > ++M````````````````````````````````````````````````````````````
> > ++M````````````````````````````````````````````````````````````
> > ++M````````````````````````````````````````````````````````````
> > ++M````````````````````````````````````````````````````````````
> > ++M````````````````````````````````````````````````````````````
> > ++M````````````````````````````````````````````````````````````
> > ++M````````````````````````````````````````````````````````````
> > ++M````````````````````````````````````````````````````````````
> > ++M````````````````````````````````````````````````````````````
> > ++M````````````````````````````````````````````````````````````
> > ++M````````````````````````````````````````````````````````````
> > ++M````````````````````````````````````````````````````````````
> > ++M````````````````````````````````````````````````````````````
> > ++M````````````````````````````````````````````````````````````
> > ++M````````````````````````````````````````````````````````````
> > ++M````````````````````````````````````````````````````````````
> > ++M````````````````````````````````````````````````````````````
> > ++M````````````````````````````````````````````````````````````
> > ++M````````````````````````````````````````````````````````````
> > ++M````````````````````````````````````````````````````````````
> > ++M````````````````````````````````````````````````````````````
> > ++M````````````````````````````````````````````````````````````
> > ++M````````````````````````````````````````````````````````````
> > ++M````````````````````````````````````````````````````````````
> > ++M````````````````````````````````````````````````````````````
> > ++M````````````````````````````````````````````````````````````
> > ++M````````````````````````````````````````````````````````````
> > ++M````````````````````````````````````````````````````````````
> > ++M````````````````````````````````````````````````````````````
> > ++M````````````````````````````````````````````````````````````
> > ++M````````````````````````````````````````````````````````````
> > ++M````````````````````````````````````````````````````````````
> > ++M````````````````````````````````````````````````````````````
> > ++M````````````````````````````````````````````````````````````
> > ++M````````````````````````````````````````````````````````````
> > ++M````````````````````````````````````````````````````````````
> > ++M````````````````````````````````````````````````````````````
> > ++M````````````````````````````````````````````````````````````
> > ++M````````````````````````````````````````````````````````````
> > ++M````````````````````````````````````````````````````````````
> > ++M````````````````````````````````````````````````````````````
> > ++M````````````````````````````````````````````````````````````
> > ++M````````````````````````````````````````````````````````````
> > ++M````````````````````````````````````````````````````````````
> > ++M````````````````````````````````````````````````````````````
> > ++M````````````````````````````````````````````````````````````
> > ++M````````````````````````````````````````````````````````````
> > ++M````````````````````````````````````````````````````````````
> > ++M````````````````````````````````````````````````````````````
> > ++M````````````````````````````````````````````````````````````
> > ++M````````````````````````````````````````````````````````````
> > ++M````````````````````````````````````````````````````````````
> > ++M````````````````````````````````````````````````````````````
> > ++M````````````````````````````````````````````````````````````
> > ++M````````````````````````````````````````````````````````````
> > ++M````````````````````````````````````````````````````````````
> > ++M````````````````````````````````````````````````````````````
> > ++M````````````````````````````````````````````````````````````
> > ++M````````````````````````````````````````````````````````````
> > ++M````````````````````````````````````````````````````````````
> > ++M````````````````````````````````````````````````````````````
> > ++M````````````````````````````````````````````````````````````
> > ++M````````````````````````````````````````````````````````````
> > ++M````````````````````````````````````````````````````````````
> > ++M````````````````````````````````````````````````````````````
> > ++M````````````````````````````````````````````````````````````
> > ++M````````````````````````````````````````````````````````````
> > ++M````````````````````````````````````````````````````````````
> > ++M````````````````````````````````````````````````````````````
> > ++M````````````````````````````````````````````````````````````
> > ++M````````````````````````````````````````````````````````````
> > ++M````````````````````````````````````````````````````````````
> > ++M````````````````````````````````````````````````````````````
> > ++M````````````````````````````````````````````````````````````
> > ++M````````````````````````````````````````````````````````````
> > ++M````````````````````````````````````````````````````````````
> > ++M````````````````````````````````````````````````````````````
> > ++M````````````````````````````````````````````````````````````
> > ++M````````````````````````````````````````````````````````````
> > ++M````````````````````````````````````````````````````````````
> > ++M````````````````````````````````````````````````````````````
> > ++M````````````````````````````````````````````````````````````
> > ++M````````````````````````````````````````````````````````````
> > ++M````````````````````````````````````````````````````````````
> > ++M````````````````````````````````````````````````````````````
> > ++M````````````````````````````````````````````````````````````
> > ++M````````````````````````````````````````````````````````````
> > ++M````````````````````````````````````````````````````````````
> > ++M````````````````````````````````````````````````````````````
> > ++M````````````````````````````````````````````````````````````
> > ++M````````````````````````````````````````````````````````````
> > ++M````````````````````````````````````````````````````````````
> > ++M````````````````````````````````````````````````````````````
> > ++M````````````````````````````````````````````````````````````
> > ++M````````````````````````````````````````````````````````````
> > ++M````````````````````````````````````````````````````````````
> > ++M````````````````````````````````````````````````````````````
> > ++M````````````````````````````````````````````````````````````
> > ++5```````````````````Y^;*!`@4`
> > ++`
> > ++end
> > +--
> > +2.25.1
> > +
> > diff --git a/meta/recipes-extended/libarchive/libarchive_3.6.2.bb
> b/meta/recipes-extended/libarchive/libarchive_3.6.2.bb
> > index e74326b40f..85fe6e5baa 100644
> > --- a/meta/recipes-extended/libarchive/libarchive_3.6.2.bb
> > +++ b/meta/recipes-extended/libarchive/libarchive_3.6.2.bb
> > @@ -50,6 +50,8 @@ SRC_URI =3D "
> http://libarchive.org/downloads/libarchive-${PV}.tar.gz \
> >
>  file://0001-Merge-pull-request-2768-from-Commandoss-master.patch \
> >             file://CVE-2025-60753-01.patch \
> >             file://CVE-2025-60753-02.patch \
> > +           file://CVE-2026-4111-1.patch \
> > +           file://CVE-2026-4111-2.patch \
> >             "
> >  UPSTREAM_CHECK_URI =3D "http://libarchive.org/"
> >
>
>
> --
> Yoann Congal
> Smile ECS
>
>

--000000000000c3994f064e9e0d5b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div><div>Hi Yoann,<br><br></div>This CVE fix al=
ready included in libarchive version 3.8.6 on the master branch.<br><br><a =
href=3D"https://github.com/libarchive/libarchive/releases/tag/v3.8.6">https=
://github.com/libarchive/libarchive/releases/tag/v3.8.6</a> .<br><br></div>=
I will cherry-pick libarchive-3.8.6 from master and submit the patch to Whi=
nlatter branch.<br><br></div>Thanks &amp; Regards,<br></div>Vijay</div><br>=
<div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"=
gmail_attr">On Sat, Apr 4, 2026 at 3:37=E2=80=AFAM Yoann Congal &lt;<a href=
=3D"mailto:yoann.congal@smile.fr">yoann.congal@smile.fr</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">On Thu Mar 26, 2026 =
at 8:58 AM CET, Vijay Anusuri via <a href=3D"http://lists.openembedded.org"=
 rel=3D"noreferrer" target=3D"_blank">lists.openembedded.org</a> wrote:<br>
&gt; From: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.com" target=
=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
&gt;<br>
&gt; Pick patch according to [1]<br>
&gt;<br>
&gt; [1] <a href=3D"https://security-tracker.debian.org/tracker/CVE-2026-41=
11" rel=3D"noreferrer" target=3D"_blank">https://security-tracker.debian.or=
g/tracker/CVE-2026-4111</a><br>
&gt; [2] <a href=3D"https://github.com/libarchive/libarchive/pull/2877" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/libarchive/libarchive/=
pull/2877</a><br>
&gt; [3] <a href=3D"https://access.redhat.com/errata/RHSA-2026:5080" rel=3D=
"noreferrer" target=3D"_blank">https://access.redhat.com/errata/RHSA-2026:5=
080</a><br>
&gt;<br>
&gt; Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.com=
" target=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
&gt; ---<br>
<br>
Hello,<br>
<br>
As far as I can tell, this CVE applies to whinlatter and master.<br>
Since this is the end of kirkstone soon, I&#39;ll take it into the reviews<=
br>
series but can only merge it if there is a patch sent for this CVE in<br>
those branches.<br>
<br>
Regards,<br>
<br>
&gt;=C2=A0 .../libarchive/CVE-2026-4111-1.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 32 ++<br>
&gt;=C2=A0 .../libarchive/CVE-2026-4111-2.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | 308 ++++++++++++++++++<br>
&gt;=C2=A0 .../libarchive/<a href=3D"http://libarchive_3.6.2.bb" rel=3D"nor=
eferrer" target=3D"_blank">libarchive_3.6.2.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +<br>
&gt;=C2=A0 3 files changed, 342 insertions(+)<br>
&gt;=C2=A0 create mode 100644 meta/recipes-extended/libarchive/libarchive/C=
VE-2026-4111-1.patch<br>
&gt;=C2=A0 create mode 100644 meta/recipes-extended/libarchive/libarchive/C=
VE-2026-4111-2.patch<br>
&gt;<br>
&gt; diff --git a/meta/recipes-extended/libarchive/libarchive/CVE-2026-4111=
-1.patch b/meta/recipes-extended/libarchive/libarchive/CVE-2026-4111-1.patc=
h<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..1f065b1364<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-extended/libarchive/libarchive/CVE-2026-4111-1.patc=
h<br>
&gt; @@ -0,0 +1,32 @@<br>
&gt; +From 7273d04803a1e5a482f26d8d0fbaf2b204a72168 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Tim Kientzle &lt;<a href=3D"mailto:kientzle@acm.org" target=3D"=
_blank">kientzle@acm.org</a>&gt;<br>
&gt; +Date: Sun, 1 Mar 2026 20:24:56 -0800<br>
&gt; +Subject: [PATCH] Reject filters when the block length is nonsensical<=
br>
&gt; +<br>
&gt; +Credit: Grzegorz Antoniak @antekone<br>
&gt; +<br>
&gt; +Upstream-Status: Backport [<a href=3D"https://github.com/libarchive/l=
ibarchive/commit/7273d04803a1e5a482f26d8d0fbaf2b204a72168" rel=3D"noreferre=
r" target=3D"_blank">https://github.com/libarchive/libarchive/commit/7273d0=
4803a1e5a482f26d8d0fbaf2b204a72168</a>]<br>
&gt; +CVE: CVE-2026-4111<br>
&gt; +Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.co=
m" target=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
&gt; +---<br>
&gt; + libarchive/archive_read_support_format_rar5.c | 4 +++-<br>
&gt; + 1 file changed, 3 insertions(+), 1 deletion(-)<br>
&gt; +<br>
&gt; +diff --git a/libarchive/archive_read_support_format_rar5.c b/libarchi=
ve/archive_read_support_format_rar5.c<br>
&gt; +index 38979cb..867f0a8 100644<br>
&gt; +--- a/libarchive/archive_read_support_format_rar5.c<br>
&gt; ++++ b/libarchive/archive_read_support_format_rar5.c<br>
&gt; +@@ -2914,7 +2914,9 @@ static int parse_filter(struct archive_read* ar=
, const uint8_t* p) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if(block_length &lt; 4 ||<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0block_length &gt; 0x400000 ||<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0filter_type &gt; FILTER_ARM ||<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 !is_valid_filter_block_start(rar, block_=
start))<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 !is_valid_filter_block_start(rar, block_=
start) ||<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 (rar-&gt;cstate.window_size &gt; 0 &amp;=
&amp;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(ssize_t)block_length &gt; rar-&gt=
;cstate.window_size &gt;&gt; 1))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0archive_set_error(&am=
p;ar-&gt;archive, ARCHIVE_ERRNO_FILE_FORMAT,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;I=
nvalid filter encountered&quot;);<br>
&gt; +-- <br>
&gt; +2.25.1<br>
&gt; +<br>
&gt; diff --git a/meta/recipes-extended/libarchive/libarchive/CVE-2026-4111=
-2.patch b/meta/recipes-extended/libarchive/libarchive/CVE-2026-4111-2.patc=
h<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..243a03a8e5<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-extended/libarchive/libarchive/CVE-2026-4111-2.patc=
h<br>
&gt; @@ -0,0 +1,308 @@<br>
&gt; +From ef53e2023d75a205cf7cbddb5d01c4cc592e9ce4 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Tim Kientzle &lt;<a href=3D"mailto:kientzle@acm.org" target=3D"=
_blank">kientzle@acm.org</a>&gt;<br>
&gt; +Date: Sun, 1 Mar 2026 10:04:01 -0800<br>
&gt; +Subject: [PATCH] Infinite loop in Rar5 decompression<br>
&gt; +<br>
&gt; +Found by: Elhanan Haenel<br>
&gt; +<br>
&gt; +Upstream-Status: Backport [<a href=3D"https://github.com/libarchive/l=
ibarchive/commit/ef53e2023d75a205cf7cbddb5d01c4cc592e9ce4" rel=3D"noreferre=
r" target=3D"_blank">https://github.com/libarchive/libarchive/commit/ef53e2=
023d75a205cf7cbddb5d01c4cc592e9ce4</a>]<br>
&gt; +CVE: CVE-2026-4111<br>
&gt; +Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.co=
m" target=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
&gt; +---<br>
&gt; + Makefile.am=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=
=A0 =C2=A02 +<br>
&gt; + libarchive/test/CMakeLists.txt=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A01 +<br>
&gt; + .../test/test_read_format_rar5_loop_bug.c=C2=A0 =C2=A0 =C2=A0|=C2=A0=
 53 +++++<br>
&gt; + .../test_read_format_rar5_loop_bug.rar.uu=C2=A0 =C2=A0 =C2=A0| 189 +=
+++++++++++++++++<br>
&gt; + 4 files changed, 245 insertions(+)<br>
&gt; + create mode 100644 libarchive/test/test_read_format_rar5_loop_bug.c<=
br>
&gt; + create mode 100644 libarchive/test/test_read_format_rar5_loop_bug.ra=
r.uu<br>
&gt; +<br>
&gt; +diff --git a/Makefile.am b/Makefile.am<br>
&gt; +index dd1620d..14edb2a 100644<br>
&gt; +--- a/Makefile.am<br>
&gt; ++++ b/Makefile.am<br>
&gt; +@@ -507,6 +507,7 @@ libarchive_test_SOURCES=3D \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0libarchive/test/test_read_format_rar_invalid1.c \=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0libarchive/test/test_read_format_rar_overflow.c \=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0libarchive/test/test_read_format_rar5.c \<br>
&gt; ++=C2=A0 =C2=A0 libarchive/test/test_read_format_rar5_loop_bug.c \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0libarchive/test/test_read_format_raw.c \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0libarchive/test/test_read_format_tar.c \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0libarchive/test/test_read_format_tar_concatenated=
.c \<br>
&gt; +@@ -869,6 +870,7 @@ libarchive_test_EXTRA_DIST=3D\<br>
&gt; +=C2=A0 =C2=A0 =C2=A0libarchive/test/test_read_format_rar5_invalid_dic=
t_reference.rar.uu \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0libarchive/test/test_read_format_rar5_leftshift1.=
rar.uu \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0libarchive/test/test_read_format_rar5_leftshift2.=
rar.uu \<br>
&gt; ++=C2=A0 =C2=A0 libarchive/test/test_read_format_rar5_loop_bug.rar.uu =
\<br>
&gt; +=C2=A0 =C2=A0 =C2=A0libarchive/test/test_read_format_rar5_multiarchiv=
e.part01.rar.uu \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0libarchive/test/test_read_format_rar5_multiarchiv=
e.part02.rar.uu \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0libarchive/test/test_read_format_rar5_multiarchiv=
e.part03.rar.uu \<br>
&gt; +diff --git a/libarchive/test/CMakeLists.txt b/libarchive/test/CMakeLi=
sts.txt<br>
&gt; +index 05c6fd7..c8f2e90 100644<br>
&gt; +--- a/libarchive/test/CMakeLists.txt<br>
&gt; ++++ b/libarchive/test/CMakeLists.txt<br>
&gt; +@@ -156,6 +156,7 @@ IF(ENABLE_TEST)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0test_read_format_rar_filter.c<br>
&gt; +=C2=A0 =C2=A0 =C2=A0test_read_format_rar_overflow.c<br>
&gt; +=C2=A0 =C2=A0 =C2=A0test_read_format_rar5.c<br>
&gt; ++=C2=A0 =C2=A0 test_read_format_rar5_loop_bug.c<br>
&gt; +=C2=A0 =C2=A0 =C2=A0test_read_format_raw.c<br>
&gt; +=C2=A0 =C2=A0 =C2=A0test_read_format_tar.c<br>
&gt; +=C2=A0 =C2=A0 =C2=A0test_read_format_tar_concatenated.c<br>
&gt; +diff --git a/libarchive/test/test_read_format_rar5_loop_bug.c b/libar=
chive/test/test_read_format_rar5_loop_bug.c<br>
&gt; +new file mode 100644<br>
&gt; +index 0000000..77dd78c<br>
&gt; +--- /dev/null<br>
&gt; ++++ b/libarchive/test/test_read_format_rar5_loop_bug.c<br>
&gt; +@@ -0,0 +1,53 @@<br>
&gt; ++/*-<br>
&gt; ++ * Copyright (c) 2026 Tim Kientzle<br>
&gt; ++ * All rights reserved.<br>
&gt; ++ *<br>
&gt; ++ * Redistribution and use in source and binary forms, with or withou=
t<br>
&gt; ++ * modification, are permitted provided that the following condition=
s<br>
&gt; ++ * are met:<br>
&gt; ++ * 1. Redistributions of source code must retain the above copyright=
<br>
&gt; ++ *=C2=A0 =C2=A0 notice, this list of conditions and the following di=
sclaimer.<br>
&gt; ++ * 2. Redistributions in binary form must reproduce the above copyri=
ght<br>
&gt; ++ *=C2=A0 =C2=A0 notice, this list of conditions and the following di=
sclaimer in the<br>
&gt; ++ *=C2=A0 =C2=A0 documentation and/or other materials provided with t=
he distribution.<br>
&gt; ++ *<br>
&gt; ++ * THIS SOFTWARE IS PROVIDED BY THE AUTHOR(S) ``AS IS&#39;&#39; AND =
ANY EXPRESS OR<br>
&gt; ++ * IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WA=
RRANTIES<br>
&gt; ++ * OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCL=
AIMED.<br>
&gt; ++ * IN NO EVENT SHALL THE AUTHOR(S) BE LIABLE FOR ANY DIRECT, INDIREC=
T,<br>
&gt; ++ * INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDI=
NG, BUT<br>
&gt; ++ * NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS=
 OF USE,<br>
&gt; ++ * DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON=
 ANY<br>
&gt; ++ * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TO=
RT<br>
&gt; ++ * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE=
 USE OF<br>
&gt; ++ * THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.=
<br>
&gt; ++ */<br>
&gt; ++#include &quot;test.h&quot;<br>
&gt; ++<br>
&gt; ++DEFINE_TEST(test_read_format_rar5_loop_bug)<br>
&gt; ++{<br>
&gt; ++=C2=A0 const char *reffile =3D &quot;test_read_format_rar5_loop_bug.=
rar&quot;;<br>
&gt; ++=C2=A0 struct archive_entry *ae;<br>
&gt; ++=C2=A0 struct archive *a;<br>
&gt; ++=C2=A0 const void *buf;<br>
&gt; ++=C2=A0 size_t size;<br>
&gt; ++=C2=A0 la_int64_t offset;<br>
&gt; ++<br>
&gt; ++=C2=A0 extract_reference_file(reffile);<br>
&gt; ++=C2=A0 assert((a =3D archive_read_new()) !=3D NULL);<br>
&gt; ++=C2=A0 assertEqualIntA(a, ARCHIVE_OK, archive_read_support_filter_al=
l(a));<br>
&gt; ++=C2=A0 assertEqualIntA(a, ARCHIVE_OK, archive_read_support_format_al=
l(a));<br>
&gt; ++=C2=A0 assertEqualIntA(a, ARCHIVE_OK, archive_read_open_filename(a, =
reffile, 10240));<br>
&gt; ++<br>
&gt; ++=C2=A0 // This has just one entry<br>
&gt; ++=C2=A0 assertEqualIntA(a, ARCHIVE_OK, archive_read_next_header(a, &a=
mp;ae));<br>
&gt; ++<br>
&gt; ++=C2=A0 // Read blocks until the end of the entry<br>
&gt; ++=C2=A0 while (ARCHIVE_OK =3D=3D archive_read_data_block(a, &amp;buf,=
 &amp;size, &amp;offset)) {<br>
&gt; ++=C2=A0 }<br>
&gt; ++<br>
&gt; ++=C2=A0 assertEqualIntA(a, ARCHIVE_EOF, archive_read_next_header(a, &=
amp;ae));<br>
&gt; ++<br>
&gt; ++=C2=A0 assertEqualIntA(a, ARCHIVE_OK, archive_read_close(a));<br>
&gt; ++=C2=A0 assertEqualInt(ARCHIVE_OK, archive_free(a));<br>
&gt; ++}<br>
&gt; +diff --git a/libarchive/test/test_read_format_rar5_loop_bug.rar.uu b/=
libarchive/test/test_read_format_rar5_loop_bug.rar.uu<br>
&gt; +new file mode 100644<br>
&gt; +index 0000000..3e47004<br>
&gt; +--- /dev/null<br>
&gt; ++++ b/libarchive/test/test_read_format_rar5_loop_bug.rar.uu<br>
&gt; +@@ -0,0 +1,189 @@<br>
&gt; ++begin 644 test_read_format_rar5_loop_bug.rar<br>
&gt; ++M4F%R(1H&#39;`0#%&amp;C,R`P$``)T-9%L.`@+P0`&quot;`@`P`@`,``6&#39;(WF=
P@`?\7_U/^<br>
&gt; ++M8@!.`B`H````````````````````````````````````````````````````<br>
&gt; ++M````````````````````````````````````````````````````````````<br>
&gt; ++M````````````````````````````````````````````````````````````<br>
&gt; ++M````````````````````````````````````````````````````````````<br>
&gt; ++M````````````````````````````````````````````````````````````<br>
&gt; ++M````````````````````````````````````````````````````````````<br>
&gt; ++M````````````````````````````````````````````````````````````<br>
&gt; ++M````````````````````````````````````````````````````````````<br>
&gt; ++M````````````````````````````````````````````````````````````<br>
&gt; ++M````````````````````````````````````````````````````````````<br>
&gt; ++M````````````````````````````````````````````````````````````<br>
&gt; ++M````````````````````````````````````````````````````````````<br>
&gt; ++M````````````````````````````````````````````````````````````<br>
&gt; ++M````````````````````````````````````````````````````````````<br>
&gt; ++M````````````````````````````````````````````````````````````<br>
&gt; ++M````````````````````````````````````````````````````````````<br>
&gt; ++M````````````````````````````````````````````````````````````<br>
&gt; ++M````````````````````````````````````````````````````````````<br>
&gt; ++M````````````````````````````````````````````````````````````<br>
&gt; ++M````````````````````````````````````````````````````````````<br>
&gt; ++M````````````````````````````````````````````````````````````<br>
&gt; ++M````````````````````````````````````````````````````````````<br>
&gt; ++M````````````````````````````````````````````````````````````<br>
&gt; ++M````````````````````````````````````````````````````````````<br>
&gt; ++M````````````````````````````````````````````````````````````<br>
&gt; ++M````````````````````````````````````````````````````````````<br>
&gt; ++M````````````````````````````````````````````````````````````<br>
&gt; ++M````````````````````````````````````````````````````````````<br>
&gt; ++M````````````````````````````````````````````````````````````<br>
&gt; ++M````````````````````````````````````````````````````````````<br>
&gt; ++M````````````````````````````````````````````````````````````<br>
&gt; ++M````````````````````````````````````````````````````````````<br>
&gt; ++M````````````````````````````````````````````````````````````<br>
&gt; ++M````````````````````````````````````````````````````````````<br>
&gt; ++M````````````````````````````````````````````````````````````<br>
&gt; ++M````````````````````````````````````````````````````````````<br>
&gt; ++M````````````````````````````````````````````````````````````<br>
&gt; ++M````````````````````````````````````````````````````````````<br>
&gt; ++M````````````````````````````````````````````````````````````<br>
&gt; ++M````````````````````````````````````````````````````````````<br>
&gt; ++M````````````````````````````````````````````````````````````<br>
&gt; ++M````````````````````````````````````````````````````````````<br>
&gt; ++M````````````````````````````````````````````````````````````<br>
&gt; ++M````````````````````````````````````````````````````````````<br>
&gt; ++M````````````````````````````````````````````````````````````<br>
&gt; ++M````````````````````````````````````````````````````````````<br>
&gt; ++M````````````````````````````````````````````````````````````<br>
&gt; ++M````````````````````````````````````````````````````````````<br>
&gt; ++M````````````````````````````````````````````````````````````<br>
&gt; ++M````````````````````````````````````````````````````````````<br>
&gt; ++M````````````````````````````````````````````````````````````<br>
&gt; ++M````````````````````````````````````````````````````````````<br>
&gt; ++M````````````````````````````````````````````````````````````<br>
&gt; ++M````````````````````````````````````````````````````````````<br>
&gt; ++M````````````````````````````````````````````````````````````<br>
&gt; ++M````````````````````````````````````````````````````````````<br>
&gt; ++M````````````````````````````````````````````````````````````<br>
&gt; ++M````````````````````````````````````````````````````````````<br>
&gt; ++M````````````````````````````````````````````````````````````<br>
&gt; ++M````````````````````````````````````````````````````````````<br>
&gt; ++M````````````````````````````````````````````````````````````<br>
&gt; ++M````````````````````````````````````````````````````````````<br>
&gt; ++M````````````````````````````````````````````````````````````<br>
&gt; ++M````````````````````````````````````````````````````````````<br>
&gt; ++M````````````````````````````````````````````````````````````<br>
&gt; ++M````````````````````````````````````````````````````````````<br>
&gt; ++M````````````````````````````````````````````````````````````<br>
&gt; ++M````````````````````````````````````````````````````````````<br>
&gt; ++M````````````````````````````````````````````````````````````<br>
&gt; ++M````````````````````````````````````````````````````````````<br>
&gt; ++M````````````````````````````````````````````````````````````<br>
&gt; ++M````````````````````````````````````````````````````````````<br>
&gt; ++M````````````````````````````````````````````````````````````<br>
&gt; ++M````````````````````````````````````````````````````````````<br>
&gt; ++M````````````````````````````````````````````````````````````<br>
&gt; ++M````````````````````````````````````````````````````````````<br>
&gt; ++M````````````````````````````````````````````````````````````<br>
&gt; ++M````````````````````````````````````````````````````````````<br>
&gt; ++M````````````````````````````````````````````````````````````<br>
&gt; ++M````````````````````````````````````````````````````````````<br>
&gt; ++M````````````````````````````````````````````````````````````<br>
&gt; ++M````````````````````````````````````````````````````````````<br>
&gt; ++M````````````````````````````````````````````````````````````<br>
&gt; ++M````````````````````````````````````````````````````````````<br>
&gt; ++M````````````````````````````````````````````````````````````<br>
&gt; ++M````````````````````````````````````````````````````````````<br>
&gt; ++M````````````````````````````````````````````````````````````<br>
&gt; ++M````````````````````````````````````````````````````````````<br>
&gt; ++M````````````````````````````````````````````````````````````<br>
&gt; ++M````````````````````````````````````````````````````````````<br>
&gt; ++M````````````````````````````````````````````````````````````<br>
&gt; ++M````````````````````````````````````````````````````````````<br>
&gt; ++M````````````````````````````````````````````````````````````<br>
&gt; ++M````````````````````````````````````````````````````````````<br>
&gt; ++M````````````````````````````````````````````````````````````<br>
&gt; ++M````````````````````````````````````````````````````````````<br>
&gt; ++M````````````````````````````````````````````````````````````<br>
&gt; ++M````````````````````````````````````````````````````````````<br>
&gt; ++M````````````````````````````````````````````````````````````<br>
&gt; ++M````````````````````````````````````````````````````````````<br>
&gt; ++M````````````````````````````````````````````````````````````<br>
&gt; ++M````````````````````````````````````````````````````````````<br>
&gt; ++M````````````````````````````````````````````````````````````<br>
&gt; ++M````````````````````````````````````````````````````````````<br>
&gt; ++M````````````````````````````````````````````````````````````<br>
&gt; ++M````````````````````````````````````````````````````````````<br>
&gt; ++M````````````````````````````````````````````````````````````<br>
&gt; ++M````````````````````````````````````````````````````````````<br>
&gt; ++M````````````````````````````````````````````````````````````<br>
&gt; ++M````````````````````````````````````````````````````````````<br>
&gt; ++M````````````````````````````````````````````````````````````<br>
&gt; ++M````````````````````````````````````````````````````````````<br>
&gt; ++M````````````````````````````````````````````````````````````<br>
&gt; ++M````````````````````````````````````````````````````````````<br>
&gt; ++M````````````````````````````````````````````````````````````<br>
&gt; ++M````````````````````````````````````````````````````````````<br>
&gt; ++M````````````````````````````````````````````````````````````<br>
&gt; ++M````````````````````````````````````````````````````````````<br>
&gt; ++M````````````````````````````````````````````````````````````<br>
&gt; ++M````````````````````````````````````````````````````````````<br>
&gt; ++M````````````````````````````````````````````````````````````<br>
&gt; ++M````````````````````````````````````````````````````````````<br>
&gt; ++M````````````````````````````````````````````````````````````<br>
&gt; ++M````````````````````````````````````````````````````````````<br>
&gt; ++M````````````````````````````````````````````````````````````<br>
&gt; ++M````````````````````````````````````````````````````````````<br>
&gt; ++M````````````````````````````````````````````````````````````<br>
&gt; ++M````````````````````````````````````````````````````````````<br>
&gt; ++M````````````````````````````````````````````````````````````<br>
&gt; ++M````````````````````````````````````````````````````````````<br>
&gt; ++M````````````````````````````````````````````````````````````<br>
&gt; ++M````````````````````````````````````````````````````````````<br>
&gt; ++M````````````````````````````````````````````````````````````<br>
&gt; ++M````````````````````````````````````````````````````````````<br>
&gt; ++M````````````````````````````````````````````````````````````<br>
&gt; ++M````````````````````````````````````````````````````````````<br>
&gt; ++M````````````````````````````````````````````````````````````<br>
&gt; ++M````````````````````````````````````````````````````````````<br>
&gt; ++M````````````````````````````````````````````````````````````<br>
&gt; ++M````````````````````````````````````````````````````````````<br>
&gt; ++M````````````````````````````````````````````````````````````<br>
&gt; ++M````````````````````````````````````````````````````````````<br>
&gt; ++M````````````````````````````````````````````````````````````<br>
&gt; ++M````````````````````````````````````````````````````````````<br>
&gt; ++M````````````````````````````````````````````````````````````<br>
&gt; ++M````````````````````````````````````````````````````````````<br>
&gt; ++M````````````````````````````````````````````````````````````<br>
&gt; ++M````````````````````````````````````````````````````````````<br>
&gt; ++M````````````````````````````````````````````````````````````<br>
&gt; ++M````````````````````````````````````````````````````````````<br>
&gt; ++M````````````````````````````````````````````````````````````<br>
&gt; ++M````````````````````````````````````````````````````````````<br>
&gt; ++M````````````````````````````````````````````````````````````<br>
&gt; ++M````````````````````````````````````````````````````````````<br>
&gt; ++M````````````````````````````````````````````````````````````<br>
&gt; ++M````````````````````````````````````````````````````````````<br>
&gt; ++M````````````````````````````````````````````````````````````<br>
&gt; ++M````````````````````````````````````````````````````````````<br>
&gt; ++M````````````````````````````````````````````````````````````<br>
&gt; ++M````````````````````````````````````````````````````````````<br>
&gt; ++M````````````````````````````````````````````````````````````<br>
&gt; ++M````````````````````````````````````````````````````````````<br>
&gt; ++M````````````````````````````````````````````````````````````<br>
&gt; ++M````````````````````````````````````````````````````````````<br>
&gt; ++M````````````````````````````````````````````````````````````<br>
&gt; ++M````````````````````````````````````````````````````````````<br>
&gt; ++M````````````````````````````````````````````````````````````<br>
&gt; ++M````````````````````````````````````````````````````````````<br>
&gt; ++M````````````````````````````````````````````````````````````<br>
&gt; ++M````````````````````````````````````````````````````````````<br>
&gt; ++M````````````````````````````````````````````````````````````<br>
&gt; ++M````````````````````````````````````````````````````````````<br>
&gt; ++M````````````````````````````````````````````````````````````<br>
&gt; ++M````````````````````````````````````````````````````````````<br>
&gt; ++M````````````````````````````````````````````````````````````<br>
&gt; ++M````````````````````````````````````````````````````````````<br>
&gt; ++M````````````````````````````````````````````````````````````<br>
&gt; ++M````````````````````````````````````````````````````````````<br>
&gt; ++M````````````````````````````````````````````````````````````<br>
&gt; ++M````````````````````````````````````````````````````````````<br>
&gt; ++M````````````````````````````````````````````````````````````<br>
&gt; ++M````````````````````````````````````````````````````````````<br>
&gt; ++M````````````````````````````````````````````````````````````<br>
&gt; ++M````````````````````````````````````````````````````````````<br>
&gt; ++5```````````````````Y^;*!`@4`<br>
&gt; ++`<br>
&gt; ++end<br>
&gt; +-- <br>
&gt; +2.25.1<br>
&gt; +<br>
&gt; diff --git a/meta/recipes-extended/libarchive/<a href=3D"http://libarc=
hive_3.6.2.bb" rel=3D"noreferrer" target=3D"_blank">libarchive_3.6.2.bb</a>=
 b/meta/recipes-extended/libarchive/<a href=3D"http://libarchive_3.6.2.bb" =
rel=3D"noreferrer" target=3D"_blank">libarchive_3.6.2.bb</a><br>
&gt; index e74326b40f..85fe6e5baa 100644<br>
&gt; --- a/meta/recipes-extended/libarchive/<a href=3D"http://libarchive_3.=
6.2.bb" rel=3D"noreferrer" target=3D"_blank">libarchive_3.6.2.bb</a><br>
&gt; +++ b/meta/recipes-extended/libarchive/<a href=3D"http://libarchive_3.=
6.2.bb" rel=3D"noreferrer" target=3D"_blank">libarchive_3.6.2.bb</a><br>
&gt; @@ -50,6 +50,8 @@ SRC_URI =3D &quot;<a href=3D"http://libarchive.org/d=
ownloads/libarchive-$%7BPV%7D.tar.gz" rel=3D"noreferrer" target=3D"_blank">=
http://libarchive.org/downloads/libarchive-${PV}.tar.gz</a> \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Merge-pull-=
request-2768-from-Commandoss-master.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2025-60753-0=
1.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2025-60753-0=
2.patch \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2026-4111-1.patch=
 \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2026-4111-2.patch=
 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt;=C2=A0 UPSTREAM_CHECK_URI =3D &quot;<a href=3D"http://libarchive.org/" =
rel=3D"noreferrer" target=3D"_blank">http://libarchive.org/</a>&quot;<br>
&gt;=C2=A0 <br>
<br>
<br>
-- <br>
Yoann Congal<br>
Smile ECS<br>
<br>
</blockquote></div>

--000000000000c3994f064e9e0d5b--

