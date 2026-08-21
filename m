Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FBE7C5DF97
	for <webhook@archiver.kernel.org>; Fri, 21 Aug 2026 21:51:57 +0000 (UTC)
Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1261.1787349107861204391
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Aug 2026 14:51:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=WqJ+XT5Y;
 spf=pass (domain: gmail.com, ip: 74.125.224.43, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-66c67a73eb7so4104996d50.0
        for <openembedded-core@lists.openembedded.org>; Fri, 21 Aug 2026 14:51:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787349107; cv=none;
        d=google.com; s=arc-20260327;
        b=I0rA0t/CQ3RbyVDUGiTuJZ0kXoXcBm5k36OhnLDNFgxqOhTxT8Vh0iZnwIrtqXaw14
         vPv5OJA+V8Bv5E4U7IfWm8MFWmkGMo4+z3/jL53Oa3Hlvi2L9Bm3VdpB+sHjUnXo1eaX
         sIJ8ROjEELtROYvdN1fx0qrJDWiH7OPkdkfBw/QmITT5aJMxcJ1Kpfauu1bCsOwOiZTS
         Kx1bXt9Xqhxzw1r1UI6EXjCgj5PIRfoxzjWHkfsg4ojK+rEn9r4FL5lg047ZrqV7hQuM
         KTy2uK1PpKq2id4v0yQ7bLgDOSF5JyMOd6qZSjf5TQxJHfwxvDMom/Znh5JrqQ59Kh6T
         FAfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=m7NTU4Bc3NSY3peBDf4o9aASQP0fbH8UlryCzDuVezI=;
        fh=FMXx/UdFGIas1maFMEnmWZBBwuuvxFx63aIn1VWvzmg=;
        b=XfTpjSD12j4RHfSsE6gd3m7VdJSL6usoE2Qo66LKFirnwXEMObkDewxO5IYa7KrZN9
         zI29beH78Gc4ij+8oX1aveo9p95qJ8h4mjSuO/yUcmiYRDbyTTeO5CRVXBlhdbpseWnn
         uoD+FomdwamjebV56O1S6XzdgvG2Hc1f40onCMnxeV7C/jE4gZCBbyIBe5q9R1zg+JZE
         qK2997q97W2uxpNSHDxXYq70ZlBdjRMA+lyv1+GEsZZgOg6OBIG4FWTZUaKBf973MS2e
         pmLwSSugAopTBIwQzvqQe5L18pEFaT3Ex8CEXM7p3DeTlLgbCxzzJTrbPlB37YHD1cS+
         H6WQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787349107; x=1787953907; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m7NTU4Bc3NSY3peBDf4o9aASQP0fbH8UlryCzDuVezI=;
        b=WqJ+XT5YlHIHus+DKctidrTpPrdlY/zHwN9BgBxllCha/cpyJcwiExSCUt/O6UVcrn
         DLC6ZcvWI6ZtSwOAcwnpkFNg2jStkYoCQiP+7/5SyMCWfUU+mJ03LaRi3rGVdrNzc4uT
         d++/7Aa3DKaX3HmZdVipapS8ZtFN1HpPBeej+4eaprufPLOfGD/hVEtq2xbAXrU6ZvgU
         BP3XeuhCorg6wRF7vja731EcQwYMfiFzGQUhN84vu/XL89a5QEgvtFg9Cv8QsM5JoEKR
         ucp5NcWiY0coChldN/e5vWbPGm8tn5z3BDolvvb5mrSVcGH1gggcqw9IAUewwGq/tA3z
         WfNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787349107; x=1787953907;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=m7NTU4Bc3NSY3peBDf4o9aASQP0fbH8UlryCzDuVezI=;
        b=Q3l7Vqz4c8W3/eBH58U/58IutaOMW0HtbkGPP3zxp/eEJ4zUKwt0l9jEfzEh8Cdo5h
         qcvrUOMc3QSA07Av8AvUzt01BGEvfiiD8MnOSbzSXJ/G7uVCi/A8IDlKclAbdczYOpvp
         8GxZxWw+2XLW4o8EuERseaMk2W5XZvPtKlHMom9e7UPbCkVEKTxEZE3Yd6qzlQab4npL
         TynuWbWOyjPL7IpeZv/ucUWj838z+aMa5Jux/qjTNEfJrxMmzjBDtxlNVtBIs0QclmJl
         SNmlrUznLW37eFb9X5LFtiKRjt8WEWM/jPq99lBkwVTotlJQ71cdg7cMoEv2Dxg3gt/u
         ew6w==
X-Forwarded-Encrypted: i=1; AHgh+RqHr/ovReMO2x61sGSOGxEsTgpxZwU0smeazJuI0joBuCsBXUnjFkMlHjL84VJD9Z7rMd3dPlvugMKdtbvMVsLFcw==@lists.openembedded.org
X-Gm-Message-State: AFuF++mNZZAkXQh14LmuldICuIxoTXxbDZkPJ8IYakVGyJTD/WTHGMBx
	DecpOwFKTOLs1aOm/7NCdngwiwaOlCnd+D8FoViKn9uTRPQnZCkmn2vuxkbeqvv1yXu4CpigP+D
	NzR9iEK7Zrhv5Tu1tgkF/6IQ4hep0yYhOpyXf
X-Gm-Gg: AR+sD11ntUuduel7nHZVoOCLvSnDBL1ryohW3POWgugXBxAFZiTHvdCazYcstR9kJgN
	Kv0M2rafVQLzHPvy4qsXSwEyh/sIdzdBirLAlL0M9s58Da86/NScQuvsBkWTMn2dSvupblZQUT2
	1dsP2D7sZfDrd55aiLhuQNzPZPectuwqX5AzclbHrdx5Orm0yUyFLvtdxw9hBjJczTGoAjCGQBy
	eN5DnLWqdNkGL4zwEdrEBNHuQQTGylsJT4JOI8bEaqZwsr6eqlYyDHP12kFSrnGkuUhf6cuj5//
	JoBZTN3uB+5vPOiibB4eD1LagimnQnH1LWm+/C4czFdhQnpt70qC/fIvuqOSqD8PpkRiM2eJQVm
	C7Ef0vnxi8OQhuLF19UL70wvOdMA9FLYNSL+fJmJ9AbUDIEhnManf94CxJ+tp3nCdjAwh7XeJN3
	MBVhiQ8CgeEH5ZqXMO6p9iNMBx6Fqc3RppGLTQGVNc0qnFZYSwfDm9lMfPIc1y7xbTdQ8rtEA7x
	B43CRl5t/lutw==
X-Received: by 2002:a05:690e:13cf:b0:660:6303:f8fa with SMTP id
 956f58d0204a3-66cd68d6902mr5494812d50.10.1787349106748; Fri, 21 Aug 2026
 14:51:46 -0700 (PDT)
MIME-Version: 1.0
References: <20260821112509.861559-1-bruce.ashfield@gmail.com> <CAMKF1sqJypcJUYhf7Sv1+jVN5qOWgx-K29rr0axm_ErYhRBJ-Q@mail.gmail.com>
In-Reply-To: <CAMKF1sqJypcJUYhf7Sv1+jVN5qOWgx-K29rr0axm_ErYhRBJ-Q@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 21 Aug 2026 14:51:20 -0700
X-Gm-Features: AcwNN1U3zwptpLtMWGVCVgIXcysQxDqe0Lxs_Y7A0K-JleiSEE9SrWmQwmAwN2k
Message-ID: <CAMKF1srj7qN4dn8zyRP-AQ_PQkJb-MKt0D0sTndXxLLnnVdB5Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 0/6] kernel-yocto: 6.18 and 7.2 RFC/prep
To: bruce.ashfield@gmail.com
Cc: richard.purdie@linuxfoundation.org, 
	openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000098f9b7065995a415"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Aug 2026 21:51:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243957

