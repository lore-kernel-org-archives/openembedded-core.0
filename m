Return-Path: <california.l.sullivan@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 319F660119
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Aug 2016 23:26:49 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP; 30 Aug 2016 16:26:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,259,1470726000"; d="scan'208";a="1043662980"
Received: from clsulliv.jf.intel.com ([10.7.201.156])
	by orsmga002.jf.intel.com with ESMTP; 30 Aug 2016 16:26:49 -0700
To: Bruce Ashfield <bruce.ashfield@windriver.com>,
	richard.purdie@linuxfoundation.org
References: <cover.1472574514.git.bruce.ashfield@windriver.com>
From: Cal Sullivan <california.l.sullivan@intel.com>
Message-ID: <82c8d041-1587-d3c8-e348-fa15c0d92874@intel.com>
Date: Tue, 30 Aug 2016 16:26:49 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <cover.1472574514.git.bruce.ashfield@windriver.com>
Cc: openembedded-core@lists.openembedded.org, saul.wold@intel.com
Subject: Re: [PATCH 0/9] linux-yocto: v4.8 + fixes + configuration updates + RFC
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
X-List-Received-Date: Tue, 30 Aug 2016 23:26:50 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

I've built an intel-corei7-64 image with the new kernel. Looks good so 
far - booted on a MinnowBoard Turbot immediately with no new errors or 
warnings!

For anyone curious, preliminary recipes for meta-intel are available at 
meta-intel-contrib -b clsulliv/auto-srcrevs.

---
Cal

On 08/30/2016 09:48 AM, Bruce Ashfield wrote:
> Hi all,
>
> Here's the latest updates to the linux-yoco* baseline support. There are
> three distinct blocks in the consolidated pull request, with the biggest
> being the introduction of a 4.8 named kernel and 4.8 based libc-headers.
>
> The others are fixes to the kernel-yocto processing and kernel meta data
> updates. As such, these commits can be taken in isolation to the 4.8
> update that I've included in the pull request.
>
>    kernel-yocto: test for empty artifacts
>    linux-yocto/4.x: configuration updates
>    kernel-yocto: do_kernel_configme: Fix silent sysroot poisoning error
>
> On the topic of the version 4.8:
>
>    - This is the intended 'newest' kernel for the upcoming fall release
>      cycle. We will have a shiny new one this time around.
>      
>    - yes it is a -rc4 release, but the version wasn't chosen by mistake
>      (or lightly). It was the typical balancing act.
>      
>         - It is nice to work through the development cycle of the
>           upstream kernel, since we can send fixes in realtime to the
>           mainline tree .. but this is the side effect of the choice,
>           not the reason
>
>         - This version balances a new enough kernel, LTS/LTSI, -rt,
>           platform updates (ARM/x86) and the timing of the release.
>
>           The LTS/LTSI kernels are either too old at the moment, and
>           won't get a port of major patch series like -rt. Hence why
>           v4.8 shoots the difference between the options and gives us
>           a good baseline to update in the upcoming months, and one that
>           we can compliment with other kernel versions later.
>
>        - The delta between any -rcX releases is small, so following this
>          through until its release is not a big issue.
>
> build/boot testing:
>
>    - I've built and booted qemu* with core-image-sato, so it is known
>      to build and have a sane runtime for all arches. I've also built
>      the typical packages that misbehave (lttng, perf, etc).
>
>    - The versatile platform switched to a device tree boot in the 4.7
>      timeframe. As such, I had to patch runqemu to use a device tree
>      .. and use that device tree conditionally, since we have to support
>      older kernels at the same time as 4.7+
>
>    - I know that there are pending changes to the way runqemu works, but
>      I patched what I had in master .. these can be updated/adjusted if
>      need be.
>
> libc-headers update:
>
>    - Since there are milestone builds coming up, I wanted to get the 4.8
>      libc headers in place. Which meant that I had to do some different
>      things to use the testing kernel tarball, and to get the version of
>      the package right.
>
>      This might cause us version stepping issues .. so anyone looking at
>      this can suggest what I need to do to avoid them, and I can update
>      and rebase the series with the proper fix.
>
> The linux-yocto-4.8 repository:
>     
>    - There have been comments about the linux-yocto* repos filling up
>      download directories, and consuming people's bandwidth.  Since we
>      don't have a shallow clone or reference clone way to deal with the
>      amount of shared kernel blobs, I've simultaneously generated a v4.8
>      kernel in a repository that could be re-used over time.
>
>        http://git.yoctoproject.org/cgit/cgit.cgi/linux-yocto/
>
>      The proposal is that if we really want to avoid separate kernel trees,
>      and keep the ability to rebase/remove/amend old commits to keep the
>      tree clean, that I can insert the version number into the branches
>      as a marker. Comments on this approach are welcome, since if we go this
>      way, I need to adjust all the KBRANCH variables.
>
> I'll follow up with commits to change the default qemu version to 4.8 once
> there's general agreement about the options on this.
>
> Cheers,
>
> Bruce
>
> The following changes since commit 2fedd226c3385f1ac160b3aa0bfadbded85e288c:
>
>    ref-manual: Fixed small wording in PKGR in the glossary (2016-08-25 23:09:29 +0100)
>
> are available in the git repository at:
>
>    git://git.pokylinux.org/poky-contrib zedd/kernel
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel
>
> Bruce Ashfield (8):
>    linux-yocto: introduce v4.8 recipes
>    perf: adapt to Makefile.config
>    qemuarm: add device tree support
>    linux-yocto-dev: bump to v4.8+
>    libc-headers: update to v4.8
>    linux-yocto/4.8: add qemuarm device tree specification
>    kernel-yocto: test for empty artifacts
>    linux-yocto/4.x: configuration updates
>
> Ioan-Adrian Ratiu (1):
>    kernel-yocto: do_kernel_configme: Fix silent sysroot poisoning error
>
>   meta/classes/kernel-yocto.bbclass                  | 12 ++++--
>   meta/conf/distro/include/tcmode-default.inc        |  2 +-
>   .../linux-libc-headers/linux-libc-headers_4.8.bb   | 13 +++++++
>   meta/recipes-kernel/linux/linux-yocto-dev.bb       |  4 +-
>   meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb    |  2 +-
>   meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb    |  2 +-
>   meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb    | 38 +++++++++++++++++++
>   meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb  |  2 +-
>   meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb  |  2 +-
>   meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb  | 25 ++++++++++++
>   meta/recipes-kernel/linux/linux-yocto_4.1.bb       |  2 +-
>   meta/recipes-kernel/linux/linux-yocto_4.4.bb       |  2 +-
>   meta/recipes-kernel/linux/linux-yocto_4.8.bb       | 44 ++++++++++++++++++++++
>   meta/recipes-kernel/perf/perf.bb                   |  9 ++++-
>   scripts/runqemu-internal                           |  3 ++
>   15 files changed, 150 insertions(+), 12 deletions(-)
>   create mode 100644 meta/recipes-kernel/linux-libc-headers/linux-libc-headers_4.8.bb
>   create mode 100644 meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb
>   create mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb
>   create mode 100644 meta/recipes-kernel/linux/linux-yocto_4.8.bb
>


