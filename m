Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DC6FC61CE8
	for <webhook@archiver.kernel.org>; Thu, 12 Jun 2025 16:04:36 +0000 (UTC)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
 by mx.groups.io with SMTP id smtpd.web11.17381.1749744272230510284
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Jun 2025 09:04:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=EFRPZEaj;
 spf=softfail (domain: sakoman.com, ip: 209.85.219.170, mailfrom: steve@sakoman.com)
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-e7d8eb10c06so889623276.0
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Jun 2025 09:04:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1749744271; x=1750349071; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wK6ktbs3J1cZWZAiAbnoNdsWVdp+Cjmd0W3bRVVYj4k=;
        b=EFRPZEajE0FMj67P4D2rKuurzhtJY3OgikSjfChkHUFT5KyTelPPVg5jocwh2iX4u6
         gKa6o5wkDmUOGsmf+5TsjEXGVjad1uS6030rOEnw6onGswMofcI9hy/TzyqDkDyG9HKr
         GnMBVgUF/V2fG5jHKESLBcTCPEk+p6TJd990jYVismtmwTv8w126ZusveXA8HBmFUIEI
         iPa9IkDbj75L4HNEd2fqG26b1UmUhCQI7Gj92jvaVO0o7YdArHtqlKOPANXdyw2+Fbw9
         V9ioOmYIuBlSXtkF4278Z5clxIq1CIDs62Qm51H72ulKCeetnXJXKXQNZWevDnCZQ/P/
         Q0QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749744271; x=1750349071;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wK6ktbs3J1cZWZAiAbnoNdsWVdp+Cjmd0W3bRVVYj4k=;
        b=tkCjteGhUJmBLK/xkOzgnE9BKPFZU5MXzNwOYnjw23+aDgbWut2RAFowCd9Ajsk2H6
         DIp8iW25gJifwTyeZ/gI38ARcaog/glYOvIDEvpgs28bgEAsAES6E6tmH6+NzscOIVVq
         0+aBRIoI0Qu6nm6xrJtES9ueQQbw0KWmWsLjmXVGCXTlbpz3/A3dFJCySjRZhUIX18Cn
         JHW1AJjCsP39VYdepU72ra3gbU614GRrKK89esOXR19Qvvri+xQhNzvvWH169nt/6nV8
         dn7Dlg7Z8BgqUWdeyWxgEoqddZ0a35llLagV3pxp8nW6ECvPubE5S169awyROrs2p+C8
         9c5w==
X-Gm-Message-State: AOJu0Ywei6iJGXjthxxrcWwsFSPj5yiTyLahWJPk+0JqTS6cQNdc1Hnn
	6n+43DYBuC7tHJ3fSg6JoV62D1hjHCXU6tzczdeyc66SQ/66SfOzdFKYGQwiJSC06L2Mf9oUmy/
	UejlfEUemFdZ4TMBY8lMhz4+4Dvmbz2/gjjcx18lj2A==
X-Gm-Gg: ASbGncs02PaSfcaP9CxOlTQJgelnsBtYMFwUW3kCR79mAiRXveEIEq+zfWE8SWRHWYj
	z4qS7H0YTIjkzksHr842IsIZy5iHyHlhhI5zoj9fcr/3RBMVMRDb7uZQEBga7BYQxqc9aXAxuAB
	tq4h23wLwW2EsXQXw+3q/YDDCt7rShJWrX0vH3sMh5omlnwAB4BAlVH5gdJuaDLl7Cw9sxayJzv
	b/AKkRaxkOIxA==
X-Google-Smtp-Source: AGHT+IFIzHW+e+EN6BUb3SuJ95H7CAfS8H07jeRCDKU5jzbrb49Zbbl2iytndfWdlVn0pzlafGfTm4RYXCH0guRbMp4=
X-Received: by 2002:a05:6902:161a:b0:e81:d0ab:24d1 with SMTP id
 3f1490d57ef6-e820b686714mr6484889276.21.1749744270715; Thu, 12 Jun 2025
 09:04:30 -0700 (PDT)
