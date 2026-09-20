Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0966C982CC
	for <webhook@archiver.kernel.org>; Sun, 20 Sep 2026 01:51:14 +0000 (UTC)
Received: from mail-yx2-f13.google.com (mail-yx2-f13.google.com [74.125.224.141])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23063.1789869068337430465
 for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Sep 2026 18:51:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=OC48Cvue;
 spf=pass (domain: gmail.com, ip: 74.125.224.141, mailfrom: raj.khem@gmail.com)
Received: by mail-yx2-f13.google.com with SMTP id 956f58d0204a3-66fabb1a601so1592436d50.3
        for <openembedded-core@lists.openembedded.org>; Sat, 19 Sep 2026 18:51:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789869067; cv=none;
        d=google.com; s=arc-20260327;
        b=aZ2li/QvKqmgXi3++memlfN01mcroeEmlNdKznWnTVz6nCnHc3+Jcyi7NzOrqRXMvu
         4o922ySdS5wq5WfyX15fs+MqMjft8ByYPHa2KS0XjKU2AMm7IqIozrYnb0j+iwdCp6tO
         3PUHkuIYZAKPTksAU+A1uBVJumtphuivMBQaCviA3kBInyvFUPzVg3lP3ldo57XKgWM/
         vc2qa6NdUR2vgpEAYn9E0WPTfEWpNTYfvovc6UPnFZH4U7FNS7dPC508px0sYfG/RHFK
         Ru+/WrVnt+CfEAFcRpoGRwarmfX843FXQ//ZhkaLnoTXXqLNK1Kx3KVsZNkY/y0IJ4u/
         A6qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=jS5k/KUMu8z9RN7sW6wpRTWhARPoTwmlseLTOpe3fGg=;
        fh=2tRbkh9USu5x3C+6pK/CbohOrqrZJdfRQMueNE2H0s4=;
        b=kwuLJPAvoFwpcksPsiBDwytL5SdMhYTRRJMcpNS0ZrhDL6FnYRQLAFCmrR9IMJw4gh
         YUS5TFwIn01yyZ/N2u2gTT2Nxc96jX0PyeVNgrO0k4m0FupGuAxiA81n9X5+7q+y1KeR
         XWrzR8npBKTVOQUNA4+V0122v2/+mVwJ3Ql3b6hfAEDGAUDXAnRvW7vhVkERHvSnJuBd
         VQRbojUHYYsa5txnZ4Y9MKsSaqjO8gxymu9tT2f7g31pq1qMIfGV6kBfXvZjExINFjeR
         PUsMM0J/c61R2ESXx5NWAY/rey3R81kzaO2Sm1Q95Ux6A5Xm46YIYgubD6yaXuhsu9kE
         JR+A==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789869067; x=1790473867; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jS5k/KUMu8z9RN7sW6wpRTWhARPoTwmlseLTOpe3fGg=;
        b=OC48CvueQY2uzZZH3su8KIDhVPqydj93MVRvrgBjCxj7JW1zuHoOUNnsuLF2PzL8nl
         b7Ns497CrukeeFPoBag0mu6gUp0ySSKUJkQ/wsQQ5bGFjDtm5J1ZApWO17sWjts2VaQI
         woC7ZALJ40KXqp3yp+SvFkejWeOFNhWlxeYGRQjQ4qL9hWRxwmTzAbC/Y9qxn+w8k/tB
         qlqL/uA+pG8fQENtg9/PJmThw+mIW7xtlAH0WJt9qzM6MGHpyRRhS6KHa4RWANUgRUlY
         sMMpO+Sy6tHG4CwcpmqZmowmeQrWCbpbsTZJQxJIUpGRt4CkH+Z3p6mX6d6Uki7GdkPq
         APiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789869067; x=1790473867;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jS5k/KUMu8z9RN7sW6wpRTWhARPoTwmlseLTOpe3fGg=;
        b=azdUYzAzc1NnBEut8Q+Z0TlntVj5uGdCFa1FiDFurezwmYvxTYnvqvKncTig6BBIwL
         q6j+4qIzUpIZx1AKzMOaZ5RRbpre7KEr+Rjl4uBDXOpwlwVyOPhcTanzdkEzbNFsdqM+
         Hb8hHv/klw59k5bGfGxrD5V9DM5bGfmOKGS1R+xkdFxBTvBxy2g+wAAHL/YLjYWQe9w1
         o1ClbnOHfBmzO43Hn+cscWF4WWONpyfT+ToP0CWWI6Q9znEcqQLMtSVJc6Z2/Gv++13N
         ytUVvLn/K3TEFfWd1jy+utGM5lK8FIKyFpHeuyto+rwDqlHVztvWxC9MwS279ySp7dWp
         M3lA==
X-Gm-Message-State: AFuF++mttaxn7H4WFe7vN44o9FTbhZIlxW+NucVixi7fQ8+oJgfKn9CT
	KRenwY86jbrztxA/IjeV7V5KDSJUFChqnVWWmS9XXDYTsx7lrONxtURmUVp8PDWKLGMehWikdya
	Y8J/RhaRuYH38SYme0nz9i6b1mGNw9kk=
