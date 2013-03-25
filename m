Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1UK7sP-00072N-3J
	for openembedded-core@lists.openembedded.org;
	Mon, 25 Mar 2013 14:56:01 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r2PDcrRH009759
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Mar 2013 06:38:53 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.36.234) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.342.3; Mon, 25 Mar 2013 06:38:53 -0700
Message-ID: <5150536C.6000000@windriver.com>
Date: Mon, 25 Mar 2013 08:38:52 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/20130307 Thunderbird/17.0.4
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1364204199.git.kai.kang@windriver.com>
	<e3e9dea5c45c1b5ba29300e4957dcd611655492e.1364204199.git.kai.kang@windriver.com>
In-Reply-To: <e3e9dea5c45c1b5ba29300e4957dcd611655492e.1364204199.git.kai.kang@windriver.com>
Subject: Re: [PATCH 1/2] libpng: add version 1.2 back
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
X-List-Received-Date: Mon, 25 Mar 2013 13:56:13 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 3/25/13 5:21 AM, Kang Kai wrote:
> Current LSB 4.1 test suite still check libpng12.so, so add libpng 1.2.x
> back, and set it as default verison for linuxstdbase image.

I think this is close, but incorrect.  What should be added for compatibility is 
a -new- package called "libpng12_1.2.50.bb".  Ensure that the libpng-config 
(which should installed into crossscripts) is also renamed to libpng12-config.

We want to make sure we have both the old and new versions to meet LSB 
compliance (for people who have that enabled) as well as the new version for 
newer applications.

--Mark

> [YOCTO 4015]
>
> Signed-off-by: Kang Kai <kai.kang@windriver.com>
> ---
>   meta/conf/distro/include/default-versions.inc   |    3 +++
>   meta/recipes-multimedia/libpng/libpng_1.2.50.bb |   21 +++++++++++++++++++++
>   2 files changed, 24 insertions(+), 0 deletions(-)
>   create mode 100644 meta/recipes-multimedia/libpng/libpng_1.2.50.bb
>
> diff --git a/meta/conf/distro/include/default-versions.inc b/meta/conf/distro/include/default-versions.inc
> index 53ec2e7..0a5b2f4 100644
> --- a/meta/conf/distro/include/default-versions.inc
> +++ b/meta/conf/distro/include/default-versions.inc
> @@ -9,3 +9,6 @@ PREFERRED_VERSION_python-native ?= "2.7.3"
>
>   # Force the older version of liberation-fonts until we fix the fontforge issue
>   PREFERRED_VERSION_liberation-fonts ?= "1.04"
> +
> +# Set libpng default version for linuxstdbase
> +PREFERRED_VERSION_libpng_linuxstdbase ?= "1.2.50"
> diff --git a/meta/recipes-multimedia/libpng/libpng_1.2.50.bb b/meta/recipes-multimedia/libpng/libpng_1.2.50.bb
> new file mode 100644
> index 0000000..8fdc41b
> --- /dev/null
> +++ b/meta/recipes-multimedia/libpng/libpng_1.2.50.bb
> @@ -0,0 +1,21 @@
> +SUMMARY = "PNG Library"
> +DESCRIPTION = "PNG Library"
> +HOMEPAGE = "http://www.libpng.org/"
> +SECTION = "libs"
> +LICENSE = "Libpng"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=c3d807a85c09ebdff087f18b4969ff96 \
> +                    file://png.h;beginline=310;endline=424;md5=b87b5e9252a3e14808a27b92912d268d"
> +DEPENDS = "zlib"
> +PR = "r0"
> +
> +SRC_URI = "${SOURCEFORGE_MIRROR}/project/libpng/libpng12/${PV}/libpng-${PV}.tar.xz"
> +
> +SRC_URI[md5sum] = "a3e00fccbfe356174ab515b5c00641c7"
> +SRC_URI[sha256sum] = "4724f81f8c92ac7f360ad1fbf173396ea7c535923424db9fbaff07bfd9d8e8e7"
> +
> +inherit autotools binconfig pkgconfig
> +
> +PACKAGES =+ "${PN}12"
> +
> +FILES_${PN}12 = "${libdir}/libpng12${SOLIBS}"
> +RPROVIDES_${PN}-dev += "${PN}12-dev"
>



