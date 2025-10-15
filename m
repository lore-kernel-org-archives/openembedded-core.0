Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E471CCD184
	for <webhook@archiver.kernel.org>; Wed, 15 Oct 2025 00:13:58 +0000 (UTC)
Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
 by mx.groups.io with SMTP id smtpd.web10.4283.1760487230621954498
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Oct 2025 17:13:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=y/WrY0Fa;
 spf=softfail (domain: sakoman.com, ip: 74.125.224.48, mailfrom: steve@sakoman.com)
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-63605f6f64eso4955695d50.1
        for <openembedded-core@lists.openembedded.org>; Tue, 14 Oct 2025 17:13:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1760487230; x=1761092030; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=V64Y5jZ8fsSXfmZ1e5BVgStql/RgZD4GRb/mkCkiMTM=;
        b=y/WrY0Faq+USwfR950nsCtMGLNkS2tS3HTprvWVBhxOtRIyblLyT9/LHMrY15Vjt9S
         i0h96iJgfA9P80722Urb3rLLZPjWoBOXzT/O1NLAgJRmkK68Rb71ERA4FygKmx5U5LqW
         5hAEzCp9qdUWQ4/SHuWQZaxBnS06XkMfIyeppXmz//OZzXYappFi2ufylgOe2lAq7otF
         R3vKvicFvjeY9k4i5Nd3PyncrCyJ+QasB5fFSrCMDQpXTbdskR6XKohK94yD+EhU/Xrh
         UUYk3cTUWVaZkiY1YhhgkBzfx33RP9+hhpqrh8jHBkr64vVy91tslDVgWeXqTHBDUP8U
         l1+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760487230; x=1761092030;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V64Y5jZ8fsSXfmZ1e5BVgStql/RgZD4GRb/mkCkiMTM=;
        b=nUucqJfIWnnoC7ZZLmhXvgMFLPUNwOWjJXGF/VZ4ZDcVDcjtkqPWcDCCGiCUKjweUd
         1VH1h3PgTs/mYRfJXLTvOPqZfqJY5zzknWHfPbW3jlHTizjsE+GkCRHiHXjZhNSO2gsm
         HaPpzFMXrpopVJlevFMkEFS0JH0pMWKnuVertk/oyBLKBnpV7SBlhH42FZQydlmLha48
         0fGzUrT1aHxovkTE1TDmbPImywlwLLEM5+YMnBM8tY8Ab3iDpBwUc5fxYKsdG/eJvmlI
         acoZ8xwrQndAr9SodrLhzPecmscTx8Hfs9pqwBglKRvGL0TgYQJ6a93ZP6EsKdjeF4i7
         HTPA==
X-Gm-Message-State: AOJu0YzTawqK40Pd1jpzyP05azYwLrksyaz2Lm+51oveLyA0z2ajPJd3
	TaQuQ40e6q+HNWJsXduaIOePN5zy+7sZ5g/PdkKMoYvGYDhk8vbAsU62fkZXWnjfS2wFc4Mq+Ap
	1YJgC6Ntta6gYN1e5nCIuQHiSh5R5lfAVQSa99tqLZw==
X-Gm-Gg: ASbGnctTjjNECqRaHbsKXOevNo2+YEO+UZOtukjBY2/obHOENEsseg+5IB8gl1jH4Gc
	LGSKiWd9jFVW2B7wM6WDD/rjhFQQtbOpQQ28E4KAMzwhjituvaM7wq+Km11mv6phFsh7A7R7UR5
	WKGI1E8l1rJlz+VGjdDh7ptjumwzEjGXHPbPJfFH9MiByXtCyaVRXke/wwhntj6krP7D/Z0Kxs4
	LLoL9MnGvqb71ocQflWe1N1k8g/NjH32vjgbf7+e+sYdwAKExn0MbEJFQ==
X-Google-Smtp-Source: AGHT+IG8ko4AjyYzfTo5WYcAAY9Jz58TY/TF9HQvxQfKcAjGqsy/fhQn7nhNmPOGnWfMzGSrYVlyxrJYg9LqfmpsTmE=
X-Received: by 2002:a53:c909:0:b0:63c:e837:5d8a with SMTP id
 956f58d0204a3-63ce83761bfmr11579805d50.18.1760487229081; Tue, 14 Oct 2025
 17:13:49 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1760481775.git.steve@sakoman.com> <9881dd70305b87945e9649d744bcbc40a1a7b780.1760481775.git.steve@sakoman.com>
 <CAMKF1sohg3Bf3h2NBdcFdrCebPqOuVq-OUwku556Hfp6p--Gbg@mail.gmail.com>
In-Reply-To: <CAMKF1sohg3Bf3h2NBdcFdrCebPqOuVq-OUwku556Hfp6p--Gbg@mail.gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Tue, 14 Oct 2025 17:13:37 -0700
X-Gm-Features: AS18NWDrfc1pCj9507wM-sVk0IoA_cv059REDFUh7itsGTUKl3_G2-x0uEWYC6A
Message-ID: <CAOSpxdaJb2KYezjbgKTafU7dWKy4dZJwYE5SHs9v0=j8=+G9zg@mail.gmail.com>
Subject: Re: [OE-core][kirkstone 04/14] glibc: Remove partial BZ#25847
 backport patches
To: Khem Raj <raj.khem@gmail.com>, SunilKumar.Dora@windriver.com
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000ebdb1c0641275fba"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Oct 2025 00:13:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224870

--000000000000ebdb1c0641275fba
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 14, 2025, 3:57=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrote:

> are these backports being done in glibc 2.35 release as well
>


Sunil, can you respond to Khem's question?

Steve


