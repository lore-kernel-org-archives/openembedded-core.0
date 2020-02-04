Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
	[209.85.222.195])
	by mail.openembedded.org (Postfix) with ESMTP id BDCFF611E3
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Feb 2020 03:57:47 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id h4so5753159qkm.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Feb 2020 19:57:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=lqXz9CMCvY5QfYydTs2ixKoiww1hCVO8Do7+vyOxGQ8=;
	b=kwjnyRXfCFT/foUXdqVwUzP/zqrV/qGdkkIJRRvX5jbQnx/oenQHqAm3fullnEGPSZ
	lslWXCi3WIMUMRFf54TD6L9yn7M3LfC/D0k3zoY7a9D8nVETz5snV+NCivyxqf+eEKFV
	8/WpJPql5p/V7Kk4nZLmrw4+Bv2abtVmxQTtpi4r8R5ivzJeZ84IqG6B4u2x22WBFLGM
	DyHLbwkQZlrza2Y+UYxA/meziJkSp3n8SBQyVTddEMDPpRE5ngzhslOZ/QQsrsB5RO84
	UEQcj+aR++k1Wm1wVT4tvvXDgh8tpy+lVUkz6yVJc6l9mYCbHQ4uM/5McU9WVvPLpHOe
	uoKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=lqXz9CMCvY5QfYydTs2ixKoiww1hCVO8Do7+vyOxGQ8=;
	b=VBWbPjLUjerOduGTD5R4vegD8TWyzD6tndbT9Ef46o7DRwPfmSxrAXI+DcO6CGR+g1
	ibPntKNdYsKR4I+RRn2/iWyh6qJmfTANbYTBe16ufzpHvNicBAS/n50oLjSj+KXz/GqZ
	DE94l2nlj6I0swqrnqP9nGNZ3w2riOe5AzoIl86ORlSileOpMgSKnAYUfindXcWALqu0
	366fmy7qWSdoEuZt5zU+3Z+tHuvnWg86/SMYANv5575kSlKd/9xPLt7tPL0zdxUk5zUF
	LSIgLSg78Ft6WhiHZGea6gEdqiz6Shh5cKv1a7Qt/o0IYZNRQ8/t0AIgngbKEN3drbCt
	tfeg==
X-Gm-Message-State: APjAAAU8qcpSuJ+IX+5Tl3ay5GHgziQif5u57ijuGmro6HUcaBd88yqi
	5c3GkxbkEw+hw3+2qJk2o/I5DpPfJOwujHIjDwchbXv/
X-Google-Smtp-Source: APXvYqxnX6c/NBxDvbI5WsnAEvmNHhAEsDDD9PVd2dj4211svAs6OQR44hkjP2UvbYyMW7/Ze92byrLj0gamIjq8Qks=
X-Received: by 2002:ae9:ef50:: with SMTP id d77mr26452652qkg.71.1580788668048; 
	Mon, 03 Feb 2020 19:57:48 -0800 (PST)
MIME-Version: 1.0
References: <20200204022006.714-1-takondra@cisco.com>
In-Reply-To: <20200204022006.714-1-takondra@cisco.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 3 Feb 2020 19:57:20 -0800
Message-ID: <CAMKF1sqmKCwbdE1uncP+k+7OQGrHawJ3dTM1h1_yO9EJuV00iQ@mail.gmail.com>
To: Taras Kondratiuk <takondra@cisco.com>
Cc: XE-Linux <xe-linux-external@cisco.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gcc-9.2: fix bug #91102 'aarch64 ICE on Linux kernel with -Os'
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
X-List-Received-Date: Tue, 04 Feb 2020 03:57:47 -0000
Content-Type: text/plain; charset="UTF-8"

this is ok. Also please ask it to be backported to 9.3 on gcc bugzilla

