Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E77F0CCD1BF
	for <webhook@archiver.kernel.org>; Tue, 28 Oct 2025 06:04:55 +0000 (UTC)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
 by mx.groups.io with SMTP id smtpd.web11.2405.1761631491945921304
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Oct 2025 23:04:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BmNezbZl;
 spf=pass (domain: gmail.com, ip: 209.85.128.172, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-785bf425f96so76741047b3.1
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Oct 2025 23:04:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761631491; x=1762236291; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LPMz+tpEP3yNwyQyI1XkSZgAoXxZB7NZVc3eI5Zn8+s=;
        b=BmNezbZl6RJxhzy6F16ir3iceIKCGH29YsyrEXmbPA+VDOZSdC053QORQTuBKAEquk
         FacSw82jVs/8iE4F9uNQqW70byPCXtijA+eC1/oU/7ZVAAEWsr0nlzQD94d8Abt4TBcL
         /3hg0J88Ab+o9CvL73oh8m5Hy2n2Klv8XAFZScvC0PIPvabiD5H/LtHhc5yMacAoAfNg
         SR5Cf+8J5hcVWqXTMI1hCzE3MIaLff795OrcZFIO42mv8wEGtW8y9StmjTIhoiD6+1l9
         Doxqvx+H60KFTg81Z3o6ONOLW1BYvqPRGKIjxCxNefcJqxRBB3Eo4YmElBO4P29Haaai
         uBTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761631491; x=1762236291;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LPMz+tpEP3yNwyQyI1XkSZgAoXxZB7NZVc3eI5Zn8+s=;
        b=UdEGt6/pkv8r+gr8JFxDl0KPRMGnvZ3FvkuH9TqL8B1UiOZPcL3aqBMS+8vy1dnl5q
         EtdQ2Hl9vw0C7jNiryywr60w2YBDb6+CP1VXJzAmOjdN+gfPuS4omu2hrHiA5h02gCkP
         FrsgE5+O5TxCGbPSNP8cyUZv191qHg7wHpF720jqyXpDMRF6WIRtWurSxRADGntMmLwx
         b+NcoODFGegOojeaXIZWTzYvwiz2jYcdrxSzCbxtlqWLfjc/uxg9tnlzScbrh/9Jfk5I
         N6Hk2M4L/2YNBCgwqStjYqw4eN/cFNhyxf5iqWIyBVtPvRCpKCYPp/lt6TpDBFMqFQ9b
         fHbA==
X-Gm-Message-State: AOJu0Ywp8+q51qLrAm9VL2mMHtyS/5wLCbYUHencAU+2gKTFN839nrK4
	7FPqaAEOfPiRIQkEt0yV5iqLX9x+X5hUiqpXyDSJbh11ZJto3tFWHuO9Ro4lV1KHceRX6WpOrpn
	dH77GIqoWr4pqqNI53zgCbc8IyI7d+3s=
X-Gm-Gg: ASbGncvhpPxkwH0e1f1PPX0rtWJDhQCwG9+OC6Q5sT8pzgjcGd3SBtAtvArx++3mbMk
	3uNQzPmHscP2R0F2kcJaS5bzDQM7OXwxqHuUln27HRvKBYFVlp767smdXci5rSu/bsHrJo/0c/l
	E80obxGXmAGZHvvFeEtZvg1hwM22kCBK/xcp/v/d6hc1oD/xeaUKRtXfTZvZSmSAii0WdeRBLSW
	nMckCQG+A4jJuB9pTxPdYHJNPD71ZDbhFLoRfd/qgVYWrfh20RiUQwgPgjRzBk2HfLY2bZQGCwu
	USpyvjM1HU/g21wKFd4CLM7MQq+vXBMYLmg4E6EFKafdv+eFHNNlh80s/k3p
X-Google-Smtp-Source: AGHT+IGWwd6+tuFv2atieN7SeFbQA3PZbCZTTVbr8IPa3GPiQn9aA7ThxnRUqCNs5Od2YzUiqgJAhC2ZqS4MzCDYHFA=
X-Received: by 2002:a05:690c:f93:b0:784:8ebe:cdd7 with SMTP id
 00721157ae682-7861915c7c6mr18663527b3.20.1761631490885; Mon, 27 Oct 2025
 23:04:50 -0700 (PDT)
MIME-Version: 1.0
References: <20251027084704.3219220-1-Deepesh.Varatharajan@windriver.com>
 <CAMKF1sqBvR+BmO2XLKK2=mOP-CLCtrijRPWCggMTO4=Z=ymPDw@mail.gmail.com> <bf0302f7-db8e-4ab9-acaf-332abc83e8d5@windriver.com>
In-Reply-To: <bf0302f7-db8e-4ab9-acaf-332abc83e8d5@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 27 Oct 2025 23:04:23 -0700
X-Gm-Features: AWmQ_blyUXYEGQvm2Cg3pS3hyYF8odp2mvzxHgo-Kxmj4JZgZRm04_D9oPlYU6k
Message-ID: <CAMKF1sqKo9p0+AK_KdwbSrnwrwf4GyzmLEmpQGvy3NCKJRuj-A@mail.gmail.com>
Subject: Re: [OE-core] [walnascar][PATCH] glibc: stable 2.41 branch updates
To: Deepesh Varatharajan <deepesh.varatharajan@windriver.com>
Cc: openembedded-core@lists.openembedded.org, Sundeep.Kokkonda@windriver.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Oct 2025 06:04:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225379

On Mon, Oct 27, 2025 at 9:05=E2=80=AFPM Deepesh Varatharajan
<deepesh.varatharajan@windriver.com> wrote:
>
>
> On 28-10-2025 00:43, Khem Raj wrote:
> > CAUTION: This email comes from a non Wind River email account!
> > Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
> >
> > On Mon, Oct 27, 2025 at 1:47=E2=80=AFAM Varatharajan, Deepesh via
> > lists.openembedded.org
> > <deepesh.varatharajan=3Dwindriver.com@lists.openembedded.org> wrote:
> >> From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
> >>
> >> git log --oneline e7c419a2957590fb657900fc92a89708f41abd9d..cf926cd7fb=
9500035be19bca90ba9c855dcfcf92
> >>
> >> cf926cd7fb (HEAD, origin/release/2.41/master) nss: Group merge does no=
t react to ERANGE during merge (bug 33361)
> >> 9867e44cdc AArch64: Fix SVE powf routine [BZ #33299]
> >> a52c9b75c7 Optimize __libc_tsd_* thread variable access
> >> ed4672abb5 i386: Add GLIBC_ABI_GNU_TLS version [BZ #33221]
> >> 7aa907241c i386: Also add GLIBC_ABI_GNU2_TLS version [BZ #33129]
> >> c1bec0b52d i386: Update ___tls_get_addr to preserve vector registers
> >> aa5dbd5332 elf: Preserve _rtld_global layout for the release branch
> >> 42f9c70ac2 elf: Test dlopen (NULL, RTLD_LAZY) from an ELF constructor
> >> 3f3b4fdd0b elf: Fix handling of symbol versions which hash to zero (bu=
g 29190)
> >> e2d9e9eb26 x86-64: Add GLIBC_ABI_DT_X86_64_PLT [BZ #33212]
> >> dd87fcda43 x86-64: Add GLIBC_ABI_GNU2_TLS version [BZ #33129]
> >> 85780b6055 elf: Compile _dl_debug_state separately (bug 33224)
> >> b05ce0de3d elf: Restore support for _r_debug interpositions and copy r=
elocations
> >> 9d6577fdff elf: Introduce _dl_debug_change_state
> >> 4a3e5f1e4c elf: Introduce separate _r_debug_array variable
> >> 940d821afb Use TLS initial-exec model for __libc_tsd_CTYPE_* thread va=
riables [BZ #33234]
> >> 5d8614b284 ctype: Fallback initialization of TLS using relocations (bu=
g 19341, bug 32483)
> >> f409ec073f Use proper extern declaration for _nl_C_LC_CTYPE_{class,tou=
pper,tolower}
> >> 330cd035df Remove <libc-tsd.h>
> >> c467918138 AArch64: Improve codegen SVE log1p helper
> >> 6db0f659c8 AArch64: Optimise SVE FP64 Hyperbolics
> >> 503f7a7d33 AArch64: Optimize SVE exp functions
> >> 307a8a4434 AArch64: Improve codegen in SVE log1p
> >> 2a0b52fdd6 AArch64: Optimize inverse trig functions
> >> 0bb6dad5af AArch64: Optimize algorithm in users of SVE expf helper
> >> daa4de5253 AArch64: Avoid memset ifunc in cpu-features.c [BZ #33112]
> >> 1502c248d5 nptl: Fix SYSCALL_CANCEL for return values larger than INT_=
MAX (BZ 33245)
> >> 513629b14d elf: Handle ld.so with LOAD segment gaps in _dl_find_object=
 (bug 31943)
> >> f48de98bce elf: Extract rtld_setup_phdr function from dl_main
> >> 62928cf7d8 elf: Do not add a copy of _dl_find_object to libc.so
> >> 373408c19f stdlib: resolve a double lock init issue after fork [BZ #32=
994]
> >>
> >> Testing Results:
> >>               Before     After    Diff
> >> PASS         5829       5837      +8
> >> XPASS        4          4          0
> >> FAIL         240        242       +2
> >> XFAIL        16         16         0
> >> UNSUPPORTED  161        161        0
> >>
> >> Testcases changes
> >>
> >> testcase-name                            before           after
> >> elf/check-dt-x86-64-plt(new)               -               PASS
> >> elf/check-gnu2-tls(new)                    -               PASS
> >> elf/tst-dlmopen4-nonpic(new)               -               PASS
> >> elf/tst-dlmopen4-pic(new)                  -               PASS
> >> elf/tst-dlopen-constructor-null(new)       -               PASS
> >> elf/tst-link-map-contiguous-ldso(new)      -               PASS
> >> elf/tst-link-map-contiguous-libc(new)      -               PASS
> >> elf/tst-tls23(new)                         -               PASS
> >> elf/tst-version-hash-zero(new)             -               PASS
> >> ctype/tst-ctype-tls-dlmopen(new)           -               FAIL
> >> ctype/tst-ctype-tls-dlopen-static(new)     -               FAIL
> >> elf/ifuncmain8                            PASS              -
> >>
> >> Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.co=
m>
> >> ---
> >>   meta/recipes-core/glibc/glibc-version.inc | 4 ++--
> >>   1 file changed, 2 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-=
core/glibc/glibc-version.inc
> >> index 881a9cce2c..b3a66f0a40 100644
> >> --- a/meta/recipes-core/glibc/glibc-version.inc
> >> +++ b/meta/recipes-core/glibc/glibc-version.inc
> >> @@ -1,7 +1,7 @@
> >>   SRCBRANCH ?=3D "release/2.41/master"
> >>   PV =3D "2.41+git"
> >> -SRCREV_glibc ?=3D "e7c419a2957590fb657900fc92a89708f41abd9d"
> >> -SRCREV_localedef ?=3D "fab74f31b3811df543e24b6de47efdf45b538abc"
> >> +SRCREV_glibc ?=3D "cf926cd7fb9500035be19bca90ba9c855dcfcf92"
> >> +SRCREV_localedef ?=3D "cba02c503d7c853a38ccfb83c57e343ca5ecd7e5"
> > What does localedef bump bring ? Do we need it ?
> We need to bump the version to include this commit:
> https://github.com/kraj/localedef/commit/cba02c503d7c853a38ccfb83c57e343c=
a5ecd7e5
>
> In glibc_2.41, they have backported the following commit, which is
> incoming via this stable branch updates.
> https://sourceware.org/git/?p=3Dglibc.git;a=3Dcommit;h=3Da894f04d877653be=
a1639fc9a4adf73bd9347bf4
>

ah that's right, I am good with this patch

> Without the corresponding fix from localedef, the following build error
> will occur:
>
> In file included from glibc/locale/programs/ld-monetary.c:33:
> glibc/locale/localeinfo.h:241:20: error: expected =E2=80=98=3D=E2=80=99, =
=E2=80=98,=E2=80=99, =E2=80=98;=E2=80=99, =E2=80=98asm=E2=80=99
> or =E2=80=98__attribute__=E2=80=99 before =E2=80=98attribute_tls_model_ie=
=E2=80=99
>    241 |   attribute_hidden attribute_tls_model_ie;
>        |                    ^~~~~~~~~~~~~~~~~~~~~~
> >
> >>   GLIBC_GIT_URI ?=3D "git://sourceware.org/git/glibc.git;protocol=3Dht=
tps"
> >>
> >> --
> >> 2.49.0
> >>
> >>
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >> Links: You receive all messages sent to this group.
> >> View/Reply Online (#225324): https://lists.openembedded.org/g/openembe=
dded-core/message/225324
> >> Mute This Topic: https://lists.openembedded.org/mt/115971173/1997914
> >> Group Owner: openembedded-core+owner@lists.openembedded.org
> >> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub =
[raj.khem@gmail.com]
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >>

