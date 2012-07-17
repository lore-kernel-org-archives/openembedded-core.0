Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SrAKE-00012r-4L
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Jul 2012 18:08:38 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 17 Jul 2012 08:57:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="178847832"
Received: from unknown (HELO [10.255.12.178]) ([10.255.12.178])
	by fmsmga001.fm.intel.com with ESMTP; 17 Jul 2012 08:57:17 -0700
Message-ID: <50058B5D.5030806@linux.intel.com>
Date: Tue, 17 Jul 2012 08:57:17 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120615 Thunderbird/13.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1341894563-32675-1-git-send-email-msm@freescale.com>
In-Reply-To: <1341894563-32675-1-git-send-email-msm@freescale.com>
Cc: Matthew McClintock <msm@freescale.com>
Subject: Re: [PATCH v2 1/2] gcc: gcc-cross-canadian: use correct location for libraries for powerpc64
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
X-List-Received-Date: Tue, 17 Jul 2012 16:08:38 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/09/2012 09:29 PM, Matthew McClintock wrote:
> This fixes the issue where gcc invokes the linker with an incorrect -L
> library location and gives up because it can't find libraries. It was
> looking in a /lib folder instead of /lib64
>
> Signed-off-by: Matthew McClintock <msm@freescale.com>
> ---
>   meta/recipes-devtools/gcc/gcc-4.7.inc               |    2 +-
>   meta/recipes-devtools/gcc/gcc-cross-canadian_4.7.bb |    4 ++--
>   2 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/meta/recipes-devtools/gcc/gcc-4.7.inc b/meta/recipes-devtools/gcc/gcc-4.7.inc
> index 65153b3..c7dbc3c 100644
> --- a/meta/recipes-devtools/gcc/gcc-4.7.inc
> +++ b/meta/recipes-devtools/gcc/gcc-4.7.inc
> @@ -1,6 +1,6 @@
>   require gcc-common.inc
>
> -PR = "r2"
> +PR = "r3"
>
>   # Third digit in PV should be incremented after a minor release
>   # happens from this branch on gcc e.g. currently its 4.7.1
> diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian_4.7.bb b/meta/recipes-devtools/gcc/gcc-cross-canadian_4.7.bb
> index efa345f..308e6f5 100644
> --- a/meta/recipes-devtools/gcc/gcc-cross-canadian_4.7.bb
> +++ b/meta/recipes-devtools/gcc/gcc-cross-canadian_4.7.bb
> @@ -9,8 +9,8 @@ DEPENDS += "gmp-nativesdk mpfr-nativesdk libmpc-nativesdk elfutils-nativesdk"
>   RDEPENDS_${PN} += "mpfr-nativesdk libmpc-nativesdk elfutils-nativesdk"
>
>   SYSTEMHEADERS = "/usr/include"
> -SYSTEMLIBS = "/lib/"
> -SYSTEMLIBS1 = "/usr/lib/"
> +SYSTEMLIBS = "${target_base_libdir}/"
> +SYSTEMLIBS1 = "${target_libdir}/"
>
>   EXTRA_OECONF += "--disable-libunwind-exceptions --disable-libssp \
>   		--disable-libgomp --disable-libmudflap \
>

Merged this change into OE-Core

Thanks
	Sau!


