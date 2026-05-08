Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6695CD342F
	for <webhook@archiver.kernel.org>; Fri,  8 May 2026 20:08:58 +0000 (UTC)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3241.1778270931027303007
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 May 2026 13:08:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=stQTmjhf;
 spf=pass (domain: gmail.com, ip: 209.85.219.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-8acb856a674so29410506d6.0
        for <openembedded-core@lists.openembedded.org>; Fri, 08 May 2026 13:08:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778270930; cv=none;
        d=google.com; s=arc-20240605;
        b=MJVEdtH2Fz84gpNWcAb9MscDMNxZQJnJHhIlXfml72+5GYvK5EyqvUi12jsLrPQyM6
         H5QYYwaf/IS6nRyR/4njpmLKCgjeQnRuFGeOmZRtYahlSLR9EH4bL+BEu1Dyn3LDyI4e
         NOZuB91LYUGuLdZNdsL7Npdcalf1iNCacuGy2uCH0x4DmWnu/4ujIhLznAw8xpAie3HT
         ethT+hHV5egNawJ2RN9hmKKbxxzw/uFV0Y9PCBa5gac4LbvmrA1HNi3+FAAIoej5LW27
         kYj9+IXzjArAVZoqO3WCOrMAfIIbruCtUXCfEMr7IfJazgGwALcILs4lFqc+Jwe8y/Rz
         gKCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=AsK884tEbKWGHl8uMZhRKovZNh6eEI2+k9ZnYmK4iys=;
        fh=I0bPQZFD7c0bvk0Vwpq0V9MOMjVTHCwLIZsN+zNMp1s=;
        b=ayCNTbR4szSfLkTnkjGrW0VUCyWjfYu4xL7/fGOTbfzYI1fDn2OgIN6ZzUyFzvS6+4
         ItwvWERJsrMhIoDiZsmd4vvz2rwVNBaVxg0BkLjgCNlCVmChMi94CTyHEgPC3m1v1EAm
         PCSWxhUNK4R4YbGxjqCcLdy+Ht2KPDQuDDaZbFiMS+xyA8ems8VgNRnYr8KB2tWH5yf2
         lBEvono1Ezx/xeYJARG4ElUM4hsA4C14MRDoAV9GtUx00rPaZ8yvGYMN8KHHC/4CLMo4
         A+pZXbWRKnbADNNIQ3ROKqukJFjELCsEtUJltt9EZPY71jAscACtZfWG/LvrTs9izBPA
         hrKw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778270930; x=1778875730; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=AsK884tEbKWGHl8uMZhRKovZNh6eEI2+k9ZnYmK4iys=;
        b=stQTmjhfuK0i7fCa39OlNC+OpHZ0iNhIcK7R3CdxYpt9iyQruiuFa4DgsnR4TD226o
         5dfOSKd9MsuzgVEBYOShsr+xiCrtLQV/QPC5sYb6kcQSHYHdH9uWEKyVzJRaoHHUbA2w
         qKo01TMDoJCXbNlBKrfuPSs/BepyczPGdC9aATJ5aezDk3CnWmEAybdOU/YR76NO3h/r
         t5NT10jRrTJENch21LMMBV4+qMl5BIjuw4tGv5tyaeoLNEeINcQ30zU1kc9EF9U7Cv/k
         gOdTOLZOCQJudXvi56g4rVfWxJwCepMhW7euqX2rYNKH5l62C0rr3L8D8rdFk0thGnGD
         89mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778270930; x=1778875730;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AsK884tEbKWGHl8uMZhRKovZNh6eEI2+k9ZnYmK4iys=;
        b=sCUsckVBPtto4EbovweIpZMTj0lUyNl746otRtaT8HW8okohAIwphrOO5sFEPLWH8f
         yYXZl3zJJf0DGN93ZeqJjWYm4sSCZr/V4WUM1dxD/mbwoU7rJA1YbjPVgIZ7EClghyC4
         fZEaPgTu7Lkl9io9MaHs3MPHWh+ZYFZOEaI24nh87GDLHAK0z8zHE4jfusDkMIV76GEK
         qpLazvuE+QvhiJfmrinMhsOH6TZlz0570HvzM0ZOYxyV+Z/co25psVuuUX6oZsZ3Lv4y
         d+fyXBkXGOKq+nX7ESShjMXivKrg2uaUlEOv/l+PwU7rsJrgx40v1mVVE7aACPMWK8W9
         uAHA==
X-Gm-Message-State: AOJu0YyQloDVMo8zFYOCNYeGDpeCN46sio7F8HtpF77SOPc81JZ2Aspz
	ZgJa0iAC3444LbPkNJxP8pVYdHzK32iUr17Ejfb1HEHPYAv0HjrNT/M2ack++vHdERYF3KC1Vjv
	+wuTo5cuhfwI6ZNuZKjQf2+H9IkqcQFBJePdp
X-Gm-Gg: Acq92OGCQStPtDUl5jImq0dNbjE8tLmxVCTSQXgHpxIT0kY9SKBQXlpIheCbbkcb5wJ
	T4goNTEHo68pAgU8sPE5dYVtufSXNUxf4PoNGHK0EA8eYBlytSu9axtz3XAN3hJ10dLhSv3aAwK
	OLewLkRyzB45pGS23CfhnE64BDOCk4aFrHsScrOrD9hvHk2IKSgIphufVktuluHQg/oyEDYsoHM
	/4wXKTDlK5ld3iHxVl1u9Iw0MyarMDOgI2YrZ2E43OugtMGQCZWFg1++hQRRrTD0FbHmFenQ/82
	NPAtqR2nN5yxa6avrPOz+gnpQIi4zltRIAhtUeq5S2jqbKu9yCDa
X-Received: by 2002:a05:6214:21ec:b0:8a7:164c:d5c8 with SMTP id
 6a1803df08f44-8bdba9e4a32mr131713456d6.24.1778270929910; Fri, 08 May 2026
 13:08:49 -0700 (PDT)
MIME-Version: 1.0
References: <20260506214835.1578529-1-Quan.Sun@windriver.com>
 <CANNYZj_++oDps3s2uq51a7j3CQgK1MSuuSgY9Cz0-wFtE2gnSQ@mail.gmail.com> <2705098e-1dfe-4d9e-af37-aedf6771c392@windriver.com>
In-Reply-To: <2705098e-1dfe-4d9e-af37-aedf6771c392@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 8 May 2026 22:08:38 +0200
X-Gm-Features: AVHnY4JAxdOAg1kxTLpI4J_9-acsTC1wt68nPbaWz4ou2GBVY0wOXQK_VTYhuis
Message-ID: <CANNYZj-A=+pbW3B-jHLpmLCVtYd=hWZY4J2SmL6ame9cDx=JvQ@mail.gmail.com>
Subject: Re: [OE-core][PATCH] qemu: upgrade 10.2.0 -> 11.0.0
To: Quan Sun <Quan.Sun@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 May 2026 20:08:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236737

On Thu, 7 May 2026 at 22:29, Quan Sun <Quan.Sun@windriver.com> wrote:

> When these subprojects are built standalone (outside the main QEMU meson
> project), they fail to compile because they cannot find headers from the
> top-level QEMU source tree (e.g. include/standard-headers/ or root-level
> headers). In a normal upstream build, the parent project provides these
> paths implicitly. OE's build environment triggers standalone subproject
> builds, requiring explicit include paths.

I'm afraid I don't understand, and I can't reproduce the issue. I
deleted this patch from SRC_URI, and qemu-native, qemu-system-native
and qemu (target) still build just fine.

What kind of error are you observing? How can it be reproduced? What
exactly triggers the 'standalone build' and how does it look like
compared to 'normal upstream build'?

What I see is that qemu recipe just runs the top level qemu meson
build, and these are built as regular subprojects of it:

log.do_configure:

Executing subproject libvduse

libvduse| Project name: libvduse
libvduse| Project version: undefined
libvduse| C compiler for the host machine: x86_64-poky-linux-gcc -m64
-march=x86-64-v3 -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2
-Wformat -Wformat-security -Werror=format-security
--sysroot=/srv/storage/alex/yocto/build-64-alt/tmp/work/x86-64-v3-poky-linux/qemu/11.0.0/recipe-sysroot
-m64 (gcc 15.2.0 "x86_64-poky-linux-gcc (GCC) 15.2.0")
libvduse| C linker for the host machine: x86_64-poky-linux-gcc -m64
-march=x86-64-v3 -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2
-Wformat -Wformat-security -Werror=format-security
--sysroot=/srv/storage/alex/yocto/build-64-alt/tmp/work/x86-64-v3-poky-linux/qemu/11.0.0/recipe-sysroot
-m64 ld.bfd 2.46
libvduse| C compiler for the build machine: gcc (gcc 14.2.0 "gcc
(Debian 14.2.0-19) 14.2.0")
libvduse| C linker for the build machine: gcc ld.bfd 2.44
libvduse| Compiler for C supports arguments -Wsign-compare: YES (cached)
libvduse| Compiler for C supports arguments
-Wdeclaration-after-statement: YES (cached)
libvduse| Compiler for C supports arguments -Wstrict-aliasing: YES (cached)
libvduse| Build targets in project: 5
libvduse| Subproject libvduse finished.

log.do_compile:

[744/5268] Compiling C object subprojects/libvduse/libvduse.a.p/libvduse.c.o
...
[817/5268] Linking static target subprojects/libvduse/libvduse.a

Alex

