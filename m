Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7455ACA101F
	for <webhook@archiver.kernel.org>; Mon, 15 Sep 2025 05:12:14 +0000 (UTC)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
 by mx.groups.io with SMTP id smtpd.web10.25386.1757913120863484535
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Sep 2025 22:12:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Wl0UhbHP;
 spf=pass (domain: gmail.com, ip: 209.85.128.172, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-72267c05111so28012577b3.2
        for <openembedded-core@lists.openembedded.org>; Sun, 14 Sep 2025 22:12:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757913120; x=1758517920; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y8X+PFbD9Pc7pkBJ+jwNaTu/VJdh7CKLYdnAYbz0JQM=;
        b=Wl0UhbHPmn3S6SrT3YZvdjcqrGzxqiwTTywwybJ8X74MhqTb2TrkDJh5hQyYWNhC5A
         sRpRduyI6nY55DSDPDrnI7sw1ZjkXPIAKz8HtFrmieHM9sVhD0FOXIEwCDdaMJuUynPq
         HNwDakIxZDk9a0Lit4ksQ94x3WiDTXqKBohhy58NJJ5tGj6mT7lcWHWZzdFpmL+LnWbG
         axil7XpCpcANdZTiqx8jrAA+84pxb+NmIDj9CU0WYCbjNsURHcJgXLKBqjq2efnzAyBd
         6l4lIGsLzvh+TR6K3LBrj9t4YfHeQIPF16n4+3mlz1Kc5qvdJ6iEigzLfoRSCCMwteqW
         vdsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757913120; x=1758517920;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y8X+PFbD9Pc7pkBJ+jwNaTu/VJdh7CKLYdnAYbz0JQM=;
        b=eRPLpQXzcCePCyloV9gPZTzytRRtRySqKSLmK063h+jeeCz+BCFdYSu3BfKGT/xbA2
         LAbYK9Csch3nCfve1ZDwybTcOGspgucZh2Z8exEqCg//zvoJapn0R/l6PEbplsW01em+
         EfVELjohZSSMCf+rigkkGQnsq+KcDDYHpQ2NhZMPgWQwikWzwPhRTzHmcLA/umTU3u6p
         9BwzbvArvUHkWlVBaAyOW4eHwHOGZCaMYj0/MFXMeQACRLHYn2vfq3bt/py1j6Cug7td
         FyCktMWXa5VzJIRafl4jJGZ5psRXc6rZDUFcL0dq5z5juRhLOseVGNo5uomiOO4HsSTa
         AefA==
X-Gm-Message-State: AOJu0Yxc1Ax8flkJUt7Jw0Nrz5kxw8e11haloSxyg9QISZ/+1x3zK4AO
	O2LQOYfKIvTMtxL454mpD5pw0Ag3NLqjFVihES7wRQSPMrpJRy4A8t4cp5kN25/kdd1fxVRDu5R
	VBW7PyNLWz8eQzpvPR4ewripkDNMngIR1D0n0
X-Gm-Gg: ASbGncuynvRL2JlK0OokOZLsSQfr3CSEo7HjR5YoA3voSjgpA+ftUHWO7dVULDBVi73
	gN67SbvNCSPFwIRYYi9OyNQl3+neHql+WDcR9neBQLCQoF1qykyzlXuHIu7/4/KXULu1wHCg+X9
	pXWs2WI31dvtONAMj3QgwfvykWLO42s7S2O9Qu7nckE7fUPcxU1lNJZUyVUu2jbjFwsuxsDps1m
	Hh6zvvbFs2GsFks98jpZ3/KR/tLd4DjyZVM7U/h+KSHNh5Kmy0n4nM621Z8KO5yJVx4F+6apyvL
	EF60t+0Rqfm//7FpGr1OYQICQa+eBJYVhONhI8gKLBDHgYgrQccrn4r0nQ==
X-Google-Smtp-Source: AGHT+IH7tSZOju7vvlm1cSP7gT3AcuT7KIZj88Okxw6o7/DET7BD0K/C9pkkzJDGlvS0B2EL98Q8gHairREOAP7sTaM=
X-Received: by 2002:a05:690c:4b03:b0:72a:21d3:b8c0 with SMTP id
 00721157ae682-73063095b45mr99982317b3.17.1757913119843; Sun, 14 Sep 2025
 22:11:59 -0700 (PDT)
MIME-Version: 1.0
References: <20250911091325.35653-1-Deepesh.Varatharajan@windriver.com>
In-Reply-To: <20250911091325.35653-1-Deepesh.Varatharajan@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 14 Sep 2025 22:11:33 -0700
X-Gm-Features: Ac12FXxUcVWc-TnWL3Jnvgx22hcYlRCeTILnIz-RYq1aP4nfMi9io6q1E-Cc9ZQ
Message-ID: <CAMKF1srRKPDVDMkXTWPXjBxCTtkV4Eb4vtY=eo-xyZrahES4Jg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] binutils: stable 2.45 branch updates
To: deepesh.varatharajan@windriver.com
Cc: openembedded-core@lists.openembedded.org, Sundeep.Kokkonda@windriver.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Sep 2025 05:12:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223372

