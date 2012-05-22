Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.zanussi@intel.com>) id 1SWrZm-0005h8-5c
	for openembedded-core@lists.openembedded.org;
	Tue, 22 May 2012 18:04:46 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 22 May 2012 08:53:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="155718988"
Received: from unknown (HELO [10.255.12.14]) ([10.255.12.14])
	by fmsmga001.fm.intel.com with ESMTP; 22 May 2012 08:53:29 -0700
From: Tom Zanussi <tom.zanussi@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <CAK18fxHfOZ0y07uuRfu6CVPR6KGbbH_NhEd8-HM-17sro3hAkw@mail.gmail.com>
References: <CAK18fxECi+PxHhW8pAm2URRE1ZF=h2_gEPXMvvioTQnhKGWYHw@mail.gmail.com>
	<CADkTA4MXvMJt=JhDKdjDR9o3nkYVWmfnEmRnC1cheju6Tbh0Sw@mail.gmail.com>
	<4FB50005.7000807@gherzan.ro>
	<CAPhnLPDzZfuRBKxR3Ru+2nvozRy4evhmtFUf2d-NmqNwY4RjZw@mail.gmail.com>
	<CAK18fxH5H5En0H+k7VccgGUCPApwcL7Xs+RV=1=pvRu_wRYXVQ@mail.gmail.com>
	<CAPhnLPBSsP3acUN1uZvPDVCq6PzXF8mGGsFyvgdbfz6EuZ_RSA@mail.gmail.com>
	<CAK18fxHfOZ0y07uuRfu6CVPR6KGbbH_NhEd8-HM-17sro3hAkw@mail.gmail.com>
Date: Tue, 22 May 2012 10:53:47 -0500
Message-ID: <1337702027.32464.22.camel@elmorro>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
Subject: Re: Linux-yocto 3.0 crashes at do_patch...
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 22 May 2012 16:04:47 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

FWIW, I just did a fresh minimal beagleboard build without any
workaround and didn't see any problems building.

This was using the proxy setup that had previously failed for me with
the zero-length 3.0 kernel tarball.

Tom

On Tue, 2012-05-22 at 13:02 +0300, Andrei Gherzan wrote:
> Even after using your workaround i can still reproduce this issue.
> Yocto linux still fails.
> 
> | ERROR. Could not find an excutable target for yocto/standard/base
> | ERROR. Could not locate meta series for yocto/standard/beagleboard
> | ERROR. Could not modify yocto/standard/base
> NOTE: package linux-yocto-3.0.24+git1
> +34e0d2b4b4e9778b31f9ea99ca43f0dc71a7ee23_1
> +6b4bf6173b0bd2d1619a8218bac66ebc4681dd35-r4: task do_patch: Failed
> ERROR: Task 3
> (/media/HDD/yocto/poky/meta/recipes-kernel/linux/linux-yocto_3.0.bb,
> do_patch) failed with exit code '1'
> 
> 
> On Thu, May 17, 2012 at 11:48 PM, Flanagan, Elizabeth
> <elizabeth.flanagan@intel.com> wrote:
>         On Thu, May 17, 2012 at 7:59 AM, Andrei Gherzan
>         <andrei@gherzan.ro> wrote:
>         > Today i just gave another try.... same result.
>         
>         Responding here as well as the yocto list:
>         
>         A few people have been having this issue and after some
>         discussion we
>         think we have a root cause. Let me first explain what
>         happened.
>         
>         The autobuilder infrastructure shares a common DL_DIR in order
>         to
>         optimize the builds and provide the source mirror. This DL_DIR
>         is
>         rsynced to the publicaly available source mirror on a regular
>         basis.
>         During our infrastructure upgrade the autobuilder attempted to
>         pull
>         the tar archive for linux-yocto-3.0
>         (http://downloads.yoctoproject.org/mirror/sources/git2_git.yoctoproject.org.linux-yocto-3.0.tar.gz)
>         but due to network issues related to our recent infrastructure
>         upgrade
>         the file ended up as a 0 byte file. This file was rsynced the
>         the
>         source mirror. A few days ago this was mentioned as an issue.
>         Michael
>         Halstead corrected the network issue and I manually removed
>         the file.
>         The autobuilder repulled the archive correctly and repopulated
>         the
>         source mirror with it.
>         
>         Things should have been ok at this point. However, we were
>         still
>         getting reports of people sporadically running into a 0 byte
>         file. Not
>         all the time, but some of the time. Michael Halstead and I
>         just tailed
>         out the apache logs with Tom Zanussi wgetting the problematic
>         file,
>         watching for failures. No failures were seen in the error logs
>         however
>         Tom was still getting sporadic 0 byte files. Which means that
>         his
>         request wasn't even hitting the server. I was not able to
>         replicate
>         this. The only difference we could see is that I generally do
>         not go
>         through a proxy whereas Tom was.
>         
>         Our theory at this point is that all of the people who are
>         hitting
>         this issue are going through a proxy and that their proxy
>         setup has
>         cached that 0 byte file and refuses to regenerate it. There
>         isn't a
>         lot we can do from our end about that other than suggest the
>         following
>         work around. If you run into odd fetch issues with *just* the
>         linux-yocto-3.0 tar archive, clear out your DL_DIR of
>         git2_git.yoctoproject.org.linux-yocto-3.0.tar.gz and set the
>         following:
>         
>         PREMIRRORS ?= "\
>         bzr://.*/.*   http://autobuilder.yoctoproject.org/sources/ \n
>         \
>         cvs://.*/.*   http://autobuilder.yoctoproject.org/sources/ \n
>         \
>         git://.*/.*   http://autobuilder.yoctoproject.org/sources/ \n
>         \
>         hg://.*/.*    http://autobuilder.yoctoproject.org/sources/ \n
>         \
>         osc://.*/.*   http://autobuilder.yoctoproject.org/sources/ \n
>         \
>         p4://.*/.*    http://autobuilder.yoctoproject.org/sources/ \n
>         \
>         svk://.*/.*   http://autobuilder.yoctoproject.org/sources/ \n
>         \
>         svn://.*/.*   http://autobuilder.yoctoproject.org/sources/ \n"
>         
>         MIRRORS =+ "\
>         ftp://.*/.*      http://autobuilder.yoctoproject.org/sources/
>         \n \
>         http://.*/.*     http://autobuilder.yoctoproject.org/sources/
>         \n \
>         https://.*/.*    http://autobuilder.yoctoproject.org/sources/
>         \n"
>         
>         This will force the fetch to go to the autobuilder host of
>         sources and
>         should work around any proxy caching issues. Then call your
>         local IT
>         folks and ask them to clear out your proxy cache. If you run
>         into any
>         fetch issues not related to this file, please let me know.
>         
>         -b
>         
>         _______________________________________________
>         Openembedded-core mailing list
>         Openembedded-core@lists.openembedded.org
>         http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core




