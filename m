Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SNirG-0002Ha-P5 for openembedded-core@lists.openembedded.org;
	Fri, 27 Apr 2012 12:57:03 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q3RAlPfW014905
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Apr 2012 11:47:25 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 12866-07 for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Apr 2012 11:47:21 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q3RAlFal014899
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Apr 2012 11:47:17 +0100
Message-ID: <1335523637.20130.57.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 27 Apr 2012 11:47:17 +0100
In-Reply-To: <94e2c16d1d19f800c14e012b0fc24b8117944652.1335498445.git.lianhao.lu@intel.com>
References: <f640dfb6acb1d703fefae61226547773f82a2a07.1335498445.git.lianhao.lu@intel.com>
	<94e2c16d1d19f800c14e012b0fc24b8117944652.1335498445.git.lianhao.lu@intel.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 5/7] alsa-utils: use base_libdir for udev rules.
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
X-List-Received-Date: Fri, 27 Apr 2012 10:57:03 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-04-27 at 13:04 +0800, Lianhao Lu wrote:
> Use the base_libdir to set the udev rules directory.
> 
> Signed-off-by: Lianhao Lu <lianhao.lu@intel.com>
> ---
>  meta/recipes-multimedia/alsa/alsa-utils_1.0.25.bb |    6 ++++--
>  1 files changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/recipes-multimedia/alsa/alsa-utils_1.0.25.bb b/meta/recipes-multimedia/alsa/alsa-utils_1.0.25.bb
> index 597e8b6..c39cd11 100644
> --- a/meta/recipes-multimedia/alsa/alsa-utils_1.0.25.bb
> +++ b/meta/recipes-multimedia/alsa/alsa-utils_1.0.25.bb
> @@ -6,7 +6,7 @@ LICENSE = "GPLv2+"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
>                      file://alsactl/utils.c;beginline=1;endline=20;md5=fe9526b055e246b5558809a5ae25c0b9"
>  DEPENDS = "alsa-lib ncurses libsamplerate0"
> -PR = "r2"
> +PR = "r3"
>  
>  SRC_URI = "ftp://ftp.alsa-project.org/pub/utils/alsa-utils-${PV}.tar.bz2 \
>             file://ncursesfix.patch \
> @@ -21,7 +21,9 @@ SRC_URI[sha256sum] = "2e676a2f634bbfe279b260e10a96f617cb72ee63c5bbf6c5f96bb61570
>  # http://bugs.openembedded.org/show_bug.cgi?id=2348
>  # please close bug and remove this comment when properly fixed
>  #
> -EXTRA_OECONF = "--disable-xmlto"
> +EXTRA_OECONF = "--disable-xmlto \
> +		--with-udev-rules-dir=${base_libdir}/udev/rules.d \
> +		"
>  EXTRA_OECONF_append_libc-uclibc = " --disable-nls"
>  
>  inherit autotools gettext

The udev configuration files are probably one case where using /lib
makes a lot of sense since we should only have one set of these. I
therefore think this should be added as an exception to the sanity
test...

Cheers,

Richard



