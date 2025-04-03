Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D578C3600C
	for <webhook@archiver.kernel.org>; Thu,  3 Apr 2025 11:40:11 +0000 (UTC)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
 by mx.groups.io with SMTP id smtpd.web10.11274.1743680401352827272
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Apr 2025 04:40:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gpIcjPjB;
 spf=pass (domain: gmail.com, ip: 209.85.219.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-6e8f94c2698so4633086d6.0
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Apr 2025 04:40:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743680400; x=1744285200; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QtkfKUsyMhc51i9oa8AcRH7zoZo5HV/NCLLVyMjI9AE=;
        b=gpIcjPjB/WxEen92djYo20hPKzlpvzDu2LWlHnZ1hXcKNetb/LnMfBGUFqlXYYgRO4
         YooUhYBitqJI5xS6tsyQ82vuPiWW5bY3wW8SJVvb8TmbP2xbHux3YumZAV2WeBVcIt0n
         QIm0HfrJlQ51XpyHNUfiQCKA6ceGPy7C3Yg8rJhtSoPZ3vOIjyfphSXb7UIwnZjzKLIl
         IVT63BhVP0kF90xc3BvvHHNLZNy3X+sDVm1LkOpfFf7m2XXPkTrNCEOmsE0VwOdJOC+A
         WkDUmhQv4DA0TnYYEH9uZ3sHN5ppdYC2hX4bdOiol/UaAxUC8B24BzhfitZvajYcceRX
         PJvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743680400; x=1744285200;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QtkfKUsyMhc51i9oa8AcRH7zoZo5HV/NCLLVyMjI9AE=;
        b=bvzDyVIdtc8SucjrxNJZgvqDm/jtPKsqELVFKH33FtyuB4Im+fuFRUstOqWzA0SJo+
         ebOsr+gNmZArH3i6taiIozEGkY58hihqpur9xWpVhIBwMqbqEqUIO9CI6wMRmJSqtWz0
         m17g4e4JbxESYkiIV8C4A3dtQsLiXD9vRpUgz+PdFmmPS1hKRRkWEbszO+sNE85ynJmc
         /QoXVPjgHXVRg/7k65+ayHRZYHAlubSkBR5V3c3n1SS87i9CShV8s0GIXE+avtglUO0M
         NdolQjY26N4UiS0XE3NkQ98IKgv3SoEff59mwfpGe/JbTJCg+b4fX5xYt4DKJ0Gu7Nqi
         uynA==
X-Forwarded-Encrypted: i=1; AJvYcCXfpiHO9nqG7y+p7bShxC2ei0nrr0zW3le4HHAsSznG7rF4P2xigTdXcrdQftUh3CQ7cbyXaEjDBCB5EpiWibxGsg==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yy4958H/wBki15PO2+NPBR84CRXoJSgFzmmDM5Hy8mMFV2StWOI
	iUCIsIclO6nxXkIBplGBMj6DIqwqyoBYbQ/CkbzAMZ6xkhc1q59Q/nC82kqn+MdKd9kKalVzkTt
	S2oxbi1Bq6uatMScyDXmq5KW1QQM=
X-Gm-Gg: ASbGncvxdTAM7zM3L3/kRrSdaXIuv9liSYUDE8qgGga30O/S8VYr49YOGNsH9hh3y+I
	UcSEm4sBvA+x0auo9MTDbMER1rluFzMwRS7+qxITBLLkas5m31mG6wxWONuOFq9UD1KGjlFvF2H
	TMLC8hEpVsTaK6KCZ0uyLyIeNNhYcGbE3mPVczMos6tSFYv581S03sVaDpJXYY
X-Google-Smtp-Source: AGHT+IHA9kGyeX825tFlprpRBS2dcsJg0a2tgN9bFB4XpOHvj9g1CdiuSxSPQcOrL4XkHeXfSVOTmJuHkIUdn3hqdUM=
X-Received: by 2002:a05:6214:d02:b0:6e8:ec85:8325 with SMTP id
 6a1803df08f44-6eed624aaebmr302217716d6.39.1743680400347; Thu, 03 Apr 2025
 04:40:00 -0700 (PDT)
MIME-Version: 1.0
References: <5746f47c-7e5d-46f5-b089-c613b7275d2b@bootlin.com>
 <6c36d9830745cb739f1dcb968d74a43395117fa1.camel@linuxfoundation.org>
 <21e0daef-2b05-4c33-afb8-3a45ebd97fbf@bootlin.com> <a299f47c16bcac1624099c99d29e84bc13e01d69.camel@linuxfoundation.org>
 <a4816fa9-091a-4fd8-962e-3cb803699395@bootlin.com>
In-Reply-To: <a4816fa9-091a-4fd8-962e-3cb803699395@bootlin.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 3 Apr 2025 13:39:48 +0200
X-Gm-Features: ATxdqUE7EnG5Oh5v0u0gRQagVmNZX8sM4uuRiINpTVFS4u00NIkLrVup7yJjEPw
Message-ID: <CANNYZj9tTByanCSuykMLy2NAeNZdKK12nBBA6z=a+JMjuUL+-g@mail.gmail.com>
Subject: Re: [OE-core] [scarthgap] multilib_header class: issue with custom
 multilib setup
To: joaomarcos.costa@bootlin.com
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org, 
	Thomas Perrot <thomas.perrot@bootlin.com>, Khem Raj <raj.khem@gmail.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Apr 2025 11:40:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214322

The original error was:

file /usr/include/gnu/lib-names-lp64d.h conflicts between attempted
installs of libcfi-libc6-dev-2.37-r0.riscv64cfi and
libc6-dev-2.37-r0.riscv64

This looks like the offending headers come from different recipes.
Multilib_header is not meant for handling these errors, it's intended
for an entirely different scenario (when the same recipe is producing
two different sets of multilib packages).

Rather you should drop all multilib hacks, go back to the original
build, and see how the headers from the two different recipes differ,
why are they installed into the same locaiton, do you need to install
both packages, or only need one of them, and generally figure out how
libcfi is supposed to coexist with libc.

Alex

On Thu, 3 Apr 2025 at 13:31, Joao Marcos Costa via
lists.openembedded.org
<joaomarcos.costa=3Dbootlin.com@lists.openembedded.org> wrote:
>
>
>
> On 4/3/25 13:19, Richard Purdie via lists.openembedded.org wrote:
> > On Thu, 2025-04-03 at 13:06 +0200, Joao Marcos Costa wrote:
> >>
> >> Thanks for your reply.
> >>
> >> Even with the cfi suffix set correctly, the actual file raising the
> >> conflict is the generated template, no the header with the suffix:
> >>
> >> file /usr/include/gnu/lib-names-lp64d.h conflicts between attempted
> >> installs of libcfi-libc6-dev-2.37-r0.riscv64cfi and
> >> libc6-dev-2.37-r0.riscv64
> >>
> >> In my previous mail, I should have pasted this one instead. My bad.
> >
> > I tried to explain how it should work but I can't do much beyond that.
> > The two generated template files should be identical.
> >
> > Can you share the contents of the two header files so we can see what
> > the conflict is?
> >
> > Cheers,
> >
> > Richard
>
> Most certainly. Here's the standard (i.e., non-cfi) version of it:
>
> /* This file is automatically generated.  */
> #ifndef __GNU_LIB_NAMES_H
> # error "Never use <gnu/lib-names-lp64d.h> directly; include
> <gnu/lib-names.h> instead."
> #endif
>
> #define LD_LINUX_RISCV64_LP64D_SO       "ld-linux-riscv64-lp64d.so.1"
> #define LD_SO                           "ld-linux-riscv64-lp64d.so.1"
> #define LIBANL_SO                       "libanl.so.1"
> #define LIBBROKENLOCALE_SO              "libBrokenLocale.so.1"
> #define LIBCRYPT_SO                     "libcrypt.so.1"
> #define LIBC_MALLOC_DEBUG_SO            "libc_malloc_debug.so.0"
> #define LIBC_SO                         "libc.so.6"
> #define LIBDL_SO                        "libdl.so.2"
> #define LIBGCC_S_SO                     "libgcc_s.so.1"
> #define LIBMVEC_SO                      "libmvec.so.1"
> #define LIBM_SO                         "libm.so.6"
> #define LIBNSL_SO                       "libnsl.so.1"
> #define LIBNSS_COMPAT_SO                "libnss_compat.so.2"
> #define LIBNSS_DB_SO                    "libnss_db.so.2"
> #define LIBNSS_DNS_SO                   "libnss_dns.so.2"
> #define LIBNSS_FILES_SO                 "libnss_files.so.2"
> #define LIBNSS_HESIOD_SO                "libnss_hesiod.so.2"
> #define LIBNSS_LDAP_SO                  "libnss_ldap.so.2"
> #define LIBPTHREAD_SO                   "libpthread.so.0"
> #define LIBRESOLV_SO                    "libresolv.so.2"
> #define LIBRT_SO                        "librt.so.1"
> #define LIBTHREAD_DB_SO                 "libthread_db.so.1"
> #define LIBUTIL_SO                      "libutil.so.1"
>
> And the diff between this header and the CFI one is:
>
> $ diff (...)image/usr/include/gnu/lib-names-lp64d.h
> (...)libcfi-glibc/2.37/image/usr/include/gnu/lib-names-lp64d.h
> 6,7c6,7
> < #define LD_LINUX_RISCV64_LP64D_SO       "ld-linux-riscv64-lp64d.so.1"
> < #define LD_SO                           "ld-linux-riscv64-lp64d.so.1"
> ---
>  > #define LD_LINUX_RISCV64_LP64D_CFI_SO   "ld-linux-riscv64-lp64d-cfi.so=
.1"
>  > #define LD_SO                           "ld-linux-riscv64-lp64d-cfi.so=
.1"
>
>
> --
> Best regards,
> Jo=C3=A3o Marcos Costa
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#214320): https://lists.openembedded.org/g/openembedde=
d-core/message/214320
> Mute This Topic: https://lists.openembedded.org/mt/112062849/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

