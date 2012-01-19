Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RngiZ-0006Hk-Jn
	for openembedded-core@lists.openembedded.org;
	Thu, 19 Jan 2012 02:23:07 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 18 Jan 2012 17:15:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="113801663"
Received: from unknown (HELO [10.255.14.6]) ([10.255.14.6])
	by fmsmga002.fm.intel.com with ESMTP; 18 Jan 2012 17:15:24 -0800
Message-ID: <4F176EAC.6090309@linux.intel.com>
Date: Wed, 18 Jan 2012 17:15:24 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:8.0) Gecko/20111115 Thunderbird/8.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <f37166f3f48c2747fbcc4d9ca8e9c2ddbe9aa637.1326929307.git.nitin.a.kamble@intel.com>
	<948a269f26b2705882e03fa636c947197feca97b.1326929307.git.nitin.a.kamble@intel.com>
In-Reply-To: <948a269f26b2705882e03fa636c947197feca97b.1326929307.git.nitin.a.kamble@intel.com>
Subject: Re: [PATCHv3 2/7] bdwgc: new recipe for autogen
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
X-List-Received-Date: Thu, 19 Jan 2012 01:23:07 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/18/2012 03:32 PM, nitin.a.kamble@intel.com wrote:
> From: Nitin A Kamble<nitin.a.kamble@intel.com>
>
> This recipe is needed by guile.
> And guile is needed for autogen.
>
> As per Beth's recommondation changed the license specification of the
> recipe as
>
> LICENSE = "MIT&  FSF-Unlimited&  GPL-2.0"
>
> Signed-off-by: Nitin A Kamble<nitin.a.kamble@intel.com>
> ---
>   meta/recipes-support/bdwgc/bdwgc_20110107.bb |   40 ++++++++++++++++++++++++++
>   1 files changed, 40 insertions(+), 0 deletions(-)
>   create mode 100644 meta/recipes-support/bdwgc/bdwgc_20110107.bb
>
> diff --git a/meta/recipes-support/bdwgc/bdwgc_20110107.bb b/meta/recipes-support/bdwgc/bdwgc_20110107.bb
> new file mode 100644
> index 0000000..1e32681
> --- /dev/null
> +++ b/meta/recipes-support/bdwgc/bdwgc_20110107.bb
> @@ -0,0 +1,40 @@
> +SUMMARY = "A garbage collector for C and C++"
> +
> +DESCRIPTION = "The Boehm-Demers-Weiser conservative garbage collector can be\
> + used as a garbage collecting replacement for C malloc or C++ new. It allows\
> + you to allocate memory basically as you normally would, without explicitly\
> + deallocating memory that is no longer useful. The collector automatically\
> + recycles memory when it determines that it can no longer be otherwise\
> + accessed.\
> +  The collector is also used by a number of programming language\
> + implementations that either use C as intermediate code, want to facilitate\
> + easier interoperation with C libraries, or just prefer the simple collector\
> + interface.\
> +  Alternatively, the garbage collector may be used as a leak detector for C\
> + or C++ programs, though that is not its primary goal.\
> +  Empirically, this collector works with most unmodified C programs, simply\
> + by replacing malloc with GC_malloc calls, replacing realloc with GC_realloc\
> + calls, and removing free calls."
> +
> +HOMEPAGE = "http://www.hpl.hp.com/personal/Hans_Boehm/gc/"
> +SECTION = "devel"
> +LICENSE = "MIT&  FSF-Unlimited&  GPL-2.0"
> +LIC_FILES_CHKSUM = "file://README.QUICK;md5=9b9dd874f6940641b6ab19893ee8f1cc \
> +                    file://doc/README;md5=6d74ce18ff55d936a4d6bd35a98e9eb9 \
> +                    file://libatomic_ops/doc/LICENSING.txt;md5=607073e04548eac7d1f763e480477bab"
> +
> +SRC_URI = "http://www.hpl.hp.com/personal/Hans_Boehm/gc/gc_source/bdwgc-7_2alpha5-20110107.tar.bz2"
> +
> +SRC_URI[md5sum] = "4f3c130fc71ff23584edaa19a37739ee"
> +SRC_URI[sha256sum] = "1f57b959ae1144e1e5fa59d52d7cb4ed626fd74cf47da1c9c119b8b46ae2722d"
> +
> +PR = "r0"
> +
> +S = "${WORKDIR}/bdwgc"
> +
> +do_install_append (){
> +	rm -rf ${D}${datadir}/gc
> +}
> +
> +inherit autotools
> +BBCLASSEXTEND = "native nativesdk"

Nitin,

I am seeing the following WARNING, can you please fix this
WARNING: For recipe bdwgc, the following files/directories were 
installed but not shipped in any package:
WARNING:   /usr/share

Thanks
	Sau!


