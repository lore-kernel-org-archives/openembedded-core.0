Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34202E6ADF9
	for <webhook@archiver.kernel.org>; Tue, 26 Nov 2024 11:03:42 +0000 (UTC)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.web11.43661.1732619013597186181
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Nov 2024 03:03:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VY4Pzp45;
 spf=pass (domain: gmail.com, ip: 209.85.219.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-6d405853c0fso39305856d6.0
        for <openembedded-core@lists.openembedded.org>; Tue, 26 Nov 2024 03:03:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732619012; x=1733223812; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wxI0GSatjHddHME8vtbpm0lxFnnmJ5tn6i870Y2mUpI=;
        b=VY4Pzp45N97LY9pWzBfCeskwWMHFo/0Ut5V/NJ4WtTJpX3bnf19P9Joj13V8WNt2tn
         YD8zVkyVIvYVbd8LsF4d3ZkqWl/AQnx6+RFuyfoipIYKfFIRnciyACRKuL38W5vuF4Ho
         lbM7JdlD84qFHaMNUmH/5zuEhB1EU7ETFKcuw+YCNabG9cbOGPowI/4MaWVSBbfcP9XO
         DUgbmtmwG7xXO6vuQ0QU5dT/jNJj/1mJCpBOEB68YkXaI2hv7mHjFSzBltQqRJ+YZ1EK
         2a3Ers30UUaa64M5wzsMKRDixWOo9TjKbunncNtwhpd0ieoS+aK0pIbHnctcU9XBBp6q
         Bp9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732619012; x=1733223812;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wxI0GSatjHddHME8vtbpm0lxFnnmJ5tn6i870Y2mUpI=;
        b=SjwY6wINkVe1bFM3x3D+K27+x2sJSt+D9HPrxf9NpimMqo3+b8aQnrIUD1uFwyAIZC
         lRPwIhNbJ3FLD0STv7NdAnzSjLIryoY7dqTqtApJkNi5Rcvv9P75H4m6tgWbehkT/wng
         /vC+gKreebBmgEOAsZK1qMIgVaxzAdwu3U73DPu42B8p3v+RUuHnKdPPK6otH50t8kx0
         NWMHejnnxI8uaX2KOeks49y1uPbqJzquunv0pR0Yx9UkSHURKzkS+CgUB6XfogJiJQ24
         HFGVfkqYEku606Y8Tj0xaO6YFOBinXwqZVyCeoneWKRd+vymT5QlOpYRmMrJGMocbuvo
         Lajw==
X-Gm-Message-State: AOJu0YyCVLzso28Et5I9VZ84lOGZAc2kQchaXrIPuXaK1N0Bgm2Rw0XJ
	r5q0tzwthwCuQG0pGEvs3ttD0zGzhdxPoH2or+LvxT1Rpsy1MONHl4xWcclikvEfWJZsc4HDpq6
	e14uKU7C/ixwf65jYkB/8cSLKKU444w==
X-Gm-Gg: ASbGncsu3IeM04Pw/o4QM0+cOR6fLGq3zxC/AY9FTTnWlgYULfBmjYIjhISV7NJlEq4
	ruV0CjWrC3KAErvxY8W1Vqm/fRcl2cj2Hf3mB0yfGSBjjs4SWPx3SUcLNz76nxnK1yw==
X-Google-Smtp-Source: AGHT+IFYQ29aaE84s705p6BqRppbDaQh6O1x/PO+34JfVs9VCGcf15QYzPTihH1FVWYDK41AWNLTmtdnYRKrHbqp3t4=
X-Received: by 2002:a05:6214:21eb:b0:6d4:1a42:8f06 with SMTP id
 6a1803df08f44-6d450adde12mr272240296d6.0.1732619012399; Tue, 26 Nov 2024
 03:03:32 -0800 (PST)
MIME-Version: 1.0
References: <5cbad45fe23c4e52bb37e5547b6d8494@diehl.com>
In-Reply-To: <5cbad45fe23c4e52bb37e5547b6d8494@diehl.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 26 Nov 2024 12:03:21 +0100
Message-ID: <CANNYZj_=NZSamJwovnvPWfYSvYp=5Q9cfGqVOrWyBr_j4iNPsQ@mail.gmail.com>
Subject: Re: [EXT] Re: [OE-core] [PATCH 3/3] linux-yocto: add WITH
 Linux-syscall-note to LICENSE
To: Denis OSTERLAND-HEIM <denis.osterland@diehl.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Nov 2024 11:03:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207844

Thanks, if you find time to work on some of these, that would be great.

Alex

On Mon, 25 Nov 2024 at 13:32, Denis OSTERLAND-HEIM
<denis.osterland@diehl.com> wrote:
>
> Hi,
>
> Most likely those:
>
> $ git grep -E 'LICENSE.*-with-'
> meta/recipes-connectivity/socat/socat_1.8.0.0.bb:LICENSE =
> "GPL-2.0-with-OpenSSL-exception"
> meta/recipes-core/newlib/newlib.inc:LICENSE = "GPL-2.0-only & LGPL-3.0-only
> & GPL-3.0-only & LGPL-2.0-only & BSD-2-Clause & BSD-3-Clause & TCL &
> Apache-2.0-with-LLVM-exception"
> meta/recipes-devtools/autoconf-archive/autoconf-archive_2024.10.16.bb:LICENS
> E = "GPL-3.0-with-autoconf-exception"
> meta/recipes-devtools/gcc/gcc-14.2.inc:LICENSE = "GPL-3.0-with-GCC-exception
> & GPL-3.0-only"
> meta/recipes-devtools/gcc/gcc-runtime.inc:LICENSE =
> "GPL-3.0-with-GCC-exception"
> meta/recipes-devtools/gcc/libgcc-initial.inc:LICENSE =
> "GPL-3.0-with-GCC-exception"
> meta/recipes-devtools/gcc/libgcc.inc:LICENSE:${PN} =
> "GPL-3.0-with-GCC-exception"
> meta/recipes-devtools/gcc/libgcc.inc:LICENSE:${PN}-dev =
> "GPL-3.0-with-GCC-exception"
> meta/recipes-devtools/gcc/libgcc.inc:LICENSE:${PN}-dbg =
> "GPL-3.0-with-GCC-exception"
> meta/recipes-devtools/gcc/libgfortran.inc:LICENSE:${PN} =
> "GPL-3.0-with-GCC-exception"
> meta/recipes-devtools/gcc/libgfortran.inc:LICENSE:${PN}-dev =
> "GPL-3.0-with-GCC-exception"
> meta/recipes-devtools/gcc/libgfortran.inc:LICENSE:${PN}-dbg =
> "GPL-3.0-with-GCC-exception"
> meta/recipes-devtools/gnu-config/gnu-config_git.bb:LICENSE =
> "GPL-3.0-with-autoconf-exception"
> meta/recipes-devtools/llvm/llvm_19.1.3.bb:LICENSE =
> "Apache-2.0-with-LLVM-exception"
> meta/recipes-devtools/rust/rust-llvm_1.80.1.bb:LICENSE ?=
> "Apache-2.0-with-LLVM-exception"
> meta/recipes-extended/xz/xz_5.6.3.bb:LICENSE = "GPL-2.0-or-later &
> GPL-3.0-with-autoconf-exception & LGPL-2.1-or-later & 0BSD"
> meta/recipes-graphics/glslang/glslang_1.3.296.0.bb:LICENSE = "BSD-3-Clause &
> BSD-2-Clause & MIT & Apache-2.0 & GPL-3-with-bison-exception"
> meta/recipes-support/libgit2/libgit2_1.8.2.bb:LICENSE =
> "GPL-2.0-with-GCC-exception & MIT & OpenSSL & BSD-3-Clause & Zlib & ISC &
> LGPL-2.1-or-later & CC0-1.0 & BSD-2-Clause"
>
> To migrate Apache-2.0-with-LLVM-exception to Apache-2.0 WITH LLVM-exception
> should be straight forward. [^1]
> GPL-3.0-with-GCC-exception becomes "WITH GCC-exception-3.1", but we have to
> check if it is GPL-3.0-only or GPL-3.0-or-later first. [^2]
> GPL-3.0-with-autoconf-exception becomes "WITH Autoconf-exception-3.0" and
> also the check first. [^3]
> GPL-2.0-with-bison-exception becomes "WITH Bison-exception-2.2" and also the
> check first. [^4]
>
> This is from a SPDX point of view.
> If the source explicitly states the deprecated license, it could be better
> to stay with that one.
>
> [^1]: https://spdx.org/licenses/LLVM-exception.html
> [^2]: https://spdx.org/licenses/GPL-3.0-with-GCC-exception.html
> [^3]: https://spdx.org/licenses/GPL-3.0-with-autoconf-exception.html
> [^4]: https://spdx.org/licenses/GPL-2.0-with-bison-exception.html
>
> -----Original Message-----
> From: Alexander Kanavin <alex.kanavin@gmail.com>
> Sent: Monday, November 25, 2024 12:59 PM
> To: Denis OSTERLAND-HEIM <denis.osterland@diehl.com>
> Cc: openembedded-core@lists.openembedded.org
> Subject: [EXT] Re: [OE-core] [PATCH 3/3] linux-yocto: add WITH
> Linux-syscall-note to LICENSE
>
> [EXTERNAL EMAIL]
>
>
> Thanks, the patchset is fine, but I wonder if there are other recipes in
> oe-core which would benefit from WITH suppport?
>
> Alex
>
> On Mon, 25 Nov 2024 at 12:58, Denis OSTERLAND-HEIM via
> lists.openembedded.org <denis.osterland=diehl.com@lists.openembedded.org>
> wrote:
> >
> > According to Linux COPYING file this exception is made to GPL v2.
> >
> > Signed-off-by: Denis Osterland-Heim <denis.osterland@diehl.com>
> > ---
> >  meta/files/common-licenses/Linux-syscall-note | 25 +++++++++++++++++++
> >  meta/recipes-kernel/linux/linux-yocto.inc     |  2 +-
> >  2 files changed, 26 insertions(+), 1 deletion(-)  create mode 100644
> > meta/files/common-licenses/Linux-syscall-note
> >
> > diff --git a/meta/files/common-licenses/Linux-syscall-note
> > b/meta/files/common-licenses/Linux-syscall-note
> > new file mode 100644
> > index 0000000000..9abdad71fa
> > --- /dev/null
> > +++ b/meta/files/common-licenses/Linux-syscall-note
> > @@ -0,0 +1,25 @@
> > +SPDX-Exception-Identifier: Linux-syscall-note
> > +SPDX-URL: https://spdx.org/licenses/Linux-syscall-note.html
> > +SPDX-Licenses: GPL-2.0, GPL-2.0+, GPL-1.0+, LGPL-2.0, LGPL-2.0+,
> > +LGPL-2.1,
> > LGPL-2.1+, GPL-2.0-only, GPL-2.0-or-later
> > +Usage-Guide:
> > +  This exception is used together with one of the above SPDX-Licenses
> > +  to mark user space API (uapi) header files so they can be included
> > +  into non GPL compliant user space application code.
> > +  To use this exception add it with the keyword WITH to one of the
> > +  identifiers in the SPDX-Licenses tag:
> > +    SPDX-License-Identifier: <SPDX-License> WITH Linux-syscall-note
> > +License-Text:
> > +
> > +   NOTE! This copyright does *not* cover user programs that use
> > + kernel services by normal system calls - this is merely considered
> > + normal use of the kernel, and does *not* fall under the heading of
> "derived work".
> > + Also note that the GPL below is copyrighted by the Free Software
> > + Foundation, but the instance of code that it refers to (the Linux
> > + kernel) is copyrighted by me and others who actually wrote it.
> > +
> > + Also note that the only valid version of the GPL as far as the
> > + kernel is concerned is _this_ particular version of the license (ie
> > + v2, not
> > + v2.2 or v3.x or whatever), unless explicitly otherwise stated.
> > +
> > +                       Linus Torvalds
> > +
> > diff --git a/meta/recipes-kernel/linux/linux-yocto.inc
> > b/meta/recipes-kernel/linux/linux-yocto.inc
> > index 0132fcffb3..3de8318c39 100644
> > --- a/meta/recipes-kernel/linux/linux-yocto.inc
> > +++ b/meta/recipes-kernel/linux/linux-yocto.inc
> > @@ -1,6 +1,6 @@
> >  SUMMARY = "Linux kernel"
> >  SECTION = "kernel"
> > -LICENSE = "GPL-2.0-only"
> > +LICENSE = "GPL-2.0-only + Linux-syscall-note"
> >  HOMEPAGE = "https://www.yoctoproject.org/"
> >
> >  LIC_FILES_CHKSUM ?= "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"
> > --
> > 2.45.2
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#207746):
> > https://lists.openembedded.org/g/openembedded-core/message/207746
> > Mute This Topic: https://lists.openembedded.org/mt/109769586/1686489
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub
> > [alex.kanavin@gmail.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >

