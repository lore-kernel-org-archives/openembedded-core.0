Return-Path: <junjie.cao@linux.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DC27C5AD7B
	for <webhook@archiver.kernel.org>; Mon, 10 Aug 2026 08:21:29 +0000 (UTC)
Received: from out-188.mta1.migadu.com (out-188.mta1.migadu.com [95.215.58.188])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.25454.1786350081374426425
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Aug 2026 01:21:21 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@linux.dev header.s=key1 header.b=p4rtooYF;
 spf=pass (domain: linux.dev, ip: 95.215.58.188, mailfrom: junjie.cao@linux.dev)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1786350079;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dlNC9Hkg7rCQ+RO8gOJGV+ChjMTVW0bZ0qAwpAlXwsc=;
	b=p4rtooYFPyV/8135r8IVhGsZvPmO8wJVJqiIo8bCo6FT8iv2EFCf77ojF2zI60knOb/7GU
	Bo2btXepsG5L7rxXZJ/2PPkVx1ycIyX8b9Oi+OutAN4Uwmfw6tKx2Xw4BkvboeP1V0NF/Q
	R8pBd1+z6Nee1+9+tqT7UxSgZi1vtUs=
From: Junjie Cao <junjie.cao@linux.dev>
To: paul@pbarker.dev
Cc: openembedded-core@lists.openembedded.org,
	randy.macleod@windriver.com,
	Venkata.Navuduri@windriver.com
Subject: Re: [OE-core][PATCH v2 00/10] cve-exclusion: triage ten kernel CVEs lacking upstream fix data
Date: Mon, 10 Aug 2026 05:19:58 -0500
Message-ID: <20260810101958.804429-1-junjie.cao@linux.dev>
In-Reply-To: <8bf8e31c06972ab4bfed61083d8d8c57e6c48d9e.camel@pbarker.dev>
References: <20260803084827.1348810-1-junjie.cao@linux.dev> <8bf8e31c06972ab4bfed61083d8d8c57e6c48d9e.camel@pbarker.dev>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Aug 2026 08:21:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243118

Hi Paul,

On Thu, 2026-08-06 at 12:52 +0100, Paul Barker wrote:
> We briefly discussed this patch series on the review call today. We're
> concerned about taking CVE status changes based on AI-Generated analysi=
s
> from a new contributor, when there are multiple ways to interpret the
> various discussions online about these issues and it's not immediately
> clear what the "right" answer is. So we need to give these patches a
> thorough review. As we often point out in the weekly status emails, we
> have limited bandwidth to do this sort of in-depth review, so we may no=
t
> be able to handle these patches quickly.

Thanks very much for your time and reply - understood, and no
urgency from my side. For v3 I'll drop the one inferred verdict
and downgrade the four "upstream-wontfix" entries to "unpatched",
so what's left should be checkable from the links in each commit
message. Happy to go through any of these on a review call if
that's easier.

> >   fixed-version     CVE-2022-1247   v6.17, rose_neigh refcount conver=
sion
>
> rose_connect() is now gone from mainline, so we can easily say this was
> fixed with the removal of net/rose. Pointing at an earlier fix requires
> more detailed review.

I'll lead with the removal in the entry. Since master's linux-yocto
is 6.18 and the removal (dd8d4bc28ad7) is v7.1, the entry still
needs the v6.17 commits to cover 6.18. The kernel CNA later
assigned those two commits CVEs of their own (CVE-2025-39826/39827),
which ties them to this rose_neigh race in upstream's records.

> >                     CVE-2023-4010   v6.18, imon URB resubmit loop
>
> This sounds like we're trying to infer the reporter's intent based on
> 'imon' being visible in a screenshot. We shouldn't be making guesses
> just because the initial report quality is poor.

OK, I'll drop this patch and leave the CVE untriaged. The record
names a function that does not exist in the kernel, so I'll raise
that with the assigning CNA; if the record gets corrected or
disputed the status can follow it.

> >   upstream-wontfix  CVE-2019-14899  weak host model, config-only miti=
gation
>
> We shouldn't use upstream-wontfix unless that is an actual upstream
> opinion. Ubuntu/RedHat are not upstream for the Linux kernel.

Right. None of the four has an upstream wontfix statement, so I'll
move CVE-2019-14899, CVE-2021-3714, CVE-2021-3864 and CVE-2022-4543
to "unpatched" and put the distro references in the comments.

> >                     CVE-2021-3864   two fix attempts, neither merged
>
> As above. Was the fix actually rejected by upstream or did it just go q=
uiet?

Went quiet, mostly. Eric Biederman called Waiman Long's patch "not
a particularly effective mitigation", Linus suggested a different
approach, Willy Tarreau posted WIP patches for it, and that petered
out in early 2022 with nothing merged. Wander Lairson Costa's RFC
v2 got design feedback and no v3 followed. The "NAKed" in my patch
3 message overstates this - I'll fix that wording in v3.

> >   unpatched         CVE-2023-3397   JFS txEnd UAF, proposed fix withd=
rawn
>
> Unclear if there is still a real problem here in mainline.

The txEnd() sequence is unchanged in linux-next 20260727, and the
use-after-free was reported again this June against 7.0-rc1, with
the free stack in lmLogClose() via jfs_umount(), which is the race
this CVE describes:

  https://lore.kernel.org/all/6a3eedfa.fd822575.2d6b21.e180@mx.google.com=
/

I'll add the link to the commit message.

> >                     CVE-2023-6240   RSA timing oracle, fixed only in =
RHEL
>
> Also probably correct but not completely sure. The commit message has
> artifacts of the LLM being confused (Marvell/s390/unrelated commit
> reference), those can be dropped.

Will drop those.

Best regards,
Junjie

