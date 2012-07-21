Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SsNZW-0005R2-JT
	for openembedded-core@lists.openembedded.org;
	Sat, 21 Jul 2012 02:29:26 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 20 Jul 2012 17:18:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="171027282"
Received: from unknown (HELO [10.255.12.214]) ([10.255.12.214])
	by azsmga001.ch.intel.com with ESMTP; 20 Jul 2012 17:18:01 -0700
Message-ID: <5009F538.6090007@linux.intel.com>
Date: Fri, 20 Jul 2012 17:18:00 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120615 Thunderbird/13.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1342772908.git.liezhi.yang@windriver.com>
	<5735964eb9bdb685cf35d2ecdbb1694f5f6a5036.1342772908.git.liezhi.yang@windriver.com>
In-Reply-To: <5735964eb9bdb685cf35d2ecdbb1694f5f6a5036.1342772908.git.liezhi.yang@windriver.com>
Cc: Zhenfeng.Zhao@windriver.com
Subject: Re: [PATCH 2/2] createrepo 0.4.11: fix the RDEPENDS
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
X-List-Received-Date: Sat, 21 Jul 2012 00:29:26 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/20/2012 02:49 AM, Robert Yang wrote:
> The libxml2-native and rpm-native should be ready before createrepo
> runs since it needs "import libxml2 rpm".
>
> The target createrepo needs libxml2-python when run, but the libxml2
> doesn't generate the python module (disabled). We may need to fix it
> or rename the recipe to createrepo-native_0.4.11.bb.
>
> This recipe is only for the rpm backend system.
>
> [YOCTO #2753]
>
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>   .../createrepo/createrepo_0.4.11.bb                |    4 +++-
>   1 files changed, 3 insertions(+), 1 deletions(-)
>
> diff --git a/meta/recipes-support/createrepo/createrepo_0.4.11.bb b/meta/recipes-support/createrepo/createrepo_0.4.11.bb
> index 060ed59..7a4d059 100644
> --- a/meta/recipes-support/createrepo/createrepo_0.4.11.bb
> +++ b/meta/recipes-support/createrepo/createrepo_0.4.11.bb
> @@ -4,7 +4,9 @@ HOMEPAGE = "http://createrepo.baseurl.org/"
>   LICENSE = "GPLv2+"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=18810669f13b87348459e611d31ab760"
>
> -PR = "r3"
> +RDEPENDS_${PN}_virtclass-native += "libxml2-native rpm-native"
> +
This should not be required here since the package_rpm.bbclass contains 
a line:
PACKAGEINDEXDEPS += "rpm-native:do_populate_sysroot"

We might need to add libxml2-native to the PACKAGEINDEXDEPS

This was merged into OE-0Core, but the real issue turned out to be 
sstate across different distros.

Sau!



> +PR = "r4"
>
>   SRC_URI= "http://createrepo.baseurl.org/download/${BP}.tar.gz \
>             file://fix-native-install.patch \
>