X-Gm-Gg: AYBFou2wcEVF9x0nToEdDQAEb/3XWnNSrqiKcyOxLCVNOTZpVEpg/knhV47acVUare/
	dBZvfEpStQpahOoU5oLXTjLMB1ZIFsG+WAeobJRJd4Q0wKGmFP3Hy6X0fhGracC/kF8Rs02CH2I
	prpqnQ0HZ8EaAl50q6bzH/Ryc212Toqf56RE0UYd6Oe03hv8p14PgIoanmiheqEWj4xTzadWDJF
	WwBteLaSXKnyNqOlm3xiY42v53BtvrJWs+7NIqxma19zveNEZRFgiWoSI6Yf30KHb4ZV3AIl4R7
	Hk8oBcHaDTfQqz2AknU9HVJQ6HtWlC+I+Dmic8oTYr/ANm0RZ+fjy/GZVpEXSLqMZmOZI1ceQG2
	PpgiIq/Lv/pKG5Me/EjJIAtWyiPquFmRnMBRv+SHKi+uNBgYjpRzaSi7c8YREYV8WjHcnuYqEHf
	KyqUy58EaP9jGRTrnTrdQPrVD1IfIygOkK09aVoe32mr4JM+sCDlcN9XyT7oxibqMGuvmyUJiHG
	NS9zJUwMuVCsEgSxG6Lmp382eE5bhyZWHUAAlydWrUbywOlopnTnHgg4G74E9X9LJfzCTK1yy+T
	qhoSNt7/KUbXDv2rwwM2LmuLzLkqvJNr1kl/xrKU
X-Received: by 2002:a05:690e:c4a:b0:672:a52c:db34 with SMTP id
 956f58d0204a3-672a52ce2fdmr402126d50.108.1789869067206; Sat, 19 Sep 2026
 18:51:07 -0700 (PDT)
MIME-Version: 1.0
References: <20260915190244.2983746-1-tgamblin@baylibre.com>
In-Reply-To: <20260915190244.2983746-1-tgamblin@baylibre.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 19 Sep 2026 18:50:41 -0700
X-Gm-Features: AcwNN1VLpJSBn3u_JS2Dad3zH6tdlxKuDvm-lUqckvlq557ClBlk6V2uh5C40kA
Message-ID: <CAMKF1srYY2cHyLBUs3F5Mt8W1XCp=YSjE9fgjCJYLpEgZ=0h3w@mail.gmail.com>
Subject: Re: [OE-core][RFC PATCH 00/14] riscv: add new ISA extensions and
 profile support
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org, mark.hatle@kernel.crashing.org
Content-Type: multipart/alternative; boundary="000000000000f20555065be05dcc"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 20 Sep 2026 01:51:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246255

--000000000000f20555065be05dcc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I think pkgarch needs to sort out shortening. riscv_pkgarch() only helps
when TUNE_FEATURES is an exact superset of a known profile. SSTATE_PKGARCH
is never truncated so this can be trouble, perhaps generate_sstatefn should
be able to shorten pkgarch,

clang developer in me below cringes :)
A profile name used as package arch is an ABI claim with a compiler-derived
definition.
RISCV_PROFILES is "whatever gcc printed". If a future gcc adds an extension
to
its rva23u64 expansion and someone refreshes the table, feeds full of
rva23u64
packages silently change meaning =E2=80=94 and the table is gcc's view whil=
e
TOOLCHAIN may be clang. so maybe add a comment saying - "do not regenerate
from
the compiler; changing it changes package-arch semantics" and then cite the
RVA spec version
rather than a gcc invocation.

PACKAGE_EXTRA_ARCHS isn't modelling compatibility. e.g. rva20u64 binaries
run on rva22/rva23 hardware, but each profile is an isolated arch with zero
package sharing.

On Tue, Sep 15, 2026 at 12:02=E2=80=AFPM Trevor Gamblin <tgamblin@baylibre.=
com>
wrote:

