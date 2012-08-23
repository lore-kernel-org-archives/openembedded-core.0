Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1T4aUb-00004r-0J
	for openembedded-core@lists.openembedded.org;
	Thu, 23 Aug 2012 18:42:49 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 23 Aug 2012 09:28:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,301,1344236400"; d="scan'208";a="190516332"
Received: from unknown (HELO [10.255.13.21]) ([10.255.13.21])
	by orsmga002.jf.intel.com with ESMTP; 23 Aug 2012 09:28:04 -0700
Message-ID: <50365A14.4050601@linux.intel.com>
Date: Thu, 23 Aug 2012 09:28:04 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120717 Thunderbird/14.0
MIME-Version: 1.0
To: wenzong.fan@windriver.com
References: <cover.1345431102.git.wenzong.fan@windriver.com>
	<5a92968e29ead46bff1edf963d1f9cef3732e8b1.1345431102.git.wenzong.fan@windriver.com>
In-Reply-To: <5a92968e29ead46bff1edf963d1f9cef3732e8b1.1345431102.git.wenzong.fan@windriver.com>
Cc: Zhenfeng.Zhao@windriver.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] coreutils: fix do_configure error with long TMPDIR
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
X-List-Received-Date: Thu, 23 Aug 2012 16:42:49 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/19/2012 07:55 PM, wenzong.fan@windriver.com wrote:
> From: Wenzong Fan <wenzong.fan@windriver.com>
>
> By default the 'm4/*' files will be extended with absolute path while
> autoreconf running, if the length of TMPDIR is too long such as 410
> which is the maximum value allowed by 'sanity.bbclass', autoreconf
> will fail with error:
>
>      Can't exec "/bin/sh": Argument list too long ...
>
> Fix this issue by specific the 'acpaths' to '-I ./m4'.
>
> [YOCTO #2766]
>
> Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
> ---
>   meta/recipes-core/coreutils/coreutils_8.14.bb |    4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/coreutils/coreutils_8.14.bb b/meta/recipes-core/coreutils/coreutils_8.14.bb
> index 9a714a9..c7c8e13 100644
> --- a/meta/recipes-core/coreutils/coreutils_8.14.bb
> +++ b/meta/recipes-core/coreutils/coreutils_8.14.bb
> @@ -7,7 +7,7 @@ BUGTRACKER = "http://debbugs.gnu.org/coreutils"
>   LICENSE = "GPLv3+"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504\
>                       file://src/ls.c;startline=5;endline=16;md5=e1a509558876db58fb6667ba140137ad"
> -PR = "r5"
> +PR = "r6"
>   DEPENDS = "gmp libcap"
>   DEPENDS_virtclass-native = ""
>
> @@ -36,6 +36,8 @@ base_bindir_progs = "cat chgrp chmod chown cp date dd echo false kill ln ls mkdi
>
>   sbindir_progs= "chroot"
>
> +acpaths = "-I ./m4"
> +
This is a poor work-around to the problem, and does not give any idea as 
to what your fixing.  Please investigate a proper fix not just a 
work-around.

Thanks
	Sau!

>   do_install_append() {
>   	for i in df mktemp base64; do mv ${D}${bindir}/$i ${D}${bindir}/$i.${BPN}; done
>
>


