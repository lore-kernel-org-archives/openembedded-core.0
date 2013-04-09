Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1UPaJh-0007S3-9X
	for openembedded-core@lists.openembedded.org;
	Tue, 09 Apr 2013 17:18:38 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r39F1DiK028836
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 9 Apr 2013 08:01:15 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.36.228) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.342.3; Tue, 9 Apr 2013 08:01:14 -0700
Message-ID: <51642D38.2000600@windriver.com>
Date: Tue, 9 Apr 2013 10:01:12 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/20130328 Thunderbird/17.0.5
MIME-Version: 1.0
To: Kang Kai <kai.kang@windriver.com>
References: <cover.1365477246.git.kai.kang@windriver.com>
	<754d3131a0b2491dd42f52112a652a211e2662d2.1365477246.git.kai.kang@windriver.com>
In-Reply-To: <754d3131a0b2491dd42f52112a652a211e2662d2.1365477246.git.kai.kang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] libpng12: rename libpng_1.2.50 to libpng12
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
X-List-Received-Date: Tue, 09 Apr 2013 15:18:38 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 4/8/13 10:16 PM, Kang Kai wrote:
> As Mark's suggestion, rename libpng_1.2.50 to libpng12 that
> multi-versions libpng could coexist.
>
> We want to make sure we have both the old and new versions to meet LSB
> compliance (for people who have that enabled) as well as the new version
> for newer applications.
>
> And drop link files that conflict with higher version.
>
> [YOCTO #4221]
>
> Signed-off-by: Kang Kai <kai.kang@windriver.com>
> CC: Mark Hatle <mark.hatle@windriver.com>

Thanks for the additional comment below.  I'm happy with this, it should help 
resolve one of the LSB test failures.

--Mark

> ---
>   .../{libpng_1.2.50.bb => libpng12_1.2.50.bb}       |   20 +++++++++++++++++---
>   1 files changed, 17 insertions(+), 3 deletions(-)
>   rename meta/recipes-lsb4/libpng/{libpng_1.2.50.bb => libpng12_1.2.50.bb} (55%)
>
> diff --git a/meta/recipes-lsb4/libpng/libpng_1.2.50.bb b/meta/recipes-lsb4/libpng/libpng12_1.2.50.bb
> similarity index 55%
> rename from meta/recipes-lsb4/libpng/libpng_1.2.50.bb
> rename to meta/recipes-lsb4/libpng/libpng12_1.2.50.bb
> index 8fdc41b..cfefd41 100644
> --- a/meta/recipes-lsb4/libpng/libpng_1.2.50.bb
> +++ b/meta/recipes-lsb4/libpng/libpng12_1.2.50.bb
> @@ -8,14 +8,28 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=c3d807a85c09ebdff087f18b4969ff96 \
>   DEPENDS = "zlib"
>   PR = "r0"
>
> +PN = "libpng12"
> +S = "${WORKDIR}/libpng-${PV}"
> +
>   SRC_URI = "${SOURCEFORGE_MIRROR}/project/libpng/libpng12/${PV}/libpng-${PV}.tar.xz"
>
>   SRC_URI[md5sum] = "a3e00fccbfe356174ab515b5c00641c7"
>   SRC_URI[sha256sum] = "4724f81f8c92ac7f360ad1fbf173396ea7c535923424db9fbaff07bfd9d8e8e7"
>
> +BINCONFIG_GLOB = "${PN}-config"
> +
>   inherit autotools binconfig pkgconfig
>
> -PACKAGES =+ "${PN}12"
> +do_install_append() {
> +	# The follow link files link to corresponding png12*.h and libpng12* files
> +	# They conflict with higher verison, so drop them
> +	unlink ${D}/${includedir}/png.h
> +	unlink ${D}/${includedir}/pngconf.h
> +
> +	unlink ${D}/${libdir}/libpng.la
> +	unlink ${D}/${libdir}/libpng.so
> +	unlink ${D}/${libdir}/libpng.a
> +	unlink ${D}/${libdir}/pkgconfig/libpng.pc
>
> -FILES_${PN}12 = "${libdir}/libpng12${SOLIBS}"
> -RPROVIDES_${PN}-dev += "${PN}12-dev"
> +	unlink ${D}/${bindir}/libpng-config
> +}
>



