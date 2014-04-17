Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 8DE6E65D25
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Apr 2014 13:42:53 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 17 Apr 2014 06:37:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,879,1389772800"; d="scan'208";a="522654822"
Received: from mrdissan-mobl.gar.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.120.241])
	by orsmga002.jf.intel.com with ESMTP; 17 Apr 2014 06:42:19 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Gabriel Barbu <Gabriel.Barbu@enea.com>
Date: Thu, 17 Apr 2014 14:42:17 +0100
Message-ID: <2261894.lGiJmLJJOo@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.12.4 (Linux/3.13.9-200.fc20.x86_64; KDE/4.12.4; x86_64; ; )
In-Reply-To: <69319FFFA2D4F748B9BB5083FA28E56F25B9AD1A@sestoex09.enea.se>
References: <69319FFFA2D4F748B9BB5083FA28E56F25B9AD1A@sestoex09.enea.se>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: How to add a distro feature from an image recipe?
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
X-List-Received-Date: Thu, 17 Apr 2014 13:42:53 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Gabriel,

On Thursday 17 April 2014 11:27:16 Gabriel Barbu wrote:
> Is there a specific mechanism to add a distro feature from an image recipe?
> DISTRO_FEATURES_append does not seem to work from an image-*.bb or from a
> packagegroup-*.bb.

You can't do this I'm afraid. DISTRO_FEATURES influences how components are 
built, and aside from via dependencies and placing files in the sysroot, one 
recipe cannot influence how another is built. If you think about how the system 
produces package feeds and how these would be expected to be able to be 
installed from a running target system, if it were possible to set these kinds 
of options from the image you would have situations where you would build one 
image and then build another and packages would change, possibly in ways that 
would not be compatible with the first image - so that wouldn't be practical.
 
> Or, if not, what would be the best way to achieve this?
> The need is that I have a number of images and only want to add a certain
> distro feature (ptest) to just one or two of them (some test images).

You can have ptest enabled in the distro but ptest packages installed only in 
certain images. That is the only way this kind of thing can work. If enabling 
the ptest in DISTRO_FEATURES is causing changes in an image where ptest is not 
installed, that should be considered a bug.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

