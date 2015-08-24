Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 121716AC1E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Aug 2015 11:02:24 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga103.jf.intel.com with ESMTP; 24 Aug 2015 04:02:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,737,1432623600"; d="scan'208";a="774485966"
Received: from achalot-mobl1.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.20.62])
	by fmsmga001.fm.intel.com with ESMTP; 24 Aug 2015 04:02:24 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Mon, 24 Aug 2015 12:02:22 +0100
Message-ID: <3261262.kYkpH9KIeH@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.9 (Linux/4.1.5-100.fc21.x86_64; KDE/4.14.9; x86_64; ; )
In-Reply-To: <1440153906.12105.233.camel@linuxfoundation.org>
References: <cover.1439991144.git.paul.eggleton@linux.intel.com>
	<d1dcc85512f0c7b9b93f2780048bb9fad8c9da2d.1439991144.git.paul.eggleton@linux.intel.com>
	<1440153906.12105.233.camel@linuxfoundation.org>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC PATCH 1/1] classes/whitelist: add class to allow whitelisting recipes from a layer
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
X-List-Received-Date: Mon, 24 Aug 2015 11:02:26 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday 21 August 2015 11:45:06 Richard Purdie wrote:
> On Wed, 2015-08-19 at 14:34 +0100, Paul Eggleton wrote:
> > Allow restricting recipes brought from a layer to a specified list. This
> > is similar in operation to blacklist.bbclass, but instead specifies a
> > per-layer whitelist of recipes (matched by BPN) that are able to be
> > built from the layer - anything else is skipped. This is potentially
> > useful where you want to bring in a select set of recipes from a larger
> > layer e.g. meta-oe.
> > 
> > Implements [YOCTO #8150].
> > 
> > Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> > ---
> > 
> >  meta/classes/whitelist.bbclass | 28 ++++++++++++++++++++++++++++
> >  1 file changed, 28 insertions(+)
> >  create mode 100644 meta/classes/whitelist.bbclass
> 
> I should go on record as having some pretty strong reservations about
> this from a philosophical standpoint.
> 
> Why? I think its going to encourage behaviours which will result in a
> decrease in layer quality, particularly for meta-oe.
> 
> Taking a simple example, today if someone breaks parsing in meta-oe, its
> quickly known about and multiple people can see and resolve the issue.
> Once people start using this class, many users will simply never
> see/care about parsing breakage in less maintained parts of the layer.
> 
> I appreciate Martin will likely notice, however this shouldn't Martin's
> sole responsibility.
> 
> Since people's focus will be on to narrow parts of the layer, we'll
> start to see islands which are well maintained/used and islands which
> are not. Worse, just looking at the layer, we won't be able to tell
> which is which.
> 
> I'm nervous about anything which pushes responsibility onto already
> overloaded maintainers and encourages behaviour which is a net loss on
> "quality".
>
> I've talked to several significant users and they all "love" the idea of
> this class and plan to adopt it ASAP over existing tools like
> combo-layer. I therefore can't see much advantage of not merging the
> class as people are going to use it regardless.

I appreciate the concern, but I have to be honest, I don't see this as being a 
problem with this class per se, for a couple of reasons:

1) People already feel the need to be selective in some way about the recipes 
they pull from larger layers such as meta-oe - whether they do it by using 
combo-layer, this class, git-filter-branch or simply by copying the recipes 
they want into their own layers. Using the whitelist class has one advantage 
over all the rest for the simple filtering case - you are always using the 
recipes from upstream. (OK, with combo-layer you probably are, but here it's 
direct.) Besides, even if people aren't doing any active filtering on the 
layer, they almost certainly aren't building the entire thing in any case - so 
can we really say they are testing it now?

2) Responsibility - it's great when people do report issues they find, but we 
shouldn't need to rely on people randomly coming across an issue in order to 
find it, we should be testing it ourselves. The job of maintaining the quality 
of layers rests with us - i.e. the people who are involved in maintaining the 
layers and developing the tools needed to do so. Martin does regular builds 
with a variety of layers as do others. If it's simply parse checking that we 
feel we are losing, it would be trivial to add extra regular checks; if 
nothing else, the layer index is parsing every recipe in almost every public 
layer every three hours; with a little extra work we could log and expose the 
results of that through the interface. (Am I volunteering to do this? Sure, as 
it'll probably be on my own time I can't promise to do it soon, but I will get 
to it if nobody else does first.)

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

