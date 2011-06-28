Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QbZiu-0000GE-H1 for openembedded-core@lists.openembedded.org;
	Tue, 28 Jun 2011 16:57:17 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p5SErPq8025500
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jun 2011 15:53:25 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 25383-02 for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jun 2011 15:53:21 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p5SErHk4025494
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jun 2011 15:53:19 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <cover.1309243115.git.liezhi.yang@windriver.com>
References: <cover.1309243115.git.liezhi.yang@windriver.com>
Date: Tue, 28 Jun 2011 15:53:03 +0100
Message-ID: <1309272783.20015.313.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
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
X-List-Received-Date: Tue, 28 Jun 2011 14:57:17 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi Robert,

I just wanted to let you know that these look good, thanks.

I need to get the changes into bitbake for this first (along with the
umask and multilib changes), let that version sit for a vew days, them
bump the version requirement of OE-Core so we can then merge these
patches.

They will therefore merge and I'm happy with them but it will be a few
more days before that happens. The bitbake piece is now merged already.

Cheers,

Richard

On Tue, 2011-06-28 at 17:05 +0800, Robert Yang wrote:
> Changes of V4:
> 
> * Change the definition of GLIBC_DYNAMIC_LINKER as Richard suggested.
> 
>   e.g., the entries in the files that look like:
>   #define GLIBC_DYNAMIC_LINKER64 "/lib64/ld-linux-x86-64.so.2"
> 
>   become
> 
>   #define GLIBC_DYNAMIC_LINKER64 SYSTEMLIBS_DIR"/ld-linux-x86-64.so.2"
> 
>   and we define SYSTEMLIBS_DIR in defaults.h.
> 
>   NOTE, the round brackets:
>   #define GLIBC_DYNAMIC_LINKER64 (SYSTEMLIBS_DIR "/ld-linux-x86-64.so.2")
> 
>   doesn't work in in the following define:
> 
>   #define LINUX_DYNAMIC_LINKER \
>           CHOOSE_DYNAMIC_LINKER (GLIBC_DYNAMIC_LINKER, UCLIBC_DYNAMIC_LINKER)
> 
>   so use:
>   #define GLIBC_DYNAMIC_LINKER64 SYSTEMLIBS_DIR"/ld-linux-x86-64.so.2"
> 
> * Compare to V3, reduce two patches which are for gcc-crosssdk.inc and
>   gcc-cross-canadian which are not needed any more.
> 
> * Fix the conflicts(gcc-4.6.0 -> gcc-4.6, and the ${BRANCH})
> 
> * Both tested 4.5.1 and 4.6:
>   $ bitbake meta-toolchain core-image-sato
>   $ runqemu qemurm
> 
>   Also unpack the sdk to /opt and test to make sure the toolchain works well.
> 
> 
> The following changes since commit a1f79a7896b6411669b3ccada6204d2695e80fc5:
> 
>   runqueue.py: Add umask task control (2011-06-24 12:23:12 +0100)
> 
> are available in the git repository at:
>   git://git.pokylinux.org/poky-contrib robert/share_gcc
>   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=robert/share_gcc
> 
> Robert Yang (4):
>   bitbake: share source directory
>   Share gcc work directories
>   gcc-4.5.1: share work directories
>   gcc-4.6: share work directories
> 
>  bitbake/lib/bb/build.py                            |    4 +-
>  bitbake/lib/bb/cache.py                            |    3 +
>  bitbake/lib/bb/runqueue.py                         |   10 +++
>  meta/recipes-devtools/gcc/gcc-4.5.1.inc            |    1 +
>  .../gcc-4.5.1/use-defaults.h-and-t-oe-in-B.patch   |   57 ++++++++++++++
>  meta/recipes-devtools/gcc/gcc-4.6.inc              |    5 +-
>  .../gcc/gcc-4.6/use-defaults.h-and-t-oe-in-B.patch |   80 ++++++++++++++++++++
>  meta/recipes-devtools/gcc/gcc-common.inc           |   32 +++++++-
>  meta/recipes-devtools/gcc/gcc-configure-common.inc |   48 +++++++-----
>  meta/recipes-devtools/gcc/gcc-configure-cross.inc  |    4 +-
>  meta/recipes-devtools/gcc/gcc-crosssdk.inc         |    6 --
>  11 files changed, 218 insertions(+), 32 deletions(-)
>  create mode 100644 meta/recipes-devtools/gcc/gcc-4.5.1/use-defaults.h-and-t-oe-in-B.patch
>  create mode 100644 meta/recipes-devtools/gcc/gcc-4.6/use-defaults.h-and-t-oe-in-B.patch
> 
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core