MIME-Version: 1.0
References: <20250612095639.3630518-1-sunilkumar.dora@windriver.com> <20250612095639.3630518-2-sunilkumar.dora@windriver.com>
In-Reply-To: <20250612095639.3630518-2-sunilkumar.dora@windriver.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Thu, 12 Jun 2025 09:04:19 -0700
X-Gm-Features: AX0GCFvmpU0QZTC56n8DoRXbTtt0TdtZ0NvasuehNlcquAtNl_YbgnKB614qmV8
Message-ID: <CAOSpxdZu7jz06kQ-xSv_X++PVKwzZAiwX5C=7SNd=NgSMCgvTg@mail.gmail.com>
Subject: Re: [OE-core] [kirkstone][PATCH V2 1/8] pthreads NPTL: lost wakeup
 fix 2
To: SunilKumar.Dora@windriver.com
Cc: openembedded-core@lists.openembedded.org, Randy.MacLeod@windriver.com, 
	Sundeep.Kokkonda@windriver.com, =SunilKumar.Dora@windriver.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Jun 2025 16:04:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218532

Hi Sunil,

Could you please send a V2 with:

1. A cover letter explaining the reason for this patch series and an
overview of what is being changed
2. A link to the upstream commit being backported in the
Upstream-status lines (rather than just a commit id)

Thanks!

Steve