> # Overview
>
> Support for the RISC-V architecture and a basic set of extensions has bee=
n
> available in oe-core for a long time now, and as of late 2025, QEMU
> defaults to
> the RVA23S64 profile when booting qemuriscv64 images. However, at the
> userspace
> level, we currently support only the standard "riscv64gc" profile (behind=
 a
> generic "riscv64" identifier), which is common across the wider open-sour=
ce
> ecosystem, but lacks many of the features which are starting to become
> necessary
> for more advanced experimentation and testing on RISC-V platforms. This
> series
> aims to remedy that by introducing several distinct changes across a few
> files.
> I've broken it up on a per-profile basis for easier review, but the final
> version could probably feature some squashed commits. It could also go th=
e
> route
> of breaking tunings up more in the style of those in
> conf/machine/include/arm/,
> but I'll leave them as-is for now to avoid even more rework that needs
> reviewing.
>
> A list of changes, by group:
>
> 1. Basic clarification changes and extra tunings:
>     a. tune-riscv: be explicit about riscv64gc default
>     b. tune-riscv.inc: add 'riscv64gcv' tune
> 2. Adding official RVA20 profile extensions, and supporting the explicit
> choice
> of 'rva20u64' as a tuning option for builds:
>     a. arch-riscv.inc: add missing RVA20 extensions
>     b. meta/lib/oe/tune.py: support profile strings, add rva20u64
>     c. tune-riscv.inc: add rva20u64 to AVAILTUNES
> 3. Adding RVA22 profile support:
>     a. arch-riscv.inc: add rva22u64 extensions
>     b. meta/lib/oe/tune.py: add rva22u64 profile
>     c. tune-riscv.inc: add rva22u64 to AVAILTUNES
> 4. Adding RVA23 profile support:
>     a. arch-riscv.inc: add rva23u64 extensions
>     b. meta/lib/oe/tune.py: add rva23u64 profile
>     c. tune-riscv.inc: add rva23u64 to AVAILTUNES
> 5. Quality-of-life fixups after 1-4:
>     a. meta/lib/oe/tune.py: add riscv_pkgarch()
>     b. arch-riscv.inc: rename TUNE_RISCV_PKGARCH ->
> TUNE_RISCV_PKGARCH_EXACT
>        in assignments
>     c. tune-riscv.inc: append zifencei extension to profiles
>
> These changes are also in my contrib branch[1]. The main sources of truth
> used
> were gcc's '-march' options list[2], the official RISC-V International
> documentation[3], and the RISC-V ISA Explorer[4], with the gcc specifics
> as the
> preferred source. When comparing against gcc's output, commands like the
> following were run:
>
> |tgamblin@megalith
> ~/workspace/ypbuilds/poky-qemuriscv64/layers/openembedded-core (master)$
> riscv64-linux-gnu-gcc -march=3Drva23u64 -mabi=3Dlp64d -Q --help=3Dtarget =
| grep
> rv64
> |  -march=3D
>  rv64imafdcbv_zic64b_zicbom_zicbop_zicboz_ziccamoa_ziccif_zicclsm_ziccrse=
_zicntr_zicond_zicsr_zihintntl_zihintpause_zihpm_zimop_zmmul_za64rs_zaamo_z=
alrsc_zawrs_zfa_zfhmin_zca_zcb_zcd_zcmop_zba_zbb_zbs_zkt_zvbb_zve32f_zve32x=
_zve64d_zve64f_zve64x_zvfhmin_z
>
> However, as is visible above, the extension list became so long for the
> RVA23
> case that it was truncated, and so a more verbose output from the
> following was
> checked instead:
>
> |riscv64-linux-gnu-gcc -march=3Drva23u64 -mabi=3Dlp64d -v -xc /dev/null -=
c -o
> /dev/null
>
> For now, the default tuning remains riscv64gc (with the naming rework in
> 1a),
> despite the presence of the other profiles. It is critical to note that
> not all
> combinations of the RISC-V extensions may be valid or useful to use for
> projects, and whenever possible a ratified profile's corresponding tune
> (e.g.
> "RVA22" -> "rva22u64") should be extended rather than picking and choosin=
g
> each
> feature. There are also several extensions which are depended on by other=
s
> (e.g.
> 'zkt' is needed by 'b'), and other known examples which aren't strictly
> part
> of the official profiles but must be included for the Yocto/OE case, such
> as
> 'zifencei' being necessary to build the Linux Kernel (which already had
> been
> addressed before, but this series handles slightly differently). This
> series
> makes no attempts to add extensions which are not part of these profiles =
-
> those
> could be added in future series, but these changes are significant enough
> for
> now. It might be worth adding some more documentation about how all of th=
is
> works - I'd be happy to hear what people think about that too.
>
> One significant change to the way profile strings are processed with
> these patches shows up in sstate/build path naming, and is part of the
> reason
> for patch 5a and 5b above - before, a build directory might have a path i=
n
> it
> like:
>
> |build/tmp/work/riscv64imafdc_zicsr_zifencei-poky-linux/
>
> This was fine when the extension list was short (for riscv64gc), but with
> the
> full RVA profiles, the paths started to get so long that bitbake would
> produce
> this error:
>
> |ERROR: Unable to reduce sstate name to less than 255 chararacters
>
> To solve this problem, meta/lib/oe/tune.py now supports a very short list
> of
> profile names, and includes a new function riscv_pkgarch() designed to
> compare
> selected extensions against known profiles and determine if once has
> implicitly
> been selected. As an example, if you set the following in local.conf:
>
> |TUNE_FEATURES =3D "${@oe.tune.riscv_isa_to_tune('riscv64gc')} ziccamoa
> ziccif zicclsm ziccrse zicntr zicsr zmmul za128rs zaamo zalrsc zca zcd"
>
> and then run 'bitbake -e opensbi', you will see:
>
> |PACKAGE_EXTRA_ARCHS=3D"rva20u64_zifencei"
>
> With all of this combined, subdirectories in tmp/work/ look like:
>
> |tgamblin@megalith ~/workspace/ypbuilds/poky-qemuriscv64 $ ls
> build/tmp/work
> |all-poky-linux          riscv64imafdcv_zicsr_zifencei-poky-linux
> rva20u64_zcmop_zifencei_zihintpause_zimop_zvbb-poky-linux
> rva22u64_zifencei-poky-linux  x86_64-linux
> |qemuriscv64-poky-linux  riscv64imafdc_zicsr_zifencei-poky-linux
>  rva20u64_zifencei-poky-linux
>  rva23u64_zifencei-poky-linux
>
> Note that the 'rva20u64_zcmop_zifencei_zihintpause_zimop_zvbb-poky-linux'
> configuration is a custom one I set in local.conf only for testing
> purposes.
> Custom tunings still run the ris(c|k) of exceeding the naming length,
> which we
> may need some extra logic to handle (or, again, find a way to make it
> behave
> more like arm) if we want to enable freely customizing build tunings. Thi=
s
> is an
> area where I'm hoping there will be some suggestions, as the way to do
> this in
> local.conf seems fairly ugly (but maybe that's a good thing?):
>
> |DEFAULTTUNE =3D "rva20u64"
> |TUNE_FEATURES =3D "${@oe.tune.riscv_isa_to_tune('rva20u64')} zihintpause
> zvbb zimop zcmop zifencei"
>
> A consequence of doing this is that a lot of other variables related to t=
he
> tuning features get "polluted":
>
> |tgamblin@megalith ~/workspace/ypbuilds/poky-qemuriscv64 $ bitbake -e
> opensbi | grep PACKAGE_EXTRA_ARCHS
> |#     "all any noarch ${PACKAGE_EXTRA_ARCHS} ${MACHINE_ARCH}"
> |#   "all any noarch ${PACKAGE_EXTRA_ARCHS} ${MACHINE_ARCH}"
> |# $PACKAGE_EXTRA_ARCHS [11 operations]
> |#     [_defaultval] "${PACKAGE_EXTRA_ARCHS:tune-${DEFAULTTUNE}}"
> |#   "${PACKAGE_EXTRA_ARCHS:tune-${DEFAULTTUNE}}"
> |PACKAGE_EXTRA_ARCHS=3D"rva20u64_zcmop_zifencei_zihintpause_zimop_zvbb"
> |# $PACKAGE_EXTRA_ARCHS:tune-riscv32gc
>
> |PACKAGE_EXTRA_ARCHS:tune-riscv32gc=3D"rva20u64_zcmop_zifencei_zihintpaus=
e_zimop_zvbb"
> |# $PACKAGE_EXTRA_ARCHS:tune-riscv32nf
>
> |PACKAGE_EXTRA_ARCHS:tune-riscv32nf=3D"rva20u64_zcmop_zifencei_zihintpaus=
e_zimop_zvbb"
> |# $PACKAGE_EXTRA_ARCHS:tune-riscv64gc
>
> |PACKAGE_EXTRA_ARCHS:tune-riscv64gc=3D"rva20u64_zcmop_zifencei_zihintpaus=
e_zimop_zvbb"
>
> # Testing
>
> Testing different profiles' validity against the compiler involved settin=
g
> (for
> example) DEFAULTTUNE =3D "rva23u64" and then running 'bitbake opensbi'
> (which also
> results in a kernel rebuild) as a quick smoke test. I've also opted to do
> full
> image builds to make sure that the new profiles fully boot and run withou=
t
> any
> obvious errors. Because I've been playing with coreutils on qemuriscv64 a
> lot
> lately, here are example results with each profile (plus riscv64gc and
> riscv64gcv, for completeness) enabled on a build and test of
> core-image-ptest-coreutils. Note that when the vector extension is enable=
d
> (riscv64gcv, rva23u64), the test duration is significantly higher:
>
> riscv64gc:
>
>
> |=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> |Testsuite summary for GNU coreutils 9.11
>
> |=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> |# TOTAL: 733
> |# PASS:  561
> |# SKIP:  172
> |# XFAIL: 0
> |# FAIL:  0
> |# XPASS: 0
> |# ERROR: 0
>
> |=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> |make[1]: Leaving directory '/usr/lib/coreutils/ptest'
> |DURATION: 671
> |END: /usr/lib/coreutils/ptest
> |2026-09-15T15:45
> |STOP: ptest-runner
> |TOTAL: 1 FAIL: 0
> |root@qemuriscv64:~#
>
> riscv64gcv:
>
>
> |=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> |Testsuite summary for GNU coreutils 9.11
>
> |=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> |# TOTAL: 733
> |# PASS:  561
> |# SKIP:  172
> |# XFAIL: 0
> |# FAIL:  0
> |# XPASS: 0
> |# ERROR: 0
>
> |=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> |make[1]: Leaving directory '/usr/lib/coreutils/ptest'
> |DURATION: 940
> |END: /usr/lib/coreutils/ptest
> |2026-09-15T16:39
> |STOP: ptest-runner
> |TOTAL: 1 FAIL: 0
> |root@qemuriscv64:~#
>
> rva20u64:
>
>
> |=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> |Testsuite summary for GNU coreutils 9.11
>
> |=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> |# TOTAL: 733
> |# PASS:  561
> |# SKIP:  172
> |# XFAIL: 0
> |# FAIL:  0
> |# XPASS: 0
> |# ERROR: 0
>
> |=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> |make[1]: Leaving directory '/usr/lib/coreutils/ptest'
> |DURATION: 660
> |END: /usr/lib/coreutils/ptest
> |2026-09-15T15:02
> |STOP: ptest-runner
> |TOTAL: 1 FAIL: 0
> |root@qemuriscv64:~#
>
> rva22u64:
>
>
> |=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> |Testsuite summary for GNU coreutils 9.11
>
> |=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> |# TOTAL: 733
> |# PASS:  561
> |# SKIP:  172
> |# XFAIL: 0
> |# FAIL:  0
> |# XPASS: 0
> |# ERROR: 0
>
> |=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> |make[1]: Leaving directory '/usr/lib/coreutils/ptest'
> |DURATION: 615
> |END: /usr/lib/coreutils/ptest
> |2026-09-15T13:48
> |STOP: ptest-runner
> |TOTAL: 1 FAIL: 0
> |root@qemuriscv64:~#
>
> rva23u64:
>
>
> |=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> |Testsuite summary for GNU coreutils 9.11
>
> |=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> |# TOTAL: 733
> |# PASS:  561
> |# SKIP:  172
> |# XFAIL: 0
> |# FAIL:  0
> |# XPASS: 0
> |# ERROR: 0
>
> |=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> |make[1]: Leaving directory '/usr/lib/coreutils/ptest'
> |DURATION: 966
> |END: /usr/lib/coreutils/ptest
> |2026-09-15T12:18
> |STOP: ptest-runner
> |TOTAL: 1 FAIL: 0
> |root@qemuriscv64:~#
>
> [1]:
> https://git.openembedded.org/openembedded-core-contrib/log/?h=3Dtgamblin/=
riscv64-tuning-rework
> [2]: https://gcc.gnu.org/onlinedocs/gcc/RISC-V-Options.html
> [3]: https://docs.riscv.org/reference/home/index.html
> [4]: https://riscv.github.io/riscv-isa-explorer/
>
> Trevor Gamblin (14):
>   tune-riscv: be explicit about riscv64gc default
>   tune-riscv.inc: add 'riscv64gcv' tune
>   arch-riscv.inc: add missing RVA20 extensions
>   meta/lib/oe/tune.py: support profile strings, add rva20u64
>   tune-riscv.inc: add rva20u64 to AVAILTUNES
>   arch-riscv.inc: add rva22u64 extensions
>   meta/lib/oe/tune.py: add rva22u64 profile
>   tune-riscv.inc: add rva22u64 to AVAILTUNES
>   arch-riscv.inc: add rva23u64 extensions
>   meta/lib/oe/tune.py: add rva23u64 profile
>   tune-riscv.inc: add rva23u64 to AVAILTUNES
>   meta/lib/oe/tune.py: add riscv_pkgarch()
>   arch-riscv.inc: rename TUNE_RISCV_PKGARCH -> TUNE_RISCV_PKGARCH_EXACT
>     in assignments
>   tune-riscv.inc: append zifencei extension to profiles
>
>  .../conf/machine/include/riscv/arch-riscv.inc | 198 ++++++++++++++++--
>  .../conf/machine/include/riscv/tune-riscv.inc |  24 ++-
>  meta/lib/oe/tune.py                           |  42 +++-
>  3 files changed, 240 insertions(+), 24 deletions(-)
>
> --
> 2.55.0
>
>

--000000000000f20555065be05dcc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I think=C2=A0pkgarch needs to sort out shortening.=C2=A0ri=
scv_pkgarch() only helps when TUNE_FEATURES is an exact superset of a known=
 profile. SSTATE_PKGARCH is never truncated so this can be trouble, perhaps=
=C2=A0generate_sstatefn should be able to shorten pkgarch,=C2=A0<br><div><b=
r></div><div>clang developer in me below cringes :)</div><div>A profile nam=
e used as package arch is an ABI claim with a compiler-derived definition.<=
/div><div>RISCV_PROFILES is &quot;whatever gcc printed&quot;. If a future g=
cc adds an extension to</div><div>its rva23u64 expansion and someone refres=
hes the table, feeds full of rva23u64</div><div>packages silently change me=
aning =E2=80=94 and the table is gcc&#39;s view while</div><div>TOOLCHAIN m=
ay be clang. so maybe add a comment saying - &quot;do not regenerate from</=
div><div>the compiler; changing it changes package-arch semantics&quot; and=
 then=C2=A0cite the RVA spec version</div><div>rather than a gcc invocation=