On Mon, Feb 3, 2020 at 6:20 PM Taras Kondratiuk <takondra@cisco.com> wrote:
>
> Linux kernel compilation for aarch64 triggers ICE if
> CONFIG_CC_OPTIMIZE_FOR_SIZE=y.
>
> The rootcause is GCC bug #91102 'aarch64 ICE on Linux kernel with -Os'.
> Apply the fix to 9.2.
>
> Signed-off-by: Taras Kondratiuk <takondra@cisco.com>
> ---
>  meta/recipes-devtools/gcc/gcc-9.2.inc         |  1 +
>  ...02-aarch64-ICE-on-Linux-kernel-with-.patch | 95 +++++++++++++++++++
>  2 files changed, 96 insertions(+)
>  create mode 100644 meta/recipes-devtools/gcc/gcc-9.2/re-PR-target-91102-aarch64-ICE-on-Linux-kernel-with-.patch
>
> diff --git a/meta/recipes-devtools/gcc/gcc-9.2.inc b/meta/recipes-devtools/gcc/gcc-9.2.inc
> index 926df11c2782..2bae85afe3a3 100644
> --- a/meta/recipes-devtools/gcc/gcc-9.2.inc
> +++ b/meta/recipes-devtools/gcc/gcc-9.2.inc
> @@ -69,6 +69,7 @@ SRC_URI = "\
>            file://CVE-2019-15847_1.patch \
>            file://CVE-2019-15847_2.patch \
>            file://CVE-2019-15847_3.patch \
> +           file://re-PR-target-91102-aarch64-ICE-on-Linux-kernel-with-.patch \
>  "
>  S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/gcc-${PV}"
>  SRC_URI[md5sum] = "3818ad8600447f05349098232c2ddc78"
> diff --git a/meta/recipes-devtools/gcc/gcc-9.2/re-PR-target-91102-aarch64-ICE-on-Linux-kernel-with-.patch b/meta/recipes-devtools/gcc/gcc-9.2/re-PR-target-91102-aarch64-ICE-on-Linux-kernel-with-.patch
> new file mode 100644
> index 000000000000..c37e0bb9dd9b
> --- /dev/null
> +++ b/meta/recipes-devtools/gcc/gcc-9.2/re-PR-target-91102-aarch64-ICE-on-Linux-kernel-with-.patch
> @@ -0,0 +1,95 @@
> +From efb0ee06f5c0186c2d1442ecd4dbbd55dbd97b44 Mon Sep 17 00:00:00 2001
> +From: Vladimir Makarov <vmakarov@redhat.com>
> +Date: Wed, 10 Jul 2019 16:07:10 +0000
> +Subject: [PATCH] re PR target/91102 (aarch64 ICE on Linux kernel with -Os
> + starting with r270266)
> +
> +2019-07-10  Vladimir Makarov  <vmakarov@redhat.com>
> +
> +       PR target/91102
> +       * lra-constraints.c (process_alt_operands): Don't match user
> +       defined regs only if they are early clobbers.
> +
> +2019-07-10  Vladimir Makarov  <vmakarov@redhat.com>
> +
> +       PR target/91102
> +       * gcc.target/aarch64/pr91102.c: New test.
> +
> +From-SVN: r273357
> +Upstream-Status: Backport [https://github.com/gcc-mirror/gcc/commit/613caed2feb9cfc8158308670b59df3d031ec629]
> +[takondra: dropped conflicting ChangeLog changes]
> +Signed-off-by: Taras Kondratiuk <takondra@cisco.com>
> +---
> + gcc/lra-constraints.c                      | 17 ++++++++++----
> + gcc/testsuite/gcc.target/aarch64/pr91102.c | 26 ++++++++++++++++++++++
> + 2 files changed, 39 insertions(+), 4 deletions(-)
> + create mode 100644 gcc/testsuite/gcc.target/aarch64/pr91102.c
> +
> +diff --git a/gcc/lra-constraints.c b/gcc/lra-constraints.c
> +index cf33da8013e4..6382dbf852b6 100644
> +--- a/gcc/lra-constraints.c
> ++++ b/gcc/lra-constraints.c
> +@@ -2172,8 +2172,9 @@ process_alt_operands (int only_alternative)
> +                   else
> +                     {
> +                       /* Operands don't match.  If the operands are
> +-                         different user defined explicit hard registers,
> +-                         then we cannot make them match.  */
> ++                         different user defined explicit hard
> ++                         registers, then we cannot make them match
> ++                         when one is early clobber operand.  */
> +                       if ((REG_P (*curr_id->operand_loc[nop])
> +                            || SUBREG_P (*curr_id->operand_loc[nop]))
> +                           && (REG_P (*curr_id->operand_loc[m])
> +@@ -2192,9 +2193,17 @@ process_alt_operands (int only_alternative)
> +                               && REG_P (m_reg)
> +                               && HARD_REGISTER_P (m_reg)
> +                               && REG_USERVAR_P (m_reg))
> +-                            break;
> ++                            {
> ++                              int i;
> ++
> ++                              for (i = 0; i < early_clobbered_regs_num; i++)
> ++                                if (m == early_clobbered_nops[i])
> ++                                  break;
> ++                              if (i < early_clobbered_regs_num
> ++                                  || early_clobber_p)
> ++                                break;
> ++                            }
> +                         }
> +-
> +                       /* Both operands must allow a reload register,
> +                          otherwise we cannot make them match.  */
> +                       if (curr_alt[m] == NO_REGS)
> +diff --git a/gcc/testsuite/gcc.target/aarch64/pr91102.c b/gcc/testsuite/gcc.target/aarch64/pr91102.c
> +new file mode 100644
> +index 000000000000..70b99045a48e
> +--- /dev/null
> ++++ b/gcc/testsuite/gcc.target/aarch64/pr91102.c
> +@@ -0,0 +1,26 @@
> ++/* PR target/91102 */
> ++/* { dg-do compile } */
> ++/* { dg-options "-O2" } */
> ++
> ++int
> ++foo (long d, long l)
> ++{
> ++  register long e asm ("x1") = d;
> ++  register long f asm("x2") = l;
> ++  asm ("" : : "r" (e), "r" (f));
> ++  return 3;
> ++}
> ++
> ++struct T { int i; int j; };
> ++union S { long h; struct T t; };
> ++
> ++void
> ++bar (union S b)
> ++{
> ++  while (1)
> ++    {
> ++      union S c = b;
> ++      c.t.j++;
> ++      b.h = foo (b.h, c.h);
> ++    }
> ++}
> --
> 2.18.1
>

