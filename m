Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TCfDG-00078P-Dt
	for openembedded-core@lists.openembedded.org;
	Sat, 15 Sep 2012 01:22:18 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 14 Sep 2012 16:09:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,424,1344236400"; d="scan'208";a="192950274"
Received: from unknown (HELO helios.localnet) ([10.252.121.225])
	by azsmga001.ch.intel.com with ESMTP; 14 Sep 2012 16:09:14 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: "Flanagan, Elizabeth" <elizabeth.flanagan@intel.com>
Date: Sat, 15 Sep 2012 00:09:13 +0100
Message-ID: <11721501.GHIFJN1UT9@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9 (Linux/3.2.0-30-generic-pae; KDE/4.9.0; i686; ; )
In-Reply-To: <CAPhnLPCiGmrMy37wamXS-8X94d_XFKGYkmm8HHXJnCvKgPOc3g@mail.gmail.com>
References: <1347564379-14252-1-git-send-email-sgw@linux.intel.com>
	<1448670.txDjULYI9R@helios>
	<CAPhnLPCiGmrMy37wamXS-8X94d_XFKGYkmm8HHXJnCvKgPOc3g@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC PATCH] license: Ensure we find multilib packages also
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 14 Sep 2012 23:22:18 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday 14 September 2012 15:26:14 Flanagan, Elizabeth wrote:
> > The thing is, we have no other means of accurately determining the
> > contents of the image than the installed package list, given that the
> > package manager is ultimately in charge of resolving and installing
> > dependencies during image creation. The list may not cover additional
> > files copied into tmp/deploy as part of building the image (kernel,
> > bootloader, etc.) - however, that does not make it inaccurate as to the
> > contents of the image, let's be clear about that.
>
> No, but it's like the joke about the two software managers in a hot
> air balloon asking the engineer on the group where they are only to be
> told "In a hot air balloon". It's technically correct but the user
> case I keep running into here is that people want to know what they're
> deploying with a product.

Again, I absolutely agree we need to report the licenses for these files. I'm 
just advocating not commingling two separate things.

> The expectation people have (and right or
> wrong, it's what I keep running into) is that everything that's on the
> hddimg is what is on the manifest.

hddimg files are a special situation anyway though. To handle those properly we 
would have to use some special license reporting in the same place where the 
hddimg is composed, because we cannot really tell for certain anywhere else in 
the code as to what is in it.

> > I agree we do need to write out the license information for these
> > additional files; however, since they aren't actually *in* the image
> > itself, I think we need to list these in a separate file. What happens
> > for example if the system builds u-boot as a result of building my image,
> > but I don't ever end up distributing that with the image?
> 
> Then you have a manifest that has software that you end up complying
> with the GPL (when you don't really need to) verses having a manifest
> that doesn't list software which you do need to comply with the GPL.
> Both are wrong, but one is more wrong.
>
> RP is right here. We probably need to list a few different use cases
> here and support the most common ones.

I think we can satisfy all of these cases in the manner I described - a 
manifest for the image (what we already have) and an additional manifest 
beside it that lists all of the additionally deployed files along with their 
license information. If the files are right next to eachother with the same 
base name there can't be any confusion.

> > As to the mechanism for picking these up, the only real possibility I can
> > see is to hook into do_deploy; this is not currently straightforward
> > though since that's not something that is implemented generically at the
> > moment.
>
> I'm currently hooking into do_package because, as best I can figure it
> out, everything ends up getting packaged, even if it's not installed
> via package. I'm happy for other suggestions though.

pkgdata (which writes files into TMPDIR/pkgdata) already hooks into do_package 
and already lists LICENSE on a per-package basis for every package written 
out. Clearly we can't just take absolutely every package produced as the list 
for the manifest though, because not all of that gets installed into the 
image. Another more serious issue is that it's not guaranteed that everything 
that gets deployed is packaged, so this probably wouldn't satisfactorily solve 
the issue anyway.

As far as I can see, do_deploy is the only way, since we want to know what is 
deployed and which recipe deployed it. We'll just have to adjust things so 
that there is a central point we can tap into for do_deploy in order to 
collect the desired information - I haven't looked into how yet but I don't 
anticipate it being too hard.

I think we're also going to have to add a specific call that can be made from 
anywhere during do_rootfs that adds a recipe to be reported in the manifest. 
We can use this for custom cases such as hddimg and provide it for anyone 
doing anything similar to call manually (e.g. adding non-packaged files into 
their image in a post-processing function - not really recommended but I know 
people do do it).

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


