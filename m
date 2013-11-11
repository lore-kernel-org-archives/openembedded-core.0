Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id D4D546D7C8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Nov 2013 15:18:27 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 11 Nov 2013 07:18:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,678,1378882800"; d="scan'208";a="431374806"
Received: from unknown (HELO helios.localnet) ([10.252.121.166])
	by fmsmga002.fm.intel.com with ESMTP; 11 Nov 2013 07:18:28 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Date: Mon, 11 Nov 2013 15:18:27 +0000
Message-ID: <1938763.4DceAK3YzM@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-31-generic; KDE/4.10.5; i686; ; )
In-Reply-To: <alpine.DEB.2.02.1311110437360.9099@oneiric>
References: <alpine.DEB.2.02.1311110437360.9099@oneiric>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: wanting to confirm understanding of FILESPATH in .bb and .inc files
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
X-List-Received-Date: Mon, 11 Nov 2013 15:18:29 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Robert,

On Monday 11 November 2013 05:34:20 Robert P. J. Day wrote:
>   currently poking around for examples of recipes' use of FILESPATH to
> use in class, and i just want to make absolutely sure i understand its
> usage since some recipes seem to use it in weird and/or unnecessary
> ways. (using the current poky tarball 10.0.0 for this.)
> 
>   first, i can see the default setting of FILESPATH in base.bbclass:
> 
> FILESPATH = "${@base_set_filespath(["${FILE_DIRNAME}/${BP}",
>   "${FILE_DIRNAME}/${BPN}", "${FILE_DIRNAME}/files"], d)}"
> 
> which, for any recipe, creates a FILESPATH that starts with top-level
> subdirectories of ${BP}, ${BPN} and "files" and, on top of that,
> extends each one with further subdirectories as defined by the
> variable FILESOVERRIDES. so, as a working example, i can use "bb show"
> to display the value of FILESPATH for, say, the zlib recipe, which
> shows me a path with 15 entries (exactly as i expected building for my
> beagleboard xm):
> 
> FILESPATH="/home/rpjday/oe/dora/poky-dora-10.0.0/meta/recipes-core/zlib/zlib
> -1.2.8/arm
> /home/rpjday/oe/dora/poky-dora-10.0.0/meta/recipes-core/zlib/zlib-1.2.8/arm
> v7a
> /home/rpjday/oe/dora/poky-dora-10.0.0/meta/recipes-core/zlib/zlib-1.2.8/bea
> gleboard
> /home/rpjday/oe/dora/poky-dora-10.0.0/meta/recipes-core/zlib/zlib-1.2.8/pok
> y /home/rpjday/oe/dora/poky-dora-10.0.0/meta/recipes-core/zlib/zlib-1.2.8/
> /home/rpjday/oe/dora/poky-dora-10.0.0/meta/recipes-core/zlib/zlib/arm
> /home/rpjday/oe/dora/poky-dora-10.0.0/meta/recipes-core/zlib/zlib/armv7a
> /home/rpjday/oe/dora/poky-dora-10.0.0/meta/recipes-core/zlib/zlib/beagleboa
> rd /home/rpjday/oe/dora/poky-dora-10.0.0/meta/recipes-core/zlib/zlib/poky
> /home/rpjday/oe/dora/poky-dora-10.0.0/meta/recipes-core/zlib/zlib/
> /home/rpjday/oe/dora/poky-dora-10.0.0/meta/recipes-core/zlib/files/arm
> /home/rpjday/oe/dora/poky-dora-10.0.0/meta/recipes-core/zlib/files/armv7a
> /home/rpjday/oe/dora/poky-dora-10.0.0/meta/recipes-core/zlib/files/beaglebo
> ard /home/rpjday/oe/dora/poky-dora-10.0.0/meta/recipes-core/zlib/files/poky
> /home/rpjday/oe/dora/poky-dora-10.0.0/meta/recipes-core/zlib/files/"
> 
> so far, so good, and here's where i want the clarification.
> 
>   as long as a recipe has "file://" references that occur exclusively
> in any of the directories listed above, there should be no reason to
> *need* to override FILESPATH, correct? however, some recipe or include
> files clearly do just that, and i want to make sure that what i'm
> seeing in files like that is *optional*, and not required due to some
> subtlety i'm unaware of.
> 
>   consider first example:
> 
> systemtap_git.inc:FILESPATH = "${FILE_DIRNAME}/systemtap"
> 
> it would seem that this setting is superfluous since that entry is
> already in the default value of FILESPATH for that recipe, so i'm
> guessing that the benefit of the above is to simply reduce the size of
> FILESPATH for efficiency? i mean, technically, the above didn't need
> to be set, did it?

I think the reason that is there is because systemtap_git.inc is used in 
another recipe which would not have that path included automatically, i.e. 
systemtap-uprobes_git.bb. It could be argued that systemtap-uprobes_git.bb 
should be extending the path instead, that would also work.

>   another example is with "-native" recipes. consider:
> 
> qemu-helper-native_1.0.bb:FILESPATH = "${FILE_DIRNAME}/qemu-helper"
> 
> again, that seems redundant since:
> 
> $ bb show -r qemu-helper-native BP BPN
> Parsing recipes..done.
> # BP=${BPN}-${PV}
> BP="qemu-helper-1.0"
> # BPN=${@base_prune_suffix(d.getVar('PN', True),
> d.getVar('SPECIAL_PKGSUFFIX', True).split(), d)} BPN="qemu-helper"
> $
> 
> so that entry is already part of FILESPATH.

Right, that would appear to be redundant.

FWIW, I did open a bug about the general case here:

https://bugzilla.yoctoproject.org/show_bug.cgi?id=4497

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

