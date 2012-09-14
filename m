Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TCeJG-0005yB-3J
	for openembedded-core@lists.openembedded.org;
	Sat, 15 Sep 2012 00:24:26 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 14 Sep 2012 15:11:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,424,1344236400"; d="scan'208";a="192934896"
Received: from unknown (HELO helios.localnet) ([10.252.121.225])
	by azsmga001.ch.intel.com with ESMTP; 14 Sep 2012 15:11:48 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: "Flanagan, Elizabeth" <elizabeth.flanagan@intel.com>
Date: Fri, 14 Sep 2012 23:11:47 +0100
Message-ID: <1448670.txDjULYI9R@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9 (Linux/3.2.0-30-generic-pae; KDE/4.9.0; i686; ; )
In-Reply-To: <CAPhnLPA6GodRgpEKwyCdbVPOdv+s3nW3zp2rDUhuj3xw=K3L+g@mail.gmail.com>
References: <1347564379-14252-1-git-send-email-sgw@linux.intel.com>
	<50535FC5.9040802@windriver.com>
	<CAPhnLPA6GodRgpEKwyCdbVPOdv+s3nW3zp2rDUhuj3xw=K3L+g@mail.gmail.com>
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
X-List-Received-Date: Fri, 14 Sep 2012 22:24:26 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday 14 September 2012 13:50:22 Flanagan, Elizabeth wrote:
> We really shouldn't be relying on package data at all for license
> manifests. As the manifests are relying on list_installed_packages,
> they end up inaccurate anyway as list_installed_packages does exactly
> that. List software installed via package. Not installed via the
> package manager? Then you aren't in the manifest. This ends up missing
> quite a few things necessary from a release engineering standpoint
> (like, hey, modutils? The kernel? Not listed in the manifest. IMHO
> this is wrong.)

What do you mean by modutils? If you mean the earlier suggestion that module-
init-tools was missing from the manifest, I'm fairly certain that was a 
misunderstanding because of it being replaced by kmod.

The thing is, we have no other means of accurately determining the contents of 
the image than the installed package list, given that the package manager is 
ultimately in charge of resolving and installing dependencies during image 
creation. The list may not cover additional files copied into tmp/deploy as 
part of building the image (kernel, bootloader, etc.) - however, that does not 
make it inaccurate as to the contents of the image, let's be clear about that. 

I agree we do need to write out the license information for these additional 
files; however, since they aren't actually *in* the image itself, I think we 
need to list these in a separate file. What happens for example if the system 
builds u-boot as a result of building my image, but I don't ever end up 
distributing that with the image?

As to the mechanism for picking these up, the only real possibility I can see 
is to hook into do_deploy; this is not currently straightforward though since 
that's not something that is implemented generically at the moment.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


