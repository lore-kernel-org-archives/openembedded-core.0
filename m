Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4274CCA476
	for <webhook@archiver.kernel.org>; Tue,  7 Oct 2025 21:30:59 +0000 (UTC)
Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
 by mx.groups.io with SMTP id smtpd.web11.1654.1759872658767534744
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Oct 2025 14:30:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OqLE+Zaf;
 spf=pass (domain: gmail.com, ip: 74.125.224.41, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-635380a4a67so7756832d50.0
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Oct 2025 14:30:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759872658; x=1760477458; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PJ+RYJX71/CjT+jJtrevIQ+wCr8kUto/PsGveaJJgeA=;
        b=OqLE+ZafIRJ72JdPxltNMuw0iS0GYHjrGQ+VYq2l0iz0QOj3J4E5GF3AtXKX0LyhLC
         5AyMPM4LChjWEgGDZrN50VcLNE5pjJ/NDS1AffChlqF14eS7Ou580fYufWtFMoSQd1Dy
         TBHuxBRvmKmXo9g8WOCDXTw301ghQJ1FKcGHRfnC5EplYgQJrLqRPR60rhT0pxKsXtwH
         2OUjGhLfdycSpWOooUtikDr/DpEpZLUU+bYoPesvZJf7v/1BZZ2YQfzgvdzNJg4ELjgk
         JI0uCarIhFUapt9J1hX9jDXhbK+JnU/3s7dgMUNFuQvWWBW7fs2PdR4p7zZnnItqG6xT
         5E4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759872658; x=1760477458;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PJ+RYJX71/CjT+jJtrevIQ+wCr8kUto/PsGveaJJgeA=;
        b=g5OzjaoB5ySi0fygaokQ7NW/FWg3UKVJ+yy5mVGUiU380oquhxP/4hvnuj12Q8aKWO
         Bthg4kr8ngkY8Gg/r9z8nDjqiTzcSXYjjUBKg1faZAE3cSH5ARFqFvNFXcDp/dvF32aa
         M/lhxk8JloFd9oOwIpVAR419FGSsyZuW+k5sXl+L51Lds9HqAS2SU1qtUFKEMr3UDJjo
         AJe5w7TWCEu6BJL02MvKTtZ/0EWZthB1LxhrexTR3HhplUQonRj7uQQBRYDd8egvkTIB
         EVyiPPCsItraF7AdpLRNFQvDspNQsUb0XIODzEoZACid+v5PPDpLpOky6ud8R7TfjIis
         lCCQ==
X-Gm-Message-State: AOJu0Yxwe/ZWblSRJFozL/imlgy+mvyl+3iGP9LvRXp00ZSn0uEw92To
	xawU5VfQWVdOvQPlk7Wo80qkV53apPVO444IWj3b8A54T+fn1Ret0lvW4oDH8IGluZ69l6wXDlx
	7Tg/emV4NwaKT3s6RtcI7hLxnuvc09cmk6+Wu
X-Gm-Gg: ASbGnctyD40t58IpfGrNi3gr1VPoIBUBUjFzGmcUDTPjhtNQIPfS+2xUjSD4jZ36fku
	Nf9xc26XoEXFb8125uwC1NUCivdjdVvesq7ov6vb7mZ2vl1Py2+Letrnmbdsv4G0FCV8lG2HN0X
	/dMo2jqpQDKGOPc30IQsmsOucGKETQ46bu357hl3xYjVGOHuDLQFhMt/vC88aTbIqL33pMeqM+/
	J9ZEU7yCmbPbA+l3vX3pcr0tENetVjMlYMx1v7NnfSwM8rcuY7Tez88fPRlxIGXhQgomgDDz73a
	5Ycik4Flr4GFuwPNovaPtW0d3+pPNBCrLQTsHS8Hyvxfshz7yXiZFNQ8LiZw2W5QQ+A39KfdfvX
	iqM/iMA==
X-Google-Smtp-Source: AGHT+IEaI3IuPsKFCqHBVwnmMo27RDDVMD5GG9+8BV3mM/OEm7el5ZH+lNQmhZ1h2ECO2sAHuF5ZFCo/DCG8azLWXp8=
X-Received: by 2002:a53:d946:0:b0:636:d6e5:b5f4 with SMTP id
 956f58d0204a3-63ccb853d9amr946682d50.16.1759872657626; Tue, 07 Oct 2025
 14:30:57 -0700 (PDT)
MIME-Version: 1.0
References: <20251007063146.2204704-1-Deepesh.Varatharajan@windriver.com>
In-Reply-To: <20251007063146.2204704-1-Deepesh.Varatharajan@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 7 Oct 2025 14:30:46 -0700
X-Gm-Features: AS18NWDV7BrUGvR2ZBvRH8u8Q_hBarb9wtGR91fyBj2JXLxodnCjJkqbR142cAo
Message-ID: <CAMKF1srf+8nF9rvQ058VpzeFU4zPMe4b88jYCT3QqrW=D_nkYw@mail.gmail.com>
Subject: Re: [OE-core] [scarthgap][PATCH] glibc: stable 2.39 branch updates
To: deepesh.varatharajan@windriver.com
Cc: openembedded-core@lists.openembedded.org, Sundeep.Kokkonda@windriver.com
Content-Type: multipart/alternative; boundary="0000000000009b9d140640984838"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Oct 2025 21:30:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224567

--0000000000009b9d140640984838
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 6, 2025 at 11:33=E2=80=AFPM Varatharajan, Deepesh via
lists.openembedded.org <deepesh.varatharajan=3D
windriver.com@lists.openembedded.org> wrote:

> From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
>
> git log --oneline
> b027d5b145f1b2908f370bdb96dfe40180d0fcb6..765534258e7f2c33719e3a5bc134325=
52991513b
>
> 765534258e (HEAD, origin/release/2.39/master) nss: Group merge does not
> react to ERANGE during merge (bug 33361)
> 7ce7b4b2f4 Rename new tst-sem17 test to tst-sem18
> a6ac06abeb Avoid uninitialized result in sem_open when file does not exis=
t
> ff6ce67220 elf: handle addition overflow in _dl_find_object_update_1 [BZ
> #32245]
> fffc2df8a3 Optimize __libc_tsd_* thread variable access
> 83340b35cc i386: Add GLIBC_ABI_GNU_TLS version [BZ #33221]
> 5541edb1bd i386: Also add GLIBC_ABI_GNU2_TLS version [BZ #33129]
> 1f17635507 debug: Fix tst-longjmp_chk3 build failure on Hurd
> 3b6c8ea878 debug: Wire up tst-longjmp_chk3
> 89596f46e3 i386: Update ___tls_get_addr to preserve vector registers
> 4c2509882f elf: Preserve _rtld_global layout for the release branch
> cf0e7d512d elf: Compile _dl_debug_state separately (bug 33224)
> 5cd1f4b1a1 elf: Restore support for _r_debug interpositions and copy
> relocations
> 97017da5ef elf: Introduce _dl_debug_change_state
> 5601ad79b7 elf: Introduce separate _r_debug_array variable
> 24c94ea84e elf: Test dlopen (NULL, RTLD_LAZY) from an ELF constructor
> 79d84b5da5 elf: Fix handling of symbol versions which hash to zero (bug
> 29190)
> 5f5c411132 elf: Second ld.so relocation only if libc.so has been loaded
> 4c9b1877fd elf: Reorder audit events in dlcose to match _dl_fini (bug
> 32066)
> f407a14ff7 elf: Call la_objclose for proxy link maps in _dl_fini (bug
> 32065)
> e27601b385 elf: Signal la_objopen for the proxy link map in dlmopen (bug
> 31985)
> fef226255d elf: Add the endswith function to <endswith.h>
> d21a217fa0 elf: Update DSO list, write audit log to elf/tst-audit23.out
> 4f145bb35d elf: Switch to main malloc after final ld.so self-relocation
> 65d86471ce elf: Introduce _dl_relocate_object_no_relro
> 5434cc2c41 elf: Do not define consider_profiling, consider_symbind as
> macros
> b2d8c6cbe7 elf: rtld_multiple_ref is always true
> 2b89de7c91 Revert "elf: Run constructors on cyclic recursive dlopen (bug
> 31986)"
> 46e3ecad27 elf: Fix map_complete Systemtap probe in dl_open_worker
> 5f225025db elf: Signal RT_CONSISTENT after relocation processing in dlope=
n
> (bug 31986)
> d6cc325fcf elf: Signal LA_ACT_CONSISTENT to auditors after RT_CONSISTENT
> switch
> 6917fde6f9 elf: Run constructors on cyclic recursive dlopen (bug 31986)
> 9fa7cc6a0b ldconfig: Move endswithn into a new header file
> 269e89bd8d x86-64: Add GLIBC_ABI_DT_X86_64_PLT [BZ #33212]
> 62ff85fd09 x86-64: Add GLIBC_ABI_GNU2_TLS version [BZ #33129]
> f0e8d04eef libio: Test for fdopen memory leak without SEEK_END support
> (bug 31840)
> 42a8cb7560 Remove memory leak in fdopen (bug 31840)
> d1c1f78e9e math: Remove no-mathvec flag
> 20d2d69a2f Use TLS initial-exec model for __libc_tsd_CTYPE_* thread
> variables [BZ #33234]
> c11950503f ctype: Fallback initialization of TLS using relocations (bug
> 19341, bug 32483)
> 25c537c3b3 Use proper extern declaration for
> _nl_C_LC_CTYPE_{class,toupper,tolower}
> fbdf9680cc Remove <libc-tsd.h>
> fca5937510 ctype: Reformat Makefile.
> 49f0e73fa3 elf: Handle ld.so with LOAD segment gaps in _dl_find_object
> (bug 31943)
> 64488b4b31 elf: Extract rtld_setup_phdr function from dl_main
> 9833fcf7ce elf: Do not add a copy of _dl_find_object to libc.so
> fbade65338 arm: Use _dl_find_object on __gnu_Unwind_Find_exidx (BZ 31405)
> 392e6cf1e8 AArch64: Improve codegen in SVE log1p
> 3a78a276a3 AArch64: Optimize inverse trig functions
> b6ea8902a7 AArch64: Avoid memset ifunc in cpu-features.c [BZ #33112]
>
> Testing Results:
>             Before     After    Diff
> PASS         5080      5096      +16
> XPASS        4         4          0
> FAIL         119       123       +4
> XFAIL        16        16         0
> UNSUPPORTED  154       154        0
>
> Testcases changes
>
> testcase-name                                                before
>    after
>
> debug/tst-longjmp_chk3(new)                                    -
>      PASS
> elf/check-dt-x86-64-plt(new)                                   -
>      PASS
> elf/check-gnu2-tls(new)                                        -
>      PASS
> lf/tst-dlmopen4-nonpic(new)                                    -
>      PASS
> elf/tst-dlmopen4-pic(new)                                      -
>      PASS
> elf/tst-dlopen-auditdup(new)                                   -
>      PASS
> elf/tst-dlopen-constructor-null(new)                           -
>      PASS
> elf/tst-link-map-contiguous-ldso(new)                          -
>      PASS
> elf/tst-link-map-contiguous-libc(new)                          -
>      PASS
> elf/tst-nolink-libc-1(new)                                     -
>      PASS
> elf/tst-nolink-libc-2(new)                                     -
>      PASS
> elf/tst-rtld-no-malloc(new)                                    -
>      PASS
> elf/tst-rtld-no-malloc-audit(new)                              -
>      PASS
> elf/tst-rtld-no-malloc-preload(new)                            -
>      PASS
> elf/tst-tls23(new)                                             -
>      PASS
> elf/tst-version-hash-zero(new)                                 -
>      PASS
> libio/tst-fdopen-seek-failure(new)                             -
>      PASS
> libio/tst-fdopen-seek-failure-mem(new)                         -
>      PASS
> nptl/tst-sem18(new)                                            -
>      PASS
> ctype/tst-ctype-tls-dlmopen(new)                               -
>      FAIL
> ctype/tst-ctype-tls-dlopen-static(new)                         -
>      FAIL
> stdio-common/tst-scanf-bz27650                                FAIL
>      PASS
> malloc/tst-aligned-alloc-random-thread-cross-malloc-check     PASS
>      FAIL
> malloc/tst-aligned-alloc-random-thread-malloc-check           PASS
>      FAIL


While new passes are good the above two are regressions. So it will be good
to quantify them a bit


> timezone/tst-tzset                                            PASS
>      FAIL
> elf/ifuncmain8                                                PASS
>       -
>
> Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
> ---
>  meta/recipes-core/glibc/glibc-version.inc | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-core/glibc/glibc-version.inc
> b/meta/recipes-core/glibc/glibc-version.inc
> index 89e532fd67..f63eb0ad56 100644
> --- a/meta/recipes-core/glibc/glibc-version.inc
> +++ b/meta/recipes-core/glibc/glibc-version.inc
> @@ -1,7 +1,7 @@
>  SRCBRANCH ?=3D "release/2.39/master"
>  PV =3D "2.39+git"
> -SRCREV_glibc ?=3D "b027d5b145f1b2908f370bdb96dfe40180d0fcb6"
> -SRCREV_localedef ?=3D "fab74f31b3811df543e24b6de47efdf45b538abc"
> +SRCREV_glibc ?=3D "765534258e7f2c33719e3a5bc13432552991513b"
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
> View/Reply Online (#224512):
> https://lists.openembedded.org/g/openembedded-core/message/224512
> Mute This Topic: https://lists.openembedded.org/mt/115632145/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000009b9d140640984838
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote gmail_quote_container"><d=
iv dir=3D"ltr" class=3D"gmail_attr">On Mon, Oct 6, 2025 at 11:33=E2=80=AFPM=
 Varatharajan, Deepesh via <a href=3D"http://lists.openembedded.org">lists.=
openembedded.org</a> &lt;deepesh.varatharajan=3D<a href=3D"mailto:windriver=
.com@lists.openembedded.org">windriver.com@lists.openembedded.org</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex=
;border-left:1px #ccc solid;padding-left:1ex">From: Deepesh Varatharajan &l=
t;<a href=3D"mailto:Deepesh.Varatharajan@windriver.com" target=3D"_blank">D=
eepesh.Varatharajan@windriver.com</a>&gt;<br>
<br>
git log --oneline b027d5b145f1b2908f370bdb96dfe40180d0fcb6..765534258e7f2c3=
3719e3a5bc13432552991513b<br>
<br>
765534258e (HEAD, origin/release/2.39/master) nss: Group merge does not rea=
ct to ERANGE during merge (bug 33361)<br>
7ce7b4b2f4 Rename new tst-sem17 test to tst-sem18<br>
a6ac06abeb Avoid uninitialized result in sem_open when file does not exist<=
br>
ff6ce67220 elf: handle addition overflow in _dl_find_object_update_1 [BZ #3=
2245]<br>
fffc2df8a3 Optimize __libc_tsd_* thread variable access<br>
83340b35cc i386: Add GLIBC_ABI_GNU_TLS version [BZ #33221]<br>
5541edb1bd i386: Also add GLIBC_ABI_GNU2_TLS version [BZ #33129]<br>
1f17635507 debug: Fix tst-longjmp_chk3 build failure on Hurd<br>
3b6c8ea878 debug: Wire up tst-longjmp_chk3<br>
89596f46e3 i386: Update ___tls_get_addr to preserve vector registers<br>
4c2509882f elf: Preserve _rtld_global layout for the release branch<br>
cf0e7d512d elf: Compile _dl_debug_state separately (bug 33224)<br>
5cd1f4b1a1 elf: Restore support for _r_debug interpositions and copy reloca=
tions<br>
97017da5ef elf: Introduce _dl_debug_change_state<br>
5601ad79b7 elf: Introduce separate _r_debug_array variable<br>
24c94ea84e elf: Test dlopen (NULL, RTLD_LAZY) from an ELF constructor<br>
79d84b5da5 elf: Fix handling of symbol versions which hash to zero (bug 291=
90)<br>
5f5c411132 elf: Second ld.so relocation only if libc.so has been loaded<br>
4c9b1877fd elf: Reorder audit events in dlcose to match _dl_fini (bug 32066=
)<br>
f407a14ff7 elf: Call la_objclose for proxy link maps in _dl_fini (bug 32065=
)<br>
e27601b385 elf: Signal la_objopen for the proxy link map in dlmopen (bug 31=
985)<br>
fef226255d elf: Add the endswith function to &lt;endswith.h&gt;<br>
d21a217fa0 elf: Update DSO list, write audit log to elf/tst-audit23.out<br>
4f145bb35d elf: Switch to main malloc after final ld.so self-relocation<br>
65d86471ce elf: Introduce _dl_relocate_object_no_relro<br>
5434cc2c41 elf: Do not define consider_profiling, consider_symbind as macro=
s<br>
b2d8c6cbe7 elf: rtld_multiple_ref is always true<br>
2b89de7c91 Revert &quot;elf: Run constructors on cyclic recursive dlopen (b=
ug 31986)&quot;<br>
46e3ecad27 elf: Fix map_complete Systemtap probe in dl_open_worker<br>
5f225025db elf: Signal RT_CONSISTENT after relocation processing in dlopen =
(bug 31986)<br>
d6cc325fcf elf: Signal LA_ACT_CONSISTENT to auditors after RT_CONSISTENT sw=
itch<br>
6917fde6f9 elf: Run constructors on cyclic recursive dlopen (bug 31986)<br>
9fa7cc6a0b ldconfig: Move endswithn into a new header file<br>
269e89bd8d x86-64: Add GLIBC_ABI_DT_X86_64_PLT [BZ #33212]<br>
62ff85fd09 x86-64: Add GLIBC_ABI_GNU2_TLS version [BZ #33129]<br>
f0e8d04eef libio: Test for fdopen memory leak without SEEK_END support (bug=
 31840)<br>
42a8cb7560 Remove memory leak in fdopen (bug 31840)<br>
d1c1f78e9e math: Remove no-mathvec flag<br>
20d2d69a2f Use TLS initial-exec model for __libc_tsd_CTYPE_* thread variabl=
es [BZ #33234]<br>
c11950503f ctype: Fallback initialization of TLS using relocations (bug 193=
41, bug 32483)<br>
25c537c3b3 Use proper extern declaration for _nl_C_LC_CTYPE_{class,toupper,=
tolower}<br>
fbdf9680cc Remove &lt;libc-tsd.h&gt;<br>
fca5937510 ctype: Reformat Makefile.<br>
49f0e73fa3 elf: Handle ld.so with LOAD segment gaps in _dl_find_object (bug=
 31943)<br>
64488b4b31 elf: Extract rtld_setup_phdr function from dl_main<br>
9833fcf7ce elf: Do not add a copy of _dl_find_object to libc.so<br>
fbade65338 arm: Use _dl_find_object on __gnu_Unwind_Find_exidx (BZ 31405)<b=
r>
392e6cf1e8 AArch64: Improve codegen in SVE log1p<br>
3a78a276a3 AArch64: Optimize inverse trig functions<br>
b6ea8902a7 AArch64: Avoid memset ifunc in cpu-features.c [BZ #33112]<br>
<br>
Testing Results:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Before=C2=A0 =C2=A0 =C2=A0After=
=C2=A0 =C2=A0 Diff<br>
PASS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A05080=C2=A0 =C2=A0 =C2=A0 5096=C2=A0 =
=C2=A0 =C2=A0 +16<br>
XPASS=C2=A0 =C2=A0 =C2=A0 =C2=A0 4=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A04=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0<br>
FAIL=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0119=C2=A0 =C2=A0 =C2=A0 =C2=A0123=C2=
=A0 =C2=A0 =C2=A0 =C2=A0+4<br>
XFAIL=C2=A0 =C2=A0 =C2=A0 =C2=A0 16=C2=A0 =C2=A0 =C2=A0 =C2=A0 16=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A00<br>
UNSUPPORTED=C2=A0 154=C2=A0 =C2=A0 =C2=A0 =C2=A0154=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 0<br>
<br>
Testcases changes<br>
<br>
testcase-name=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 before=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0after<br>
<br>
debug/tst-longjmp_chk3(new)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PASS<br>
elf/check-dt-x86-64-plt(new)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PASS<br>
elf/check-gnu2-tls(new)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PASS<=
br>
lf/tst-dlmopen4-nonpic(new)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PASS<br>
elf/tst-dlmopen4-pic(new)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PASS<br>
elf/tst-dlopen-auditdup(new)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PASS<br>
elf/tst-dlopen-constructor-null(new)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PASS<br>
elf/tst-link-map-contiguous-ldso(new)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PASS<br>
elf/tst-link-map-contiguous-libc(new)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PASS<br>
elf/tst-nolink-libc-1(new)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PASS<br>
elf/tst-nolink-libc-2(new)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PASS<br>
elf/tst-rtld-no-malloc(new)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PASS<br>
elf/tst-rtld-no-malloc-audit(new)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PASS<br>
elf/tst-rtld-no-malloc-preload(new)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PASS<br>
elf/tst-tls23(new)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0PASS<br>
elf/tst-version-hash-zero(new)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PASS<br>
libio/tst-fdopen-seek-failure(new)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PASS<br>
libio/tst-fdopen-seek-failure-mem(new)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PASS<br>
nptl/tst-sem18(new)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0PASS<br>
ctype/tst-ctype-tls-dlmopen(new)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0FAIL<br>
ctype/tst-ctype-tls-dlopen-static(new)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0FAIL<br>
stdio-common/tst-scanf-bz27650=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 FAIL=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PASS<br>
malloc/tst-aligned-alloc-random-thread-cross-malloc-check=C2=A0 =C2=A0 =C2=
=A0PASS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0FAIL<br>
malloc/tst-aligned-alloc-random-thread-malloc-check=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0PASS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0FAIL</=
blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">While new passes a=
re good the above two are regressions. So it will be good to quantify them =
a bit=C2=A0</div><div dir=3D"auto"><br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"=
 dir=3D"auto"><br>
timezone/tst-tzset=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 PASS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0FAIL<br>
elf/ifuncmain8=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 PASS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 -<br>
<br>
Signed-off-by: Deepesh Varatharajan &lt;<a href=3D"mailto:Deepesh.Varathara=
jan@windriver.com" target=3D"_blank">Deepesh.Varatharajan@windriver.com</a>=
&gt;<br>
---<br>
=C2=A0meta/recipes-core/glibc/glibc-version.inc | 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/=
glibc/glibc-version.inc<br>
index 89e532fd67..f63eb0ad56 100644<br>
--- a/meta/recipes-core/glibc/glibc-version.inc<br>
+++ b/meta/recipes-core/glibc/glibc-version.inc<br>
@@ -1,7 +1,7 @@<br>
=C2=A0SRCBRANCH ?=3D &quot;release/2.39/master&quot;<br>
=C2=A0PV =3D &quot;2.39+git&quot;<br>
-SRCREV_glibc ?=3D &quot;b027d5b145f1b2908f370bdb96dfe40180d0fcb6&quot;<br>
-SRCREV_localedef ?=3D &quot;fab74f31b3811df543e24b6de47efdf45b538abc&quot;=
<br>
+SRCREV_glibc ?=3D &quot;765534258e7f2c33719e3a5bc13432552991513b&quot;<br>
+SRCREV_localedef ?=3D &quot;cba02c503d7c853a38ccfb83c57e343ca5ecd7e5&quot;=
<br>
<br>
=C2=A0GLIBC_GIT_URI ?=3D &quot;git://<a href=3D"http://sourceware.org/git/g=
libc.git;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_blank">sourceware.=
org/git/glibc.git;protocol=3Dhttps</a>&quot;<br>
<br>
-- <br>
2.49.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#224512): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/224512" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/224512</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/115632145/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/115632145/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--0000000000009b9d140640984838--

