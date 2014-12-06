Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 529AE60673
	for <openembedded-core@lists.openembedded.org>;
	Sat,  6 Dec 2014 17:08:49 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 06 Dec 2014 09:07:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,529,1413270000"; d="scan'208";a="619719692"
Received: from unknown (HELO peggleto-mobl5.ger.corp.intel.com)
	([10.252.18.22])
	by orsmga001.jf.intel.com with ESMTP; 06 Dec 2014 09:08:48 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Date: Sat, 06 Dec 2014 17:08:47 +0000
Message-ID: <2070632.JdYqmvodGE@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.3 (Linux/3.17.4-200.fc20.x86_64; KDE/4.14.3; x86_64; ; )
In-Reply-To: <CAP9ODKrLxhKNi+TS4T+e86zBJ1Rnu-Q443AoztfudrwpvGAUrg@mail.gmail.com>
References: <cover.1417802944.git.paul.eggleton@linux.intel.com>
	<2398845.3Ch9h31VYL@peggleto-mobl5.ger.corp.intel.com>
	<CAP9ODKrLxhKNi+TS4T+e86zBJ1Rnu-Q443AoztfudrwpvGAUrg@mail.gmail.com>
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 1/1] buildtools-tarball: restore missing git tools
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
X-List-Received-Date: Sat, 06 Dec 2014 17:08:55 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Saturday 06 December 2014 11:01:49 Otavio Salvador wrote:
> On Fri, Dec 5, 2014 at 11:39 PM, Paul Eggleton
> 
> <paul.eggleton@linux.intel.com> wrote:
> > On Friday 05 December 2014 16:30:44 Otavio Salvador wrote:
> >> On Fri, Dec 5, 2014 at 4:09 PM, Paul Eggleton
> >> 
> >> <paul.eggleton@linux.intel.com> wrote:
> >> > Since the split out of git-perltools, some git tools (such as "git am",
> >> > "git send-email" and "git-submodule") have no longer been part of the
> >> > buildtools. We need these, so add them back in.
> >> > 
> >> > However, adding git-perltools to buildtools triggers perl itself being
> >> > brought into buildtools as well, and we don't want that; but we also
> >> > don't want to have to hack the git recipe or indeed anything else that
> >> > starts depending on perl. Thus, add a dummy package which gets
> >> > installed
> >> > in its place, in a separate package architecture that is only enabled
> >> > for buildtools to ensure it doesn't start appearing in place of
> >> > nativesdk-perl anywhere else.
> >> > 
> >> > Fixes [YOCTO #7033].
> >> > 
> >> > Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> >> 
> >> This dummy thing looks like a hack to me :-(
> > 
> > Perhaps - I'm all ears for an alternative solution, but it absolutely has
> > to be fixed, and soon. Shipping an incomplete git (or incomplete perl) in
> > buildtools basically defeats a major part of having the thing in the
> > first place.
> 
> We should split out the tools we really want (so we skip the perl
> runtime dependency) 

This is exactly what caused this problem in the first place. We cannot do 
without the perl-dependent pieces of git.

> or include perl. Use a dummy package for it is
> wrong in my opinion. You cannot guarantee host perl will work as
> expected for our git release.

It hasn't presented a problem up to now, and until it does I'd rather not ship 
perl in buildtools. CentOS 6 is the oldest distro we support, and the latest 
version of git works perfectly fine with the version of perl that's provided by 
the distro there. On the other hand, adding perl means we need to add a bunch 
of additional perl modules as well, and I really don't think we want to do 
that because it just increases the compexity and size of the buildtools and we 
don't actually need it anyway.

I have actually thought about this.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