.<br><br></div><div>PACKAGE_EXTRA_ARCHS isn&#39;t modelling compatibility. =
e.g. rva20u64 binaries</div><div>run on rva22/rva23 hardware, but each prof=
ile is an isolated arch with zero package sharing.</div></div><br><div clas=
s=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_att=
r">On Tue, Sep 15, 2026 at 12:02=E2=80=AFPM Trevor Gamblin &lt;<a href=3D"m=
ailto:tgamblin@baylibre.com">tgamblin@baylibre.com</a>&gt; wrote:<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex"># Overview<br>
<br>
Support for the RISC-V architecture and a basic set of extensions has been<=
br>
available in oe-core for a long time now, and as of late 2025, QEMU default=
s to<br>
the RVA23S64 profile when booting qemuriscv64 images. However, at the users=
pace<br>
level, we currently support only the standard &quot;riscv64gc&quot; profile=
 (behind a<br>
generic &quot;riscv64&quot; identifier), which is common across the wider o=
pen-source<br>
ecosystem, but lacks many of the features which are starting to become nece=
ssary<br>
for more advanced experimentation and testing on RISC-V platforms. This ser=
ies<br>
aims to remedy that by introducing several distinct changes across a few fi=
les.<br>
I&#39;ve broken it up on a per-profile basis for easier review, but the fin=
al<br>
version could probably feature some squashed commits. It could also go the =
route<br>
of breaking tunings up more in the style of those in conf/machine/include/a=
rm/,<br>
but I&#39;ll leave them as-is for now to avoid even more rework that needs<=
br>
reviewing.<br>
<br>
A list of changes, by group:<br>
<br>
1. Basic clarification changes and extra tunings:<br>
=C2=A0 =C2=A0 a. tune-riscv: be explicit about riscv64gc default<br>
=C2=A0 =C2=A0 b. tune-riscv.inc: add &#39;riscv64gcv&#39; tune<br>
2. Adding official RVA20 profile extensions, and supporting the explicit ch=
oice<br>
of &#39;rva20u64&#39; as a tuning option for builds:<br>
=C2=A0 =C2=A0 a. arch-riscv.inc: add missing RVA20 extensions<br>
=C2=A0 =C2=A0 b. meta/lib/oe/tune.py: support profile strings, add rva20u64=
<br>
=C2=A0 =C2=A0 c. tune-riscv.inc: add rva20u64 to AVAILTUNES<br>
3. Adding RVA22 profile support:<br>
=C2=A0 =C2=A0 a. arch-riscv.inc: add rva22u64 extensions<br>
=C2=A0 =C2=A0 b. meta/lib/oe/tune.py: add rva22u64 profile<br>
=C2=A0 =C2=A0 c. tune-riscv.inc: add rva22u64 to AVAILTUNES<br>
4. Adding RVA23 profile support:<br>
=C2=A0 =C2=A0 a. arch-riscv.inc: add rva23u64 extensions<br>
=C2=A0 =C2=A0 b. meta/lib/oe/tune.py: add rva23u64 profile<br>
=C2=A0 =C2=A0 c. tune-riscv.inc: add rva23u64 to AVAILTUNES<br>
5. Quality-of-life fixups after 1-4:<br>
=C2=A0 =C2=A0 a. meta/lib/oe/tune.py: add riscv_pkgarch()<br>
=C2=A0 =C2=A0 b. arch-riscv.inc: rename TUNE_RISCV_PKGARCH -&gt; TUNE_RISCV=
_PKGARCH_EXACT<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0in assignments<br>
=C2=A0 =C2=A0 c. tune-riscv.inc: append zifencei extension to profiles<br>
<br>
These changes are also in my contrib branch[1]. The main sources of truth u=
sed<br>
were gcc&#39;s &#39;-march&#39; options list[2], the official RISC-V Intern=
ational<br>
documentation[3], and the RISC-V ISA Explorer[4], with the gcc specifics as=
 the<br>
