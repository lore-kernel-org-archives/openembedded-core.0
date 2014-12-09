Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 6C8EB723A8
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Dec 2014 16:23:51 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 09 Dec 2014 08:08:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,545,1413270000"; d="scan'208";a="644902119"
Received: from cleane-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.31.30])
	by fmsmga002.fm.intel.com with ESMTP; 09 Dec 2014 08:08:46 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Trevor Woerner <trevor.woerner@linaro.org>
Date: Tue, 09 Dec 2014 16:08:45 +0000
Message-ID: <3650068.9i3ehsGpzV@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.3 (Linux/3.17.4-200.fc20.x86_64; KDE/4.14.3; x86_64; ; )
In-Reply-To: <54871799.9000707@linaro.org>
References: <cover.1416934753.git.paul.eggleton@linux.intel.com>
	<6421374.i7zskq6Uby@peggleto-mobl5.ger.corp.intel.com>
	<54871799.9000707@linaro.org>
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
X-List-Received-Date: Tue, 09 Dec 2014 16:23:59 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 09 December 2014 10:39:05 Trevor Woerner wrote:
> On 12/09/14 10:10, Paul Eggleton wrote:
> > On Tuesday 09 December 2014 10:00:51 Trevor Woerner wrote:
> >> Would it be possible to make the output of devtool be nice and colourful
> >> like the output of bitbake?
> >> 
> >>> Good idea, this is now done on the branch as well. "devtool build"
> >>> doesn't support colour in the bitbake output, but that's because colour
> >>> support in bitbake is switched by whether the output is going to a TTY
> >>> and stdout is being redirected in this case. (I guess we could add a
> >>> command line option for that as I have with devtool/recipetool.)
> >> 
> >> If it's not too much trouble I would like to ask that colour/curses be
> >> possible/enabled by default. Trying to find the error in all that output
> >> is a "needle in a haystack"-like operation :-)
> > 
> > I don't think this is straightforward unfortunately. I'll have to look
> > into it.
> 
> Okay. Maybe it'd be best to just revert to bitbake? IOW, does the
> devtool tool need its own "build,deploy,..."?

We did talk about this in a previous email, but just to clarify:

"devtool build" isn't strictly required in this phase, I added it primarily to 
support future usage in the SDK where the intention is to do everything 
through the devtool command, although that is a usage model that isn't enabled 
yet. However, it is a convenient shortcut for "bitbake -c install 
<recipename>" (which is all you need to do for "devtool deploy" to be able to 
work.)

"devtool deploy" is not related to do_deploy - it places files for the recipe 
on a nominated target machine without having to worry about packaging; we have 
no other equivalent for this at the moment. Perhaps it could have a different 
name in case the naming overlap is confusing.

> >> I wonder if all the
> >> 
> >>     NOTE: Running setscene task 31 of 33
> >> 
> >> (/home/trevor/devel/yocto/build/poky/meta-poky/meta/recipes-devtools/gcc/
> >> gc
> >> c-runtime_4.9.bb, do_populate_sysroot_setscene)
> >> 
> >>     NOTE: recipe gcc-runtime-4.9.1-r0: task
> >>     do_populate_sysroot_setscene: Started
> >>     NOTE: recipe gcc-runtime-4.9.1-r0: task
> >>     do_populate_sysroot_setscene: Succeeded
> >>     NOTE: Running setscene task 33 of 33
> >> 
> >> (/home/trevor/devel/yocto/build/poky/meta-poky/meta/recipes-devtools/gcc/
> >> gc
> >> c-cross_4.9.bb, do_populate_sysroot_setscene)
> >> 
> >>     NOTE: recipe gcc-cross-i586-4.9.1-r0: task
> >>     do_populate_sysroot_setscene: Started
> >>     NOTE: recipe gcc-cross-i586-4.9.1-r0: task
> >>     do_populate_sysroot_setscene: Succeeded
> >> 
> >> Could be (should be) done as part of the "devtool
> >> create-workspace"/"devtool add" operation?
> > 
> > If running devtool along side someone's existing build environment,
> > wouldn't that be expected to be set up already? (All it does effectively
> > is "bitbake recipename")
> 
> Here are my steps:
> $ source meta-poky/oe-init-build-env build
> $ bitbake core-image-x11
> $ devtool add <myx11app>
> $ devtool build <myx11app>
> 
> at this point it does a bunch of these gcc-runtime tasks. So my first
> thought is: "why is my build going off into left field and doing all
> these other things when all I asked it to do is to build <myx11app>?".
> I'm guessing these gcc-runtime tasks are required for something related
> to devtool, and they only need to be run once. So maybe it would be best
> if they were run as part of creating the workspace (either explicitly
> with "devtool create-workspace" or implicitly with "devtool add")?

Trying to make "devtool add" or "devtool modify" do this just doesn't feel 
right to me. These operations are supposed to be quick, and if they end up 
running actual build tasks, they won't be.

My guess (with no other context) is that the reason you are seeing this is 
that you're building from sstate, and when it builds core-image-x11 it doesn't 
need some of the tasks that it then does need when it goes to build the 
individual recipe. I'm not sure, but I would expect that most people would be 
doing this from an existing build directory rather than starting with a new 
one. Is there a reason you're creating a new build directory as part of the 
steps above?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

