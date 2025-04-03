Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2908DC3600C
	for <webhook@archiver.kernel.org>; Thu,  3 Apr 2025 11:41:41 +0000 (UTC)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
 by mx.groups.io with SMTP id smtpd.web10.11299.1743680499799555424
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Apr 2025 04:41:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PO9bnj0L;
 spf=pass (domain: gmail.com, ip: 209.85.219.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-6e8f05acc13so8692596d6.2
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Apr 2025 04:41:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743680499; x=1744285299; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oo7MKLzq9/h2hTb3cyAQlXrnhc2Sbg7cIVTWtTuy1YY=;
        b=PO9bnj0LPP/Qo1J/Et2lLcASXfOhfkD0XeVI8rcrCSG9FeGJNp/l3/E50pUDwqYZRh
         UIyF/J1NU5UTTPuH+Xucpox/xnN2N2LQzsmzB33ev09LxipB5IHacreioAgRhc8Z43y5
         XQ1EQ20SJRGkjujedRfJJIpMwIxSXKUbTAMwGVzAdMaUBNokXqdzAe/BbJWpWDtCR0Br
         vojuy3Hi5UzX27cr+co9ynqTos6Y8L7aCKlKGhy5a7iSbVv0TBzgwMVC3lgFCgk73KCf
         Wwtr2LOkajrdXU1pbQzJGjSnso20/bK/w3QHSfzGv4+IOCk1dENOQa67Pq32Kdf72hWe
         lWQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743680499; x=1744285299;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oo7MKLzq9/h2hTb3cyAQlXrnhc2Sbg7cIVTWtTuy1YY=;
        b=ucjEn/URbhuJfbR2UlCv74BeEI7wv0Gj7nHqCBZG5mrjBidpHZK98BzSfdh+dmUsFb
         mZCb3SIAAHxFa+hEaSM905ZYIo/HRZ0/6Yj3OPdVIdiowWGL/F4re7itmyfiN193EhaT
         aCW2UvQ7igXqv+HJb86EbUwAgOalZz++GGixZ6YhMgvsClRsZ7dd3wLleiFqgmumWEJp
         COn6WFYKsHJsNg6YUptpzc5bgFCLDMYzupVvxL70dxmRRmgUSgrvagf/lEsmc88B1529
         v6ebEbFQRlmtCQMQXp9MJJJtYv/9QxqEfh0Fvv4t2X/rGN11aDawtBrJANwoBolQ3GFd
         VXLg==
X-Forwarded-Encrypted: i=1; AJvYcCWcLYoWMH5Vsd7nXSEvqTJZ7CA10/DYCo56sCULsClGPPT40e5VyswzYhTSClNkuTnh1GWihoZ+0prTxka4RQAOQQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0Ywn7RNtIUsEDuMpqVUxULaqe+0vCtA9WU9kmNjWEVAFewA9wYCp
	bWkN1lIYQWQT3JkF9447EInCDC0lvLF4sjLh+bbhOniFrilxmdYv7cHrKTurqFBcEewUyZg1+NB
	XljuLXTIw7COlJfIYoHzQ/1e68Mw=
X-Gm-Gg: ASbGncsd9qoqSKelepzack33dnCfWNlismb1eVOJToWxVwo+yD9d1Ahk7CNN+3xqHyA
	ih29CmIGALVKvsCFWLF6t/hgRwu6Y3a9l6B8Kj8vAAEnbnmzRx+KXl20okz7KHJIKNXgiM0AN4k
	EeY24E9iqlllBtvSOHuV9V3S0M5XjFSdMYtyOBPF6wyYcEt9tilOjAZzKboIdt
X-Google-Smtp-Source: AGHT+IFRX48I+OVRO46QLal25I1N4TwmAVNSm8UxCuvUhnlhceIRXfe/xD4JKCWtYkNvzoqPNU6KeCuInlAOcpXOfes=
X-Received: by 2002:a05:6214:dcc:b0:6e4:2e12:3a0c with SMTP id
 6a1803df08f44-6ef0dd1c648mr27336466d6.39.1743680496917; Thu, 03 Apr 2025
 04:41:36 -0700 (PDT)
MIME-Version: 1.0
References: <5746f47c-7e5d-46f5-b089-c613b7275d2b@bootlin.com>
 <6c36d9830745cb739f1dcb968d74a43395117fa1.camel@linuxfoundation.org>
 <21e0daef-2b05-4c33-afb8-3a45ebd97fbf@bootlin.com> <a299f47c16bcac1624099c99d29e84bc13e01d69.camel@linuxfoundation.org>
 <a4816fa9-091a-4fd8-962e-3cb803699395@bootlin.com> <CANNYZj9tTByanCSuykMLy2NAeNZdKK12nBBA6z=a+JMjuUL+-g@mail.gmail.com>
In-Reply-To: <CANNYZj9tTByanCSuykMLy2NAeNZdKK12nBBA6z=a+JMjuUL+-g@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 3 Apr 2025 13:41:25 +0200
X-Gm-Features: ATxdqUG4hy7qkih6aH_IXeTWiv_33amKe7z3Pw4CrMPTRALgZCKBfBt10-KpxmM
Message-ID: <CANNYZj_N6jn1KSjDD5WL563LPspQTzwDMBQoKudGggJY+KZfUw@mail.gmail.com>
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
 <openembedded-core@lists.openembedded.org>; Thu, 03 Apr 2025 11:41:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214323

Ah have to withdraw this :) Didn't read the original email close enough.

