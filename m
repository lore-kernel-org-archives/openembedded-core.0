Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RixqE-0000UY-4m
	for openembedded-core@lists.openembedded.org;
	Fri, 06 Jan 2012 01:39:30 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 05 Jan 2012 16:31:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="104020146"
Received: from unknown (HELO [10.255.13.127]) ([10.255.13.127])
	by fmsmga001.fm.intel.com with ESMTP; 05 Jan 2012 16:31:51 -0800
Message-ID: <4F0640F7.50903@linux.intel.com>
Date: Thu, 05 Jan 2012 16:31:51 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1325649220.git.scott.a.garman@intel.com>
In-Reply-To: <cover.1325649220.git.scott.a.garman@intel.com>
Cc: Scott Garman <scott.a.garman@intel.com>
Subject: Re: [PATCH 0/7] New QA tests for unsafe references to exec_prefix [v2]
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
X-List-Received-Date: Fri, 06 Jan 2012 00:39:30 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/03/2012 07:56 PM, Scott Garman wrote:
> Hello,
>
> This is a P2 feature for Yocto 1.2. It adds two new QA tests to check
> files in base_bindir, base_sbindir, and base_libdir for references to
> files under exec_prefix (e.g, dynamic linking for binaries and
> references to exec_prefix in scripts).
>
> The reason for these tests is that exec_prefix (typically /usr) can
> be kept on a separate partition that may be mounted late in the boot
> process, or may not be mounted at all during system recovery
> operations.
>
> It was my original goal to make the dynamic linking test a QA error
> upon failure, but it turned out the amount of recipe work needed was
> much larger than I expected. So for the time being they have been
> changed to generate QA warmings.
>
> The libraries I've moved to base_libdir in this pull request should
> take care of all binaries in /bin and /sbin for packages we include
> in core-image-minimal and -sato.
>
> I would like to ask recipe maintainers to look for these QA warnings
> and fix them ASAP, as I believe we'll be changing this to a QA error
> before the release of 1.2.
>
> This is a second pull request that is rebased against the latest
> master with merge conflicts resolved, and only sets BUILD_LDFLAGS
> in ncurses.inc for virtclass-native.
>
> Scott
>
> The following changes since commit de679a3036ebef1c7d7b8ee23f05590c95e498d9:
>
>    pseudo: ensure libs are included in package (2012-01-03 12:10:59 +0000)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib sgarman/per-recipe-sanitychk-final
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=sgarman/per-recipe-sanitychk-final
>
> Scott Garman (7):
>    ncurses: move libraries to base_libdir
>    libcap: move library to base_libdir
>    util-linux: move libraries to base_libdir
>    e2fsprogs: move libraries to base_libdir
>    libusb1: move libraries to base_libdir
>    libusb-compat: move libraries to base_libdir
>    insane.bbclass: add QA tests for unsafe references to exec_prefix
>
>   meta/classes/insane.bbclass                        |  111 +++++++++++++++++++-
>   meta/recipes-core/ncurses/ncurses.inc              |   27 +++--
>   meta/recipes-core/util-linux/util-linux.inc        |   20 ++--
>   meta/recipes-core/util-linux/util-linux_2.20.1.bb  |    2 +-
>   .../e2fsprogs/e2fsprogs_1.41.14.bb                 |   29 +++--
>   meta/recipes-support/libcap/libcap.inc             |   15 +++-
>   meta/recipes-support/libcap/libcap_2.22.bb         |    2 +-
>   meta/recipes-support/libusb/libusb-compat_0.1.3.bb |   12 ++-
>   meta/recipes-support/libusb/libusb1_1.0.8.bb       |   16 +++-
>   9 files changed, 196 insertions(+), 38 deletions(-)
>

Merged into OE-Core

Thanks
	Sau!


