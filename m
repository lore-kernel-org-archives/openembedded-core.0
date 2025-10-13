Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E73BCCD183
	for <webhook@archiver.kernel.org>; Mon, 13 Oct 2025 18:17:21 +0000 (UTC)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
 by mx.groups.io with SMTP id smtpd.web10.52032.1760379437799536574
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Oct 2025 11:17:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=C+re1y0j;
 spf=pass (domain: gmail.com, ip: 209.85.128.179, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-72e565bf2f0so47286977b3.3
        for <openembedded-core@lists.openembedded.org>; Mon, 13 Oct 2025 11:17:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760379437; x=1760984237; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RyHRaLwIvF6xCra6NZ2kbb2EwAvV+3ASInhyCDTvIJE=;
        b=C+re1y0jxDGm4EnpXd+W9fjboV2+sA5fgTzImAYMzqijUTx2JHW3kJG5WzxRnnMDNI
         yjeP1LFLRhVWO37xCsf+ilHAb9Less2ZL6xjcHqco427Bt+jn4rnhDdrEhEGvlLEB0ek
         78de6pILtiXARM4shAOYgYnY3z92dNLldjDPTiBS8lzVSx2B6H/smLQNbt/IvDYGlzB8
         Mr3eZ/Ut34iKV6QzQ2WOQtfvIlQqJ1jxNcKlEvifSEKy0xINbS/AG7smXHARBJM4cI1j
         lERsoJKDyJekSTcZdp/xmtAh6NS9MsuiERltdv7oK3nMBhorhIiE2vVwy69Ro31iIJG9
         0AbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760379437; x=1760984237;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RyHRaLwIvF6xCra6NZ2kbb2EwAvV+3ASInhyCDTvIJE=;
        b=Gs5Gz0fPSj0tpmuYGPCIFUJ4hzKb66b91Ib8IhDjVRcTdAV3lzavdURSGord/hUys9
         4Mh9StPgzPHj+Q3j2iWxa6GgWJONOwECc5dX6muwq7xR+cwQYLAHKEXRPgBzzZDFM/9o
         D4golTwuqGQDBOv5LibpdbZHt1ykh4d2K87TXr1bf1XqSMO5bS7OwzbqRM5EPp6EDIjx
         iuwLZhzGcjWpe2NVtHbSfW8p1pJMakHGEN7JkZ/YRTp6AMUjlHpvb5StyrgbzaJvZEgA
         5P9hAgoxz5qESaaYAdrXK8rt7wgVmCOilun4UICGglZIosO8r2w1Ieh1F5epFWXO1pbv
         A1Wg==
X-Gm-Message-State: AOJu0YxMJpjqHQCRQZsJ7y1h/NQtKQgoxH3E4OR96YliJiSVU6ZgvZZM
	Ep4Gv6iwXy5bCoEVPcNoihsRG5//FwFLwqzbpV7JlpVfVmRpDlPwotXMJEF973hV5pKXHKGkWDA
	XUWGLXo9E1krnXQCK2l9rBVJ/oTG8mgr7UZ+x
X-Gm-Gg: ASbGncvZayegkfEQ20u2OnoyaMEOW8CJdQ+2sg0Hq4Oj1wWRnx/sirPxL8/tEkys+QM
	zSdyOKojWwZiNUx1NxEBvpUv9iVhXlP/C4inKGH3iyfTjE9i2bQxwfz1Dp03N827cW1jBENHnEV
	6QovbXMi2M5hx5RnYUCD873TAu5onhU1K8VTmF9mKxI1kR2okcR9wrnN1Fl+aNNJ1/X++n4iK/2
	V0BcznBaS7OUuqG5Cq7YrPHfu07HvGzSY6lq2XmZxL4P/tqFkg8igHL+wITh8SIsw==
X-Google-Smtp-Source: AGHT+IHphH1dVVeVrc1Ni7pKhp3diq0ctmOji0jPctfLmX39tUikE4CrS2b+zTP6RenQ8MA81yPJXl4dbaMJZV89Sps=
X-Received: by 2002:a53:c906:0:b0:62d:9854:f1c3 with SMTP id
 956f58d0204a3-63ccb8bb4f1mr16906445d50.33.1760379436640; Mon, 13 Oct 2025
 11:17:16 -0700 (PDT)
MIME-Version: 1.0
References: <20251013094915.2816229-1-Deepesh.Varatharajan@windriver.com>
In-Reply-To: <20251013094915.2816229-1-Deepesh.Varatharajan@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 13 Oct 2025 11:16:50 -0700
X-Gm-Features: AS18NWDdaZWOzjHN7LhMU64264aPRSIuTyZ5W3ST9TGkCEdJdzgfOfZku3F62FQ
Message-ID: <CAMKF1spmqS0=i-8OaLn4Uh3DDwh49gCJ5sUActA_60Q3KMbozg@mail.gmail.com>
Subject: Re: [OE-core] [scarthgap][PATCH V2] glibc: stable 2.39 branch updates
To: deepesh.varatharajan@windriver.com
Cc: openembedded-core@lists.openembedded.org, Sundeep.Kokkonda@windriver.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Oct 2025 18:17:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224792

On Mon, Oct 13, 2025 at 2:49=E2=80=AFAM Varatharajan, Deepesh via
lists.openembedded.org
<deepesh.varatharajan=3Dwindriver.com@lists.openembedded.org> wrote:
>
> From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
>
> git log --oneline b027d5b145f1b2908f370bdb96dfe40180d0fcb6..58cbbd43fe829=
10cf8ae9008351b0b0665104500
>
> 58cbbd43fe (HEAD -> release/2.39/master, origin/release/2.39/master) x86:=
 Detect Intel Nova Lake Processor
> 835b1e3379 x86: Detect Intel Wildcat Lake Processor
> 765534258e nss: Group merge does not react to ERANGE during merge (bug 33=
361)
> 7ce7b4b2f4 Rename new tst-sem17 test to tst-sem18
> a6ac06abeb Avoid uninitialized result in sem_open when file does not exis=
t
> ff6ce67220 elf: handle addition overflow in _dl_find_object_update_1 [BZ =
#32245]
> fffc2df8a3 Optimize __libc_tsd_* thread variable access
> 83340b35cc i386: Add GLIBC_ABI_GNU_TLS version [BZ #33221]
> 5541edb1bd i386: Also add GLIBC_ABI_GNU2_TLS version [BZ #33129]
> 1f17635507 debug: Fix tst-longjmp_chk3 build failure on Hurd
> 3b6c8ea878 debug: Wire up tst-longjmp_chk3
> 89596f46e3 i386: Update ___tls_get_addr to preserve vector registers
> 4c2509882f elf: Preserve _rtld_global layout for the release branch
> cf0e7d512d elf: Compile _dl_debug_state separately (bug 33224)
> 5cd1f4b1a1 elf: Restore support for _r_debug interpositions and copy relo=
cations
> 97017da5ef elf: Introduce _dl_debug_change_state
> 5601ad79b7 elf: Introduce separate _r_debug_array variable
> 24c94ea84e elf: Test dlopen (NULL, RTLD_LAZY) from an ELF constructor
> 79d84b5da5 elf: Fix handling of symbol versions which hash to zero (bug 2=
9190)
> 5f5c411132 elf: Second ld.so relocation only if libc.so has been loaded
> 4c9b1877fd elf: Reorder audit events in dlcose to match _dl_fini (bug 320=
66)
> f407a14ff7 elf: Call la_objclose for proxy link maps in _dl_fini (bug 320=
65)
> e27601b385 elf: Signal la_objopen for the proxy link map in dlmopen (bug =
31985)
> fef226255d elf: Add the endswith function to <endswith.h>
> d21a217fa0 elf: Update DSO list, write audit log to elf/tst-audit23.out
> 4f145bb35d elf: Switch to main malloc after final ld.so self-relocation
> 65d86471ce elf: Introduce _dl_relocate_object_no_relro
> 5434cc2c41 elf: Do not define consider_profiling, consider_symbind as mac=
ros
> b2d8c6cbe7 elf: rtld_multiple_ref is always true
> 2b89de7c91 Revert "elf: Run constructors on cyclic recursive dlopen (bug =
31986)"
> 46e3ecad27 elf: Fix map_complete Systemtap probe in dl_open_worker
> 5f225025db elf: Signal RT_CONSISTENT after relocation processing in dlope=
n (bug 31986)
> d6cc325fcf elf: Signal LA_ACT_CONSISTENT to auditors after RT_CONSISTENT =
switch
> 6917fde6f9 elf: Run constructors on cyclic recursive dlopen (bug 31986)
> 9fa7cc6a0b ldconfig: Move endswithn into a new header file
> 269e89bd8d x86-64: Add GLIBC_ABI_DT_X86_64_PLT [BZ #33212]
> 62ff85fd09 x86-64: Add GLIBC_ABI_GNU2_TLS version [BZ #33129]
> f0e8d04eef libio: Test for fdopen memory leak without SEEK_END support (b=
ug 31840)
> 42a8cb7560 Remove memory leak in fdopen (bug 31840)
> d1c1f78e9e math: Remove no-mathvec flag
> 20d2d69a2f Use TLS initial-exec model for __libc_tsd_CTYPE_* thread varia=
bles [BZ #33234]
> c11950503f ctype: Fallback initialization of TLS using relocations (bug 1=
9341, bug 32483)
> 25c537c3b3 Use proper extern declaration for _nl_C_LC_CTYPE_{class,touppe=
r,tolower}
> fbdf9680cc Remove <libc-tsd.h>
> fca5937510 ctype: Reformat Makefile.
> 49f0e73fa3 elf: Handle ld.so with LOAD segment gaps in _dl_find_object (b=
ug 31943)
> 64488b4b31 elf: Extract rtld_setup_phdr function from dl_main
> 9833fcf7ce elf: Do not add a copy of _dl_find_object to libc.so
> fbade65338 arm: Use _dl_find_object on __gnu_Unwind_Find_exidx (BZ 31405)
> 392e6cf1e8 AArch64: Improve codegen in SVE log1p
> 3a78a276a3 AArch64: Optimize inverse trig functions
> b6ea8902a7 AArch64: Avoid memset ifunc in cpu-features.c [BZ #33112]
>
> Testing Results:
>             Before     After    Diff
> PASS         5080      5099      +19
> XPASS        4         4          0
> FAIL         119       120       +1
> XFAIL        16        16         0
> UNSUPPORTED  154       154        0
>
> Testcases changes
>
> testcase-name                                                before      =
     after
>
> debug/tst-longjmp_chk3(new)                                    -         =
      PASS
> elf/check-dt-x86-64-plt(new)                                   -         =
      PASS
> elf/check-gnu2-tls(new)                                        -         =
      PASS
> lf/tst-dlmopen4-nonpic(new)                                    -         =
      PASS
> elf/tst-dlmopen4-pic(new)                                      -         =
      PASS
> elf/tst-dlopen-auditdup(new)                                   -         =
      PASS
> elf/tst-dlopen-constructor-null(new)                           -         =
      PASS
> elf/tst-link-map-contiguous-ldso(new)                          -         =
      PASS
> elf/tst-link-map-contiguous-libc(new)                          -         =
      PASS
> elf/tst-nolink-libc-1(new)                                     -         =
      PASS
> elf/tst-nolink-libc-2(new)                                     -         =
      PASS
> elf/tst-rtld-no-malloc(new)                                    -         =
      PASS
> elf/tst-rtld-no-malloc-audit(new)                              -         =
      PASS
> elf/tst-rtld-no-malloc-preload(new)                            -         =
      PASS
> elf/tst-tls23(new)                                             -         =
      PASS
> elf/tst-version-hash-zero(new)                                 -         =
      PASS
> libio/tst-fdopen-seek-failure(new)                             -         =
      PASS
> libio/tst-fdopen-seek-failure-mem(new)                         -         =
      PASS
> nptl/tst-sem18(new)                                            -         =
      PASS
> ctype/tst-ctype-tls-dlmopen(new)                               -         =
      FAIL
> ctype/tst-ctype-tls-dlopen-static(new)                         -         =
      FAIL

Are these two test failures intermittent ?

> stdio-common/tst-scanf-bz27650                                FAIL       =
      PASS
> elf/ifuncmain8                                                PASS       =
       -
>
> Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
> ---
>  meta/recipes-core/glibc/glibc-version.inc | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-cor=
e/glibc/glibc-version.inc
> index 89e532fd67..2ca1571158 100644
> --- a/meta/recipes-core/glibc/glibc-version.inc
> +++ b/meta/recipes-core/glibc/glibc-version.inc
> @@ -1,7 +1,7 @@
>  SRCBRANCH ?=3D "release/2.39/master"
>  PV =3D "2.39+git"
> -SRCREV_glibc ?=3D "b027d5b145f1b2908f370bdb96dfe40180d0fcb6"
> -SRCREV_localedef ?=3D "fab74f31b3811df543e24b6de47efdf45b538abc"
> +SRCREV_glibc ?=3D "58cbbd43fe82910cf8ae9008351b0b0665104500"
> +SRCREV_localedef ?=3D "cba02c503d7c853a38ccfb83c57e343ca5ecd7e5"
>
>  GLIBC_GIT_URI ?=3D "git://sourceware.org/git/glibc.git;protocol=3Dhttps"
>
> --
> 2.49.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#224769): https://lists.openembedded.org/g/openembedde=
d-core/message/224769
> Mute This Topic: https://lists.openembedded.org/mt/115731631/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

