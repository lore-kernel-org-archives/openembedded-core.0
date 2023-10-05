Return-Path: <scott.murray@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD8B0E9270A
	for <webhook@archiver.kernel.org>; Thu,  5 Oct 2023 15:17:09 +0000 (UTC)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
 by mx.groups.io with SMTP id smtpd.web11.18148.1696519019745131709
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Oct 2023 08:16:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=d/83zadb;
 spf=pass (domain: konsulko.com, ip: 209.85.222.179, mailfrom: scott.murray@konsulko.com)
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-7741c2fae49so71853885a.0
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Oct 2023 08:16:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1696519019; x=1697123819; darn=lists.openembedded.org;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=HsOjVEt0asc/QmA0s5T3BY5pVv1g9fmxsB4NWVcG5So=;
        b=d/83zadbLLvE67WTbg9H2U6UOpW7fDMpVMjrdzBCoPrPYKTgB6T4C294y1EWWUM7A/
         JVvTGfndk+RYeJwxNvTACn6wSc6kY8ah6//Ia4xAVzCuWxpa66h92ly1cX+0eeH4/CDi
         ucpZffqOe2vVMfKgtxVlaruDFfL1nHR5HHVHI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696519019; x=1697123819;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HsOjVEt0asc/QmA0s5T3BY5pVv1g9fmxsB4NWVcG5So=;
        b=B0x8FYeiCnfkxMLQ8V4nNvtd78xENEjT3nEsozDnE3G5Yxvb9hyi2EvcAn9VNB+9E2
         bsRRzbRtNcoCD+KMc6S4q0Dg2i4UTb209aHO2Nq61FAKvYCwSRerOaiV/HldJpTZNnc4
         dSqY98n/XTV0ksqiE6UlMVXiwcxp8m4mXb/AdyMd+Jp9BZIazdebCpLTA2zVM2i6NHCs
         zwsdTTDxv9jrATnR26C+SAXmnrtReltk9SYmhTzFRuElBDUxSCM3Jan/g3vpP1IaGi0W
         WArnXCa+UVOQQrfSc6vfyvLvTuh0Vl4uzCzRFLpe68ASmD3enizHxERkexa+TO4kUju+
         3tiw==
X-Gm-Message-State: AOJu0YzRLLhijWBwpkljrQz4vd21HpkJmUrOxhYt/6uZ1ja0V4IyHUmx
	H+xjYlIHr/qqKTAC4PnTZE/JqA==
X-Google-Smtp-Source: AGHT+IGqF0NSWJFC/rVbTp3GucYfisvXUtNp9C0zIqh9PCiAzsPIt8dW7FxBXnpjSpwd1lg8QH/Stg==
X-Received: by 2002:a05:620a:2585:b0:775:9026:31ac with SMTP id x5-20020a05620a258500b00775902631acmr6077819qko.9.1696519018686;
        Thu, 05 Oct 2023 08:16:58 -0700 (PDT)
Received: from godzilla ([207.136.105.90])
        by smtp.gmail.com with ESMTPSA id u21-20020ae9c015000000b0076ef29f3429sm543938qkk.120.2023.10.05.08.16.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Oct 2023 08:16:57 -0700 (PDT)
Date: Thu, 5 Oct 2023 11:16:29 -0400 (EDT)
From: Scott Murray <scott.murray@konsulko.com>
To: Steve Sakoman <steve@sakoman.com>, mac@mcrowe.com
cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [dunfell][PATCH] glibc: Fix CVE-2023-4911 "Looney
 Tunables"
In-Reply-To: <CAOSpxdb-qBLkj8D9afpucuB5AYqB+xjcP18HpSrUCG2AQcvEQw@mail.gmail.com>
Message-ID: <b98ca516-ff3d-48fa-bb5b-15fe93db14b0@konsulko.com>
References: <20231005085407.2200644-1-mac@mcrowe.com> <CAOSpxdb-qBLkj8D9afpucuB5AYqB+xjcP18HpSrUCG2AQcvEQw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="-1463811583-1343314356-1696519017=:4192"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Oct 2023 15:17:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188723

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

---1463811583-1343314356-1696519017=:4192
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Thu, 5 Oct 2023, Steve Sakoman wrote:

> Hmmm ... does this build for you?
>
> I'm getting:
>
> ERROR: glibc-2.31+gitAUTOINC+2d4f26e5cf-r0 do_patch: Applying patch
> 'CVE-2023-4911.patch' on target directory
> '/home/steve/builds/poky-contrib/build/tmp/work/core2-64-poky-linux/glibc/2.31+gitAUTOINC+2d4f26e5cf-r0/git'
> Command Error: 'quilt --quiltrc
> /home/steve/builds/poky-contrib/build/tmp/work/core2-64-poky-linux/glibc/2.31+gitAUTOINC+2d4f26e5cf-r0/recipe-sysroot-native/etc/quiltrc
> push' exited with 0  Output:
> Applying patch CVE-2023-4911.patch
> patching file elf/dl-tunables.c
> Hunk #1 FAILED at 187.
> Hunk #2 FAILED at 251.
> 2 out of 2 hunks FAILED -- rejects in file elf/dl-tunables.c
> Patch CVE-2023-4911.patch does not apply (enforce with -f)
>
> Steve

Debian's page at https://security-tracker.debian.org/tracker/CVE-2023-4911
indicates at the bottom that they're only vulnerable on their 2.31 based
versions because they backported the change that introduced the
vulnerability, which I don't believe has been done in oe-core...

