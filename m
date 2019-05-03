Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	by mail.openembedded.org (Postfix) with ESMTP id C040D7D718
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 May 2019 23:31:49 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id t1so7966170qtc.12
	for <openembedded-core@lists.openembedded.org>;
	Fri, 03 May 2019 16:31:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=3vacLqYhS+sL+Ag0xoFUoMWQ1onV/nA5GgDT95SzvC8=;
	b=Xuk1CWSQLhGr6dicoa+DxgeYDIvrGJqZlUG7zqEF+elkbKoOYXWLQJFALvCZIldVu5
	2Al0D4SV+2f/m6IRxgaPcfZk7gDZueiMPcVQfxWmDYeKY3YAFCNgcjQTO5sORbBcginb
	vRHMM3V+dl6VyZp/sbMJCCViKiRtdyE/PrKQCwWGQy2TbXaBuHzNF1EG56Kq3hniXVQp
	g87j9SAGvqU2u4Dt6NlHn+0AZlQGQXTvA75PMUONQ4epo/ei1RVsWtsIkqVFdhPnTYov
	HD30AOG0k+Z+rbJoBr9OUGW/DpAdXS3+a9akrsKe8q5HUhtsNHj7b3ZxO1q/dmG0H+4g
	bz9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=3vacLqYhS+sL+Ag0xoFUoMWQ1onV/nA5GgDT95SzvC8=;
	b=kDczhZpv7Uww2WLm8EIhd+GSLHpyAAC4BCO2fyhiP3A1AVO9MlCXNuvdI2E8Bdsv5y
	uGCp4yZRJUYkLBWTQSNQ0qcIH3wpXGmJEPXewR1ZcwY4AvuPgxIMyNQceVeknmQ4ju30
	CZHH13zOpSuT8cuhjXocbJt6Zp6ayi0EeNbegMjQsIrky1Nbhv13V9mxxzoDQKIwX/N9
	voL+VMOYhXVsSyMRonFWAOl/OLa3Ii7C7xQqmYbFS6UlcCJJueGjZuA5t5NVxlbgTnWi
	qid6sq/jU+tsyb5n0G2nzjyhv8Cliou0B3eZFw1vadUbmfMNmRNUapK7Qo7+fKuLeHTt
	tU/Q==
X-Gm-Message-State: APjAAAWLalSyz6rTKC/1fFqw+zmVTe4iqicx/tKKe6wpa9YX77ejupLF
	zf6BeHAp6g67Wu8zGwzc3JwyKHInh244cK/R/w8=
X-Google-Smtp-Source: APXvYqwtqSPjgL8CMJBX4gJF59nrmeXlRr1DZaz2VKLYYHbnQGli/VA1a4ceb4PM71X8+A6I/NguEvfUlMdHJmlT1Zg=
X-Received: by 2002:a0c:b620:: with SMTP id f32mr10542975qve.228.1556926310325;
	Fri, 03 May 2019 16:31:50 -0700 (PDT)
MIME-Version: 1.0
References: <20190503092100.21596-1-s.mueller-klieser@phytec.de>
In-Reply-To: <20190503092100.21596-1-s.mueller-klieser@phytec.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 3 May 2019 16:31:24 -0700
Message-ID: <CAMKF1sozQ2pT0CWmA1XusPAK1+mxD1uP50y0rjKZJj9szSzi0Q@mail.gmail.com>
To: =?UTF-8?Q?Stefan_M=C3=BCller=2DKlieser?= <s.mueller-klieser@phytec.de>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] cml1.bbclass: fix undefined behavior
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 03 May 2019 23:31:50 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 3, 2019 at 2:21 AM Stefan M=C3=BCller-Klieser
<s.mueller-klieser@phytec.de> wrote:
>
> Whenever cml1 do_configure is used with a defconfig, oldconfig waits for
> input. This silently fails with:
> "Error in reading or end of file."
> Replace the call with olddefconfig, which will have the same effect in
> setting all defaults, but has a defined behavior.
>
> Signed-off-by: Stefan M=C3=BCller-Klieser <s.mueller-klieser@phytec.de>
> ---
>  meta/classes/cml1.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes/cml1.bbclass b/meta/classes/cml1.bbclass
> index 98d24cec746b..f3b8a84073c8 100644
> --- a/meta/classes/cml1.bbclass
> +++ b/meta/classes/cml1.bbclass
> @@ -1,7 +1,7 @@
>  cml1_do_configure() {
>         set -e
>         unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
> -       oe_runmake oldconfig
> +       oe_runmake olddefconfig

This does not work for busybox/x86_64


| NOTE: make CC=3Dx86_64-yoe-linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2
-msse3 -mfpmath=3Dsse -fstack-protector-strong  -D_FORTIFY_SOURCE=3D2
--sysroot=3D/mnt/a/yoe/build/tmp/work/core2-64-yoe-linux/busybox/1.30.1-r0/=
recipe-sysroot
LD=3Dx86_64-yoe-linux-gcc  -m64 -march=3Dcore2 -mtun
e=3Dcore2 -msse3 -mfpmath=3Dsse -fstack-protector-strong
-D_FORTIFY_SOURCE=3D2
--sysroot=3D/mnt/a/yoe/build/tmp/work/core2-64-yoe-linux/busybox/1.30.1-r0/=
recipe-sysroot
V=3D1 ARCH=3Dx86_64 CROSS_COMPILE=3Dx86_64-yoe-linux- SKIP_STRIP=3Dy
HOSTCC=3Dgcc  HOSTCPP=3Dgcc  -E olddefconfig
| make -f scripts/Makefile.build obj=3Dscripts/basic
| /mnt/a/yoe/build/tmp/work/core2-64-yoe-linux/busybox/1.30.1-r0/busybox-1.=
30.1/scripts/gen_build_files.sh
/mnt/a/yoe/build/tmp/work/core2-64-yoe-linux/busybox/1.30.1-r0/busybox-1.30=
.1
/mnt/a/yoe/build/tmp/work/core2-64-yoe-linux/busybox/1.30.1-r0/busybox-1.30=
.1
| mkdir -p include
| make -f scripts/Makefile.build obj=3Dscripts/kconfig olddefconfig
| make[1]: *** No rule to make target 'olddefconfig'.  Stop.
| make: *** [Makefile:445: olddefconfig] Error 2

>  }
>
>  EXPORT_FUNCTIONS do_configure
> --
> 2.20.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

