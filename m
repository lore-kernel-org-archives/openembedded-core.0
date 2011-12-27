Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Rfc62-0007GE-Iq
	for openembedded-core@lists.openembedded.org;
	Tue, 27 Dec 2011 19:49:58 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 27 Dec 2011 10:42:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="90729540"
Received: from unknown (HELO [10.255.12.84]) ([10.255.12.84])
	by orsmga001.jf.intel.com with ESMTP; 27 Dec 2011 10:42:45 -0800
Message-ID: <4EFA11A4.8030205@linux.intel.com>
Date: Tue, 27 Dec 2011 10:42:44 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1324991041.git.edwin.zhai@intel.com>
	<3bdd615755d7a911dbee7aaa2c86043c0caa351b.1324991041.git.edwin.zhai@intel.com>
In-Reply-To: <3bdd615755d7a911dbee7aaa2c86043c0caa351b.1324991041.git.edwin.zhai@intel.com>
Subject: Re: [PATCH 1/1] gnome-keyring: fix gsettings_data_convert seg fault
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
X-List-Received-Date: Tue, 27 Dec 2011 18:49:58 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/27/2011 05:06 AM, edwin.zhai@intel.com wrote:
> From: Zhai Edwin<edwin.zhai@intel.com>
>
> gsttings_data_convert cause seg fault as gnome-keyring's schema is not
> installed properly. As a fix, running glib-compile-schemas from glib-utils to
> made "gschemas.compiled".
>
> [YOCTO #1779] got fixed.
>
> Signed-off-by: Zhai Edwin<edwin.zhai@intel.com>
> ---
>   meta/recipes-gnome/gnome/gnome-keyring_2.32.1.bb |   12 ++++++++++--
>   1 files changed, 10 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-gnome/gnome/gnome-keyring_2.32.1.bb b/meta/recipes-gnome/gnome/gnome-keyring_2.32.1.bb
> index cc97225..a92ac4d 100644
> --- a/meta/recipes-gnome/gnome/gnome-keyring_2.32.1.bb
> +++ b/meta/recipes-gnome/gnome/gnome-keyring_2.32.1.bb
> @@ -11,12 +11,12 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
>
>   SECTION = "x11/gnome"
>
> -PR = "r3"
> +PR = "r4"
>
>   inherit autotools gnome pkgconfig
>
>   DEPENDS = "gtk+ libgcrypt libtasn1 libtasn1-native gconf ${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
> -RDEPENDS_${PN} = "libgnome-keyring"
> +RDEPENDS_${PN} = "libgnome-keyring glib-2.0-utils"
>
>   EXTRA_OECONF = "--disable-gtk-doc ${@base_contains('DISTRO_FEATURES', 'pam', '--enable-pam --with-pam-dir=${base_libdir}/security', '--disable-pam', d)}"
>
> @@ -30,6 +30,14 @@ do_install_append () {
>   	install -m 0644 ${WORKDIR}/org.gnome.keyring.service ${D}${datadir}/dbus-1/services
>   }
>
> +pkg_postinst_gnome-keyring () {

I think you can use pkg_postinst_${PN}

> +if [ "x$D" != "x" ]; then
> +    exit 1
> +fi
> +
> +test -x ${bindir}/glib-compile-schemas&&  glib-compile-schemas  ${datadir}/glib-2.0/schemas
> +}
> +
I think you are missing tabs here, I believe the standard for script 
functions is to have tabs not spaces also.

Sau!

>   FILES_${PN} += "${datadir}/dbus-1/services ${datadir}/gcr ${base_libdir}/security/*.so"
>   FILES_${PN}-dbg += "${libdir}/gnome-keyring/standalone/.debug/ ${base_libdir}/security/*.la"
>   FILES_${PN}-dbg += "${libdir}/gnome-keyring/devel/.debug/ ${base_libdir}/security/.debug"


