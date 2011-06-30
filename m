Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QcQgj-0004fj-Md
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Jul 2011 01:30:26 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 30 Jun 2011 16:26:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,455,1304319600"; d="scan'208";a="22147074"
Received: from swold-mobl.jf.intel.com (HELO [10.24.82.35]) ([10.24.82.35])
	by orsmga001.jf.intel.com with ESMTP; 30 Jun 2011 16:26:36 -0700
Message-ID: <4E0D062C.5060302@linux.intel.com>
Date: Thu, 30 Jun 2011 16:26:36 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1309243115.git.liezhi.yang@windriver.com>
In-Reply-To: <cover.1309243115.git.liezhi.yang@windriver.com>
Subject: Re: [PATCH 0/4 V4] Share gcc work directories
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
X-List-Received-Date: Thu, 30 Jun 2011 23:30:26 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/28/2011 02:05 AM, Robert Yang wrote:
> Changes of V4:
>
> * Change the definition of GLIBC_DYNAMIC_LINKER as Richard suggested.
>
>    e.g., the entries in the files that look like:
>    #define GLIBC_DYNAMIC_LINKER64 "/lib64/ld-linux-x86-64.so.2"
>
>    become
>
>    #define GLIBC_DYNAMIC_LINKER64 SYSTEMLIBS_DIR"/ld-linux-x86-64.so.2"
>
>    and we define SYSTEMLIBS_DIR in defaults.h.
>
>    NOTE, the round brackets:
>    #define GLIBC_DYNAMIC_LINKER64 (SYSTEMLIBS_DIR "/ld-linux-x86-64.so.2")
>
>    doesn't work in in the following define:
>
>    #define LINUX_DYNAMIC_LINKER \
>            CHOOSE_DYNAMIC_LINKER (GLIBC_DYNAMIC_LINKER, UCLIBC_DYNAMIC_LINKER)
>
>    so use:
>    #define GLIBC_DYNAMIC_LINKER64 SYSTEMLIBS_DIR"/ld-linux-x86-64.so.2"
>
> * Compare to V3, reduce two patches which are for gcc-crosssdk.inc and
>    gcc-cross-canadian which are not needed any more.
>
> * Fix the conflicts(gcc-4.6.0 ->  gcc-4.6, and the ${BRANCH})
>
> * Both tested 4.5.1 and 4.6:
>    $ bitbake meta-toolchain core-image-sato
>    $ runqemu qemurm
>
>    Also unpack the sdk to /opt and test to make sure the toolchain works well.
>
>
> The following changes since commit a1f79a7896b6411669b3ccada6204d2695e80fc5:
>
>    runqueue.py: Add umask task control (2011-06-24 12:23:12 +0100)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib robert/share_gcc
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=robert/share_gcc
>
> Robert Yang (4):
>    bitbake: share source directory
>    Share gcc work directories
>    gcc-4.5.1: share work directories
>    gcc-4.6: share work directories
>
>   bitbake/lib/bb/build.py                            |    4 +-
>   bitbake/lib/bb/cache.py                            |    3 +
>   bitbake/lib/bb/runqueue.py                         |   10 +++
>   meta/recipes-devtools/gcc/gcc-4.5.1.inc            |    1 +
>   .../gcc-4.5.1/use-defaults.h-and-t-oe-in-B.patch   |   57 ++++++++++++++
>   meta/recipes-devtools/gcc/gcc-4.6.inc              |    5 +-
>   .../gcc/gcc-4.6/use-defaults.h-and-t-oe-in-B.patch |   80 ++++++++++++++++++++
>   meta/recipes-devtools/gcc/gcc-common.inc           |   32 +++++++-
>   meta/recipes-devtools/gcc/gcc-configure-common.inc |   48 +++++++-----
>   meta/recipes-devtools/gcc/gcc-configure-cross.inc  |    4 +-
>   meta/recipes-devtools/gcc/gcc-crosssdk.inc         |    6 --
>   11 files changed, 218 insertions(+), 32 deletions(-)
>   create mode 100644 meta/recipes-devtools/gcc/gcc-4.5.1/use-defaults.h-and-t-oe-in-B.patch
>   create mode 100644 meta/recipes-devtools/gcc/gcc-4.6/use-defaults.h-and-t-oe-in-B.patch
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>

Merged into OE-Core

Thanks
	Sau!


