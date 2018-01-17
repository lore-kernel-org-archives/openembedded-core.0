Return-Path: <paul.eggleton@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 67850786D8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jan 2018 09:54:34 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	17 Jan 2018 01:54:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,372,1511856000"; d="scan'208";a="10907129"
Received: from yshambhx-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.249.78.155])
	by fmsmga007.fm.intel.com with ESMTP; 17 Jan 2018 01:54:30 -0800
From: Paul Eggleton <paul.eggleton@intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Joshua Watt <jpewhacker@gmail.com>
Date: Wed, 17 Jan 2018 22:54:26 +1300
Message-ID: <2080215.4K1ShPjLf3@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
In-Reply-To: <1515926585.29722.206.camel@linuxfoundation.org>
References: <20180112162442.8524-1-JPEWhacker@gmail.com>
	<1515926585.29722.206.camel@linuxfoundation.org>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] classes/externalsrc: Don't delete tasks
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
X-List-Received-Date: Wed, 17 Jan 2018 09:54:35 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Sunday, 14 January 2018 11:43:05 PM NZDT Richard Purdie wrote:
> On Fri, 2018-01-12 at 10:24 -0600, Joshua Watt wrote:
> > Set the noexec flag to prevent tasks from executing instead of
> > deleting them. This allows inter-tasks dependencies on these tasks to still
> > function. For example, perf has the line:
> > 
> >  do_populate_lic[depends] += "virtual/kernel:do_patch"
> > 
> > which will break if the kernel uses EXTERNALSRC and the do_patch task
> > is deleted.
>
> There are a few things I worry about with this:
> 
> a) Its confusing for users as it will now show a fetch/unpack/patch
> task as part of the dependency tree but they won't actually run.
> 
> b) Dependencies for those tasks will be followed
> 
> c) There has always been a bit of ambiguity about what should happen
> with task properties like cleandirs, dirs and others. Whilst these
> don't run for noexec, I have worries that somehow we'll end up wiping
> out the external source dir accidentally (e.g. with do_clean). I think
> the noexec move makes this more likely, sadly.

I definitely agree we don't want this noexec. FYI we have hit issues of this
nature before with externalsrc - in fact we add a dependency between 
do_configure and do_unpack here to cover do_patch being deleted:

  http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=a5047717bd11d332fc9f4320beaa26719de1793c

> externalsrc started out as a 30 line class back in 2012 and its now 235
> lines and getting ridiculously complicated.
> 
> I'm starting to wonder if we should change the approach and have it
> modify SRC_URI and take a copy of the source. Yes, it'd be fractionally
> slower but its getting far too complex trying to handle all the corner
> cases. It was meant so developers could quickly hack/test things and
> its turning into a full development tool/workflow.
> 
> I think we do need to take a step back and try and come up with a way
> to simplify it...
> 
> We should also think about whether there are changes to the core which
> would make things like this easier. I do have a fairly strong belief
> that we should make the system more robust and able to handle tasks
> being missing, its now a lot better at handling that than it used to
> be. Chris as talked about a "srcready" type task and reworking the
> fetch/unpack/patch process  and I can see the reasoning for that, it
> would help here too.
> 
> Not sure whether Paul has any thoughts on this as externalsrc will
> significantly impact devtool too...

I know you're unhappy with the state of the externalsrc class, and it's
certainly true that it has grown organically since we first implemented it.
A bunch of the things we have added in there have been for the benefit
of devtool users (where there is an intended workflow) and I can see that
it's possible be getting in the way of folks who are using externalsrc  on its
own.

I'm not against simplifying externalsrc per se, but we need to be sure we are
making the right tradeoffs. As far as devtool usage is concerned I'd really
prefer not to do something that involves source tree copying, for the following
reasons:

1) With large source trees it can only perform worse than currently. I'm
already a bit concerned about the turnaround time for repeat builds with
externalsrc on the kernel for example, and if you take it to the extreme
with something like webkit or Qt it'll be even more noticeable.

2) We would be making things more complicated for the user. For example,
error messages will be mentioning the copy path not the source path the user
knows about, potentially leading the user to edit the wrong files and then
wonder what is going on when those changes get overwritten. If S==B then
it seems to me it'll be worse - I think you'd have to delete any partial build
results each time or you couldn't be sure you'd synchronised the source trees.

3) If we were to add in mitigations for the two issues above, we're going to
start to build a monster similar to the one we're trying to slay.

4) We actually already have a solution where you get a copy of the source: 
file://. You might need to build on top of that a little to get something close
to what externalsrc does, of course, but it's there.

I know fragility is only one aspect of your concerns, but the solution to that
aspect at least is more focused tests. We exercise externalsrc currently via
devtool's oe-selftest tests a little, but it's not a complete proof of
externalsrc's functionality as it exists today.

If we need to we could also split out the things we added for devtool to a
separate class, however the difficulty would be deciding where the line is
between things externalsrc-only users need and things they don't.

Cheers,
Paul




-- 
Paul Eggleton
Intel Open Source Technology Centre

