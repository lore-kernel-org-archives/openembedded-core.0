Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1T3qvg-0008WS-ST
	for openembedded-core@lists.openembedded.org;
	Tue, 21 Aug 2012 18:03:45 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 21 Aug 2012 08:51:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,802,1336374000"; d="scan'208";a="207608014"
Received: from unknown (HELO [10.255.13.49]) ([10.255.13.49])
	by fmsmga001.fm.intel.com with ESMTP; 21 Aug 2012 08:51:16 -0700
Message-ID: <5033AE74.6050108@linux.intel.com>
Date: Tue, 21 Aug 2012 08:51:16 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120717 Thunderbird/14.0
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <cover.1345518098.git.raj.khem@gmail.com>
In-Reply-To: <cover.1345518098.git.raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/9] Rework cross toolchain bootstrap
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
X-List-Received-Date: Tue, 21 Aug 2012 16:03:45 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/20/2012 08:07 PM, Khem Raj wrote:
> This patchset drops one gcc bootstrap phase. It has been possible because of
> some work upstream glibc to drop build time dependency on libgcc_s and libgcc_eh
>
> I have built all possible images in OE-Core for all qemu machines
> all of them built fine except *-rt and *-initramfs which failed due to unrelated
> issues. I have built from scratch as well as built from sstate. Seems to go
> ok.
>
>
> The following changes since commit 04568d1f18250d531aad5d286157d2d559083520:
>
>    qemu: Fix broken accidental path move (2012-08-20 17:25:21 +0100)
>
> are available in the git repository at:
>
>    git://git.openembedded.org/openembedded-core-contrib kraj/toolchain-rework
>    http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=kraj/toolchain-rework
>
> Khem Raj (9):
>    eglibc-2.16: Remove build dependency on libgcc_s and libgcc_eh
>    eglibc-2.16: Update to top of 2.16 branch
>    gcc-cross: Make gcc-cross-initial as the only intermediate gcc stage
>    eglibc: Fix eglibc-initial and let eglibc depend on it
>    uclibc.inc,uclibc-config.inc: Untabify python snippets
>    uclibc: Use gcc-cross-initial as staging compiler
>    gcc-crosssdk-initial_4.7.bb: Add --with-native-system-header-dir to
>      EXTRA_OECONF
>    gcc-cross-intermediate, gcc-crosssdk-intermediate: Remove
Merged the above set of 8 into OE-Core

Thanks
	Sau!

>    gcc: Switch SRC_URI to use svn
>
>   .../0001-Add-ARM-specific-static-stubs.c.patch     |   27 ++
>   ...f-libgcc_s-and-libgcc_eh-when-building-gl.patch |  343 ++++++++++++++++++++
>   meta/recipes-core/eglibc/eglibc-initial.inc        |   16 +-
>   meta/recipes-core/eglibc/eglibc-testing.inc        |    2 +-
>   meta/recipes-core/eglibc/eglibc.inc                |   11 +-
>   meta/recipes-core/eglibc/eglibc_2.16.bb            |    6 +-
>   meta/recipes-core/uclibc/uclibc-config.inc         |  128 ++++----
>   meta/recipes-core/uclibc/uclibc-initial_0.9.33.bb  |   10 +-
>   meta/recipes-core/uclibc/uclibc-initial_git.bb     |   10 +-
>   meta/recipes-core/uclibc/uclibc.inc                |   28 +-
>   meta/recipes-core/uclibc/uclibc_0.9.33.bb          |    7 +-
>   meta/recipes-core/uclibc/uclibc_git.bb             |    7 +-
>   meta/recipes-devtools/gcc/gcc-4.7.inc              |   11 +-
>   .../gcc/gcc-4.7/arm-nolibfloat.patch               |   40 ---
>   meta/recipes-devtools/gcc/gcc-cross-initial.inc    |   50 ++-
>   .../gcc/gcc-cross-intermediate.inc                 |   68 ----
>   .../gcc/gcc-cross-intermediate_4.7.bb              |    3 -
>   .../gcc/gcc-crosssdk-initial_4.7.bb                |    2 +
>   .../gcc/gcc-crosssdk-intermediate.inc              |    9 -
>   .../gcc/gcc-crosssdk-intermediate_4.7.bb           |    3 -
>   20 files changed, 534 insertions(+), 247 deletions(-)
>   create mode 100644 meta/recipes-core/eglibc/eglibc-2.16/0001-Add-ARM-specific-static-stubs.c.patch
>   create mode 100644 meta/recipes-core/eglibc/eglibc-2.16/0001-Avoid-use-of-libgcc_s-and-libgcc_eh-when-building-gl.patch
>   delete mode 100644 meta/recipes-devtools/gcc/gcc-4.7/arm-nolibfloat.patch
>   delete mode 100644 meta/recipes-devtools/gcc/gcc-cross-intermediate.inc
>   delete mode 100644 meta/recipes-devtools/gcc/gcc-cross-intermediate_4.7.bb
>   delete mode 100644 meta/recipes-devtools/gcc/gcc-crosssdk-intermediate.inc
>   delete mode 100644 meta/recipes-devtools/gcc/gcc-crosssdk-intermediate_4.7.bb
>