Alex


On Thu, 3 Apr 2025 at 13:39, Alexander Kanavin <alex.kanavin@gmail.com> wro=
te:
>
> The original error was:
>
> file /usr/include/gnu/lib-names-lp64d.h conflicts between attempted
> installs of libcfi-libc6-dev-2.37-r0.riscv64cfi and
> libc6-dev-2.37-r0.riscv64
>
> This looks like the offending headers come from different recipes.
> Multilib_header is not meant for handling these errors, it's intended
> for an entirely different scenario (when the same recipe is producing
> two different sets of multilib packages).
>
> Rather you should drop all multilib hacks, go back to the original
> build, and see how the headers from the two different recipes differ,
> why are they installed into the same locaiton, do you need to install
> both packages, or only need one of them, and generally figure out how
> libcfi is supposed to coexist with libc.
>
> Alex
>
> On Thu, 3 Apr 2025 at 13:31, Joao Marcos Costa via
> lists.openembedded.org
> <joaomarcos.costa=3Dbootlin.com@lists.openembedded.org> wrote:
> >
> >
> >
> > On 4/3/25 13:19, Richard Purdie via lists.openembedded.org wrote:
> > > On Thu, 2025-04-03 at 13:06 +0200, Joao Marcos Costa wrote:
> > >>
> > >> Thanks for your reply.
> > >>
> > >> Even with the cfi suffix set correctly, the actual file raising the
> > >> conflict is the generated template, no the header with the suffix:
> > >>
> > >> file /usr/include/gnu/lib-names-lp64d.h conflicts between attempted
> > >> installs of libcfi-libc6-dev-2.37-r0.riscv64cfi and
> > >> libc6-dev-2.37-r0.riscv64
> > >>
> > >> In my previous mail, I should have pasted this one instead. My bad.
> > >
> > > I tried to explain how it should work but I can't do much beyond that=
.
> > > The two generated template files should be identical.
> > >
> > > Can you share the contents of the two header files so we can see what
> > > the conflict is?
> > >
> > > Cheers,
> > >
> > > Richard
> >
> > Most certainly. Here's the standard (i.e., non-cfi) version of it:
> >
> > /* This file is automatically generated.  */
> > #ifndef __GNU_LIB_NAMES_H
> > # error "Never use <gnu/lib-names-lp64d.h> directly; include
> > <gnu/lib-names.h> instead."
> > #endif
> >
> > #define LD_LINUX_RISCV64_LP64D_SO       "ld-linux-riscv64-lp64d.so.1"
> > #define LD_SO                           "ld-linux-riscv64-lp64d.so.1"
> > #define LIBANL_SO                       "libanl.so.1"
> > #define LIBBROKENLOCALE_SO              "libBrokenLocale.so.1"
> > #define LIBCRYPT_SO                     "libcrypt.so.1"
> > #define LIBC_MALLOC_DEBUG_SO            "libc_malloc_debug.so.0"
> > #define LIBC_SO                         "libc.so.6"
> > #define LIBDL_SO                        "libdl.so.2"
> > #define LIBGCC_S_SO                     "libgcc_s.so.1"
> > #define LIBMVEC_SO                      "libmvec.so.1"
> > #define LIBM_SO                         "libm.so.6"
> > #define LIBNSL_SO                       "libnsl.so.1"
> > #define LIBNSS_COMPAT_SO                "libnss_compat.so.2"
> > #define LIBNSS_DB_SO                    "libnss_db.so.2"
> > #define LIBNSS_DNS_SO                   "libnss_dns.so.2"
> > #define LIBNSS_FILES_SO                 "libnss_files.so.2"
> > #define LIBNSS_HESIOD_SO                "libnss_hesiod.so.2"
> > #define LIBNSS_LDAP_SO                  "libnss_ldap.so.2"
> > #define LIBPTHREAD_SO                   "libpthread.so.0"
> > #define LIBRESOLV_SO                    "libresolv.so.2"
> > #define LIBRT_SO                        "librt.so.1"
> > #define LIBTHREAD_DB_SO                 "libthread_db.so.1"
> > #define LIBUTIL_SO                      "libutil.so.1"
> >
> > And the diff between this header and the CFI one is:
> >
> > $ diff (...)image/usr/include/gnu/lib-names-lp64d.h
> > (...)libcfi-glibc/2.37/image/usr/include/gnu/lib-names-lp64d.h
> > 6,7c6,7
> > < #define LD_LINUX_RISCV64_LP64D_SO       "ld-linux-riscv64-lp64d.so.1"
> > < #define LD_SO                           "ld-linux-riscv64-lp64d.so.1"
> > ---
> >  > #define LD_LINUX_RISCV64_LP64D_CFI_SO   "ld-linux-riscv64-lp64d-cfi.=
so.1"
> >  > #define LD_SO                           "ld-linux-riscv64-lp64d-cfi.=
so.1"
> >
> >
> > --
> > Best regards,
> > Jo=C3=A3o Marcos Costa
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#214320): https://lists.openembedded.org/g/openembed=
ded-core/message/214320
> > Mute This Topic: https://lists.openembedded.org/mt/112062849/1686489
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
alex.kanavin@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >

