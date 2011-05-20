Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QNOGZ-0002ty-2I for openembedded-core@lists.openembedded.org;
	Fri, 20 May 2011 13:53:15 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4KBoKbM024735
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 May 2011 12:50:20 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 24662-02 for <openembedded-core@lists.openembedded.org>;
	Fri, 20 May 2011 12:50:16 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4KBoBY0024726
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 May 2011 12:50:11 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <d95f77d22bbe7bf5718516f667b3e1433757c861.1305849572.git.raj.khem@gmail.com>
References: <2cc9510de67bbf735856adb033c2eb352ffedc04.1305849572.git.raj.khem@gmail.com>
	<d95f77d22bbe7bf5718516f667b3e1433757c861.1305849572.git.raj.khem@gmail.com>
Date: Fri, 20 May 2011 12:50:05 +0100
Message-ID: <1305892205.3424.596.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCHv2 2/3] distcc_2.18.3.bb: Fix compilation on uclibc
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
X-List-Received-Date: Fri, 20 May 2011 11:53:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-05-19 at 17:02 -0700, Khem Raj wrote:
> We enable gtk/gnome in distcc that code uses loadavg()
> a function unimplemented in uclibc. Therefore for uclibc
> we disable gnome and gtk+ features in distcc
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-devtools/distcc/distcc_2.18.3.bb |   15 ++++++++++-----
>  1 files changed, 10 insertions(+), 5 deletions(-)

As Phil mentions, uclibc should probably be the exception here, not
glibc. I've therefore not taken it yet to see if we can come up with
anything better...

Cheers,

Richard

> diff --git a/meta/recipes-devtools/distcc/distcc_2.18.3.bb b/meta/recipes-devtools/distcc/distcc_2.18.3.bb
> index 1f5c2af..e73ce16 100644
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
> @@ -24,17 +25,21 @@ inherit autotools pkgconfig update-rc.d
>  
>  INITSCRIPT_NAME = "distcc"
>  
> -EXTRA_OECONF = " --with-gtk "
> -
> +EXTRA_OECONF_libc-glibc = " --with-gtk "
> +EXTRA_OECONF_libc-uclibc = " --without-gtk --without-gnome "
>  do_install_append() {
>      install -d ${D}${sysconfdir}/init.d/
>      install -d ${D}${sysconfdir}/default
>      install -m 0755 ${WORKDIR}/distcc ${D}${sysconfdir}/init.d/
>      install -m 0755 ${WORKDIR}/default ${D}${sysconfdir}/default/distcc
> +    ${DESKTOPINSTALL}
> +}
> +DESKTOPINSTALL = ""
> +DESKTOPINSTALL_libc-glibc () {
> +    install -d ${D}${datadir}/distcc/
>      install -m 0644 ${WORKDIR}/distccmon-gnome.desktop ${D}${datadir}/distcc/
>  }
> -
> -PACKAGES += "distcc-distmon-gnome"
> +PACKAGES_append_libc-glibc = " distcc-distmon-gnome"
>  
>  FILES_${PN} = " ${sysconfdir} \
>  		${bindir}/distcc \