On Thu, Jun 12, 2025 at 2:57=E2=80=AFAM Dora, Sunil Kumar via
lists.openembedded.org
<SunilKumar.Dora=3Dwindriver.com@lists.openembedded.org> wrote:
>
> From: Sunil Dora <sunilkumar.dora@windriver.com>
>
> The following commits have been cherry-picked from Glibc master branch:
> Bug : https://sourceware.org/bugzilla/show_bug.cgi?id=3D25847
>
> Upstream-Status: Backport [1db84775f831a1494993ce9c118deaf9537cc50a]
>
> Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
> ---
>  .../glibc/glibc/0026-PR25847-1.patch          | 453 ++++++++++++++++++
>  meta/recipes-core/glibc/glibc_2.35.bb         |   1 +
>  2 files changed, 454 insertions(+)
>  create mode 100644 meta/recipes-core/glibc/glibc/0026-PR25847-1.patch
>
> diff --git a/meta/recipes-core/glibc/glibc/0026-PR25847-1.patch b/meta/re=
cipes-core/glibc/glibc/0026-PR25847-1.patch
> new file mode 100644
> index 0000000000..67a6fa1e62
> --- /dev/null
> +++ b/meta/recipes-core/glibc/glibc/0026-PR25847-1.patch
> @@ -0,0 +1,453 @@
> +From 6f030a8faf242b897e714cb77c65254b14682cfc Mon Sep 17 00:00:00 2001
> +From: Frank Barrus <frankbarrus_sw@shaggy.cc>
> +Date: Mon, 9 Jun 2025 02:32:52 -0700
> +Subject: [PATCH] pthreads NPTL: lost wakeup fix 2
> +
> +This fixes the lost wakeup (from a bug in signal stealing) with a change
> +in the usage of g_signals[] in the condition variable internal state.
> +It also completely eliminates the concept and handling of signal stealin=
g,
> +as well as the need for signalers to block to wait for waiters to wake
> +up every time there is a G1/G2 switch.  This greatly reduces the average
> +and maximum latency for pthread_cond_signal.
> +
> +The g_signals[] field now contains a signal count that is relative to
> +the current g1_start value.  Since it is a 32-bit field, and the LSB is
> +still reserved (though not currently used anymore), it has a 31-bit valu=
e
> +that corresponds to the low 31 bits of the sequence number in g1_start.
> +(since g1_start also has an LSB flag, this means bits 31:1 in g_signals
> +correspond to bits 31:1 in g1_start, plus the current signal count)
> +
> +By making the signal count relative to g1_start, there is no longer
> +any ambiguity or A/B/A issue, and thus any checks before blocking,
> +including the futex call itself, are guaranteed not to block if the G1/G=
2
> +switch occurs, even if the signal count remains the same.  This allows
> +initially safely blocking in G2 until the switch to G1 occurs, and
> +then transitioning from G1 to a new G1 or G2, and always being able to
> +distinguish the state change.  This removes the race condition and A/B/A
> +problems that otherwise ocurred if a late (pre-empted) waiter were to
> +resume just as the futex call attempted to block on g_signal since
> +otherwise there was no last opportunity to re-check things like whether
> +the current G1 group was already closed.
> +
> +By fixing these issues, the signal stealing code can be eliminated,
> +since there is no concept of signal stealing anymore.  The code to block
> +for all waiters to exit g_refs can also be removed, since any waiters
> +that are still in the g_refs region can be guaranteed to safely wake
> +up and exit.  If there are still any left at this time, they are all
> +sent one final futex wakeup to ensure that they are not blocked any
> +longer, but there is no need for the signaller to block and wait for
> +them to wake up and exit the g_refs region.
> +
> +The signal count is then effectively "zeroed" but since it is now
> +relative to g1_start, this is done by advancing it to a new value that
> +can be observed by any pending blocking waiters.  Any late waiters can
> +always tell the difference, and can thus just cleanly exit if they are
> +in a stale G1 or G2.  They can never steal a signal from the current
> +G1 if they are not in the current G1, since the signal value that has
> +to match in the cmpxchg has the low 31 bits of the g1_start value
> +contained in it, and that's first checked, and then it won't match if
> +there's a G1/G2 change.
> +
> +Note: the 31-bit sequence number used in g_signals is designed to
> +handle wrap-around when checking the signal count, but if the entire
> +31-bit wraparound (2 billion signals) occurs while there is still a
> +late waiter that has not yet resumed, and it happens to then match
> +the current g1_start low bits, and the pre-emption occurs after the
> +normal "closed group" checks (which are 64-bit) but then hits the
> +futex syscall and signal consuming code, then an A/B/A issue could
> +still result and cause an incorrect assumption about whether it
> +should block.  This particular scenario seems unlikely in practice.
> +Note that once awake from the futex, the waiter would notice the
> +closed group before consuming the signal (since that's still a 64-bit
> +check that would not be aliased in the wrap-around in g_signals),
> +so the biggest impact would be blocking on the futex until the next
> +full wakeup from a G1/G2 switch.
> +
> +The following commits have been cherry-picked from Glibc master branch:
> +Bug : https://sourceware.org/bugzilla/show_bug.cgi?id=3D25847
> +
> +Upstream-Status: Backport [1db84775f831a1494993ce9c118deaf9537cc50a]
> +
> +Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
> +---
> + nptl/pthread_cond_common.c | 105 +++++++++------------------
> + nptl/pthread_cond_wait.c   | 144 ++++++++++++-------------------------
> + 2 files changed, 81 insertions(+), 168 deletions(-)
> +
> +diff --git a/nptl/pthread_cond_common.c b/nptl/pthread_cond_common.c
> +index fb035f72..a55eee3e 100644
> +--- a/nptl/pthread_cond_common.c
> ++++ b/nptl/pthread_cond_common.c
> +@@ -201,7 +201,6 @@ static bool __attribute__ ((unused))
> + __condvar_quiesce_and_switch_g1 (pthread_cond_t *cond, uint64_t wseq,
> +     unsigned int *g1index, int private)
> + {
> +-  const unsigned int maxspin =3D 0;
> +   unsigned int g1 =3D *g1index;
> +
> +   /* If there is no waiter in G2, we don't do anything.  The expression=
 may
> +@@ -222,84 +221,46 @@ __condvar_quiesce_and_switch_g1 (pthread_cond_t *c=
ond, uint64_t wseq,
> +      * New waiters arriving concurrently with the group switching will =
all go
> +        into G2 until we atomically make the switch.  Waiters existing i=
n G2
> +        are not affected.
> +-     * Waiters in G1 will be closed out immediately by setting a flag i=
n
> +-       __g_signals, which will prevent waiters from blocking using a fu=
tex on
> +-       __g_signals and also notifies them that the group is closed.  As=
 a
> +-       result, they will eventually remove their group reference, allow=
ing us
> +-       to close switch group roles.  */
> +-
> +-  /* First, set the closed flag on __g_signals.  This tells waiters tha=
t are
> +-     about to wait that they shouldn't do that anymore.  This basically
> +-     serves as an advance notificaton of the upcoming change to __g1_st=
art;
> +-     waiters interpret it as if __g1_start was larger than their waiter
> +-     sequence position.  This allows us to change __g1_start after wait=
ing
> +-     for all existing waiters with group references to leave, which in =
turn
> +-     makes recovery after stealing a signal simpler because it then can=
 be
> +-     skipped if __g1_start indicates that the group is closed (otherwis=
e,
> +-     we would have to recover always because waiters don't know how big=
 their
> +-     groups are).  Relaxed MO is fine.  */
> +-  atomic_fetch_or_relaxed (cond->__data.__g_signals + g1, 1);
> +-
> +-  /* Wait until there are no group references anymore.  The fetch-or op=
eration
> +-     injects us into the modification order of __g_refs; release MO ens=
ures
> +-     that waiters incrementing __g_refs after our fetch-or see the prev=
ious
> +-     changes to __g_signals and to __g1_start that had to happen before=
 we can
> +-     switch this G1 and alias with an older group (we have two groups, =
so
> +-     aliasing requires switching group roles twice).  Note that nobody =
else
> +-     can have set the wake-request flag, so we do not have to act upon =
it.
> +-
> +-     Also note that it is harmless if older waiters or waiters from thi=
s G1
> +-     get a group reference after we have quiesced the group because it =
will
> +-     remain closed for them either because of the closed flag in __g_si=
gnals
> +-     or the later update to __g1_start.  New waiters will never arrive =
here
> +-     but instead continue to go into the still current G2.  */
> +-  unsigned r =3D atomic_fetch_or_release (cond->__data.__g_refs + g1, 0=
);
> +-  while ((r >> 1) > 0)
> +-    {
> +-      for (unsigned int spin =3D maxspin; ((r >> 1) > 0) && (spin > 0);=
 spin--)
> +-      {
> +-        /* TODO Back off.  */
> +-        r =3D atomic_load_relaxed (cond->__data.__g_refs + g1);
> +-      }
> +-      if ((r >> 1) > 0)
> +-      {
> +-        /* There is still a waiter after spinning.  Set the wake-reques=
t
> +-           flag and block.  Relaxed MO is fine because this is just abo=
ut
> +-           this futex word.
> +-
> +-           Update r to include the set wake-request flag so that the up=
coming
> +-           futex_wait only blocks if the flag is still set (otherwise, =
we'd
> +-           violate the basic client-side futex protocol).  */
> +-        r =3D atomic_fetch_or_relaxed (cond->__data.__g_refs + g1, 1) |=
 1;
> +-
> +-        if ((r >> 1) > 0)
> +-          futex_wait_simple (cond->__data.__g_refs + g1, r, private);
> +-        /* Reload here so we eventually see the most recent value even =
if we
> +-           do not spin.   */
> +-        r =3D atomic_load_relaxed (cond->__data.__g_refs + g1);
> +-      }
> +-    }
> +-  /* Acquire MO so that we synchronize with the release operation that =
waiters
> +-     use to decrement __g_refs and thus happen after the waiters we wai=
ted
> +-     for.  */
> +-  atomic_thread_fence_acquire ();
> ++     * Waiters in G1 will be closed out immediately by the advancing of
> ++       __g_signals to the next "lowseq" (low 31 bits of the new g1_star=
t),
> ++       which will prevent waiters from blocking using a futex on
> ++       __g_signals since it provides enough signals for all possible
> ++       remaining waiters.  As a result, they can each consume a signal
> ++       and they will eventually remove their group reference.  */
> +
> +   /* Update __g1_start, which finishes closing this group.  The value w=
e add
> +      will never be negative because old_orig_size can only be zero when=
 we
> +      switch groups the first time after a condvar was initialized, in w=
hich
> +-     case G1 will be at index 1 and we will add a value of 1.  See abov=
e for
> +-     why this takes place after waiting for quiescence of the group.
> ++     case G1 will be at index 1 and we will add a value of 1.
> +      Relaxed MO is fine because the change comes with no additional
> +      constraints that others would have to observe.  */
> +   __condvar_add_g1_start_relaxed (cond,
> +       (old_orig_size << 1) + (g1 =3D=3D 1 ? 1 : - 1));
> +
> +-  /* Now reopen the group, thus enabling waiters to again block using t=
he
> +-     futex controlled by __g_signals.  Release MO so that observers tha=
t see
> +-     no signals (and thus can block) also see the write __g1_start and =
thus
> +-     that this is now a new group (see __pthread_cond_wait_common for t=
he
> +-     matching acquire MO loads).  */
> +-  atomic_store_release (cond->__data.__g_signals + g1, 0);
> ++  unsigned int lowseq =3D ((old_g1_start + old_orig_size) << 1) & ~1U;
> ++
> ++  /* If any waiters still hold group references (and thus could be bloc=
ked),
> ++     then wake them all up now and prevent any running ones from blocki=
ng.
> ++     This is effectively a catch-all for any possible current or future
> ++     bugs that can allow the group size to reach 0 before all G1 waiter=
s
> ++     have been awakened or at least given signals to consume, or any
> ++     other case that can leave blocked (or about to block) older waiter=
s..  */
> ++  if ((atomic_fetch_or_release (cond->__data.__g_refs + g1, 0) >> 1) > =
0)
> ++   {
> ++    /* First advance signals to the end of the group (i.e. enough signa=
ls
> ++       for the entire G1 group) to ensure that waiters which have not
> ++       yet blocked in the futex will not block.
> ++       Note that in the vast majority of cases, this should never
> ++       actually be necessary, since __g_signals will have enough
> ++       signals for the remaining g_refs waiters.  As an optimization,
> ++       we could check this first before proceeding, although that
> ++       could still leave the potential for futex lost wakeup bugs
> ++       if the signal count was non-zero but the futex wakeup
> ++       was somehow lost.  */
> ++    atomic_store_release (cond->__data.__g_signals + g1, lowseq);
> ++
> ++    futex_wake (cond->__data.__g_signals + g1, INT_MAX, private);
> ++   }
> +
> +   /* At this point, the old G1 is now a valid new G2 (but not in use ye=
t).
> +      No old waiter can neither grab a signal nor acquire a reference wi=
thout
> +@@ -311,6 +272,10 @@ __condvar_quiesce_and_switch_g1 (pthread_cond_t *co=
nd, uint64_t wseq,
> +   g1 ^=3D 1;
> +   *g1index ^=3D 1;
> +
> ++  /* Now advance the new G1 g_signals to the new lowseq, giving it
> ++     an effective signal count of 0 to start.  */
> ++  atomic_store_release (cond->__data.__g_signals + g1, lowseq);
> ++
> +   /* These values are just observed by signalers, and thus protected by=
 the
> +      lock.  */
> +   unsigned int orig_size =3D wseq - (old_g1_start + old_orig_size);
> +diff --git a/nptl/pthread_cond_wait.c b/nptl/pthread_cond_wait.c
> +index 20c348a5..1cb3dbf7 100644
> +--- a/nptl/pthread_cond_wait.c
> ++++ b/nptl/pthread_cond_wait.c
> +@@ -238,9 +238,7 @@ __condvar_cleanup_waiting (void *arg)
> +    signaled), and a reference count.
> +
> +    The group reference count is used to maintain the number of waiters =
that
> +-   are using the group's futex.  Before a group can change its role, th=
e
> +-   reference count must show that no waiters are using the futex anymor=
e; this
> +-   prevents ABA issues on the futex word.
> ++   are using the group's futex.
> +
> +    To represent which intervals in the waiter sequence the groups cover=
 (and
> +    thus also which group slot contains G1 or G2), we use a 64b counter =
to
> +@@ -300,11 +298,12 @@ __condvar_cleanup_waiting (void *arg)
> +        last reference.
> +      * Reference count used by waiters concurrently with signalers that=
 have
