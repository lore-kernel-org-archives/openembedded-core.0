Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id C94E973732
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Feb 2015 18:29:17 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 23 Feb 2015 10:29:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,632,1418112000"; d="scan'208";a="670335584"
Received: from afedko-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.4.45])
	by fmsmga001.fm.intel.com with ESMTP; 23 Feb 2015 10:29:17 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Date: Mon, 23 Feb 2015 18:29:17 +0000
Message-ID: <24998784.pJCDDl6SHX@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.4 (Linux/3.18.7-100.fc20.x86_64; KDE/4.14.4; x86_64; ; )
In-Reply-To: <CAP9ODKrUdLOyxr8NtGYMPMrmK0vY68VR3y483_nyCMJ8DhLOdw@mail.gmail.com>
References: <cover.1424709353.git.paul.eggleton@linux.intel.com>
	<1424714778.26813.1.camel@linuxfoundation.org>
	<CAP9ODKrUdLOyxr8NtGYMPMrmK0vY68VR3y483_nyCMJ8DhLOdw@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 9/9] populate_sdk_ext: add extensible SDK
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
X-List-Received-Date: Mon, 23 Feb 2015 18:29:25 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday 23 February 2015 15:11:38 Otavio Salvador wrote:
> On Mon, Feb 23, 2015 at 3:06 PM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > On Mon, 2015-02-23 at 15:00 -0300, Otavio Salvador wrote:
> >> On Mon, Feb 23, 2015 at 2:54 PM, Paul Eggleton
> >> 
> >> <paul.eggleton@linux.intel.com> wrote:
> >> > On Monday 23 February 2015 14:41:34 Otavio Salvador wrote:
> >> >> On Mon, Feb 23, 2015 at 2:00 PM, Paul Eggleton
> >> >> 
> >> >> <paul.eggleton@linux.intel.com> wrote:
> >> >> > From: Randy Witt <randy.e.witt@linux.intel.com>
> >> >> > 
> >> >> > This bbclass will create an SDK with a copy of bitbake and the
> >> >> > metadata
> >> >> > and sstate for the target specified for the task. The idea is to let
> >> >> > "system" developers both work on applications and then test adding
> >> >> > them
> >> >> > to an image without having to switch between workspaces or having to
> >> >> > download separate items.
> >> >> > 
> >> >> > Rather than running bitbake directly however, the primary way of
> >> >> > running
> >> >> > builds within the extensible SDK is to use the "devtool" command.
> >> >> > The
> >> >> > rest of the build system is fixed via locked shared state
> >> >> > signatures,
> >> >> > and thus only the recipes you have added get built.
> >> >> > 
> >> >> > Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> >> >> > Signed-off-by: Randy Witt <randy.e.witt@linux.intel.com>
> >> >> > Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> >> >> 
> >> >> Why another class? it could be tuned using SDKIMAGE_FEATURES
> >> > 
> >> > If you look at what the class does it would be a bit messy to do it
> >> > that way - I wanted to get something working with minimal impact. I
> >> > don't doubt that it could be implemented as an SDKIMAGE_FEATURES item
> >> > though
> >> > with extra work.
> >> 
> >> As far this does not gets merged I am fine with that. This is clearly
> >> a WIP code and shouldn't be merged as is.
> > 
> > This code adds in an alternative SDK format and it drives that using a
> > different task target. Right now its hard for people to see where things
> > are going, this puts it in easy reach whilst allowing the current SDK to
> > continue to work too.
> > 
> > I think a choice of two different task targets here makes sense to drive
> > this configuration rather than SDKIMAGE_FEATURES and I agree with Paul
> > that adding it the other way would be complex, error prone and
> > confusing.
> 
> Well so why we don't add populate_sdk+dev-pkgs+dbg-pkgs.
>
> Sorry ... it is clear that people wish this feature (and I also do)
> and appreciate the hard work Paul has put on this (yes this is indeed
> a good amount of work) but the extra task does not seem to fit how the
> system is designed.
> 
> The SDKIMAGE_FEATURES[1] is described as:
> 
> Equivalent to IMAGE_FEATURES. However, this variable applies to the
> SDK generated from an image using the following command:
> 
>      $ bitbake -c populate_sdk imagename
> 
> and it makes a lot of sense to have a 'extended' or 'devtool' or
> another name for this feature.
> 
> 1.
> http://www.yoctoproject.org/docs/current/ref-manual/ref-manual.html#var-SDK
> IMAGE_FEATURES

I see where you are coming from, but again if we look at what the class does, 
it's not just adding some packages. It fundamentally changes how the SDK works 
- you don't actually have a nativesdk toolchain (in fact you don't have any 
nativesdk packages at all) and you don't have anything in the target sysroot 
either - because the build system sysroots pretty much contain everything 
already. It's not simply an add-on or a post-processing of the SDK.

With the way it's been implemented, you get a separate way of building it and 
a separate SDK installer, and therefore it's a little clearer as to what you 
are building/installing. At the moment, with this being very new 
functionality, that seems to me to be the right way to do things for now. If 
this turns out to work really well for everyone then great, we can look at 
integrating it more tightly.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

