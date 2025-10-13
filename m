Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DA12CCA476
	for <webhook@archiver.kernel.org>; Mon, 13 Oct 2025 06:11:57 +0000 (UTC)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
 by mx.groups.io with SMTP id smtpd.web11.36525.1760335914291451764
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Oct 2025 23:11:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VMZE4b99;
 spf=pass (domain: gmail.com, ip: 209.85.128.174, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-71d60157747so37275107b3.0
        for <openembedded-core@lists.openembedded.org>; Sun, 12 Oct 2025 23:11:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760335913; x=1760940713; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4htglPEhTb8tCmGVAlXqo5MuFeStu8VKAPv/QxrhUnw=;
        b=VMZE4b99vtyFAwYa/RIKe3YwHfh6ZPv1TDin0xb3Dm/urdp+XZBHYHq0kGosH774t2
         35Xc2NC58csm0cKObF7JQQg7JpuVkOBZ0B/p9chzhPvKenOKUB1pDwjXYeL/RdL1RBxx
         QbVjqDMnci53z0ScLfMldbKdyJ6C7Hiwk3ZjAlCIGdvuJo3nFlJBGKc/pnWKNcThNJ3h
         g9xqEQVkrZKnvA0HIssMyPNcjBmAHJTfmTGrIZ1ekoBY1ZX1wgH7Uo/GX0NsQ221SnsK
         UoZvTdzmEnupdAbFB/SYKTs3udv5YJwie6bmqeZkV7em+QkBbN1YVrVHRfwI8ukc3zUI
         Wtkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760335913; x=1760940713;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4htglPEhTb8tCmGVAlXqo5MuFeStu8VKAPv/QxrhUnw=;
        b=oeEEaYwCxohR4/jhFZ5uu/jQghkhFRYsz9nflIrJuVOccKgbRkCKbj+RV11rUVkhXg
         WLtl3rG9ahnkM86LOiKZUESMYsAJOwOs+iLZYxzIPL2Nb98jU8bqGYbVBQTljxFVoJl8
         Z1GkfxcONd6LmSqoshjTamMswtYuBt+3je+JFsx9eG2YB5UPfFNkzfVdk1y1r/7kzhaW
         8xw8hacB+iL223tmw/mi2vjIpSL2bjbJIq9tFzsCbcMYowAlwBvchsfUe68M3TEd4C3G
         Vv7ZuqCJ3x1MPOIEsBdw2cE/uvqhPMEbmFOjBanT2o4Q9rKqgomauOabMwsIl1XKmybB
         PVsw==
X-Gm-Message-State: AOJu0YzTsPibflo99NlZEwc5F1PHgtyfiZPKG5QWqF5xLmkmvz9Jwd0y
	9/fgs99Z9Af3TwFuwoSzS8WMtMvT27vkFviCTCd3KfljeMbRdnM8C8fQ2fGbFl5FBAYaxBenvud
	sAt4Koi0fbGrgIjxJ6BUoVmRsUjIbt6LaVJSu
X-Gm-Gg: ASbGncvj05LEMg9y+Fa3GcW7ZhMj9uLA/aj221Es5aBJEbyifckZuieJk3UBHoprwLq
	xxHJGPxxLhbmnNznYxCPnZK5jSDdu/RTkvDIzaoZdVkt6egggckSTaY7fJl6LcDMmo/pXV9OIaK
	oHK+wKon65aN+JwSqGrdFwutDpPVnWXpK7ko4yuPLs7+1JsOR2uLYpAOAqSu9mKxQ3zpV4hfgXS
	yrsALwNqVUpSf+ZEV77yabXNszVO3rr56scv3CHiQdpjkZbBst0P/8Fxy5Q4weDhl3suw==
X-Google-Smtp-Source: AGHT+IFZWSo7YbVQthYdn7P5cHi93CoZOcsWOsqH3ktNi5abxX+AkxOwGnyCoMW3XUSe8uw6RnozC4GO82MgwRSA8q0=
X-Received: by 2002:a05:690e:204:b0:636:f08:8ad2 with SMTP id
 956f58d0204a3-63ccb9047ecmr15284517d50.38.1760335913145; Sun, 12 Oct 2025
 23:11:53 -0700 (PDT)
MIME-Version: 1.0
References: <20251007063146.2204704-1-Deepesh.Varatharajan@windriver.com>
 <CAMKF1srf+8nF9rvQ058VpzeFU4zPMe4b88jYCT3QqrW=D_nkYw@mail.gmail.com> <fa48bc66-598e-4155-92e1-0ca43f61358f@windriver.com>
In-Reply-To: <fa48bc66-598e-4155-92e1-0ca43f61358f@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 12 Oct 2025 23:11:26 -0700
X-Gm-Features: AS18NWBILukXPxPWpRh6K1phiYrG9uvhEfeGnmyGmbOGs5gEpxMRIWKWs3ZqK9Y
Message-ID: <CAMKF1sr8_bCUs-pVvvv-cGbG00t914Rz2+_VfT06VinLACtywA@mail.gmail.com>
Subject: Re: [OE-core] [scarthgap][PATCH] glibc: stable 2.39 branch updates
To: Deepesh Varatharajan <deepesh.varatharajan@windriver.com>
Cc: openembedded-core@lists.openembedded.org, Sundeep.Kokkonda@windriver.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Oct 2025 06:11:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224759

On Sun, Oct 12, 2025 at 10:43=E2=80=AFPM Deepesh Varatharajan
<deepesh.varatharajan@windriver.com> wrote:
>
>
> On 08-10-2025 03:00, Khem Raj wrote:
>
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender an=
d know the content is safe.
>
>
> On Mon, Oct 6, 2025 at 11:33=E2=80=AFPM Varatharajan, Deepesh via lists.o=
penembedded.org <deepesh.varatharajan=3Dwindriver.com@lists.openembedded.or=
g> wrote:
>>
>> From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
>>
>> git log --oneline b027d5b145f1b2908f370bdb96dfe40180d0fcb6..765534258e7f=
2c33719e3a5bc13432552991513b
>>
>> 765534258e (HEAD, origin/release/2.39/master) nss: Group merge does not =
react to ERANGE during merge (bug 33361)
>> 7ce7b4b2f4 Rename new tst-sem17 test to tst-sem18
>> a6ac06abeb Avoid uninitialized result in sem_open when file does not exi=
st
>> ff6ce67220 elf: handle addition overflow in _dl_find_object_update_1 [BZ=
 #32245]
>> fffc2df8a3 Optimize __libc_tsd_* thread variable access
>> 83340b35cc i386: Add GLIBC_ABI_GNU_TLS version [BZ #33221]
>> 5541edb1bd i386: Also add GLIBC_ABI_GNU2_TLS version [BZ #33129]
>> 1f17635507 debug: Fix tst-longjmp_chk3 build failure on Hurd
>> 3b6c8ea878 debug: Wire up tst-longjmp_chk3
>> 89596f46e3 i386: Update ___tls_get_addr to preserve vector registers
>> 4c2509882f elf: Preserve _rtld_global layout for the release branch
>> cf0e7d512d elf: Compile _dl_debug_state separately (bug 33224)
>> 5cd1f4b1a1 elf: Restore support for _r_debug interpositions and copy rel=
ocations
>> 97017da5ef elf: Introduce _dl_debug_change_state
>> 5601ad79b7 elf: Introduce separate _r_debug_array variable
>> 24c94ea84e elf: Test dlopen (NULL, RTLD_LAZY) from an ELF constructor
>> 79d84b5da5 elf: Fix handling of symbol versions which hash to zero (bug =
29190)
>> 5f5c411132 elf: Second ld.so relocation only if libc.so has been loaded
>> 4c9b1877fd elf: Reorder audit events in dlcose to match _dl_fini (bug 32=
066)
>> f407a14ff7 elf: Call la_objclose for proxy link maps in _dl_fini (bug 32=
065)
>> e27601b385 elf: Signal la_objopen for the proxy link map in dlmopen (bug=
 31985)
>> fef226255d elf: Add the endswith function to <endswith.h>
>> d21a217fa0 elf: Update DSO list, write audit log to elf/tst-audit23.out
>> 4f145bb35d elf: Switch to main malloc after final ld.so self-relocation
>> 65d86471ce elf: Introduce _dl_relocate_object_no_relro
>> 5434cc2c41 elf: Do not define consider_profiling, consider_symbind as ma=
cros
>> b2d8c6cbe7 elf: rtld_multiple_ref is always true
>> 2b89de7c91 Revert "elf: Run constructors on cyclic recursive dlopen (bug=
 31986)"
>> 46e3ecad27 elf: Fix map_complete Systemtap probe in dl_open_worker
>> 5f225025db elf: Signal RT_CONSISTENT after relocation processing in dlop=
en (bug 31986)
>> d6cc325fcf elf: Signal LA_ACT_CONSISTENT to auditors after RT_CONSISTENT=
 switch
>> 6917fde6f9 elf: Run constructors on cyclic recursive dlopen (bug 31986)
>> 9fa7cc6a0b ldconfig: Move endswithn into a new header file
>> 269e89bd8d x86-64: Add GLIBC_ABI_DT_X86_64_PLT [BZ #33212]
>> 62ff85fd09 x86-64: Add GLIBC_ABI_GNU2_TLS version [BZ #33129]
>> f0e8d04eef libio: Test for fdopen memory leak without SEEK_END support (=
bug 31840)
>> 42a8cb7560 Remove memory leak in fdopen (bug 31840)
>> d1c1f78e9e math: Remove no-mathvec flag
>> 20d2d69a2f Use TLS initial-exec model for __libc_tsd_CTYPE_* thread vari=
ables [BZ #33234]
>> c11950503f ctype: Fallback initialization of TLS using relocations (bug =
19341, bug 32483)
>> 25c537c3b3 Use proper extern declaration for _nl_C_LC_CTYPE_{class,toupp=
er,tolower}
>> fbdf9680cc Remove <libc-tsd.h>
>> fca5937510 ctype: Reformat Makefile.
>> 49f0e73fa3 elf: Handle ld.so with LOAD segment gaps in _dl_find_object (=
bug 31943)
>> 64488b4b31 elf: Extract rtld_setup_phdr function from dl_main
>> 9833fcf7ce elf: Do not add a copy of _dl_find_object to libc.so
>> fbade65338 arm: Use _dl_find_object on __gnu_Unwind_Find_exidx (BZ 31405=
)
>> 392e6cf1e8 AArch64: Improve codegen in SVE log1p
>> 3a78a276a3 AArch64: Optimize inverse trig functions
>> b6ea8902a7 AArch64: Avoid memset ifunc in cpu-features.c [BZ #33112]
>>
>> Testing Results:
>>             Before     After    Diff
>> PASS         5080      5096      +16
>> XPASS        4         4          0
>> FAIL         119       123       +4
>> XFAIL        16        16         0
>> UNSUPPORTED  154       154        0
>>
>> Testcases changes
>>
>> testcase-name                                                before     =
      after
>>
>> debug/tst-longjmp_chk3(new)                                    -        =
       PASS
>> elf/check-dt-x86-64-plt(new)                                   -        =
       PASS
>> elf/check-gnu2-tls(new)                                        -        =
       PASS
>> lf/tst-dlmopen4-nonpic(new)                                    -        =
       PASS
>> elf/tst-dlmopen4-pic(new)                                      -        =
       PASS
>> elf/tst-dlopen-auditdup(new)                                   -        =
       PASS
>> elf/tst-dlopen-constructor-null(new)                           -        =
       PASS
>> elf/tst-link-map-contiguous-ldso(new)                          -        =
       PASS
>> elf/tst-link-map-contiguous-libc(new)                          -        =
       PASS
>> elf/tst-nolink-libc-1(new)                                     -        =
       PASS
>> elf/tst-nolink-libc-2(new)                                     -        =
       PASS
>> elf/tst-rtld-no-malloc(new)                                    -        =
       PASS
>> elf/tst-rtld-no-malloc-audit(new)                              -        =
       PASS
>> elf/tst-rtld-no-malloc-preload(new)                            -        =
       PASS
>> elf/tst-tls23(new)                                             -        =
       PASS
>> elf/tst-version-hash-zero(new)                                 -        =
       PASS
>> libio/tst-fdopen-seek-failure(new)                             -        =
       PASS
>> libio/tst-fdopen-seek-failure-mem(new)                         -        =
       PASS
>> nptl/tst-sem18(new)                                            -        =
       PASS
>> ctype/tst-ctype-tls-dlmopen(new)                               -        =
       FAIL
>> ctype/tst-ctype-tls-dlopen-static(new)                         -        =
       FAIL
>> stdio-common/tst-scanf-bz27650                                FAIL      =
       PASS
>> malloc/tst-aligned-alloc-random-thread-cross-malloc-check     PASS      =
       FAIL
>> malloc/tst-aligned-alloc-random-thread-malloc-check           PASS      =
       FAIL
>
>
> While new passes are good the above two are regressions. So it will be go=
od to quantify them a bit
>
> The test failures seem to be intermittent. At the moment, I don't have th=
e logs from the earlier failures,
> but I reran the tests a couple of times and they passed consistently. Goi=
ng forward, I'll keep an eye on
> any regressions. Shall I go ahead and send V2 with the updated commit mes=
sage?
>

Please do so.

>
>>
>> timezone/tst-tzset                                            PASS      =
       FAIL
>> elf/ifuncmain8                                                PASS      =
        -
>>
>> Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
>> ---
>>  meta/recipes-core/glibc/glibc-version.inc | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-co=
re/glibc/glibc-version.inc
>> index 89e532fd67..f63eb0ad56 100644
>> --- a/meta/recipes-core/glibc/glibc-version.inc
>> +++ b/meta/recipes-core/glibc/glibc-version.inc
>> @@ -1,7 +1,7 @@
>>  SRCBRANCH ?=3D "release/2.39/master"
>>  PV =3D "2.39+git"
>> -SRCREV_glibc ?=3D "b027d5b145f1b2908f370bdb96dfe40180d0fcb6"
>> -SRCREV_localedef ?=3D "fab74f31b3811df543e24b6de47efdf45b538abc"
>> +SRCREV_glibc ?=3D "765534258e7f2c33719e3a5bc13432552991513b"
>> +SRCREV_localedef ?=3D "cba02c503d7c853a38ccfb83c57e343ca5ecd7e5"
>>
>>  GLIBC_GIT_URI ?=3D "git://sourceware.org/git/glibc.git;protocol=3Dhttps=
"
>>
>> --
>> 2.49.0
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#224512): https://lists.openembedded.org/g/openembedd=
ed-core/message/224512
>> Mute This Topic: https://lists.openembedded.org/mt/115632145/1997914
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [r=
aj.khem@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