preferred source. When comparing against gcc&#39;s output, commands like th=
e<br>
following were run:<br>
<br>
|tgamblin@megalith ~/workspace/ypbuilds/poky-qemuriscv64/layers/openembedde=
d-core (master)$ riscv64-linux-gnu-gcc -march=3Drva23u64 -mabi=3Dlp64d -Q -=
-help=3Dtarget | grep rv64<br>
|=C2=A0 -march=3D=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rv64imafdcbv_zic64b_=
zicbom_zicbop_zicboz_ziccamoa_ziccif_zicclsm_ziccrse_zicntr_zicond_zicsr_zi=
hintntl_zihintpause_zihpm_zimop_zmmul_za64rs_zaamo_zalrsc_zawrs_zfa_zfhmin_=
zca_zcb_zcd_zcmop_zba_zbb_zbs_zkt_zvbb_zve32f_zve32x_zve64d_zve64f_zve64x_z=
vfhmin_z<br>
<br>
However, as is visible above, the extension list became so long for the RVA=
23<br>
case that it was truncated, and so a more verbose output from the following=
 was<br>
checked instead:<br>
<br>
|riscv64-linux-gnu-gcc -march=3Drva23u64 -mabi=3Dlp64d -v -xc /dev/null -c =
-o /dev/null<br>
<br>
For now, the default tuning remains riscv64gc (with the naming rework in 1a=
),<br>
despite the presence of the other profiles. It is critical to note that not=
 all<br>
