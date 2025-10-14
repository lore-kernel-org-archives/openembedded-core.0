Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F19F6CCD184
	for <webhook@archiver.kernel.org>; Tue, 14 Oct 2025 22:57:07 +0000 (UTC)
Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
 by mx.groups.io with SMTP id smtpd.web10.2745.1760482621482944289
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Oct 2025 15:57:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XD6Cw/fc;
 spf=pass (domain: gmail.com, ip: 74.125.224.43, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-63cf0df1abbso4305867d50.2
        for <openembedded-core@lists.openembedded.org>; Tue, 14 Oct 2025 15:57:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760482620; x=1761087420; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bE7c0rMdBMYhLE999hB9Nfo03CacK4xN5NJIB+R9fmA=;
        b=XD6Cw/fclHPUgpe75PDFmpMTNaTrFB1Ax4MkaYuVSwuP9H7VHcvWnm79f4cKVcATcP
         qEuAbVspan7IBRnGh9Nw+s3ZlxmwXe8brKy+Fb/zjQe9tRBQzoUOrD5xJukMQ8voPm+q
         E6Q0j2Y9tTxnmoOYUZQZCbmlZ8lqWGMzGhXDxQdI66umxHxaHEjyB+yw3wn/W1a22ZuK
         SkE26izg1QjibBXYl70jCMUBex7FOZ9Tl6YEkslrBEBQyr+Hk0lPVhNKeLY5TdRfkmLJ
         oLB9oH8BwoLPFj2GQwyRWR3et/JtlEdUjCNL0cqlOlh0FSysQlEE1zkbkbsLd43bcgDl
         x8fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760482620; x=1761087420;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bE7c0rMdBMYhLE999hB9Nfo03CacK4xN5NJIB+R9fmA=;
        b=lBGWvk3mn+UDnBc8okPR1iki+ETjFh2Ln4N2OyjuHM2pXOj6SMqWZU8C1xTcy7aPqb
         hSGv9mGmVr5+xi/edXszUniv+lj3RRwtQc3gfvRW7/C44gbmeGJhotgTfXW4N/6oTepy
         Oo9UN9GvSNHLfQtc+j07iigYU2zXQXcIG96owpXgDX/Ku+cYopHaP0cUpF48t50/HYT2
         I5Yn4HXdIEmA7zai4M5Pies83FYf8oL/09IvrvG6U1S+TkweNoKyXNmqTEwJjqTjfYv8
         oCUtdiSW3EEvWdmxQHCxmfNV3+7ETN2s3dwvwmn9fput1BDRIajNVsKJTVTk75V2T9GP
         S+GQ==
X-Gm-Message-State: AOJu0YxObxlVGfFmbYEybXll0DHbjp5RNyLBhFSkSOTl6/GHRgmqObai
	RJK8dMHXdUlJGQYGTPT3u3CZPZo1SD3KCmrlFNrvoSJD5FaRmY5XjCB9VNpe2sMP11aviegXq7l
	HXVb3kohKh3jQ1B+zFrn3fwXoySIj00LOcNUc
X-Gm-Gg: ASbGncu3BZJbZjMMm1xH2tYSauHJRtY+aB8U2QtuDGWQhUUoOeT4JJmaOtzzbUWvyj3
	VHUcnqXnKeUFfuhrG1bUbYBl8AuPSOAPGiZEnCAYlhTvSR/7kXA7KziH9Ngyjro2fWL9xpU8hTm
	KEJtuYU8yicKMy5qD5e8W9OcGrLtTZ1uA9YfSZNQnAkjJwplNBeb1JpDhDJBvydS//rX+kbOkIC
	ENeINE4e+2JGGZNPn2nyjO0uTIM/NTvj48ewOI4lXsrx71/9uCAdJ8U+Wgz+Fis2DFWjXzjZXIt
	/nu8un120Ctt0TB025BEZ/scyQeG6u9QtJxD
X-Google-Smtp-Source: AGHT+IEaIj7sbNQs3jdWYpbeAQKhB6Jiar2jZTimqFdb8cNFzxI+NxJfrC2YWcHbBkIIk96Ver+59dnvW34jBOQ4mSY=
X-Received: by 2002:a05:690e:6cd:b0:63c:f5a6:f2e6 with SMTP id
 956f58d0204a3-63cf5a70bdcmr9728266d50.56.1760482619089; Tue, 14 Oct 2025
 15:56:59 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1760481775.git.steve@sakoman.com> <9881dd70305b87945e9649d744bcbc40a1a7b780.1760481775.git.steve@sakoman.com>
In-Reply-To: <9881dd70305b87945e9649d744bcbc40a1a7b780.1760481775.git.steve@sakoman.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 14 Oct 2025 15:56:31 -0700
X-Gm-Features: AS18NWB97BuYW4Y-gJPP1Bnj5HwgG0N1WLiYcs5M-COy50y9XE2xtw6HoGiISto
Message-ID: <CAMKF1sohg3Bf3h2NBdcFdrCebPqOuVq-OUwku556Hfp6p--Gbg@mail.gmail.com>
Subject: Re: [OE-core][kirkstone 04/14] glibc: Remove partial BZ#25847
 backport patches
To: steve@sakoman.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Oct 2025 22:57:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224869

are these backports being done in glibc 2.35 release as well ?

On Tue, Oct 14, 2025 at 3:45=E2=80=AFPM Steve Sakoman via
lists.openembedded.org <steve=3Dsakoman.com@lists.openembedded.org>
wrote:
>
> From: Sunil Dora <sunilkumar.dora@windriver.com>
>
> To facilitate a clean backport of the full 10-commit series
> addressing the pthread condition variable lost wakeup issue
> (BZ#25847) in glibc 2.35, remove the existing 8 patches that
> were applied as a partial backport.
>
> The previous partial backport excluded commit:
> c36fc50781995e6758cae2b6927839d0157f213c ("nptl: Remove
> g_refs from condition variables") based on guidance from
> glibc maintainer Florian Weimer(#comment #74)
>
> This exclusion was recommended for stable branches to
> avoid altering the layout of pthread_cond_t, which could
> introduce ABI incompatibilities. Additionally, the dependent
> commit dbc5a50d12eff4cb3f782129029d04b8a76f58e7 was not needed
> in the partial backport.
>
> To align with upstream mainline, per maintainer Carlos O'Donell
> (comment #75), apply the complete 10-commit series for consistency.
>
> By removing these patches first, we ensure the subsequent
> application of the full 10 commits results in cleaner, more
> reviewable changes without intermixed conflicts or overlaps.
>
> Removed patches and corresponding upstream commits:
> - 0026-PR25847-1.patch: 1db84775f831a1494993ce9c118deaf9537cc50a
> - 0026-PR25847-2.patch: 0cc973160c23bb67f895bc887dd6942d29f8fee3
> - 0026-PR25847-3.patch: b42cc6af11062c260c7dfa91f1c89891366fed3e
> - 0026-PR25847-4.patch: 4f7b051f8ee3feff1b53b27a906f245afaa9cee1
> - 0026-PR25847-5.patch: 929a4764ac90382616b6a21f099192b2475da674
> - 0026-PR25847-6.patch: ee6c14ed59d480720721aaacc5fb03213dc153da
> - 0026-PR25847-7.patch: 4b79e27a5073c02f6bff9aa8f4791230a0ab1867
> - 0026-PR25847-8.patch: 91bb902f58264a2fd50fbce8f39a9a290dd23706
>
> Bug reference: https://sourceware.org/bugzilla/show_bug.cgi?id=3D25847
> This change prepares the branch for the full backport in follow-up commit=
s.
>
> Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
> Signed-off-by: Steve Sakoman <steve@sakoman.com>
> ---
>  .../glibc/glibc/0026-PR25847-1.patch          | 455 ------------------
>  .../glibc/glibc/0026-PR25847-2.patch          | 144 ------
>  .../glibc/glibc/0026-PR25847-3.patch          |  77 ---
>  .../glibc/glibc/0026-PR25847-4.patch          | 117 -----
>  .../glibc/glibc/0026-PR25847-5.patch          | 105 ----
>  .../glibc/glibc/0026-PR25847-6.patch          | 169 -------
>  .../glibc/glibc/0026-PR25847-7.patch          | 160 ------
>  .../glibc/glibc/0026-PR25847-8.patch          | 192 --------
>  meta/recipes-core/glibc/glibc_2.35.bb         |   8 -
>  9 files changed, 1427 deletions(-)
>  delete mode 100644 meta/recipes-core/glibc/glibc/0026-PR25847-1.patch
>  delete mode 100644 meta/recipes-core/glibc/glibc/0026-PR25847-2.patch
>  delete mode 100644 meta/recipes-core/glibc/glibc/0026-PR25847-3.patch
>  delete mode 100644 meta/recipes-core/glibc/glibc/0026-PR25847-4.patch
>  delete mode 100644 meta/recipes-core/glibc/glibc/0026-PR25847-5.patch
>  delete mode 100644 meta/recipes-core/glibc/glibc/0026-PR25847-6.patch
>  delete mode 100644 meta/recipes-core/glibc/glibc/0026-PR25847-7.patch
>  delete mode 100644 meta/recipes-core/glibc/glibc/0026-PR25847-8.patch
>
> diff --git a/meta/recipes-core/glibc/glibc/0026-PR25847-1.patch b/meta/re=
cipes-core/glibc/glibc/0026-PR25847-1.patch
> deleted file mode 100644
> index 44a2b6772c..0000000000
> --- a/meta/recipes-core/glibc/glibc/0026-PR25847-1.patch
> +++ /dev/null
> @@ -1,455 +0,0 @@
> -From 31d9848830e496f57d4182b518467c4c63bfd4bd Mon Sep 17 00:00:00 2001
> -From: Frank Barrus <frankbarrus_sw@shaggy.cc>
> -Date: Mon, 16 Jun 2025 22:37:54 -0700
> -Subject: [PATCH] pthreads NPTL: lost wakeup fix 2
> -
> -This fixes the lost wakeup (from a bug in signal stealing) with a change
> -in the usage of g_signals[] in the condition variable internal state.
> -It also completely eliminates the concept and handling of signal stealin=
g,
> -as well as the need for signalers to block to wait for waiters to wake
> -up every time there is a G1/G2 switch.  This greatly reduces the average
> -and maximum latency for pthread_cond_signal.
> -
> -The g_signals[] field now contains a signal count that is relative to
> -the current g1_start value.  Since it is a 32-bit field, and the LSB is
> -still reserved (though not currently used anymore), it has a 31-bit valu=
e
> -that corresponds to the low 31 bits of the sequence number in g1_start.
> -(since g1_start also has an LSB flag, this means bits 31:1 in g_signals
> -correspond to bits 31:1 in g1_start, plus the current signal count)
> -
> -By making the signal count relative to g1_start, there is no longer
> -any ambiguity or A/B/A issue, and thus any checks before blocking,
> -including the futex call itself, are guaranteed not to block if the G1/G=
2
> -switch occurs, even if the signal count remains the same.  This allows
> -initially safely blocking in G2 until the switch to G1 occurs, and
> -then transitioning from G1 to a new G1 or G2, and always being able to
> -distinguish the state change.  This removes the race condition and A/B/A
> -problems that otherwise ocurred if a late (pre-empted) waiter were to
> -resume just as the futex call attempted to block on g_signal since
> -otherwise there was no last opportunity to re-check things like whether
> -the current G1 group was already closed.
> -
> -By fixing these issues, the signal stealing code can be eliminated,
> -since there is no concept of signal stealing anymore.  The code to block
> -for all waiters to exit g_refs can also be removed, since any waiters
> -that are still in the g_refs region can be guaranteed to safely wake
> -up and exit.  If there are still any left at this time, they are all
> -sent one final futex wakeup to ensure that they are not blocked any
> -longer, but there is no need for the signaller to block and wait for
> -them to wake up and exit the g_refs region.
> -
> -The signal count is then effectively "zeroed" but since it is now
> -relative to g1_start, this is done by advancing it to a new value that
> -can be observed by any pending blocking waiters.  Any late waiters can
> -always tell the difference, and can thus just cleanly exit if they are
> -in a stale G1 or G2.  They can never steal a signal from the current
> -G1 if they are not in the current G1, since the signal value that has
> -to match in the cmpxchg has the low 31 bits of the g1_start value
> -contained in it, and that's first checked, and then it won't match if
> -there's a G1/G2 change.
> -
> -Note: the 31-bit sequence number used in g_signals is designed to
> -handle wrap-around when checking the signal count, but if the entire
> -31-bit wraparound (2 billion signals) occurs while there is still a
> -late waiter that has not yet resumed, and it happens to then match
> -the current g1_start low bits, and the pre-emption occurs after the
> -normal "closed group" checks (which are 64-bit) but then hits the
> -futex syscall and signal consuming code, then an A/B/A issue could
> -still result and cause an incorrect assumption about whether it
> -should block.  This particular scenario seems unlikely in practice.
> -Note that once awake from the futex, the waiter would notice the
> -closed group before consuming the signal (since that's still a 64-bit
> -check that would not be aliased in the wrap-around in g_signals),
> -so the biggest impact would be blocking on the futex until the next
> -full wakeup from a G1/G2 switch.
> -
> -The following commits have been cherry-picked from Glibc master branch:
> -Bug : https://sourceware.org/bugzilla/show_bug.cgi?id=3D25847
> -
> -Upstream-Status: Backport
> -[https://sourceware.org/git/?p=3Dglibc.git;a=3Dcommit;h=3D1db84775f831a1=
494993ce9c118deaf9537cc50a]
> -
> -Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
> ----
> - nptl/pthread_cond_common.c | 106 +++++++++------------------
> - nptl/pthread_cond_wait.c   | 144 ++++++++++++-------------------------
> - 2 files changed, 81 insertions(+), 169 deletions(-)
> -
> -diff --git a/nptl/pthread_cond_common.c b/nptl/pthread_cond_common.c
> -index fb035f72c3..8dd7037923 100644
> ---- a/nptl/pthread_cond_common.c
> -+++ b/nptl/pthread_cond_common.c
> -@@ -201,7 +201,6 @@ static bool __attribute__ ((unused))
> - __condvar_quiesce_and_switch_g1 (pthread_cond_t *cond, uint64_t wseq,
> -     unsigned int *g1index, int private)
> - {
> --  const unsigned int maxspin =3D 0;
> -   unsigned int g1 =3D *g1index;
> -
> -   /* If there is no waiter in G2, we don't do anything.  The expression=
 may
> -@@ -222,85 +221,46 @@ __condvar_quiesce_and_switch_g1 (pthread_cond_t *c=
ond, uint64_t wseq,
> -      * New waiters arriving concurrently with the group switching will =
all go
> -        into G2 until we atomically make the switch.  Waiters existing i=
n G2
> -        are not affected.
> --     * Waiters in G1 will be closed out immediately by setting a flag i=
n
> --       __g_signals, which will prevent waiters from blocking using a fu=
tex on
> --       __g_signals and also notifies them that the group is closed.  As=
 a
> --       result, they will eventually remove their group reference, allow=
ing us
> --       to close switch group roles.  */
> --
> --  /* First, set the closed flag on __g_signals.  This tells waiters tha=
t are
> --     about to wait that they shouldn't do that anymore.  This basically
> --     serves as an advance notificaton of the upcoming change to __g1_st=
art;
> --     waiters interpret it as if __g1_start was larger than their waiter
> --     sequence position.  This allows us to change __g1_start after wait=
ing
> --     for all existing waiters with group references to leave, which in =
turn
> --     makes recovery after stealing a signal simpler because it then can=
 be
> --     skipped if __g1_start indicates that the group is closed (otherwis=
e,
> --     we would have to recover always because waiters don't know how big=
 their
> --     groups are).  Relaxed MO is fine.  */
> --  atomic_fetch_or_relaxed (cond->__data.__g_signals + g1, 1);
> --
> --  /* Wait until there are no group references anymore.  The fetch-or op=
eration
> --     injects us into the modification order of __g_refs; release MO ens=
ures
> --     that waiters incrementing __g_refs after our fetch-or see the prev=
ious
> --     changes to __g_signals and to __g1_start that had to happen before=
 we can
> --     switch this G1 and alias with an older group (we have two groups, =
so
> --     aliasing requires switching group roles twice).  Note that nobody =
else
> --     can have set the wake-request flag, so we do not have to act upon =
it.
> --
> --     Also note that it is harmless if older waiters or waiters from thi=
s G1
> --     get a group reference after we have quiesced the group because it =
will
> --     remain closed for them either because of the closed flag in __g_si=
gnals
> --     or the later update to __g1_start.  New waiters will never arrive =
here
> --     but instead continue to go into the still current G2.  */
> --  unsigned r =3D atomic_fetch_or_release (cond->__data.__g_refs + g1, 0=
);
> --  while ((r >> 1) > 0)
> --    {
> --      for (unsigned int spin =3D maxspin; ((r >> 1) > 0) && (spin > 0);=
 spin--)
> --      {
> --        /* TODO Back off.  */
> --        r =3D atomic_load_relaxed (cond->__data.__g_refs + g1);
> --      }
> --      if ((r >> 1) > 0)
> --      {
> --        /* There is still a waiter after spinning.  Set the wake-reques=
t
> --           flag and block.  Relaxed MO is fine because this is just abo=
ut
> --           this futex word.
> --
> --           Update r to include the set wake-request flag so that the up=
coming
> --           futex_wait only blocks if the flag is still set (otherwise, =
we'd
> --           violate the basic client-side futex protocol).  */
> --        r =3D atomic_fetch_or_relaxed (cond->__data.__g_refs + g1, 1) |=
 1;
> --
> --        if ((r >> 1) > 0)
> --          futex_wait_simple (cond->__data.__g_refs + g1, r, private);
> --        /* Reload here so we eventually see the most recent value even =
if we
> --           do not spin.   */
> --        r =3D atomic_load_relaxed (cond->__data.__g_refs + g1);
> --      }
> --    }
> --  /* Acquire MO so that we synchronize with the release operation that =
waiters
> --     use to decrement __g_refs and thus happen after the waiters we wai=
ted
> --     for.  */
> --  atomic_thread_fence_acquire ();
> -+     * Waiters in G1 will be closed out immediately by the advancing of
> -+       __g_signals to the next "lowseq" (low 31 bits of the new g1_star=
t),
> -+       which will prevent waiters from blocking using a futex on
> -+       __g_signals since it provides enough signals for all possible
> -+       remaining waiters.  As a result, they can each consume a signal
> -+       and they will eventually remove their group reference.  */
> -
> -   /* Update __g1_start, which finishes closing this group.  The value w=
e add
> -      will never be negative because old_orig_size can only be zero when=
 we
> -      switch groups the first time after a condvar was initialized, in w=
hich
> --     case G1 will be at index 1 and we will add a value of 1.  See abov=
e for
> --     why this takes place after waiting for quiescence of the group.
> -+     case G1 will be at index 1 and we will add a value of 1.
> -      Relaxed MO is fine because the change comes with no additional
> -      constraints that others would have to observe.  */
> -   __condvar_add_g1_start_relaxed (cond,
> -       (old_orig_size << 1) + (g1 =3D=3D 1 ? 1 : - 1));
> -
> --  /* Now reopen the group, thus enabling waiters to again block using t=
he
> --     futex controlled by __g_signals.  Release MO so that observers tha=
t see
> --     no signals (and thus can block) also see the write __g1_start and =
thus
> --     that this is now a new group (see __pthread_cond_wait_common for t=
he
> --     matching acquire MO loads).  */
> --  atomic_store_release (cond->__data.__g_signals + g1, 0);
> --
> -+  unsigned int lowseq =3D ((old_g1_start + old_orig_size) << 1) & ~1U;
> -+
> -+  /* If any waiters still hold group references (and thus could be bloc=
ked),
> -+     then wake them all up now and prevent any running ones from blocki=
ng.
> -+     This is effectively a catch-all for any possible current or future
> -+     bugs that can allow the group size to reach 0 before all G1 waiter=
s
> -+     have been awakened or at least given signals to consume, or any
> -+     other case that can leave blocked (or about to block) older waiter=
s..  */
> -+  if ((atomic_fetch_or_release (cond->__data.__g_refs + g1, 0) >> 1) > =
0)
> -+   {
> -+    /* First advance signals to the end of the group (i.e. enough signa=
ls
> -+       for the entire G1 group) to ensure that waiters which have not
> -+       yet blocked in the futex will not block.
> -+       Note that in the vast majority of cases, this should never
> -+       actually be necessary, since __g_signals will have enough
> -+       signals for the remaining g_refs waiters.  As an optimization,
> -+       we could check this first before proceeding, although that
> -+       could still leave the potential for futex lost wakeup bugs
> -+       if the signal count was non-zero but the futex wakeup
> -+       was somehow lost.  */
> -+    atomic_store_release (cond->__data.__g_signals + g1, lowseq);
> -+
> -+    futex_wake (cond->__data.__g_signals + g1, INT_MAX, private);
> -+   }
> -   /* At this point, the old G1 is now a valid new G2 (but not in use ye=
t).
> -      No old waiter can neither grab a signal nor acquire a reference wi=
thout
> -      noticing that __g1_start is larger.
> -@@ -311,6 +271,10 @@ __condvar_quiesce_and_switch_g1 (pthread_cond_t *co=
nd, uint64_t wseq,
> -   g1 ^=3D 1;
> -   *g1index ^=3D 1;
> -
> -+  /* Now advance the new G1 g_signals to the new lowseq, giving it
> -+     an effective signal count of 0 to start.  */
> -+  atomic_store_release (cond->__data.__g_signals + g1, lowseq);
> -+
> -   /* These values are just observed by signalers, and thus protected by=
 the
> -      lock.  */
> -   unsigned int orig_size =3D wseq - (old_g1_start + old_orig_size);
> -diff --git a/nptl/pthread_cond_wait.c b/nptl/pthread_cond_wait.c
> -index 20c348a503..1cb3dbf7b0 100644
> ---- a/nptl/pthread_cond_wait.c
> -+++ b/nptl/pthread_cond_wait.c
> -@@ -238,9 +238,7 @@ __condvar_cleanup_waiting (void *arg)
> -    signaled), and a reference count.
> -
> -    The group reference count is used to maintain the number of waiters =
that
> --   are using the group's futex.  Before a group can change its role, th=
e
> --   reference count must show that no waiters are using the futex anymor=
e; this
> --   prevents ABA issues on the futex word.
> -+   are using the group's futex.
> -
> -    To represent which intervals in the waiter sequence the groups cover=
 (and
> -    thus also which group slot contains G1 or G2), we use a 64b counter =
to
> -@@ -300,11 +298,12 @@ __condvar_cleanup_waiting (void *arg)
> -        last reference.
> -      * Reference count used by waiters concurrently with signalers that=
 have
> -        acquired the condvar-internal lock.
> --   __g_signals: The number of signals that can still be consumed.
> -+   __g_signals: The number of signals that can still be consumed, relat=
ive to
> -+     the current g1_start.  (i.e. bits 31 to 1 of __g_signals are bits
> -+     31 to 1 of g1_start with the signal count added)
> -      * Used as a futex word by waiters.  Used concurrently by waiters a=
nd
> -        signalers.
> --     * LSB is true iff this group has been completely signaled (i.e., i=
t is
> --       closed).
> -+     * LSB is currently reserved and 0.
> -    __g_size: Waiters remaining in this group (i.e., which have not been
> -      signaled yet.
> -      * Accessed by signalers and waiters that cancel waiting (both do s=
o only
> -@@ -328,18 +327,6 @@ __condvar_cleanup_waiting (void *arg)
> -    sufficient because if a waiter can see a sufficiently large value, i=
t could
> -    have also consume a signal in the waiters group.
> -
> --   Waiters try to grab a signal from __g_signals without holding a refe=
rence
> --   count, which can lead to stealing a signal from a more recent group =
after
> --   their own group was already closed.  They cannot always detect wheth=
er they
> --   in fact did because they do not know when they stole, but they can
> --   conservatively add a signal back to the group they stole from; if th=
ey
> --   did so unnecessarily, all that happens is a spurious wake-up.  To ma=
ke this
> --   even less likely, __g1_start contains the index of the current g2 to=
o,
> --   which allows waiters to check if there aliasing on the group slots; =
if
> --   there wasn't, they didn't steal from the current G1, which means tha=
t the
> --   G1 they stole from must have been already closed and they do not nee=
d to
> --   fix anything.
> --
> -    It is essential that the last field in pthread_cond_t is __g_signals=
[1]:
> -    The previous condvar used a pointer-sized field in pthread_cond_t, s=
o a
> -    PTHREAD_COND_INITIALIZER from that condvar implementation might only
> -@@ -435,6 +422,9 @@ __pthread_cond_wait_common (pthread_cond_t *cond, pt=
hread_mutex_t *mutex,
> -     {
> -       while (1)
> -       {
> -+          uint64_t g1_start =3D __condvar_load_g1_start_relaxed (cond);
> -+          unsigned int lowseq =3D (g1_start & 1) =3D=3D g ? signals : g=
1_start & ~1U;
> -+
> -         /* Spin-wait first.
> -            Note that spinning first without checking whether a timeout
> -            passed might lead to what looks like a spurious wake-up even
> -@@ -446,35 +436,45 @@ __pthread_cond_wait_common (pthread_cond_t *cond, =
pthread_mutex_t *mutex,
> -            having to compare against the current time seems to be the r=
ight
> -            choice from a performance perspective for most use cases.  *=
/
> -         unsigned int spin =3D maxspin;
> --        while (signals =3D=3D 0 && spin > 0)
> -+        while (spin > 0 && ((int)(signals - lowseq) < 2))
> -           {
> -             /* Check that we are not spinning on a group that's already
> -                closed.  */
> --            if (seq < (__condvar_load_g1_start_relaxed (cond) >> 1))
> --              goto done;
> -+            if (seq < (g1_start >> 1))
> -+              break;
> -
> -             /* TODO Back off.  */
> -
> -             /* Reload signals.  See above for MO.  */
> -             signals =3D atomic_load_acquire (cond->__data.__g_signals +=
 g);
> -+              g1_start =3D __condvar_load_g1_start_relaxed (cond);
> -+              lowseq =3D (g1_start & 1) =3D=3D g ? signals : g1_start &=
 ~1U;
> -             spin--;
> -           }
> -
> --        /* If our group will be closed as indicated by the flag on sign=
als,
> --           don't bother grabbing a signal.  */
> --        if (signals & 1)
> --          goto done;
> --
> --        /* If there is an available signal, don't block.  */
> --        if (signals !=3D 0)
> -+          if (seq < (g1_start >> 1))
> -+          {
> -+              /* If the group is closed already,
> -+               then this waiter originally had enough extra signals to
> -+               consume, up until the time its group was closed.  */
> -+             goto done;
> -+            }
> -+
> -+        /* If there is an available signal, don't block.
> -+             If __g1_start has advanced at all, then we must be in G1
> -+           by now, perhaps in the process of switching back to an older
> -+           G2, but in either case we're allowed to consume the availabl=
e
> -+           signal and should not block anymore.  */
> -+        if ((int)(signals - lowseq) >=3D 2)
> -           break;
> -
> -         /* No signals available after spinning, so prepare to block.
> -            We first acquire a group reference and use acquire MO for th=
at so
> -            that we synchronize with the dummy read-modify-write in
> -            __condvar_quiesce_and_switch_g1 if we read from that.  In tu=
rn,
> --           in this case this will make us see the closed flag on __g_si=
gnals
> --           that designates a concurrent attempt to reuse the group's sl=
ot.
> -+           in this case this will make us see the advancement of __g_si=
gnals
> -+           to the upcoming new g1_start that occurs with a concurrent
> -+           attempt to reuse the group's slot.
> -            We use acquire MO for the __g_signals check to make the
> -            __g1_start check work (see spinning above).
> -            Note that the group reference acquisition will not mask the
> -@@ -482,15 +482,24 @@ __pthread_cond_wait_common (pthread_cond_t *cond, =
pthread_mutex_t *mutex,
> -            an atomic read-modify-write operation and thus extend the re=
lease
> -            sequence.  */
> -         atomic_fetch_add_acquire (cond->__data.__g_refs + g, 2);
> --        if (((atomic_load_acquire (cond->__data.__g_signals + g) & 1) !=
=3D 0)
> --            || (seq < (__condvar_load_g1_start_relaxed (cond) >> 1)))
> -+        signals =3D atomic_load_acquire (cond->__data.__g_signals + g);
> -+          g1_start =3D __condvar_load_g1_start_relaxed (cond);
> -+          lowseq =3D (g1_start & 1) =3D=3D g ? signals : g1_start & ~1U=
;
> -+
> -+          if (seq < (g1_start >> 1))
> -           {
> --            /* Our group is closed.  Wake up any signalers that might b=
e
> --               waiting.  */
> -+              /* group is closed already, so don't block */
> -             __condvar_dec_grefs (cond, g, private);
> -             goto done;
> -           }
> -
> -+        if ((int)(signals - lowseq) >=3D 2)
> -+          {
> -+            /* a signal showed up or G1/G2 switched after we grabbed th=
e refcount */
> -+            __condvar_dec_grefs (cond, g, private);
> -+            break;
> -+            }
> -+
> -         // Now block.
> -         struct _pthread_cleanup_buffer buffer;
> -         struct _condvar_cleanup_buffer cbuffer;
> -@@ -501,7 +510,7 @@ __pthread_cond_wait_common (pthread_cond_t *cond, pt=
hread_mutex_t *mutex,
> -         __pthread_cleanup_push (&buffer, __condvar_cleanup_waiting, &cb=
uffer);
> -
> -         err =3D __futex_abstimed_wait_cancelable64 (
> --          cond->__data.__g_signals + g, 0, clockid, abstime, private);
> -+          cond->__data.__g_signals + g, signals, clockid, abstime, priv=
ate);
> -
> -         __pthread_cleanup_pop (&buffer, 0);
> -
> -@@ -524,6 +533,8 @@ __pthread_cond_wait_common (pthread_cond_t *cond, pt=
hread_mutex_t *mutex,
> -         signals =3D atomic_load_acquire (cond->__data.__g_signals + g);
> -       }
> -
> -+       if (seq < (__condvar_load_g1_start_relaxed (cond) >> 1))
> -+       goto done;
> -     }
> -   /* Try to grab a signal.  Use acquire MO so that we see an up-to-date=
 value
> -      of __g1_start below (see spinning above for a similar case).  In
> -@@ -532,69 +543,6 @@ __pthread_cond_wait_common (pthread_cond_t *cond, p=
thread_mutex_t *mutex,
> -   while (!atomic_compare_exchange_weak_acquire (cond->__data.__g_signal=
s + g,
> -                                               &signals, signals - 2));
> -
> --  /* We consumed a signal but we could have consumed from a more recent=
 group
> --     that aliased with ours due to being in the same group slot.  If th=
is
> --     might be the case our group must be closed as visible through
> --     __g1_start.  */
> --  uint64_t g1_start =3D __condvar_load_g1_start_relaxed (cond);
> --  if (seq < (g1_start >> 1))
> --    {
> --      /* We potentially stole a signal from a more recent group but we =
do not
> --       know which group we really consumed from.
> --       We do not care about groups older than current G1 because they a=
re
> --       closed; we could have stolen from these, but then we just add a
> --       spurious wake-up for the current groups.
> --       We will never steal a signal from current G2 that was really int=
ended
> --       for G2 because G2 never receives signals (until it becomes G1). =
 We
> --       could have stolen a signal from G2 that was conservatively added=
 by a
> --       previous waiter that also thought it stole a signal -- but given=
 that
> --       that signal was added unnecessarily, it's not a problem if we st=
eal
> --       it.
> --       Thus, the remaining case is that we could have stolen from the c=
urrent
> --       G1, where "current" means the __g1_start value we observed.  How=
ever,
> --       if the current G1 does not have the same slot index as we do, we=
 did
> --       not steal from it and do not need to undo that.  This is the rea=
son
> --       for putting a bit with G2's index into__g1_start as well.  */
> --      if (((g1_start & 1) ^ 1) =3D=3D g)
> --      {
> --        /* We have to conservatively undo our potential mistake of stea=
ling
> --           a signal.  We can stop trying to do that when the current G1
> --           changes because other spinning waiters will notice this too =
and
> --           __condvar_quiesce_and_switch_g1 has checked that there are n=
o
> --           futex waiters anymore before switching G1.
> --           Relaxed MO is fine for the __g1_start load because we need t=
o
> --           merely be able to observe this fact and not have to observe
> --           something else as well.
> --           ??? Would it help to spin for a little while to see whether =
the
> --           current G1 gets closed?  This might be worthwhile if the gro=
up is
> --           small or close to being closed.  */
> --        unsigned int s =3D atomic_load_relaxed (cond->__data.__g_signal=
s + g);
> --        while (__condvar_load_g1_start_relaxed (cond) =3D=3D g1_start)
> --          {
> --            /* Try to add a signal.  We don't need to acquire the lock
> --               because at worst we can cause a spurious wake-up.  If th=
e
> --               group is in the process of being closed (LSB is true), t=
his
> --               has an effect similar to us adding a signal.  */
> --            if (((s & 1) !=3D 0)
> --                || atomic_compare_exchange_weak_relaxed
> --                     (cond->__data.__g_signals + g, &s, s + 2))
> --              {
> --                /* If we added a signal, we also need to add a wake-up =
on
> --                   the futex.  We also need to do that if we skipped ad=
ding
> --                   a signal because the group is being closed because
> --                   while __condvar_quiesce_and_switch_g1 could have clo=
sed
> --                   the group, it might stil be waiting for futex waiter=
s to
> --                   leave (and one of those waiters might be the one we =
stole
> --                   the signal from, which cause it to block using the
> --                   futex).  */
> --                futex_wake (cond->__data.__g_signals + g, 1, private);
> --                break;
> --              }
> --            /* TODO Back off.  */
> --          }
> --      }
> --    }
> --
> -  done:
> -
> -   /* Confirm that we have been woken.  We do that before acquiring the =
mutex
> ---
> -2.49.0
> -
> diff --git a/meta/recipes-core/glibc/glibc/0026-PR25847-2.patch b/meta/re=
cipes-core/glibc/glibc/0026-PR25847-2.patch
> deleted file mode 100644
> index cb89431769..0000000000
> --- a/meta/recipes-core/glibc/glibc/0026-PR25847-2.patch
> +++ /dev/null
> @@ -1,144 +0,0 @@
> -From 6aab1191e35a3da66e8c49d95178a9d77c119a1f Mon Sep 17 00:00:00 2001
> -From: Malte Skarupke <malteskarupke@fastmail.fm>
> -Date: Mon, 16 Jun 2025 23:17:53 -0700
> -Subject: [PATCH] nptl: Update comments and indentation for new condvar
> - implementation
> -
> -Some comments were wrong after the most recent commit. This fixes that.
> -Also fixing indentation where it was using spaces instead of tabs.
> -
> -The following commits have been cherry-picked from Glibc master branch:
> -Bug : https://sourceware.org/bugzilla/show_bug.cgi?id=3D25847
> -
> -Upstream-Status: Backport
> -[https://sourceware.org/git/?p=3Dglibc.git;a=3Dcommit;h=3D0cc973160c23bb=
67f895bc887dd6942d29f8fee3]
> -
> -Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
> ----
> - nptl/pthread_cond_common.c |  5 +++--
> - nptl/pthread_cond_wait.c   | 39 +++++++++++++++++++-------------------
> - 2 files changed, 22 insertions(+), 22 deletions(-)
> -
> -diff --git a/nptl/pthread_cond_common.c b/nptl/pthread_cond_common.c
> -index 8dd7037923..306a207dd6 100644
> ---- a/nptl/pthread_cond_common.c
> -+++ b/nptl/pthread_cond_common.c
> -@@ -221,8 +221,9 @@ __condvar_quiesce_and_switch_g1 (pthread_cond_t *con=
d, uint64_t wseq,
> -      * New waiters arriving concurrently with the group switching will =
all go
> -        into G2 until we atomically make the switch.  Waiters existing i=
n G2
> -        are not affected.
> --     * Waiters in G1 will be closed out immediately by the advancing of
> --       __g_signals to the next "lowseq" (low 31 bits of the new g1_star=
t),
> -+     * Waiters in G1 have already received a signal and been woken. If =
they
> -+       haven't woken yet, they will be closed out immediately by the ad=
vancing
> -+       of __g_signals to the next "lowseq" (low 31 bits of the new g1_s=
tart),
> -        which will prevent waiters from blocking using a futex on
> -        __g_signals since it provides enough signals for all possible
> -        remaining waiters.  As a result, they can each consume a signal
> -diff --git a/nptl/pthread_cond_wait.c b/nptl/pthread_cond_wait.c
> -index 1cb3dbf7b0..cee1968756 100644
> ---- a/nptl/pthread_cond_wait.c
> -+++ b/nptl/pthread_cond_wait.c
> -@@ -249,7 +249,7 @@ __condvar_cleanup_waiting (void *arg)
> -    figure out whether they are in a group that has already been complet=
ely
> -    signaled (i.e., if the current G1 starts at a later position that th=
e
> -    waiter's position).  Waiters cannot determine whether they are curre=
ntly
> --   in G2 or G1 -- but they do not have too because all they are interes=
ted in
> -+   in G2 or G1 -- but they do not have to because all they are interest=
ed in
> -    is whether there are available signals, and they always start in G2 =
(whose
> -    group slot they know because of the bit in the waiter sequence.  Sig=
nalers
> -    will simply fill the right group until it is completely signaled and=
 can
> -@@ -412,7 +412,7 @@ __pthread_cond_wait_common (pthread_cond_t *cond, pt=
hread_mutex_t *mutex,
> -     }
> -
> -   /* Now wait until a signal is available in our group or it is closed.
> --     Acquire MO so that if we observe a value of zero written after gro=
up
> -+     Acquire MO so that if we observe (signals =3D=3D lowseq) after gro=
up
> -      switching in __condvar_quiesce_and_switch_g1, we synchronize with =
that
> -      store and will see the prior update of __g1_start done while switc=
hing
> -      groups too.  */
> -@@ -422,8 +422,8 @@ __pthread_cond_wait_common (pthread_cond_t *cond, pt=
hread_mutex_t *mutex,
> -     {
> -       while (1)
> -       {
> --          uint64_t g1_start =3D __condvar_load_g1_start_relaxed (cond);
> --          unsigned int lowseq =3D (g1_start & 1) =3D=3D g ? signals : g=
1_start & ~1U;
> -+        uint64_t g1_start =3D __condvar_load_g1_start_relaxed (cond);
> -+        unsigned int lowseq =3D (g1_start & 1) =3D=3D g ? signals : g1_=
start & ~1U;
> -
> -         /* Spin-wait first.
> -            Note that spinning first without checking whether a timeout
> -@@ -447,21 +447,21 @@ __pthread_cond_wait_common (pthread_cond_t *cond, =
pthread_mutex_t *mutex,
> -
> -             /* Reload signals.  See above for MO.  */
> -             signals =3D atomic_load_acquire (cond->__data.__g_signals +=
 g);
> --              g1_start =3D __condvar_load_g1_start_relaxed (cond);
> --              lowseq =3D (g1_start & 1) =3D=3D g ? signals : g1_start &=
 ~1U;
> -+            g1_start =3D __condvar_load_g1_start_relaxed (cond);
> -+            lowseq =3D (g1_start & 1) =3D=3D g ? signals : g1_start & ~=
1U;
> -             spin--;
> -           }
> -
> --          if (seq < (g1_start >> 1))
> -+        if (seq < (g1_start >> 1))
> -           {
> --              /* If the group is closed already,
> -+            /* If the group is closed already,
> -                then this waiter originally had enough extra signals to
> -                consume, up until the time its group was closed.  */
> -              goto done;
> --            }
> -+          }
> -
> -         /* If there is an available signal, don't block.
> --             If __g1_start has advanced at all, then we must be in G1
> -+           If __g1_start has advanced at all, then we must be in G1
> -            by now, perhaps in the process of switching back to an older
> -            G2, but in either case we're allowed to consume the availabl=
e
> -            signal and should not block anymore.  */
> -@@ -483,22 +483,23 @@ __pthread_cond_wait_common (pthread_cond_t *cond, =
pthread_mutex_t *mutex,
> -            sequence.  */
> -         atomic_fetch_add_acquire (cond->__data.__g_refs + g, 2);
> -         signals =3D atomic_load_acquire (cond->__data.__g_signals + g);
> --          g1_start =3D __condvar_load_g1_start_relaxed (cond);
> --          lowseq =3D (g1_start & 1) =3D=3D g ? signals : g1_start & ~1U=
;
> -+        g1_start =3D __condvar_load_g1_start_relaxed (cond);
> -+        lowseq =3D (g1_start & 1) =3D=3D g ? signals : g1_start & ~1U;
> -
> --          if (seq < (g1_start >> 1))
> -+        if (seq < (g1_start >> 1))
> -           {
> --              /* group is closed already, so don't block */
> -+            /* group is closed already, so don't block */
> -             __condvar_dec_grefs (cond, g, private);
> -             goto done;
> -           }
> -
> -         if ((int)(signals - lowseq) >=3D 2)
> -           {
> --            /* a signal showed up or G1/G2 switched after we grabbed th=
e refcount */
> -+            /* a signal showed up or G1/G2 switched after we grabbed th=
e
> -+               refcount */
> -             __condvar_dec_grefs (cond, g, private);
> -             break;
> --            }
> -+          }
> -
> -         // Now block.
> -         struct _pthread_cleanup_buffer buffer;
> -@@ -536,10 +537,8 @@ __pthread_cond_wait_common (pthread_cond_t *cond, p=
thread_mutex_t *mutex,
> -        if (seq < (__condvar_load_g1_start_relaxed (cond) >> 1))
> -        goto done;
> -     }
> --  /* Try to grab a signal.  Use acquire MO so that we see an up-to-date=
 value
> --     of __g1_start below (see spinning above for a similar case).  In
> --     particular, if we steal from a more recent group, we will also see=
 a
> --     more recent __g1_start below.  */
> -+  /* Try to grab a signal.  See above for MO.  (if we do another loop
> -+     iteration we need to see the correct value of g1_start)  */
> -   while (!atomic_compare_exchange_weak_acquire (cond->__data.__g_signal=
s + g,
> -                                               &signals, signals - 2));
> -
> ---
> -2.49.0
> -
> diff --git a/meta/recipes-core/glibc/glibc/0026-PR25847-3.patch b/meta/re=
cipes-core/glibc/glibc/0026-PR25847-3.patch
> deleted file mode 100644
> index 4cfcca846c..0000000000
> --- a/meta/recipes-core/glibc/glibc/0026-PR25847-3.patch
> +++ /dev/null
> @@ -1,77 +0,0 @@
> -From 28a5082045429fdc5a4744d45fdc5b5202528eaa Mon Sep 17 00:00:00 2001
> -From: Malte Skarupke <malteskarupke@fastmail.fm>
> -Date: Mon, 16 Jun 2025 23:29:49 -0700
> -Subject: [PATCH] nptl: Remove unnecessary catch-all-wake in condvar grou=
p
> - switch
> -
> -This wake is unnecessary. We only switch groups after every sleeper in a=
 group
> -has been woken. Sure, they may take a while to actually wake up and may =
still
> -hold a reference, but waking them a second time doesn't speed that up. I=
nstead
> -this just makes the code more complicated and may hide problems.
> -
> -In particular this safety wake wouldn't even have helped with the bug th=
at was
> -fixed by Barrus' patch: The bug there was that pthread_cond_signal would=
 not
> -switch g1 when it should, so we wouldn't even have entered this code pat=
h.
> -
> -The following commits have been cherry-picked from Glibc master branch:
> -Bug : https://sourceware.org/bugzilla/show_bug.cgi?id=3D25847
> -
> -Upstream-Status: Backport
> -[https://sourceware.org/git/?p=3Dglibc.git;a=3Dcommit;h=3Db42cc6af11062c=
260c7dfa91f1c89891366fed3e]
> -
> -Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
> ----
> - nptl/pthread_cond_common.c | 30 +-----------------------------
> - 1 file changed, 1 insertion(+), 29 deletions(-)
> -
> -diff --git a/nptl/pthread_cond_common.c b/nptl/pthread_cond_common.c
> -index 306a207dd6..f976a533a1 100644
> ---- a/nptl/pthread_cond_common.c
> -+++ b/nptl/pthread_cond_common.c
> -@@ -221,13 +221,7 @@ __condvar_quiesce_and_switch_g1 (pthread_cond_t *co=
nd, uint64_t wseq,
> -      * New waiters arriving concurrently with the group switching will =
all go
> -        into G2 until we atomically make the switch.  Waiters existing i=
n G2
> -        are not affected.
> --     * Waiters in G1 have already received a signal and been woken. If =
they
> --       haven't woken yet, they will be closed out immediately by the ad=
vancing
> --       of __g_signals to the next "lowseq" (low 31 bits of the new g1_s=
tart),
> --       which will prevent waiters from blocking using a futex on
> --       __g_signals since it provides enough signals for all possible
> --       remaining waiters.  As a result, they can each consume a signal
> --       and they will eventually remove their group reference.  */
> -+     * Waiters in G1 have already received a signal and been woken.  */
> -
> -   /* Update __g1_start, which finishes closing this group.  The value w=
e add
> -      will never be negative because old_orig_size can only be zero when=
 we
> -@@ -240,28 +234,6 @@ __condvar_quiesce_and_switch_g1 (pthread_cond_t *co=
nd, uint64_t wseq,
> -
> -   unsigned int lowseq =3D ((old_g1_start + old_orig_size) << 1) & ~1U;
> -
> --  /* If any waiters still hold group references (and thus could be bloc=
ked),
> --     then wake them all up now and prevent any running ones from blocki=
ng.
> --     This is effectively a catch-all for any possible current or future
> --     bugs that can allow the group size to reach 0 before all G1 waiter=
s
> --     have been awakened or at least given signals to consume, or any
> --     other case that can leave blocked (or about to block) older waiter=
s..  */
> --  if ((atomic_fetch_or_release (cond->__data.__g_refs + g1, 0) >> 1) > =
0)
> --   {
> --    /* First advance signals to the end of the group (i.e. enough signa=
ls
> --       for the entire G1 group) to ensure that waiters which have not
> --       yet blocked in the futex will not block.
> --       Note that in the vast majority of cases, this should never
> --       actually be necessary, since __g_signals will have enough
> --       signals for the remaining g_refs waiters.  As an optimization,
> --       we could check this first before proceeding, although that
> --       could still leave the potential for futex lost wakeup bugs
> --       if the signal count was non-zero but the futex wakeup
> --       was somehow lost.  */
> --    atomic_store_release (cond->__data.__g_signals + g1, lowseq);
> --
> --    futex_wake (cond->__data.__g_signals + g1, INT_MAX, private);
> --   }
> -   /* At this point, the old G1 is now a valid new G2 (but not in use ye=
t).
> -      No old waiter can neither grab a signal nor acquire a reference wi=
thout
> -      noticing that __g1_start is larger.
> ---
> -2.49.0
> -
> diff --git a/meta/recipes-core/glibc/glibc/0026-PR25847-4.patch b/meta/re=
cipes-core/glibc/glibc/0026-PR25847-4.patch
> deleted file mode 100644
> index f8674d62ae..0000000000
> --- a/meta/recipes-core/glibc/glibc/0026-PR25847-4.patch
> +++ /dev/null
> @@ -1,117 +0,0 @@
> -From 16b9af737c77b153fca4f36cbdbe94f7416c0b42 Mon Sep 17 00:00:00 2001
> -From: Malte Skarupke <malteskarupke@fastmail.fm>
> -Date: Mon, 16 Jun 2025 23:38:40 -0700
> -Subject: [PATCH] nptl: Remove unnecessary quadruple check in pthread_con=
d_wait
> -
> -pthread_cond_wait was checking whether it was in a closed group no less =
than
> -four times. Checking once is enough. Here are the four checks:
> -
> -1. While spin-waiting. This was dead code: maxspin is set to 0 and has b=
een
> -   for years.
> -2. Before deciding to go to sleep, and before incrementing grefs: I kept=
 this
> -3. After incrementing grefs. There is no reason to think that the group =
would
> -   close while we do an atomic increment. Obviously it could close at an=
y
> -   point, but that doesn't mean we have to recheck after every step. Thi=
s
> -   check was equally good as check 2, except it has to do more work.
> -4. When we find ourselves in a group that has a signal. We only get here=
 after
> -   we check that we're not in a closed group. There is no need to check =
again.
> -   The check would only have helped in cases where the compare_exchange =
in the
> -   next line would also have failed. Relying on the compare_exchange is =
fine.
> -
> -Removing the duplicate checks clarifies the code.
> -
> -The following commits have been cherry-picked from Glibc master branch:
> -Bug : https://sourceware.org/bugzilla/show_bug.cgi?id=3D25847
> -
> -Upstream-Status: Backport
> -[https://sourceware.org/git/?p=3Dglibc.git;a=3Dcommit;h=3D4f7b051f8ee3fe=
ff1b53b27a906f245afaa9cee1]
> -
> -Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
> ----
> - nptl/pthread_cond_wait.c | 49 ----------------------------------------
> - 1 file changed, 49 deletions(-)
> -
> -diff --git a/nptl/pthread_cond_wait.c b/nptl/pthread_cond_wait.c
> -index cee1968756..47e834cade 100644
> ---- a/nptl/pthread_cond_wait.c
> -+++ b/nptl/pthread_cond_wait.c
> -@@ -366,7 +366,6 @@ static __always_inline int
> - __pthread_cond_wait_common (pthread_cond_t *cond, pthread_mutex_t *mute=
x,
> -     clockid_t clockid, const struct __timespec64 *abstime)
> - {
> --  const int maxspin =3D 0;
> -   int err;
> -   int result =3D 0;
> -
> -@@ -425,33 +424,6 @@ __pthread_cond_wait_common (pthread_cond_t *cond, p=
thread_mutex_t *mutex,
> -         uint64_t g1_start =3D __condvar_load_g1_start_relaxed (cond);
> -         unsigned int lowseq =3D (g1_start & 1) =3D=3D g ? signals : g1_=
start & ~1U;
> -
> --        /* Spin-wait first.
> --           Note that spinning first without checking whether a timeout
> --           passed might lead to what looks like a spurious wake-up even
> --           though we should return ETIMEDOUT (e.g., if the caller provi=
des
> --           an absolute timeout that is clearly in the past).  However,
> --           (1) spurious wake-ups are allowed, (2) it seems unlikely tha=
t a
> --           user will (ab)use pthread_cond_wait as a check for whether a
> --           point in time is in the past, and (3) spinning first without
> --           having to compare against the current time seems to be the r=
ight
> --           choice from a performance perspective for most use cases.  *=
/
> --        unsigned int spin =3D maxspin;
> --        while (spin > 0 && ((int)(signals - lowseq) < 2))
> --          {
> --            /* Check that we are not spinning on a group that's already
> --               closed.  */
> --            if (seq < (g1_start >> 1))
> --              break;
> --
> --            /* TODO Back off.  */
> --
> --            /* Reload signals.  See above for MO.  */
> --            signals =3D atomic_load_acquire (cond->__data.__g_signals +=
 g);
> --            g1_start =3D __condvar_load_g1_start_relaxed (cond);
> --            lowseq =3D (g1_start & 1) =3D=3D g ? signals : g1_start & ~=
1U;
> --            spin--;
> --          }
> --
> -         if (seq < (g1_start >> 1))
> -           {
> -             /* If the group is closed already,
> -@@ -482,24 +454,6 @@ __pthread_cond_wait_common (pthread_cond_t *cond, p=
thread_mutex_t *mutex,
> -            an atomic read-modify-write operation and thus extend the re=
lease
> -            sequence.  */
> -         atomic_fetch_add_acquire (cond->__data.__g_refs + g, 2);
> --        signals =3D atomic_load_acquire (cond->__data.__g_signals + g);
> --        g1_start =3D __condvar_load_g1_start_relaxed (cond);
> --        lowseq =3D (g1_start & 1) =3D=3D g ? signals : g1_start & ~1U;
> --
> --        if (seq < (g1_start >> 1))
> --          {
> --            /* group is closed already, so don't block */
> --            __condvar_dec_grefs (cond, g, private);
> --            goto done;
> --          }
> --
> --        if ((int)(signals - lowseq) >=3D 2)
> --          {
> --            /* a signal showed up or G1/G2 switched after we grabbed th=
e
> --               refcount */
> --            __condvar_dec_grefs (cond, g, private);
> --            break;
> --          }
> -
> -         // Now block.
> -         struct _pthread_cleanup_buffer buffer;
> -@@ -533,9 +487,6 @@ __pthread_cond_wait_common (pthread_cond_t *cond, pt=
hread_mutex_t *mutex,
> -         /* Reload signals.  See above for MO.  */
> -         signals =3D atomic_load_acquire (cond->__data.__g_signals + g);
> -       }
> --
> --       if (seq < (__condvar_load_g1_start_relaxed (cond) >> 1))
> --       goto done;
> -     }
> -   /* Try to grab a signal.  See above for MO.  (if we do another loop
> -      iteration we need to see the correct value of g1_start)  */
> ---
> -2.49.0
> -
> diff --git a/meta/recipes-core/glibc/glibc/0026-PR25847-5.patch b/meta/re=
cipes-core/glibc/glibc/0026-PR25847-5.patch
> deleted file mode 100644
> index 16fe6f8460..0000000000
> --- a/meta/recipes-core/glibc/glibc/0026-PR25847-5.patch
> +++ /dev/null
> @@ -1,105 +0,0 @@
> -From d9ffb50dc55f77e584a5d0275eea758c7a6b04e3 Mon Sep 17 00:00:00 2001
> -From: Malte Skarupke <malteskarupke@fastmail.fm>
> -Date: Mon, 16 Jun 2025 23:53:35 -0700
> -Subject: [PATCH] nptl: Use a single loop in pthread_cond_wait instaed of=
 a
> - nested loop
> -
> -The loop was a little more complicated than necessary. There was only on=
e
> -break statement out of the inner loop, and the outer loop was nearly emp=
ty.
> -So just remove the outer loop, moving its code to the one break statemen=
t in
> -the inner loop. This allows us to replace all gotos with break statement=
s.
> -
> -The following commits have been cherry-picked from Glibc master branch:
> -Bug : https://sourceware.org/bugzilla/show_bug.cgi?id=3D25847
> -
> -Upstream-Status: Backport
> -[https://sourceware.org/git/?p=3Dglibc.git;a=3Dcommit;h=3D929a4764ac9038=
2616b6a21f099192b2475da674]
> -
> -Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
> ----
> - nptl/pthread_cond_wait.c | 41 +++++++++++++++++++---------------------
> - 1 file changed, 19 insertions(+), 22 deletions(-)
> -
> -diff --git a/nptl/pthread_cond_wait.c b/nptl/pthread_cond_wait.c
> -index 47e834cade..5c86880105 100644
> ---- a/nptl/pthread_cond_wait.c
> -+++ b/nptl/pthread_cond_wait.c
> -@@ -410,17 +410,15 @@ __pthread_cond_wait_common (pthread_cond_t *cond, =
pthread_mutex_t *mutex,
> -       return err;
> -     }
> -
> --  /* Now wait until a signal is available in our group or it is closed.
> --     Acquire MO so that if we observe (signals =3D=3D lowseq) after gro=
up
> --     switching in __condvar_quiesce_and_switch_g1, we synchronize with =
that
> --     store and will see the prior update of __g1_start done while switc=
hing
> --     groups too.  */
> --  unsigned int signals =3D atomic_load_acquire (cond->__data.__g_signal=
s + g);
> --
> --  do
> --    {
> -+
> -       while (1)
> -       {
> -+        /* Now wait until a signal is available in our group or it is c=
losed.
> -+           Acquire MO so that if we observe (signals =3D=3D lowseq) aft=
er group
> -+           switching in __condvar_quiesce_and_switch_g1, we synchronize=
 with that
> -+           store and will see the prior update of __g1_start done while=
 switching
> -+           groups too.  */
> -+        unsigned int signals =3D atomic_load_acquire (cond->__data.__g_=
signals + g);
> -         uint64_t g1_start =3D __condvar_load_g1_start_relaxed (cond);
> -         unsigned int lowseq =3D (g1_start & 1) =3D=3D g ? signals : g1_=
start & ~1U;
> -
> -@@ -429,7 +427,7 @@ __pthread_cond_wait_common (pthread_cond_t *cond, pt=
hread_mutex_t *mutex,
> -             /* If the group is closed already,
> -                then this waiter originally had enough extra signals to
> -                consume, up until the time its group was closed.  */
> --             goto done;
> -+             break;
> -           }
> -
> -         /* If there is an available signal, don't block.
> -@@ -438,8 +436,16 @@ __pthread_cond_wait_common (pthread_cond_t *cond, p=
thread_mutex_t *mutex,
> -            G2, but in either case we're allowed to consume the availabl=
e
> -            signal and should not block anymore.  */
> -         if ((int)(signals - lowseq) >=3D 2)
> --          break;
> --
> -+           {
> -+             /* Try to grab a signal.  See above for MO.  (if we do ano=
ther loop
> -+                iteration we need to see the correct value of g1_start)=
  */
> -+                     if (atomic_compare_exchange_weak_acquire (
> -+                               cond->__data.__g_signals + g,
> -+                       &signals, signals - 2))
> -+                       break;
> -+                     else
> -+                       continue;
> -+           }
> -         /* No signals available after spinning, so prepare to block.
> -            We first acquire a group reference and use acquire MO for th=
at so
> -            that we synchronize with the dummy read-modify-write in
> -@@ -479,21 +485,12 @@ __pthread_cond_wait_common (pthread_cond_t *cond, =
pthread_mutex_t *mutex,
> -                the lock during cancellation is not possible.  */
> -             __condvar_cancel_waiting (cond, seq, g, private);
> -             result =3D err;
> --            goto done;
> -+            break;
> -           }
> -         else
> -           __condvar_dec_grefs (cond, g, private);
> -
> --        /* Reload signals.  See above for MO.  */
> --        signals =3D atomic_load_acquire (cond->__data.__g_signals + g);
> -       }
> --    }
> --  /* Try to grab a signal.  See above for MO.  (if we do another loop
> --     iteration we need to see the correct value of g1_start)  */
> --  while (!atomic_compare_exchange_weak_acquire (cond->__data.__g_signal=
s + g,
> --                                              &signals, signals - 2));
> --
> -- done:
> -
> -   /* Confirm that we have been woken.  We do that before acquiring the =
mutex
> -      to allow for execution of pthread_cond_destroy while having acquir=
ed the
> ---
> -2.49.0
> -
> diff --git a/meta/recipes-core/glibc/glibc/0026-PR25847-6.patch b/meta/re=
cipes-core/glibc/glibc/0026-PR25847-6.patch
> deleted file mode 100644
> index cf87e21ddd..0000000000
> --- a/meta/recipes-core/glibc/glibc/0026-PR25847-6.patch
> +++ /dev/null
> @@ -1,169 +0,0 @@
> -From a2faee6d0dac6e5232255da9afda4d9ed6cfb6e5 Mon Sep 17 00:00:00 2001
> -From: Malte Skarupke <malteskarupke@fastmail.fm>
> -Date: Tue, 17 Jun 2025 01:37:12 -0700
> -Subject: [PATCH] nptl: Fix indentation
> -
> -In my previous change I turned a nested loop into a simple loop. I'm doi=
ng
> -the resulting indentation changes in a separate commit to make the diff =
on
> -the previous commit easier to review.
> -
> -The following commits have been cherry-picked from Glibc master branch:
> -Bug : https://sourceware.org/bugzilla/show_bug.cgi?id=3D25847
> -
> -Upstream-Status: Backport
> -[https://sourceware.org/git/?p=3Dglibc.git;a=3Dcommit;h=3Dee6c14ed59d480=
720721aaacc5fb03213dc153da]
> -
> -Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
> ----
> - nptl/pthread_cond_wait.c | 132 ++++++++++++++++-----------------------
> - 1 file changed, 54 insertions(+), 78 deletions(-)
> -
> -diff --git a/nptl/pthread_cond_wait.c b/nptl/pthread_cond_wait.c
> -index 5c86880105..104ebd48ca 100644
> ---- a/nptl/pthread_cond_wait.c
> -+++ b/nptl/pthread_cond_wait.c
> -@@ -410,87 +410,63 @@ __pthread_cond_wait_common (pthread_cond_t *cond, =
pthread_mutex_t *mutex,
> -       return err;
> -     }
> -
> --
> --      while (1)
> --      {
> --        /* Now wait until a signal is available in our group or it is c=
losed.
> --           Acquire MO so that if we observe (signals =3D=3D lowseq) aft=
er group
> --           switching in __condvar_quiesce_and_switch_g1, we synchronize=
 with that
> --           store and will see the prior update of __g1_start done while=
 switching
> --           groups too.  */
> --        unsigned int signals =3D atomic_load_acquire (cond->__data.__g_=
signals + g);
> --        uint64_t g1_start =3D __condvar_load_g1_start_relaxed (cond);
> --        unsigned int lowseq =3D (g1_start & 1) =3D=3D g ? signals : g1_=
start & ~1U;
> --
> --        if (seq < (g1_start >> 1))
> --          {
> --            /* If the group is closed already,
> --               then this waiter originally had enough extra signals to
> --               consume, up until the time its group was closed.  */
> --             break;
> --          }
> --
> --        /* If there is an available signal, don't block.
> --           If __g1_start has advanced at all, then we must be in G1
> --           by now, perhaps in the process of switching back to an older
> --           G2, but in either case we're allowed to consume the availabl=
e
> --           signal and should not block anymore.  */
> --        if ((int)(signals - lowseq) >=3D 2)
> --           {
> --             /* Try to grab a signal.  See above for MO.  (if we do ano=
ther loop
> --                iteration we need to see the correct value of g1_start)=
  */
> --                     if (atomic_compare_exchange_weak_acquire (
> --                               cond->__data.__g_signals + g,
> -+  while (1)
> -+    {
> -+      /* Now wait until a signal is available in our group or it is clo=
sed.
> -+         Acquire MO so that if we observe (signals =3D=3D lowseq) after=
 group
> -+         switching in __condvar_quiesce_and_switch_g1, we synchronize w=
ith that
> -+         store and will see the prior update of __g1_start done while s=
witching
> -+         groups too.  */
> -+      unsigned int signals =3D atomic_load_acquire (cond->__data.__g_si=
gnals + g);
> -+      uint64_t g1_start =3D __condvar_load_g1_start_relaxed (cond);
> -+      unsigned int lowseq =3D (g1_start & 1) =3D=3D g ? signals : g1_st=
art & ~1U;
> -+
> -+      if (seq < (g1_start >> 1))
> -+        {
> -+          /* If the group is closed already,
> -+             then this waiter originally had enough extra signals to
> -+             consume, up until the time its group was closed.  */
> -+           break;
> -+        }
> -+
> -+      /* If there is an available signal, don't block.
> -+         If __g1_start has advanced at all, then we must be in G1
> -+         by now, perhaps in the process of switching back to an older
> -+         G2, but in either case we're allowed to consume the available
> -+         signal and should not block anymore.  */
> -+      if ((int)(signals - lowseq) >=3D 2)
> -+        {
> -+         /* Try to grab a signal.  See above for MO.  (if we do another=
 loop
> -+            iteration we need to see the correct value of g1_start)  */
> -+           if (atomic_compare_exchange_weak_acquire (
> -+                       cond->__data.__g_signals + g,
> -                        &signals, signals - 2))
> --                       break;
> --                     else
> --                       continue;
> --           }
> --        /* No signals available after spinning, so prepare to block.
> --           We first acquire a group reference and use acquire MO for th=
at so
> --           that we synchronize with the dummy read-modify-write in
> --           __condvar_quiesce_and_switch_g1 if we read from that.  In tu=
rn,
> --           in this case this will make us see the advancement of __g_si=
gnals
> --           to the upcoming new g1_start that occurs with a concurrent
> --           attempt to reuse the group's slot.
> --           We use acquire MO for the __g_signals check to make the
> --           __g1_start check work (see spinning above).
> --           Note that the group reference acquisition will not mask the
> --           release MO when decrementing the reference count because we =
use
> --           an atomic read-modify-write operation and thus extend the re=
lease
> --           sequence.  */
> --        atomic_fetch_add_acquire (cond->__data.__g_refs + g, 2);
> --
> --        // Now block.
> --        struct _pthread_cleanup_buffer buffer;
> --        struct _condvar_cleanup_buffer cbuffer;
> --        cbuffer.wseq =3D wseq;
> --        cbuffer.cond =3D cond;
> --        cbuffer.mutex =3D mutex;
> --        cbuffer.private =3D private;
> --        __pthread_cleanup_push (&buffer, __condvar_cleanup_waiting, &cb=
uffer);
> --
> --        err =3D __futex_abstimed_wait_cancelable64 (
> --          cond->__data.__g_signals + g, signals, clockid, abstime, priv=
ate);
> --
> --        __pthread_cleanup_pop (&buffer, 0);
> --
> --        if (__glibc_unlikely (err =3D=3D ETIMEDOUT || err =3D=3D EOVERF=
LOW))
> --          {
> --            __condvar_dec_grefs (cond, g, private);
> --            /* If we timed out, we effectively cancel waiting.  Note th=
at
> --               we have decremented __g_refs before cancellation, so tha=
t a
> --               deadlock between waiting for quiescence of our group in
> --               __condvar_quiesce_and_switch_g1 and us trying to acquire
> --               the lock during cancellation is not possible.  */
> --            __condvar_cancel_waiting (cond, seq, g, private);
> --            result =3D err;
> -             break;
> --          }
> --        else
> --          __condvar_dec_grefs (cond, g, private);
> --
> -+         else
> -+            continue;
> -       }
> -+      // Now block.
> -+      struct _pthread_cleanup_buffer buffer;
> -+      struct _condvar_cleanup_buffer cbuffer;
> -+      cbuffer.wseq =3D wseq;
> -+      cbuffer.cond =3D cond;
> -+      cbuffer.mutex =3D mutex;
> -+      cbuffer.private =3D private;
> -+      __pthread_cleanup_push (&buffer, __condvar_cleanup_waiting, &cbuf=
fer);
> -+
> -+      err =3D __futex_abstimed_wait_cancelable64 (
> -+        cond->__data.__g_signals + g, signals, clockid, abstime, privat=
e);
> -+
> -+      __pthread_cleanup_pop (&buffer, 0);
> -+
> -+      if (__glibc_unlikely (err =3D=3D ETIMEDOUT || err =3D=3D EOVERFLO=
W))
> -+        {
> -+          /* If we timed out, we effectively cancel waiting.  */
> -+          __condvar_cancel_waiting (cond, seq, g, private);
> -+          result =3D err;
> -+          break;
> -+        }
> -+    }
> -
> -   /* Confirm that we have been woken.  We do that before acquiring the =
mutex
> -      to allow for execution of pthread_cond_destroy while having acquir=
ed the
> ---
> -2.49.0
> -
> diff --git a/meta/recipes-core/glibc/glibc/0026-PR25847-7.patch b/meta/re=
cipes-core/glibc/glibc/0026-PR25847-7.patch
> deleted file mode 100644
> index a9e9cc7c48..0000000000
> --- a/meta/recipes-core/glibc/glibc/0026-PR25847-7.patch
> +++ /dev/null
> @@ -1,160 +0,0 @@
> -From 2a601ac9041e2ca645acad2c174b1c545cfceafe Mon Sep 17 00:00:00 2001
> -From: Malte Skarupke <malteskarupke@fastmail.fm>
> -Date: Tue, 17 Jun 2025 01:53:25 -0700
> -Subject: [PATCH] nptl: rename __condvar_quiesce_and_switch_g1
> -
> -This function no longer waits for threads to leave g1, so rename it to
> -__condvar_switch_g1
> -
> -The following commits have been cherry-picked from Glibc master branch:
> -Bug : https://sourceware.org/bugzilla/show_bug.cgi?id=3D25847
> -
> -Upstream-Status: Backport
> -[https://sourceware.org/git/?p=3Dglibc.git;a=3Dcommit;h=3D4b79e27a5073c0=
2f6bff9aa8f4791230a0ab1867]
> -
> -Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
> ----
> - nptl/pthread_cond_broadcast.c |  4 ++--
> - nptl/pthread_cond_common.c    | 26 ++++++++++++--------------
> - nptl/pthread_cond_signal.c    | 17 ++++++++---------
> - nptl/pthread_cond_wait.c      |  9 ++++-----
> - 4 files changed, 26 insertions(+), 30 deletions(-)
> -
> -diff --git a/nptl/pthread_cond_broadcast.c b/nptl/pthread_cond_broadcast=
.c
> -index 5ae141ac81..a07435589a 100644
> ---- a/nptl/pthread_cond_broadcast.c
> -+++ b/nptl/pthread_cond_broadcast.c
> -@@ -60,7 +60,7 @@ ___pthread_cond_broadcast (pthread_cond_t *cond)
> -                               cond->__data.__g_size[g1] << 1);
> -       cond->__data.__g_size[g1] =3D 0;
> -
> --      /* We need to wake G1 waiters before we quiesce G1 below.  */
> -+      /* We need to wake G1 waiters before we switch G1 below.  */
> -       /* TODO Only set it if there are indeed futex waiters.  We could
> -        also try to move this out of the critical section in cases when
> -        G2 is empty (and we don't need to quiesce).  */
> -@@ -69,7 +69,7 @@ ___pthread_cond_broadcast (pthread_cond_t *cond)
> -
> -   /* G1 is complete.  Step (2) is next unless there are no waiters in G=
2, in
> -      which case we can stop.  */
> --  if (__condvar_quiesce_and_switch_g1 (cond, wseq, &g1, private))
> -+  if (__condvar_switch_g1 (cond, wseq, &g1, private))
> -     {
> -       /* Step (3): Send signals to all waiters in the old G2 / new G1. =
 */
> -       atomic_fetch_add_relaxed (cond->__data.__g_signals + g1,
> -diff --git a/nptl/pthread_cond_common.c b/nptl/pthread_cond_common.c
> -index f976a533a1..3baac4dabc 100644
> ---- a/nptl/pthread_cond_common.c
> -+++ b/nptl/pthread_cond_common.c
> -@@ -189,16 +189,15 @@ __condvar_get_private (int flags)
> -     return FUTEX_SHARED;
> - }
> -
> --/* This closes G1 (whose index is in G1INDEX), waits for all futex wait=
ers to
> --   leave G1, converts G1 into a fresh G2, and then switches group roles=
 so that
> --   the former G2 becomes the new G1 ending at the current __wseq value =
when we
> --   eventually make the switch (WSEQ is just an observation of __wseq by=
 the
> --   signaler).
> -+/* This closes G1 (whose index is in G1INDEX), converts G1 into a fresh=
 G2,
> -+   and then switches group roles so that the former G2 becomes the new =
G1
> -+   ending at the current __wseq value when we eventually make the switc=
h
> -+   (WSEQ is just an observation of __wseq by the signaler).
> -    If G2 is empty, it will not switch groups because then it would crea=
te an
> -    empty G1 which would require switching groups again on the next sign=
al.
> -    Returns false iff groups were not switched because G2 was empty.  */
> - static bool __attribute__ ((unused))
> --__condvar_quiesce_and_switch_g1 (pthread_cond_t *cond, uint64_t wseq,
> -+__condvar_switch_g1 (pthread_cond_t *cond, uint64_t wseq,
> -     unsigned int *g1index, int private)
> - {
> -   unsigned int g1 =3D *g1index;
> -@@ -214,8 +213,7 @@ __condvar_quiesce_and_switch_g1 (pthread_cond_t *con=
d, uint64_t wseq,
> -         + cond->__data.__g_size[g1 ^ 1]) =3D=3D 0)
> -       return false;
> -
> --  /* Now try to close and quiesce G1.  We have to consider the followin=
g kinds
> --     of waiters:
> -+  /* We have to consider the following kinds of waiters:
> -      * Waiters from less recent groups than G1 are not affected because
> -        nothing will change for them apart from __g1_start getting large=
r.
> -      * New waiters arriving concurrently with the group switching will =
all go
> -@@ -223,12 +221,12 @@ __condvar_quiesce_and_switch_g1 (pthread_cond_t *c=
ond, uint64_t wseq,
> -        are not affected.
> -      * Waiters in G1 have already received a signal and been woken.  */
> -
> --  /* Update __g1_start, which finishes closing this group.  The value w=
e add
> --     will never be negative because old_orig_size can only be zero when=
 we
> --     switch groups the first time after a condvar was initialized, in w=
hich
> --     case G1 will be at index 1 and we will add a value of 1.
> --     Relaxed MO is fine because the change comes with no additional
> --     constraints that others would have to observe.  */
> -+  /* Update __g1_start, which closes this group.  The value we add will=
 never
> -+     be negative because old_orig_size can only be zero when we switch =
groups
> -+     the first time after a condvar was initialized, in which case G1 w=
ill be
> -+     at index 1 and we will add a value of 1. Relaxed MO is fine becaus=
e the
> -+     change comes with no additional constraints that others would have=
 to
> -+     observe.  */
> -   __condvar_add_g1_start_relaxed (cond,
> -       (old_orig_size << 1) + (g1 =3D=3D 1 ? 1 : - 1));
> -
> -diff --git a/nptl/pthread_cond_signal.c b/nptl/pthread_cond_signal.c
> -index 14800ba00b..a9bc10dcca 100644
> ---- a/nptl/pthread_cond_signal.c
> -+++ b/nptl/pthread_cond_signal.c
> -@@ -69,18 +69,17 @@ ___pthread_cond_signal (pthread_cond_t *cond)
> -   bool do_futex_wake =3D false;
> -
> -   /* If G1 is still receiving signals, we put the signal there.  If not=
, we
> --     check if G2 has waiters, and if so, quiesce and switch G1 to the f=
ormer
> --     G2; if this results in a new G1 with waiters (G2 might have cancel=
lations
> --     already, see __condvar_quiesce_and_switch_g1), we put the signal i=
n the
> --     new G1.  */
> -+     check if G2 has waiters, and if so, switch G1 to the former G2; if=
 this
> -+     results in a new G1 with waiters (G2 might have cancellations alre=
ady,
> -+     see __condvar_switch_g1), we put the signal in the new G1. */
> -   if ((cond->__data.__g_size[g1] !=3D 0)
> --      || __condvar_quiesce_and_switch_g1 (cond, wseq, &g1, private))
> -+      || __condvar_switch_g1 (cond, wseq, &g1, private))
> -     {
> -       /* Add a signal.  Relaxed MO is fine because signaling does not n=
eed to
> --       establish a happens-before relation (see above).  We do not mask=
 the
> --       release-MO store when initializing a group in
> --       __condvar_quiesce_and_switch_g1 because we use an atomic
> --       read-modify-write and thus extend that store's release sequence.=
  */
> -+         establish a happens-before relation (see above).  We do not ma=
sk the
> -+         release-MO store when initializing a group in __condvar_switch=
_g1
> -+         because we use an atomic read-modify-write and thus extend tha=
t
> -+         store's release sequence.  */
> -       atomic_fetch_add_relaxed (cond->__data.__g_signals + g1, 2);
> -       cond->__data.__g_size[g1]--;
> -       /* TODO Only set it if there are indeed futex waiters.  */
> -diff --git a/nptl/pthread_cond_wait.c b/nptl/pthread_cond_wait.c
> -index 104ebd48ca..bb46f3605d 100644
> ---- a/nptl/pthread_cond_wait.c
> -+++ b/nptl/pthread_cond_wait.c
> -@@ -382,8 +382,7 @@ __pthread_cond_wait_common (pthread_cond_t *cond, pt=
hread_mutex_t *mutex,
> -      because we do not need to establish any happens-before relation wi=
th
> -      signalers (see __pthread_cond_signal); modification order alone
> -      establishes a total order of waiters/signals.  We do need acquire =
MO
> --     to synchronize with group reinitialization in
> --     __condvar_quiesce_and_switch_g1.  */
> -+     to synchronize with group reinitialization in __condvar_switch_g1.=
  */
> -   uint64_t wseq =3D __condvar_fetch_add_wseq_acquire (cond, 2);
> -   /* Find our group's index.  We always go into what was G2 when we acq=
uired
> -      our position.  */
> -@@ -414,9 +413,9 @@ __pthread_cond_wait_common (pthread_cond_t *cond, pt=
hread_mutex_t *mutex,
> -     {
> -       /* Now wait until a signal is available in our group or it is clo=
sed.
> -          Acquire MO so that if we observe (signals =3D=3D lowseq) after=
 group
> --         switching in __condvar_quiesce_and_switch_g1, we synchronize w=
ith that
> --         store and will see the prior update of __g1_start done while s=
witching
> --         groups too.  */
> -+         switching in __condvar_switch_g1, we synchronize with that sto=
re and
> -+         will see the prior update of __g1_start done while switching g=
roups
> -+         too.  */
> -       unsigned int signals =3D atomic_load_acquire (cond->__data.__g_si=
gnals + g);
> -       uint64_t g1_start =3D __condvar_load_g1_start_relaxed (cond);
> -       unsigned int lowseq =3D (g1_start & 1) =3D=3D g ? signals : g1_st=
art & ~1U;
> ---
> -2.49.0
> -
> diff --git a/meta/recipes-core/glibc/glibc/0026-PR25847-8.patch b/meta/re=
cipes-core/glibc/glibc/0026-PR25847-8.patch
> deleted file mode 100644
> index 8ea0c784ef..0000000000
> --- a/meta/recipes-core/glibc/glibc/0026-PR25847-8.patch
> +++ /dev/null
> @@ -1,192 +0,0 @@
> -From fc074de88796eb2036fbe9bade638e00adfd5cb2 Mon Sep 17 00:00:00 2001
> -From: Malte Skarupke <malteskarupke@fastmail.fm>
> -Date: Tue, 17 Jun 2025 02:08:36 -0700
> -Subject: [PATCH] nptl: Use all of g1_start and g_signals
> -
> -The LSB of g_signals was unused. The LSB of g1_start was used to indicat=
e
> -which group is G2. This was used to always go to sleep in pthread_cond_w=
ait
> -if a waiter is in G2. A comment earlier in the file says that this is no=
t
> -correct to do:
> -
> - "Waiters cannot determine whether they are currently in G2 or G1 -- but=
 they
> -  do not have to because all they are interested in is whether there are
> -  available signals"
> -
> -I either would have had to update the comment, or get rid of the check. =
I
> -chose to get rid of the check. In fact I don't quite know why it was the=
re.
> -There will never be available signals for group G2, so we didn't need th=
e
> -special case. Even if there were, this would just be a spurious wake. Th=
is
> -might have caught some cases where the count has wrapped around, but it
> -wouldn't reliably do that, (and even if it did, why would you want to fo=
rce a
> -sleep in that case?) and we don't support that many concurrent waiters
> -anyway. Getting rid of it allows us to use one more bit, making us more
> -robust to wraparound.
> -
> -The following commits have been cherry-picked from Glibc master branch:
> -Bug : https://sourceware.org/bugzilla/show_bug.cgi?id=3D25847
> -
> -Upstream-Status: Backport
> -[https://sourceware.org/git/?p=3Dglibc.git;a=3Dcommit;h=3D91bb902f58264a=
2fd50fbce8f39a9a290dd23706]
> -
> -Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
> ----
> - nptl/pthread_cond_broadcast.c |  4 ++--
> - nptl/pthread_cond_common.c    | 26 ++++++++++----------------
> - nptl/pthread_cond_signal.c    |  2 +-
> - nptl/pthread_cond_wait.c      | 14 +++++---------
> - 4 files changed, 18 insertions(+), 28 deletions(-)
> -
> -diff --git a/nptl/pthread_cond_broadcast.c b/nptl/pthread_cond_broadcast=
.c
> -index a07435589a..ef0943cdc5 100644
> ---- a/nptl/pthread_cond_broadcast.c
> -+++ b/nptl/pthread_cond_broadcast.c
> -@@ -57,7 +57,7 @@ ___pthread_cond_broadcast (pthread_cond_t *cond)
> -     {
> -       /* Add as many signals as the remaining size of the group.  */
> -       atomic_fetch_add_relaxed (cond->__data.__g_signals + g1,
> --                              cond->__data.__g_size[g1] << 1);
> -+                              cond->__data.__g_size[g1]);
> -       cond->__data.__g_size[g1] =3D 0;
> -
> -       /* We need to wake G1 waiters before we switch G1 below.  */
> -@@ -73,7 +73,7 @@ ___pthread_cond_broadcast (pthread_cond_t *cond)
> -     {
> -       /* Step (3): Send signals to all waiters in the old G2 / new G1. =
 */
> -       atomic_fetch_add_relaxed (cond->__data.__g_signals + g1,
> --                              cond->__data.__g_size[g1] << 1);
> -+                              cond->__data.__g_size[g1]);
> -       cond->__data.__g_size[g1] =3D 0;
> -       /* TODO Only set it if there are indeed futex waiters.  */
> -       do_futex_wake =3D true;
> -diff --git a/nptl/pthread_cond_common.c b/nptl/pthread_cond_common.c
> -index 3baac4dabc..e48f914321 100644
> ---- a/nptl/pthread_cond_common.c
> -+++ b/nptl/pthread_cond_common.c
> -@@ -208,9 +208,9 @@ __condvar_switch_g1 (pthread_cond_t *cond, uint64_t =
wseq,
> -      behavior.
> -      Note that this works correctly for a zero-initialized condvar too.=
  */
> -   unsigned int old_orig_size =3D __condvar_get_orig_size (cond);
> --  uint64_t old_g1_start =3D __condvar_load_g1_start_relaxed (cond) >> 1=
;
> --  if (((unsigned) (wseq - old_g1_start - old_orig_size)
> --        + cond->__data.__g_size[g1 ^ 1]) =3D=3D 0)
> -+  uint64_t old_g1_start =3D __condvar_load_g1_start_relaxed (cond);
> -+  uint64_t new_g1_start =3D old_g1_start + old_orig_size;
> -+  if (((unsigned) (wseq - new_g1_start) + cond->__data.__g_size[g1 ^ 1]=
) =3D=3D 0)
> -       return false;
> -
> -   /* We have to consider the following kinds of waiters:
> -@@ -221,16 +221,10 @@ __condvar_switch_g1 (pthread_cond_t *cond, uint64_=
t wseq,
> -        are not affected.
> -      * Waiters in G1 have already received a signal and been woken.  */
> -
> --  /* Update __g1_start, which closes this group.  The value we add will=
 never
> --     be negative because old_orig_size can only be zero when we switch =
groups
> --     the first time after a condvar was initialized, in which case G1 w=
ill be
> --     at index 1 and we will add a value of 1. Relaxed MO is fine becaus=
e the
> --     change comes with no additional constraints that others would have=
 to
> --     observe.  */
> --  __condvar_add_g1_start_relaxed (cond,
> --      (old_orig_size << 1) + (g1 =3D=3D 1 ? 1 : - 1));
> --
> --  unsigned int lowseq =3D ((old_g1_start + old_orig_size) << 1) & ~1U;
> -+  /* Update __g1_start, which closes this group.  Relaxed MO is fine be=
cause
> -+     the change comes with no additional constraints that others would =
have
> -+     to observe.  */
> -+  __condvar_add_g1_start_relaxed (cond, old_orig_size);
> -
> -   /* At this point, the old G1 is now a valid new G2 (but not in use ye=
t).
> -      No old waiter can neither grab a signal nor acquire a reference wi=
thout
> -@@ -242,13 +236,13 @@ __condvar_switch_g1 (pthread_cond_t *cond, uint64_=
t wseq,
> -   g1 ^=3D 1;
> -   *g1index ^=3D 1;
> -
> --  /* Now advance the new G1 g_signals to the new lowseq, giving it
> -+  /* Now advance the new G1 g_signals to the new g1_start, giving it
> -      an effective signal count of 0 to start.  */
> --  atomic_store_release (cond->__data.__g_signals + g1, lowseq);
> -+  atomic_store_release (cond->__data.__g_signals + g1, (unsigned)new_g1=
_start);
> -
> -   /* These values are just observed by signalers, and thus protected by=
 the
> -      lock.  */
> --  unsigned int orig_size =3D wseq - (old_g1_start + old_orig_size);
> -+  unsigned int orig_size =3D wseq - new_g1_start;
> -   __condvar_set_orig_size (cond, orig_size);
> -   /* Use and addition to not loose track of cancellations in what was
> -      previously G2.  */
> -diff --git a/nptl/pthread_cond_signal.c b/nptl/pthread_cond_signal.c
> -index a9bc10dcca..07427369aa 100644
> ---- a/nptl/pthread_cond_signal.c
> -+++ b/nptl/pthread_cond_signal.c
> -@@ -80,7 +80,7 @@ ___pthread_cond_signal (pthread_cond_t *cond)
> -          release-MO store when initializing a group in __condvar_switch=
_g1
> -          because we use an atomic read-modify-write and thus extend tha=
t
> -          store's release sequence.  */
> --      atomic_fetch_add_relaxed (cond->__data.__g_signals + g1, 2);
> -+      atomic_fetch_add_relaxed (cond->__data.__g_signals + g1, 1);
> -       cond->__data.__g_size[g1]--;
> -       /* TODO Only set it if there are indeed futex waiters.  */
> -       do_futex_wake =3D true;
> -diff --git a/nptl/pthread_cond_wait.c b/nptl/pthread_cond_wait.c
> -index bb46f3605d..430cbe8a35 100644
> ---- a/nptl/pthread_cond_wait.c
> -+++ b/nptl/pthread_cond_wait.c
> -@@ -84,7 +84,7 @@ __condvar_cancel_waiting (pthread_cond_t *cond, uint64=
_t seq, unsigned int g,
> -      not hold a reference on the group.  */
> -   __condvar_acquire_lock (cond, private);
> -
> --  uint64_t g1_start =3D __condvar_load_g1_start_relaxed (cond) >> 1;
> -+  uint64_t g1_start =3D __condvar_load_g1_start_relaxed (cond);
> -   if (g1_start > seq)
> -     {
> -       /* Our group is closed, so someone provided enough signals for it=
.
> -@@ -278,7 +278,6 @@ __condvar_cleanup_waiting (void *arg)
> -      * Waiters fetch-add while having acquire the mutex associated with=
 the
> -        condvar.  Signalers load it and fetch-xor it concurrently.
> -    __g1_start: Starting position of G1 (inclusive)
> --     * LSB is index of current G2.
> -      * Modified by signalers while having acquired the condvar-internal=
 lock
> -        and observed concurrently by waiters.
> -    __g1_orig_size: Initial size of G1
> -@@ -299,11 +298,9 @@ __condvar_cleanup_waiting (void *arg)
> -      * Reference count used by waiters concurrently with signalers that=
 have
> -        acquired the condvar-internal lock.
> -    __g_signals: The number of signals that can still be consumed, relat=
ive to
> --     the current g1_start.  (i.e. bits 31 to 1 of __g_signals are bits
> --     31 to 1 of g1_start with the signal count added)
> -+     the current g1_start.  (i.e. g1_start with the signal count added)
> -      * Used as a futex word by waiters.  Used concurrently by waiters a=
nd
> -        signalers.
> --     * LSB is currently reserved and 0.
> -    __g_size: Waiters remaining in this group (i.e., which have not been
> -      signaled yet.
> -      * Accessed by signalers and waiters that cancel waiting (both do s=
o only
> -@@ -418,9 +415,8 @@ __pthread_cond_wait_common (pthread_cond_t *cond, pt=
hread_mutex_t *mutex,
> -          too.  */
> -       unsigned int signals =3D atomic_load_acquire (cond->__data.__g_si=
gnals + g);
> -       uint64_t g1_start =3D __condvar_load_g1_start_relaxed (cond);
> --      unsigned int lowseq =3D (g1_start & 1) =3D=3D g ? signals : g1_st=
art & ~1U;
> -
> --      if (seq < (g1_start >> 1))
> -+      if (seq < g1_start)
> -         {
> -           /* If the group is closed already,
> -              then this waiter originally had enough extra signals to
> -@@ -433,13 +429,13 @@ __pthread_cond_wait_common (pthread_cond_t *cond, =
pthread_mutex_t *mutex,
> -          by now, perhaps in the process of switching back to an older
> -          G2, but in either case we're allowed to consume the available
> -          signal and should not block anymore.  */
> --      if ((int)(signals - lowseq) >=3D 2)
> -+      if ((int)(signals - (unsigned int)g1_start) > 0)
> -         {
> -          /* Try to grab a signal.  See above for MO.  (if we do another=
 loop
> -             iteration we need to see the correct value of g1_start)  */
> -            if (atomic_compare_exchange_weak_acquire (
> -                        cond->__data.__g_signals + g,
> --                       &signals, signals - 2))
> -+                       &signals, signals - 1))
> -             break;
> -          else
> -             continue;
> ---
> -2.49.0
> -
> diff --git a/meta/recipes-core/glibc/glibc_2.35.bb b/meta/recipes-core/gl=
ibc/glibc_2.35.bb
> index 265dcb9129..ca7f630699 100644
> --- a/meta/recipes-core/glibc/glibc_2.35.bb
> +++ b/meta/recipes-core/glibc/glibc_2.35.bb
> @@ -62,14 +62,6 @@ SRC_URI =3D  "${GLIBC_GIT_URI};branch=3D${SRCBRANCH};n=
ame=3Dglibc \
>             file://0022-sysdeps-gnu-configure.ac-Set-libc_cv_rootsbindir-=
onl.patch \
>             file://0023-timezone-Make-shell-interpreter-overridable-in-tz=
sel.patch \
>             file://0024-fix-create-thread-failed-in-unprivileged-process-=
BZ-.patch \
> -           file://0026-PR25847-1.patch \
> -           file://0026-PR25847-2.patch \
> -           file://0026-PR25847-3.patch \
> -           file://0026-PR25847-4.patch \
> -           file://0026-PR25847-5.patch \
> -           file://0026-PR25847-6.patch \
> -           file://0026-PR25847-7.patch \
> -           file://0026-PR25847-8.patch \
>             \
>             file://0001-Revert-Linux-Implement-a-useful-version-of-_start=
up_.patch \
>             file://0002-get_nscd_addresses-Fix-subscript-typos-BZ-29605.p=
atch \
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#224858): https://lists.openembedded.org/g/openembedde=
d-core/message/224858
> Mute This Topic: https://lists.openembedded.org/mt/115762087/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

