Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <saul.wold@intel.com>) id 1QkHi4-0006M7-0K
	for openembedded-core@lists.openembedded.org;
	Fri, 22 Jul 2011 17:32:16 +0200
Received: from mail-gx0-f180.google.com ([209.85.161.180])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 22 Jul 2011 08:27:01 -0700
Received: by gxk10 with SMTP id 10so1709138gxk.25
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jul 2011 08:27:00 -0700 (PDT)
Received: by 10.143.15.2 with SMTP id s2mr110304wfi.57.1311348418413;
	Fri, 22 Jul 2011 08:26:58 -0700 (PDT)
Received: from [10.6.18.247] (c-71-193-189-117.hsd1.wa.comcast.net
	[71.193.189.117])
	by mx.google.com with ESMTPS id t7sm1504557wfl.2.2011.07.22.08.26.54
	(version=SSLv3 cipher=OTHER); Fri, 22 Jul 2011 08:26:56 -0700 (PDT)
Message-ID: <4E2996BD.3020208@intel.com>
Date: Fri, 22 Jul 2011 08:26:53 -0700
From: Saul Wold <saul.wold@intel.com>
Organization: Intel
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1311267679.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1311267679.git.bruce.ashfield@windriver.com>
Subject: Re: [PATCH 0/4] kernel: consolidated pull request
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
X-List-Received-Date: Fri, 22 Jul 2011 15:32:16 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/21/2011 10:16 AM, Bruce Ashfield wrote:
> Richard/Saul,
>
> What follows is a set of kernel changes that have been brewing for a while
> now:
>
>    294170 kern-tools: update SRCREV
>    65d8b50 linux-yocto: update LICENSE to GPLv2
>    069e9d9 kernel: copy defconfig to {B} vs {S}
>    6796e11 linux-yocto: kernel-3.0 support recipe
>
> The patches are pretty self explanitory, but a few comments follow.
>
> The kern-tools tweak Fixes [YOCTO #1261], which allows both the 2.6.34
> and 3.0 based -rt kernels to build again.
>
> The next two changes are small cleanups and a allow linux-yocto to inherit
> changes to the base kernel class' do_configure().
>
> And finally, we create the 3.0 base recipe. A few notes about this are:
>
>    - it is a carry forward of the immediately available 2.6.37 (and before)
>      functionality
>    - it has an audit and cleanup of the config fragments, which was one
>      of the 1.1 deliverables
>    - it has been built for all core arches, and (attempted) boot tested on
>      them as well.
>    - it is not the default for any target at the moment, this needs more
>      testing, and there are two known issues I'm tracking a qemumips boot
>      failure that snuck in during the 3.0 -rc cycle (it did boot) and
>      qemuppc interrupts being lost. I'll update the preferred versions as
>      targets are validated.
>    - I've built and booted the core-images on them, but functionality like
>      graphics, etc, still needs to be tested. There's only so much I
>      can do :)
>    - the -rt branch is populated with tglx's recent update of -rt!
>    - separate patches will go out for other layers (meta-kernel-dev, meta-rt,
>      meta-yocto, etc) shortly.
>
> ** This obviously builds on the other hard work done to get userspace and
> tools ready for the 3.0 kernel version change. Many thanks for that, since
> it allowed me to focus on the kernel only.
>
> Patches are welcome for any misbehaving boards or qemu targets :
>
> cc: Darren Hart<dvhart@linux.intel.com>
> cc: Tom Zanussi<tom.zanussi@intel.com>
>
> The following changes since commit 1df5ab5ee285b3220348ce0cf371b81446d55832:
>
>    parse/ConfHandler: Fix multiline variable corruption (2011-07-21 11:09:47 +0100)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib zedd/kernel
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel
>
> Bruce Ashfield (4):
>    linux-yocto: kernel-3.0 support recipe
>    kernel: copy defconfig to {B} vs {S}
>    linux-yocto: update LICENSE to GPLv2
>    kern-tools: update SRCREV
>
>   meta/classes/kernel-yocto.bbclass                  |    6 ---
>   meta/classes/kernel.bbclass                        |    4 +-
>   .../kern-tools/kern-tools-native_git.bb            |    2 +-
>   meta/recipes-kernel/linux/linux-yocto.inc          |    2 +-
>   meta/recipes-kernel/linux/linux-yocto_3.0.bb       |   47 ++++++++++++++++++++
>   5 files changed, 51 insertions(+), 10 deletions(-)
>   create mode 100644 meta/recipes-kernel/linux/linux-yocto_3.0.bb
>
Merged into OE-Core

Thanks
	Sau!