--00000000000098f9b7065995a415
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

fwiw, I think the linux-atm should be dropped and vboxguestdrivers have to
compile differently for 7.x
I have taken care of this for meta-openembedded.

On Fri, Aug 21, 2026 at 8:43=E2=80=AFAM Khem Raj <raj.khem@gmail.com> wrote=
:

> I am seeing vboxguestdrivers module and linux-atm module failures -
> https://errors.yoctoproject.org/Errors/Build/247453/
>
> On Fri, Aug 21, 2026 at 4:25=E2=80=AFAM Bruce Ashfield via lists.openembe=
dded.org
> <bruce.ashfield=3Dgmail.com@lists.openembedded.org> wrote:
>
>> From: Bruce Ashfield <bruce.ashfield@gmail.com>
>>
>> Richard,
>>
>> I've worked through enough issues with 7.2 and 7.2 libc-headers that
>> I wanted to send this series as a RFC preparation step to get the
>> progress visible and out for more testing. 7.2 definitely isn't ready
>> to be a default yet, but it is getting there.
>>
>> For the fall release, we'll keep 6.18 as the LTS reference, and
>> 7.2 will be the leading tested kernel (and -dev will be 7.3+).
>>
>> This has been tested on all arches, glibc/musl, -rt/-tiny/-standard.
>>
>> I'm out of the office for the next week, but will keep this
>> moving as best I can.
>>
>> Cheers,
>>
>> Bruce
>>
>> openembedded-core (5):
>>   linux-yocto/6.18: update to v6.18.44
>>   linux-libc-headers: update to 7.2
>>   linux-yocto/7.2: introduce reference kernel recipes
>>   kernel-devsrc: strip riscv vdso-cfi-offsets .cmd file
>>   kernel-devsrc: copy arch/x86 vdso2c sources for on-target
>>
>> meta-yocto (1):
>>   linux-yocto/6.18: update to v6.18.44
>>
>>  openembedded-core:
>>  meta/classes/recipe_sanity.bbclass
>>                                         | 21 +++++++++++++++++++++
>>  meta/conf/distro/include/maintainers.inc
>>                                         |  1 -
>>  meta/lib/oe/fitimage.py
>>                                        |  4 ++--
>>  meta/lib/oeqa/selftest/cases/fitimage.py
>>                                         |  2 +-
>>  meta/recipes-connectivity/bind/bind/0001-avoid-start-failure-with-bind-=
user.patch
>>                              |  2 +-
>>  meta/recipes-connectivity/bind/bind/0001-m4-Backport-ax_prog_cc_for_bui=
ld.m4-macros.patch
>>                      |  2 +-
>>  meta/recipes-connectivity/bind/bind/0001-named-lwresd-V-and-start-log-h=
ide-build-options.patch
>>                 |  4 ++--
>>  meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-json-head=
ers-searches-sysr.patch
>>                 |  4 ++--
>>  meta/recipes-connectivity/bind/bind/conf.patch
>>                                         |  2 +-
>>  meta/recipes-connectivity/bind/bind/init.d-add-support-for-read-only-ro=
otfs.patch
>>                              |  2 +-
>>  meta/recipes-connectivity/bind/bind/make-etc-initd-bind-stop-work.patch
>>                                        |  2 +-
>>  meta/recipes-connectivity/bind/{bind_9.20.27.bb =3D> bind_9.20.26.bb}
>>                                          |  2 +-
>>  meta/recipes-core/initrdscripts/initramfs-framework/udev
>>                                         | 32
>> +-------------------------------
>>  meta/recipes-devtools/elfutils/{elfutils_0.196.bb =3D> elfutils_0.195.b=
b}
>>                                        |  9 +++------
>>  meta/recipes-devtools/elfutils/files/0001-config-eu.am-do-not-force-Wer=
ror.patch
>>                               |  4 ++--
>>  meta/recipes-devtools/elfutils/files/0001-libelf-Add-libeu-objects-to-l=
ibelf.a-static-archive.patch
>>            | 35 +++++++++++++++++++++++++++++++++++
>>  meta/recipes-devtools/elfutils/files/0001-libelf-elf_end.c-check-data_l=
ist.data.d.d_buf-before.patch
>>           |  2 +-
>>  meta/recipes-devtools/elfutils/files/0001-skip-the-test-when-gcc-not-de=
ployed.patch
>>                            |  2 +-
>>  meta/recipes-devtools/elfutils/files/0001-tests-Makefile.am-compile-tes=
t_nlist-with-standard-C.patch
>>           |  6 +++---
>>  meta/recipes-devtools/elfutils/files/0002-Fix-elf_cvt_gunhash-if-dest-a=
nd-src-are-same.patch
>>                   |  2 +-
>>  meta/recipes-devtools/elfutils/files/0003-fixheadercheck.patch
>>                                         |  2 +-
>>  meta/recipes-devtools/elfutils/files/0003-musl-utils.patch
>>                                         | 12 ++++++------
>>  meta/recipes-devtools/elfutils/files/ptest.patch
>>                                         |  8 ++++----
>>  meta/recipes-devtools/erofs-utils/{erofs-utils_1.9.4.bb =3D>
>> erofs-utils_1.9.3.bb}                                |  2 +-
>>  meta/recipes-devtools/lua/{lua_5.5.1.bb =3D> lua_5.5.0.bb}
>>                                         |  6 +++---
>>  meta/recipes-devtools/python/python3-mako_1.4.1.bb
>>                                         |  2 --
>>  meta/recipes-devtools/python/python3-pycryptodomex_3.23.0.bb
>>                                         |  2 +-
>>  meta/recipes-devtools/python/{python3-pygments_2.21.0.bb =3D>
>> python3-pygments_2.20.0.bb}                         |  4 +---
>>  meta/recipes-devtools/python/python3_3.14.7.bb
>>                                         |  8 --------
>>  meta/recipes-devtools/qemu/{qemu-native_11.1.0.bb =3D>
>> qemu-native_11.0.3.bb}                                     |  0
>>  meta/recipes-devtools/qemu/{qemu-system-native_11.1.0.bb =3D>
>> qemu-system-native_11.0.3.bb}                       |  0
>>  meta/recipes-devtools/qemu/qemu.inc
>>                                        |  5 ++++-
>>  meta/recipes-devtools/qemu/qemu/0007-tests-meson.build-use-relative-pat=
h-to-refer-to-file.patch
>>                | 17 +++++------------
>>  meta/recipes-devtools/qemu/qemu/0012-meson-fix-close_range-detection-on=
-older-glibc.patch
>>                      | 39 +++++++++++++++++++++++++++++++++++++++
>>  meta/recipes-devtools/qemu/qemu/0013-hw-scsi-vhost-scsi-include-standar=
d-headers-for-vhost-worker-structs.patch
>> | 37 +++++++++++++++++++++++++++++++++++++
>>  meta/recipes-devtools/qemu/{qemu_11.1.0.bb =3D> qemu_11.0.3.bb}
>>                                          |  0
>>  meta/recipes-devtools/strace/strace/0001-configure-Use-autoconf-macro-t=
o-detect-largefile-sup.patch
>>            |  2 +-
>>  meta/recipes-devtools/strace/strace/0001-m4-Backport-ax_prog_cc_for_bui=
ld.m4-macros.patch
>>                      |  2 +-
>>  meta/recipes-devtools/strace/strace/0001-strace-fix-reproducibilty-issu=
es.patch
>>                                |  2 +-
>>  meta/recipes-devtools/strace/strace/0002-tests-Replace-off64_t-with-off=
_t.patch
>>                                |  2 +-
>>  meta/recipes-devtools/strace/strace/Makefile-ptest.patch
>>                                         |  6 +++---
>>  meta/recipes-devtools/strace/strace/ptest-spacesave.patch
>>                                        |  2 +-
>>  meta/recipes-devtools/strace/strace/run-ptest
>>                                        |  2 +-
>>  meta/recipes-devtools/strace/strace/skip-load.patch
>>                                        |  2 +-
>>  meta/recipes-devtools/strace/strace/update-gawk-paths.patch
>>                                        |  2 +-
>>  meta/recipes-devtools/strace/{strace_7.2.bb =3D> strace_7.1.bb}
>>                                          |  2 +-
>>  meta/recipes-extended/procps/procps/0001-testsuite-skip-pgrep-full-proc=
ess-name-match-test.patch
>>               | 39 ---------------------------------------
>>  meta/recipes-extended/procps/procps/0001-testsuite-skip-signal-based-ki=
ll-tests.patch
>>                          | 54
>> ------------------------------------------------------
>>  meta/recipes-extended/procps/procps_4.0.7.bb
>>                                         |  2 --
>>  meta/recipes-graphics/mesa/files/0001-addrlib-avoid-builtin_cpu_support=
s-for-avx2-detecti.patch
>>                | 56 ----------------------------------------------------=
----
>>  meta/recipes-graphics/mesa/mesa.inc
>>                                        |  1 -
>>  meta/recipes-kernel/libtracefs/libtracefs_1.8.3.bb
>>                                         | 20 --------------------
>>  meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc
>>                                        |  2 ++
>>  meta/recipes-kernel/linux-libc-headers/{linux-libc-headers_6.18.bb =3D>
>> linux-libc-headers_7.2.bb}                |  2 +-
>>  meta/recipes-kernel/linux/kernel-devsrc.bb
>>                                         |  5 +++++
>>  meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb
>>                                         |  6 +++---
>>  meta/recipes-kernel/linux/linux-yocto-rt_7.2.bb
>>                                          | 49
>> +++++++++++++++++++++++++++++++++++++++++++++++++
>>  meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb
>>                                         |  6 +++---
>>  meta/recipes-kernel/linux/linux-yocto-tiny_7.2.bb
>>                                          | 34
>> ++++++++++++++++++++++++++++++++++
>>  meta/recipes-kernel/linux/linux-yocto_6.18.bb
>>                                          | 24 ++++++++++++------------
>>  meta/recipes-kernel/linux/linux-yocto_7.2.bb
>>                                         | 78
>> ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++=
++++++
>>  meta/recipes-kernel/powertop/powertop/0001-wakeup_xxx.h-include-limits.=
h.patch
>>                                 | 55
>> +++++++++++++++++++++++++++++++++++++++++++++++++++++++
>>  meta/recipes-kernel/powertop/{powertop_2.16.bb =3D> powertop_2.15.bb}
>>                                          | 14 +++++++-------
>>  meta/recipes-support/boost/boost-build-native_1.92.0.bb
>>                                          |  3 +--
>>  meta/recipes-support/boost/boost-build/add-python-numpy-include-feature=
.patch
>>                                  | 74
>> ------------------------------------------------------------------------=
--
>>  meta/recipes-support/boost/boost.inc
>>                                         |  9 +--------
>>  66 files changed, 446 insertions(+), 395 deletions(-)
>>
>>  meta-yocto:
>>  meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.18.bbappend | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> --
>> 2.43.0
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#243924):
>> https://lists.openembedded.org/g/openembedded-core/message/243924
>> Mute This Topic: https://lists.openembedded.org/mt/120859731/1997914
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
>> raj.khem@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>>