combinations of the RISC-V extensions may be valid or useful to use for<br>
projects, and whenever possible a ratified profile&#39;s corresponding tune=
 (e.g.<br>
&quot;RVA22&quot; -&gt; &quot;rva22u64&quot;) should be extended rather tha=
n picking and choosing each<br>
feature. There are also several extensions which are depended on by others =
(e.g.<br>
&#39;zkt&#39; is needed by &#39;b&#39;), and other known examples which are=
n&#39;t strictly part<br>
of the official profiles but must be included for the Yocto/OE case, such a=
s<br>
&#39;zifencei&#39; being necessary to build the Linux Kernel (which already=
 had been<br>
addressed before, but this series handles slightly differently). This serie=
s<br>
makes no attempts to add extensions which are not part of these profiles - =
those<br>
could be added in future series, but these changes are significant enough f=
or<br>
now. It might be worth adding some more documentation about how all of this=
<br>
works - I&#39;d be happy to hear what people think about that too.<br>
<br>
One significant change to the way profile strings are processed with<br>
these patches shows up in sstate/build path naming, and is part of the reas=
on<br>
for patch 5a and 5b above - before, a build directory might have a path in =
it<br>
like:<br>
<br>
|build/tmp/work/riscv64imafdc_zicsr_zifencei-poky-linux/<br>
<br>
This was fine when the extension list was short (for riscv64gc), but with t=
he<br>
full RVA profiles, the paths started to get so long that bitbake would prod=
uce<br>
this error:<br>
<br>
|ERROR: Unable to reduce sstate name to less than 255 chararacters<br>
<br>
To solve this problem, meta/lib/oe/tune.py now supports a very short list o=
f<br>
profile names, and includes a new function riscv_pkgarch() designed to comp=
are<br>
selected extensions against known profiles and determine if once has implic=
itly<br>
been selected. As an example, if you set the following in local.conf:<br>
<br>
|TUNE_FEATURES =3D &quot;${@oe.tune.riscv_isa_to_tune(&#39;riscv64gc&#39;)}=
 ziccamoa ziccif zicclsm ziccrse zicntr zicsr zmmul za128rs zaamo zalrsc zc=
a zcd&quot;<br>
<br>
and then run &#39;bitbake -e opensbi&#39;, you will see:<br>
<br>
|PACKAGE_EXTRA_ARCHS=3D&quot;rva20u64_zifencei&quot;<br>
<br>
With all of this combined, subdirectories in tmp/work/ look like:<br>
<br>
|tgamblin@megalith ~/workspace/ypbuilds/poky-qemuriscv64 $ ls build/tmp/wor=
k<br>
|all-poky-linux=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 riscv64imafdcv_zicsr_zife=
ncei-poky-linux=C2=A0 rva20u64_zcmop_zifencei_zihintpause_zimop_zvbb-poky-l=
inux=C2=A0 rva22u64_zifencei-poky-linux=C2=A0 x86_64-linux<br>
|qemuriscv64-poky-linux=C2=A0 riscv64imafdc_zicsr_zifencei-poky-linux=C2=A0=
 =C2=A0rva20u64_zifencei-poky-linux=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rv=
a23u64_zifencei-poky-linux<br>
<br>
Note that the &#39;rva20u64_zcmop_zifencei_zihintpause_zimop_zvbb-poky-linu=
x&#39;<br>
configuration is a custom one I set in local.conf only for testing purposes=
.<br>
Custom tunings still run the ris(c|k) of exceeding the naming length, which=
 we<br>
may need some extra logic to handle (or, again, find a way to make it behav=
e<br>
more like arm) if we want to enable freely customizing build tunings. This =
is an<br>
area where I&#39;m hoping there will be some suggestions, as the way to do =
this in<br>
local.conf seems fairly ugly (but maybe that&#39;s a good thing?):<br>
<br>
|DEFAULTTUNE =3D &quot;rva20u64&quot;<br>
|TUNE_FEATURES =3D &quot;${@oe.tune.riscv_isa_to_tune(&#39;rva20u64&#39;)} =
zihintpause zvbb zimop zcmop zifencei&quot;<br>
<br>
A consequence of doing this is that a lot of other variables related to the=
<br>
tuning features get &quot;polluted&quot;:<br>
<br>
|tgamblin@megalith ~/workspace/ypbuilds/poky-qemuriscv64 $ bitbake -e opens=
bi | grep PACKAGE_EXTRA_ARCHS<br>
|#=C2=A0 =C2=A0 =C2=A0&quot;all any noarch ${PACKAGE_EXTRA_ARCHS} ${MACHINE=
_ARCH}&quot;<br>
|#=C2=A0 =C2=A0&quot;all any noarch ${PACKAGE_EXTRA_ARCHS} ${MACHINE_ARCH}&=
quot;<br>
|# $PACKAGE_EXTRA_ARCHS [11 operations]<br>
|#=C2=A0 =C2=A0 =C2=A0[_defaultval] &quot;${PACKAGE_EXTRA_ARCHS:tune-${DEFA=
ULTTUNE}}&quot;<br>
|#=C2=A0 =C2=A0&quot;${PACKAGE_EXTRA_ARCHS:tune-${DEFAULTTUNE}}&quot;<br>
|PACKAGE_EXTRA_ARCHS=3D&quot;rva20u64_zcmop_zifencei_zihintpause_zimop_zvbb=
&quot;<br>
|# $PACKAGE_EXTRA_ARCHS:tune-riscv32gc<br>
|PACKAGE_EXTRA_ARCHS:tune-riscv32gc=3D&quot;rva20u64_zcmop_zifencei_zihintp=
ause_zimop_zvbb&quot;<br>
|# $PACKAGE_EXTRA_ARCHS:tune-riscv32nf<br>
|PACKAGE_EXTRA_ARCHS:tune-riscv32nf=3D&quot;rva20u64_zcmop_zifencei_zihintp=
ause_zimop_zvbb&quot;<br>
|# $PACKAGE_EXTRA_ARCHS:tune-riscv64gc<br>
|PACKAGE_EXTRA_ARCHS:tune-riscv64gc=3D&quot;rva20u64_zcmop_zifencei_zihintp=
ause_zimop_zvbb&quot;<br>
<br>
# Testing<br>
<br>
Testing different profiles&#39; validity against the compiler involved sett=
ing (for<br>
example) DEFAULTTUNE =3D &quot;rva23u64&quot; and then running &#39;bitbake=
 opensbi&#39; (which also<br>
results in a kernel rebuild) as a quick smoke test. I&#39;ve also opted to =
do full<br>
image builds to make sure that the new profiles fully boot and run without =
any<br>
obvious errors. Because I&#39;ve been playing with coreutils on qemuriscv64=
 a lot<br>
lately, here are example results with each profile (plus riscv64gc and<br>
riscv64gcv, for completeness) enabled on a build and test of<br>
core-image-ptest-coreutils. Note that when the vector extension is enabled<=
br>
(riscv64gcv, rva23u64), the test duration is significantly higher:<br>
<br>
riscv64gc:<br>
<br>
|=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D<br>
|Testsuite summary for GNU coreutils 9.11<br>
|=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D<br>
|# TOTAL: 733<br>
|# PASS:=C2=A0 561<br>
|# SKIP:=C2=A0 172<br>
|# XFAIL: 0<br>
|# FAIL:=C2=A0 0<br>
|# XPASS: 0<br>
|# ERROR: 0<br>
|=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D<br>
|make[1]: Leaving directory &#39;/usr/lib/coreutils/ptest&#39;<br>
|DURATION: 671<br>
|END: /usr/lib/coreutils/ptest<br>
|2026-09-15T15:45<br>
|STOP: ptest-runner<br>
|TOTAL: 1 FAIL: 0<br>
|root@qemuriscv64:~#<br>
<br>
riscv64gcv:<br>
<br>
|=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D<br>
|Testsuite summary for GNU coreutils 9.11<br>
|=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D<br>
|# TOTAL: 733<br>
|# PASS:=C2=A0 561<br>
|# SKIP:=C2=A0 172<br>
|# XFAIL: 0<br>
|# FAIL:=C2=A0 0<br>
|# XPASS: 0<br>
|# ERROR: 0<br>
|=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D<br>
|make[1]: Leaving directory &#39;/usr/lib/coreutils/ptest&#39;<br>
|DURATION: 940<br>
|END: /usr/lib/coreutils/ptest<br>
|2026-09-15T16:39<br>
|STOP: ptest-runner<br>
|TOTAL: 1 FAIL: 0<br>
|root@qemuriscv64:~#<br>
<br>
rva20u64:<br>
<br>
|=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D<br>
|Testsuite summary for GNU coreutils 9.11<br>
|=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D<br>
|# TOTAL: 733<br>
|# PASS:=C2=A0 561<br>
|# SKIP:=C2=A0 172<br>
|# XFAIL: 0<br>
|# FAIL:=C2=A0 0<br>
|# XPASS: 0<br>
|# ERROR: 0<br>
|=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D<br>
|make[1]: Leaving directory &#39;/usr/lib/coreutils/ptest&#39;<br>
|DURATION: 660<br>
|END: /usr/lib/coreutils/ptest<br>
|2026-09-15T15:02<br>
|STOP: ptest-runner<br>
|TOTAL: 1 FAIL: 0<br>
|root@qemuriscv64:~#<br>
<br>
rva22u64:<br>
<br>
|=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D<br>
|Testsuite summary for GNU coreutils 9.11<br>
|=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D<br>
|# TOTAL: 733<br>
|# PASS:=C2=A0 561<br>
|# SKIP:=C2=A0 172<br>
|# XFAIL: 0<br>
|# FAIL:=C2=A0 0<br>
|# XPASS: 0<br>
|# ERROR: 0<br>
|=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D<br>
|make[1]: Leaving directory &#39;/usr/lib/coreutils/ptest&#39;<br>
|DURATION: 615<br>
|END: /usr/lib/coreutils/ptest<br>
|2026-09-15T13:48<br>
|STOP: ptest-runner<br>
|TOTAL: 1 FAIL: 0<br>
|root@qemuriscv64:~#<br>
<br>
rva23u64:<br>
<br>
|=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D<br>
|Testsuite summary for GNU coreutils 9.11<br>
|=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D<br>
|# TOTAL: 733<br>
|# PASS:=C2=A0 561<br>
|# SKIP:=C2=A0 172<br>
|# XFAIL: 0<br>
|# FAIL:=C2=A0 0<br>
|# XPASS: 0<br>
|# ERROR: 0<br>
|=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D<br>
|make[1]: Leaving directory &#39;/usr/lib/coreutils/ptest&#39;<br>
|DURATION: 966<br>
|END: /usr/lib/coreutils/ptest<br>
|2026-09-15T12:18<br>
|STOP: ptest-runner<br>
|TOTAL: 1 FAIL: 0<br>
|root@qemuriscv64:~#<br>
<br>
[1]: <a href=3D"https://git.openembedded.org/openembedded-core-contrib/log/=
?h=3Dtgamblin/riscv64-tuning-rework" rel=3D"noreferrer" target=3D"_blank">h=
ttps://git.openembedded.org/openembedded-core-contrib/log/?h=3Dtgamblin/ris=
cv64-tuning-rework</a><br>
[2]: <a href=3D"https://gcc.gnu.org/onlinedocs/gcc/RISC-V-Options.html" rel=
=3D"noreferrer" target=3D"_blank">https://gcc.gnu.org/onlinedocs/gcc/RISC-V=
-Options.html</a><br>
[3]: <a href=3D"https://docs.riscv.org/reference/home/index.html" rel=3D"no=
referrer" target=3D"_blank">https://docs.riscv.org/reference/home/index.htm=
l</a><br>
[4]: <a href=3D"https://riscv.github.io/riscv-isa-explorer/" rel=3D"norefer=
rer" target=3D"_blank">https://riscv.github.io/riscv-isa-explorer/</a><br>
<br>
Trevor Gamblin (14):<br>
=C2=A0 tune-riscv: be explicit about riscv64gc default<br>
=C2=A0 tune-riscv.inc: add &#39;riscv64gcv&#39; tune<br>
=C2=A0 arch-riscv.inc: add missing RVA20 extensions<br>
=C2=A0 meta/lib/oe/tune.py: support profile strings, add rva20u64<br>
=C2=A0 tune-riscv.inc: add rva20u64 to AVAILTUNES<br>
=C2=A0 arch-riscv.inc: add rva22u64 extensions<br>
=C2=A0 meta/lib/oe/tune.py: add rva22u64 profile<br>
=C2=A0 tune-riscv.inc: add rva22u64 to AVAILTUNES<br>
=C2=A0 arch-riscv.inc: add rva23u64 extensions<br>
=C2=A0 meta/lib/oe/tune.py: add rva23u64 profile<br>
=C2=A0 tune-riscv.inc: add rva23u64 to AVAILTUNES<br>
=C2=A0 meta/lib/oe/tune.py: add riscv_pkgarch()<br>
=C2=A0 arch-riscv.inc: rename TUNE_RISCV_PKGARCH -&gt; TUNE_RISCV_PKGARCH_E=
XACT<br>
=C2=A0 =C2=A0 in assignments<br>
=C2=A0 tune-riscv.inc: append zifencei extension to profiles<br>
<br>
=C2=A0.../conf/machine/include/riscv/arch-riscv.inc | 198 ++++++++++++++++-=
-<br>
=C2=A0.../conf/machine/include/riscv/tune-riscv.inc |=C2=A0 24 ++-<br>
=C2=A0meta/lib/oe/tune.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 42 +++-<br>
=C2=A03 files changed, 240 insertions(+), 24 deletions(-)<br>
<br>
-- <br>
2.55.0<br>
<br>
</blockquote></div>

--000000000000f20555065be05dcc--

