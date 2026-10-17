Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B99E3CCF2C4
	for <webhook@archiver.kernel.org>; Sat, 17 Oct 2026 17:54:02 +0000 (UTC)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1244.1792259638694128154
 for <openembedded-core@lists.openembedded.org>;
 Sat, 17 Oct 2026 10:53:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=pdbf89hC;
 spf=pass (domain: gmail.com, ip: 209.85.128.176, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-8ab37e44643so5645807b3.0
        for <openembedded-core@lists.openembedded.org>; Sat, 17 Oct 2026 10:53:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792259638; cv=none;
        d=google.com; s=arc-20260327;
        b=bUM23FE/cE30zdhe1wc7OTzilcg2tDZDdOWmIiI4meZbV4hOId9NpXgyVcbwmIzxRv
         hB7f2KGORTjR6gntT9nAsCUSvAjE80Q0uWhx01U44KaTHeTgCMOJMI1gHzahZm6cpQ8s
         Gh+hprSuDLKg5b1BbJk4X3x7MEra4ZDAzAAUthTDTSBtO3aIrCJEronH/vaZOVt/HIDp
         jhDd+bqZponjV50EW+GxrIW9RaerdCO+UuoKs5ExtBZFAHhrPSnOboPI+M1Pc9GwT0/H
         fer4NI6sJta/1IRtmCRfllrhanxQITJAhzP2srwt/Q7mEmJ1vPrf48uXLD0oeimxmzJ1
         QBCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ek+xE+fhXq2/Vt746bv54/jufwOCxDvePoFFjqeHWEk=;
        fh=wi4Hnfg/770LK+7F5iAywmsML0ayvVngtd7aIDt8YHo=;
        b=PTHiqeOGk2i1h3i9wyb0EOOj6YK3QFrHsnmKzkvg+efivO/rQtcx8f0RSbrslUgJMy
         JgxNPLBubrIZaulwJ4dCyO/a9SL9YgYV7RJP7C3/00RjUJiH2dtWaYXyYWUPML+fHEtm
         jmvYA0XbpKBgqt+GSE1Cvrdqrnb2K6IX3U4Fz6sdj/ox87Z2p8GSqkebH7JfvXtqSQ5u
         MkTcUBBw4+kiVkqZ9xlUfruznrU8+XVoQUZkvZ49iidaWkvt9a9/6r6EDgSKfwG7KD0S
         ew/DjrULqX28BGJkJuXNHq1ES8Uo7Wfb7hUIQlCamXQEHiTzKC3TFl3XLJY7qV5+260V
         8SVw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792259638; x=1792864438; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ek+xE+fhXq2/Vt746bv54/jufwOCxDvePoFFjqeHWEk=;
        b=pdbf89hCf9+oJhqxjOoAzkqpt/+Sv2XuJc1WHPeAEaTRJbP26RDGm1RZvbEA/PbmAs
         Stffb8ZoPk2AaxXSPryX8HWKmCVAnHEiHh8YJzBf+v9mAQlQtLC82/sa9kR9ZrlGL4Bl
         8Yzq+zLJ+WbnqTfGtiU53fPFQpk3twIA33CElBMDUXWEV4TL0N+BgC7eJOpX578WlTQj
         NfKljrd3ckKK0UKTXuJzxF1TAkdUNv/TiPETvD+8J93uSn+6kwiY6iXUcH+1+Ko1t9Xa
         oAvGEAuPmEvmuIIaISOb7qj3OOpFvmy0hrQsmcE58dN+6mOfnlhqjgaVvVzWvlkK8IBm
         OWbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792259638; x=1792864438;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ek+xE+fhXq2/Vt746bv54/jufwOCxDvePoFFjqeHWEk=;
        b=Ban5kvqS/JEqcEUS7Zh6fehn47FFzRMd6cg2v5kKkd4r87wHecTYQK9QmINodDiboZ
         QulWg+AdrijyDSgoBawdVr/8vE57uenW8IHfiXhpECV2ZEZOH1QEtcWgVKdeTX20h1nE
         g63C7IFQppoQfd+L++RlLZEomp4bcobH2vkUhe+54c8lQnwPMYJWYGBhbo1TJX3X9N/M
         lF/CDX+z23FMdq0TEGpY5MksN2MH5Y1OY2LIQsKVsrJXMzJS0tisSuvhAoXKnVVmN1j9
         Ov3itxyRjxVwjE7xLrre3Z0GTCLFx+25Gk0sgWSdmraJWWA9wdAG+3UH4FTAx/optuLV
         QPNQ==
X-Gm-Message-State: AFq9FYIhRrAyiJPvE97BHyJex+NMkqltGARpOqKXhsHsYWZFwde8C6tA
	vIMZB4U2dzztGrmYuPCkrR6zE3myonHog1jAWHZc5PAOimB8bU9VBj22sMKCxbmY+RwO7sPu3Mq
	zDMfqfk7t50p7IPD3RoMg3+u6HtcH0cE=
X-Gm-Gg: AYBFou3IEKTyw/VP5gNzJQJtDB7WMLX+fJ28s5t0vfE1YI8aRNt805Nxghz2eNUG+q2
	corjgo/k0RAIAi0ZhfoJf1oJ4r8IT1Nkg734Yj2veVrBglIzunBA1wvB5F3mcoOUwjnp+0gZY+E
	PeqW204DTCdcIzTLcvvrTAedC0APaawZveZaoT46yUbhwrXujbqQ3wYG/FaiXsXe6Y1Ty0ba4sY
	tE4kEvkRoShjCLBl4YujzKDJpYRid0psvQVx0zm4rlN+22jnEztTJ/070Js2eOMmmBm26I1ONrW
	oZYiFWzhaNWsP2Fpx7EphSUYo/NjvzWhLQlqOJuJmFGFjCsK7Y0KNoyqy8iBneNpzWjeO2fuiPK
	ceHeT6WeYqq554aKRDhMQGgrTHjQVu30x0G/0agD8bkT390mq2BKodDtq/6wzQeVAe8C8Lp8nVH
	7miIn0uoWZEAus9E7i9IAgfnQzspewHYoCoLxXZIv/X7Tfsa1AQqUIxfjcyMt4zYsf5eIhn0Lw0
	zZtcRPjGo1SbMAHoAMITg4r9Bkj4kRRMoCHTtOZ8ruJBiMKWrkpQBXXnik+DwEgkxv4BUbo8UGK
	5LKmoh/lr4t12TmIQ7GCmJLQ3gr7AlTTcRW9GWc=
X-Received: by 2002:a05:690c:82:b0:8b0:e680:615c with SMTP id
 00721157ae682-8b0f2209145mr10931717b3.71.1792259637639; Sat, 17 Oct 2026
 10:53:57 -0700 (PDT)
MIME-Version: 1.0
References: <20261016204547.2328847-1-oo.hehir@gmail.com> <20261017112358.77434-1-oo.hehir@gmail.com>
In-Reply-To: <20261017112358.77434-1-oo.hehir@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 17 Oct 2026 10:53:31 -0700
X-Gm-Features: AclHuK92oSXphdO9_cVlZxtqPMeOHI-fIC0offrLGEwpWjXYX14fm3SkCGoPZrU
Message-ID: <CAMKF1sr7F8THreAa8Akf0nr0e--w44y+M0i1nJD+VxxyTF9Gmg@mail.gmail.com>
Subject: Re: [PATCH v2 0/8] riscv64 ptest fixes
To: OOHehir <oo.hehir@gmail.com>
Cc: openembedded-core@lists.openembedded.org, tgamblin@baylibre.com, 
	mathieu.dubois-briand@bootlin.com, 
	OOHehir <40183643+OOHehir@users.noreply.github.com>
Content-Type: multipart/alternative; boundary="0000000000000c014f065e0cf71c"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 17 Oct 2026 17:54:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248093

--0000000000000c014f065e0cf71c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I have looked at the patches, I think it improves the ptests on RV64 in
general, we may still see some issues on AB due to load etc. so waiting to
see the AB run results. Overall looks good, thanks for working on it.

On Sat, Oct 17, 2026 at 4:24=E2=80=AFAM OOHehir <oo.hehir@gmail.com> wrote:

> From: OOHehir <40183643+OOHehir@users.noreply.github.com>
>
> Changes in v2:
> - New patch 5: on musl, the tcl & tcl8 recipes add a skip after every lin=
e
>   containing SKIP=3D"$SKIP, so v1's skip inside a case arm left run-ptest
> with a
>   syntax error (reported by Mathieu Dubois-Briand). Building tcl & tcl8 t=
o
>   do_install_ptest_base for qemux86-64 & syntax-checking the installed
>   run-ptest: v1 reproduces the autobuilder error on musl, v2 passes on
> musl &
>   glibc.
> - Patches 1 & 8: shorter recipe comments, no functional change.
>
> This series re-enables the strace, python3 & tcl8 ptests on riscv64 &
> fixes the
> three riscv64 failures that are not timeouts: lttng-tools, tcl/tcl8 &
> python3-numpy. Patches 2, 3 & 7 only edit the riscv64 lists in
> ptest-packagelists.inc; patch 1 skips one slow strace test on riscv64 &
> patches 4, 6 & 8 carry the fixes. Patch 5 makes the tcl recipes'
> musl sed safe for patch 6.
>
> I sent these results to Khem Raj & Trevor Gamblin before posting. Trevor
> suggested profiling the per-test durations under QEMU first; patch 1 skip=
s
> the slowest test found (see "Per-test durations" below).
>
> Where to look:
> - Patch 8 works round a confirmed GCC 15+ bug:
>   https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D127908
>   GCC moves the float-to-integer conversion above the range check in its
>   inline ceil/floor/trunc, so ceil(+-inf) raises FE_INVALID.
>   -fno-fp-int-builtin-inexact makes GCC call libm instead.
> - Patch 4 carries an lttng-tools fix under review upstream:
>   https://review.lttng.org/c/lttng-tools/+/18903
> - Patch 6 skips binary-40.3, which expects a negative float NaN to stay
> negative
>   when widened to double. RISC-V returns the positive canonical NaN, as
> the ISA
>   requires. Reported on an existing MIPS ticket:
>   https://core.tcl-lang.org/tcl/tktview/bf029ced86
>
> Testing:
> - qemuriscv64: testimage of core-image-ptest-<pkg> with the autobuilder's
>   PTEST_RUNNER_TIMEOUT of 450 s (a test is killed after 450 s without
> output),
>   on my machine, a Xeon E5-1680 v3 from 2014 (a plough-horse rather than =
a
>   stallion). An autobuilder worker will be faster per core, but busier.
> - VisionFive 2 v1.3B (JH7110, 4x U74, 8 GB): each package in
>   core-image-minimal, ptest-runner -t 1800.
>
>   package  qemuriscv64                  VisionFive 2
>   strace   1081 pass, 0 fail, 24 min    1212 pass, 0 fail
>   python3  44546 pass, 0 fail, 71 min   44698 pass, 0 fail
>   tcl8     152 pass, 0 fail, 10 min     only failure was binary-40.3
>
> Per-test durations under QEMU (TCG), as the longest time without output i=
s
> what the 450 s limit measures:
> - strace (make -j4, every output line timestamped): the longest gap is 28=
3
> s,
>   ending with qual_fault-syscall.test, which patch 1 skips on riscv64.
> Next are
>   filtering_syscall-syntax.test (139 s), trace_creds.gen.test (90 s) &
>   strace--tips-full.test (65 s); the rest are under 50 s.
> - python3: regrtest -j4 prints a progress line at least every 30 s, so th=
e
>   longest gap in the full run is around 30 s. Its slowest modules
>   (test_concurrent_futures.test_process_pool, about 17 min, & the
>   test_multiprocessing_* modules, 6-11 min) are made of many short cases:
> run
>   one at a time, no single case takes over 71 s
> (MiscTestCase.test_large_pool,
>   69-71 s in each start method). So I have not skipped anything there.
> - tcl8: tcltest prints once per test file. The longest is reg.test (115 s=
),
>   then regexp.test (70 s) & io.test (45 s).
>
> Still parked: tcl, lttng-tools, perl, python3-cffi, libpcap & zstd pass,
> but
> are too slow for the 450 s limit on my machine. Under TCG (QEMU's softwar=
e
> CPU
> emulation), ptest-runner kills tcl in unicodeNormalize.test, lttng-tools =
in
> test_valid_filter, perl in t/re/regexp_qr_embed_thr (485 s alone, so perl
> may
> pass on a faster worker) & python3-cffi, each after 450 s without output.
> libpcap's run-ptest prints nothing until TESTrun finishes, which takes 9.=
5
> min
> even on the board. zstd's compression/window-resize.sh exceeds the 200 s
> per-case limit in cli-tests.
>
> To confirm that these fail only on time, I reran them under QEMU with thi=
s
> series, PTEST_RUNNER_TIMEOUT =3D "7200" & the cli-tests limit raised to 3=
600
> s
> (local changes, not in this series). All passed with 0 failures, as they
> do on
> the board:
>
>   zstd           43 pass            10 min
>   libpcap        14801 pass         24 min
>   tcl            175 test files     46 min
>   lttng-tools    2088 pass          85 min
>   python3-numpy  45769 pass        104 min
>   python3-cffi   1724 pass         187 min
>   perl           2729 pass         219 min
>
> python3-numpy stays parked too: patch 8 fixes its only failure (72 cases =
of
> test_unary_spurious_fpexception), but under the 450 s limit numpy 2.5.4 i=
s
> killed before pytest prints its first result.
>
> glib-2.0 is left parked. It passed one run on QEMU (308 pass, 31 min) & o=
n
> the
> board, but it was parked for intermittent failures, which one run cannot
> rule
> out:
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15891
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D16230
>
> The numpy results above are for 2.5.3, before the rebase. numpy 2.5.4 wit=
h
> patch 8, under QEMU with the 7200 s limit: 45993 pass, 0 fail, 87 min. On=
e
> earlier 2.5.4 run had a single failure, a wall-clock check in f2py
> (test_nameargspattern_backtracking) that requires a regex search to take
> under
> 0.2 s & measured 0.22 s under TCG; it passed on the rerun.
>
> OOHehir (8):
>   strace: skip qual_fault-syscall.test on riscv64
>   ptest-packagelists.inc: re-enable strace for riscv64
>   ptest-packagelists.inc: re-enable python3 for riscv64
>   lttng-tools: skip kernel cases when kernel tests are disabled
>   tcl, tcl8: anchor the musl unixInit-3 skip to top-level SKIP lines
>   tcl, tcl8: skip binary-40.3 on RISC-V
>   ptest-packagelists.inc: re-enable tcl8 for riscv64
>   python3-numpy: call libm for ceil/floor/trunc on riscv64
>
>  .../distro/include/ptest-packagelists.inc     |   7 +-
>  .../python/python3-numpy_2.5.4.bb             |   5 +
>  meta/recipes-devtools/strace/strace_7.2.bb    |  12 ++
>  meta/recipes-devtools/tcltk/tcl/run-ptest     |   5 +
>  meta/recipes-devtools/tcltk/tcl_9.1.0.bb      |   2 +-
>  meta/recipes-devtools/tcltk8/tcl8/run-ptest   |   5 +
>  meta/recipes-devtools/tcltk8/tcl8_8.6.18.bb   |   2 +-
>  ...our-LTTNG_TOOLS_DISABLE_KERNEL_TESTS.patch | 108 ++++++++++++++++++
>  .../lttng/lttng-tools_2.16.0.bb               |   1 +
>  9 files changed, 140 insertions(+), 7 deletions(-)
>  create mode 100644
> meta/recipes-kernel/lttng/lttng-tools/0001-tests-honour-LTTNG_TOOLS_DISAB=
LE_KERNEL_TESTS.patch
>
> --
> 2.43.0
>
>

--0000000000000c014f065e0cf71c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I have looked at the patches, I think it improves the ptes=
ts on RV64 in general, we may still see some issues on AB due to load etc. =
so waiting to see the AB run results. Overall looks good, thanks for workin=
g on it.</div><br><div class=3D"gmail_quote gmail_quote_container"><div dir=
=3D"ltr" class=3D"gmail_attr">On Sat, Oct 17, 2026 at 4:24=E2=80=AFAM OOHeh=
ir &lt;<a href=3D"mailto:oo.hehir@gmail.com">oo.hehir@gmail.com</a>&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From: OOHehi=
r &lt;<a href=3D"mailto:40183643%2BOOHehir@users.noreply.github.com" target=
=3D"_blank">40183643+OOHehir@users.noreply.github.com</a>&gt;<br>
<br>
Changes in v2:<br>
- New patch 5: on musl, the tcl &amp; tcl8 recipes add a skip after every l=
ine<br>
=C2=A0 containing SKIP=3D&quot;$SKIP, so v1&#39;s skip inside a case arm le=
ft run-ptest with a<br>
=C2=A0 syntax error (reported by Mathieu Dubois-Briand). Building tcl &amp;=
 tcl8 to<br>
=C2=A0 do_install_ptest_base for qemux86-64 &amp; syntax-checking the insta=
lled<br>
=C2=A0 run-ptest: v1 reproduces the autobuilder error on musl, v2 passes on=
 musl &amp;<br>
=C2=A0 glibc.<br>
- Patches 1 &amp; 8: shorter recipe comments, no functional change.<br>
<br>
This series re-enables the strace, python3 &amp; tcl8 ptests on riscv64 &am=
p; fixes the<br>
three riscv64 failures that are not timeouts: lttng-tools, tcl/tcl8 &amp;<b=
r>
python3-numpy. Patches 2, 3 &amp; 7 only edit the riscv64 lists in<br>
ptest-packagelists.inc; patch 1 skips one slow strace test on riscv64 &amp;=
<br>
patches 4, 6 &amp; 8 carry the fixes. Patch 5 makes the tcl recipes&#39;<br=
>
musl sed safe for patch 6.<br>
<br>
I sent these results to Khem Raj &amp; Trevor Gamblin before posting. Trevo=
r<br>
suggested profiling the per-test durations under QEMU first; patch 1 skips<=
br>
the slowest test found (see &quot;Per-test durations&quot; below).<br>
<br>
Where to look:<br>
- Patch 8 works round a confirmed GCC 15+ bug:<br>
=C2=A0 <a href=3D"https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D127908" re=
l=3D"noreferrer" target=3D"_blank">https://gcc.gnu.org/bugzilla/show_bug.cg=
i?id=3D127908</a><br>
=C2=A0 GCC moves the float-to-integer conversion above the range check in i=
ts<br>
=C2=A0 inline ceil/floor/trunc, so ceil(+-inf) raises FE_INVALID.<br>
=C2=A0 -fno-fp-int-builtin-inexact makes GCC call libm instead.<br>
- Patch 4 carries an lttng-tools fix under review upstream:<br>
=C2=A0 <a href=3D"https://review.lttng.org/c/lttng-tools/+/18903" rel=3D"no=
referrer" target=3D"_blank">https://review.lttng.org/c/lttng-tools/+/18903<=
/a><br>
- Patch 6 skips binary-40.3, which expects a negative float NaN to stay neg=
ative<br>
=C2=A0 when widened to double. RISC-V returns the positive canonical NaN, a=
s the ISA<br>
=C2=A0 requires. Reported on an existing MIPS ticket:<br>
=C2=A0 <a href=3D"https://core.tcl-lang.org/tcl/tktview/bf029ced86" rel=3D"=
noreferrer" target=3D"_blank">https://core.tcl-lang.org/tcl/tktview/bf029ce=
d86</a><br>
<br>
Testing:<br>
- qemuriscv64: testimage of core-image-ptest-&lt;pkg&gt; with the autobuild=
er&#39;s<br>
=C2=A0 PTEST_RUNNER_TIMEOUT of 450 s (a test is killed after 450 s without =
output),<br>
=C2=A0 on my machine, a Xeon E5-1680 v3 from 2014 (a plough-horse rather th=
an a<br>
=C2=A0 stallion). An autobuilder worker will be faster per core, but busier=
.<br>
- VisionFive 2 v1.3B (JH7110, 4x U74, 8 GB): each package in<br>
=C2=A0 core-image-minimal, ptest-runner -t 1800.<br>
<br>
=C2=A0 package=C2=A0 qemuriscv64=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 VisionFive 2<br>
=C2=A0 strace=C2=A0 =C2=A01081 pass, 0 fail, 24 min=C2=A0 =C2=A0 1212 pass,=
 0 fail<br>
=C2=A0 python3=C2=A0 44546 pass, 0 fail, 71 min=C2=A0 =C2=A044698 pass, 0 f=
ail<br>
=C2=A0 tcl8=C2=A0 =C2=A0 =C2=A0152 pass, 0 fail, 10 min=C2=A0 =C2=A0 =C2=A0=
only failure was binary-40.3<br>
<br>
Per-test durations under QEMU (TCG), as the longest time without output is<=
br>
what the 450 s limit measures:<br>
- strace (make -j4, every output line timestamped): the longest gap is 283 =
s,<br>
=C2=A0 ending with qual_fault-syscall.test, which patch 1 skips on riscv64.=
 Next are<br>
=C2=A0 filtering_syscall-syntax.test (139 s), trace_creds.gen.test (90 s) &=
amp;<br>
=C2=A0 strace--tips-full.test (65 s); the rest are under 50 s.<br>
- python3: regrtest -j4 prints a progress line at least every 30 s, so the<=
br>
=C2=A0 longest gap in the full run is around 30 s. Its slowest modules<br>
=C2=A0 (test_concurrent_futures.test_process_pool, about 17 min, &amp; the<=
br>
=C2=A0 test_multiprocessing_* modules, 6-11 min) are made of many short cas=
es: run<br>
=C2=A0 one at a time, no single case takes over 71 s (MiscTestCase.test_lar=
ge_pool,<br>
=C2=A0 69-71 s in each start method). So I have not skipped anything there.=
<br>
- tcl8: tcltest prints once per test file. The longest is reg.test (115 s),=
<br>
=C2=A0 then regexp.test (70 s) &amp; io.test (45 s).<br>
<br>
Still parked: tcl, lttng-tools, perl, python3-cffi, libpcap &amp; zstd pass=
, but<br>
are too slow for the 450 s limit on my machine. Under TCG (QEMU&#39;s softw=
are CPU<br>
emulation), ptest-runner kills tcl in unicodeNormalize.test, lttng-tools in=
<br>
test_valid_filter, perl in t/re/regexp_qr_embed_thr (485 s alone, so perl m=
ay<br>
pass on a faster worker) &amp; python3-cffi, each after 450 s without outpu=
t.<br>
libpcap&#39;s run-ptest prints nothing until TESTrun finishes, which takes =
9.5 min<br>
even on the board. zstd&#39;s compression/window-resize.sh exceeds the 200 =
s<br>
per-case limit in cli-tests.<br>
<br>
To confirm that these fail only on time, I reran them under QEMU with this<=
br>
series, PTEST_RUNNER_TIMEOUT =3D &quot;7200&quot; &amp; the cli-tests limit=
 raised to 3600 s<br>
(local changes, not in this series). All passed with 0 failures, as they do=
 on<br>
the board:<br>
<br>
=C2=A0 zstd=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A043 pass=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 10 min<br>
=C2=A0 libpcap=C2=A0 =C2=A0 =C2=A0 =C2=A0 14801 pass=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A024 min<br>
=C2=A0 tcl=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 175 test files=C2=A0 =
=C2=A0 =C2=A046 min<br>
=C2=A0 lttng-tools=C2=A0 =C2=A0 2088 pass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 85 min<br>
=C2=A0 python3-numpy=C2=A0 45769 pass=C2=A0 =C2=A0 =C2=A0 =C2=A0 104 min<br=
>
=C2=A0 python3-cffi=C2=A0 =C2=A01724 pass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
187 min<br>
=C2=A0 perl=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A02729 pass=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0219 min<br>
<br>
python3-numpy stays parked too: patch 8 fixes its only failure (72 cases of=
<br>
test_unary_spurious_fpexception), but under the 450 s limit numpy 2.5.4 is<=
br>
killed before pytest prints its first result.<br>
<br>
glib-2.0 is left parked. It passed one run on QEMU (308 pass, 31 min) &amp;=
 on the<br>
board, but it was parked for intermittent failures, which one run cannot ru=
le<br>
out:<br>
<a href=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15891" rel=
=3D"noreferrer" target=3D"_blank">https://bugzilla.yoctoproject.org/show_bu=
g.cgi?id=3D15891</a><br>
<a href=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D16230" rel=
=3D"noreferrer" target=3D"_blank">https://bugzilla.yoctoproject.org/show_bu=
g.cgi?id=3D16230</a><br>
<br>
The numpy results above are for 2.5.3, before the rebase. numpy 2.5.4 with<=
br>
patch 8, under QEMU with the 7200 s limit: 45993 pass, 0 fail, 87 min. One<=
br>
earlier 2.5.4 run had a single failure, a wall-clock check in f2py<br>
(test_nameargspattern_backtracking) that requires a regex search to take un=
der<br>
0.2 s &amp; measured 0.22 s under TCG; it passed on the rerun.<br>
<br>
OOHehir (8):<br>
=C2=A0 strace: skip qual_fault-syscall.test on riscv64<br>
=C2=A0 ptest-packagelists.inc: re-enable strace for riscv64<br>
=C2=A0 ptest-packagelists.inc: re-enable python3 for riscv64<br>
=C2=A0 lttng-tools: skip kernel cases when kernel tests are disabled<br>
=C2=A0 tcl, tcl8: anchor the musl unixInit-3 skip to top-level SKIP lines<b=
r>
=C2=A0 tcl, tcl8: skip binary-40.3 on RISC-V<br>
=C2=A0 ptest-packagelists.inc: re-enable tcl8 for riscv64<br>
=C2=A0 python3-numpy: call libm for ceil/floor/trunc on riscv64<br>
<br>
=C2=A0.../distro/include/ptest-packagelists.inc=C2=A0 =C2=A0 =C2=A0|=C2=A0 =
=C2=A07 +-<br>
=C2=A0.../python/<a href=3D"http://python3-numpy_2.5.4.bb" rel=3D"noreferre=
r" target=3D"_blank">python3-numpy_2.5.4.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A05 +<br>
=C2=A0meta/recipes-devtools/strace/<a href=3D"http://strace_7.2.bb" rel=3D"=
noreferrer" target=3D"_blank">strace_7.2.bb</a>=C2=A0 =C2=A0 |=C2=A0 12 ++<=
br>
=C2=A0meta/recipes-devtools/tcltk/tcl/run-ptest=C2=A0 =C2=A0 =C2=A0|=C2=A0 =
=C2=A05 +<br>
=C2=A0meta/recipes-devtools/tcltk/<a href=3D"http://tcl_9.1.0.bb" rel=3D"no=
referrer" target=3D"_blank">tcl_9.1.0.bb</a>=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
=C2=A02 +-<br>
=C2=A0meta/recipes-devtools/tcltk8/tcl8/run-ptest=C2=A0 =C2=A0|=C2=A0 =C2=
=A05 +<br>
=C2=A0meta/recipes-devtools/tcltk8/<a href=3D"http://tcl8_8.6.18.bb" rel=3D=
"noreferrer" target=3D"_blank">tcl8_8.6.18.bb</a>=C2=A0 =C2=A0|=C2=A0 =C2=
=A02 +-<br>
=C2=A0...our-LTTNG_TOOLS_DISABLE_KERNEL_TESTS.patch | 108 +++++++++++++++++=
+<br>
=C2=A0.../lttng/<a href=3D"http://lttng-tools_2.16.0.bb" rel=3D"noreferrer"=
 target=3D"_blank">lttng-tools_2.16.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 +<br>
=C2=A09 files changed, 140 insertions(+), 7 deletions(-)<br>
=C2=A0create mode 100644 meta/recipes-kernel/lttng/lttng-tools/0001-tests-h=
onour-LTTNG_TOOLS_DISABLE_KERNEL_TESTS.patch<br>
<br>
-- <br>
2.43.0<br>
<br>
</blockquote></div>

--0000000000000c014f065e0cf71c--

