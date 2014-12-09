Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 70C5972504
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Dec 2014 15:19:41 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 09 Dec 2014 07:10:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,545,1413270000"; d="scan'208";a="644868818"
Received: from cleane-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.31.30])
	by fmsmga002.fm.intel.com with ESMTP; 09 Dec 2014 07:10:35 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Trevor Woerner <trevor.woerner@linaro.org>
Date: Tue, 09 Dec 2014 15:10:34 +0000
Message-ID: <6421374.i7zskq6Uby@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.3 (Linux/3.17.4-200.fc20.x86_64; KDE/4.14.3; x86_64; ; )
In-Reply-To: <54870EA3.20802@linaro.org>
References: <cover.1416934753.git.paul.eggleton@linux.intel.com>
	<7839390.odV1UMkpj8@peggleto-mobl5.ger.corp.intel.com>
	<54870EA3.20802@linaro.org>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC PATCH 0/7] Developer workflow improvements
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
X-List-Received-Date: Tue, 09 Dec 2014 15:19:45 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 09 December 2014 10:00:51 Trevor Woerner wrote:
> (oops! sorry for going off-list)
> 
> On 12/09/14 05:50, Paul Eggleton wrote:
> > On Monday 08 December 2014 22:30:31 Trevor Woerner wrote:
> >> This is really awesome stuff. I'm still playing around with it.
> >> 
> >> My current HEAD is:
> >>     commit 6ea5f5368a88317ace198f44a47cf043bc9fb6e6
> >>     Author: Paul Eggleton <paul.eggleton@linux.intel.com>
> >>     Date:   Fri Dec 5 11:30:25 2014 +0000
> >>     
> >>         devtool: use event filtering to disable events if available
> >> 
> >> on your contrib/paule/devtool branch.
> >> 
> >> If I do a "devtool add" without a "devtool create-workspace" it succeeds
> >> 
> >> but I get:
> >>     $ devtool add xannounce ~/devel/code/xannounce
> >>     INFO: Creating workspace layer in
> >>     INFO: Recipe recipes/xannounce/xannounce.bb has been automatically
> >>     created; further editing may be required to make it fully functional
> >> 
> >> and find the changes have been made in the current directory. If I do
> >> the "devtool create-workspace" first, I get a "workspace" directory and
> >> all the stuff put in there, which is nicer.
> >> 
> >> If it doesn't fail due to a user running "devtool add" before "devtool
> >> create-workspace" then I think it would be nice if the two results were
> >> the same.
> > 
> > Ah, oops - I've found the cause and fixed it on the branch. Thanks!
> 
> Awesome... *very* nice. It works great now.
> 
> >> Would it be possible to make the output of devtool be nice and colourful
> >> like the output of bitbake?
> > 
> > Good idea, this is now done on the branch as well. "devtool build" doesn't
> > support colour in the bitbake output, but that's because colour support in
> > bitbake is switched by whether the output is going to a TTY and stdout is
> > being redirected in this case. (I guess we could add a command line option
> > for that as I have with devtool/recipetool.)
> 
> If it's not too much trouble I would like to ask that colour/curses be
> possible/enabled by default. Trying to find the error in all that output
> is a "needle in a haystack"-like operation :-)

I don't think this is straightforward unfortunately. I'll have to look into 
it.

> I wonder if all the
> 
>     NOTE: Running setscene task 31 of 33
>    
> (/home/trevor/devel/yocto/build/poky/meta-poky/meta/recipes-devtools/gcc/gc
> c-runtime_4.9.bb, do_populate_sysroot_setscene)
>     NOTE: recipe gcc-runtime-4.9.1-r0: task
>     do_populate_sysroot_setscene: Started
>     NOTE: recipe gcc-runtime-4.9.1-r0: task
>     do_populate_sysroot_setscene: Succeeded
>     NOTE: Running setscene task 33 of 33
>    
> (/home/trevor/devel/yocto/build/poky/meta-poky/meta/recipes-devtools/gcc/gc
> c-cross_4.9.bb, do_populate_sysroot_setscene)
>     NOTE: recipe gcc-cross-i586-4.9.1-r0: task
>     do_populate_sysroot_setscene: Started
>     NOTE: recipe gcc-cross-i586-4.9.1-r0: task
>     do_populate_sysroot_setscene: Succeeded
> 
> 
> Could be (should be) done as part of the "devtool
> create-workspace"/"devtool add" operation?

If running devtool along side someone's existing build environment, wouldn't 
that be expected to be set up already? (All it does effectively is "bitbake 
recipename")

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

