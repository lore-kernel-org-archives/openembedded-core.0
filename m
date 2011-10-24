Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RIKdD-0007Yo-Mb for openembedded-core@lists.openembedded.org;
	Mon, 24 Oct 2011 15:31:59 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p9ODPpwH028770
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Oct 2011 14:25:51 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 28282-04 for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Oct 2011 14:25:46 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p9ODPicn028764
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Oct 2011 14:25:45 +0100
Message-ID: <1319462745.25011.6.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 24 Oct 2011 14:25:45 +0100
In-Reply-To: <2c5ad68e4c5f715c91760839f482deff44fa9f06.1319394187.git.sgw@linux.intel.com>
References: <cover.1319394187.git.sgw@linux.intel.com>
	<2c5ad68e4c5f715c91760839f482deff44fa9f06.1319394187.git.sgw@linux.intel.com>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [CONSOLIDATED PULL 23/27] wget: Add recipe from OE
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
X-List-Received-Date: Mon, 24 Oct 2011 13:31:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

> diff --git a/meta/recipes-extended/wget/wget.inc b/meta/recipes-extended/wget/wget.inc
> new file mode 100644
> index 0000000..c0d9ba9
> --- /dev/null
> +++ b/meta/recipes-extended/wget/wget.inc
> @@ -0,0 +1,40 @@
> +DESCRIPTION = "A console URL download utility featuring HTTP, FTP, and more."
> +SECTION = "console/network"
> +DEPENDS = ""
> +DEPENDS_shr = "gnutls"

Hmm. See below.

> +LICENSE = "GPL"

Which GPL?

> +LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
> +
> +
> +INC_PR = "r9"
> +
> +S = "${WORKDIR}/wget-${PV}"
> +
> +inherit autotools gettext
> +
> +# Disable checking for SSL since that searches the system paths
> +EXTRA_OECONF = "--enable-ipv6 --without-ssl"
> +
> +# Enable SSL it's usefull
> +EXTRA_OECONF_shr = "--enable-ipv6 --with-ssl=gnutls"
> +# The unslung kernel does not support ipv6
> +EXTRA_OECONF_unslung = "--without-ssl"
> +# SlugOS kernels do not support ipv6. Can be loaded as a module.
> +EXTRA_OECONF_slugos = "--without-ssl"

So we go to interesting lengths here to customise this under a variety
of conditions...

> +inherit autotools update-alternatives
> +
> +EXTRA_OECONF = "--with-libc"

... and then we overwrite half of it here. This needs cleaning up before
it can merge. We could convert it to make these config items
PACKAGECONFIG if people need to customise this.

>+do_configure() {
>+	autotools_do_configure
>+}

This looks rather pointless?

Cheers,

Richard



