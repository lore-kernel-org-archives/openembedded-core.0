Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SFBgY-00049l-L1
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Apr 2012 23:54:42 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 03 Apr 2012 14:45:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="125016846"
Received: from unknown (HELO [10.255.12.141]) ([10.255.12.141])
	by orsmga001.jf.intel.com with ESMTP; 03 Apr 2012 14:45:31 -0700
Message-ID: <4F7B6F7B.9060009@linux.intel.com>
Date: Tue, 03 Apr 2012 14:45:31 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.1) Gecko/20120216 Thunderbird/10.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1332517070-31174-1-git-send-email-raj.khem@gmail.com>
In-Reply-To: <1332517070-31174-1-git-send-email-raj.khem@gmail.com>
Subject: Re: [PATCH] libzypp: Fix buiild with gcc 4.7
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
X-List-Received-Date: Tue, 03 Apr 2012 21:54:42 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 03/23/2012 08:37 AM, Khem Raj wrote:
> it needs protype of close() before using it
>
> Signed-off-by: Khem Raj<raj.khem@gmail.com>
> ---
>   meta/recipes-extended/libzypp/libzypp/close.patch |   32 +++++++++++++++++++++
>   meta/recipes-extended/libzypp/libzypp_git.bb      |    3 +-
>   2 files changed, 34 insertions(+), 1 deletions(-)
>   create mode 100644 meta/recipes-extended/libzypp/libzypp/close.patch
>
> diff --git a/meta/recipes-extended/libzypp/libzypp/close.patch b/meta/recipes-extended/libzypp/libzypp/close.patch
> new file mode 100644
> index 0000000..0ff1825
> --- /dev/null
> +++ b/meta/recipes-extended/libzypp/libzypp/close.patch
> @@ -0,0 +1,32 @@
> +close() is used without a protype therefore we include unistd.h
> +Fixes compile errors like below
> +
> +/home/kraj/work/openembedded-core/build/tmp-eglibc/work/qemuppc-oe-linux/libzypp-0.0-git1+15b6c52260bbc52b3d8e585e271b67e10cc7c433-r18/git/zypp/ExternalProgram.h:239:47: error: '::close' has not been declared
> +
> +Signed-off-by: Khem Raj<raj.khem@gmail.com>
> +
> +Upstream-Status: Pending
> +Index: git/zypp/ExternalProgram.h
> +===================================================================
> +--- git.orig/zypp/ExternalProgram.h	2012-03-23 08:27:31.716438539 -0700
> ++++ git/zypp/ExternalProgram.h	2012-03-23 08:27:54.520439367 -0700
> +@@ -16,6 +16,7 @@
> + #include<map>
> + #include<string>
> + #include<vector>
> ++#include<unistd.h>
> +
> + #include "zypp/base/ExternalDataSource.h"
> + #include "zypp/Pathname.h"
> +Index: git/zypp/base/Random.cc
> +===================================================================
> +--- git.orig/zypp/base/Random.cc	2012-03-23 08:31:09.732449118 -0700
> ++++ git/zypp/base/Random.cc	2012-03-23 08:31:36.240450324 -0700
> +@@ -3,6 +3,7 @@
> + #include<cstdio>
> + #include<iostream>
> + #include<fcntl.h>
> ++#include<unistd.h>
> + #include "zypp/base/Random.h"
> +
> + using namespace std;
> diff --git a/meta/recipes-extended/libzypp/libzypp_git.bb b/meta/recipes-extended/libzypp/libzypp_git.bb
> index 368cc06..78c7a6a 100644
> --- a/meta/recipes-extended/libzypp/libzypp_git.bb
> +++ b/meta/recipes-extended/libzypp/libzypp_git.bb
> @@ -11,7 +11,7 @@ DEPENDS  = "rpm boost curl libxml2 zlib sat-solver expat openssl udev"
>   S = "${WORKDIR}/git"
>   SRCREV = "15b6c52260bbc52b3d8e585e271b67e10cc7c433"
>   PV = "0.0-git${SRCPV}"
> -PR = "r18"
> +PR = "r19"
>
>   SRC_URI = "git://github.com/openSUSE/libzypp.git;protocol=git \
>              file://no-doc.patch \
> @@ -22,6 +22,7 @@ SRC_URI = "git://github.com/openSUSE/libzypp.git;protocol=git \
>   	   file://libzypp-compatargs.patch \
>   	   file://fix_for_compile_wth_gcc-4.6.0.patch \
>   	   file://hardcode-lib-fix.patch \
> +	   file://close.patch \
>             "
>
>   SRC_URI_append_mips = " file://mips-workaround-gcc-tribool-error.patch"


Merged into OE-Core

Thanks
	Sau!


