Received: from mailout-de.gmx.net ([213.165.64.22])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1RYRP0-0006JS-UL
	for openembedded-core@lists.openembedded.org;
	Thu, 08 Dec 2011 00:59:55 +0100
Received: (qmail invoked by alias); 07 Dec 2011 23:53:05 -0000
Received: from p4FDF0CDD.dip.t-dialin.net (EHLO localhost.localdomain)
	[79.223.12.221]
	by mail.gmx.net (mp010) with SMTP; 08 Dec 2011 00:53:05 +0100
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX18VuKsEdNQVpKWgQokQt1sPdD1xMBxaKaan6sFK01
	NQgwfedTER7yzg
From: Andreas =?iso-8859-1?q?M=FCller?= <schnitzeltony@gmx.de>
To: "Patches and discussions about the oe-core layer"
	<openembedded-core@lists.openembedded.org>
Date: Thu, 8 Dec 2011 00:53:11 +0100
User-Agent: KMail/1.13.7 (Linux/2.6.35.14-103.fc14.x86_64; KDE/4.6.5; x86_64; ;
	)
References: <1323279247.30601.51.camel@ted>
In-Reply-To: <1323279247.30601.51.camel@ted>
MIME-Version: 1.0
Message-Id: <201112080053.11966.schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
Subject: Re: [PATCH] bitbake.conf/image.bbclass: Ensure images use the correct passwd/group files
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
X-List-Received-Date: Wed, 07 Dec 2011 23:59:55 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Wednesday, December 07, 2011 06:34:07 PM Richard Purdie wrote:
> We need pseudo to use the rootfs passwd/group files belonging to the
> rootfs when building images. This patch ensures that we use the rootfs
> files instead of those in the sysroot which can lead to incorrect file
> ownership issues.
> 
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> 
> diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
> index 4642fa6..865d430 100644
> --- a/meta/classes/image.bbclass
> +++ b/meta/classes/image.bbclass
> @@ -121,6 +121,8 @@ IMAGE_LINGUAS ?= "de-de fr-fr en-gb"
> 
>  LINGUAS_INSTALL = "${@" ".join(map(lambda s: "locale-base-%s" % s,
> d.getVar('IMAGE_LINGUAS', 1).split()))}"
> 
> +PSEUDO_PASSWD = "${IMAGE_ROOTFS}"
> +
>  do_rootfs[nostamp] = "1"
>  do_rootfs[dirs] = "${TOPDIR}"
>  do_rootfs[lockfiles] += "${IMAGE_ROOTFS}.lock"
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index e80cc32..eeb1fc4 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -580,11 +580,12 @@ SRC_URI = "file://${FILE}"
> 
>  # Use pseudo as the fakeroot implementation
>  PSEUDO_LOCALSTATEDIR ?= "${WORKDIR}/pseudo/"
> +PSEUDO_PASSWD ?= "${STAGING_DIR_TARGET}"
>  export PSEUDO_DISABLED = "1"
>  #export PSEUDO_PREFIX = "${STAGING_DIR_NATIVE}${prefix_native}"
>  #export PSEUDO_BINDIR = "${STAGING_DIR_NATIVE}${bindir_native}"
>  #export PSEUDO_LIBDIR =
> "${STAGING_DIR_NATIVE}$PSEUDOBINDIR/../lib/pseudo/lib -FAKEROOTENV =
> "PSEUDO_PREFIX=${STAGING_DIR_NATIVE}${prefix_native}
> PSEUDO_LOCALSTATEDIR=${PSEUDO_LOCALSTATEDIR}
> PSEUDO_PASSWD=${STAGING_DIR_TARGET} PSEUDO_NOSYMLINKEXP=1
> PSEUDO_DISABLED=0" +FAKEROOTENV =
> "PSEUDO_PREFIX=${STAGING_DIR_NATIVE}${prefix_native}
> PSEUDO_LOCALSTATEDIR=${PSEUDO_LOCALSTATEDIR}
> PSEUDO_PASSWD=${PSEUDO_PASSWD} PSEUDO_NOSYMLINKEXP=1 PSEUDO_DISABLED=0"
> FAKEROOTNOENV = "PSEUDO_UNLOAD=1"
>  FAKEROOTDIRS = "${PSEUDO_LOCALSTATEDIR}"
>  PREFERRED_PROVIDER_virtual/fakeroot-native ?= "pseudo-native"
dbus still needs manual call of 

	chown messagebus:messagebus /var/run/dbus /var/lib/dbus

( it is root:root on my image) and

	chown root:messagebus /usr/libexec/dbus-daemon-launch-helper

( it is avahi:netdev on my image )

Does this one fix it?
To test: Is it enough to rebuild dbus?

Andreas