> +        acquired the condvar-internal lock.
> +-   __g_signals: The number of signals that can still be consumed.
> ++   __g_signals: The number of signals that can still be consumed, relat=
ive to
> ++     the current g1_start.  (i.e. bits 31 to 1 of __g_signals are bits
> ++     31 to 1 of g1_start with the signal count added)
> +      * Used as a futex word by waiters.  Used concurrently by waiters a=
nd
> +        signalers.
> +-     * LSB is true iff this group has been completely signaled (i.e., i=
t is
> +-       closed).
> ++     * LSB is currently reserved and 0.
> +    __g_size: Waiters remaining in this group (i.e., which have not been
> +      signaled yet.
> +      * Accessed by signalers and waiters that cancel waiting (both do s=
o only
> +@@ -328,18 +327,6 @@ __condvar_cleanup_waiting (void *arg)
> +    sufficient because if a waiter can see a sufficiently large value, i=
t could
> +    have also consume a signal in the waiters group.
> +
> +-   Waiters try to grab a signal from __g_signals without holding a refe=
rence
> +-   count, which can lead to stealing a signal from a more recent group =
after
> +-   their own group was already closed.  They cannot always detect wheth=
er they
> +-   in fact did because they do not know when they stole, but they can
> +-   conservatively add a signal back to the group they stole from; if th=
ey
> +-   did so unnecessarily, all that happens is a spurious wake-up.  To ma=
ke this
> +-   even less likely, __g1_start contains the index of the current g2 to=
o,
> +-   which allows waiters to check if there aliasing on the group slots; =
if
> +-   there wasn't, they didn't steal from the current G1, which means tha=
t the
> +-   G1 they stole from must have been already closed and they do not nee=
d to
> +-   fix anything.
> +-
> +    It is essential that the last field in pthread_cond_t is __g_signals=
[1]:
> +    The previous condvar used a pointer-sized field in pthread_cond_t, s=
o a
> +    PTHREAD_COND_INITIALIZER from that condvar implementation might only
> +@@ -435,6 +422,9 @@ __pthread_cond_wait_common (pthread_cond_t *cond, pt=
hread_mutex_t *mutex,
> +     {
> +       while (1)
> +       {
> ++          uint64_t g1_start =3D __condvar_load_g1_start_relaxed (cond);
> ++          unsigned int lowseq =3D (g1_start & 1) =3D=3D g ? signals : g=
1_start & ~1U;
> ++
> +         /* Spin-wait first.
> +            Note that spinning first without checking whether a timeout
> +            passed might lead to what looks like a spurious wake-up even
> +@@ -446,35 +436,45 @@ __pthread_cond_wait_common (pthread_cond_t *cond, =
pthread_mutex_t *mutex,
> +            having to compare against the current time seems to be the r=
ight
> +            choice from a performance perspective for most use cases.  *=
/
> +         unsigned int spin =3D maxspin;
> +-        while (signals =3D=3D 0 && spin > 0)
> ++        while (spin > 0 && ((int)(signals - lowseq) < 2))
> +           {
> +             /* Check that we are not spinning on a group that's already
> +                closed.  */
> +-            if (seq < (__condvar_load_g1_start_relaxed (cond) >> 1))
> +-              goto done;
> ++            if (seq < (g1_start >> 1))
> ++              break;
> +
> +             /* TODO Back off.  */
> +
> +             /* Reload signals.  See above for MO.  */
> +             signals =3D atomic_load_acquire (cond->__data.__g_signals +=
 g);
> ++              g1_start =3D __condvar_load_g1_start_relaxed (cond);
> ++              lowseq =3D (g1_start & 1) =3D=3D g ? signals : g1_start &=
 ~1U;
> +             spin--;
> +           }
> +
> +-        /* If our group will be closed as indicated by the flag on sign=
als,
> +-           don't bother grabbing a signal.  */
> +-        if (signals & 1)
> +-          goto done;
> +-
> +-        /* If there is an available signal, don't block.  */
> +-        if (signals !=3D 0)
> ++          if (seq < (g1_start >> 1))
> ++          {
> ++              /* If the group is closed already,
> ++               then this waiter originally had enough extra signals to
> ++               consume, up until the time its group was closed.  */
> ++             goto done;
> ++            }
> ++
> ++        /* If there is an available signal, don't block.
> ++             If __g1_start has advanced at all, then we must be in G1
> ++           by now, perhaps in the process of switching back to an older
> ++           G2, but in either case we're allowed to consume the availabl=
e
> ++           signal and should not block anymore.  */
> ++        if ((int)(signals - lowseq) >=3D 2)
> +           break;
> +
> +         /* No signals available after spinning, so prepare to block.
> +            We first acquire a group reference and use acquire MO for th=
at so
> +            that we synchronize with the dummy read-modify-write in
> +            __condvar_quiesce_and_switch_g1 if we read from that.  In tu=
rn,
> +-           in this case this will make us see the closed flag on __g_si=
gnals
> +-           that designates a concurrent attempt to reuse the group's sl=
ot.
> ++           in this case this will make us see the advancement of __g_si=
gnals
> ++           to the upcoming new g1_start that occurs with a concurrent
> ++           attempt to reuse the group's slot.
> +            We use acquire MO for the __g_signals check to make the
> +            __g1_start check work (see spinning above).
> +            Note that the group reference acquisition will not mask the
> +@@ -482,15 +482,24 @@ __pthread_cond_wait_common (pthread_cond_t *cond, =
pthread_mutex_t *mutex,
> +            an atomic read-modify-write operation and thus extend the re=
lease
> +            sequence.  */
> +         atomic_fetch_add_acquire (cond->__data.__g_refs + g, 2);
> +-        if (((atomic_load_acquire (cond->__data.__g_signals + g) & 1) !=
=3D 0)
> +-            || (seq < (__condvar_load_g1_start_relaxed (cond) >> 1)))
> ++        signals =3D atomic_load_acquire (cond->__data.__g_signals + g);
> ++          g1_start =3D __condvar_load_g1_start_relaxed (cond);
> ++          lowseq =3D (g1_start & 1) =3D=3D g ? signals : g1_start & ~1U=
;
> ++
> ++          if (seq < (g1_start >> 1))
> +           {
> +-            /* Our group is closed.  Wake up any signalers that might b=
e
> +-               waiting.  */
> ++              /* group is closed already, so don't block */
> +             __condvar_dec_grefs (cond, g, private);
> +             goto done;
> +           }
> +
> ++        if ((int)(signals - lowseq) >=3D 2)
> ++          {
> ++            /* a signal showed up or G1/G2 switched after we grabbed th=
e refcount */
> ++            __condvar_dec_grefs (cond, g, private);
> ++            break;
> ++            }
> ++
> +         // Now block.
> +         struct _pthread_cleanup_buffer buffer;
> +         struct _condvar_cleanup_buffer cbuffer;
> +@@ -501,7 +510,7 @@ __pthread_cond_wait_common (pthread_cond_t *cond, pt=
hread_mutex_t *mutex,
> +         __pthread_cleanup_push (&buffer, __condvar_cleanup_waiting, &cb=
uffer);
> +
> +         err =3D __futex_abstimed_wait_cancelable64 (
> +-          cond->__data.__g_signals + g, 0, clockid, abstime, private);
> ++          cond->__data.__g_signals + g, signals, clockid, abstime, priv=
ate);
> +
> +         __pthread_cleanup_pop (&buffer, 0);
> +
> +@@ -524,6 +533,8 @@ __pthread_cond_wait_common (pthread_cond_t *cond, pt=
hread_mutex_t *mutex,
> +         signals =3D atomic_load_acquire (cond->__data.__g_signals + g);
> +       }
> +
> ++       if (seq < (__condvar_load_g1_start_relaxed (cond) >> 1))
> ++       goto done;
> +     }
> +   /* Try to grab a signal.  Use acquire MO so that we see an up-to-date=
 value
> +      of __g1_start below (see spinning above for a similar case).  In
> +@@ -532,69 +543,6 @@ __pthread_cond_wait_common (pthread_cond_t *cond, p=
thread_mutex_t *mutex,
> +   while (!atomic_compare_exchange_weak_acquire (cond->__data.__g_signal=
s + g,
> +                                               &signals, signals - 2));
> +
> +-  /* We consumed a signal but we could have consumed from a more recent=
 group
> +-     that aliased with ours due to being in the same group slot.  If th=
is
> +-     might be the case our group must be closed as visible through
> +-     __g1_start.  */
> +-  uint64_t g1_start =3D __condvar_load_g1_start_relaxed (cond);
> +-  if (seq < (g1_start >> 1))
> +-    {
> +-      /* We potentially stole a signal from a more recent group but we =
do not
> +-       know which group we really consumed from.
> +-       We do not care about groups older than current G1 because they a=
re
> +-       closed; we could have stolen from these, but then we just add a
> +-       spurious wake-up for the current groups.
> +-       We will never steal a signal from current G2 that was really int=
ended
> +-       for G2 because G2 never receives signals (until it becomes G1). =
 We
> +-       could have stolen a signal from G2 that was conservatively added=
 by a
> +-       previous waiter that also thought it stole a signal -- but given=
 that
> +-       that signal was added unnecessarily, it's not a problem if we st=
eal
> +-       it.
> +-       Thus, the remaining case is that we could have stolen from the c=
urrent
> +-       G1, where "current" means the __g1_start value we observed.  How=
ever,
> +-       if the current G1 does not have the same slot index as we do, we=
 did
> +-       not steal from it and do not need to undo that.  This is the rea=
son
> +-       for putting a bit with G2's index into__g1_start as well.  */
> +-      if (((g1_start & 1) ^ 1) =3D=3D g)
> +-      {
> +-        /* We have to conservatively undo our potential mistake of stea=
ling
> +-           a signal.  We can stop trying to do that when the current G1
> +-           changes because other spinning waiters will notice this too =
and
> +-           __condvar_quiesce_and_switch_g1 has checked that there are n=
o
> +-           futex waiters anymore before switching G1.
> +-           Relaxed MO is fine for the __g1_start load because we need t=
o
> +-           merely be able to observe this fact and not have to observe
> +-           something else as well.
> +-           ??? Would it help to spin for a little while to see whether =
the
> +-           current G1 gets closed?  This might be worthwhile if the gro=
up is
> +-           small or close to being closed.  */
> +-        unsigned int s =3D atomic_load_relaxed (cond->__data.__g_signal=
s + g);
> +-        while (__condvar_load_g1_start_relaxed (cond) =3D=3D g1_start)
> +-          {
> +-            /* Try to add a signal.  We don't need to acquire the lock
> +-               because at worst we can cause a spurious wake-up.  If th=
e
> +-               group is in the process of being closed (LSB is true), t=
his
> +-               has an effect similar to us adding a signal.  */
> +-            if (((s & 1) !=3D 0)
> +-                || atomic_compare_exchange_weak_relaxed
> +-                     (cond->__data.__g_signals + g, &s, s + 2))
> +-              {
> +-                /* If we added a signal, we also need to add a wake-up =
on
> +-                   the futex.  We also need to do that if we skipped ad=
ding
> +-                   a signal because the group is being closed because
> +-                   while __condvar_quiesce_and_switch_g1 could have clo=
sed
> +-                   the group, it might stil be waiting for futex waiter=
s to
> +-                   leave (and one of those waiters might be the one we =
stole
> +-                   the signal from, which cause it to block using the
> +-                   futex).  */
> +-                futex_wake (cond->__data.__g_signals + g, 1, private);
> +-                break;
> +-              }
> +-            /* TODO Back off.  */
> +-          }
> +-      }
> +-    }
> +-
> +  done:
> +
> +   /* Confirm that we have been woken.  We do that before acquiring the =
mutex
> +--
> +2.49.0
> +
> diff --git a/meta/recipes-core/glibc/glibc_2.35.bb b/meta/recipes-core/gl=
ibc/glibc_2.35.bb
> index 9073e04537..2d23c17a48 100644
> --- a/meta/recipes-core/glibc/glibc_2.35.bb
> +++ b/meta/recipes-core/glibc/glibc_2.35.bb
> @@ -61,6 +61,7 @@ SRC_URI =3D  "${GLIBC_GIT_URI};branch=3D${SRCBRANCH};na=
me=3Dglibc \
>             file://0022-sysdeps-gnu-configure.ac-Set-libc_cv_rootsbindir-=
onl.patch \
>             file://0023-timezone-Make-shell-interpreter-overridable-in-tz=
sel.patch \
>             file://0024-fix-create-thread-failed-in-unprivileged-process-=
BZ-.patch \
> +           file://0026-PR25847-1.patch \
>             \
>             file://0001-Revert-Linux-Implement-a-useful-version-of-_start=
up_.patch \
>             file://0002-get_nscd_addresses-Fix-subscript-typos-BZ-29605.p=
atch \
> --
> 2.49.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#218493): https://lists.openembedded.org/g/openembedde=
d-core/message/218493
> Mute This Topic: https://lists.openembedded.org/mt/113603744/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

