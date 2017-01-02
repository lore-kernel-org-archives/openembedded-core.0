Return-Path: <sbabic@denx.de>
X-Greylist: delayed 408 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 02 Jan 2017 16:51:49 UTC
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id 1293760721
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Jan 2017 16:51:49 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 3tsjbw2PRYz3hjSL;
	Mon,  2 Jan 2017 17:45:00 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.68])
	by mail.m-online.net (Postfix) with ESMTP id 3tsjbw25H2zvkDF;
	Mon,  2 Jan 2017 17:45:00 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.68]) (amavisd-new,
	port 10024)
	with ESMTP id NE9aBPCCyLHv; Mon,  2 Jan 2017 17:44:59 +0100 (CET)
Received: from babic.homelinux.org (host-88-217-136-221.customer.m-online.net
	[88.217.136.221]) by mail.mnet-online.de (Postfix) with ESMTP;
	Mon,  2 Jan 2017 17:44:59 +0100 (CET)
Received: from localhost (mail.babic.homelinux.org [127.0.0.1])
	by babic.homelinux.org (Postfix) with ESMTP id 95C4945404CB;
	Mon,  2 Jan 2017 17:43:34 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at babic.homelinux.org
Received: from babic.homelinux.org ([127.0.0.1])
	by localhost (mail.babic.homelinux.org [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id bsoEx-cu-Tlx; Mon,  2 Jan 2017 17:43:31 +0100 (CET)
Received: from [192.168.178.132] (papero.fritz.box [192.168.178.132])
	by babic.homelinux.org (Postfix) with ESMTP id 4B38C45402B7;
	Mon,  2 Jan 2017 17:43:31 +0100 (CET)
To: Javier Viguera <javier.viguera@digi.com>,
	openembedded-core@lists.openembedded.org
References: <20170102162025.10154-1-javier.viguera@digi.com>
From: Stefano Babic <sbabic@denx.de>
Message-ID: <3a4b4c09-8f82-8309-6341-c4c9eaadcc11@denx.de>
Date: Mon, 2 Jan 2017 17:44:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.5.1
MIME-Version: 1.0
In-Reply-To: <20170102162025.10154-1-javier.viguera@digi.com>
Subject: Re: [PATCH] mtd-utils: install libmtd and libubi static libraries
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
X-List-Received-Date: Mon, 02 Jan 2017 16:51:51 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

Hi Javier,

On 02/01/2017 17:20, Javier Viguera wrote:
> These two static libraries can be used to program custom applications to
> access MTD devices.
> 
> For example an user of those libraries is 'swupdate' package from
> 'meta-swupdate'.
> 
> Signed-off-by: Javier Viguera <javier.viguera@digi.com>
> ---
>  meta/recipes-devtools/mtd/mtd-utils_git.bb | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/meta/recipes-devtools/mtd/mtd-utils_git.bb b/meta/recipes-devtools/mtd/mtd-utils_git.bb
> index 8a3afaf62b21..e83dfce11772 100644
> --- a/meta/recipes-devtools/mtd/mtd-utils_git.bb
> +++ b/meta/recipes-devtools/mtd/mtd-utils_git.bb
> @@ -31,6 +31,11 @@ EXTRA_OEMAKE = "'CC=${CC}' 'RANLIB=${RANLIB}' 'AR=${AR}' 'CFLAGS=${CFLAGS} ${@bb
>  
>  do_install () {
>  	oe_runmake install DESTDIR=${D} SBINDIR=${sbindir} MANDIR=${mandir} INCLUDEDIR=${includedir}
> +	# Install 'libubi' and 'libmtd' static libraries
> +	install -d ${D}${includedir}/mtd
> +	install -m 0644 include/libmtd.h include/mtd/ubi-media.h ubi-utils/include/libubi.h ${D}${includedir}/mtd/
> +	oe_libinstall -a -C lib libmtd ${D}${libdir}
> +	oe_libinstall -a -C ubi-utils libubi ${D}${libdir}
>  }
>  
>  PACKAGES =+ "mtd-utils-jffs2 mtd-utils-ubifs mtd-utils-misc"
> 

I am happy if this stuff is moved from meta-swupdate to oe-core - I will
remove the .bbappend from meta-swupdate if this go in.

Best regards,
Stefano Babic

-- 
=====================================================================
DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: +49-8142-66989-53 Fax: +49-8142-66989-80 Email: sbabic@denx.de
=====================================================================

