Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 1455C771BB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Aug 2016 20:18:25 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u7AKIORL020520
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 10 Aug 2016 13:18:24 -0700 (PDT)
Received: from msp-dhcp10.wrs.com (172.25.34.10) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 10 Aug 2016 13:18:22 -0700
To: "Davis, Michael" <michael.davis@essvote.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <1470856303-24490-1-git-send-email-michael.davis@essvote.com>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <bbf4ea57-5a32-7696-3e70-3c11dc069ef1@windriver.com>
Date: Wed, 10 Aug 2016 15:18:21 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:45.0)
	Gecko/20100101 Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <1470856303-24490-1-git-send-email-michael.davis@essvote.com>
Subject: Re: [meta-oe][PATCH] pcsc-lite: Seperate GPLV3 portions from BSD
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 10 Aug 2016 20:18:26 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit

On 8/10/16 2:12 PM, Davis, Michael wrote:
> GPLV3 and BSD portions were originally placed in the same package.
> The GPLv3 portion has been seperated into pcsc-lite-spy so the package can be used with GPLv3 blacklisted.
> 
> Signed-off-by: Michael Davis <michael.davis@essvote.com>
> ---
>  meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.13.bb | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.13.bb b/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.13.bb
> index cc72549..e1d405b 100644
> --- a/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.13.bb
> +++ b/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.13.bb
> @@ -1,6 +1,7 @@
>  SUMMARY = "PC/SC Lite smart card framework and applications"
>  HOMEPAGE = "http://pcsclite.alioth.debian.org/"
> -LICENSE = "BSD & GPLv3+"
> +LICENSE = "BSD" 

LICENSE should be the overall license(s) of the sources used to produce the
binaries.

So in this case you'd want to do:

LICENSE = "BSD & GPLv3+"
LICENSE_${PN} = "BSD"
LICENSE_${PN}-lib = "BSD"
...
LICENSE_${PN}-spy = "GPLv3+"
LICENSE_${PN}-dev = "GPLv3+"

Once the packages deviate from the overall source code license you need to
explicitly list them for each package.  (The -dbg usually always matches the
${PN}, so that isn't necessary.)

In order to allow for the blacklisting, you may have to add some additional code
to disable the GPL3 pieces if the blacklist is in place.  I think there are some
examples of this elsewhere in oe-core.

--Mark

> +LICENSE_${PN}-spy = "GPLv3+"
>  LICENSE_${PN}-dev = "GPLv3+"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=bcfbd85230ac3c586fb294c8b627cf32"
>  DEPENDS = "udev"
> @@ -20,14 +21,16 @@ EXTRA_OECONF = " \
>  
>  S = "${WORKDIR}/pcsc-lite-${PV}"
>  
> -PACKAGES =+ "${PN}-lib"
> +PACKAGES =+ "${PN}-lib ${PN}-spy"
>  
>  RRECOMMENDS_${PN} = "ccid"
>  
> -FILES_${PN}-lib = "${libdir}/lib*${SOLIBS}"
> +FILES_${PN}-spy += "${bindir}/pcsc-spy \
> +                    ${libdir}/libpcscspy*${SOLIBS}"
> +FILES_${PN}-lib = "${libdir}/libpcsclite*${SOLIBS}"
>  
>  RPROVIDES_${PN} += "${PN}-systemd"
>  RREPLACES_${PN} += "${PN}-systemd"
>  RCONFLICTS_${PN} += "${PN}-systemd"
>  SYSTEMD_SERVICE_${PN} = "pcscd.socket"
> -RDEPENDS_${PN} +="python"
> +RDEPENDS_${PN}-spy +="python"
> 


