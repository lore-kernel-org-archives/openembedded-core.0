Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 8F7FA72382
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Dec 2014 17:56:49 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 10 Dec 2014 09:51:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,553,1413270000"; d="scan'208";a="635675883"
Received: from eadayrit-mobl2.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.31.152])
	by fmsmga001.fm.intel.com with ESMTP; 10 Dec 2014 09:51:17 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Trevor Woerner <trevor.woerner@linaro.org>
Date: Wed, 10 Dec 2014 17:51:16 +0000
Message-ID: <1504553.gLyqLqD1E0@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.3 (Linux/3.17.4-200.fc20.x86_64; KDE/4.14.3; x86_64; ; )
In-Reply-To: <5487463A.3030103@linaro.org>
References: <cover.1416934753.git.paul.eggleton@linux.intel.com>
	<3650068.9i3ehsGpzV@peggleto-mobl5.ger.corp.intel.com>
	<5487463A.3030103@linaro.org>
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
X-List-Received-Date: Wed, 10 Dec 2014 17:56:53 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 09 December 2014 13:58:02 Trevor Woerner wrote:
> On 12/09/14 11:08, Paul Eggleton wrote:
> > On Tuesday 09 December 2014 10:39:05 Trevor Woerner wrote:
> >> Okay. Maybe it'd be best to just revert to bitbake? IOW, does the
> >> devtool tool need its own "build,deploy,..."?
> > 
> > We did talk about this in a previous email, but just to clarify:
> > 
> > "devtool build" isn't strictly required in this phase, I added it
> > primarily to support future usage in the SDK where the intention is to do
> > everything through the devtool command, although that is a usage model
> > that isn't enabled yet. However, it is a convenient shortcut for "bitbake
> > -c install
> > <recipename>" (which is all you need to do for "devtool deploy" to be able
> > to work.)
> 
> True, we did talk about this before. All I'm saying is that the colour
> feature of bitbake is really nice, useful, and helpful (to visually
> parse output) and if we've lost colour because we've wrapped bitbake
> with "devtool build" then we're taking a step backwards.
> 
> But I'll concede the point if the future usage in the SDK turns out to
> be really helpful. All I'm saying at this point is I have no idea what
> this future usage might be or what your ideas are for this step, and for
> the time-being (i.e. without knowing or working with this SDK usage)
> "devtool build" is a step backwards from "bitbake".

OK, understood. I'll have a think about it.

> > "devtool deploy" is not related to do_deploy - it places files for the
> > recipe on a nominated target machine without having to worry about
> > packaging; we have no other equivalent for this at the moment. Perhaps it
> > could have a different name in case the naming overlap is confusing.
> 
> Ah yes, sorry I forgot... maybe something more explicit like
> "deploy_to_target"? ;-)
> push_to_target?
> upload_to_target?

Hmm, perhaps deploy-target would be more in line with the git-style command 
naming I've been using.

> >> Here are my steps:
> >> $ source meta-poky/oe-init-build-env build
> >> $ bitbake core-image-x11
> >> $ devtool add <myx11app>
> >> $ devtool build <myx11app>
> >> 
> >> at this point it does a bunch of these gcc-runtime tasks. So my first
> >> thought is: "why is my build going off into left field and doing all
> >> these other things when all I asked it to do is to build <myx11app>?".
> >> I'm guessing these gcc-runtime tasks are required for something related
> >> to devtool, and they only need to be run once. So maybe it would be best
> >> if they were run as part of creating the workspace (either explicitly
> >> with "devtool create-workspace" or implicitly with "devtool add")?
> > 
> > Trying to make "devtool add" or "devtool modify" do this just doesn't feel
> > right to me. These operations are supposed to be quick, and if they end up
> > running actual build tasks, they won't be.
> > 
> > My guess (with no other context) is that the reason you are seeing this is
> > that you're building from sstate, and when it builds core-image-x11 it
> > doesn't need some of the tasks that it then does need when it goes to
> > build the individual recipe. I'm not sure, but I would expect that most
> > people would be doing this from an existing build directory rather than
> > starting with a new one. Is there a reason you're creating a new build
> > directory as part of the steps above?
> 
> The reason I included the "oe-init-build-env build" step in my
> instructions above is to emphasize the fact I'm starting from a
> completely fresh build environment :-)

OK, but would you expect to be doing that on a regular basis or is it just for 
the purposes of exercise?

> LICENSE
> If the tool that creates the recipe can't find any explicit licensing
> information, it leaves LICENCE blank. Would it be better, if there's no
> explicit license, to set it to "CLOSED"? Otherwise the first build will
> fail and the user will have to figure out what to do in order to get the
> recipe to build.

Possibly yes. Ideally people would take an interest in setting this properly, 
but I do recognise that it's not a high priority when you are just getting 
started. What might be missing is some kind of modal operation where during 
initial development you aren't bothered by all of these recipe quality checks, 
but then when it comes to production the checks are re-enabled.

> code updates
> Maybe my inexperience with externalsrc is showing through here (I've
> never used it before), but as I play with this new feature, I'm testing
> it by trying to include a very old project I wrote years ago. As luck
> would have it, that project needs updates (it doesn't quite work as-is
> in qemux86/core-image-x11). So here I am going through the cycle of
> working on its source, and building new images. What I've noticed is
> when I create the image I keep getting the same old sources used over
> and over from when I first added this project "devtool add" (and it
> doesn't matter whether I use bitbake or devtool to build it, it even
> keeps using the old sources even when I perform commits in the sources
> and even when I perform a "bitbake -c cleansstate <recipe>"!). The only
> way I can move forward is to "devtool reset" and then "devtool add".
>
> In my scenario I have a base image I have already built
> (core-image-x11). Now I want to add one package to that image from
> sources found on my local machine. I also want to go through the cycle
> of editing those sources, building a new image, and runqemu'ing the new
> image to test my changes. I can't seem to do that without knowing
> devtool and/or bitbake magic. I either have to "devtool reset" or I have
> to "bitbake -c clean core-image-x11" because just modifying the sources
> doesn't cause the image to be regenerated.

It's not supposed to behave this way, although I have reproduced it here - I 
think I hadn't actually tested rebuilding an image with a recipe in the 
workspace added to the image. The problem is that the do_compile task is being 
marked as nostamp, but the way bitbake behaves now, that doesn't cause any 
dependent task signatures to be changed and thus no dependent tasks get run 
afterwards. Either I'll have to change that or work out a different way of 
ensuring do_compile and dependent tasks get run  - either way, you should only 
have to run a build that calls for the recipe (be it the recipe itself or 
something that depends upon it), no cleaning/resetting should be needed. I'll 
try to fix this tomorrow.

> I think at this point I should create a detailed doc explaining my
> workflow (or maybe a screencast?) so you can see exactly what I'm doing
> if the above doesn't make sense.

If you think it might help, but I think I understand most of the above. Let me 
fix the task signature issue and then hopefully things should work a bit more 
sensibly :)

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

