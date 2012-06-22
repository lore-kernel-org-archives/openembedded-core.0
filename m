Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <saul.wold@intel.com>) id 1Si8K2-0000W7-0J
	for openembedded-core@lists.openembedded.org;
	Fri, 22 Jun 2012 20:11:06 +0200
Received: from mail-pz0-f52.google.com ([209.85.210.52])
	by mga11.intel.com with ESMTP/TLS/RC4-MD5; 22 Jun 2012 11:00:17 -0700
Received: by dano14 with SMTP id o14so2687530dan.25
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jun 2012 11:00:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=message-id:date:from:organization:user-agent:mime-version:to:cc
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding:x-gm-message-state;
	bh=ghFyWvxz+tzRIoXO+jfuHfDn5VQVeXb9fA+svVd/fSk=;
	b=bogr7+eKaALPovEMCIRo6R99hmD/UxghLzZQiH8iZ7aH3m7Ap4d30KVwE1myZ1Mb16
	Vu5M0JKpAEPME9jejv4ew3JvymildOh6nPZ1yLWovotiR/QD6VQ1CYYqacUMLdVyBNni
	zHW2UwwyqbYlGlFJ8AhfS7SysyA1XO88AqAxV/izdJpYm0/R40lnylMud176bchvvqne
	Wt6vM5MJRK5JFM0m27tXLL2M4py14GzNZ88a8/vGIzqVnenWOl2e1Ix+EnDl4+s2Q62/
	WP2n1TcI8f/G/bj6IwSIFoNdMJ1DTLANfu7xV5J77GsBVMH5W2VYE0wAMumjgDYzVovK
	4Xog==
Received: by 10.68.219.166 with SMTP id pp6mr12738966pbc.35.1340388016901;
	Fri, 22 Jun 2012 11:00:16 -0700 (PDT)
Received: from [10.6.18.71] (c-71-193-189-117.hsd1.wa.comcast.net.
	[71.193.189.117])
	by mx.google.com with ESMTPS id rv5sm39566165pbc.56.2012.06.22.11.00.14
	(version=SSLv3 cipher=OTHER); Fri, 22 Jun 2012 11:00:15 -0700 (PDT)
Message-ID: <4FE4B2AB.2030603@intel.com>
Date: Fri, 22 Jun 2012 11:00:11 -0700
From: Saul Wold <saul.wold@intel.com>
Organization: Intel
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1340201997.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1340201997.git.bruce.ashfield@windriver.com>
X-Gm-Message-State: ALoCoQmWg0wHueQIAL7+21Zwx3Pr2A1/5U2FFjamA5Jgg/0rU3JQu/r50R1bjmjcvPmI+tAlOuJu
Cc: liang.li@windriver.com
Subject: Re: [v2 PATCH 0/3] perf: make perf a standlone recipe
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
X-List-Received-Date: Fri, 22 Jun 2012 18:11:06 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/20/2012 07:31 AM, Bruce Ashfield wrote:
> Richard/Saul,
>
> Here is the re-work of the standalone perf build patch
> series. We isolated the errors that Saul was seeing on the
> autobuilder, and it stemmed from the misuse of the sources
> symlink back into the working kernel directory. As Richard
> pointed out, this would also break in a rm_work enabled
> build.
>
> I've also removed parts of the standalone recipe that were
> inherited from its former life as a sub-part of the kernel
> recipes (the non-standard depends usage, etc) as part of this
> v2.
>
> To build completely out of the sysroot patch 1/3 tells the
> story. We just need to save $kerndir/tools and $kerndir/lib
> from being removed during the pruning. As far as I'm concerned
> this is small and reasonable, since there are a few tools in
> the kernel source tree that are of interest and may want to
> be built and packaged separately.
>
> The find now has a couple more prunes in it, which of course
> makes it a bit harder to read. If we really want, a new magic
> variable could be created where recipes/kernel could specify
> what should be saved in the sysroot .. but I didn't want to
> go there yet.
>
> I've built and runtime tested things here, and everything
> looks sane.
>
> original v1 text is below
>
> -->-->-->-->-->-->-->-->-->-->-->-->
>    We've wanted to do this for some time, and now have finally split
>    out perf from being a sub-part of the kernel packages into a
>    standalone package that is built out of the kernel sources.
>
>    I've built and tested this by adding task-core-tools-profile to
>    my IMAGE_INSTALL, and perf behaves just as it did before.  I've
>    also tested this on my oe-core checkout/repo, and it works fine
>    there as well (but I'm using my easier to access contrib
>    branch for now).
>
>    There's additional work that can be done more easily once this
>    is split, so please consider this for inclusion, but I'd like
>    to keep this initial version as an exact functional match as
>    what was previously in place.
>
>    I've removed the old linux-tools.inc and updated any kernel
>    recipes that I know about that have references to it. If there
>    are other dependent recipes, they'll need to be updated.
>
>    From the patch itself:
>
>      perf has been coupled to the kernel packages via kernel.bbclass.
>      While maintaining the build of perf out of the kernel source tree
>      is desired the package coupling has proved to be awkward in
>      several situations such as:
>
>         - when a kernel recipe doesn't want to build/provide perf
>         - when licensing of dependencies would prohibit perf and hence
>           the kernel from being built.
>
>      To solve some of these problems, this recipe is the extraction of
>      the linux-tools.inc provided perf compilation into a standalone
>      perf recipe that builds out of the kernel source, but is otherwise
>      independent.
>
>      No new functionality is provided above what the linux-tools.inc
>      variant provided, but the separate recipe provides baseline for
>      adding new functionality.
> -->-->-->-->-->-->-->-->-->-->-->-->
>
> This addresses [YOCTO #1552]
>
> cc: Tom Zanussi<tom.zanussi@intel.com>
> cc: Liang Li<liang.li@windriver.com>
>
> Cheers,
>
> Bruce
>
> The following changes since commit e0a70547069fe7e8a2d6bdaffc985fb172d46c31:
>    Jason Wessel (1):
>          perl: Allow perl to cross build and native build in a directory named "t"
>
> are available in the git repository at:
>
>    git://git.pokylinux.org/poky-contrib zedd/perf
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/perf
>
> Bruce Ashfield (2):
>    kernel: save $kerndir/tools and $kerndir/lib from pruning
>    recipes-kernel: remove linux-tools.inc
>
> Liang Li (1):
>    recipes-kernel: make perf a standalone package
>
>   meta/classes/kernel.bbclass                     |    9 +---
>   meta/recipes-kernel/linux/linux-tools.inc       |   41 ------------------
>   meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb |    2 -
>   meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb |    2 -
>   meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb |    2 -
>   meta/recipes-kernel/linux/linux-yocto_3.0.bb    |    2 -
>   meta/recipes-kernel/linux/linux-yocto_3.2.bb    |    2 -
>   meta/recipes-kernel/linux/linux-yocto_3.4.bb    |    2 -
>   meta/recipes-kernel/perf/perf_3.4.bb            |   50 +++++++++++++++++++++++
>   9 files changed, 52 insertions(+), 60 deletions(-)
>   delete mode 100644 meta/recipes-kernel/linux/linux-tools.inc
>   create mode 100644 meta/recipes-kernel/perf/perf_3.4.bb
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>
Merged into OE-Core

Thanks
	Sau!