Scott

> On Wed, Oct 4, 2023 at 10:54 PM Mike Crowe via lists.openembedded.org
> <mac=mcrowe.com@lists.openembedded.org> wrote:
> >
> > From: Mike Crowe <mac@mcrowe.com>
> >
> > Take the patch from the source for Debian's glibc 2.31-13+deb11u7
> > package, the changelog for which starts with:
> >
> >  glibc (2.31-13+deb11u7) bullseye-security; urgency=medium
> >
> >    * debian/patches/any/local-CVE-2023-4911.patch: Fix a buffer overflow in the
> >      dynamic loader's processing of the GLIBC_TUNABLES environment variable
> >      (CVE-2023-4911).
> >
> > This addresses the "Looney Tunables" vulnerability described at
> > https://www.qualys.com/2023/10/03/cve-2023-4911/looney-tunables-local-privilege-escalation-glibc-ld-so.txt
> >
> > Signed-off-by: Mike Crowe <mac@mcrowe.com>
> > ---
> >  .../glibc/glibc/CVE-2023-4911.patch           | 63 +++++++++++++++++++
> >  meta/recipes-core/glibc/glibc_2.31.bb         |  1 +
> >  2 files changed, 64 insertions(+)
> >  create mode 100644 meta/recipes-core/glibc/glibc/CVE-2023-4911.patch
> >
> > diff --git a/meta/recipes-core/glibc/glibc/CVE-2023-4911.patch b/meta/recipes-core/glibc/glibc/CVE-2023-4911.patch
> > new file mode 100644
> > index 0000000000..4d3146509a
> > --- /dev/null
> > +++ b/meta/recipes-core/glibc/glibc/CVE-2023-4911.patch
> > @@ -0,0 +1,63 @@
> > +From d2b77337f734fcacdfc8e0ddec14cf31a746c7be Mon Sep 17 00:00:00 2001
> > +From: Siddhesh Poyarekar <siddhesh@redhat.com>
> > +Date: Mon, 11 Sep 2023 18:53:15 -0400
> > +Subject: [PATCH v2] tunables: Terminate immediately if end of input is reached
> > +
> > +The string parsing routine may end up writing beyond bounds of tunestr
> > +if the input tunable string is malformed, of the form name=name=val.
> > +This gets processed twice, first as name=name=val and next as name=val,
> > +resulting in tunestr being name=name=val:name=val, thus overflowing
> > +tunestr.
> > +
> > +Terminate the parsing loop at the first instance itself so that tunestr
> > +does not overflow.
> > +---
> > +Changes from v1:
> > +
> > +- Also null-terminate tunestr before exiting.
> > +
> > + elf/dl-tunables.c | 17 ++++++++++-------
> > + 1 file changed, 10 insertions(+), 7 deletions(-)
> > +
> > +Upstream-Status: Backport [git://sourceware.org/git/glibc.git]
> > +CVE: CVE-2023-4911
> > +
> > +diff --git a/elf/dl-tunables.c b/elf/dl-tunables.c
> > +index 8e7ee9df10..76cf8b9da3 100644
> > +--- a/elf/dl-tunables.c
> > ++++ b/elf/dl-tunables.c
> > +@@ -187,11 +187,7 @@ parse_tunables (char *tunestr, char *valstring)
> > +       /* If we reach the end of the string before getting a valid name-value
> > +        pair, bail out.  */
> > +       if (p[len] == '\0')
> > +-      {
> > +-        if (__libc_enable_secure)
> > +-          tunestr[off] = '\0';
> > +-        return;
> > +-      }
> > ++      break;
> > +
> > +       /* We did not find a valid name-value pair before encountering the
> > +        colon.  */
> > +@@ -251,9 +247,16 @@ parse_tunables (char *tunestr, char *valstring)
> > +           }
> > +       }
> > +
> > +-      if (p[len] != '\0')
> > +-      p += len + 1;
> > ++      /* We reached the end while processing the tunable string.  */
> > ++      if (p[len] == '\0')
> > ++      break;
> > ++
> > ++      p += len + 1;
> > +     }
> > ++
> > ++  /* Terminate tunestr before we leave.  */
> > ++  if (__libc_enable_secure)
> > ++    tunestr[off] = '\0';
> > + }
> > + #endif
> > +
> > +--
> > +2.41.0
> > +
> > diff --git a/meta/recipes-core/glibc/glibc_2.31.bb b/meta/recipes-core/glibc/glibc_2.31.bb
> > index 8d216f6ed1..1862586749 100644
> > --- a/meta/recipes-core/glibc/glibc_2.31.bb
> > +++ b/meta/recipes-core/glibc/glibc_2.31.bb
> > @@ -80,6 +80,7 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
> >             file://0036-i386-Avoid-lazy-relocation-of-tlsdesc-BZ-27137.patch \
> >             file://0037-Avoid-deadlock-between-pthread_create-and-ctors.patch \
> >             file://CVE-2023-0687.patch \
> > +           file://CVE-2023-4911.patch \
> >             "
> >  S = "${WORKDIR}/git"
> >  B = "${WORKDIR}/build-${TARGET_SYS}"
> > --
> > 2.39.2
> >
> > BrightSign considers your privacy to be very important. The emails you send to us will be protected and secured. Furthermore, we will only use your email and contact information for the reasons you sent them to us and for tracking how effectively we respond to your requests.
> >
> >
> >
>
---1463811583-1343314356-1696519017=:4192--

