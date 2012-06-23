Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SiIZZ-0002OB-5h
	for openembedded-core@lists.openembedded.org;
	Sat, 23 Jun 2012 07:07:49 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 22 Jun 2012 21:56:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="183956124"
Received: from unknown (HELO [10.255.12.175]) ([10.255.12.175])
	by fmsmga002.fm.intel.com with ESMTP; 22 Jun 2012 21:56:57 -0700
Message-ID: <4FE54C99.4040602@linux.intel.com>
Date: Fri, 22 Jun 2012 21:56:57 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1340385690.git.scott.a.garman@intel.com>
	<014ba0776261691704af5c05b4a6bac66590adf6.1340385690.git.scott.a.garman@intel.com>
In-Reply-To: <014ba0776261691704af5c05b4a6bac66590adf6.1340385690.git.scott.a.garman@intel.com>
Cc: Scott Garman <scott.a.garman@intel.com>
Subject: Re: [PATCH 1/2] gzip: upgrade to 1.5
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
X-List-Received-Date: Sat, 23 Jun 2012 05:07:49 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/22/2012 10:25 AM, Scott Garman wrote:
> LIC_FILES_CHKSUM updated due to trivial copyright date change.
>
> Use new update-alternatives syntax.
>

I think you also need an update to PREFERRED_VERSION for gzip-native in 
tcmode-default.inc, not sure why I missed this earlier.

Sau!

> Signed-off-by: Scott Garman<scott.a.garman@intel.com>
> ---
>   meta/recipes-extended/gzip/gzip.inc    |    7 +++++--
>   meta/recipes-extended/gzip/gzip_1.4.bb |   10 ----------
>   meta/recipes-extended/gzip/gzip_1.5.bb |   10 ++++++++++
>   3 files changed, 15 insertions(+), 12 deletions(-)
>   delete mode 100644 meta/recipes-extended/gzip/gzip_1.4.bb
>   create mode 100644 meta/recipes-extended/gzip/gzip_1.5.bb
>
> diff --git a/meta/recipes-extended/gzip/gzip.inc b/meta/recipes-extended/gzip/gzip.inc
> index 1d608a6..a4b1abe 100644
> --- a/meta/recipes-extended/gzip/gzip.inc
> +++ b/meta/recipes-extended/gzip/gzip.inc
> @@ -6,7 +6,7 @@ SECTION = "console/utils"
>   # change to GPLv3+ in 2007/07. Previous GPLv2 version is 1.3.12
>   LICENSE = "GPLv3+"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
> -                    file://gzip.h;firstline=8;endline=20;md5=e2ec6b91fbe43a18f6081f3bbae46a01"
> +                    file://gzip.h;firstline=8;endline=20;md5=d31380638987e6789f06bc96a29a9a16"
>
>   SRC_URI = "${GNU_MIRROR}/gzip/${BP}.tar.gz"
>
> @@ -22,5 +22,8 @@ do_install_append () {
>
>   inherit update-alternatives
>
> -ALTERNATIVE_LINKS = "${base_bindir}/gunzip ${base_bindir}/gzip ${base_bindir}/zcat"
>   ALTERNATIVE_PRIORITY = "100"
> +ALTERNATIVE_${PN} = "gunzip gzip zcat"
> +ALTERNATIVE_LINK_NAME[gunzip] = "${base_bindir}/gunzip"
> +ALTERNATIVE_LINK_NAME[gzip] = "${base_bindir}/gzip"
> +ALTERNATIVE_LINK_NAME[zcat] = "${base_bindir}/zcat"
> diff --git a/meta/recipes-extended/gzip/gzip_1.4.bb b/meta/recipes-extended/gzip/gzip_1.4.bb
> deleted file mode 100644
> index 54dd50a..0000000
> --- a/meta/recipes-extended/gzip/gzip_1.4.bb
> +++ /dev/null
> @@ -1,10 +0,0 @@
> -require gzip.inc
> -
> -PR = "r2"
> -
> -NATIVE_PACKAGE_PATH_SUFFIX = "/${PN}"
> -
> -BBCLASSEXTEND = "native"
> -
> -SRC_URI[md5sum] = "e381b8506210c794278f5527cba0e765"
> -SRC_URI[sha256sum] = "d166cfd3da380da1bd535633e8890bfb5664f9e68870a611d1dc01a3e9f711ee"
> diff --git a/meta/recipes-extended/gzip/gzip_1.5.bb b/meta/recipes-extended/gzip/gzip_1.5.bb
> new file mode 100644
> index 0000000..7a811e2
> --- /dev/null
> +++ b/meta/recipes-extended/gzip/gzip_1.5.bb
> @@ -0,0 +1,10 @@
> +require gzip.inc
> +
> +PR = "r0"
> +
> +NATIVE_PACKAGE_PATH_SUFFIX = "/${PN}"
> +
> +BBCLASSEXTEND = "native"
> +
> +SRC_URI[md5sum] = "11b76536941ee1c0221fe6eefbcb32cb"
> +SRC_URI[sha256sum] = "b5d56e8ffc9918e8c941fab56e04121194f9870adeeb859e09c09eac264035a3"


