Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QNCC9-00021C-Hp for openembedded-core@lists.openembedded.org;
	Fri, 20 May 2011 00:59:53 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4JMunSA014479
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 May 2011 23:56:49 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 14260-04 for <openembedded-core@lists.openembedded.org>;
	Thu, 19 May 2011 23:56:45 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4JMugGk014473
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 May 2011 23:56:42 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <b1d1f4f3cdbfd52c547252d2c8663b5877bcc2ed.1305772107.git.raj.khem@gmail.com>
References: <cover.1305772107.git.raj.khem@gmail.com>
	<b1d1f4f3cdbfd52c547252d2c8663b5877bcc2ed.1305772107.git.raj.khem@gmail.com>
Date: Thu, 19 May 2011 23:56:38 +0100
Message-ID: <1305845798.3424.573.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 2/3] distcc_2.18.3.bb: Fix compilation on uclibc
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
X-List-Received-Date: Thu, 19 May 2011 22:59:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-05-18 at 19:29 -0700, Khem Raj wrote:
> We enable gtk/gnome in distcc that code uses loadavg()
> a function unimplemented in uclibc. Therefore for uclibc
> we disable gnome and gtk+ features in distcc
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-devtools/distcc/distcc_2.18.3.bb |   18 +++++++++++++-----
>  1 files changed, 13 insertions(+), 5 deletions(-)
> 
> diff --git a/meta/recipes-devtools/distcc/distcc_2.18.3.bb b/meta/recipes-devtools/distcc/distcc_2.18.3.bb
> index 1f5c2af..d6e51d9 100644
> --- a/meta/recipes-devtools/distcc/distcc_2.18.3.bb
> +++ b/meta/recipes-devtools/distcc/distcc_2.18.3.bb
> @@ -6,7 +6,8 @@ LICENSE = "GPLv2"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
>  PR = "r6"
>  
> -DEPENDS = "avahi gtk+"
> +DEPENDS = "avahi"
> +DEPENDS_append-libc-glibc = " gtk+ "
>  RRECOMMENDS_${PN} = "avahi-daemon"
>  
>  # Upstream change this patch periodically so store locally
> @@ -24,17 +25,24 @@ inherit autotools pkgconfig update-rc.d
>  
>  INITSCRIPT_NAME = "distcc"
>  
> -EXTRA_OECONF = " --with-gtk "
> -
> -do_install_append() {
> +EXTRA_OECONF_libc-glibc = " --with-gtk "
> +EXTRA_OECONF_libc-uclibc = " --without-gtk --without-gnome "
> +do_install_append_libc-glibc() {
>      install -d ${D}${sysconfdir}/init.d/
>      install -d ${D}${sysconfdir}/default
> +    install -d ${D}${datadir}/distcc/
>      install -m 0755 ${WORKDIR}/distcc ${D}${sysconfdir}/init.d/
>      install -m 0755 ${WORKDIR}/default ${D}${sysconfdir}/default/distcc
>      install -m 0644 ${WORKDIR}/distccmon-gnome.desktop ${D}${datadir}/distcc/
>  }
> +do_install_append_libc-uclibc() {
> +    install -d ${D}${sysconfdir}/init.d/
> +    install -d ${D}${sysconfdir}/default
> +    install -m 0755 ${WORKDIR}/distcc ${D}${sysconfdir}/init.d/
> +    install -m 0755 ${WORKDIR}/default ${D}${sysconfdir}/default/distcc
> +}
>  

You can surely come up with a patch without that code duplication
in? ;-)

Even something like:

do_install_append() {
   <common_code>
   ${DESKTOPINSTALL}
}
DESKTOPINSTALL = ""
DESKTOPINSTALL_libc-glibc () {
   <desktopinstall>
}


Cheers,

Richard