> On Tue, Oct 14, 2025 at 3:45=E2=80=AFPM Steve Sakoman via
> lists.openembedded.org <steve=3Dsakoman.com@lists.openembedded.org>
> wrote:
> >
> > From: Sunil Dora <sunilkumar.dora@windriver.com>
> >
> > To facilitate a clean backport of the full 10-commit series
> > addressing the pthread condition variable lost wakeup issue
> > (BZ#25847) in glibc 2.35, remove the existing 8 patches that
> > were applied as a partial backport.
> >
> > The previous partial backport excluded commit:
> > c36fc50781995e6758cae2b6927839d0157f213c ("nptl: Remove
> > g_refs from condition variables") based on guidance from
> > glibc maintainer Florian Weimer(#comment #74)
> >
> > This exclusion was recommended for stable branches to
> > avoid altering the layout of pthread_cond_t, which could
> > introduce ABI incompatibilities. Additionally, the dependent
> > commit dbc5a50d12eff4cb3f782129029d04b8a76f58e7 was not needed
> > in the partial backport.
> >
> > To align with upstream mainline, per maintainer Carlos O'Donell
> > (comment #75), apply the complete 10-commit series for consistency.
> >
> > By removing these patches first, we ensure the subsequent
> > application of the full 10 commits results in cleaner, more
> > reviewable changes without intermixed conflicts or overlaps.
> >
> > Removed patches and corresponding upstream commits:
> > - 0026-PR25847-1.patch: 1db84775f831a1494993ce9c118deaf9537cc50a
> > - 0026-PR25847-2.patch: 0cc973160c23bb67f895bc887dd6942d29f8fee3
> > - 0026-PR25847-3.patch: b42cc6af11062c260c7dfa91f1c89891366fed3e
> > - 0026-PR25847-4.patch: 4f7b051f8ee3feff1b53b27a906f245afaa9cee1
> > - 0026-PR25847-5.patch: 929a4764ac90382616b6a21f099192b2475da674
> > - 0026-PR25847-6.patch: ee6c14ed59d480720721aaacc5fb03213dc153da
> > - 0026-PR25847-7.patch: 4b79e27a5073c02f6bff9aa8f4791230a0ab1867
> > - 0026-PR25847-8.patch: 91bb902f58264a2fd50fbce8f39a9a290dd23706
> >
> > Bug reference: https://sourceware.org/bugzilla/show_bug.cgi?id=3D25847
> > This change prepares the branch for the full backport in follow-up
> commits.
> >
> > Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
> > Signed-off-by: Steve Sakoman <steve@sakoman.com>
> > ---
> >  .../glibc/glibc/0026-PR25847-1.patch          | 455 ------------------
> >  .../glibc/glibc/0026-PR25847-2.patch          | 144 ------
> >  .../glibc/glibc/0026-PR25847-3.patch          |  77 ---
> >  .../glibc/glibc/0026-PR25847-4.patch          | 117 -----
> >  .../glibc/glibc/0026-PR25847-5.patch          | 105 ----
> >  .../glibc/glibc/0026-PR25847-6.patch          | 169 -------
> >  .../glibc/glibc/0026-PR25847-7.patch          | 160 ------
> >  .../glibc/glibc/0026-PR25847-8.patch          | 192 --------
> >  meta/recipes-core/glibc/glibc_2.35.bb         |   8 -
> >  9 files changed, 1427 deletions(-)
> >  delete mode 100644 meta/recipes-core/glibc/glibc/0026-PR25847-1.patch
> >  delete mode 100644 meta/recipes-core/glibc/glibc/0026-PR25847-2.patch
> >  delete mode 100644 meta/recipes-core/glibc/glibc/0026-PR25847-3.patch
> >  delete mode 100644 meta/recipes-core/glibc/glibc/0026-PR25847-4.patch
> >  delete mode 100644 meta/recipes-core/glibc/glibc/0026-PR25847-5.patch
> >  delete mode 100644 meta/recipes-core/glibc/glibc/0026-PR25847-6.patch
> >  delete mode 100644 meta/recipes-core/glibc/glibc/0026-PR25847-7.patch
> >  delete mode 100644 meta/recipes-core/glibc/glibc/0026-PR25847-8.patch
> >
> > diff --git a/meta/recipes-core/glibc/glibc/0026-PR25847-1.patch
> b/meta/recipes-core/glibc/glibc/0026-PR25847-1.patch
> > deleted file mode 100644
> > index 44a2b6772c..0000000000
> > --- a/meta/recipes-core/glibc/glibc/0026-PR25847-1.patch
> > +++ /dev/null
> > @@ -1,455 +0,0 @@
> > -From 31d9848830e496f57d4182b518467c4c63bfd4bd Mon Sep 17 00:00:00 2001
> > -From: Frank Barrus <frankbarrus_sw@shaggy.cc>
> > -Date: Mon, 16 Jun 2025 22:37:54 -0700
> > -Subject: [PATCH] pthreads NPTL: lost wakeup fix 2
> > -
> > -This fixes the lost wakeup (from a bug in signal stealing) with a chan=
ge
> > -in the usage of g_signals[] in the condition variable internal state.
> > -It also completely eliminates the concept and handling of signal
> stealing,
> > -as well as the need for signalers to block to wait for waiters to wake
> > -up every time there is a G1/G2 switch.  This greatly reduces the avera=
ge
> > -and maximum latency for pthread_cond_signal.
> > -
> > -The g_signals[] field now contains a signal count that is relative to
> > -the current g1_start value.  Since it is a 32-bit field, and the LSB i=
s
> > -still reserved (though not currently used anymore), it has a 31-bit
> value
> > -that corresponds to the low 31 bits of the sequence number in g1_start=
.
> > -(since g1_start also has an LSB flag, this means bits 31:1 in g_signal=
s
> > -correspond to bits 31:1 in g1_start, plus the current signal count)
> > -
> > -By making the signal count relative to g1_start, there is no longer
> > -any ambiguity or A/B/A issue, and thus any checks before blocking,
> > -including the futex call itself, are guaranteed not to block if the
> G1/G2
> > -switch occurs, even if the signal count remains the same.  This allows
> > -initially safely blocking in G2 until the switch to G1 occurs, and
> > -then transitioning from G1 to a new G1 or G2, and always being able to
> > -distinguish the state change.  This removes the race condition and A/B=
/A
> > -problems that otherwise ocurred if a late (pre-empted) waiter were to
> > -resume just as the futex call attempted to block on g_signal since
> > -otherwise there was no last opportunity to re-check things like whethe=
r
> > -the current G1 group was already closed.
> > -
> > -By fixing these issues, the signal stealing code can be eliminated,
> > -since there is no concept of signal stealing anymore.  The code to blo=
ck
> > -for all waiters to exit g_refs can also be removed, since any waiters
> > -that are still in the g_refs region can be guaranteed to safely wake
> > -up and exit.  If there are still any left at this time, they are all
> > -sent one final futex wakeup to ensure that they are not blocked any
> > -longer, but there is no need for the signaller to block and wait for
> > -them to wake up and exit the g_refs region.
> > -
> > -The signal count is then effectively "zeroed" but since it is now
> > -relative to g1_start, this is done by advancing it to a new value that
> > -can be observed by any pending blocking waiters.  Any late waiters can
> > -always tell the difference, and can thus just cleanly exit if they are
> > -in a stale G1 or G2.  They can never steal a signal from the current
> > -G1 if they are not in the current G1, since the signal value that has
> > -to match in the cmpxchg has the low 31 bits of the g1_start value
> > -contained in it, and that's first checked, and then it won't match if
> > -there's a G1/G2 change.
> > -
> > -Note: the 31-bit sequence number used in g_signals is designed to
> > -handle wrap-around when checking the signal count, but if the entire
> > -31-bit wraparound (2 billion signals) occurs while there is still a
> > -late waiter that has not yet resumed, and it happens to then match
> > -the current g1_start low bits, and the pre-emption occurs after the
> > -normal "closed group" checks (which are 64-bit) but then hits the
> > -futex syscall and signal consuming code, then an A/B/A issue could
> > -still result and cause an incorrect assumption about whether it
> > -should block.  This particular scenario seems unlikely in practice.
> > -Note that once awake from the futex, the waiter would notice the
> > -closed group before consuming the signal (since that's still a 64-bit
> > -check that would not be aliased in the wrap-around in g_signals),
> > -so the biggest impact would be blocking on the futex until the next
> > -full wakeup from a G1/G2 switch.
> > -
> > -The following commits have been cherry-picked from Glibc master branch=
:
> > -Bug : https://sourceware.org/bugzilla/show_bug.cgi?id=3D25847
> > -
> > -Upstream-Status: Backport
> > -[
> https://sourceware.org/git/?p=3Dglibc.git;a=3Dcommit;h=3D1db84775f831a149=
4993ce9c118deaf9537cc50a
> ]
> > -
> > -Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
> > ----
> > - nptl/pthread_cond_common.c | 106 +++++++++------------------
> > - nptl/pthread_cond_wait.c   | 144 ++++++++++++------------------------=
-
> > - 2 files changed, 81 insertions(+), 169 deletions(-)
> > -
> > -diff --git a/nptl/pthread_cond_common.c b/nptl/pthread_cond_common.c
> > -index fb035f72c3..8dd7037923 100644
> > ---- a/nptl/pthread_cond_common.c
> > -+++ b/nptl/pthread_cond_common.c
> > -@@ -201,7 +201,6 @@ static bool __attribute__ ((unused))
> > - __condvar_quiesce_and_switch_g1 (pthread_cond_t *cond, uint64_t wseq,
> > -     unsigned int *g1index, int private)
> > - {
> > --  const unsigned int maxspin =3D 0;
> > -   unsigned int g1 =3D *g1index;
> > -
> > -   /* If there is no waiter in G2, we don't do anything.  The
> expression may
> > -@@ -222,85 +221,46 @@ __condvar_quiesce_and_switch_g1 (pthread_cond_t
> *cond, uint64_t wseq,
> > -      * New waiters arriving concurrently with the group switching wil=
l
> all go
> > -        into G2 until we atomically make the switch.  Waiters existing
> in G2
> > -        are not affected.
> > --     * Waiters in G1 will be closed out immediately by setting a flag
> in
> > --       __g_signals, which will prevent waiters from blocking using a
> futex on
> > --       __g_signals and also notifies them that the group is closed.
> As a
> > --       result, they will eventually remove their group reference,
> allowing us
> > --       to close switch group roles.  */
> > --
> > --  /* First, set the closed flag on __g_signals.  This tells waiters
> that are
> > --     about to wait that they shouldn't do that anymore.  This basical=
ly
> > --     serves as an advance notificaton of the upcoming change to
> __g1_start;
> > --     waiters interpret it as if __g1_start was larger than their wait=
er
> > --     sequence position.  This allows us to change __g1_start after
> waiting
> > --     for all existing waiters with group references to leave, which i=
n
> turn
> > --     makes recovery after stealing a signal simpler because it then
> can be
> > --     skipped if __g1_start indicates that the group is closed
> (otherwise,
> > --     we would have to recover always because waiters don't know how
> big their
> > --     groups are).  Relaxed MO is fine.  */
> > --  atomic_fetch_or_relaxed (cond->__data.__g_signals + g1, 1);
> > --
> > --  /* Wait until there are no group references anymore.  The fetch-or
> operation
> > --     injects us into the modification order of __g_refs; release MO
> ensures
> > --     that waiters incrementing __g_refs after our fetch-or see the
> previous
> > --     changes to __g_signals and to __g1_start that had to happen
> before we can
> > --     switch this G1 and alias with an older group (we have two groups=
,
> so
> > --     aliasing requires switching group roles twice).  Note that nobod=
y
> else
> > --     can have set the wake-request flag, so we do not have to act upo=
n
> it.
> > --
> > --     Also note that it is harmless if older waiters or waiters from
> this G1
> > --     get a group reference after we have quiesced the group because i=
t
> will
> > --     remain closed for them either because of the closed flag in
> __g_signals
> > --     or the later update to __g1_start.  New waiters will never arriv=
e
> here
> > --     but instead continue to go into the still current G2.  */
> > --  unsigned r =3D atomic_fetch_or_release (cond->__data.__g_refs + g1,=
 0);
> > --  while ((r >> 1) > 0)
> > --    {
> > --      for (unsigned int spin =3D maxspin; ((r >> 1) > 0) && (spin > 0=
);
> spin--)
> > --      {
> > --        /* TODO Back off.  */
> > --        r =3D atomic_load_relaxed (cond->__data.__g_refs + g1);
> > --      }
> > --      if ((r >> 1) > 0)
> > --      {
> > --        /* There is still a waiter after spinning.  Set the
> wake-request
> > --           flag and block.  Relaxed MO is fine because this is just
> about
> > --           this futex word.
> > --
> > --           Update r to include the set wake-request flag so that the
> upcoming
> > --           futex_wait only blocks if the flag is still set (otherwise=
,
> we'd
> > --           violate the basic client-side futex protocol).  */
> > --        r =3D atomic_fetch_or_relaxed (cond->__data.__g_refs + g1, 1)=
 |
> 1;
> > --
> > --        if ((r >> 1) > 0)
> > --          futex_wait_simple (cond->__data.__g_refs + g1, r, private);
> > --        /* Reload here so we eventually see the most recent value eve=
n
> if we
> > --           do not spin.   */
> > --        r =3D atomic_load_relaxed (cond->__data.__g_refs + g1);
> > --      }
> > --    }
> > --  /* Acquire MO so that we synchronize with the release operation tha=
t
> waiters
> > --     use to decrement __g_refs and thus happen after the waiters we
> waited
> > --     for.  */
> > --  atomic_thread_fence_acquire ();
> > -+     * Waiters in G1 will be closed out immediately by the advancing =
of
> > -+       __g_signals to the next "lowseq" (low 31 bits of the new
> g1_start),
> > -+       which will prevent waiters from blocking using a futex on
> > -+       __g_signals since it provides enough signals for all possible
> > -+       remaining waiters.  As a result, they can each consume a signa=
l
> > -+       and they will eventually remove their group reference.  */
> > -
> > -   /* Update __g1_start, which finishes closing this group.  The value
> we add
> > -      will never be negative because old_orig_size can only be zero
> when we
> > -      switch groups the first time after a condvar was initialized, in
> which
> > --     case G1 will be at index 1 and we will add a value of 1.  See
> above for
> > --     why this takes place after waiting for quiescence of the group.
> > -+     case G1 will be at index 1 and we will add a value of 1.
> > -      Relaxed MO is fine because the change comes with no additional
> > -      constraints that others would have to observe.  */
> > -   __condvar_add_g1_start_relaxed (cond,
> > -       (old_orig_size << 1) + (g1 =3D=3D 1 ? 1 : - 1));
> > -
> > --  /* Now reopen the group, thus enabling waiters to again block using
> the
> > --     futex controlled by __g_signals.  Release MO so that observers
> that see
> > --     no signals (and thus can block) also see the write __g1_start an=
d
> thus
> > --     that this is now a new group (see __pthread_cond_wait_common for
> the
> > --     matching acquire MO loads).  */
> > --  atomic_store_release (cond->__data.__g_signals + g1, 0);
> > --
> > -+  unsigned int lowseq =3D ((old_g1_start + old_orig_size) << 1) & ~1U=
;
> > -+
> > -+  /* If any waiters still hold group references (and thus could be
> blocked),
> > -+     then wake them all up now and prevent any running ones from
> blocking.
> > -+     This is effectively a catch-all for any possible current or futu=
re
> > -+     bugs that can allow the group size to reach 0 before all G1
> waiters
> > -+     have been awakened or at least given signals to consume, or any
> > -+     other case that can leave blocked (or about to block) older
> waiters..  */
> > -+  if ((atomic_fetch_or_release (cond->__data.__g_refs + g1, 0) >> 1) =
>
> 0)
> > -+   {
> > -+    /* First advance signals to the end of the group (i.e. enough
> signals
> > -+       for the entire G1 group) to ensure that waiters which have not
> > -+       yet blocked in the futex will not block.
> > -+       Note that in the vast majority of cases, this should never
> > -+       actually be necessary, since __g_signals will have enough
> > -+       signals for the remaining g_refs waiters.  As an optimization,
> > -+       we could check this first before proceeding, although that
> > -+       could still leave the potential for futex lost wakeup bugs
> > -+       if the signal count was non-zero but the futex wakeup
> > -+       was somehow lost.  */
> > -+    atomic_store_release (cond->__data.__g_signals + g1, lowseq);
> > -+
> > -+    futex_wake (cond->__data.__g_signals + g1, INT_MAX, private);
> > -+   }
> > -   /* At this point, the old G1 is now a valid new G2 (but not in use
> yet).
> > -      No old waiter can neither grab a signal nor acquire a reference
> without
> > -      noticing that __g1_start is larger.
> > -@@ -311,6 +271,10 @@ __condvar_quiesce_and_switch_g1 (pthread_cond_t
> *cond, uint64_t wseq,
> > -   g1 ^=3D 1;
> > -   *g1index ^=3D 1;
> > -
> > -+  /* Now advance the new G1 g_signals to the new lowseq, giving it
> > -+     an effective signal count of 0 to start.  */
> > -+  atomic_store_release (cond->__data.__g_signals + g1, lowseq);
> > -+
> > -   /* These values are just observed by signalers, and thus protected
> by the
> > -      lock.  */
> > -   unsigned int orig_size =3D wseq - (old_g1_start + old_orig_size);
> > -diff --git a/nptl/pthread_cond_wait.c b/nptl/pthread_cond_wait.c
> > -index 20c348a503..1cb3dbf7b0 100644
> > ---- a/nptl/pthread_cond_wait.c
> > -+++ b/nptl/pthread_cond_wait.c
> > -@@ -238,9 +238,7 @@ __condvar_cleanup_waiting (void *arg)
> > -    signaled), and a reference count.
> > -
> > -    The group reference count is used to maintain the number of waiter=
s
> that
> > --   are using the group's futex.  Before a group can change its role,
> the
> > --   reference count must show that no waiters are using the futex
> anymore; this
> > --   prevents ABA issues on the futex word.
> > -+   are using the group's futex.
> > -
> > -    To represent which intervals in the waiter sequence the groups
> cover (and
> > -    thus also which group slot contains G1 or G2), we use a 64b counte=
r
> to
> > -@@ -300,11 +298,12 @@ __condvar_cleanup_waiting (void *arg)
> > -        last reference.
> > -      * Reference count used by waiters concurrently with signalers
> that have
> > -        acquired the condvar-internal lock.
> > --   __g_signals: The number of signals that can still be consumed.
> > -+   __g_signals: The number of signals that can still be consumed,
> relative to
> > -+     the current g1_start.  (i.e. bits 31 to 1 of __g_signals are bit=
s
> > -+     31 to 1 of g1_start with the signal count added)
> > -      * Used as a futex word by waiters.  Used concurrently by waiters
> and
> > -        signalers.
> > --     * LSB is true iff this group has been completely signaled (i.e.,
> it is
> > --       closed).
> > -+     * LSB is currently reserved and 0.
> > -    __g_size: Waiters remaining in this group (i.e., which have not be=
en
> > -      signaled yet.
> > -      * Accessed by signalers and waiters that cancel waiting (both do
> so only
> > -@@ -328,18 +327,6 @@ __condvar_cleanup_waiting (void *arg)
> > -    sufficient because if a waiter can see a sufficiently large value,
> it could
> > -    have also consume a signal in the waiters group.
> > -
> > --   Waiters try to grab a signal from __g_signals without holding a
> reference
> > --   count, which can lead to stealing a signal from a more recent grou=
p
> after
> > --   their own group was already closed.  They cannot always detect
> whether they
> > --   in fact did because they do not know when they stole, but they can
> > --   conservatively add a signal back to the group they stole from; if
> they
> > --   did so unnecessarily, all that happens is a spurious wake-up.  To
> make this
> > --   even less likely, __g1_start contains the index of the current g2
> too,
> > --   which allows waiters to check if there aliasing on the group slots=
;
> if
> > --   there wasn't, they didn't steal from the current G1, which means
> that the
> > --   G1 they stole from must have been already closed and they do not
> need to
> > --   fix anything.
> > --
> > -    It is essential that the last field in pthread_cond_t is
> __g_signals[1]:
> > -    The previous condvar used a pointer-sized field in pthread_cond_t,
> so a
> > -    PTHREAD_COND_INITIALIZER from that condvar implementation might on=
ly
> > -@@ -435,6 +422,9 @@ __pthread_cond_wait_common (pthread_cond_t *cond,
> pthread_mutex_t *mutex,
> > -     {
> > -       while (1)
> > -       {
> > -+          uint64_t g1_start =3D __condvar_load_g1_start_relaxed (cond=
);
> > -+          unsigned int lowseq =3D (g1_start & 1) =3D=3D g ? signals :
> g1_start & ~1U;
> > -+
> > -         /* Spin-wait first.
> > -            Note that spinning first without checking whether a timeou=
t
> > -            passed might lead to what looks like a spurious wake-up ev=
en
> > -@@ -446,35 +436,45 @@ __pthread_cond_wait_common (pthread_cond_t *cond=
,
> pthread_mutex_t *mutex,
> > -            having to compare against the current time seems to be the
> right
> > -            choice from a performance perspective for most use cases.
> */
> > -         unsigned int spin =3D maxspin;
> > --        while (signals =3D=3D 0 && spin > 0)
> > -+        while (spin > 0 && ((int)(signals - lowseq) < 2))
> > -           {
> > -             /* Check that we are not spinning on a group that's alrea=
dy
> > -                closed.  */
> > --            if (seq < (__condvar_load_g1_start_relaxed (cond) >> 1))
> > --              goto done;
> > -+            if (seq < (g1_start >> 1))
> > -+              break;
> > -
> > -             /* TODO Back off.  */
> > -
> > -             /* Reload signals.  See above for MO.  */
> > -             signals =3D atomic_load_acquire (cond->__data.__g_signals=
 +
> g);
> > -+              g1_start =3D __condvar_load_g1_start_relaxed (cond);
> > -+              lowseq =3D (g1_start & 1) =3D=3D g ? signals : g1_start=
 & ~1U;
> > -             spin--;
> > -           }
> > -
> > --        /* If our group will be closed as indicated by the flag on
> signals,
> > --           don't bother grabbing a signal.  */
> > --        if (signals & 1)
> > --          goto done;
> > --
> > --        /* If there is an available signal, don't block.  */
> > --        if (signals !=3D 0)
> > -+          if (seq < (g1_start >> 1))
> > -+          {
> > -+              /* If the group is closed already,
> > -+               then this waiter originally had enough extra signals t=
o
> > -+               consume, up until the time its group was closed.  */
> > -+             goto done;
> > -+            }
> > -+
> > -+        /* If there is an available signal, don't block.
> > -+             If __g1_start has advanced at all, then we must be in G1
> > -+           by now, perhaps in the process of switching back to an old=
er
> > -+           G2, but in either case we're allowed to consume the
> available
> > -+           signal and should not block anymore.  */
> > -+        if ((int)(signals - lowseq) >=3D 2)
> > -           break;
> > -
> > -         /* No signals available after spinning, so prepare to block.
> > -            We first acquire a group reference and use acquire MO for
> that so
> > -            that we synchronize with the dummy read-modify-write in
> > -            __condvar_quiesce_and_switch_g1 if we read from that.  In
> turn,
> > --           in this case this will make us see the closed flag on
> __g_signals
> > --           that designates a concurrent attempt to reuse the group's
> slot.
> > -+           in this case this will make us see the advancement of
> __g_signals
> > -+           to the upcoming new g1_start that occurs with a concurrent
> > -+           attempt to reuse the group's slot.
> > -            We use acquire MO for the __g_signals check to make the
> > -            __g1_start check work (see spinning above).
> > -            Note that the group reference acquisition will not mask th=
e
> > -@@ -482,15 +482,24 @@ __pthread_cond_wait_common (pthread_cond_t *cond=
,
> pthread_mutex_t *mutex,
> > -            an atomic read-modify-write operation and thus extend the
> release
> > -            sequence.  */
> > -         atomic_fetch_add_acquire (cond->__data.__g_refs + g, 2);
> > --        if (((atomic_load_acquire (cond->__data.__g_signals + g) & 1)
> !=3D 0)
> > --            || (seq < (__condvar_load_g1_start_relaxed (cond) >> 1)))
> > -+        signals =3D atomic_load_acquire (cond->__data.__g_signals + g=
);
> > -+          g1_start =3D __condvar_load_g1_start_relaxed (cond);
> > -+          lowseq =3D (g1_start & 1) =3D=3D g ? signals : g1_start & ~=
1U;
> > -+
> > -+          if (seq < (g1_start >> 1))
> > -           {
> > --            /* Our group is closed.  Wake up any signalers that might
> be
> > --               waiting.  */
> > -+              /* group is closed already, so don't block */
> > -             __condvar_dec_grefs (cond, g, private);
> > -             goto done;
> > -           }
> > -
> > -+        if ((int)(signals - lowseq) >=3D 2)
> > -+          {
> > -+            /* a signal showed up or G1/G2 switched after we grabbed
> the refcount */
> > -+            __condvar_dec_grefs (cond, g, private);
> > -+            break;
> > -+            }
> > -+
> > -         // Now block.
> > -         struct _pthread_cleanup_buffer buffer;
> > -         struct _condvar_cleanup_buffer cbuffer;
> > -@@ -501,7 +510,7 @@ __pthread_cond_wait_common (pthread_cond_t *cond,
> pthread_mutex_t *mutex,
> > -         __pthread_cleanup_push (&buffer, __condvar_cleanup_waiting,
> &cbuffer);
> > -
> > -         err =3D __futex_abstimed_wait_cancelable64 (
> > --          cond->__data.__g_signals + g, 0, clockid, abstime, private)=
;
> > -+          cond->__data.__g_signals + g, signals, clockid, abstime,
> private);
> > -
> > -         __pthread_cleanup_pop (&buffer, 0);
> > -
> > -@@ -524,6 +533,8 @@ __pthread_cond_wait_common (pthread_cond_t *cond,
> pthread_mutex_t *mutex,
> > -         signals =3D atomic_load_acquire (cond->__data.__g_signals + g=
);
> > -       }
> > -
> > -+       if (seq < (__condvar_load_g1_start_relaxed (cond) >> 1))
> > -+       goto done;
> > -     }
> > -   /* Try to grab a signal.  Use acquire MO so that we see an
> up-to-date value
> > -      of __g1_start below (see spinning above for a similar case).  In
> > -@@ -532,69 +543,6 @@ __pthread_cond_wait_common (pthread_cond_t *cond,
> pthread_mutex_t *mutex,
> > -   while (!atomic_compare_exchange_weak_acquire
> (cond->__data.__g_signals + g,
> > -                                               &signals, signals - 2))=
;
> > -
> > --  /* We consumed a signal but we could have consumed from a more
> recent group
> > --     that aliased with ours due to being in the same group slot.  If
> this
> > --     might be the case our group must be closed as visible through
> > --     __g1_start.  */
> > --  uint64_t g1_start =3D __condvar_load_g1_start_relaxed (cond);
> > --  if (seq < (g1_start >> 1))
> > --    {
> > --      /* We potentially stole a signal from a more recent group but w=
e
> do not
> > --       know which group we really consumed from.
> > --       We do not care about groups older than current G1 because they
> are
> > --       closed; we could have stolen from these, but then we just add =
a
> > --       spurious wake-up for the current groups.
> > --       We will never steal a signal from current G2 that was really
> intended
> > --       for G2 because G2 never receives signals (until it becomes
> G1).  We
> > --       could have stolen a signal from G2 that was conservatively
> added by a
> > --       previous waiter that also thought it stole a signal -- but
> given that
> > --       that signal was added unnecessarily, it's not a problem if we
> steal
> > --       it.
> > --       Thus, the remaining case is that we could have stolen from the
> current
> > --       G1, where "current" means the __g1_start value we observed.
> However,
> > --       if the current G1 does not have the same slot index as we do,
> we did
> > --       not steal from it and do not need to undo that.  This is the
> reason
> > --       for putting a bit with G2's index into__g1_start as well.  */
> > --      if (((g1_start & 1) ^ 1) =3D=3D g)
> > --      {
> > --        /* We have to conservatively undo our potential mistake of
> stealing
> > --           a signal.  We can stop trying to do that when the current =
G1
> > --           changes because other spinning waiters will notice this to=
o
> and
> > --           __condvar_quiesce_and_switch_g1 has checked that there are
> no
> > --           futex waiters anymore before switching G1.
> > --           Relaxed MO is fine for the __g1_start load because we need
> to
> > --           merely be able to observe this fact and not have to observ=
e
> > --           something else as well.
> > --           ??? Would it help to spin for a little while to see whethe=
r
> the
> > --           current G1 gets closed?  This might be worthwhile if the
> group is
> > --           small or close to being closed.  */
> > --        unsigned int s =3D atomic_load_relaxed (cond->__data.__g_sign=
als
> + g);
> > --        while (__condvar_load_g1_start_relaxed (cond) =3D=3D g1_start=
)
> > --          {
> > --            /* Try to add a signal.  We don't need to acquire the loc=
k
> > --               because at worst we can cause a spurious wake-up.  If
> the
> > --               group is in the process of being closed (LSB is true),
> this
> > --               has an effect similar to us adding a signal.  */
> > --            if (((s & 1) !=3D 0)
> > --                || atomic_compare_exchange_weak_relaxed
> > --                     (cond->__data.__g_signals + g, &s, s + 2))
> > --              {
> > --                /* If we added a signal, we also need to add a wake-u=
p
> on
> > --                   the futex.  We also need to do that if we skipped
> adding
> > --                   a signal because the group is being closed because
> > --                   while __condvar_quiesce_and_switch_g1 could have
> closed
> > --                   the group, it might stil be waiting for futex
> waiters to
> > --                   leave (and one of those waiters might be the one w=
e
> stole
> > --                   the signal from, which cause it to block using the
> > --                   futex).  */
> > --                futex_wake (cond->__data.__g_signals + g, 1, private)=
;
> > --                break;
> > --              }
> > --            /* TODO Back off.  */
> > --          }
> > --      }
> > --    }
> > --
> > -  done:
> > -
> > -   /* Confirm that we have been woken.  We do that before acquiring th=
e
> mutex
> > ---
> > -2.49.0
> > -
> > diff --git a/meta/recipes-core/glibc/glibc/0026-PR25847-2.patch
> b/meta/recipes-core/glibc/glibc/0026-PR25847-2.patch
> > deleted file mode 100644
> > index cb89431769..0000000000
> > --- a/meta/recipes-core/glibc/glibc/0026-PR25847-2.patch
> > +++ /dev/null
> > @@ -1,144 +0,0 @@
> > -From 6aab1191e35a3da66e8c49d95178a9d77c119a1f Mon Sep 17 00:00:00 2001
> > -From: Malte Skarupke <malteskarupke@fastmail.fm>
> > -Date: Mon, 16 Jun 2025 23:17:53 -0700
> > -Subject: [PATCH] nptl: Update comments and indentation for new condvar
> > - implementation
> > -
> > -Some comments were wrong after the most recent commit. This fixes that=
.
> > -Also fixing indentation where it was using spaces instead of tabs.
> > -
> > -The following commits have been cherry-picked from Glibc master branch=
:
> > -Bug : https://sourceware.org/bugzilla/show_bug.cgi?id=3D25847
> > -
> > -Upstream-Status: Backport
> > -[
> https://sourceware.org/git/?p=3Dglibc.git;a=3Dcommit;h=3D0cc973160c23bb67=
f895bc887dd6942d29f8fee3
> ]
> > -
> > -Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
> > ----
> > - nptl/pthread_cond_common.c |  5 +++--
> > - nptl/pthread_cond_wait.c   | 39 +++++++++++++++++++------------------=
-
> > - 2 files changed, 22 insertions(+), 22 deletions(-)
> > -
> > -diff --git a/nptl/pthread_cond_common.c b/nptl/pthread_cond_common.c
> > -index 8dd7037923..306a207dd6 100644
> > ---- a/nptl/pthread_cond_common.c
> > -+++ b/nptl/pthread_cond_common.c
> > -@@ -221,8 +221,9 @@ __condvar_quiesce_and_switch_g1 (pthread_cond_t
> *cond, uint64_t wseq,
> > -      * New waiters arriving concurrently with the group switching wil=
l
> all go
> > -        into G2 until we atomically make the switch.  Waiters existing
> in G2
> > -        are not affected.
> > --     * Waiters in G1 will be closed out immediately by the advancing =
of
> > --       __g_signals to the next "lowseq" (low 31 bits of the new
> g1_start),
> > -+     * Waiters in G1 have already received a signal and been woken. I=
f
> they
> > -+       haven't woken yet, they will be closed out immediately by the
> advancing
> > -+       of __g_signals to the next "lowseq" (low 31 bits of the new
> g1_start),
> > -        which will prevent waiters from blocking using a futex on
> > -        __g_signals since it provides enough signals for all possible
> > -        remaining waiters.  As a result, they can each consume a signa=
l
> > -diff --git a/nptl/pthread_cond_wait.c b/nptl/pthread_cond_wait.c
> > -index 1cb3dbf7b0..cee1968756 100644
> > ---- a/nptl/pthread_cond_wait.c
> > -+++ b/nptl/pthread_cond_wait.c
> > -@@ -249,7 +249,7 @@ __condvar_cleanup_waiting (void *arg)
> > -    figure out whether they are in a group that has already been
> completely
> > -    signaled (i.e., if the current G1 starts at a later position that
> the
> > -    waiter's position).  Waiters cannot determine whether they are
> currently
> > --   in G2 or G1 -- but they do not have too because all they are
> interested in
> > -+   in G2 or G1 -- but they do not have to because all they are
> interested in
> > -    is whether there are available signals, and they always start in G=
2
> (whose
> > -    group slot they know because of the bit in the waiter sequence.
> Signalers
> > -    will simply fill the right group until it is completely signaled
> and can
> > -@@ -412,7 +412,7 @@ __pthread_cond_wait_common (pthread_cond_t *cond,
> pthread_mutex_t *mutex,
> > -     }
> > -
> > -   /* Now wait until a signal is available in our group or it is close=
d.
> > --     Acquire MO so that if we observe a value of zero written after
> group
> > -+     Acquire MO so that if we observe (signals =3D=3D lowseq) after g=
roup
> > -      switching in __condvar_quiesce_and_switch_g1, we synchronize wit=
h
> that
> > -      store and will see the prior update of __g1_start done while
> switching
> > -      groups too.  */
> > -@@ -422,8 +422,8 @@ __pthread_cond_wait_common (pthread_cond_t *cond,
> pthread_mutex_t *mutex,
> > -     {
> > -       while (1)
> > -       {
> > --          uint64_t g1_start =3D __condvar_load_g1_start_relaxed (cond=
);
> > --          unsigned int lowseq =3D (g1_start & 1) =3D=3D g ? signals :
> g1_start & ~1U;
> > -+        uint64_t g1_start =3D __condvar_load_g1_start_relaxed (cond);
> > -+        unsigned int lowseq =3D (g1_start & 1) =3D=3D g ? signals : g=
1_start
> & ~1U;
> > -
> > -         /* Spin-wait first.
> > -            Note that spinning first without checking whether a timeou=
t
> > -@@ -447,21 +447,21 @@ __pthread_cond_wait_common (pthread_cond_t *cond=
,
> pthread_mutex_t *mutex,
> > -
> > -             /* Reload signals.  See above for MO.  */
> > -             signals =3D atomic_load_acquire (cond->__data.__g_signals=
 +
> g);
> > --              g1_start =3D __condvar_load_g1_start_relaxed (cond);
> > --              lowseq =3D (g1_start & 1) =3D=3D g ? signals : g1_start=
 & ~1U;
> > -+            g1_start =3D __condvar_load_g1_start_relaxed (cond);
> > -+            lowseq =3D (g1_start & 1) =3D=3D g ? signals : g1_start &=
 ~1U;
> > -             spin--;
> > -           }
> > -
> > --          if (seq < (g1_start >> 1))
> > -+        if (seq < (g1_start >> 1))
> > -           {
> > --              /* If the group is closed already,
> > -+            /* If the group is closed already,
> > -                then this waiter originally had enough extra signals t=
o
> > -                consume, up until the time its group was closed.  */
> > -              goto done;
> > --            }
> > -+          }
> > -
> > -         /* If there is an available signal, don't block.
> > --             If __g1_start has advanced at all, then we must be in G1
> > -+           If __g1_start has advanced at all, then we must be in G1
> > -            by now, perhaps in the process of switching back to an old=
er
> > -            G2, but in either case we're allowed to consume the
> available
> > -            signal and should not block anymore.  */
> > -@@ -483,22 +483,23 @@ __pthread_cond_wait_common (pthread_cond_t *cond=
,
> pthread_mutex_t *mutex,
> > -            sequence.  */
> > -         atomic_fetch_add_acquire (cond->__data.__g_refs + g, 2);
> > -         signals =3D atomic_load_acquire (cond->__data.__g_signals + g=
);
> > --          g1_start =3D __condvar_load_g1_start_relaxed (cond);
> > --          lowseq =3D (g1_start & 1) =3D=3D g ? signals : g1_start & ~=
1U;
> > -+        g1_start =3D __condvar_load_g1_start_relaxed (cond);
> > -+        lowseq =3D (g1_start & 1) =3D=3D g ? signals : g1_start & ~1U=
;
> > -
> > --          if (seq < (g1_start >> 1))
> > -+        if (seq < (g1_start >> 1))
> > -           {
> > --              /* group is closed already, so don't block */
> > -+            /* group is closed already, so don't block */
> > -             __condvar_dec_grefs (cond, g, private);
> > -             goto done;
> > -           }
> > -
> > -         if ((int)(signals - lowseq) >=3D 2)
> > -           {
> > --            /* a signal showed up or G1/G2 switched after we grabbed
> the refcount */
> > -+            /* a signal showed up or G1/G2 switched after we grabbed
> the
> > -+               refcount */
> > -             __condvar_dec_grefs (cond, g, private);
> > -             break;
> > --            }
> > -+          }
> > -
> > -         // Now block.
> > -         struct _pthread_cleanup_buffer buffer;
> > -@@ -536,10 +537,8 @@ __pthread_cond_wait_common (pthread_cond_t *cond,
> pthread_mutex_t *mutex,
> > -        if (seq < (__condvar_load_g1_start_relaxed (cond) >> 1))
> > -        goto done;
> > -     }
> > --  /* Try to grab a signal.  Use acquire MO so that we see an
> up-to-date value
> > --     of __g1_start below (see spinning above for a similar case).  In
> > --     particular, if we steal from a more recent group, we will also
> see a
> > --     more recent __g1_start below.  */
> > -+  /* Try to grab a signal.  See above for MO.  (if we do another loop
> > -+     iteration we need to see the correct value of g1_start)  */
> > -   while (!atomic_compare_exchange_weak_acquire
> (cond->__data.__g_signals + g,
> > -                                               &signals, signals - 2))=
;
> > -
> > ---
> > -2.49.0
> > -
> > diff --git a/meta/recipes-core/glibc/glibc/0026-PR25847-3.patch
> b/meta/recipes-core/glibc/glibc/0026-PR25847-3.patch
> > deleted file mode 100644
> > index 4cfcca846c..0000000000
> > --- a/meta/recipes-core/glibc/glibc/0026-PR25847-3.patch
> > +++ /dev/null
> > @@ -1,77 +0,0 @@
> > -From 28a5082045429fdc5a4744d45fdc5b5202528eaa Mon Sep 17 00:00:00 2001
> > -From: Malte Skarupke <malteskarupke@fastmail.fm>
> > -Date: Mon, 16 Jun 2025 23:29:49 -0700
> > -Subject: [PATCH] nptl: Remove unnecessary catch-all-wake in condvar
> group
> > - switch
> > -
> > -This wake is unnecessary. We only switch groups after every sleeper in
> a group
> > -has been woken. Sure, they may take a while to actually wake up and ma=
y
> still
> > -hold a reference, but waking them a second time doesn't speed that up.
> Instead
> > -this just makes the code more complicated and may hide problems.
> > -
> > -In particular this safety wake wouldn't even have helped with the bug
> that was
> > -fixed by Barrus' patch: The bug there was that pthread_cond_signal
> would not
> > -switch g1 when it should, so we wouldn't even have entered this code
> path.
> > -
> > -The following commits have been cherry-picked from Glibc master branch=
:
> > -Bug : https://sourceware.org/bugzilla/show_bug.cgi?id=3D25847
> > -
> > -Upstream-Status: Backport
> > -[
> https://sourceware.org/git/?p=3Dglibc.git;a=3Dcommit;h=3Db42cc6af11062c26=
0c7dfa91f1c89891366fed3e
> ]
> > -
> > -Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
> > ----
> > - nptl/pthread_cond_common.c | 30 +-----------------------------
> > - 1 file changed, 1 insertion(+), 29 deletions(-)
> > -
> > -diff --git a/nptl/pthread_cond_common.c b/nptl/pthread_cond_common.c
> > -index 306a207dd6..f976a533a1 100644
> > ---- a/nptl/pthread_cond_common.c
> > -+++ b/nptl/pthread_cond_common.c
> > -@@ -221,13 +221,7 @@ __condvar_quiesce_and_switch_g1 (pthread_cond_t
> *cond, uint64_t wseq,
> > -      * New waiters arriving concurrently with the group switching wil=
l
> all go
> > -        into G2 until we atomically make the switch.  Waiters existing
> in G2
> > -        are not affected.
> > --     * Waiters in G1 have already received a signal and been woken. I=
f
> they
> > --       haven't woken yet, they will be closed out immediately by the
> advancing
> > --       of __g_signals to the next "lowseq" (low 31 bits of the new
> g1_start),
> > --       which will prevent waiters from blocking using a futex on
> > --       __g_signals since it provides enough signals for all possible
> > --       remaining waiters.  As a result, they can each consume a signa=
l
> > --       and they will eventually remove their group reference.  */
> > -+     * Waiters in G1 have already received a signal and been woken.  =
*/
> > -
> > -   /* Update __g1_start, which finishes closing this group.  The value
> we add
> > -      will never be negative because old_orig_size can only be zero
> when we
> > -@@ -240,28 +234,6 @@ __condvar_quiesce_and_switch_g1 (pthread_cond_t
> *cond, uint64_t wseq,
> > -
> > -   unsigned int lowseq =3D ((old_g1_start + old_orig_size) << 1) & ~1U=
;
> > -
> > --  /* If any waiters still hold group references (and thus could be
> blocked),
> > --     then wake them all up now and prevent any running ones from
> blocking.
> > --     This is effectively a catch-all for any possible current or futu=
re
> > --     bugs that can allow the group size to reach 0 before all G1
> waiters
> > --     have been awakened or at least given signals to consume, or any
> > --     other case that can leave blocked (or about to block) older
> waiters..  */
> > --  if ((atomic_fetch_or_release (cond->__data.__g_refs + g1, 0) >> 1) =
>
> 0)
> > --   {
> > --    /* First advance signals to the end of the group (i.e. enough
> signals
> > --       for the entire G1 group) to ensure that waiters which have not
> > --       yet blocked in the futex will not block.
> > --       Note that in the vast majority of cases, this should never
> > --       actually be necessary, since __g_signals will have enough
> > --       signals for the remaining g_refs waiters.  As an optimization,
> > --       we could check this first before proceeding, although that
> > --       could still leave the potential for futex lost wakeup bugs
> > --       if the signal count was non-zero but the futex wakeup
> > --       was somehow lost.  */
> > --    atomic_store_release (cond->__data.__g_signals + g1, lowseq);
> > --
> > --    futex_wake (cond->__data.__g_signals + g1, INT_MAX, private);
> > --   }
> > -   /* At this point, the old G1 is now a valid new G2 (but not in use
> yet).
> > -      No old waiter can neither grab a signal nor acquire a reference
> without
> > -      noticing that __g1_start is larger.
> > ---
> > -2.49.0
> > -
> > diff --git a/meta/recipes-core/glibc/glibc/0026-PR25847-4.patch
> b/meta/recipes-core/glibc/glibc/0026-PR25847-4.patch
> > deleted file mode 100644
> > index f8674d62ae..0000000000
> > --- a/meta/recipes-core/glibc/glibc/0026-PR25847-4.patch
> > +++ /dev/null
> > @@ -1,117 +0,0 @@
> > -From 16b9af737c77b153fca4f36cbdbe94f7416c0b42 Mon Sep 17 00:00:00 2001
> > -From: Malte Skarupke <malteskarupke@fastmail.fm>
> > -Date: Mon, 16 Jun 2025 23:38:40 -0700
> > -Subject: [PATCH] nptl: Remove unnecessary quadruple check in
> pthread_cond_wait
> > -
> > -pthread_cond_wait was checking whether it was in a closed group no les=
s
> than
> > -four times. Checking once is enough. Here are the four checks:
> > -
> > -1. While spin-waiting. This was dead code: maxspin is set to 0 and has
> been
> > -   for years.
> > -2. Before deciding to go to sleep, and before incrementing grefs: I
> kept this
> > -3. After incrementing grefs. There is no reason to think that the grou=
p
> would
> > -   close while we do an atomic increment. Obviously it could close at
> any
> > -   point, but that doesn't mean we have to recheck after every step.
> This
> > -   check was equally good as check 2, except it has to do more work.
> > -4. When we find ourselves in a group that has a signal. We only get
> here after
> > -   we check that we're not in a closed group. There is no need to chec=
k
> again.
> > -   The check would only have helped in cases where the compare_exchang=
e
> in the
> > -   next line would also have failed. Relying on the compare_exchange i=
s
> fine.
> > -
> > -Removing the duplicate checks clarifies the code.
> > -
> > -The following commits have been cherry-picked from Glibc master branch=
:
> > -Bug : https://sourceware.org/bugzilla/show_bug.cgi?id=3D25847
> > -
> > -Upstream-Status: Backport
> > -[
> https://sourceware.org/git/?p=3Dglibc.git;a=3Dcommit;h=3D4f7b051f8ee3feff=
1b53b27a906f245afaa9cee1
> ]
> > -
> > -Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
> > ----
> > - nptl/pthread_cond_wait.c | 49 ---------------------------------------=
-
> > - 1 file changed, 49 deletions(-)
> > -
> > -diff --git a/nptl/pthread_cond_wait.c b/nptl/pthread_cond_wait.c
> > -index cee1968756..47e834cade 100644
> > ---- a/nptl/pthread_cond_wait.c
> > -+++ b/nptl/pthread_cond_wait.c
> > -@@ -366,7 +366,6 @@ static __always_inline int
> > - __pthread_cond_wait_common (pthread_cond_t *cond, pthread_mutex_t
> *mutex,
> > -     clockid_t clockid, const struct __timespec64 *abstime)
> > - {
> > --  const int maxspin =3D 0;
> > -   int err;
> > -   int result =3D 0;
> > -
> > -@@ -425,33 +424,6 @@ __pthread_cond_wait_common (pthread_cond_t *cond,
> pthread_mutex_t *mutex,
> > -         uint64_t g1_start =3D __condvar_load_g1_start_relaxed (cond);
> > -         unsigned int lowseq =3D (g1_start & 1) =3D=3D g ? signals : g=
1_start
> & ~1U;
> > -
> > --        /* Spin-wait first.
> > --           Note that spinning first without checking whether a timeou=
t
> > --           passed might lead to what looks like a spurious wake-up ev=
en
> > --           though we should return ETIMEDOUT (e.g., if the caller
> provides
> > --           an absolute timeout that is clearly in the past).  However=
,
> > --           (1) spurious wake-ups are allowed, (2) it seems unlikely
> that a
> > --           user will (ab)use pthread_cond_wait as a check for whether=
 a
> > --           point in time is in the past, and (3) spinning first witho=
ut
> > --           having to compare against the current time seems to be the
> right
> > --           choice from a performance perspective for most use cases.
> */
> > --        unsigned int spin =3D maxspin;
> > --        while (spin > 0 && ((int)(signals - lowseq) < 2))
> > --          {
> > --            /* Check that we are not spinning on a group that's alrea=
dy
> > --               closed.  */
> > --            if (seq < (g1_start >> 1))
> > --              break;
> > --
> > --            /* TODO Back off.  */
> > --
> > --            /* Reload signals.  See above for MO.  */
> > --            signals =3D atomic_load_acquire (cond->__data.__g_signals=
 +
> g);
> > --            g1_start =3D __condvar_load_g1_start_relaxed (cond);
> > --            lowseq =3D (g1_start & 1) =3D=3D g ? signals : g1_start &=
 ~1U;
> > --            spin--;
> > --          }
> > --
> > -         if (seq < (g1_start >> 1))
> > -           {
> > -             /* If the group is closed already,
> > -@@ -482,24 +454,6 @@ __pthread_cond_wait_common (pthread_cond_t *cond,
> pthread_mutex_t *mutex,
> > -            an atomic read-modify-write operation and thus extend the
> release
> > -            sequence.  */
> > -         atomic_fetch_add_acquire (cond->__data.__g_refs + g, 2);
> > --        signals =3D atomic_load_acquire (cond->__data.__g_signals + g=
);
> > --        g1_start =3D __condvar_load_g1_start_relaxed (cond);
> > --        lowseq =3D (g1_start & 1) =3D=3D g ? signals : g1_start & ~1U=
;
> > --
> > --        if (seq < (g1_start >> 1))
> > --          {
> > --            /* group is closed already, so don't block */
> > --            __condvar_dec_grefs (cond, g, private);
> > --            goto done;
> > --          }
> > --
> > --        if ((int)(signals - lowseq) >=3D 2)
> > --          {
> > --            /* a signal showed up or G1/G2 switched after we grabbed
> the
> > --               refcount */
> > --            __condvar_dec_grefs (cond, g, private);
> > --            break;
> > --          }
> > -
> > -         // Now block.
> > -         struct _pthread_cleanup_buffer buffer;
> > -@@ -533,9 +487,6 @@ __pthread_cond_wait_common (pthread_cond_t *cond,
> pthread_mutex_t *mutex,
> > -         /* Reload signals.  See above for MO.  */
> > -         signals =3D atomic_load_acquire (cond->__data.__g_signals + g=
);
> > -       }
> > --
> > --       if (seq < (__condvar_load_g1_start_relaxed (cond) >> 1))
> > --       goto done;
> > -     }
> > -   /* Try to grab a signal.  See above for MO.  (if we do another loop
> > -      iteration we need to see the correct value of g1_start)  */
> > ---
> > -2.49.0
> > -
> > diff --git a/meta/recipes-core/glibc/glibc/0026-PR25847-5.patch
> b/meta/recipes-core/glibc/glibc/0026-PR25847-5.patch
> > deleted file mode 100644
> > index 16fe6f8460..0000000000
> > --- a/meta/recipes-core/glibc/glibc/0026-PR25847-5.patch
> > +++ /dev/null
> > @@ -1,105 +0,0 @@
> > -From d9ffb50dc55f77e584a5d0275eea758c7a6b04e3 Mon Sep 17 00:00:00 2001
> > -From: Malte Skarupke <malteskarupke@fastmail.fm>
> > -Date: Mon, 16 Jun 2025 23:53:35 -0700
> > -Subject: [PATCH] nptl: Use a single loop in pthread_cond_wait instaed
> of a
> > - nested loop
> > -
> > -The loop was a little more complicated than necessary. There was only
> one
> > -break statement out of the inner loop, and the outer loop was nearly
> empty.
> > -So just remove the outer loop, moving its code to the one break
> statement in
> > -the inner loop. This allows us to replace all gotos with break
> statements.
> > -
> > -The following commits have been cherry-picked from Glibc master branch=
:
> > -Bug : https://sourceware.org/bugzilla/show_bug.cgi?id=3D25847
> > -
> > -Upstream-Status: Backport
> > -[
> https://sourceware.org/git/?p=3Dglibc.git;a=3Dcommit;h=3D929a4764ac903826=
16b6a21f099192b2475da674
> ]
> > -
> > -Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
> > ----
> > - nptl/pthread_cond_wait.c | 41 +++++++++++++++++++--------------------=
-
> > - 1 file changed, 19 insertions(+), 22 deletions(-)
> > -
> > -diff --git a/nptl/pthread_cond_wait.c b/nptl/pthread_cond_wait.c
> > -index 47e834cade..5c86880105 100644
> > ---- a/nptl/pthread_cond_wait.c
> > -+++ b/nptl/pthread_cond_wait.c
> > -@@ -410,17 +410,15 @@ __pthread_cond_wait_common (pthread_cond_t *cond=
,
> pthread_mutex_t *mutex,
> > -       return err;
> > -     }
> > -
> > --  /* Now wait until a signal is available in our group or it is close=
d.
> > --     Acquire MO so that if we observe (signals =3D=3D lowseq) after g=
roup
> > --     switching in __condvar_quiesce_and_switch_g1, we synchronize wit=
h
> that
> > --     store and will see the prior update of __g1_start done while
> switching
> > --     groups too.  */
> > --  unsigned int signals =3D atomic_load_acquire (cond->__data.__g_sign=
als
> + g);
> > --
> > --  do
> > --    {
> > -+
> > -       while (1)
> > -       {
> > -+        /* Now wait until a signal is available in our group or it is
> closed.
> > -+           Acquire MO so that if we observe (signals =3D=3D lowseq) a=
fter
> group
> > -+           switching in __condvar_quiesce_and_switch_g1, we
> synchronize with that
> > -+           store and will see the prior update of __g1_start done
> while switching
> > -+           groups too.  */
> > -+        unsigned int signals =3D atomic_load_acquire
> (cond->__data.__g_signals + g);
> > -         uint64_t g1_start =3D __condvar_load_g1_start_relaxed (cond);
> > -         unsigned int lowseq =3D (g1_start & 1) =3D=3D g ? signals : g=
1_start
> & ~1U;
> > -
> > -@@ -429,7 +427,7 @@ __pthread_cond_wait_common (pthread_cond_t *cond,
> pthread_mutex_t *mutex,
> > -             /* If the group is closed already,
> > -                then this waiter originally had enough extra signals t=
o
> > -                consume, up until the time its group was closed.  */
> > --             goto done;
> > -+             break;
> > -           }
> > -
> > -         /* If there is an available signal, don't block.
> > -@@ -438,8 +436,16 @@ __pthread_cond_wait_common (pthread_cond_t *cond,
> pthread_mutex_t *mutex,
> > -            G2, but in either case we're allowed to consume the
> available
> > -            signal and should not block anymore.  */
> > -         if ((int)(signals - lowseq) >=3D 2)
> > --          break;
> > --
> > -+           {
> > -+             /* Try to grab a signal.  See above for MO.  (if we do
> another loop
> > -+                iteration we need to see the correct value of
> g1_start)  */
> > -+                     if (atomic_compare_exchange_weak_acquire (
> > -+                               cond->__data.__g_signals + g,
> > -+                       &signals, signals - 2))
> > -+                       break;
> > -+                     else
> > -+                       continue;
> > -+           }
> > -         /* No signals available after spinning, so prepare to block.
> > -            We first acquire a group reference and use acquire MO for
> that so
> > -            that we synchronize with the dummy read-modify-write in
> > -@@ -479,21 +485,12 @@ __pthread_cond_wait_common (pthread_cond_t *cond=
,
> pthread_mutex_t *mutex,
> > -                the lock during cancellation is not possible.  */
> > -             __condvar_cancel_waiting (cond, seq, g, private);
> > -             result =3D err;
> > --            goto done;
> > -+            break;
> > -           }
> > -         else
> > -           __condvar_dec_grefs (cond, g, private);
> > -
> > --        /* Reload signals.  See above for MO.  */
> > --        signals =3D atomic_load_acquire (cond->__data.__g_signals + g=
);
> > -       }
> > --    }
> > --  /* Try to grab a signal.  See above for MO.  (if we do another loop
> > --     iteration we need to see the correct value of g1_start)  */
> > --  while (!atomic_compare_exchange_weak_acquire
> (cond->__data.__g_signals + g,
> > --                                              &signals, signals - 2))=
;
> > --
> > -- done:
> > -
> > -   /* Confirm that we have been woken.  We do that before acquiring th=
e
> mutex
> > -      to allow for execution of pthread_cond_destroy while having
> acquired the
> > ---
> > -2.49.0
> > -
> > diff --git a/meta/recipes-core/glibc/glibc/0026-PR25847-6.patch
> b/meta/recipes-core/glibc/glibc/0026-PR25847-6.patch
> > deleted file mode 100644
> > index cf87e21ddd..0000000000
> > --- a/meta/recipes-core/glibc/glibc/0026-PR25847-6.patch
> > +++ /dev/null
> > @@ -1,169 +0,0 @@
> > -From a2faee6d0dac6e5232255da9afda4d9ed6cfb6e5 Mon Sep 17 00:00:00 2001
> > -From: Malte Skarupke <malteskarupke@fastmail.fm>
> > -Date: Tue, 17 Jun 2025 01:37:12 -0700
> > -Subject: [PATCH] nptl: Fix indentation
> > -
> > -In my previous change I turned a nested loop into a simple loop. I'm
> doing
> > -the resulting indentation changes in a separate commit to make the dif=
f
> on
> > -the previous commit easier to review.
> > -
> > -The following commits have been cherry-picked from Glibc master branch=
:
> > -Bug : https://sourceware.org/bugzilla/show_bug.cgi?id=3D25847
> > -
> > -Upstream-Status: Backport
> > -[
> https://sourceware.org/git/?p=3Dglibc.git;a=3Dcommit;h=3Dee6c14ed59d48072=
0721aaacc5fb03213dc153da
> ]
> > -
> > -Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
> > ----
> > - nptl/pthread_cond_wait.c | 132 ++++++++++++++++----------------------=
-
> > - 1 file changed, 54 insertions(+), 78 deletions(-)
> > -
> > -diff --git a/nptl/pthread_cond_wait.c b/nptl/pthread_cond_wait.c
> > -index 5c86880105..104ebd48ca 100644
> > ---- a/nptl/pthread_cond_wait.c
> > -+++ b/nptl/pthread_cond_wait.c
> > -@@ -410,87 +410,63 @@ __pthread_cond_wait_common (pthread_cond_t *cond=
,
> pthread_mutex_t *mutex,
> > -       return err;
> > -     }
> > -
> > --
> > --      while (1)
> > --      {
> > --        /* Now wait until a signal is available in our group or it is
> closed.
> > --           Acquire MO so that if we observe (signals =3D=3D lowseq) a=
fter
> group
> > --           switching in __condvar_quiesce_and_switch_g1, we
> synchronize with that
> > --           store and will see the prior update of __g1_start done
> while switching
> > --           groups too.  */
> > --        unsigned int signals =3D atomic_load_acquire
> (cond->__data.__g_signals + g);
> > --        uint64_t g1_start =3D __condvar_load_g1_start_relaxed (cond);
> > --        unsigned int lowseq =3D (g1_start & 1) =3D=3D g ? signals : g=
1_start
> & ~1U;
> > --
> > --        if (seq < (g1_start >> 1))
> > --          {
> > --            /* If the group is closed already,
> > --               then this waiter originally had enough extra signals t=
o
> > --               consume, up until the time its group was closed.  */
> > --             break;
> > --          }
> > --
> > --        /* If there is an available signal, don't block.
> > --           If __g1_start has advanced at all, then we must be in G1
> > --           by now, perhaps in the process of switching back to an old=
er
> > --           G2, but in either case we're allowed to consume the
> available
> > --           signal and should not block anymore.  */
> > --        if ((int)(signals - lowseq) >=3D 2)
> > --           {
> > --             /* Try to grab a signal.  See above for MO.  (if we do
> another loop
> > --                iteration we need to see the correct value of
> g1_start)  */
> > --                     if (atomic_compare_exchange_weak_acquire (
> > --                               cond->__data.__g_signals + g,
> > -+  while (1)
> > -+    {
> > -+      /* Now wait until a signal is available in our group or it is
> closed.
> > -+         Acquire MO so that if we observe (signals =3D=3D lowseq) aft=
er
> group
> > -+         switching in __condvar_quiesce_and_switch_g1, we synchronize
> with that
> > -+         store and will see the prior update of __g1_start done while
> switching
> > -+         groups too.  */
> > -+      unsigned int signals =3D atomic_load_acquire
> (cond->__data.__g_signals + g);
> > -+      uint64_t g1_start =3D __condvar_load_g1_start_relaxed (cond);
> > -+      unsigned int lowseq =3D (g1_start & 1) =3D=3D g ? signals : g1_=
start &
> ~1U;
> > -+
> > -+      if (seq < (g1_start >> 1))
> > -+        {
> > -+          /* If the group is closed already,
> > -+             then this waiter originally had enough extra signals to
> > -+             consume, up until the time its group was closed.  */
> > -+           break;
> > -+        }
> > -+
> > -+      /* If there is an available signal, don't block.
> > -+         If __g1_start has advanced at all, then we must be in G1
> > -+         by now, perhaps in the process of switching back to an older
> > -+         G2, but in either case we're allowed to consume the availabl=
e
> > -+         signal and should not block anymore.  */
> > -+      if ((int)(signals - lowseq) >=3D 2)
> > -+        {
> > -+         /* Try to grab a signal.  See above for MO.  (if we do
> another loop
> > -+            iteration we need to see the correct value of g1_start)  =
*/
> > -+           if (atomic_compare_exchange_weak_acquire (
> > -+                       cond->__data.__g_signals + g,
> > -                        &signals, signals - 2))
> > --                       break;
> > --                     else
> > --                       continue;
> > --           }
> > --        /* No signals available after spinning, so prepare to block.
> > --           We first acquire a group reference and use acquire MO for
> that so
> > --           that we synchronize with the dummy read-modify-write in
> > --           __condvar_quiesce_and_switch_g1 if we read from that.  In
> turn,
> > --           in this case this will make us see the advancement of
> __g_signals
> > --           to the upcoming new g1_start that occurs with a concurrent
> > --           attempt to reuse the group's slot.
> > --           We use acquire MO for the __g_signals check to make the
> > --           __g1_start check work (see spinning above).
> > --           Note that the group reference acquisition will not mask th=
e
> > --           release MO when decrementing the reference count because w=
e
> use
> > --           an atomic read-modify-write operation and thus extend the
> release
> > --           sequence.  */
> > --        atomic_fetch_add_acquire (cond->__data.__g_refs + g, 2);
> > --
> > --        // Now block.
> > --        struct _pthread_cleanup_buffer buffer;
> > --        struct _condvar_cleanup_buffer cbuffer;
> > --        cbuffer.wseq =3D wseq;
> > --        cbuffer.cond =3D cond;
> > --        cbuffer.mutex =3D mutex;
> > --        cbuffer.private =3D private;
> > --        __pthread_cleanup_push (&buffer, __condvar_cleanup_waiting,
> &cbuffer);
> > --
> > --        err =3D __futex_abstimed_wait_cancelable64 (
> > --          cond->__data.__g_signals + g, signals, clockid, abstime,
> private);
> > --
> > --        __pthread_cleanup_pop (&buffer, 0);
> > --
> > --        if (__glibc_unlikely (err =3D=3D ETIMEDOUT || err =3D=3D EOVE=
RFLOW))
> > --          {
> > --            __condvar_dec_grefs (cond, g, private);
> > --            /* If we timed out, we effectively cancel waiting.  Note
> that
> > --               we have decremented __g_refs before cancellation, so
> that a
> > --               deadlock between waiting for quiescence of our group i=
n
> > --               __condvar_quiesce_and_switch_g1 and us trying to acqui=
re
> > --               the lock during cancellation is not possible.  */
> > --            __condvar_cancel_waiting (cond, seq, g, private);
> > --            result =3D err;
> > -             break;
> > --          }
> > --        else
> > --          __condvar_dec_grefs (cond, g, private);
> > --
> > -+         else
> > -+            continue;
> > -       }
> > -+      // Now block.
> > -+      struct _pthread_cleanup_buffer buffer;
> > -+      struct _condvar_cleanup_buffer cbuffer;
> > -+      cbuffer.wseq =3D wseq;
> > -+      cbuffer.cond =3D cond;
> > -+      cbuffer.mutex =3D mutex;
> > -+      cbuffer.private =3D private;
> > -+      __pthread_cleanup_push (&buffer, __condvar_cleanup_waiting,
> &cbuffer);
> > -+
> > -+      err =3D __futex_abstimed_wait_cancelable64 (
> > -+        cond->__data.__g_signals + g, signals, clockid, abstime,
> private);
> > -+
> > -+      __pthread_cleanup_pop (&buffer, 0);
> > -+
> > -+      if (__glibc_unlikely (err =3D=3D ETIMEDOUT || err =3D=3D EOVERF=
LOW))
> > -+        {
> > -+          /* If we timed out, we effectively cancel waiting.  */
> > -+          __condvar_cancel_waiting (cond, seq, g, private);
> > -+          result =3D err;
> > -+          break;
> > -+        }
> > -+    }
> > -
> > -   /* Confirm that we have been woken.  We do that before acquiring th=
e
> mutex
> > -      to allow for execution of pthread_cond_destroy while having
> acquired the
> > ---
> > -2.49.0
> > -
> > diff --git a/meta/recipes-core/glibc/glibc/0026-PR25847-7.patch
> b/meta/recipes-core/glibc/glibc/0026-PR25847-7.patch
> > deleted file mode 100644
> > index a9e9cc7c48..0000000000
> > --- a/meta/recipes-core/glibc/glibc/0026-PR25847-7.patch
> > +++ /dev/null
> > @@ -1,160 +0,0 @@
> > -From 2a601ac9041e2ca645acad2c174b1c545cfceafe Mon Sep 17 00:00:00 2001
> > -From: Malte Skarupke <malteskarupke@fastmail.fm>
> > -Date: Tue, 17 Jun 2025 01:53:25 -0700
> > -Subject: [PATCH] nptl: rename __condvar_quiesce_and_switch_g1
> > -
> > -This function no longer waits for threads to leave g1, so rename it to
> > -__condvar_switch_g1
> > -
> > -The following commits have been cherry-picked from Glibc master branch=
:
> > -Bug : https://sourceware.org/bugzilla/show_bug.cgi?id=3D25847
> > -
> > -Upstream-Status: Backport
> > -[
> https://sourceware.org/git/?p=3Dglibc.git;a=3Dcommit;h=3D4b79e27a5073c02f=
6bff9aa8f4791230a0ab1867
> ]
> > -
> > -Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
> > ----
> > - nptl/pthread_cond_broadcast.c |  4 ++--
> > - nptl/pthread_cond_common.c    | 26 ++++++++++++--------------
> > - nptl/pthread_cond_signal.c    | 17 ++++++++---------
> > - nptl/pthread_cond_wait.c      |  9 ++++-----
> > - 4 files changed, 26 insertions(+), 30 deletions(-)
> > -
> > -diff --git a/nptl/pthread_cond_broadcast.c
> b/nptl/pthread_cond_broadcast.c
> > -index 5ae141ac81..a07435589a 100644
> > ---- a/nptl/pthread_cond_broadcast.c
> > -+++ b/nptl/pthread_cond_broadcast.c
> > -@@ -60,7 +60,7 @@ ___pthread_cond_broadcast (pthread_cond_t *cond)
> > -                               cond->__data.__g_size[g1] << 1);
> > -       cond->__data.__g_size[g1] =3D 0;
> > -
> > --      /* We need to wake G1 waiters before we quiesce G1 below.  */
> > -+      /* We need to wake G1 waiters before we switch G1 below.  */
> > -       /* TODO Only set it if there are indeed futex waiters.  We coul=
d
> > -        also try to move this out of the critical section in cases whe=
n
> > -        G2 is empty (and we don't need to quiesce).  */
> > -@@ -69,7 +69,7 @@ ___pthread_cond_broadcast (pthread_cond_t *cond)
> > -
> > -   /* G1 is complete.  Step (2) is next unless there are no waiters in
> G2, in
> > -      which case we can stop.  */
> > --  if (__condvar_quiesce_and_switch_g1 (cond, wseq, &g1, private))
> > -+  if (__condvar_switch_g1 (cond, wseq, &g1, private))
> > -     {
> > -       /* Step (3): Send signals to all waiters in the old G2 / new
> G1.  */
> > -       atomic_fetch_add_relaxed (cond->__data.__g_signals + g1,
> > -diff --git a/nptl/pthread_cond_common.c b/nptl/pthread_cond_common.c
> > -index f976a533a1..3baac4dabc 100644
> > ---- a/nptl/pthread_cond_common.c
> > -+++ b/nptl/pthread_cond_common.c
> > -@@ -189,16 +189,15 @@ __condvar_get_private (int flags)
> > -     return FUTEX_SHARED;
> > - }
> > -
> > --/* This closes G1 (whose index is in G1INDEX), waits for all futex
> waiters to
> > --   leave G1, converts G1 into a fresh G2, and then switches group
> roles so that
> > --   the former G2 becomes the new G1 ending at the current __wseq valu=
e
> when we
> > --   eventually make the switch (WSEQ is just an observation of __wseq
> by the
> > --   signaler).
> > -+/* This closes G1 (whose index is in G1INDEX), converts G1 into a
> fresh G2,
> > -+   and then switches group roles so that the former G2 becomes the ne=
w
> G1
> > -+   ending at the current __wseq value when we eventually make the
> switch
> > -+   (WSEQ is just an observation of __wseq by the signaler).
> > -    If G2 is empty, it will not switch groups because then it would
> create an
> > -    empty G1 which would require switching groups again on the next
> signal.
> > -    Returns false iff groups were not switched because G2 was empty.  =
*/
> > - static bool __attribute__ ((unused))
> > --__condvar_quiesce_and_switch_g1 (pthread_cond_t *cond, uint64_t wseq,
> > -+__condvar_switch_g1 (pthread_cond_t *cond, uint64_t wseq,
> > -     unsigned int *g1index, int private)
> > - {
> > -   unsigned int g1 =3D *g1index;
> > -@@ -214,8 +213,7 @@ __condvar_quiesce_and_switch_g1 (pthread_cond_t
> *cond, uint64_t wseq,
> > -         + cond->__data.__g_size[g1 ^ 1]) =3D=3D 0)
> > -       return false;
> > -
> > --  /* Now try to close and quiesce G1.  We have to consider the
> following kinds
> > --     of waiters:
> > -+  /* We have to consider the following kinds of waiters:
> > -      * Waiters from less recent groups than G1 are not affected becau=
se
> > -        nothing will change for them apart from __g1_start getting
> larger.
> > -      * New waiters arriving concurrently with the group switching wil=
l
> all go
> > -@@ -223,12 +221,12 @@ __condvar_quiesce_and_switch_g1 (pthread_cond_t
> *cond, uint64_t wseq,
> > -        are not affected.
> > -      * Waiters in G1 have already received a signal and been woken.  =
*/
> > -
> > --  /* Update __g1_start, which finishes closing this group.  The value
> we add
> > --     will never be negative because old_orig_size can only be zero
> when we
> > --     switch groups the first time after a condvar was initialized, in
> which
> > --     case G1 will be at index 1 and we will add a value of 1.
> > --     Relaxed MO is fine because the change comes with no additional
> > --     constraints that others would have to observe.  */
> > -+  /* Update __g1_start, which closes this group.  The value we add
> will never
> > -+     be negative because old_orig_size can only be zero when we switc=
h
> groups
> > -+     the first time after a condvar was initialized, in which case G1
> will be
> > -+     at index 1 and we will add a value of 1. Relaxed MO is fine
> because the
> > -+     change comes with no additional constraints that others would
> have to
> > -+     observe.  */
> > -   __condvar_add_g1_start_relaxed (cond,
> > -       (old_orig_size << 1) + (g1 =3D=3D 1 ? 1 : - 1));
> > -
> > -diff --git a/nptl/pthread_cond_signal.c b/nptl/pthread_cond_signal.c
> > -index 14800ba00b..a9bc10dcca 100644
> > ---- a/nptl/pthread_cond_signal.c
> > -+++ b/nptl/pthread_cond_signal.c
> > -@@ -69,18 +69,17 @@ ___pthread_cond_signal (pthread_cond_t *cond)
> > -   bool do_futex_wake =3D false;
> > -
> > -   /* If G1 is still receiving signals, we put the signal there.  If
> not, we
> > --     check if G2 has waiters, and if so, quiesce and switch G1 to the
> former
> > --     G2; if this results in a new G1 with waiters (G2 might have
> cancellations
> > --     already, see __condvar_quiesce_and_switch_g1), we put the signal
> in the
> > --     new G1.  */
> > -+     check if G2 has waiters, and if so, switch G1 to the former G2;
> if this
> > -+     results in a new G1 with waiters (G2 might have cancellations
> already,
> > -+     see __condvar_switch_g1), we put the signal in the new G1. */
> > -   if ((cond->__data.__g_size[g1] !=3D 0)
> > --      || __condvar_quiesce_and_switch_g1 (cond, wseq, &g1, private))
> > -+      || __condvar_switch_g1 (cond, wseq, &g1, private))
> > -     {
> > -       /* Add a signal.  Relaxed MO is fine because signaling does not
> need to
> > --       establish a happens-before relation (see above).  We do not
> mask the
> > --       release-MO store when initializing a group in
> > --       __condvar_quiesce_and_switch_g1 because we use an atomic
> > --       read-modify-write and thus extend that store's release
> sequence.  */
> > -+         establish a happens-before relation (see above).  We do not
> mask the
> > -+         release-MO store when initializing a group in
> __condvar_switch_g1
> > -+         because we use an atomic read-modify-write and thus extend
> that
> > -+         store's release sequence.  */
> > -       atomic_fetch_add_relaxed (cond->__data.__g_signals + g1, 2);
> > -       cond->__data.__g_size[g1]--;
> > -       /* TODO Only set it if there are indeed futex waiters.  */
> > -diff --git a/nptl/pthread_cond_wait.c b/nptl/pthread_cond_wait.c
> > -index 104ebd48ca..bb46f3605d 100644
> > ---- a/nptl/pthread_cond_wait.c
> > -+++ b/nptl/pthread_cond_wait.c
> > -@@ -382,8 +382,7 @@ __pthread_cond_wait_common (pthread_cond_t *cond,
> pthread_mutex_t *mutex,
> > -      because we do not need to establish any happens-before relation
> with
> > -      signalers (see __pthread_cond_signal); modification order alone
> > -      establishes a total order of waiters/signals.  We do need acquir=
e
> MO
> > --     to synchronize with group reinitialization in
> > --     __condvar_quiesce_and_switch_g1.  */
> > -+     to synchronize with group reinitialization in
> __condvar_switch_g1.  */
> > -   uint64_t wseq =3D __condvar_fetch_add_wseq_acquire (cond, 2);
> > -   /* Find our group's index.  We always go into what was G2 when we
> acquired
> > -      our position.  */
> > -@@ -414,9 +413,9 @@ __pthread_cond_wait_common (pthread_cond_t *cond,
> pthread_mutex_t *mutex,
> > -     {
> > -       /* Now wait until a signal is available in our group or it is
> closed.
> > -          Acquire MO so that if we observe (signals =3D=3D lowseq) aft=
er
> group
> > --         switching in __condvar_quiesce_and_switch_g1, we synchronize
> with that
> > --         store and will see the prior update of __g1_start done while
> switching
> > --         groups too.  */
> > -+         switching in __condvar_switch_g1, we synchronize with that
> store and
> > -+         will see the prior update of __g1_start done while switching
> groups
> > -+         too.  */
> > -       unsigned int signals =3D atomic_load_acquire
> (cond->__data.__g_signals + g);
> > -       uint64_t g1_start =3D __condvar_load_g1_start_relaxed (cond);
> > -       unsigned int lowseq =3D (g1_start & 1) =3D=3D g ? signals : g1_=
start &
> ~1U;
> > ---
> > -2.49.0
> > -
> > diff --git a/meta/recipes-core/glibc/glibc/0026-PR25847-8.patch
> b/meta/recipes-core/glibc/glibc/0026-PR25847-8.patch
> > deleted file mode 100644
> > index 8ea0c784ef..0000000000
> > --- a/meta/recipes-core/glibc/glibc/0026-PR25847-8.patch
> > +++ /dev/null
> > @@ -1,192 +0,0 @@
> > -From fc074de88796eb2036fbe9bade638e00adfd5cb2 Mon Sep 17 00:00:00 2001
> > -From: Malte Skarupke <malteskarupke@fastmail.fm>
> > -Date: Tue, 17 Jun 2025 02:08:36 -0700
> > -Subject: [PATCH] nptl: Use all of g1_start and g_signals
> > -
> > -The LSB of g_signals was unused. The LSB of g1_start was used to
> indicate
> > -which group is G2. This was used to always go to sleep in
> pthread_cond_wait
> > -if a waiter is in G2. A comment earlier in the file says that this is
> not
> > -correct to do:
> > -
> > - "Waiters cannot determine whether they are currently in G2 or G1 --
> but they
> > -  do not have to because all they are interested in is whether there a=
re
> > -  available signals"
> > -
> > -I either would have had to update the comment, or get rid of the check=
.
> I
> > -chose to get rid of the check. In fact I don't quite know why it was
> there.
> > -There will never be available signals for group G2, so we didn't need
> the
> > -special case. Even if there were, this would just be a spurious wake.
> This
> > -might have caught some cases where the count has wrapped around, but i=
t
> > -wouldn't reliably do that, (and even if it did, why would you want to
> force a
> > -sleep in that case?) and we don't support that many concurrent waiters
> > -anyway. Getting rid of it allows us to use one more bit, making us mor=
e
> > -robust to wraparound.
> > -
> > -The following commits have been cherry-picked from Glibc master branch=
:
> > -Bug : https://sourceware.org/bugzilla/show_bug.cgi?id=3D25847
> > -
> > -Upstream-Status: Backport
> > -[
> https://sourceware.org/git/?p=3Dglibc.git;a=3Dcommit;h=3D91bb902f58264a2f=
d50fbce8f39a9a290dd23706
> ]
> > -
> > -Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
> > ----
> > - nptl/pthread_cond_broadcast.c |  4 ++--
> > - nptl/pthread_cond_common.c    | 26 ++++++++++----------------
> > - nptl/pthread_cond_signal.c    |  2 +-
> > - nptl/pthread_cond_wait.c      | 14 +++++---------
> > - 4 files changed, 18 insertions(+), 28 deletions(-)
> > -
> > -diff --git a/nptl/pthread_cond_broadcast.c
> b/nptl/pthread_cond_broadcast.c
> > -index a07435589a..ef0943cdc5 100644
> > ---- a/nptl/pthread_cond_broadcast.c
> > -+++ b/nptl/pthread_cond_broadcast.c
> > -@@ -57,7 +57,7 @@ ___pthread_cond_broadcast (pthread_cond_t *cond)
> > -     {
> > -       /* Add as many signals as the remaining size of the group.  */
> > -       atomic_fetch_add_relaxed (cond->__data.__g_signals + g1,
> > --                              cond->__data.__g_size[g1] << 1);
> > -+                              cond->__data.__g_size[g1]);
> > -       cond->__data.__g_size[g1] =3D 0;
> > -
> > -       /* We need to wake G1 waiters before we switch G1 below.  */
> > -@@ -73,7 +73,7 @@ ___pthread_cond_broadcast (pthread_cond_t *cond)
> > -     {
> > -       /* Step (3): Send signals to all waiters in the old G2 / new
> G1.  */
> > -       atomic_fetch_add_relaxed (cond->__data.__g_signals + g1,
> > --                              cond->__data.__g_size[g1] << 1);
> > -+                              cond->__data.__g_size[g1]);
> > -       cond->__data.__g_size[g1] =3D 0;
> > -       /* TODO Only set it if there are indeed futex waiters.  */
> > -       do_futex_wake =3D true;
> > -diff --git a/nptl/pthread_cond_common.c b/nptl/pthread_cond_common.c
> > -index 3baac4dabc..e48f914321 100644
> > ---- a/nptl/pthread_cond_common.c
> > -+++ b/nptl/pthread_cond_common.c
> > -@@ -208,9 +208,9 @@ __condvar_switch_g1 (pthread_cond_t *cond, uint64_=
t
> wseq,
> > -      behavior.
> > -      Note that this works correctly for a zero-initialized condvar
> too.  */
> > -   unsigned int old_orig_size =3D __condvar_get_orig_size (cond);
> > --  uint64_t old_g1_start =3D __condvar_load_g1_start_relaxed (cond) >>=
 1;
> > --  if (((unsigned) (wseq - old_g1_start - old_orig_size)
> > --        + cond->__data.__g_size[g1 ^ 1]) =3D=3D 0)
> > -+  uint64_t old_g1_start =3D __condvar_load_g1_start_relaxed (cond);
> > -+  uint64_t new_g1_start =3D old_g1_start + old_orig_size;
> > -+  if (((unsigned) (wseq - new_g1_start) + cond->__data.__g_size[g1 ^
> 1]) =3D=3D 0)
> > -       return false;
> > -
> > -   /* We have to consider the following kinds of waiters:
> > -@@ -221,16 +221,10 @@ __condvar_switch_g1 (pthread_cond_t *cond,
> uint64_t wseq,
> > -        are not affected.
> > -      * Waiters in G1 have already received a signal and been woken.  =
*/
> > -
> > --  /* Update __g1_start, which closes this group.  The value we add
> will never
> > --     be negative because old_orig_size can only be zero when we switc=
h
> groups
> > --     the first time after a condvar was initialized, in which case G1
> will be
> > --     at index 1 and we will add a value of 1. Relaxed MO is fine
> because the
> > --     change comes with no additional constraints that others would
> have to
> > --     observe.  */
> > --  __condvar_add_g1_start_relaxed (cond,
> > --      (old_orig_size << 1) + (g1 =3D=3D 1 ? 1 : - 1));
> > --
> > --  unsigned int lowseq =3D ((old_g1_start + old_orig_size) << 1) & ~1U=
;
> > -+  /* Update __g1_start, which closes this group.  Relaxed MO is fine
> because
> > -+     the change comes with no additional constraints that others woul=
d
> have
> > -+     to observe.  */
> > -+  __condvar_add_g1_start_relaxed (cond, old_orig_size);
> > -
> > -   /* At this point, the old G1 is now a valid new G2 (but not in use
> yet).
> > -      No old waiter can neither grab a signal nor acquire a reference
> without
> > -@@ -242,13 +236,13 @@ __condvar_switch_g1 (pthread_cond_t *cond,
> uint64_t wseq,
> > -   g1 ^=3D 1;
> > -   *g1index ^=3D 1;
> > -
> > --  /* Now advance the new G1 g_signals to the new lowseq, giving it
> > -+  /* Now advance the new G1 g_signals to the new g1_start, giving it
> > -      an effective signal count of 0 to start.  */
> > --  atomic_store_release (cond->__data.__g_signals + g1, lowseq);
> > -+  atomic_store_release (cond->__data.__g_signals + g1,
> (unsigned)new_g1_start);
> > -
> > -   /* These values are just observed by signalers, and thus protected
> by the
> > -      lock.  */
> > --  unsigned int orig_size =3D wseq - (old_g1_start + old_orig_size);
> > -+  unsigned int orig_size =3D wseq - new_g1_start;
> > -   __condvar_set_orig_size (cond, orig_size);
> > -   /* Use and addition to not loose track of cancellations in what was
> > -      previously G2.  */
> > -diff --git a/nptl/pthread_cond_signal.c b/nptl/pthread_cond_signal.c
> > -index a9bc10dcca..07427369aa 100644
> > ---- a/nptl/pthread_cond_signal.c
> > -+++ b/nptl/pthread_cond_signal.c
> > -@@ -80,7 +80,7 @@ ___pthread_cond_signal (pthread_cond_t *cond)
> > -          release-MO store when initializing a group in
> __condvar_switch_g1
> > -          because we use an atomic read-modify-write and thus extend
> that
> > -          store's release sequence.  */
> > --      atomic_fetch_add_relaxed (cond->__data.__g_signals + g1, 2);
> > -+      atomic_fetch_add_relaxed (cond->__data.__g_signals + g1, 1);
> > -       cond->__data.__g_size[g1]--;
> > -       /* TODO Only set it if there are indeed futex waiters.  */
> > -       do_futex_wake =3D true;
> > -diff --git a/nptl/pthread_cond_wait.c b/nptl/pthread_cond_wait.c
> > -index bb46f3605d..430cbe8a35 100644
> > ---- a/nptl/pthread_cond_wait.c
> > -+++ b/nptl/pthread_cond_wait.c
> > -@@ -84,7 +84,7 @@ __condvar_cancel_waiting (pthread_cond_t *cond,
> uint64_t seq, unsigned int g,
> > -      not hold a reference on the group.  */
> > -   __condvar_acquire_lock (cond, private);
> > -
> > --  uint64_t g1_start =3D __condvar_load_g1_start_relaxed (cond) >> 1;
> > -+  uint64_t g1_start =3D __condvar_load_g1_start_relaxed (cond);
> > -   if (g1_start > seq)
> > -     {
> > -       /* Our group is closed, so someone provided enough signals for
> it.
> > -@@ -278,7 +278,6 @@ __condvar_cleanup_waiting (void *arg)
> > -      * Waiters fetch-add while having acquire the mutex associated
> with the
> > -        condvar.  Signalers load it and fetch-xor it concurrently.
> > -    __g1_start: Starting position of G1 (inclusive)
> > --     * LSB is index of current G2.
> > -      * Modified by signalers while having acquired the
> condvar-internal lock
> > -        and observed concurrently by waiters.
> > -    __g1_orig_size: Initial size of G1
> > -@@ -299,11 +298,9 @@ __condvar_cleanup_waiting (void *arg)
> > -      * Reference count used by waiters concurrently with signalers
> that have
> > -        acquired the condvar-internal lock.
> > -    __g_signals: The number of signals that can still be consumed,
> relative to
> > --     the current g1_start.  (i.e. bits 31 to 1 of __g_signals are bit=
s
> > --     31 to 1 of g1_start with the signal count added)
> > -+     the current g1_start.  (i.e. g1_start with the signal count adde=
d)
> > -      * Used as a futex word by waiters.  Used concurrently by waiters
> and
> > -        signalers.
> > --     * LSB is currently reserved and 0.
> > -    __g_size: Waiters remaining in this group (i.e., which have not be=
en
> > -      signaled yet.
> > -      * Accessed by signalers and waiters that cancel waiting (both do
> so only
> > -@@ -418,9 +415,8 @@ __pthread_cond_wait_common (pthread_cond_t *cond,
> pthread_mutex_t *mutex,
> > -          too.  */
> > -       unsigned int signals =3D atomic_load_acquire
> (cond->__data.__g_signals + g);
> > -       uint64_t g1_start =3D __condvar_load_g1_start_relaxed (cond);
> > --      unsigned int lowseq =3D (g1_start & 1) =3D=3D g ? signals : g1_=
start &
> ~1U;
> > -
> > --      if (seq < (g1_start >> 1))
> > -+      if (seq < g1_start)
> > -         {
> > -           /* If the group is closed already,
> > -              then this waiter originally had enough extra signals to
> > -@@ -433,13 +429,13 @@ __pthread_cond_wait_common (pthread_cond_t *cond=
,
> pthread_mutex_t *mutex,
> > -          by now, perhaps in the process of switching back to an older
> > -          G2, but in either case we're allowed to consume the availabl=
e
> > -          signal and should not block anymore.  */
> > --      if ((int)(signals - lowseq) >=3D 2)
> > -+      if ((int)(signals - (unsigned int)g1_start) > 0)
> > -         {
> > -          /* Try to grab a signal.  See above for MO.  (if we do
> another loop
> > -             iteration we need to see the correct value of g1_start)  =
*/
> > -            if (atomic_compare_exchange_weak_acquire (
> > -                        cond->__data.__g_signals + g,
> > --                       &signals, signals - 2))
> > -+                       &signals, signals - 1))
> > -             break;
> > -          else
> > -             continue;
> > ---
> > -2.49.0
> > -
> > diff --git a/meta/recipes-core/glibc/glibc_2.35.bb
> b/meta/recipes-core/glibc/glibc_2.35.bb
> > index 265dcb9129..ca7f630699 100644
> > --- a/meta/recipes-core/glibc/glibc_2.35.bb
> > +++ b/meta/recipes-core/glibc/glibc_2.35.bb
> > @@ -62,14 +62,6 @@ SRC_URI =3D
> "${GLIBC_GIT_URI};branch=3D${SRCBRANCH};name=3Dglibc \
> >
>  file://0022-sysdeps-gnu-configure.ac-Set-libc_cv_rootsbindir-onl.patch \
> >
>  file://0023-timezone-Make-shell-interpreter-overridable-in-tzsel.patch \
> >             file://0024-fix

--000000000000ebdb1c0641275fba
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote gmail_quote_contai=
ner"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Oct 14, 2025, 3:57=E2=80=
=AFPM Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com=
</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">are these backports=
 being done in glibc 2.35 release as well=C2=A0<br></blockquote></div></div=
><div dir=3D"auto"><br></div><div dir=3D"auto"><br></div><div dir=3D"auto">=
Sunil, can you respond to Khem&#39;s question?</div><div dir=3D"auto"><br><=
/div><div dir=3D"auto">Steve</div><div dir=3D"auto"><br></div><div dir=3D"a=
uto"><div class=3D"gmail_quote gmail_quote_container"><blockquote class=3D"=
gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-=
left:1ex">
<br>
On Tue, Oct 14, 2025 at 3:45=E2=80=AFPM Steve Sakoman via<br>
<a href=3D"http://lists.openembedded.org" rel=3D"noreferrer noreferrer" tar=
get=3D"_blank">lists.openembedded.org</a> &lt;steve=3D<a href=3D"mailto:sak=
oman.com@lists.openembedded.org" target=3D"_blank" rel=3D"noreferrer">sakom=
an.com@lists.openembedded.org</a>&gt;<br>
wrote:<br>
&gt;<br>
&gt; From: Sunil Dora &lt;<a href=3D"mailto:sunilkumar.dora@windriver.com" =
target=3D"_blank" rel=3D"noreferrer">sunilkumar.dora@windriver.com</a>&gt;<=
br>
&gt;<br>
&gt; To facilitate a clean backport of the full 10-commit series<br>
&gt; addressing the pthread condition variable lost wakeup issue<br>
&gt; (BZ#25847) in glibc 2.35, remove the existing 8 patches that<br>
&gt; were applied as a partial backport.<br>
&gt;<br>
&gt; The previous partial backport excluded commit:<br>
&gt; c36fc50781995e6758cae2b6927839d0157f213c (&quot;nptl: Remove<br>
&gt; g_refs from condition variables&quot;) based on guidance from<br>
&gt; glibc maintainer Florian Weimer(#comment #74)<br>
&gt;<br>
&gt; This exclusion was recommended for stable branches to<br>
&gt; avoid altering the layout of pthread_cond_t, which could<br>
&gt; introduce ABI incompatibilities. Additionally, the dependent<br>
&gt; commit dbc5a50d12eff4cb3f782129029d04b8a76f58e7 was not needed<br>
&gt; in the partial backport.<br>
&gt;<br>
&gt; To align with upstream mainline, per maintainer Carlos O&#39;Donell<br=
>
&gt; (comment #75), apply the complete 10-commit series for consistency.<br=
>
&gt;<br>
&gt; By removing these patches first, we ensure the subsequent<br>
&gt; application of the full 10 commits results in cleaner, more<br>
&gt; reviewable changes without intermixed conflicts or overlaps.<br>
&gt;<br>
&gt; Removed patches and corresponding upstream commits:<br>
&gt; - 0026-PR25847-1.patch: 1db84775f831a1494993ce9c118deaf9537cc50a<br>
&gt; - 0026-PR25847-2.patch: 0cc973160c23bb67f895bc887dd6942d29f8fee3<br>
&gt; - 0026-PR25847-3.patch: b42cc6af11062c260c7dfa91f1c89891366fed3e<br>
&gt; - 0026-PR25847-4.patch: 4f7b051f8ee3feff1b53b27a906f245afaa9cee1<br>
&gt; - 0026-PR25847-5.patch: 929a4764ac90382616b6a21f099192b2475da674<br>
&gt; - 0026-PR25847-6.patch: ee6c14ed59d480720721aaacc5fb03213dc153da<br>
&gt; - 0026-PR25847-7.patch: 4b79e27a5073c02f6bff9aa8f4791230a0ab1867<br>
&gt; - 0026-PR25847-8.patch: 91bb902f58264a2fd50fbce8f39a9a290dd23706<br>
&gt;<br>
&gt; Bug reference: <a href=3D"https://sourceware.org/bugzilla/show_bug.cgi=
?id=3D25847" rel=3D"noreferrer noreferrer" target=3D"_blank">https://source=
ware.org/bugzilla/show_bug.cgi?id=3D25847</a><br>
&gt; This change prepares the branch for the full backport in follow-up com=
mits.<br>
&gt;<br>
&gt; Signed-off-by: Sunil Dora &lt;<a href=3D"mailto:sunilkumar.dora@windri=
ver.com" target=3D"_blank" rel=3D"noreferrer">sunilkumar.dora@windriver.com=
</a>&gt;<br>
&gt; Signed-off-by: Steve Sakoman &lt;<a href=3D"mailto:steve@sakoman.com" =
target=3D"_blank" rel=3D"noreferrer">steve@sakoman.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../glibc/glibc/0026-PR25847-1.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | 455 ------------------<br>
&gt;=C2=A0 .../glibc/glibc/0026-PR25847-2.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | 144 ------<br>
&gt;=C2=A0 .../glibc/glibc/0026-PR25847-3.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 77 ---<br>
&gt;=C2=A0 .../glibc/glibc/0026-PR25847-4.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | 117 -----<br>
&gt;=C2=A0 .../glibc/glibc/0026-PR25847-5.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | 105 ----<br>
&gt;=C2=A0 .../glibc/glibc/0026-PR25847-6.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | 169 -------<br>
&gt;=C2=A0 .../glibc/glibc/0026-PR25847-7.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | 160 ------<br>
&gt;=C2=A0 .../glibc/glibc/0026-PR25847-8.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | 192 --------<br>
&gt;=C2=A0 meta/recipes-core/glibc/<a href=3D"http://glibc_2.35.bb" rel=3D"=
noreferrer noreferrer" target=3D"_blank">glibc_2.35.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A08 -<br>
&gt;=C2=A0 9 files changed, 1427 deletions(-)<br>
&gt;=C2=A0 delete mode 100644 meta/recipes-core/glibc/glibc/0026-PR25847-1.=
patch<br>
&gt;=C2=A0 delete mode 100644 meta/recipes-core/glibc/glibc/0026-PR25847-2.=
patch<br>
&gt;=C2=A0 delete mode 100644 meta/recipes-core/glibc/glibc/0026-PR25847-3.=
patch<br>
&gt;=C2=A0 delete mode 100644 meta/recipes-core/glibc/glibc/0026-PR25847-4.=
patch<br>
&gt;=C2=A0 delete mode 100644 meta/recipes-core/glibc/glibc/0026-PR25847-5.=
patch<br>
&gt;=C2=A0 delete mode 100644 meta/recipes-core/glibc/glibc/0026-PR25847-6.=
patch<br>
&gt;=C2=A0 delete mode 100644 meta/recipes-core/glibc/glibc/0026-PR25847-7.=
patch<br>
&gt;=C2=A0 delete mode 100644 meta/recipes-core/glibc/glibc/0026-PR25847-8.=
patch<br>
&gt;<br>
&gt; diff --git a/meta/recipes-core/glibc/glibc/0026-PR25847-1.patch b/meta=
/recipes-core/glibc/glibc/0026-PR25847-1.patch<br>
&gt; deleted file mode 100644<br>
&gt; index 44a2b6772c..0000000000<br>
&gt; --- a/meta/recipes-core/glibc/glibc/0026-PR25847-1.patch<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,455 +0,0 @@<br>
&gt; -From 31d9848830e496f57d4182b518467c4c63bfd4bd Mon Sep 17 00:00:00 200=
1<br>
&gt; -From: Frank Barrus &lt;<a href=3D"mailto:frankbarrus_sw@shaggy.cc" ta=
rget=3D"_blank" rel=3D"noreferrer">frankbarrus_sw@shaggy.cc</a>&gt;<br>
&gt; -Date: Mon, 16 Jun 2025 22:37:54 -0700<br>
&gt; -Subject: [PATCH] pthreads NPTL: lost wakeup fix 2<br>
&gt; -<br>
&gt; -This fixes the lost wakeup (from a bug in signal stealing) with a cha=
nge<br>
&gt; -in the usage of g_signals[] in the condition variable internal state.=
<br>
&gt; -It also completely eliminates the concept and handling of signal stea=
ling,<br>
&gt; -as well as the need for signalers to block to wait for waiters to wak=
e<br>
&gt; -up every time there is a G1/G2 switch.=C2=A0 This greatly reduces the=
 average<br>
&gt; -and maximum latency for pthread_cond_signal.<br>
&gt; -<br>
&gt; -The g_signals[] field now contains a signal count that is relative to=
<br>
&gt; -the current g1_start value.=C2=A0 Since it is a 32-bit field, and the=
 LSB is<br>
&gt; -still reserved (though not currently used anymore), it has a 31-bit v=
alue<br>
&gt; -that corresponds to the low 31 bits of the sequence number in g1_star=
t.<br>
&gt; -(since g1_start also has an LSB flag, this means bits 31:1 in g_signa=
ls<br>
&gt; -correspond to bits 31:1 in g1_start, plus the current signal count)<b=
r>
&gt; -<br>
&gt; -By making the signal count relative to g1_start, there is no longer<b=
r>
&gt; -any ambiguity or A/B/A issue, and thus any checks before blocking,<br=
>
&gt; -including the futex call itself, are guaranteed not to block if the G=
1/G2<br>
&gt; -switch occurs, even if the signal count remains the same.=C2=A0 This =
allows<br>
&gt; -initially safely blocking in G2 until the switch to G1 occurs, and<br=
>
&gt; -then transitioning from G1 to a new G1 or G2, and always being able t=
o<br>
&gt; -distinguish the state change.=C2=A0 This removes the race condition a=
nd A/B/A<br>
&gt; -problems that otherwise ocurred if a late (pre-empted) waiter were to=
<br>
&gt; -resume just as the futex call attempted to block on g_signal since<br=
>
&gt; -otherwise there was no last opportunity to re-check things like wheth=
er<br>
&gt; -the current G1 group was already closed.<br>
&gt; -<br>
&gt; -By fixing these issues, the signal stealing code can be eliminated,<b=
r>
&gt; -since there is no concept of signal stealing anymore.=C2=A0 The code =
to block<br>
&gt; -for all waiters to exit g_refs can also be removed, since any waiters=
<br>
&gt; -that are still in the g_refs region can be guaranteed to safely wake<=
br>
&gt; -up and exit.=C2=A0 If there are still any left at this time, they are=
 all<br>
&gt; -sent one final futex wakeup to ensure that they are not blocked any<b=
r>
&gt; -longer, but there is no need for the signaller to block and wait for<=
br>
&gt; -them to wake up and exit the g_refs region.<br>
&gt; -<br>
&gt; -The signal count is then effectively &quot;zeroed&quot; but since it =
is now<br>
&gt; -relative to g1_start, this is done by advancing it to a new value tha=
t<br>
&gt; -can be observed by any pending blocking waiters.=C2=A0 Any late waite=
rs can<br>
&gt; -always tell the difference, and can thus just cleanly exit if they ar=
e<br>
&gt; -in a stale G1 or G2.=C2=A0 They can never steal a signal from the cur=
rent<br>
&gt; -G1 if they are not in the current G1, since the signal value that has=
<br>
&gt; -to match in the cmpxchg has the low 31 bits of the g1_start value<br>
&gt; -contained in it, and that&#39;s first checked, and then it won&#39;t =
match if<br>
&gt; -there&#39;s a G1/G2 change.<br>
&gt; -<br>
&gt; -Note: the 31-bit sequence number used in g_signals is designed to<br>
&gt; -handle wrap-around when checking the signal count, but if the entire<=
br>
&gt; -31-bit wraparound (2 billion signals) occurs while there is still a<b=
r>
&gt; -late waiter that has not yet resumed, and it happens to then match<br=
>
&gt; -the current g1_start low bits, and the pre-emption occurs after the<b=
r>
&gt; -normal &quot;closed group&quot; checks (which are 64-bit) but then hi=
ts the<br>
&gt; -futex syscall and signal consuming code, then an A/B/A issue could<br=
>
&gt; -still result and cause an incorrect assumption about whether it<br>
&gt; -should block.=C2=A0 This particular scenario seems unlikely in practi=
ce.<br>
&gt; -Note that once awake from the futex, the waiter would notice the<br>
&gt; -closed group before consuming the signal (since that&#39;s still a 64=
-bit<br>
&gt; -check that would not be aliased in the wrap-around in g_signals),<br>
&gt; -so the biggest impact would be blocking on the futex until the next<b=
r>
&gt; -full wakeup from a G1/G2 switch.<br>
&gt; -<br>
&gt; -The following commits have been cherry-picked from Glibc master branc=
h:<br>
&gt; -Bug : <a href=3D"https://sourceware.org/bugzilla/show_bug.cgi?id=3D25=
847" rel=3D"noreferrer noreferrer" target=3D"_blank">https://sourceware.org=
/bugzilla/show_bug.cgi?id=3D25847</a><br>
&gt; -<br>
&gt; -Upstream-Status: Backport<br>
&gt; -[<a href=3D"https://sourceware.org/git/?p=3Dglibc.git;a=3Dcommit;h=3D=
1db84775f831a1494993ce9c118deaf9537cc50a" rel=3D"noreferrer noreferrer" tar=
get=3D"_blank">https://sourceware.org/git/?p=3Dglibc.git;a=3Dcommit;h=3D1db=
84775f831a1494993ce9c118deaf9537cc50a</a>]<br>
&gt; -<br>
&gt; -Signed-off-by: Sunil Dora &lt;<a href=3D"mailto:sunilkumar.dora@windr=
iver.com" target=3D"_blank" rel=3D"noreferrer">sunilkumar.dora@windriver.co=
m</a>&gt;<br>
&gt; ----<br>
&gt; - nptl/pthread_cond_common.c | 106 +++++++++------------------<br>
&gt; - nptl/pthread_cond_wait.c=C2=A0 =C2=A0| 144 ++++++++++++-------------=
------------<br>
&gt; - 2 files changed, 81 insertions(+), 169 deletions(-)<br>
&gt; -<br>
&gt; -diff --git a/nptl/pthread_cond_common.c b/nptl/pthread_cond_common.c<=
br>
&gt; -index fb035f72c3..8dd7037923 100644<br>
&gt; ---- a/nptl/pthread_cond_common.c<br>
&gt; -+++ b/nptl/pthread_cond_common.c<br>
&gt; -@@ -201,7 +201,6 @@ static bool __attribute__ ((unused))<br>
&gt; - __condvar_quiesce_and_switch_g1 (pthread_cond_t *cond, uint64_t wseq=
,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0unsigned int *g1index, int private)<br>
&gt; - {<br>
&gt; --=C2=A0 const unsigned int maxspin =3D 0;<br>
&gt; -=C2=A0 =C2=A0unsigned int g1 =3D *g1index;<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0/* If there is no waiter in G2, we don&#39;t do anything=
.=C2=A0 The expression may<br>
&gt; -@@ -222,85 +221,46 @@ __condvar_quiesce_and_switch_g1 (pthread_cond_t=
 *cond, uint64_t wseq,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 * New waiters arriving concurrently with the gro=
up switching will all go<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 into G2 until we atomically make the swit=
ch.=C2=A0 Waiters existing in G2<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 are not affected.<br>
&gt; --=C2=A0 =C2=A0 =C2=A0* Waiters in G1 will be closed out immediately b=
y setting a flag in<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0__g_signals, which will prevent waiters f=
rom blocking using a futex on<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0__g_signals and also notifies them that t=
he group is closed.=C2=A0 As a<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0result, they will eventually remove their=
 group reference, allowing us<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0to close switch group roles.=C2=A0 */<br>
&gt; --<br>
&gt; --=C2=A0 /* First, set the closed flag on __g_signals.=C2=A0 This tell=
s waiters that are<br>
&gt; --=C2=A0 =C2=A0 =C2=A0about to wait that they shouldn&#39;t do that an=
ymore.=C2=A0 This basically<br>
&gt; --=C2=A0 =C2=A0 =C2=A0serves as an advance notificaton of the upcoming=
 change to __g1_start;<br>
&gt; --=C2=A0 =C2=A0 =C2=A0waiters interpret it as if __g1_start was larger=
 than their waiter<br>
&gt; --=C2=A0 =C2=A0 =C2=A0sequence position.=C2=A0 This allows us to chang=
e __g1_start after waiting<br>
&gt; --=C2=A0 =C2=A0 =C2=A0for all existing waiters with group references t=
o leave, which in turn<br>
&gt; --=C2=A0 =C2=A0 =C2=A0makes recovery after stealing a signal simpler b=
ecause it then can be<br>
&gt; --=C2=A0 =C2=A0 =C2=A0skipped if __g1_start indicates that the group i=
s closed (otherwise,<br>
&gt; --=C2=A0 =C2=A0 =C2=A0we would have to recover always because waiters =
don&#39;t know how big their<br>
&gt; --=C2=A0 =C2=A0 =C2=A0groups are).=C2=A0 Relaxed MO is fine.=C2=A0 */<=
br>
&gt; --=C2=A0 atomic_fetch_or_relaxed (cond-&gt;__data.__g_signals + g1, 1)=
;<br>
&gt; --<br>
&gt; --=C2=A0 /* Wait until there are no group references anymore.=C2=A0 Th=
e fetch-or operation<br>
&gt; --=C2=A0 =C2=A0 =C2=A0injects us into the modification order of __g_re=
fs; release MO ensures<br>
&gt; --=C2=A0 =C2=A0 =C2=A0that waiters incrementing __g_refs after our fet=
ch-or see the previous<br>
&gt; --=C2=A0 =C2=A0 =C2=A0changes to __g_signals and to __g1_start that ha=
d to happen before we can<br>
&gt; --=C2=A0 =C2=A0 =C2=A0switch this G1 and alias with an older group (we=
 have two groups, so<br>
&gt; --=C2=A0 =C2=A0 =C2=A0aliasing requires switching group roles twice).=
=C2=A0 Note that nobody else<br>
&gt; --=C2=A0 =C2=A0 =C2=A0can have set the wake-request flag, so we do not=
 have to act upon it.<br>
&gt; --<br>
&gt; --=C2=A0 =C2=A0 =C2=A0Also note that it is harmless if older waiters o=
r waiters from this G1<br>
&gt; --=C2=A0 =C2=A0 =C2=A0get a group reference after we have quiesced the=
 group because it will<br>
&gt; --=C2=A0 =C2=A0 =C2=A0remain closed for them either because of the clo=
sed flag in __g_signals<br>
&gt; --=C2=A0 =C2=A0 =C2=A0or the later update to __g1_start.=C2=A0 New wai=
ters will never arrive here<br>
&gt; --=C2=A0 =C2=A0 =C2=A0but instead continue to go into the still curren=
t G2.=C2=A0 */<br>
&gt; --=C2=A0 unsigned r =3D atomic_fetch_or_release (cond-&gt;__data.__g_r=
efs + g1, 0);<br>
&gt; --=C2=A0 while ((r &gt;&gt; 1) &gt; 0)<br>
&gt; --=C2=A0 =C2=A0 {<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 for (unsigned int spin =3D maxspin; ((r &gt;&gt=
; 1) &gt; 0) &amp;&amp; (spin &gt; 0); spin--)<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 {<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* TODO Back off.=C2=A0 */<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 r =3D atomic_load_relaxed (cond-&gt;__da=
ta.__g_refs + g1);<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 if ((r &gt;&gt; 1) &gt; 0)<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 {<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* There is still a waiter after spinnin=
g.=C2=A0 Set the wake-request<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0flag and block.=C2=A0 Relax=
ed MO is fine because this is just about<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0this futex word.<br>
&gt; --<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Update r to include the set=
 wake-request flag so that the upcoming<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0futex_wait only blocks if t=
he flag is still set (otherwise, we&#39;d<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0violate the basic client-si=
de futex protocol).=C2=A0 */<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 r =3D atomic_fetch_or_relaxed (cond-&gt;=
__data.__g_refs + g1, 1) | 1;<br>
&gt; --<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((r &gt;&gt; 1) &gt; 0)<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 futex_wait_simple (cond-&gt;__dat=
a.__g_refs + g1, r, private);<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Reload here so we eventually see the =
most recent value even if we<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0do not spin.=C2=A0 =C2=A0*/=
<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 r =3D atomic_load_relaxed (cond-&gt;__da=
ta.__g_refs + g1);<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; --=C2=A0 =C2=A0 }<br>
&gt; --=C2=A0 /* Acquire MO so that we synchronize with the release operati=
on that waiters<br>
&gt; --=C2=A0 =C2=A0 =C2=A0use to decrement __g_refs and thus happen after =
the waiters we waited<br>
&gt; --=C2=A0 =C2=A0 =C2=A0for.=C2=A0 */<br>
&gt; --=C2=A0 atomic_thread_fence_acquire ();<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0* Waiters in G1 will be closed out immediately b=
y the advancing of<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0__g_signals to the next &quot;lowseq&quot=
; (low 31 bits of the new g1_start),<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0which will prevent waiters from blocking =
using a futex on<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0__g_signals since it provides enough sign=
als for all possible<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0remaining waiters.=C2=A0 As a result, the=
y can each consume a signal<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0and they will eventually remove their gro=
up reference.=C2=A0 */<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0/* Update __g1_start, which finishes closing this group.=
=C2=A0 The value we add<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 will never be negative because old_orig_size can=
 only be zero when we<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 switch groups the first time after a condvar was=
 initialized, in which<br>
&gt; --=C2=A0 =C2=A0 =C2=A0case G1 will be at index 1 and we will add a val=
ue of 1.=C2=A0 See above for<br>
&gt; --=C2=A0 =C2=A0 =C2=A0why this takes place after waiting for quiescenc=
e of the group.<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0case G1 will be at index 1 and we will add a val=
ue of 1.<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 Relaxed MO is fine because the change comes with=
 no additional<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 constraints that others would have to observe.=
=C2=A0 */<br>
&gt; -=C2=A0 =C2=A0__condvar_add_g1_start_relaxed (cond,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0(old_orig_size &lt;&lt; 1) + (g1 =3D=3D 1 =
? 1 : - 1));<br>
&gt; -<br>
&gt; --=C2=A0 /* Now reopen the group, thus enabling waiters to again block=
 using the<br>
&gt; --=C2=A0 =C2=A0 =C2=A0futex controlled by __g_signals.=C2=A0 Release M=
O so that observers that see<br>
&gt; --=C2=A0 =C2=A0 =C2=A0no signals (and thus can block) also see the wri=
te __g1_start and thus<br>
&gt; --=C2=A0 =C2=A0 =C2=A0that this is now a new group (see __pthread_cond=
_wait_common for the<br>
&gt; --=C2=A0 =C2=A0 =C2=A0matching acquire MO loads).=C2=A0 */<br>
&gt; --=C2=A0 atomic_store_release (cond-&gt;__data.__g_signals + g1, 0);<b=
r>
&gt; --<br>
&gt; -+=C2=A0 unsigned int lowseq =3D ((old_g1_start + old_orig_size) &lt;&=
lt; 1) &amp; ~1U;<br>
&gt; -+<br>
&gt; -+=C2=A0 /* If any waiters still hold group references (and thus could=
 be blocked),<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0then wake them all up now and prevent any runnin=
g ones from blocking.<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0This is effectively a catch-all for any possible=
 current or future<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0bugs that can allow the group size to reach 0 be=
fore all G1 waiters<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0have been awakened or at least given signals to =
consume, or any<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0other case that can leave blocked (or about to b=
lock) older waiters..=C2=A0 */<br>
&gt; -+=C2=A0 if ((atomic_fetch_or_release (cond-&gt;__data.__g_refs + g1, =
0) &gt;&gt; 1) &gt; 0)<br>
&gt; -+=C2=A0 =C2=A0{<br>
&gt; -+=C2=A0 =C2=A0 /* First advance signals to the end of the group (i.e.=
 enough signals<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0for the entire G1 group) to ensure that w=
aiters which have not<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0yet blocked in the futex will not block.<=
br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0Note that in the vast majority of cases, =
this should never<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0actually be necessary, since __g_signals =
will have enough<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0signals for the remaining g_refs waiters.=
=C2=A0 As an optimization,<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0we could check this first before proceedi=
ng, although that<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0could still leave the potential for futex=
 lost wakeup bugs<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0if the signal count was non-zero but the =
futex wakeup<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0was somehow lost.=C2=A0 */<br>
&gt; -+=C2=A0 =C2=A0 atomic_store_release (cond-&gt;__data.__g_signals + g1=
, lowseq);<br>
&gt; -+<br>
&gt; -+=C2=A0 =C2=A0 futex_wake (cond-&gt;__data.__g_signals + g1, INT_MAX,=
 private);<br>
&gt; -+=C2=A0 =C2=A0}<br>
&gt; -=C2=A0 =C2=A0/* At this point, the old G1 is now a valid new G2 (but =
not in use yet).<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 No old waiter can neither grab a signal nor acqu=
ire a reference without<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 noticing that __g1_start is larger.<br>
&gt; -@@ -311,6 +271,10 @@ __condvar_quiesce_and_switch_g1 (pthread_cond_t =
*cond, uint64_t wseq,<br>
&gt; -=C2=A0 =C2=A0g1 ^=3D 1;<br>
&gt; -=C2=A0 =C2=A0*g1index ^=3D 1;<br>
&gt; -<br>
&gt; -+=C2=A0 /* Now advance the new G1 g_signals to the new lowseq, giving=
 it<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0an effective signal count of 0 to start.=C2=A0 *=
/<br>
&gt; -+=C2=A0 atomic_store_release (cond-&gt;__data.__g_signals + g1, lowse=
q);<br>
&gt; -+<br>
&gt; -=C2=A0 =C2=A0/* These values are just observed by signalers, and thus=
 protected by the<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 lock.=C2=A0 */<br>
&gt; -=C2=A0 =C2=A0unsigned int orig_size =3D wseq - (old_g1_start + old_or=
ig_size);<br>
&gt; -diff --git a/nptl/pthread_cond_wait.c b/nptl/pthread_cond_wait.c<br>
&gt; -index 20c348a503..1cb3dbf7b0 100644<br>
&gt; ---- a/nptl/pthread_cond_wait.c<br>
&gt; -+++ b/nptl/pthread_cond_wait.c<br>
&gt; -@@ -238,9 +238,7 @@ __condvar_cleanup_waiting (void *arg)<br>
&gt; -=C2=A0 =C2=A0 signaled), and a reference count.<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 The group reference count is used to maintain the numbe=
r of waiters that<br>
&gt; --=C2=A0 =C2=A0are using the group&#39;s futex.=C2=A0 Before a group c=
an change its role, the<br>
&gt; --=C2=A0 =C2=A0reference count must show that no waiters are using the=
 futex anymore; this<br>
&gt; --=C2=A0 =C2=A0prevents ABA issues on the futex word.<br>
&gt; -+=C2=A0 =C2=A0are using the group&#39;s futex.<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 To represent which intervals in the waiter sequence the=
 groups cover (and<br>
&gt; -=C2=A0 =C2=A0 thus also which group slot contains G1 or G2), we use a=
 64b counter to<br>
&gt; -@@ -300,11 +298,12 @@ __condvar_cleanup_waiting (void *arg)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 last reference.<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 * Reference count used by waiters concurrently w=
ith signalers that have<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 acquired the condvar-internal lock.<br>
&gt; --=C2=A0 =C2=A0__g_signals: The number of signals that can still be co=
nsumed.<br>
&gt; -+=C2=A0 =C2=A0__g_signals: The number of signals that can still be co=
nsumed, relative to<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0the current g1_start.=C2=A0 (i.e. bits 31 to 1 o=
f __g_signals are bits<br>
&gt; -+=C2=A0 =C2=A0 =C2=A031 to 1 of g1_start with the signal count added)=
<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 * Used as a futex word by waiters.=C2=A0 Used co=
ncurrently by waiters and<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 signalers.<br>
&gt; --=C2=A0 =C2=A0 =C2=A0* LSB is true iff this group has been completely=
 signaled (i.e., it is<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0closed).<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0* LSB is currently reserved and 0.<br>
&gt; -=C2=A0 =C2=A0 __g_size: Waiters remaining in this group (i.e., which =
have not been<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 signaled yet.<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 * Accessed by signalers and waiters that cancel =
waiting (both do so only<br>
&gt; -@@ -328,18 +327,6 @@ __condvar_cleanup_waiting (void *arg)<br>
&gt; -=C2=A0 =C2=A0 sufficient because if a waiter can see a sufficiently l=
arge value, it could<br>
&gt; -=C2=A0 =C2=A0 have also consume a signal in the waiters group.<br>
&gt; -<br>
&gt; --=C2=A0 =C2=A0Waiters try to grab a signal from __g_signals without h=
olding a reference<br>
&gt; --=C2=A0 =C2=A0count, which can lead to stealing a signal from a more =
recent group after<br>
&gt; --=C2=A0 =C2=A0their own group was already closed.=C2=A0 They cannot a=
lways detect whether they<br>
&gt; --=C2=A0 =C2=A0in fact did because they do not know when they stole, b=
ut they can<br>
&gt; --=C2=A0 =C2=A0conservatively add a signal back to the group they stol=
e from; if they<br>
&gt; --=C2=A0 =C2=A0did so unnecessarily, all that happens is a spurious wa=
ke-up.=C2=A0 To make this<br>
&gt; --=C2=A0 =C2=A0even less likely, __g1_start contains the index of the =
current g2 too,<br>
&gt; --=C2=A0 =C2=A0which allows waiters to check if there aliasing on the =
group slots; if<br>
&gt; --=C2=A0 =C2=A0there wasn&#39;t, they didn&#39;t steal from the curren=
t G1, which means that the<br>
&gt; --=C2=A0 =C2=A0G1 they stole from must have been already closed and th=
ey do not need to<br>
&gt; --=C2=A0 =C2=A0fix anything.<br>
&gt; --<br>
&gt; -=C2=A0 =C2=A0 It is essential that the last field in pthread_cond_t i=
s __g_signals[1]:<br>
&gt; -=C2=A0 =C2=A0 The previous condvar used a pointer-sized field in pthr=
ead_cond_t, so a<br>
&gt; -=C2=A0 =C2=A0 PTHREAD_COND_INITIALIZER from that condvar implementati=
on might only<br>
&gt; -@@ -435,6 +422,9 @@ __pthread_cond_wait_common (pthread_cond_t *cond,=
 pthread_mutex_t *mutex,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0{<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0while (1)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint64_t g1_start =3D __condvar_l=
oad_g1_start_relaxed (cond);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned int lowseq =3D (g1_start=
 &amp; 1) =3D=3D g ? signals : g1_start &amp; ~1U;<br>
&gt; -+<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Spin-wait first.<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Note that spinning first wi=
thout checking whether a timeout<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 passed might lead to what l=
ooks like a spurious wake-up even<br>
&gt; -@@ -446,35 +436,45 @@ __pthread_cond_wait_common (pthread_cond_t *con=
d, pthread_mutex_t *mutex,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 having to compare against t=
he current time seems to be the right<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 choice from a performance p=
erspective for most use cases.=C2=A0 */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int spin =3D maxspin;<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 while (signals =3D=3D 0 &amp;&amp; spin =
&gt; 0)<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 while (spin &gt; 0 &amp;&amp; ((int)(sig=
nals - lowseq) &lt; 2))<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Check that we are =
not spinning on a group that&#39;s already<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 closed.=C2=A0=
 */<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (seq &lt; (__condvar_lo=
ad_g1_start_relaxed (cond) &gt;&gt; 1))<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto done;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (seq &lt; (g1_start &gt=
;&gt; 1))<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* TODO Back off.=C2=
=A0 */<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Reload signals.=C2=
=A0 See above for MO.=C2=A0 */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0signals =3D atomic_lo=
ad_acquire (cond-&gt;__data.__g_signals + g);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g1_start =3D __cond=
var_load_g1_start_relaxed (cond);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 lowseq =3D (g1_star=
t &amp; 1) =3D=3D g ? signals : g1_start &amp; ~1U;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0spin--;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; -<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* If our group will be closed as indica=
ted by the flag on signals,<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0don&#39;t bother grabbing a=
 signal.=C2=A0 */<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (signals &amp; 1)<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto done;<br>
&gt; --<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* If there is an available signal, don&=
#39;t block.=C2=A0 */<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (signals !=3D 0)<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (seq &lt; (g1_start &gt;&gt; 1=
))<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* If the group is =
closed already,<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0then this wai=
ter originally had enough extra signals to<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0consume, up u=
ntil the time its group was closed.=C2=A0 */<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto done;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; -+<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* If there is an available signal, don&=
#39;t block.<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0If __g1_start has ad=
vanced at all, then we must be in G1<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0by now, perhaps in the proc=
ess of switching back to an older<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0G2, but in either case we&#=
39;re allowed to consume the available<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0signal and should not block=
 anymore.=C2=A0 */<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((int)(signals - lowseq) &gt;=3D 2)<b=
r>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* No signals available after spinn=
ing, so prepare to block.<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 We first acquire a group re=
ference and use acquire MO for that so<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 that we synchronize with th=
e dummy read-modify-write in<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 __condvar_quiesce_and_switc=
h_g1 if we read from that.=C2=A0 In turn,<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0in this case this will make=
 us see the closed flag on __g_signals<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0that designates a concurren=
t attempt to reuse the group&#39;s slot.<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0in this case this will make=
 us see the advancement of __g_signals<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0to the upcoming new g1_star=
t that occurs with a concurrent<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0attempt to reuse the group&=
#39;s slot.<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 We use acquire MO for the _=
_g_signals check to make the<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 __g1_start check work (see =
spinning above).<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Note that the group referen=
ce acquisition will not mask the<br>
&gt; -@@ -482,15 +482,24 @@ __pthread_cond_wait_common (pthread_cond_t *con=
d, pthread_mutex_t *mutex,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 an atomic read-modify-write=
 operation and thus extend the release<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sequence.=C2=A0 */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0atomic_fetch_add_acquire (cond-&gt;=
__data.__g_refs + g, 2);<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (((atomic_load_acquire (cond-&gt;__da=
ta.__g_signals + g) &amp; 1) !=3D 0)<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 || (seq &lt; (__condvar_lo=
ad_g1_start_relaxed (cond) &gt;&gt; 1)))<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 signals =3D atomic_load_acquire (cond-&g=
t;__data.__g_signals + g);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g1_start =3D __condvar_load_g1_st=
art_relaxed (cond);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 lowseq =3D (g1_start &amp; 1) =3D=
=3D g ? signals : g1_start &amp; ~1U;<br>
&gt; -+<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (seq &lt; (g1_start &gt;&gt; 1=
))<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Our group is closed.=C2=
=A0 Wake up any signalers that might be<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0waiting.=C2=
=A0 */<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* group is closed =
already, so don&#39;t block */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0__condvar_dec_grefs (=
cond, g, private);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto done;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; -<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((int)(signals - lowseq) &gt;=3D 2)<b=
r>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* a signal showed up or G=
1/G2 switched after we grabbed the refcount */<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 __condvar_dec_grefs (cond,=
 g, private);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; -+<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// Now block.<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct _pthread_cleanup_buffer buff=
er;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct _condvar_cleanup_buffer cbuf=
fer;<br>
&gt; -@@ -501,7 +510,7 @@ __pthread_cond_wait_common (pthread_cond_t *cond,=
 pthread_mutex_t *mutex,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0__pthread_cleanup_push (&amp;buffer=
, __condvar_cleanup_waiting, &amp;cbuffer);<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0err =3D __futex_abstimed_wait_cance=
lable64 (<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cond-&gt;__data.__g_signals + g, =
0, clockid, abstime, private);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cond-&gt;__data.__g_signals + g, =
signals, clockid, abstime, private);<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0__pthread_cleanup_pop (&amp;buffer,=
 0);<br>
&gt; -<br>
&gt; -@@ -524,6 +533,8 @@ __pthread_cond_wait_common (pthread_cond_t *cond,=
 pthread_mutex_t *mutex,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0signals =3D atomic_load_acquire (co=
nd-&gt;__data.__g_signals + g);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; -<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (seq &lt; (__condvar_load_g1_start_rel=
axed (cond) &gt;&gt; 1))<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0goto done;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0}<br>
&gt; -=C2=A0 =C2=A0/* Try to grab a signal.=C2=A0 Use acquire MO so that we=
 see an up-to-date value<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 of __g1_start below (see spinning above for a si=
milar case).=C2=A0 In<br>
&gt; -@@ -532,69 +543,6 @@ __pthread_cond_wait_common (pthread_cond_t *cond=
, pthread_mutex_t *mutex,<br>
&gt; -=C2=A0 =C2=A0while (!atomic_compare_exchange_weak_acquire (cond-&gt;_=
_data.__g_signals + g,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0&amp;signals, signals - 2));<br>
&gt; -<br>
&gt; --=C2=A0 /* We consumed a signal but we could have consumed from a mor=
e recent group<br>
&gt; --=C2=A0 =C2=A0 =C2=A0that aliased with ours due to being in the same =
group slot.=C2=A0 If this<br>
&gt; --=C2=A0 =C2=A0 =C2=A0might be the case our group must be closed as vi=
sible through<br>
&gt; --=C2=A0 =C2=A0 =C2=A0__g1_start.=C2=A0 */<br>
&gt; --=C2=A0 uint64_t g1_start =3D __condvar_load_g1_start_relaxed (cond);=
<br>
&gt; --=C2=A0 if (seq &lt; (g1_start &gt;&gt; 1))<br>
&gt; --=C2=A0 =C2=A0 {<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 /* We potentially stole a signal from a more re=
cent group but we do not<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0know which group we really consumed from.=
<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0We do not care about groups older than cu=
rrent G1 because they are<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0closed; we could have stolen from these, =
but then we just add a<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0spurious wake-up for the current groups.<=
br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0We will never steal a signal from current=
 G2 that was really intended<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0for G2 because G2 never receives signals =
(until it becomes G1).=C2=A0 We<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0could have stolen a signal from G2 that w=
as conservatively added by a<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0previous waiter that also thought it stol=
e a signal -- but given that<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0that signal was added unnecessarily, it&#=
39;s not a problem if we steal<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0it.<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0Thus, the remaining case is that we could=
 have stolen from the current<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0G1, where &quot;current&quot; means the _=
_g1_start value we observed.=C2=A0 However,<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0if the current G1 does not have the same =
slot index as we do, we did<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0not steal from it and do not need to undo=
 that.=C2=A0 This is the reason<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0for putting a bit with G2&#39;s index int=
o__g1_start as well.=C2=A0 */<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 if (((g1_start &amp; 1) ^ 1) =3D=3D g)<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 {<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* We have to conservatively undo our po=
tential mistake of stealing<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0a signal.=C2=A0 We can stop=
 trying to do that when the current G1<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0changes because other spinn=
ing waiters will notice this too and<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0__condvar_quiesce_and_switc=
h_g1 has checked that there are no<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0futex waiters anymore befor=
e switching G1.<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Relaxed MO is fine for the =
__g1_start load because we need to<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0merely be able to observe t=
his fact and not have to observe<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0something else as well.<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0??? Would it help to spin f=
or a little while to see whether the<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0current G1 gets closed?=C2=
=A0 This might be worthwhile if the group is<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0small or close to being clo=
sed.=C2=A0 */<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned int s =3D atomic_load_relaxed (=
cond-&gt;__data.__g_signals + g);<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 while (__condvar_load_g1_start_relaxed (=
cond) =3D=3D g1_start)<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Try to add a signal.=C2=
=A0 We don&#39;t need to acquire the lock<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0because at wo=
rst we can cause a spurious wake-up.=C2=A0 If the<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0group is in t=
he process of being closed (LSB is true), this<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0has an effect=
 similar to us adding a signal.=C2=A0 */<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (((s &amp; 1) !=3D 0)<b=
r>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 || atomic_co=
mpare_exchange_weak_relaxed<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0(cond-&gt;__data.__g_signals + g, &amp;s, s + 2))<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* If we add=
ed a signal, we also need to add a wake-up on<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0the futex.=C2=A0 We also need to do that if we skipped adding<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0a signal because the group is being closed because<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0while __condvar_quiesce_and_switch_g1 could have closed<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0the group, it might stil be waiting for futex waiters to<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0leave (and one of those waiters might be the one we stole<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0the signal from, which cause it to block using the<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0futex).=C2=A0 */<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 futex_wake (=
cond-&gt;__data.__g_signals + g, 1, private);<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* TODO Back off.=C2=A0 */=
<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; --=C2=A0 =C2=A0 }<br>
&gt; --<br>
&gt; -=C2=A0 done:<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0/* Confirm that we have been woken.=C2=A0 We do that bef=
ore acquiring the mutex<br>
&gt; ---<br>
&gt; -2.49.0<br>
&gt; -<br>
&gt; diff --git a/meta/recipes-core/glibc/glibc/0026-PR25847-2.patch b/meta=
/recipes-core/glibc/glibc/0026-PR25847-2.patch<br>
&gt; deleted file mode 100644<br>
&gt; index cb89431769..0000000000<br>
&gt; --- a/meta/recipes-core/glibc/glibc/0026-PR25847-2.patch<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,144 +0,0 @@<br>
&gt; -From 6aab1191e35a3da66e8c49d95178a9d77c119a1f Mon Sep 17 00:00:00 200=
1<br>
&gt; -From: Malte Skarupke &lt;<a href=3D"mailto:malteskarupke@fastmail.fm"=
 target=3D"_blank" rel=3D"noreferrer">malteskarupke@fastmail.fm</a>&gt;<br>
&gt; -Date: Mon, 16 Jun 2025 23:17:53 -0700<br>
&gt; -Subject: [PATCH] nptl: Update comments and indentation for new condva=
r<br>
&gt; - implementation<br>
&gt; -<br>
&gt; -Some comments were wrong after the most recent commit. This fixes tha=
t.<br>
&gt; -Also fixing indentation where it was using spaces instead of tabs.<br=
>
&gt; -<br>
&gt; -The following commits have been cherry-picked from Glibc master branc=
h:<br>
&gt; -Bug : <a href=3D"https://sourceware.org/bugzilla/show_bug.cgi?id=3D25=
847" rel=3D"noreferrer noreferrer" target=3D"_blank">https://sourceware.org=
/bugzilla/show_bug.cgi?id=3D25847</a><br>
&gt; -<br>
&gt; -Upstream-Status: Backport<br>
&gt; -[<a href=3D"https://sourceware.org/git/?p=3Dglibc.git;a=3Dcommit;h=3D=
0cc973160c23bb67f895bc887dd6942d29f8fee3" rel=3D"noreferrer noreferrer" tar=
get=3D"_blank">https://sourceware.org/git/?p=3Dglibc.git;a=3Dcommit;h=3D0cc=
973160c23bb67f895bc887dd6942d29f8fee3</a>]<br>
&gt; -<br>
&gt; -Signed-off-by: Sunil Dora &lt;<a href=3D"mailto:sunilkumar.dora@windr=
iver.com" target=3D"_blank" rel=3D"noreferrer">sunilkumar.dora@windriver.co=
m</a>&gt;<br>
&gt; ----<br>
&gt; - nptl/pthread_cond_common.c |=C2=A0 5 +++--<br>
&gt; - nptl/pthread_cond_wait.c=C2=A0 =C2=A0| 39 +++++++++++++++++++-------=
------------<br>
&gt; - 2 files changed, 22 insertions(+), 22 deletions(-)<br>
&gt; -<br>
&gt; -diff --git a/nptl/pthread_cond_common.c b/nptl/pthread_cond_common.c<=
br>
&gt; -index 8dd7037923..306a207dd6 100644<br>
&gt; ---- a/nptl/pthread_cond_common.c<br>
&gt; -+++ b/nptl/pthread_cond_common.c<br>
&gt; -@@ -221,8 +221,9 @@ __condvar_quiesce_and_switch_g1 (pthread_cond_t *=
cond, uint64_t wseq,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 * New waiters arriving concurrently with the gro=
up switching will all go<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 into G2 until we atomically make the swit=
ch.=C2=A0 Waiters existing in G2<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 are not affected.<br>
&gt; --=C2=A0 =C2=A0 =C2=A0* Waiters in G1 will be closed out immediately b=
y the advancing of<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0__g_signals to the next &quot;lowseq&quot=
; (low 31 bits of the new g1_start),<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0* Waiters in G1 have already received a signal a=
nd been woken. If they<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0haven&#39;t woken yet, they will be close=
d out immediately by the advancing<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0of __g_signals to the next &quot;lowseq&q=
uot; (low 31 bits of the new g1_start),<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 which will prevent waiters from blocking =
using a futex on<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 __g_signals since it provides enough sign=
als for all possible<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 remaining waiters.=C2=A0 As a result, the=
y can each consume a signal<br>
&gt; -diff --git a/nptl/pthread_cond_wait.c b/nptl/pthread_cond_wait.c<br>
&gt; -index 1cb3dbf7b0..cee1968756 100644<br>
&gt; ---- a/nptl/pthread_cond_wait.c<br>
&gt; -+++ b/nptl/pthread_cond_wait.c<br>
&gt; -@@ -249,7 +249,7 @@ __condvar_cleanup_waiting (void *arg)<br>
&gt; -=C2=A0 =C2=A0 figure out whether they are in a group that has already=
 been completely<br>
&gt; -=C2=A0 =C2=A0 signaled (i.e., if the current G1 starts at a later pos=
ition that the<br>
&gt; -=C2=A0 =C2=A0 waiter&#39;s position).=C2=A0 Waiters cannot determine =
whether they are currently<br>
&gt; --=C2=A0 =C2=A0in G2 or G1 -- but they do not have too because all the=
y are interested in<br>
&gt; -+=C2=A0 =C2=A0in G2 or G1 -- but they do not have to because all they=
 are interested in<br>
&gt; -=C2=A0 =C2=A0 is whether there are available signals, and they always=
 start in G2 (whose<br>
&gt; -=C2=A0 =C2=A0 group slot they know because of the bit in the waiter s=
equence.=C2=A0 Signalers<br>
&gt; -=C2=A0 =C2=A0 will simply fill the right group until it is completely=
 signaled and can<br>
&gt; -@@ -412,7 +412,7 @@ __pthread_cond_wait_common (pthread_cond_t *cond,=
 pthread_mutex_t *mutex,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0}<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0/* Now wait until a signal is available in our group or =
it is closed.<br>
&gt; --=C2=A0 =C2=A0 =C2=A0Acquire MO so that if we observe a value of zero=
 written after group<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0Acquire MO so that if we observe (signals =3D=3D=
 lowseq) after group<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 switching in __condvar_quiesce_and_switch_g1, we=
 synchronize with that<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 store and will see the prior update of __g1_star=
t done while switching<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 groups too.=C2=A0 */<br>
&gt; -@@ -422,8 +422,8 @@ __pthread_cond_wait_common (pthread_cond_t *cond,=
 pthread_mutex_t *mutex,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0{<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0while (1)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint64_t g1_start =3D __condvar_l=
oad_g1_start_relaxed (cond);<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned int lowseq =3D (g1_start=
 &amp; 1) =3D=3D g ? signals : g1_start &amp; ~1U;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 uint64_t g1_start =3D __condvar_load_g1_=
start_relaxed (cond);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned int lowseq =3D (g1_start &amp; =
1) =3D=3D g ? signals : g1_start &amp; ~1U;<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Spin-wait first.<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Note that spinning first wi=
thout checking whether a timeout<br>
&gt; -@@ -447,21 +447,21 @@ __pthread_cond_wait_common (pthread_cond_t *con=
d, pthread_mutex_t *mutex,<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Reload signals.=C2=
=A0 See above for MO.=C2=A0 */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0signals =3D atomic_lo=
ad_acquire (cond-&gt;__data.__g_signals + g);<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g1_start =3D __cond=
var_load_g1_start_relaxed (cond);<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 lowseq =3D (g1_star=
t &amp; 1) =3D=3D g ? signals : g1_start &amp; ~1U;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g1_start =3D __condvar_loa=
d_g1_start_relaxed (cond);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 lowseq =3D (g1_start &amp;=
 1) =3D=3D g ? signals : g1_start &amp; ~1U;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0spin--;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; -<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (seq &lt; (g1_start &gt;&gt; 1=
))<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (seq &lt; (g1_start &gt;&gt; 1))<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* If the group is =
closed already,<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* If the group is closed =
already,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 then this wai=
ter originally had enough extra signals to<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 consume, up u=
ntil the time its group was closed.=C2=A0 */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto done;<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* If there is an available signal,=
 don&#39;t block.<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0If __g1_start has ad=
vanced at all, then we must be in G1<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0If __g1_start has advanced =
at all, then we must be in G1<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 by now, perhaps in the proc=
ess of switching back to an older<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 G2, but in either case we&#=
39;re allowed to consume the available<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 signal and should not block=
 anymore.=C2=A0 */<br>
&gt; -@@ -483,22 +483,23 @@ __pthread_cond_wait_common (pthread_cond_t *con=
d, pthread_mutex_t *mutex,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sequence.=C2=A0 */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0atomic_fetch_add_acquire (cond-&gt;=
__data.__g_refs + g, 2);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0signals =3D atomic_load_acquire (co=
nd-&gt;__data.__g_signals + g);<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g1_start =3D __condvar_load_g1_st=
art_relaxed (cond);<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 lowseq =3D (g1_start &amp; 1) =3D=
=3D g ? signals : g1_start &amp; ~1U;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 g1_start =3D __condvar_load_g1_start_rel=
axed (cond);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 lowseq =3D (g1_start &amp; 1) =3D=3D g ?=
 signals : g1_start &amp; ~1U;<br>
&gt; -<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (seq &lt; (g1_start &gt;&gt; 1=
))<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (seq &lt; (g1_start &gt;&gt; 1))<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* group is closed =
already, so don&#39;t block */<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* group is closed already=
, so don&#39;t block */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0__condvar_dec_grefs (=
cond, g, private);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto done;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ((int)(signals - lowseq) &gt;=3D=
 2)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* a signal showed up or G=
1/G2 switched after we grabbed the refcount */<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* a signal showed up or G=
1/G2 switched after we grabbed the<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0refcount */<b=
r>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0__condvar_dec_grefs (=
cond, g, private);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// Now block.<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct _pthread_cleanup_buffer buff=
er;<br>
&gt; -@@ -536,10 +537,8 @@ __pthread_cond_wait_common (pthread_cond_t *cond=
, pthread_mutex_t *mutex,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (seq &lt; (__condvar_load_g1_start_rel=
axed (cond) &gt;&gt; 1))<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto done;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0}<br>
&gt; --=C2=A0 /* Try to grab a signal.=C2=A0 Use acquire MO so that we see =
an up-to-date value<br>
&gt; --=C2=A0 =C2=A0 =C2=A0of __g1_start below (see spinning above for a si=
milar case).=C2=A0 In<br>
&gt; --=C2=A0 =C2=A0 =C2=A0particular, if we steal from a more recent group=
, we will also see a<br>
&gt; --=C2=A0 =C2=A0 =C2=A0more recent __g1_start below.=C2=A0 */<br>
&gt; -+=C2=A0 /* Try to grab a signal.=C2=A0 See above for MO.=C2=A0 (if we=
 do another loop<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0iteration we need to see the correct value of g1=
_start)=C2=A0 */<br>
&gt; -=C2=A0 =C2=A0while (!atomic_compare_exchange_weak_acquire (cond-&gt;_=
_data.__g_signals + g,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0&amp;signals, signals - 2));<br>
&gt; -<br>
&gt; ---<br>
&gt; -2.49.0<br>
&gt; -<br>
&gt; diff --git a/meta/recipes-core/glibc/glibc/0026-PR25847-3.patch b/meta=
/recipes-core/glibc/glibc/0026-PR25847-3.patch<br>
&gt; deleted file mode 100644<br>
&gt; index 4cfcca846c..0000000000<br>
&gt; --- a/meta/recipes-core/glibc/glibc/0026-PR25847-3.patch<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,77 +0,0 @@<br>
&gt; -From 28a5082045429fdc5a4744d45fdc5b5202528eaa Mon Sep 17 00:00:00 200=
1<br>
&gt; -From: Malte Skarupke &lt;<a href=3D"mailto:malteskarupke@fastmail.fm"=
 target=3D"_blank" rel=3D"noreferrer">malteskarupke@fastmail.fm</a>&gt;<br>
&gt; -Date: Mon, 16 Jun 2025 23:29:49 -0700<br>
&gt; -Subject: [PATCH] nptl: Remove unnecessary catch-all-wake in condvar g=
roup<br>
&gt; - switch<br>
&gt; -<br>
&gt; -This wake is unnecessary. We only switch groups after every sleeper i=
n a group<br>
&gt; -has been woken. Sure, they may take a while to actually wake up and m=
ay still<br>
&gt; -hold a reference, but waking them a second time doesn&#39;t speed tha=
t up. Instead<br>
&gt; -this just makes the code more complicated and may hide problems.<br>
&gt; -<br>
&gt; -In particular this safety wake wouldn&#39;t even have helped with the=
 bug that was<br>
&gt; -fixed by Barrus&#39; patch: The bug there was that pthread_cond_signa=
l would not<br>
&gt; -switch g1 when it should, so we wouldn&#39;t even have entered this c=
ode path.<br>
&gt; -<br>
&gt; -The following commits have been cherry-picked from Glibc master branc=
h:<br>
&gt; -Bug : <a href=3D"https://sourceware.org/bugzilla/show_bug.cgi?id=3D25=
847" rel=3D"noreferrer noreferrer" target=3D"_blank">https://sourceware.org=
/bugzilla/show_bug.cgi?id=3D25847</a><br>
&gt; -<br>
&gt; -Upstream-Status: Backport<br>
&gt; -[<a href=3D"https://sourceware.org/git/?p=3Dglibc.git;a=3Dcommit;h=3D=
b42cc6af11062c260c7dfa91f1c89891366fed3e" rel=3D"noreferrer noreferrer" tar=
get=3D"_blank">https://sourceware.org/git/?p=3Dglibc.git;a=3Dcommit;h=3Db42=
cc6af11062c260c7dfa91f1c89891366fed3e</a>]<br>
&gt; -<br>
&gt; -Signed-off-by: Sunil Dora &lt;<a href=3D"mailto:sunilkumar.dora@windr=
iver.com" target=3D"_blank" rel=3D"noreferrer">sunilkumar.dora@windriver.co=
m</a>&gt;<br>
&gt; ----<br>
&gt; - nptl/pthread_cond_common.c | 30 +-----------------------------<br>
&gt; - 1 file changed, 1 insertion(+), 29 deletions(-)<br>
&gt; -<br>
&gt; -diff --git a/nptl/pthread_cond_common.c b/nptl/pthread_cond_common.c<=
br>
&gt; -index 306a207dd6..f976a533a1 100644<br>
&gt; ---- a/nptl/pthread_cond_common.c<br>
&gt; -+++ b/nptl/pthread_cond_common.c<br>
&gt; -@@ -221,13 +221,7 @@ __condvar_quiesce_and_switch_g1 (pthread_cond_t =
*cond, uint64_t wseq,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 * New waiters arriving concurrently with the gro=
up switching will all go<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 into G2 until we atomically make the swit=
ch.=C2=A0 Waiters existing in G2<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 are not affected.<br>
&gt; --=C2=A0 =C2=A0 =C2=A0* Waiters in G1 have already received a signal a=
nd been woken. If they<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0haven&#39;t woken yet, they will be close=
d out immediately by the advancing<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0of __g_signals to the next &quot;lowseq&q=
uot; (low 31 bits of the new g1_start),<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0which will prevent waiters from blocking =
using a futex on<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0__g_signals since it provides enough sign=
als for all possible<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0remaining waiters.=C2=A0 As a result, the=
y can each consume a signal<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0and they will eventually remove their gro=
up reference.=C2=A0 */<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0* Waiters in G1 have already received a signal a=
nd been woken.=C2=A0 */<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0/* Update __g1_start, which finishes closing this group.=
=C2=A0 The value we add<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 will never be negative because old_orig_size can=
 only be zero when we<br>
&gt; -@@ -240,28 +234,6 @@ __condvar_quiesce_and_switch_g1 (pthread_cond_t =
*cond, uint64_t wseq,<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0unsigned int lowseq =3D ((old_g1_start + old_orig_size) =
&lt;&lt; 1) &amp; ~1U;<br>
&gt; -<br>
&gt; --=C2=A0 /* If any waiters still hold group references (and thus could=
 be blocked),<br>
&gt; --=C2=A0 =C2=A0 =C2=A0then wake them all up now and prevent any runnin=
g ones from blocking.<br>
&gt; --=C2=A0 =C2=A0 =C2=A0This is effectively a catch-all for any possible=
 current or future<br>
&gt; --=C2=A0 =C2=A0 =C2=A0bugs that can allow the group size to reach 0 be=
fore all G1 waiters<br>
&gt; --=C2=A0 =C2=A0 =C2=A0have been awakened or at least given signals to =
consume, or any<br>
&gt; --=C2=A0 =C2=A0 =C2=A0other case that can leave blocked (or about to b=
lock) older waiters..=C2=A0 */<br>
&gt; --=C2=A0 if ((atomic_fetch_or_release (cond-&gt;__data.__g_refs + g1, =
0) &gt;&gt; 1) &gt; 0)<br>
&gt; --=C2=A0 =C2=A0{<br>
&gt; --=C2=A0 =C2=A0 /* First advance signals to the end of the group (i.e.=
 enough signals<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0for the entire G1 group) to ensure that w=
aiters which have not<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0yet blocked in the futex will not block.<=
br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0Note that in the vast majority of cases, =
this should never<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0actually be necessary, since __g_signals =
will have enough<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0signals for the remaining g_refs waiters.=
=C2=A0 As an optimization,<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0we could check this first before proceedi=
ng, although that<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0could still leave the potential for futex=
 lost wakeup bugs<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0if the signal count was non-zero but the =
futex wakeup<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0was somehow lost.=C2=A0 */<br>
&gt; --=C2=A0 =C2=A0 atomic_store_release (cond-&gt;__data.__g_signals + g1=
, lowseq);<br>
&gt; --<br>
&gt; --=C2=A0 =C2=A0 futex_wake (cond-&gt;__data.__g_signals + g1, INT_MAX,=
 private);<br>
&gt; --=C2=A0 =C2=A0}<br>
&gt; -=C2=A0 =C2=A0/* At this point, the old G1 is now a valid new G2 (but =
not in use yet).<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 No old waiter can neither grab a signal nor acqu=
ire a reference without<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 noticing that __g1_start is larger.<br>
&gt; ---<br>
&gt; -2.49.0<br>
&gt; -<br>
&gt; diff --git a/meta/recipes-core/glibc/glibc/0026-PR25847-4.patch b/meta=
/recipes-core/glibc/glibc/0026-PR25847-4.patch<br>
&gt; deleted file mode 100644<br>
&gt; index f8674d62ae..0000000000<br>
&gt; --- a/meta/recipes-core/glibc/glibc/0026-PR25847-4.patch<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,117 +0,0 @@<br>
&gt; -From 16b9af737c77b153fca4f36cbdbe94f7416c0b42 Mon Sep 17 00:00:00 200=
1<br>
&gt; -From: Malte Skarupke &lt;<a href=3D"mailto:malteskarupke@fastmail.fm"=
 target=3D"_blank" rel=3D"noreferrer">malteskarupke@fastmail.fm</a>&gt;<br>
&gt; -Date: Mon, 16 Jun 2025 23:38:40 -0700<br>
&gt; -Subject: [PATCH] nptl: Remove unnecessary quadruple check in pthread_=
cond_wait<br>
&gt; -<br>
&gt; -pthread_cond_wait was checking whether it was in a closed group no le=
ss than<br>
&gt; -four times. Checking once is enough. Here are the four checks:<br>
&gt; -<br>
&gt; -1. While spin-waiting. This was dead code: maxspin is set to 0 and ha=
s been<br>
&gt; -=C2=A0 =C2=A0for years.<br>
&gt; -2. Before deciding to go to sleep, and before incrementing grefs: I k=
ept this<br>
&gt; -3. After incrementing grefs. There is no reason to think that the gro=
up would<br>
&gt; -=C2=A0 =C2=A0close while we do an atomic increment. Obviously it coul=
d close at any<br>
&gt; -=C2=A0 =C2=A0point, but that doesn&#39;t mean we have to recheck afte=
r every step. This<br>
&gt; -=C2=A0 =C2=A0check was equally good as check 2, except it has to do m=
ore work.<br>
&gt; -4. When we find ourselves in a group that has a signal. We only get h=
ere after<br>
&gt; -=C2=A0 =C2=A0we check that we&#39;re not in a closed group. There is =
no need to check again.<br>
&gt; -=C2=A0 =C2=A0The check would only have helped in cases where the comp=
are_exchange in the<br>
&gt; -=C2=A0 =C2=A0next line would also have failed. Relying on the compare=
_exchange is fine.<br>
&gt; -<br>
&gt; -Removing the duplicate checks clarifies the code.<br>
&gt; -<br>
&gt; -The following commits have been cherry-picked from Glibc master branc=
h:<br>
&gt; -Bug : <a href=3D"https://sourceware.org/bugzilla/show_bug.cgi?id=3D25=
847" rel=3D"noreferrer noreferrer" target=3D"_blank">https://sourceware.org=
/bugzilla/show_bug.cgi?id=3D25847</a><br>
&gt; -<br>
&gt; -Upstream-Status: Backport<br>
&gt; -[<a href=3D"https://sourceware.org/git/?p=3Dglibc.git;a=3Dcommit;h=3D=
4f7b051f8ee3feff1b53b27a906f245afaa9cee1" rel=3D"noreferrer noreferrer" tar=
get=3D"_blank">https://sourceware.org/git/?p=3Dglibc.git;a=3Dcommit;h=3D4f7=
b051f8ee3feff1b53b27a906f245afaa9cee1</a>]<br>
&gt; -<br>
&gt; -Signed-off-by: Sunil Dora &lt;<a href=3D"mailto:sunilkumar.dora@windr=
iver.com" target=3D"_blank" rel=3D"noreferrer">sunilkumar.dora@windriver.co=
m</a>&gt;<br>
&gt; ----<br>
&gt; - nptl/pthread_cond_wait.c | 49 --------------------------------------=
--<br>
&gt; - 1 file changed, 49 deletions(-)<br>
&gt; -<br>
&gt; -diff --git a/nptl/pthread_cond_wait.c b/nptl/pthread_cond_wait.c<br>
&gt; -index cee1968756..47e834cade 100644<br>
&gt; ---- a/nptl/pthread_cond_wait.c<br>
&gt; -+++ b/nptl/pthread_cond_wait.c<br>
&gt; -@@ -366,7 +366,6 @@ static __always_inline int<br>
&gt; - __pthread_cond_wait_common (pthread_cond_t *cond, pthread_mutex_t *m=
utex,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0clockid_t clockid, const struct __timespec64 *abs=
time)<br>
&gt; - {<br>
&gt; --=C2=A0 const int maxspin =3D 0;<br>
&gt; -=C2=A0 =C2=A0int err;<br>
&gt; -=C2=A0 =C2=A0int result =3D 0;<br>
&gt; -<br>
&gt; -@@ -425,33 +424,6 @@ __pthread_cond_wait_common (pthread_cond_t *cond=
, pthread_mutex_t *mutex,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uint64_t g1_start =3D __condvar_loa=
d_g1_start_relaxed (cond);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int lowseq =3D (g1_start &=
amp; 1) =3D=3D g ? signals : g1_start &amp; ~1U;<br>
&gt; -<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Spin-wait first.<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Note that spinning first wi=
thout checking whether a timeout<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0passed might lead to what l=
ooks like a spurious wake-up even<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0though we should return ETI=
MEDOUT (e.g., if the caller provides<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0an absolute timeout that is=
 clearly in the past).=C2=A0 However,<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(1) spurious wake-ups are a=
llowed, (2) it seems unlikely that a<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0user will (ab)use pthread_c=
ond_wait as a check for whether a<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0point in time is in the pas=
t, and (3) spinning first without<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0having to compare against t=
he current time seems to be the right<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0choice from a performance p=
erspective for most use cases.=C2=A0 */<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned int spin =3D maxspin;<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 while (spin &gt; 0 &amp;&amp; ((int)(sig=
nals - lowseq) &lt; 2))<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Check that we are not s=
pinning on a group that&#39;s already<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0closed.=C2=A0=
 */<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (seq &lt; (g1_start &gt=
;&gt; 1))<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; --<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* TODO Back off.=C2=A0 */=
<br>
&gt; --<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Reload signals.=C2=A0 S=
ee above for MO.=C2=A0 */<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 signals =3D atomic_load_ac=
quire (cond-&gt;__data.__g_signals + g);<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g1_start =3D __condvar_loa=
d_g1_start_relaxed (cond);<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 lowseq =3D (g1_start &amp;=
 1) =3D=3D g ? signals : g1_start &amp; ~1U;<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 spin--;<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; --<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (seq &lt; (g1_start &gt;&gt; 1))=
<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* If the group is cl=
osed already,<br>
&gt; -@@ -482,24 +454,6 @@ __pthread_cond_wait_common (pthread_cond_t *cond=
, pthread_mutex_t *mutex,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 an atomic read-modify-write=
 operation and thus extend the release<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sequence.=C2=A0 */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0atomic_fetch_add_acquire (cond-&gt;=
__data.__g_refs + g, 2);<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 signals =3D atomic_load_acquire (cond-&g=
t;__data.__g_signals + g);<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 g1_start =3D __condvar_load_g1_start_rel=
axed (cond);<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 lowseq =3D (g1_start &amp; 1) =3D=3D g ?=
 signals : g1_start &amp; ~1U;<br>
&gt; --<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (seq &lt; (g1_start &gt;&gt; 1))<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* group is closed already=
, so don&#39;t block */<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 __condvar_dec_grefs (cond,=
 g, private);<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto done;<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; --<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((int)(signals - lowseq) &gt;=3D 2)<b=
r>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* a signal showed up or G=
1/G2 switched after we grabbed the<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0refcount */<b=
r>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 __condvar_dec_grefs (cond,=
 g, private);<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// Now block.<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct _pthread_cleanup_buffer buff=
er;<br>
&gt; -@@ -533,9 +487,6 @@ __pthread_cond_wait_common (pthread_cond_t *cond,=
 pthread_mutex_t *mutex,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Reload signals.=C2=A0 See above =
for MO.=C2=A0 */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0signals =3D atomic_load_acquire (co=
nd-&gt;__data.__g_signals + g);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; --<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0if (seq &lt; (__condvar_load_g1_start_rel=
axed (cond) &gt;&gt; 1))<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0goto done;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0}<br>
&gt; -=C2=A0 =C2=A0/* Try to grab a signal.=C2=A0 See above for MO.=C2=A0 (=
if we do another loop<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 iteration we need to see the correct value of g1=
_start)=C2=A0 */<br>
&gt; ---<br>
&gt; -2.49.0<br>
&gt; -<br>
&gt; diff --git a/meta/recipes-core/glibc/glibc/0026-PR25847-5.patch b/meta=
/recipes-core/glibc/glibc/0026-PR25847-5.patch<br>
&gt; deleted file mode 100644<br>
&gt; index 16fe6f8460..0000000000<br>
&gt; --- a/meta/recipes-core/glibc/glibc/0026-PR25847-5.patch<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,105 +0,0 @@<br>
&gt; -From d9ffb50dc55f77e584a5d0275eea758c7a6b04e3 Mon Sep 17 00:00:00 200=
1<br>
&gt; -From: Malte Skarupke &lt;<a href=3D"mailto:malteskarupke@fastmail.fm"=
 target=3D"_blank" rel=3D"noreferrer">malteskarupke@fastmail.fm</a>&gt;<br>
&gt; -Date: Mon, 16 Jun 2025 23:53:35 -0700<br>
&gt; -Subject: [PATCH] nptl: Use a single loop in pthread_cond_wait instaed=
 of a<br>
&gt; - nested loop<br>
&gt; -<br>
&gt; -The loop was a little more complicated than necessary. There was only=
 one<br>
&gt; -break statement out of the inner loop, and the outer loop was nearly =
empty.<br>
&gt; -So just remove the outer loop, moving its code to the one break state=
ment in<br>
&gt; -the inner loop. This allows us to replace all gotos with break statem=
ents.<br>
&gt; -<br>
&gt; -The following commits have been cherry-picked from Glibc master branc=
h:<br>
&gt; -Bug : <a href=3D"https://sourceware.org/bugzilla/show_bug.cgi?id=3D25=
847" rel=3D"noreferrer noreferrer" target=3D"_blank">https://sourceware.org=
/bugzilla/show_bug.cgi?id=3D25847</a><br>
&gt; -<br>
&gt; -Upstream-Status: Backport<br>
&gt; -[<a href=3D"https://sourceware.org/git/?p=3Dglibc.git;a=3Dcommit;h=3D=
929a4764ac90382616b6a21f099192b2475da674" rel=3D"noreferrer noreferrer" tar=
get=3D"_blank">https://sourceware.org/git/?p=3Dglibc.git;a=3Dcommit;h=3D929=
a4764ac90382616b6a21f099192b2475da674</a>]<br>
&gt; -<br>
&gt; -Signed-off-by: Sunil Dora &lt;<a href=3D"mailto:sunilkumar.dora@windr=
iver.com" target=3D"_blank" rel=3D"noreferrer">sunilkumar.dora@windriver.co=
m</a>&gt;<br>
&gt; ----<br>
&gt; - nptl/pthread_cond_wait.c | 41 +++++++++++++++++++-------------------=
--<br>
&gt; - 1 file changed, 19 insertions(+), 22 deletions(-)<br>
&gt; -<br>
&gt; -diff --git a/nptl/pthread_cond_wait.c b/nptl/pthread_cond_wait.c<br>
&gt; -index 47e834cade..5c86880105 100644<br>
&gt; ---- a/nptl/pthread_cond_wait.c<br>
&gt; -+++ b/nptl/pthread_cond_wait.c<br>
&gt; -@@ -410,17 +410,15 @@ __pthread_cond_wait_common (pthread_cond_t *con=
d, pthread_mutex_t *mutex,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0return err;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0}<br>
&gt; -<br>
&gt; --=C2=A0 /* Now wait until a signal is available in our group or it is=
 closed.<br>
&gt; --=C2=A0 =C2=A0 =C2=A0Acquire MO so that if we observe (signals =3D=3D=
 lowseq) after group<br>
&gt; --=C2=A0 =C2=A0 =C2=A0switching in __condvar_quiesce_and_switch_g1, we=
 synchronize with that<br>
&gt; --=C2=A0 =C2=A0 =C2=A0store and will see the prior update of __g1_star=
t done while switching<br>
&gt; --=C2=A0 =C2=A0 =C2=A0groups too.=C2=A0 */<br>
&gt; --=C2=A0 unsigned int signals =3D atomic_load_acquire (cond-&gt;__data=
.__g_signals + g);<br>
&gt; --<br>
&gt; --=C2=A0 do<br>
&gt; --=C2=A0 =C2=A0 {<br>
&gt; -+<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0while (1)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Now wait until a signal is available =
in our group or it is closed.<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Acquire MO so that if we ob=
serve (signals =3D=3D lowseq) after group<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0switching in __condvar_quie=
sce_and_switch_g1, we synchronize with that<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0store and will see the prio=
r update of __g1_start done while switching<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0groups too.=C2=A0 */<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned int signals =3D atomic_load_acq=
uire (cond-&gt;__data.__g_signals + g);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uint64_t g1_start =3D __condvar_loa=
d_g1_start_relaxed (cond);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int lowseq =3D (g1_start &=
amp; 1) =3D=3D g ? signals : g1_start &amp; ~1U;<br>
&gt; -<br>
&gt; -@@ -429,7 +427,7 @@ __pthread_cond_wait_common (pthread_cond_t *cond,=
 pthread_mutex_t *mutex,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* If the group is cl=
osed already,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 then this wai=
ter originally had enough extra signals to<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 consume, up u=
ntil the time its group was closed.=C2=A0 */<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto done;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* If there is an available signal,=
 don&#39;t block.<br>
&gt; -@@ -438,8 +436,16 @@ __pthread_cond_wait_common (pthread_cond_t *cond=
, pthread_mutex_t *mutex,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 G2, but in either case we&#=
39;re allowed to consume the available<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 signal and should not block=
 anymore.=C2=A0 */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ((int)(signals - lowseq) &gt;=3D=
 2)<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; --<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Try to grab a sig=
nal.=C2=A0 See above for MO.=C2=A0 (if we do another loop<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 iteration we=
 need to see the correct value of g1_start)=C2=A0 */<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0if (atomic_compare_exchange_weak_acquire (<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cond-&gt;__data.__g_signals + =
g,<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&amp;signals, signals - 2))<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0break;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0else<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0continue;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* No signals available after spinn=
ing, so prepare to block.<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 We first acquire a group re=
ference and use acquire MO for that so<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 that we synchronize with th=
e dummy read-modify-write in<br>
&gt; -@@ -479,21 +485,12 @@ __pthread_cond_wait_common (pthread_cond_t *con=
d, pthread_mutex_t *mutex,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 the lock duri=
ng cancellation is not possible.=C2=A0 */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0__condvar_cancel_wait=
ing (cond, seq, g, private);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0result =3D err;<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto done;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0__condvar_dec_grefs (cond, g=
, private);<br>
&gt; -<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Reload signals.=C2=A0 See above for M=
O.=C2=A0 */<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 signals =3D atomic_load_acquire (cond-&g=
t;__data.__g_signals + g);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; --=C2=A0 =C2=A0 }<br>
&gt; --=C2=A0 /* Try to grab a signal.=C2=A0 See above for MO.=C2=A0 (if we=
 do another loop<br>
&gt; --=C2=A0 =C2=A0 =C2=A0iteration we need to see the correct value of g1=
_start)=C2=A0 */<br>
&gt; --=C2=A0 while (!atomic_compare_exchange_weak_acquire (cond-&gt;__data=
.__g_signals + g,<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 &amp;signals, signals - 2));<br>
&gt; --<br>
&gt; -- done:<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0/* Confirm that we have been woken.=C2=A0 We do that bef=
ore acquiring the mutex<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 to allow for execution of pthread_cond_destroy w=
hile having acquired the<br>
&gt; ---<br>
&gt; -2.49.0<br>
&gt; -<br>
&gt; diff --git a/meta/recipes-core/glibc/glibc/0026-PR25847-6.patch b/meta=
/recipes-core/glibc/glibc/0026-PR25847-6.patch<br>
&gt; deleted file mode 100644<br>
&gt; index cf87e21ddd..0000000000<br>
&gt; --- a/meta/recipes-core/glibc/glibc/0026-PR25847-6.patch<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,169 +0,0 @@<br>
&gt; -From a2faee6d0dac6e5232255da9afda4d9ed6cfb6e5 Mon Sep 17 00:00:00 200=
1<br>
&gt; -From: Malte Skarupke &lt;<a href=3D"mailto:malteskarupke@fastmail.fm"=
 target=3D"_blank" rel=3D"noreferrer">malteskarupke@fastmail.fm</a>&gt;<br>
&gt; -Date: Tue, 17 Jun 2025 01:37:12 -0700<br>
&gt; -Subject: [PATCH] nptl: Fix indentation<br>
&gt; -<br>
&gt; -In my previous change I turned a nested loop into a simple loop. I&#3=
9;m doing<br>
&gt; -the resulting indentation changes in a separate commit to make the di=
ff on<br>
&gt; -the previous commit easier to review.<br>
&gt; -<br>
&gt; -The following commits have been cherry-picked from Glibc master branc=
h:<br>
&gt; -Bug : <a href=3D"https://sourceware.org/bugzilla/show_bug.cgi?id=3D25=
847" rel=3D"noreferrer noreferrer" target=3D"_blank">https://sourceware.org=
/bugzilla/show_bug.cgi?id=3D25847</a><br>
&gt; -<br>
&gt; -Upstream-Status: Backport<br>
&gt; -[<a href=3D"https://sourceware.org/git/?p=3Dglibc.git;a=3Dcommit;h=3D=
ee6c14ed59d480720721aaacc5fb03213dc153da" rel=3D"noreferrer noreferrer" tar=
get=3D"_blank">https://sourceware.org/git/?p=3Dglibc.git;a=3Dcommit;h=3Dee6=
c14ed59d480720721aaacc5fb03213dc153da</a>]<br>
&gt; -<br>
&gt; -Signed-off-by: Sunil Dora &lt;<a href=3D"mailto:sunilkumar.dora@windr=
iver.com" target=3D"_blank" rel=3D"noreferrer">sunilkumar.dora@windriver.co=
m</a>&gt;<br>
&gt; ----<br>
&gt; - nptl/pthread_cond_wait.c | 132 ++++++++++++++++---------------------=
--<br>
&gt; - 1 file changed, 54 insertions(+), 78 deletions(-)<br>
&gt; -<br>
&gt; -diff --git a/nptl/pthread_cond_wait.c b/nptl/pthread_cond_wait.c<br>
&gt; -index 5c86880105..104ebd48ca 100644<br>
&gt; ---- a/nptl/pthread_cond_wait.c<br>
&gt; -+++ b/nptl/pthread_cond_wait.c<br>
&gt; -@@ -410,87 +410,63 @@ __pthread_cond_wait_common (pthread_cond_t *con=
d, pthread_mutex_t *mutex,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0return err;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0}<br>
&gt; -<br>
&gt; --<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 while (1)<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 {<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Now wait until a signal is available =
in our group or it is closed.<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Acquire MO so that if we ob=
serve (signals =3D=3D lowseq) after group<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0switching in __condvar_quie=
sce_and_switch_g1, we synchronize with that<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0store and will see the prio=
r update of __g1_start done while switching<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0groups too.=C2=A0 */<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned int signals =3D atomic_load_acq=
uire (cond-&gt;__data.__g_signals + g);<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 uint64_t g1_start =3D __condvar_load_g1_=
start_relaxed (cond);<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned int lowseq =3D (g1_start &amp; =
1) =3D=3D g ? signals : g1_start &amp; ~1U;<br>
&gt; --<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (seq &lt; (g1_start &gt;&gt; 1))<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* If the group is closed =
already,<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0then this wai=
ter originally had enough extra signals to<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0consume, up u=
ntil the time its group was closed.=C2=A0 */<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; --<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* If there is an available signal, don&=
#39;t block.<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0If __g1_start has advanced =
at all, then we must be in G1<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0by now, perhaps in the proc=
ess of switching back to an older<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0G2, but in either case we&#=
39;re allowed to consume the available<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0signal and should not block=
 anymore.=C2=A0 */<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((int)(signals - lowseq) &gt;=3D 2)<b=
r>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Try to grab a sig=
nal.=C2=A0 See above for MO.=C2=A0 (if we do another loop<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 iteration we=
 need to see the correct value of g1_start)=C2=A0 */<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0if (atomic_compare_exchange_weak_acquire (<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cond-&gt;__data.__g_signals + =
g,<br>
&gt; -+=C2=A0 while (1)<br>
&gt; -+=C2=A0 =C2=A0 {<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 /* Now wait until a signal is available in our =
group or it is closed.<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Acquire MO so that if we observe (=
signals =3D=3D lowseq) after group<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0switching in __condvar_quiesce_and=
_switch_g1, we synchronize with that<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0store and will see the prior updat=
e of __g1_start done while switching<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0groups too.=C2=A0 */<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 unsigned int signals =3D atomic_load_acquire (c=
ond-&gt;__data.__g_signals + g);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 uint64_t g1_start =3D __condvar_load_g1_start_r=
elaxed (cond);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 unsigned int lowseq =3D (g1_start &amp; 1) =3D=
=3D g ? signals : g1_start &amp; ~1U;<br>
&gt; -+<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 if (seq &lt; (g1_start &gt;&gt; 1))<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* If the group is closed already=
,<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0then this waiter ori=
ginally had enough extra signals to<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0consume, up until th=
e time its group was closed.=C2=A0 */<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; -+<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 /* If there is an available signal, don&#39;t b=
lock.<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0If __g1_start has advanced at all,=
 then we must be in G1<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0by now, perhaps in the process of =
switching back to an older<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0G2, but in either case we&#39;re a=
llowed to consume the available<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0signal and should not block anymor=
e.=C2=A0 */<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 if ((int)(signals - lowseq) &gt;=3D 2)<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Try to grab a signal.=C2=A0 See=
 above for MO.=C2=A0 (if we do another loop<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 iteration we need to see t=
he correct value of g1_start)=C2=A0 */<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (atomic_compare_exchange=
_weak_acquire (<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0cond-&gt;__data.__g_signals + g,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 &amp;signals, signals - 2))<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0break;<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0else<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0continue;<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* No signals available after spinning, =
so prepare to block.<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0We first acquire a group re=
ference and use acquire MO for that so<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0that we synchronize with th=
e dummy read-modify-write in<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0__condvar_quiesce_and_switc=
h_g1 if we read from that.=C2=A0 In turn,<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0in this case this will make=
 us see the advancement of __g_signals<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0to the upcoming new g1_star=
t that occurs with a concurrent<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0attempt to reuse the group&=
#39;s slot.<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0We use acquire MO for the _=
_g_signals check to make the<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0__g1_start check work (see =
spinning above).<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Note that the group referen=
ce acquisition will not mask the<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0release MO when decrementin=
g the reference count because we use<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0an atomic read-modify-write=
 operation and thus extend the release<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sequence.=C2=A0 */<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 atomic_fetch_add_acquire (cond-&gt;__dat=
a.__g_refs + g, 2);<br>
&gt; --<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 // Now block.<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct _pthread_cleanup_buffer buffer;<b=
r>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct _condvar_cleanup_buffer cbuffer;<=
br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 cbuffer.wseq =3D wseq;<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 cbuffer.cond =3D cond;<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 cbuffer.mutex =3D mutex;<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 cbuffer.private =3D private;<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 __pthread_cleanup_push (&amp;buffer, __c=
ondvar_cleanup_waiting, &amp;cbuffer);<br>
&gt; --<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 err =3D __futex_abstimed_wait_cancelable=
64 (<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cond-&gt;__data.__g_signals + g, =
signals, clockid, abstime, private);<br>
&gt; --<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 __pthread_cleanup_pop (&amp;buffer, 0);<=
br>
&gt; --<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (__glibc_unlikely (err =3D=3D ETIMEDO=
UT || err =3D=3D EOVERFLOW))<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 __condvar_dec_grefs (cond,=
 g, private);<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* If we timed out, we eff=
ectively cancel waiting.=C2=A0 Note that<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0we have decre=
mented __g_refs before cancellation, so that a<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0deadlock betw=
een waiting for quiescence of our group in<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0__condvar_qui=
esce_and_switch_g1 and us trying to acquire<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0the lock duri=
ng cancellation is not possible.=C2=A0 */<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 __condvar_cancel_waiting (=
cond, seq, g, private);<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 result =3D err;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 __condvar_dec_grefs (cond, g, pri=
vate);<br>
&gt; --<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 // Now block.<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 struct _pthread_cleanup_buffer buffer;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 struct _condvar_cleanup_buffer cbuffer;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 cbuffer.wseq =3D wseq;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 cbuffer.cond =3D cond;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 cbuffer.mutex =3D mutex;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 cbuffer.private =3D private;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 __pthread_cleanup_push (&amp;buffer, __condvar_=
cleanup_waiting, &amp;cbuffer);<br>
&gt; -+<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 err =3D __futex_abstimed_wait_cancelable64 (<br=
>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 cond-&gt;__data.__g_signals + g, signals=
, clockid, abstime, private);<br>
&gt; -+<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 __pthread_cleanup_pop (&amp;buffer, 0);<br>
&gt; -+<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 if (__glibc_unlikely (err =3D=3D ETIMEDOUT || e=
rr =3D=3D EOVERFLOW))<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* If we timed out, we effectivel=
y cancel waiting.=C2=A0 */<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 __condvar_cancel_waiting (cond, s=
eq, g, private);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 result =3D err;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; -+=C2=A0 =C2=A0 }<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0/* Confirm that we have been woken.=C2=A0 We do that bef=
ore acquiring the mutex<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 to allow for execution of pthread_cond_destroy w=
hile having acquired the<br>
&gt; ---<br>
&gt; -2.49.0<br>
&gt; -<br>
&gt; diff --git a/meta/recipes-core/glibc/glibc/0026-PR25847-7.patch b/meta=
/recipes-core/glibc/glibc/0026-PR25847-7.patch<br>
&gt; deleted file mode 100644<br>
&gt; index a9e9cc7c48..0000000000<br>
&gt; --- a/meta/recipes-core/glibc/glibc/0026-PR25847-7.patch<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,160 +0,0 @@<br>
&gt; -From 2a601ac9041e2ca645acad2c174b1c545cfceafe Mon Sep 17 00:00:00 200=
1<br>
&gt; -From: Malte Skarupke &lt;<a href=3D"mailto:malteskarupke@fastmail.fm"=
 target=3D"_blank" rel=3D"noreferrer">malteskarupke@fastmail.fm</a>&gt;<br>
&gt; -Date: Tue, 17 Jun 2025 01:53:25 -0700<br>
&gt; -Subject: [PATCH] nptl: rename __condvar_quiesce_and_switch_g1<br>
&gt; -<br>
&gt; -This function no longer waits for threads to leave g1, so rename it t=
o<br>
&gt; -__condvar_switch_g1<br>
&gt; -<br>
&gt; -The following commits have been cherry-picked from Glibc master branc=
h:<br>
&gt; -Bug : <a href=3D"https://sourceware.org/bugzilla/show_bug.cgi?id=3D25=
847" rel=3D"noreferrer noreferrer" target=3D"_blank">https://sourceware.org=
/bugzilla/show_bug.cgi?id=3D25847</a><br>
&gt; -<br>
&gt; -Upstream-Status: Backport<br>
&gt; -[<a href=3D"https://sourceware.org/git/?p=3Dglibc.git;a=3Dcommit;h=3D=
4b79e27a5073c02f6bff9aa8f4791230a0ab1867" rel=3D"noreferrer noreferrer" tar=
get=3D"_blank">https://sourceware.org/git/?p=3Dglibc.git;a=3Dcommit;h=3D4b7=
9e27a5073c02f6bff9aa8f4791230a0ab1867</a>]<br>
&gt; -<br>
&gt; -Signed-off-by: Sunil Dora &lt;<a href=3D"mailto:sunilkumar.dora@windr=
iver.com" target=3D"_blank" rel=3D"noreferrer">sunilkumar.dora@windriver.co=
m</a>&gt;<br>
&gt; ----<br>
&gt; - nptl/pthread_cond_broadcast.c |=C2=A0 4 ++--<br>
&gt; - nptl/pthread_cond_common.c=C2=A0 =C2=A0 | 26 ++++++++++++-----------=
---<br>
&gt; - nptl/pthread_cond_signal.c=C2=A0 =C2=A0 | 17 ++++++++---------<br>
&gt; - nptl/pthread_cond_wait.c=C2=A0 =C2=A0 =C2=A0 |=C2=A0 9 ++++-----<br>
&gt; - 4 files changed, 26 insertions(+), 30 deletions(-)<br>
&gt; -<br>
&gt; -diff --git a/nptl/pthread_cond_broadcast.c b/nptl/pthread_cond_broadc=
ast.c<br>
&gt; -index 5ae141ac81..a07435589a 100644<br>
&gt; ---- a/nptl/pthread_cond_broadcast.c<br>
&gt; -+++ b/nptl/pthread_cond_broadcast.c<br>
&gt; -@@ -60,7 +60,7 @@ ___pthread_cond_broadcast (pthread_cond_t *cond)<br=
>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cond-&gt;__data.__g_size[g1] &lt;=
&lt; 1);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0cond-&gt;__data.__g_size[g1] =3D 0;<br>
&gt; -<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 /* We need to wake G1 waiters before we quiesce=
 G1 below.=C2=A0 */<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 /* We need to wake G1 waiters before we switch =
G1 below.=C2=A0 */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0/* TODO Only set it if there are indeed fu=
tex waiters.=C2=A0 We could<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 also try to move this out of the critical=
 section in cases when<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 G2 is empty (and we don&#39;t need to qui=
esce).=C2=A0 */<br>
&gt; -@@ -69,7 +69,7 @@ ___pthread_cond_broadcast (pthread_cond_t *cond)<br=
>
&gt; -<br>
&gt; -=C2=A0 =C2=A0/* G1 is complete.=C2=A0 Step (2) is next unless there a=
re no waiters in G2, in<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 which case we can stop.=C2=A0 */<br>
&gt; --=C2=A0 if (__condvar_quiesce_and_switch_g1 (cond, wseq, &amp;g1, pri=
vate))<br>
&gt; -+=C2=A0 if (__condvar_switch_g1 (cond, wseq, &amp;g1, private))<br>
&gt; -=C2=A0 =C2=A0 =C2=A0{<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Step (3): Send signals to all waiters i=
n the old G2 / new G1.=C2=A0 */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0atomic_fetch_add_relaxed (cond-&gt;__data.=
__g_signals + g1,<br>
&gt; -diff --git a/nptl/pthread_cond_common.c b/nptl/pthread_cond_common.c<=
br>
&gt; -index f976a533a1..3baac4dabc 100644<br>
&gt; ---- a/nptl/pthread_cond_common.c<br>
&gt; -+++ b/nptl/pthread_cond_common.c<br>
&gt; -@@ -189,16 +189,15 @@ __condvar_get_private (int flags)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0return FUTEX_SHARED;<br>
&gt; - }<br>
&gt; -<br>
&gt; --/* This closes G1 (whose index is in G1INDEX), waits for all futex w=
aiters to<br>
&gt; --=C2=A0 =C2=A0leave G1, converts G1 into a fresh G2, and then switche=
s group roles so that<br>
&gt; --=C2=A0 =C2=A0the former G2 becomes the new G1 ending at the current =
__wseq value when we<br>
&gt; --=C2=A0 =C2=A0eventually make the switch (WSEQ is just an observation=
 of __wseq by the<br>
&gt; --=C2=A0 =C2=A0signaler).<br>
&gt; -+/* This closes G1 (whose index is in G1INDEX), converts G1 into a fr=
esh G2,<br>
&gt; -+=C2=A0 =C2=A0and then switches group roles so that the former G2 bec=
omes the new G1<br>
&gt; -+=C2=A0 =C2=A0ending at the current __wseq value when we eventually m=
ake the switch<br>
&gt; -+=C2=A0 =C2=A0(WSEQ is just an observation of __wseq by the signaler)=
.<br>
&gt; -=C2=A0 =C2=A0 If G2 is empty, it will not switch groups because then =
it would create an<br>
&gt; -=C2=A0 =C2=A0 empty G1 which would require switching groups again on =
the next signal.<br>
&gt; -=C2=A0 =C2=A0 Returns false iff groups were not switched because G2 w=
as empty.=C2=A0 */<br>
&gt; - static bool __attribute__ ((unused))<br>
&gt; --__condvar_quiesce_and_switch_g1 (pthread_cond_t *cond, uint64_t wseq=
,<br>
&gt; -+__condvar_switch_g1 (pthread_cond_t *cond, uint64_t wseq,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0unsigned int *g1index, int private)<br>
&gt; - {<br>
&gt; -=C2=A0 =C2=A0unsigned int g1 =3D *g1index;<br>
&gt; -@@ -214,8 +213,7 @@ __condvar_quiesce_and_switch_g1 (pthread_cond_t *=
cond, uint64_t wseq,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0+ cond-&gt;__data.__g_size[g1 ^ 1])=
 =3D=3D 0)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0return false;<br>
&gt; -<br>
&gt; --=C2=A0 /* Now try to close and quiesce G1.=C2=A0 We have to consider=
 the following kinds<br>
&gt; --=C2=A0 =C2=A0 =C2=A0of waiters:<br>
&gt; -+=C2=A0 /* We have to consider the following kinds of waiters:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 * Waiters from less recent groups than G1 are no=
t affected because<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 nothing will change for them apart from _=
_g1_start getting larger.<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 * New waiters arriving concurrently with the gro=
up switching will all go<br>
&gt; -@@ -223,12 +221,12 @@ __condvar_quiesce_and_switch_g1 (pthread_cond_t=
 *cond, uint64_t wseq,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 are not affected.<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 * Waiters in G1 have already received a signal a=
nd been woken.=C2=A0 */<br>
&gt; -<br>
&gt; --=C2=A0 /* Update __g1_start, which finishes closing this group.=C2=
=A0 The value we add<br>
&gt; --=C2=A0 =C2=A0 =C2=A0will never be negative because old_orig_size can=
 only be zero when we<br>
&gt; --=C2=A0 =C2=A0 =C2=A0switch groups the first time after a condvar was=
 initialized, in which<br>
&gt; --=C2=A0 =C2=A0 =C2=A0case G1 will be at index 1 and we will add a val=
ue of 1.<br>
&gt; --=C2=A0 =C2=A0 =C2=A0Relaxed MO is fine because the change comes with=
 no additional<br>
&gt; --=C2=A0 =C2=A0 =C2=A0constraints that others would have to observe.=
=C2=A0 */<br>
&gt; -+=C2=A0 /* Update __g1_start, which closes this group.=C2=A0 The valu=
e we add will never<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0be negative because old_orig_size can only be ze=
ro when we switch groups<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0the first time after a condvar was initialized, =
in which case G1 will be<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0at index 1 and we will add a value of 1. Relaxed=
 MO is fine because the<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0change comes with no additional constraints that=
 others would have to<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0observe.=C2=A0 */<br>
&gt; -=C2=A0 =C2=A0__condvar_add_g1_start_relaxed (cond,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0(old_orig_size &lt;&lt; 1) + (g1 =3D=3D 1 =
? 1 : - 1));<br>
&gt; -<br>
&gt; -diff --git a/nptl/pthread_cond_signal.c b/nptl/pthread_cond_signal.c<=
br>
&gt; -index 14800ba00b..a9bc10dcca 100644<br>
&gt; ---- a/nptl/pthread_cond_signal.c<br>
&gt; -+++ b/nptl/pthread_cond_signal.c<br>
&gt; -@@ -69,18 +69,17 @@ ___pthread_cond_signal (pthread_cond_t *cond)<br>
&gt; -=C2=A0 =C2=A0bool do_futex_wake =3D false;<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0/* If G1 is still receiving signals, we put the signal t=
here.=C2=A0 If not, we<br>
&gt; --=C2=A0 =C2=A0 =C2=A0check if G2 has waiters, and if so, quiesce and =
switch G1 to the former<br>
&gt; --=C2=A0 =C2=A0 =C2=A0G2; if this results in a new G1 with waiters (G2=
 might have cancellations<br>
&gt; --=C2=A0 =C2=A0 =C2=A0already, see __condvar_quiesce_and_switch_g1), w=
e put the signal in the<br>
&gt; --=C2=A0 =C2=A0 =C2=A0new G1.=C2=A0 */<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0check if G2 has waiters, and if so, switch G1 to=
 the former G2; if this<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0results in a new G1 with waiters (G2 might have =
cancellations already,<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0see __condvar_switch_g1), we put the signal in t=
he new G1. */<br>
&gt; -=C2=A0 =C2=A0if ((cond-&gt;__data.__g_size[g1] !=3D 0)<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 || __condvar_quiesce_and_switch_g1 (cond, wseq,=
 &amp;g1, private))<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 || __condvar_switch_g1 (cond, wseq, &amp;g1, pr=
ivate))<br>
&gt; -=C2=A0 =C2=A0 =C2=A0{<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Add a signal.=C2=A0 Relaxed MO is fine =
because signaling does not need to<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0establish a happens-before relation (see =
above).=C2=A0 We do not mask the<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0release-MO store when initializing a grou=
p in<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0__condvar_quiesce_and_switch_g1 because w=
e use an atomic<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0read-modify-write and thus extend that st=
ore&#39;s release sequence.=C2=A0 */<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0establish a happens-before relatio=
n (see above).=C2=A0 We do not mask the<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0release-MO store when initializing=
 a group in __condvar_switch_g1<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0because we use an atomic read-modi=
fy-write and thus extend that<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0store&#39;s release sequence.=C2=
=A0 */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0atomic_fetch_add_relaxed (cond-&gt;__data.=
__g_signals + g1, 2);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0cond-&gt;__data.__g_size[g1]--;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0/* TODO Only set it if there are indeed fu=
tex waiters.=C2=A0 */<br>
&gt; -diff --git a/nptl/pthread_cond_wait.c b/nptl/pthread_cond_wait.c<br>
&gt; -index 104ebd48ca..bb46f3605d 100644<br>
&gt; ---- a/nptl/pthread_cond_wait.c<br>
&gt; -+++ b/nptl/pthread_cond_wait.c<br>
&gt; -@@ -382,8 +382,7 @@ __pthread_cond_wait_common (pthread_cond_t *cond,=
 pthread_mutex_t *mutex,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 because we do not need to establish any happens-=
before relation with<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 signalers (see __pthread_cond_signal); modificat=
ion order alone<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 establishes a total order of waiters/signals.=C2=
=A0 We do need acquire MO<br>
&gt; --=C2=A0 =C2=A0 =C2=A0to synchronize with group reinitialization in<br=
>
&gt; --=C2=A0 =C2=A0 =C2=A0__condvar_quiesce_and_switch_g1.=C2=A0 */<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0to synchronize with group reinitialization in __=
condvar_switch_g1.=C2=A0 */<br>
&gt; -=C2=A0 =C2=A0uint64_t wseq =3D __condvar_fetch_add_wseq_acquire (cond=
, 2);<br>
&gt; -=C2=A0 =C2=A0/* Find our group&#39;s index.=C2=A0 We always go into w=
hat was G2 when we acquired<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 our position.=C2=A0 */<br>
&gt; -@@ -414,9 +413,9 @@ __pthread_cond_wait_common (pthread_cond_t *cond,=
 pthread_mutex_t *mutex,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0{<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Now wait until a signal is available in=
 our group or it is closed.<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Acquire MO so that if we observe (=
signals =3D=3D lowseq) after group<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0switching in __condvar_quiesce_and=
_switch_g1, we synchronize with that<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0store and will see the prior updat=
e of __g1_start done while switching<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0groups too.=C2=A0 */<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0switching in __condvar_switch_g1, =
we synchronize with that store and<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0will see the prior update of __g1_=
start done while switching groups<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0too.=C2=A0 */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int signals =3D atomic_load_acqui=
re (cond-&gt;__data.__g_signals + g);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0uint64_t g1_start =3D __condvar_load_g1_st=
art_relaxed (cond);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int lowseq =3D (g1_start &amp; 1)=
 =3D=3D g ? signals : g1_start &amp; ~1U;<br>
&gt; ---<br>
&gt; -2.49.0<br>
&gt; -<br>
&gt; diff --git a/meta/recipes-core/glibc/glibc/0026-PR25847-8.patch b/meta=
/recipes-core/glibc/glibc/0026-PR25847-8.patch<br>
&gt; deleted file mode 100644<br>
&gt; index 8ea0c784ef..0000000000<br>
&gt; --- a/meta/recipes-core/glibc/glibc/0026-PR25847-8.patch<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,192 +0,0 @@<br>
&gt; -From fc074de88796eb2036fbe9bade638e00adfd5cb2 Mon Sep 17 00:00:00 200=
1<br>
&gt; -From: Malte Skarupke &lt;<a href=3D"mailto:malteskarupke@fastmail.fm"=
 target=3D"_blank" rel=3D"noreferrer">malteskarupke@fastmail.fm</a>&gt;<br>
&gt; -Date: Tue, 17 Jun 2025 02:08:36 -0700<br>
&gt; -Subject: [PATCH] nptl: Use all of g1_start and g_signals<br>
&gt; -<br>
&gt; -The LSB of g_signals was unused. The LSB of g1_start was used to indi=
cate<br>
&gt; -which group is G2. This was used to always go to sleep in pthread_con=
d_wait<br>
&gt; -if a waiter is in G2. A comment earlier in the file says that this is=
 not<br>
&gt; -correct to do:<br>
&gt; -<br>
&gt; - &quot;Waiters cannot determine whether they are currently in G2 or G=
1 -- but they<br>
&gt; -=C2=A0 do not have to because all they are interested in is whether t=
here are<br>
&gt; -=C2=A0 available signals&quot;<br>
&gt; -<br>
&gt; -I either would have had to update the comment, or get rid of the chec=
k. I<br>
&gt; -chose to get rid of the check. In fact I don&#39;t quite know why it =
was there.<br>
&gt; -There will never be available signals for group G2, so we didn&#39;t =
need the<br>
&gt; -special case. Even if there were, this would just be a spurious wake.=
 This<br>
&gt; -might have caught some cases where the count has wrapped around, but =
it<br>
&gt; -wouldn&#39;t reliably do that, (and even if it did, why would you wan=
t to force a<br>
&gt; -sleep in that case?) and we don&#39;t support that many concurrent wa=
iters<br>
&gt; -anyway. Getting rid of it allows us to use one more bit, making us mo=
re<br>
&gt; -robust to wraparound.<br>
&gt; -<br>
&gt; -The following commits have been cherry-picked from Glibc master branc=
h:<br>
&gt; -Bug : <a href=3D"https://sourceware.org/bugzilla/show_bug.cgi?id=3D25=
847" rel=3D"noreferrer noreferrer" target=3D"_blank">https://sourceware.org=
/bugzilla/show_bug.cgi?id=3D25847</a><br>
&gt; -<br>
&gt; -Upstream-Status: Backport<br>
&gt; -[<a href=3D"https://sourceware.org/git/?p=3Dglibc.git;a=3Dcommit;h=3D=
91bb902f58264a2fd50fbce8f39a9a290dd23706" rel=3D"noreferrer noreferrer" tar=
get=3D"_blank">https://sourceware.org/git/?p=3Dglibc.git;a=3Dcommit;h=3D91b=
b902f58264a2fd50fbce8f39a9a290dd23706</a>]<br>
&gt; -<br>
&gt; -Signed-off-by: Sunil Dora &lt;<a href=3D"mailto:sunilkumar.dora@windr=
iver.com" target=3D"_blank" rel=3D"noreferrer">sunilkumar.dora@windriver.co=
m</a>&gt;<br>
&gt; ----<br>
&gt; - nptl/pthread_cond_broadcast.c |=C2=A0 4 ++--<br>
&gt; - nptl/pthread_cond_common.c=C2=A0 =C2=A0 | 26 ++++++++++-------------=
---<br>
&gt; - nptl/pthread_cond_signal.c=C2=A0 =C2=A0 |=C2=A0 2 +-<br>
&gt; - nptl/pthread_cond_wait.c=C2=A0 =C2=A0 =C2=A0 | 14 +++++---------<br>
&gt; - 4 files changed, 18 insertions(+), 28 deletions(-)<br>
&gt; -<br>
&gt; -diff --git a/nptl/pthread_cond_broadcast.c b/nptl/pthread_cond_broadc=
ast.c<br>
&gt; -index a07435589a..ef0943cdc5 100644<br>
&gt; ---- a/nptl/pthread_cond_broadcast.c<br>
&gt; -+++ b/nptl/pthread_cond_broadcast.c<br>
&gt; -@@ -57,7 +57,7 @@ ___pthread_cond_broadcast (pthread_cond_t *cond)<br=
>
&gt; -=C2=A0 =C2=A0 =C2=A0{<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Add as many signals as the remaining si=
ze of the group.=C2=A0 */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0atomic_fetch_add_relaxed (cond-&gt;__data.=
__g_signals + g1,<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cond-&gt;__data.__g_size[g1] &lt;&lt=
; 1);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cond-&gt;__data.__g_size[g1]);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0cond-&gt;__data.__g_size[g1] =3D 0;<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0/* We need to wake G1 waiters before we sw=
itch G1 below.=C2=A0 */<br>
&gt; -@@ -73,7 +73,7 @@ ___pthread_cond_broadcast (pthread_cond_t *cond)<br=
>
&gt; -=C2=A0 =C2=A0 =C2=A0{<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Step (3): Send signals to all waiters i=
n the old G2 / new G1.=C2=A0 */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0atomic_fetch_add_relaxed (cond-&gt;__data.=
__g_signals + g1,<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cond-&gt;__data.__g_size[g1] &lt;&lt=
; 1);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cond-&gt;__data.__g_size[g1]);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0cond-&gt;__data.__g_size[g1] =3D 0;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0/* TODO Only set it if there are indeed fu=
tex waiters.=C2=A0 */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0do_futex_wake =3D true;<br>
&gt; -diff --git a/nptl/pthread_cond_common.c b/nptl/pthread_cond_common.c<=
br>
&gt; -index 3baac4dabc..e48f914321 100644<br>
&gt; ---- a/nptl/pthread_cond_common.c<br>
&gt; -+++ b/nptl/pthread_cond_common.c<br>
&gt; -@@ -208,9 +208,9 @@ __condvar_switch_g1 (pthread_cond_t *cond, uint64=
_t wseq,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 behavior.<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 Note that this works correctly for a zero-initia=
lized condvar too.=C2=A0 */<br>
&gt; -=C2=A0 =C2=A0unsigned int old_orig_size =3D __condvar_get_orig_size (=
cond);<br>
&gt; --=C2=A0 uint64_t old_g1_start =3D __condvar_load_g1_start_relaxed (co=
nd) &gt;&gt; 1;<br>
&gt; --=C2=A0 if (((unsigned) (wseq - old_g1_start - old_orig_size)<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 + cond-&gt;__data.__g_size[g1 ^ 1]) =3D=
=3D 0)<br>
&gt; -+=C2=A0 uint64_t old_g1_start =3D __condvar_load_g1_start_relaxed (co=
nd);<br>
&gt; -+=C2=A0 uint64_t new_g1_start =3D old_g1_start + old_orig_size;<br>
&gt; -+=C2=A0 if (((unsigned) (wseq - new_g1_start) + cond-&gt;__data.__g_s=
ize[g1 ^ 1]) =3D=3D 0)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0return false;<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0/* We have to consider the following kinds of waiters:<b=
r>
&gt; -@@ -221,16 +221,10 @@ __condvar_switch_g1 (pthread_cond_t *cond, uint=
64_t wseq,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 are not affected.<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 * Waiters in G1 have already received a signal a=
nd been woken.=C2=A0 */<br>
&gt; -<br>
&gt; --=C2=A0 /* Update __g1_start, which closes this group.=C2=A0 The valu=
e we add will never<br>
&gt; --=C2=A0 =C2=A0 =C2=A0be negative because old_orig_size can only be ze=
ro when we switch groups<br>
&gt; --=C2=A0 =C2=A0 =C2=A0the first time after a condvar was initialized, =
in which case G1 will be<br>
&gt; --=C2=A0 =C2=A0 =C2=A0at index 1 and we will add a value of 1. Relaxed=
 MO is fine because the<br>
&gt; --=C2=A0 =C2=A0 =C2=A0change comes with no additional constraints that=
 others would have to<br>
&gt; --=C2=A0 =C2=A0 =C2=A0observe.=C2=A0 */<br>
&gt; --=C2=A0 __condvar_add_g1_start_relaxed (cond,<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 (old_orig_size &lt;&lt; 1) + (g1 =3D=3D 1 ? 1 :=
 - 1));<br>
&gt; --<br>
&gt; --=C2=A0 unsigned int lowseq =3D ((old_g1_start + old_orig_size) &lt;&=
lt; 1) &amp; ~1U;<br>
&gt; -+=C2=A0 /* Update __g1_start, which closes this group.=C2=A0 Relaxed =
MO is fine because<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0the change comes with no additional constraints =
that others would have<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0to observe.=C2=A0 */<br>
&gt; -+=C2=A0 __condvar_add_g1_start_relaxed (cond, old_orig_size);<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0/* At this point, the old G1 is now a valid new G2 (but =
not in use yet).<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 No old waiter can neither grab a signal nor acqu=
ire a reference without<br>
&gt; -@@ -242,13 +236,13 @@ __condvar_switch_g1 (pthread_cond_t *cond, uint=
64_t wseq,<br>
&gt; -=C2=A0 =C2=A0g1 ^=3D 1;<br>
&gt; -=C2=A0 =C2=A0*g1index ^=3D 1;<br>
&gt; -<br>
&gt; --=C2=A0 /* Now advance the new G1 g_signals to the new lowseq, giving=
 it<br>
&gt; -+=C2=A0 /* Now advance the new G1 g_signals to the new g1_start, givi=
ng it<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 an effective signal count of 0 to start.=C2=A0 *=
/<br>
&gt; --=C2=A0 atomic_store_release (cond-&gt;__data.__g_signals + g1, lowse=
q);<br>
&gt; -+=C2=A0 atomic_store_release (cond-&gt;__data.__g_signals + g1, (unsi=
gned)new_g1_start);<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0/* These values are just observed by signalers, and thus=
 protected by the<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 lock.=C2=A0 */<br>
&gt; --=C2=A0 unsigned int orig_size =3D wseq - (old_g1_start + old_orig_si=
ze);<br>
&gt; -+=C2=A0 unsigned int orig_size =3D wseq - new_g1_start;<br>
&gt; -=C2=A0 =C2=A0__condvar_set_orig_size (cond, orig_size);<br>
&gt; -=C2=A0 =C2=A0/* Use and addition to not loose track of cancellations =
in what was<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 previously G2.=C2=A0 */<br>
&gt; -diff --git a/nptl/pthread_cond_signal.c b/nptl/pthread_cond_signal.c<=
br>
&gt; -index a9bc10dcca..07427369aa 100644<br>
&gt; ---- a/nptl/pthread_cond_signal.c<br>
&gt; -+++ b/nptl/pthread_cond_signal.c<br>
&gt; -@@ -80,7 +80,7 @@ ___pthread_cond_signal (pthread_cond_t *cond)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 release-MO store when initializing=
 a group in __condvar_switch_g1<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 because we use an atomic read-modi=
fy-write and thus extend that<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 store&#39;s release sequence.=C2=
=A0 */<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 atomic_fetch_add_relaxed (cond-&gt;__data.__g_s=
ignals + g1, 2);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 atomic_fetch_add_relaxed (cond-&gt;__data.__g_s=
ignals + g1, 1);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0cond-&gt;__data.__g_size[g1]--;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0/* TODO Only set it if there are indeed fu=
tex waiters.=C2=A0 */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0do_futex_wake =3D true;<br>
&gt; -diff --git a/nptl/pthread_cond_wait.c b/nptl/pthread_cond_wait.c<br>
&gt; -index bb46f3605d..430cbe8a35 100644<br>
&gt; ---- a/nptl/pthread_cond_wait.c<br>
&gt; -+++ b/nptl/pthread_cond_wait.c<br>
&gt; -@@ -84,7 +84,7 @@ __condvar_cancel_waiting (pthread_cond_t *cond, uin=
t64_t seq, unsigned int g,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 not hold a reference on the group.=C2=A0 */<br>
&gt; -=C2=A0 =C2=A0__condvar_acquire_lock (cond, private);<br>
&gt; -<br>
&gt; --=C2=A0 uint64_t g1_start =3D __condvar_load_g1_start_relaxed (cond) =
&gt;&gt; 1;<br>
&gt; -+=C2=A0 uint64_t g1_start =3D __condvar_load_g1_start_relaxed (cond);=
<br>
&gt; -=C2=A0 =C2=A0if (g1_start &gt; seq)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0{<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Our group is closed, so someone provide=
d enough signals for it.<br>
&gt; -@@ -278,7 +278,6 @@ __condvar_cleanup_waiting (void *arg)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 * Waiters fetch-add while having acquire the mut=
ex associated with the<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 condvar.=C2=A0 Signalers load it and fetc=
h-xor it concurrently.<br>
&gt; -=C2=A0 =C2=A0 __g1_start: Starting position of G1 (inclusive)<br>
&gt; --=C2=A0 =C2=A0 =C2=A0* LSB is index of current G2.<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 * Modified by signalers while having acquired th=
e condvar-internal lock<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 and observed concurrently by waiters.<br>
&gt; -=C2=A0 =C2=A0 __g1_orig_size: Initial size of G1<br>
&gt; -@@ -299,11 +298,9 @@ __condvar_cleanup_waiting (void *arg)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 * Reference count used by waiters concurrently w=
ith signalers that have<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 acquired the condvar-internal lock.<br>
&gt; -=C2=A0 =C2=A0 __g_signals: The number of signals that can still be co=
nsumed, relative to<br>
&gt; --=C2=A0 =C2=A0 =C2=A0the current g1_start.=C2=A0 (i.e. bits 31 to 1 o=
f __g_signals are bits<br>
&gt; --=C2=A0 =C2=A0 =C2=A031 to 1 of g1_start with the signal count added)=
<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0the current g1_start.=C2=A0 (i.e. g1_start with =
the signal count added)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 * Used as a futex word by waiters.=C2=A0 Used co=
ncurrently by waiters and<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 signalers.<br>
&gt; --=C2=A0 =C2=A0 =C2=A0* LSB is currently reserved and 0.<br>
&gt; -=C2=A0 =C2=A0 __g_size: Waiters remaining in this group (i.e., which =
have not been<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 signaled yet.<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 * Accessed by signalers and waiters that cancel =
waiting (both do so only<br>
&gt; -@@ -418,9 +415,8 @@ __pthread_cond_wait_common (pthread_cond_t *cond,=
 pthread_mutex_t *mutex,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 too.=C2=A0 */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int signals =3D atomic_load_acqui=
re (cond-&gt;__data.__g_signals + g);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0uint64_t g1_start =3D __condvar_load_g1_st=
art_relaxed (cond);<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 unsigned int lowseq =3D (g1_start &amp; 1) =3D=
=3D g ? signals : g1_start &amp; ~1U;<br>
&gt; -<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 if (seq &lt; (g1_start &gt;&gt; 1))<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 if (seq &lt; g1_start)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* If the group is closed al=
ready,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 then this waiter ori=
ginally had enough extra signals to<br>
&gt; -@@ -433,13 +429,13 @@ __pthread_cond_wait_common (pthread_cond_t *con=
d, pthread_mutex_t *mutex,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 by now, perhaps in the process of =
switching back to an older<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 G2, but in either case we&#39;re a=
llowed to consume the available<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 signal and should not block anymor=
e.=C2=A0 */<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 if ((int)(signals - lowseq) &gt;=3D 2)<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 if ((int)(signals - (unsigned int)g1_start) &gt=
; 0)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Try to grab a signal.=C2=A0 See=
 above for MO.=C2=A0 (if we do another loop<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0iteration we need to =
see the correct value of g1_start)=C2=A0 */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (atomic_compare_exchange=
_weak_acquire (<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 cond-&gt;__data.__g_signals + g,<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&amp;signals, signals - 2))<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&amp;signals, signals - 1))<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0continue;<br>
&gt; ---<br>
&gt; -2.49.0<br>
&gt; -<br>
&gt; diff --git a/meta/recipes-core/glibc/<a href=3D"http://glibc_2.35.bb" =
rel=3D"noreferrer noreferrer" target=3D"_blank">glibc_2.35.bb</a> b/meta/re=
cipes-core/glibc/<a href=3D"http://glibc_2.35.bb" rel=3D"noreferrer norefer=
rer" target=3D"_blank">glibc_2.35.bb</a><br>
&gt; index 265dcb9129..ca7f630699 100644<br>
&gt; --- a/meta/recipes-core/glibc/<a href=3D"http://glibc_2.35.bb" rel=3D"=
noreferrer noreferrer" target=3D"_blank">glibc_2.35.bb</a><br>
&gt; +++ b/meta/recipes-core/glibc/<a href=3D"http://glibc_2.35.bb" rel=3D"=
noreferrer noreferrer" target=3D"_blank">glibc_2.35.bb</a><br>
&gt; @@ -62,14 +62,6 @@ SRC_URI =3D=C2=A0 &quot;${GLIBC_GIT_URI};branch=3D$=
{SRCBRANCH};name=3Dglibc \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0022-sysdeps-gnu=
-configure.ac-Set-libc_cv_rootsbindir-onl.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0023-timezone-Ma=
ke-shell-interpreter-overridable-in-tzsel.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0024-fix</blockq=
uote></div></div></div>

--000000000000ebdb1c0641275fba--