--00000000000098f9b7065995a415
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: base64

PGRpdiBkaXI9Imx0ciI+ZndpdywgSSB0aGluayB0aGXCoGxpbnV4LWF0bSBzaG91bGQgYmUgZHJv
cHBlZCBhbmQgdmJveGd1ZXN0ZHJpdmVyc8KgaGF2ZSB0byBjb21waWxlIGRpZmZlcmVudGx5IGZv
ciA3Lng8ZGl2PkkgaGF2ZSB0YWtlbiBjYXJlIG9mIHRoaXMgZm9yIG1ldGEtb3BlbmVtYmVkZGVk
LjwvZGl2PjwvZGl2Pjxicj48ZGl2IGNsYXNzPSJnbWFpbF9xdW90ZSBnbWFpbF9xdW90ZV9jb250
YWluZXIiPjxkaXYgZGlyPSJsdHIiIGNsYXNzPSJnbWFpbF9hdHRyIj5PbiBGcmksIEF1ZyAyMSwg
MjAyNiBhdCA4OjQz4oCvQU0gS2hlbSBSYWogJmx0OzxhIGhyZWY9Im1haWx0bzpyYWoua2hlbUBn
bWFpbC5jb20iPnJhai5raGVtQGdtYWlsLmNvbTwvYT4mZ3Q7IHdyb3RlOjxicj48L2Rpdj48Ymxv
Y2txdW90ZSBjbGFzcz0iZ21haWxfcXVvdGUiIHN0eWxlPSJtYXJnaW46MHB4IDBweCAwcHggMC44
ZXg7Ym9yZGVyLWxlZnQ6MXB4IHNvbGlkIHJnYigyMDQsMjA0LDIwNCk7cGFkZGluZy1sZWZ0OjFl
eCI+PGRpdiBkaXI9Imx0ciI+SSBhbSBzZWVpbmcgdmJveGd1ZXN0ZHJpdmVyc8KgbW9kdWxlIGFu
ZCBsaW51eC1hdG0gbW9kdWxlIGZhaWx1cmVzIC3CoDxhIGhyZWY9Imh0dHBzOi8vZXJyb3JzLnlv
Y3RvcHJvamVjdC5vcmcvRXJyb3JzL0J1aWxkLzI0NzQ1My8iIHRhcmdldD0iX2JsYW5rIj5odHRw
czovL2Vycm9ycy55b2N0b3Byb2plY3Qub3JnL0Vycm9ycy9CdWlsZC8yNDc0NTMvPC9hPjwvZGl2
Pjxicj48ZGl2IGNsYXNzPSJnbWFpbF9xdW90ZSI+PGRpdiBkaXI9Imx0ciIgY2xhc3M9ImdtYWls
X2F0dHIiPk9uIEZyaSwgQXVnIDIxLCAyMDI2IGF0IDQ6MjXigK9BTSBCcnVjZSBBc2hmaWVsZCB2
aWEgPGEgaHJlZj0iaHR0cDovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmciIHRhcmdldD0iX2JsYW5r
Ij5saXN0cy5vcGVuZW1iZWRkZWQub3JnPC9hPiAmbHQ7YnJ1Y2UuYXNoZmllbGQ9PGEgaHJlZj0i
bWFpbHRvOmdtYWlsLmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnIiB0YXJnZXQ9Il9ibGFuayI+
Z21haWwuY29tQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc8L2E+Jmd0OyB3cm90ZTo8YnI+PC9kaXY+
PGJsb2NrcXVvdGUgY2xhc3M9ImdtYWlsX3F1b3RlIiBzdHlsZT0ibWFyZ2luOjBweCAwcHggMHB4
IDAuOGV4O2JvcmRlci1sZWZ0OjFweCBzb2xpZCByZ2IoMjA0LDIwNCwyMDQpO3BhZGRpbmctbGVm
dDoxZXgiPkZyb206IEJydWNlIEFzaGZpZWxkICZsdDs8YSBocmVmPSJtYWlsdG86YnJ1Y2UuYXNo
ZmllbGRAZ21haWwuY29tIiB0YXJnZXQ9Il9ibGFuayI+YnJ1Y2UuYXNoZmllbGRAZ21haWwuY29t
PC9hPiZndDs8YnI+DQo8YnI+DQpSaWNoYXJkLDxicj4NCjxicj4NCkkmIzM5O3ZlIHdvcmtlZCB0
aHJvdWdoIGVub3VnaCBpc3N1ZXMgd2l0aCA3LjIgYW5kIDcuMiBsaWJjLWhlYWRlcnMgdGhhdDxi
cj4NCkkgd2FudGVkIHRvIHNlbmQgdGhpcyBzZXJpZXMgYXMgYSBSRkMgcHJlcGFyYXRpb24gc3Rl
cCB0byBnZXQgdGhlPGJyPg0KcHJvZ3Jlc3MgdmlzaWJsZSBhbmQgb3V0IGZvciBtb3JlIHRlc3Rp
bmcuIDcuMiBkZWZpbml0ZWx5IGlzbiYjMzk7dCByZWFkeTxicj4NCnRvIGJlIGEgZGVmYXVsdCB5
ZXQsIGJ1dCBpdCBpcyBnZXR0aW5nIHRoZXJlLjxicj4NCjxicj4NCkZvciB0aGUgZmFsbCByZWxl
YXNlLCB3ZSYjMzk7bGwga2VlcCA2LjE4IGFzIHRoZSBMVFMgcmVmZXJlbmNlLCBhbmQ8YnI+DQo3
LjIgd2lsbCBiZSB0aGUgbGVhZGluZyB0ZXN0ZWQga2VybmVsIChhbmQgLWRldiB3aWxsIGJlIDcu
MyspLjxicj4NCjxicj4NClRoaXMgaGFzIGJlZW4gdGVzdGVkIG9uIGFsbCBhcmNoZXMsIGdsaWJj
L211c2wsIC1ydC8tdGlueS8tc3RhbmRhcmQuPGJyPg0KPGJyPg0KSSYjMzk7bSBvdXQgb2YgdGhl
IG9mZmljZSBmb3IgdGhlIG5leHQgd2VlaywgYnV0IHdpbGwga2VlcCB0aGlzPGJyPg0KbW92aW5n
IGFzIGJlc3QgSSBjYW4uPGJyPg0KPGJyPg0KQ2hlZXJzLDxicj4NCjxicj4NCkJydWNlPGJyPg0K
PGJyPg0Kb3BlbmVtYmVkZGVkLWNvcmUgKDUpOjxicj4NCsKgIGxpbnV4LXlvY3RvLzYuMTg6IHVw
ZGF0ZSB0byB2Ni4xOC40NDxicj4NCsKgIGxpbnV4LWxpYmMtaGVhZGVyczogdXBkYXRlIHRvIDcu
Mjxicj4NCsKgIGxpbnV4LXlvY3RvLzcuMjogaW50cm9kdWNlIHJlZmVyZW5jZSBrZXJuZWwgcmVj
aXBlczxicj4NCsKgIGtlcm5lbC1kZXZzcmM6IHN0cmlwIHJpc2N2IHZkc28tY2ZpLW9mZnNldHMg
LmNtZCBmaWxlPGJyPg0KwqAga2VybmVsLWRldnNyYzogY29weSBhcmNoL3g4NiB2ZHNvMmMgc291
cmNlcyBmb3Igb24tdGFyZ2V0PGJyPg0KPGJyPg0KbWV0YS15b2N0byAoMSk6PGJyPg0KwqAgbGlu
dXgteW9jdG8vNi4xODogdXBkYXRlIHRvIHY2LjE4LjQ0PGJyPg0KPGJyPg0KwqBvcGVuZW1iZWRk
ZWQtY29yZTo8YnI+DQrCoG1ldGEvY2xhc3Nlcy9yZWNpcGVfc2FuaXR5LmJiY2xhc3PCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCB8IDIx
ICsrKysrKysrKysrKysrKysrKysrKzxicj4NCsKgbWV0YS9jb25mL2Rpc3Ryby9pbmNsdWRlL21h
aW50YWluZXJzLmluY8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIHzCoCAxIC08YnI+DQrCoG1ldGEvbGliL29lL2ZpdGltYWdlLnB5wqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqB8wqAgNCArKy0tPGJyPg0KwqBtZXRhL2xpYi9vZXFhL3NlbGZ0ZXN0L2Nhc2VzL2Zp
dGltYWdlLnB5wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgfMKgIDIgKy08YnI+DQrCoG1ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC9iaW5kLzAw
MDEtYXZvaWQtc3RhcnQtZmFpbHVyZS13aXRoLWJpbmQtdXNlci5wYXRjaMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfMKgIDIgKy08YnI+DQrCoG1ldGEvcmVj
aXBlcy1jb25uZWN0aXZpdHkvYmluZC9iaW5kLzAwMDEtbTQtQmFja3BvcnQtYXhfcHJvZ19jY19m
b3JfYnVpbGQubTQtbWFjcm9zLnBhdGNowqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqB8wqAgMiArLTxicj4NCsKgbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmQvMDAw
MS1uYW1lZC1sd3Jlc2QtVi1hbmQtc3RhcnQtbG9nLWhpZGUtYnVpbGQtb3B0aW9ucy5wYXRjaMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHzCoCA0ICsrLS08YnI+DQrCoG1ldGEvcmVjaXBlcy1j
b25uZWN0aXZpdHkvYmluZC9iaW5kL2JpbmQtZW5zdXJlLXNlYXJjaGluZy1mb3ItanNvbi1oZWFk
ZXJzLXNlYXJjaGVzLXN5c3IucGF0Y2jCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCB8wqAgNCAr
Ky0tPGJyPg0KwqBtZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZC9jb25mLnBhdGNo
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgfMKgIDIgKy08YnI+DQrC
oG1ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC9iaW5kL2luaXQuZC1hZGQtc3VwcG9ydC1m
b3ItcmVhZC1vbmx5LXJvb3Rmcy5wYXRjaMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgfMKgIDIgKy08YnI+DQrCoG1ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkv
YmluZC9iaW5kL21ha2UtZXRjLWluaXRkLWJpbmQtc3RvcC13b3JrLnBhdGNowqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB8wqAgMiAr
LTxicj4NCsKgbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL3s8YSBocmVmPSJodHRwOi8v
YmluZF85LjIwLjI3LmJiIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5iaW5kXzku
MjAuMjcuYmI8L2E+ID0mZ3Q7IDxhIGhyZWY9Imh0dHA6Ly9iaW5kXzkuMjAuMjYuYmIiIHJlbD0i
bm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmJpbmRfOS4yMC4yNi5iYjwvYT59wqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqB8wqAgMiArLTxicj4NCsKgbWV0YS9yZWNpcGVzLWNvcmUvaW5pdHJkc2NyaXB0cy9pbml0cmFt
ZnMtZnJhbWV3b3JrL3VkZXbCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCB8IDMyICstLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tPGJyPg0KwqBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvZWxm
dXRpbHMvezxhIGhyZWY9Imh0dHA6Ly9lbGZ1dGlsc18wLjE5Ni5iYiIgcmVsPSJub3JlZmVycmVy
IiB0YXJnZXQ9Il9ibGFuayI+ZWxmdXRpbHNfMC4xOTYuYmI8L2E+ID0mZ3Q7IDxhIGhyZWY9Imh0
dHA6Ly9lbGZ1dGlsc18wLjE5NS5iYiIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+
ZWxmdXRpbHNfMC4xOTUuYmI8L2E+fcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfMKgIDkgKysrLS0tLS0tPGJyPg0KwqBtZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvZWxmdXRpbHMvZmlsZXMvMDAwMS1jb25maWctZXUuYW0tZG8tbm90LWZv
cmNlLVdlcnJvci5wYXRjaMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIHzCoCA0ICsrLS08YnI+DQrCoG1ldGEvcmVjaXBlcy1kZXZ0b29scy9lbGZ1dGlscy9m
aWxlcy8wMDAxLWxpYmVsZi1BZGQtbGliZXUtb2JqZWN0cy10by1saWJlbGYuYS1zdGF0aWMtYXJj
aGl2ZS5wYXRjaMKgIMKgIMKgIMKgIMKgIMKgIMKgfCAzNSArKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKzxicj4NCsKgbWV0YS9yZWNpcGVzLWRldnRvb2xzL2VsZnV0aWxzL2ZpbGVz
LzAwMDEtbGliZWxmLWVsZl9lbmQuYy1jaGVjay1kYXRhX2xpc3QuZGF0YS5kLmRfYnVmLWJlZm9y
ZS5wYXRjaMKgIMKgIMKgIMKgIMKgIMKgIHzCoCAyICstPGJyPg0KwqBtZXRhL3JlY2lwZXMtZGV2
dG9vbHMvZWxmdXRpbHMvZmlsZXMvMDAwMS1za2lwLXRoZS10ZXN0LXdoZW4tZ2NjLW5vdC1kZXBs
b3llZC5wYXRjaMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfMKg
IDIgKy08YnI+DQrCoG1ldGEvcmVjaXBlcy1kZXZ0b29scy9lbGZ1dGlscy9maWxlcy8wMDAxLXRl
c3RzLU1ha2VmaWxlLmFtLWNvbXBpbGUtdGVzdF9ubGlzdC13aXRoLXN0YW5kYXJkLUMucGF0Y2jC
oCDCoCDCoCDCoCDCoCDCoCB8wqAgNiArKystLS08YnI+DQrCoG1ldGEvcmVjaXBlcy1kZXZ0b29s
cy9lbGZ1dGlscy9maWxlcy8wMDAyLUZpeC1lbGZfY3Z0X2d1bmhhc2gtaWYtZGVzdC1hbmQtc3Jj
LWFyZS1zYW1lLnBhdGNowqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgfMKgIDIgKy08YnI+
DQrCoG1ldGEvcmVjaXBlcy1kZXZ0b29scy9lbGZ1dGlscy9maWxlcy8wMDAzLWZpeGhlYWRlcmNo
ZWNrLnBhdGNowqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgfMKgIDIgKy08YnI+DQrCoG1ldGEvcmVjaXBlcy1k
ZXZ0b29scy9lbGZ1dGlscy9maWxlcy8wMDAzLW11c2wtdXRpbHMucGF0Y2jCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCB8IDEyICsrKysrKy0tLS0tLTxicj4NCsKgbWV0YS9yZWNpcGVzLWRldnRvb2xz
L2VsZnV0aWxzL2ZpbGVzL3B0ZXN0LnBhdGNowqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgfMKgIDggKysrKy0tLS08YnI+DQrCoG1ldGEvcmVjaXBlcy1kZXZ0b29scy9lcm9m
cy11dGlscy97PGEgaHJlZj0iaHR0cDovL2Vyb2ZzLXV0aWxzXzEuOS40LmJiIiByZWw9Im5vcmVm
ZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5lcm9mcy11dGlsc18xLjkuNC5iYjwvYT4gPSZndDsgPGEg
aHJlZj0iaHR0cDovL2Vyb2ZzLXV0aWxzXzEuOS4zLmJiIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdl
dD0iX2JsYW5rIj5lcm9mcy11dGlsc18xLjkuMy5iYjwvYT59wqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgfMKgIDIgKy08YnI+DQrCoG1ldGEvcmVjaXBlcy1k
ZXZ0b29scy9sdWEvezxhIGhyZWY9Imh0dHA6Ly9sdWFfNS41LjEuYmIiIHJlbD0ibm9yZWZlcnJl
ciIgdGFyZ2V0PSJfYmxhbmsiPmx1YV81LjUuMS5iYjwvYT4gPSZndDsgPGEgaHJlZj0iaHR0cDov
L2x1YV81LjUuMC5iYiIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+bHVhXzUuNS4w
LmJiPC9hPn3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCB8wqAgNiArKystLS08YnI+DQrCoG1l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vPGEgaHJlZj0iaHR0cDovL3B5dGhvbjMtbWFrb18x
LjQuMS5iYiIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+cHl0aG9uMy1tYWtvXzEu
NC4xLmJiPC9hPsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHzCoCAyIC0tPGJy
Pg0KwqBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uLzxhIGhyZWY9Imh0dHA6Ly9weXRob24z
LXB5Y3J5cHRvZG9tZXhfMy4yMy4wLmJiIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5r
Ij5weXRob24zLXB5Y3J5cHRvZG9tZXhfMy4yMy4wLmJiPC9hPsKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IHzCoCAyICstPGJyPg0KwqBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3s8YSBocmVmPSJo
dHRwOi8vcHl0aG9uMy1weWdtZW50c18yLjIxLjAuYmIiIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0
PSJfYmxhbmsiPnB5dGhvbjMtcHlnbWVudHNfMi4yMS4wLmJiPC9hPiA9Jmd0OyA8YSBocmVmPSJo
dHRwOi8vcHl0aG9uMy1weWdtZW50c18yLjIwLjAuYmIiIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0
PSJfYmxhbmsiPnB5dGhvbjMtcHlnbWVudHNfMi4yMC4wLmJiPC9hPn3CoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoHzCoCA0ICstLS08YnI+DQrCoG1ldGEvcmVjaXBlcy1kZXZ0
b29scy9weXRob24vPGEgaHJlZj0iaHR0cDovL3B5dGhvbjNfMy4xNC43LmJiIiByZWw9Im5vcmVm
ZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5weXRob24zXzMuMTQuNy5iYjwvYT7CoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCB8wqAgOCAtLS0tLS0tLTxicj4NCsKgbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3FlbXUvezxhIGhyZWY9Imh0dHA6Ly9xZW11LW5hdGl2ZV8xMS4xLjAu
YmIiIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPnFlbXUtbmF0aXZlXzExLjEuMC5i
YjwvYT4gPSZndDsgPGEgaHJlZj0iaHR0cDovL3FlbXUtbmF0aXZlXzExLjAuMy5iYiIgcmVsPSJu
b3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+cWVtdS1uYXRpdmVfMTEuMC4zLmJiPC9hPn3CoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHzCoCAw
PGJyPg0KwqBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS97PGEgaHJlZj0iaHR0cDovL3FlbXUt
c3lzdGVtLW5hdGl2ZV8xMS4xLjAuYmIiIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsi
PnFlbXUtc3lzdGVtLW5hdGl2ZV8xMS4xLjAuYmI8L2E+ID0mZ3Q7IDxhIGhyZWY9Imh0dHA6Ly9x
ZW11LXN5c3RlbS1uYXRpdmVfMTEuMC4zLmJiIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2Js
YW5rIj5xZW11LXN5c3RlbS1uYXRpdmVfMTEuMC4zLmJiPC9hPn3CoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoHzCoCAwPGJyPg0KwqBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9x
ZW11LmluY8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgfMKgIDUgKysrKy08YnI+DQrCoG1ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3Fl
bXUvMDAwNy10ZXN0cy1tZXNvbi5idWlsZC11c2UtcmVsYXRpdmUtcGF0aC10by1yZWZlci10by1m
aWxlLnBhdGNowqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB8IDE3ICsrKysrLS0tLS0tLS0tLS0t
PGJyPg0KwqBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11LzAwMTItbWVzb24tZml4LWNs
b3NlX3JhbmdlLWRldGVjdGlvbi1vbi1vbGRlci1nbGliYy5wYXRjaMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgfCAzOSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKys8YnI+DQrCoG1ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXUvMDAxMy1ody1zY3Np
LXZob3N0LXNjc2ktaW5jbHVkZS1zdGFuZGFyZC1oZWFkZXJzLWZvci12aG9zdC13b3JrZXItc3Ry
dWN0cy5wYXRjaCB8IDM3ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKys8YnI+
DQrCoG1ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3s8YSBocmVmPSJodHRwOi8vcWVtdV8xMS4x
LjAuYmIiIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPnFlbXVfMTEuMS4wLmJiPC9h
PiA9Jmd0OyA8YSBocmVmPSJodHRwOi8vcWVtdV8xMS4wLjMuYmIiIHJlbD0ibm9yZWZlcnJlciIg
dGFyZ2V0PSJfYmxhbmsiPnFlbXVfMTEuMC4zLmJiPC9hPn3CoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHzC
oCAwPGJyPg0KwqBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvc3RyYWNlL3N0cmFjZS8wMDAxLWNvbmZp
Z3VyZS1Vc2UtYXV0b2NvbmYtbWFjcm8tdG8tZGV0ZWN0LWxhcmdlZmlsZS1zdXAucGF0Y2jCoCDC
oCDCoCDCoCDCoCDCoCDCoHzCoCAyICstPGJyPg0KwqBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvc3Ry
YWNlL3N0cmFjZS8wMDAxLW00LUJhY2twb3J0LWF4X3Byb2dfY2NfZm9yX2J1aWxkLm00LW1hY3Jv
cy5wYXRjaMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfMKgIDIgKy08YnI+DQrC
oG1ldGEvcmVjaXBlcy1kZXZ0b29scy9zdHJhY2Uvc3RyYWNlLzAwMDEtc3RyYWNlLWZpeC1yZXBy
b2R1Y2liaWx0eS1pc3N1ZXMucGF0Y2jCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoHzCoCAyICstPGJyPg0KwqBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvc3Ry
YWNlL3N0cmFjZS8wMDAyLXRlc3RzLVJlcGxhY2Utb2ZmNjRfdC13aXRoLW9mZl90LnBhdGNowqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB8wqAgMiArLTxi
cj4NCsKgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3N0cmFjZS9zdHJhY2UvTWFrZWZpbGUtcHRlc3Qu
cGF0Y2jCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCB8wqAgNiArKystLS08YnI+DQrCoG1ldGEv
cmVjaXBlcy1kZXZ0b29scy9zdHJhY2Uvc3RyYWNlL3B0ZXN0LXNwYWNlc2F2ZS5wYXRjaMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgfMKgIDIgKy08YnI+DQrCoG1ldGEvcmVjaXBlcy1kZXZ0b29s
cy9zdHJhY2Uvc3RyYWNlL3J1bi1wdGVzdMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgfMKgIDIgKy08YnI+DQrCoG1ldGEvcmVjaXBlcy1kZXZ0b29scy9zdHJhY2Uv
c3RyYWNlL3NraXAtbG9hZC5wYXRjaMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
fMKgIDIgKy08YnI+DQrCoG1ldGEvcmVjaXBlcy1kZXZ0b29scy9zdHJhY2Uvc3RyYWNlL3VwZGF0
ZS1nYXdrLXBhdGhzLnBhdGNowqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB8wqAgMiArLTxicj4NCsKg
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3N0cmFjZS97PGEgaHJlZj0iaHR0cDovL3N0cmFjZV83LjIu
YmIiIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPnN0cmFjZV83LjIuYmI8L2E+ID0m
Z3Q7IDxhIGhyZWY9Imh0dHA6Ly9zdHJhY2VfNy4xLmJiIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdl
dD0iX2JsYW5rIj5zdHJhY2VfNy4xLmJiPC9hPn3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHzCoCAyICst
PGJyPg0KwqBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQvcHJvY3BzL3Byb2Nwcy8wMDAxLXRlc3RzdWl0
ZS1za2lwLXBncmVwLWZ1bGwtcHJvY2Vzcy1uYW1lLW1hdGNoLXRlc3QucGF0Y2jCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCB8IDM5IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LTxicj4NCsKgbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3Byb2Nwcy9wcm9jcHMvMDAwMS10ZXN0c3Vp
dGUtc2tpcC1zaWduYWwtYmFzZWQta2lsbC10ZXN0cy5wYXRjaMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgfCA1NCAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS08YnI+DQrCoG1ldGEvcmVjaXBlcy1leHRlbmRlZC9wcm9j
cHMvPGEgaHJlZj0iaHR0cDovL3Byb2Nwc180LjAuNy5iYiIgcmVsPSJub3JlZmVycmVyIiB0YXJn
ZXQ9Il9ibGFuayI+cHJvY3BzXzQuMC43LmJiPC9hPsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIHzCoCAyIC0tPGJyPg0KwqBtZXRhL3JlY2lwZXMtZ3JhcGhpY3Mv
bWVzYS9maWxlcy8wMDAxLWFkZHJsaWItYXZvaWQtYnVpbHRpbl9jcHVfc3VwcG9ydHMtZm9yLWF2
eDItZGV0ZWN0aS5wYXRjaMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfCA1NiAtLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLTxicj4NCsKgbWV0
YS9yZWNpcGVzLWdyYXBoaWNzL21lc2EvbWVzYS5pbmPCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHzCoCAxIC08YnI+DQrCoG1ldGEvcmVj
aXBlcy1rZXJuZWwvbGlidHJhY2Vmcy88YSBocmVmPSJodHRwOi8vbGlidHJhY2Vmc18xLjguMy5i
YiIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+bGlidHJhY2Vmc18xLjguMy5iYjwv
YT7CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCB8IDIwIC0tLS0tLS0tLS0tLS0t
LS0tLS0tPGJyPg0KwqBtZXRhL3JlY2lwZXMta2VybmVsL2xpbnV4LWxpYmMtaGVhZGVycy9saW51
eC1saWJjLWhlYWRlcnMuaW5jwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB8wqAgMiArKzxicj4NCsKgbWV0
YS9yZWNpcGVzLWtlcm5lbC9saW51eC1saWJjLWhlYWRlcnMvezxhIGhyZWY9Imh0dHA6Ly9saW51
eC1saWJjLWhlYWRlcnNfNi4xOC5iYiIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+
bGludXgtbGliYy1oZWFkZXJzXzYuMTguYmI8L2E+ID0mZ3Q7IDxhIGhyZWY9Imh0dHA6Ly9saW51
eC1saWJjLWhlYWRlcnNfNy4yLmJiIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5s
aW51eC1saWJjLWhlYWRlcnNfNy4yLmJiPC9hPn3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCB8wqAg
MiArLTxicj4NCsKgbWV0YS9yZWNpcGVzLWtlcm5lbC9saW51eC88YSBocmVmPSJodHRwOi8va2Vy
bmVsLWRldnNyYy5iYiIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+a2VybmVsLWRl
dnNyYy5iYjwvYT7CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCB8wqAgNSArKysrKzxicj4NCsKgbWV0YS9yZWNpcGVzLWtlcm5lbC9saW51eC88YSBocmVmPSJo
dHRwOi8vbGludXgteW9jdG8tcnRfNi4xOC5iYiIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9i
bGFuayI+bGludXgteW9jdG8tcnRfNi4xOC5iYjwvYT7CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCB8wqAgNiArKystLS08YnI+DQrCoG1ldGEvcmVjaXBlcy1rZXJuZWwvbGlu
dXgvPGEgaHJlZj0iaHR0cDovL2xpbnV4LXlvY3RvLXJ0XzcuMi5iYiIgcmVsPSJub3JlZmVycmVy
IiB0YXJnZXQ9Il9ibGFuayI+bGludXgteW9jdG8tcnRfNy4yLmJiPC9hPsKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfCA0OSArKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrPGJyPg0KwqBtZXRhL3JlY2lwZXMta2VybmVsL2xpbnV4
LzxhIGhyZWY9Imh0dHA6Ly9saW51eC15b2N0by10aW55XzYuMTguYmIiIHJlbD0ibm9yZWZlcnJl
ciIgdGFyZ2V0PSJfYmxhbmsiPmxpbnV4LXlvY3RvLXRpbnlfNi4xOC5iYjwvYT7CoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCB8wqAgNiArKystLS08YnI+DQrCoG1ldGEvcmVjaXBl
cy1rZXJuZWwvbGludXgvPGEgaHJlZj0iaHR0cDovL2xpbnV4LXlvY3RvLXRpbnlfNy4yLmJiIiBy
ZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5saW51eC15b2N0by10aW55XzcuMi5iYjwv
YT7CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHwgMzQgKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKzxicj4NCsKgbWV0YS9yZWNpcGVzLWtlcm5lbC9saW51eC88
YSBocmVmPSJodHRwOi8vbGludXgteW9jdG9fNi4xOC5iYiIgcmVsPSJub3JlZmVycmVyIiB0YXJn
ZXQ9Il9ibGFuayI+bGludXgteW9jdG9fNi4xOC5iYjwvYT7CoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoHwgMjQgKysrKysrKysrKysrLS0tLS0tLS0tLS0tPGJyPg0K
wqBtZXRhL3JlY2lwZXMta2VybmVsL2xpbnV4LzxhIGhyZWY9Imh0dHA6Ly9saW51eC15b2N0b183
LjIuYmIiIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmxpbnV4LXlvY3RvXzcuMi5i
YjwvYT7CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCB8IDc4ICsr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKzxicj4NCsKgbWV0YS9yZWNpcGVzLWtlcm5lbC9wb3dlcnRvcC9w
b3dlcnRvcC8wMDAxLXdha2V1cF94eHguaC1pbmNsdWRlLWxpbWl0cy5oLnBhdGNowqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgfCA1NSArKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrPGJyPg0KwqBtZXRh
L3JlY2lwZXMta2VybmVsL3Bvd2VydG9wL3s8YSBocmVmPSJodHRwOi8vcG93ZXJ0b3BfMi4xNi5i
YiIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+cG93ZXJ0b3BfMi4xNi5iYjwvYT4g
PSZndDsgPGEgaHJlZj0iaHR0cDovL3Bvd2VydG9wXzIuMTUuYmIiIHJlbD0ibm9yZWZlcnJlciIg
dGFyZ2V0PSJfYmxhbmsiPnBvd2VydG9wXzIuMTUuYmI8L2E+fcKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfCAxNCArKysr
KysrLS0tLS0tLTxicj4NCsKgbWV0YS9yZWNpcGVzLXN1cHBvcnQvYm9vc3QvPGEgaHJlZj0iaHR0
cDovL2Jvb3N0LWJ1aWxkLW5hdGl2ZV8xLjkyLjAuYmIiIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0
PSJfYmxhbmsiPmJvb3N0LWJ1aWxkLW5hdGl2ZV8xLjkyLjAuYmI8L2E+wqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqB8wqAgMyArLS08YnI+DQrCoG1ldGEvcmVjaXBlcy1zdXBwb3J0L2Jvb3N0
L2Jvb3N0LWJ1aWxkL2FkZC1weXRob24tbnVtcHktaW5jbHVkZS1mZWF0dXJlLnBhdGNowqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB8IDc0IC0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tPGJyPg0KwqBtZXRhL3JlY2lwZXMtc3VwcG9ydC9ib29zdC9ib29zdC5pbmPC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCB8
wqAgOSArLS0tLS0tLS08YnI+DQrCoDY2IGZpbGVzIGNoYW5nZWQsIDQ0NiBpbnNlcnRpb25zKCsp
LCAzOTUgZGVsZXRpb25zKC0pPGJyPg0KPGJyPg0KwqBtZXRhLXlvY3RvOjxicj4NCsKgbWV0YS15
b2N0by1ic3AvcmVjaXBlcy1rZXJuZWwvbGludXgvbGludXgteW9jdG9fNi4xOC5iYmFwcGVuZCB8
IDIgKy08YnI+DQrCoDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigt
KTxicj4NCjxicj4NCi0tIDxicj4NCjIuNDMuMDxicj4NCjxicj4NCi09LT0tPS09LT0tPS09LT0t
PS09LT0tPGJyPg0KTGlua3M6IFlvdSByZWNlaXZlIGFsbCBtZXNzYWdlcyBzZW50IHRvIHRoaXMg
Z3JvdXAuPGJyPg0KVmlldy9SZXBseSBPbmxpbmUgKCMyNDM5MjQpOiA8YSBocmVmPSJodHRwczov
L2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvZy9vcGVuZW1iZWRkZWQtY29yZS9tZXNzYWdlLzI0Mzky
NCIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cHM6Ly9saXN0cy5vcGVuZW1i
ZWRkZWQub3JnL2cvb3BlbmVtYmVkZGVkLWNvcmUvbWVzc2FnZS8yNDM5MjQ8L2E+PGJyPg0KTXV0
ZSBUaGlzIFRvcGljOiA8YSBocmVmPSJodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvbXQv
MTIwODU5NzMxLzE5OTc5MTQiIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHBz
Oi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9tdC8xMjA4NTk3MzEvMTk5NzkxNDwvYT48YnI+DQpH
cm91cCBPd25lcjogPGEgaHJlZj0ibWFpbHRvOm9wZW5lbWJlZGRlZC1jb3JlJTJCb3duZXJAbGlz
dHMub3BlbmVtYmVkZGVkLm9yZyIgdGFyZ2V0PSJfYmxhbmsiPm9wZW5lbWJlZGRlZC1jb3JlK293
bmVyQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc8L2E+PGJyPg0KVW5zdWJzY3JpYmU6IDxhIGhyZWY9
Imh0dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9nL29wZW5lbWJlZGRlZC1jb3JlL3Vuc3Vi
IiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwczovL2xpc3RzLm9wZW5lbWJl
ZGRlZC5vcmcvZy9vcGVuZW1iZWRkZWQtY29yZS91bnN1YjwvYT4gWzxhIGhyZWY9Im1haWx0bzpy
YWoua2hlbUBnbWFpbC5jb20iIHRhcmdldD0iX2JsYW5rIj5yYWoua2hlbUBnbWFpbC5jb208L2E+
XTxicj4NCi09LT0tPS09LT0tPS09LT0tPS09LT0tPGJyPg0KPGJyPg0KPC9ibG9ja3F1b3RlPjwv
ZGl2Pg0KPC9ibG9ja3F1b3RlPjwvZGl2Pg0K
--00000000000098f9b7065995a415--

