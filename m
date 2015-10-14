Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-yk0-f172.google.com (mail-yk0-f172.google.com
	[209.85.160.172])
	by mail.openembedded.org (Postfix) with ESMTP id DBAE476FDE;
	Wed, 14 Oct 2015 19:48:13 +0000 (UTC)
Received: by ykaz22 with SMTP id z22so32194653yka.2;
	Wed, 14 Oct 2015 12:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=OIHSJUr4isM+EYAp5dR2pIfZUk3MfmF4omKDtAUoujI=;
	b=e24UiQUrWeJMnwIuK6OlfwFqgSoqqSVmKwFON0sY3NcMwT1PeOFE10GUcblrl3MlHD
	MBTskGGspAeRDNxlnmJ6od9DHYS1ljnEDDZxpp4h1zqmqGAmTtevD5frn64FF++RacTq
	ODChgZ+s1CNIT/8J1kNQOmSdUACevSoVNUvxTOYGRQGxpU0xHlpeTzQc1yX12jwUqvLb
	Kva4L7tBkbfXQUH3P8qrsqjhw/V1/9/Rsyh4+p44JWIHVBoYxkVUQjwDtaRsIXRdDAap
	D1uoQL8QEelSLuYJAUw31wmayqlIVF9D8INvJLuI0xzX2/EzuvpYyLvlFPzMy9CHaKyR
	dfwQ==
MIME-Version: 1.0
X-Received: by 10.129.0.2 with SMTP id 2mr4109955ywa.127.1444852093195; Wed,
	14 Oct 2015 12:48:13 -0700 (PDT)
Received: by 10.13.217.201 with HTTP; Wed, 14 Oct 2015 12:48:13 -0700 (PDT)
In-Reply-To: <20151014193033.GD3552@dent.vctlabs.com>
References: <1439220090-3305-1-git-send-email-s.mueller-klieser@phytec.de>
	<20151014193033.GD3552@dent.vctlabs.com>
Date: Wed, 14 Oct 2015 15:48:13 -0400
Message-ID: <CADkTA4MMRESA2E2H_0iruywU6AgzSwaZ8Sj03SBB25=ckGv41Q@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Cc: Denys Dmytriyenko <denys@ti.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe] kernel.bbclass: Fix do_shared_workdir task ordering
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 14 Oct 2015 19:48:14 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Oct 14, 2015 at 3:30 PM, S. Lockwood-Childs <sjl@vctlabs.com> wrote:
> http://patchwork.openembedded.org/patch/99875/
>
> Apparently this patch is still not in master, and I just ran across the
> problem with an externally built module (omaplfb from omap3-sgx-modules)
> in meta-ti layer.
>
> What's the plan for getting a correct Module.symver into shared_workdir
> for external modules to build against? Above patch, or does someone have
> an even better idea?

Richard and I sync'd on this while in Dublin @ ELCe, and the changes
aren't missing
from master by mistake .. but more because we are still working to come up with
a comprehensive solution (tracked in bugzilla).

The solution is pretty much what I described before, we are balancing
applications
and tasks that do not need kernel modules to be built, versus external modules
that depend on symbols from other modules. The devil is in the
details, and getting
a non-racy, task locked solution that allows the recipe writer to
explicitly decide
whether they need modules built or not .. attempts at detecting the
need, or forcing
a one size fits all solution have all lead to dead ends.

Since we are close to a release point, I'm still working on this out
of the tree, and
will propose some changes when the tree looks stable.

For now, you can carry the patch locally, or you can append to the kernel module
compilation task and do a second copy of the symvers file to the share
directory.

i.e. a variant of this:
http://patchwork.openembedded.org/patch/94891/, done in a
bbappend versus the class.

Cheers,

Bruce



> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

