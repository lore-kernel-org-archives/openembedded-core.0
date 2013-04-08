Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1UPDqI-0000CO-Sn
	for openembedded-core@lists.openembedded.org;
	Mon, 08 Apr 2013 17:18:47 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r38F1ROY004013
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 8 Apr 2013 08:01:27 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.36.228) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.342.3; Mon, 8 Apr 2013 08:01:27 -0700
Message-ID: <5162DBCE.8060904@windriver.com>
Date: Mon, 8 Apr 2013 10:01:34 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/20130328 Thunderbird/17.0.5
MIME-Version: 1.0
To: Kang Kai <kai.kang@windriver.com>
References: <cover.1365401439.git.kai.kang@windriver.com>
	<cc464b33c56579c26179fa20c7354c328b4e080c.1365401439.git.kai.kang@windriver.com>
In-Reply-To: <cc464b33c56579c26179fa20c7354c328b4e080c.1365401439.git.kai.kang@windriver.com>
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
X-List-Received-Date: Mon, 08 Apr 2013 15:18:47 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 4/8/13 4:12 AM, Kang Kai wrote:
> As Mark's suggestion, rename libpng_1.2.50 to libpng12 that
> multi-versions libpng could coexist. And drop files that conflict with
> higher version.
>
> We want to make sure we have both the old and new versions to meet LSB
> compliance (for people who have that enabled) as well as the new version
> for newer applications.
>
> CC: Mark Hatle <mark.hatle@windriver.com>
>
> Signed-off-by: Kang Kai <kai.kang@windriver.com>
> ---
>   .../{libpng_1.2.50.bb => libpng12_1.2.50.bb}       |   18 +++++++++++++++---
>   1 files changed, 15 insertions(+), 3 deletions(-)
>   rename meta/recipes-lsb4/libpng/{libpng_1.2.50.bb => libpng12_1.2.50.bb} (62%)
>
> diff --git a/meta/recipes-lsb4/libpng/libpng_1.2.50.bb b/meta/recipes-lsb4/libpng/libpng12_1.2.50.bb
> similarity index 62%
> rename from meta/recipes-lsb4/libpng/libpng_1.2.50.bb
> rename to meta/recipes-lsb4/libpng/libpng12_1.2.50.bb
> index 8fdc41b..43ff75a 100644
> --- a/meta/recipes-lsb4/libpng/libpng_1.2.50.bb
> +++ b/meta/recipes-lsb4/libpng/libpng12_1.2.50.bb
> @@ -8,14 +8,26 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=c3d807a85c09ebdff087f18b4969ff96 \
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
> +	unlink ${D}/${includedir}/png.h
> +	unlink ${D}/${includedir}/pngconf.h

You should move those two into a subdirectory called "${D}/${includedir}/libpng12/"

That way they will still be available for anyone who needs them.

> +
> +	unlink ${D}/${libdir}/libpng.la
> +	unlink ${D}/${libdir}/libpng.so
> +	unlink ${D}/${libdir}/libpng.a

The .la, .a seen above should be similarly renamed to be libpng12...  The .so 
should be dropped, as anyone who needs the alternative version would need to 
directly specify it.

> +	unlink ${D}/${libdir}/pkgconfig/libpng.pc

Should be renamed to be libpng12.pc.

(Note both the .la and .pc files will likely need to be modified to reference 
the correct header and library paths.)

> -FILES_${PN}12 = "${libdir}/libpng12${SOLIBS}"
> -RPROVIDES_${PN}-dev += "${PN}12-dev"
> +	unlink ${D}/${bindir}/libpng-config
> +}

The above should be renamed to be "libpng12-config".

(Again, make sure that the results of it match the renamed .a/.so and include 
paths.)

--Mark


