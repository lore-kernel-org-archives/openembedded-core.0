Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SCoXC-0001A0-5E for openembedded-core@lists.openembedded.org;
	Wed, 28 Mar 2012 10:47:14 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2S8cCJ3017836;
	Wed, 28 Mar 2012 09:38:12 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 15632-06; Wed, 28 Mar 2012 09:38:07 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2S8c3x2017830
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Wed, 28 Mar 2012 09:38:05 +0100
Message-ID: <1332923884.28414.189.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 28 Mar 2012 09:38:04 +0100
In-Reply-To: <1332915061-19304-1-git-send-email-denis@denix.org>
References: <1332915061-19304-1-git-send-email-denis@denix.org>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: Re: [PATCH] bc: use update-alternatives to make dc play nice with busybox
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
X-List-Received-Date: Wed, 28 Mar 2012 08:47:14 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-03-28 at 02:11 -0400, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@ti.com>
> 
> busybox' default configuration enables dc app, which bc also provides,
> setup update-alternatives to resolve the conflict.
> 
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  meta/recipes-extended/bc/bc_1.06.bb |   13 +++++++++++--
>  1 files changed, 11 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/recipes-extended/bc/bc_1.06.bb b/meta/recipes-extended/bc/bc_1.06.bb
> index 02915e1..d8d8f4d 100644
> --- a/meta/recipes-extended/bc/bc_1.06.bb
> +++ b/meta/recipes-extended/bc/bc_1.06.bb
> @@ -11,11 +11,20 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
>  
>  SECTION = "base"
>  DEPENDS = "flex"
> -PR = "r0"
> +PR = "r1"
>  
>  SRC_URI = "${GNU_MIRROR}/bc/bc-${PV}.tar.gz"
>  
>  SRC_URI[md5sum] = "d44b5dddebd8a7a7309aea6c36fda117"
>  SRC_URI[sha256sum] = "4ef6d9f17c3c0d92d8798e35666175ecd3d8efac4009d6457b5c99cea72c0e33"
>  
> -inherit autotools
> +do_install_append () {
> +	mv ${D}${bindir}/dc ${D}${bindir}/dc.${PN}
> +}
> +
> +inherit autotools update-alternatives
> +
> +ALTERNATIVE_NAME = "dc"
> +ALTERNATIVE_LINK = "${bindir}/dc"
> +ALTERNATIVE_PATH = "${bindir}/dc.${PN}"
> +ALTERNATIVE_PRIORITY = "100"


I think you should just be able to do:

"""
ALTERNATIVE_LINKS = "${bindir}/dc"
ALTERNATIVE_PRIORITY = "100"

inherit autotools update-alternatives
"""

?

Cheers,

Richard





