Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 576EA72440
	for <openembedded-core@lists.openembedded.org>;
	Sat,  6 Dec 2014 17:14:47 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 06 Dec 2014 09:13:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,529,1413270000"; d="scan'208";a="649509649"
Received: from unknown (HELO peggleto-mobl5.ger.corp.intel.com)
	([10.252.18.22])
	by orsmga002.jf.intel.com with ESMTP; 06 Dec 2014 09:14:47 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: "Peter A. Bigot" <pab@pabigot.com>
Date: Sat, 06 Dec 2014 17:14:18 +0000
Message-ID: <11168201.psZy8F9ArL@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.3 (Linux/3.17.4-200.fc20.x86_64; KDE/4.14.3; x86_64; ; )
In-Reply-To: <54830760.7020708@pabigot.com>
References: <cover.1417802944.git.paul.eggleton@linux.intel.com>
	<CAP9ODKrLxhKNi+TS4T+e86zBJ1Rnu-Q443AoztfudrwpvGAUrg@mail.gmail.com>
	<54830760.7020708@pabigot.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Sat, 06 Dec 2014 17:14:55 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Peter,

On Saturday 06 December 2014 07:40:48 Peter A. Bigot wrote:
> On 12/06/2014 07:01 AM, Otavio Salvador wrote:
> > On Fri, Dec 5, 2014 at 11:39 PM, Paul Eggleton
> > 
> > <paul.eggleton@linux.intel.com> wrote:
> >> On Friday 05 December 2014 16:30:44 Otavio Salvador wrote:
> >>> On Fri, Dec 5, 2014 at 4:09 PM, Paul Eggleton
> >>> 
> >>> <paul.eggleton@linux.intel.com> wrote:
> >>>> Since the split out of git-perltools, some git tools (such as "git am",
> >>>> "git send-email" and "git-submodule") have no longer been part of the
> >>>> buildtools. We need these, so add them back in.
> >>>> 
> >>>> However, adding git-perltools to buildtools triggers perl itself being
> >>>> brought into buildtools as well, and we don't want that; but we also
> >>>> don't want to have to hack the git recipe or indeed anything else that
> >>>> starts depending on perl. Thus, add a dummy package which gets
> >>>> installed
> >>>> in its place, in a separate package architecture that is only enabled
> >>>> for buildtools to ensure it doesn't start appearing in place of
> >>>> nativesdk-perl anywhere else.
> >>>> 
> >>>> Fixes [YOCTO #7033].
> >>>> 
> >>>> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> >>> 
> >>> This dummy thing looks like a hack to me :-(
> >> 
> >> Perhaps - I'm all ears for an alternative solution, but it absolutely has
> >> to be fixed, and soon. Shipping an incomplete git (or incomplete perl)
> >> in buildtools basically defeats a major part of having the thing in the
> >> first place.
> > 
> > We should split out the tools we really want (so we skip the perl
> > runtime dependency) or include perl. Use a dummy package for it is
> > wrong in my opinion. You cannot guarantee host perl will work as
> > expected for our git release.
> 
> I vote for "include perl".

We'd rather not do that for buildtools unless there are actual problems with 
the host perl. I've heard of no such issues up to this point.

> I was surprised that I had to submit a patch to get git-perltools to
> include the git Perl module which is required by git add --interactive.

Right, we have that dependency now though.

> Why are there things in git-perltools that don't have a true dependency
> on perl?  And if they do, then is the issue that some of them are usable
> in restricted ways that don't invoke that dependency?

There aren't. These require perl, but the host perl should be perfectly 
adequate. Buildtools isn't quite the same as the target.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