LGTM

On Thu, Sep 11, 2025 at 2:14=E2=80=AFAM Varatharajan, Deepesh via
lists.openembedded.org
<deepesh.varatharajan=3Dwindriver.com@lists.openembedded.org> wrote:
>
> From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
>
> Below commits on binutils-2.45 stable branch are updated.
>
> 316da476e61 visium MAX_MEM_FOR_RS_ALIGN_CODE
> b58f54a9bde strip: Don't treat fat IiR objects as plugin object
> a71a4df76e2 strip: Treat "default" output_target as unspecified
> 96114b5c147 strip: Don't check target_defaulted in input BFD
> 2b2e51a31ec libctf: link: rejig lazy opening to not need weak symbols
> ae8c1b4241a libctf: don't run tests requiring deduplicating linker unless=
 one is in use
> e54a1de9515 libctf: exclude always-emitted Solaris symbols from the symty=
petab
> 32830073ea0 libctf: get libctf-nobfd.ver from the right place with Solari=
s ld
> 404cb58a92f libctf: do not use mmap on Solaris 11
> 99f48156dd1 LoongArch: Fix symbol size after relaxation
> d45e8bff0b4 libiberty: sync with gcc
> b09f71c1c46 Re: resbin: don't pass NULL as printf %s arg
> 72d7cfff264 PR 33229 nds32 gas segfaults on gcc output
> 879eabba0fc Fix more unused variable warnings
> 29996106c19 Fix unused variable warnings
> 5541a7e7712 binutils: drop unused note_size, contents, old variables
> f4290b25097 bfd: drop unused elt_no
> 2a07e06e269 Re: Re-enable development on the 2.45 branch
> ad8cf343ab5 Re-enable development on the 2.45 branch
>
> Test Results:
>                                  Before  After  Diff
> No. of expected passes            315     317    +2
> No. of unexpected failures        1       1      0
> No. of untested testcases         1       1      0
> No. of unsupported tests          9       9      0
>
> 96114b5c147 strip: Don't check target_defaulted in input BFD
> The above commit adds the newly passing test cases.
>
> PASSed tests changes
> +PASS: binutils-all/x86-64/pr33230.obj ( --strip-debug)
> +PASS: binutils-all/x86-64/pr33230.obj (--input-target=3Ddefault --strip-=
debug)
>
> Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
> ---
>  meta/recipes-devtools/binutils/binutils-2.45.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-devtools/binutils/binutils-2.45.inc b/meta/reci=
pes-devtools/binutils/binutils-2.45.inc
> index c69b4298c8..9c82f65eca 100644
> --- a/meta/recipes-devtools/binutils/binutils-2.45.inc
> +++ b/meta/recipes-devtools/binutils/binutils-2.45.inc
> @@ -21,7 +21,7 @@ UPSTREAM_CHECK_GITTAGREGEX =3D "binutils-(?P<pver>\d+_(=
\d_?)*)"
>  CVE_STATUS[CVE-2025-7545] =3D "cpe-stable-backport: fix available in use=
d git hash"
>  CVE_STATUS[CVE-2025-7546] =3D "cpe-stable-backport: fix available in use=
d git hash"
>
> -SRCREV ?=3D "2bc7af1ff7732451b6a7b09462a815c3284f9613"
> +SRCREV ?=3D "2f028c6bb163a045db95439fb92e1dcbc919413c"
>  BINUTILS_GIT_URI ?=3D "git://sourceware.org/git/binutils-gdb.git;branch=
=3D${SRCBRANCH};protocol=3Dhttps"
>  SRC_URI =3D "\
>       ${BINUTILS_GIT_URI} \
> --
> 2.49.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#223265): https://lists.openembedded.org/g/openembedde=
d-core/message/223265
> Mute This Topic: https://lists.openembedded.org/mt/115184919/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

