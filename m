Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QTsx1-000707-AO
	for openembedded-core@lists.openembedded.org;
	Tue, 07 Jun 2011 11:51:55 +0200
Received: by wwb17 with SMTP id 17so3961096wwb.24
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 Jun 2011 02:48:38 -0700 (PDT)
Received: by 10.227.162.133 with SMTP id v5mr5909727wbx.14.1307440117813;
	Tue, 07 Jun 2011 02:48:37 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id fl19sm1546684wbb.66.2011.06.07.02.48.36
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 07 Jun 2011 02:48:37 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <46fc6e81f626e87f30a0d0980ed2b8fc3747e6be.1307438945.git.kai.kang@windriver.com>
Date: Tue, 7 Jun 2011 11:48:35 +0200
Message-Id: <C2744CFA-2121-4B18-A9DB-98C4512092F1@dominion.thruhere.net>
References: <cover.1307438945.git.kai.kang@windriver.com>
	<46fc6e81f626e87f30a0d0980ed2b8fc3747e6be.1307438945.git.kai.kang@windriver.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: [PATCH 2/2] eglibc: migrate configurability from oe
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
X-List-Received-Date: Tue, 07 Jun 2011 09:51:55 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 7 jun 2011, om 11:42 heeft Kang Kai het volgende geschreven:

> From: Kang Kai <kai.kang@windriver.com>
>=20
> Migrate configurability from oe, try to shrink minimal image size
>=20
> Update to get eglibc configuration options from DISTRO_FEATURES and =
enable them. All
> the options are enabled by default.
>=20
> Uncomment the line in conf/local.extended.conf to define =
DISTRO_FEATURES, so put
> what options you want to enable there.
>=20
> Signed-off-by: Kang Kai <kai.kang@windriver.com>
> ---
> meta/conf/distro/include/default-distrovars.inc    |    8 ++-
> .../eglibc-2.13-fix-macro-RTLD_DEBUG.patch         |   20 ++++++
> meta/recipes-core/eglibc/eglibc-options.inc        |   62 =
++++++++++++++++++++
> meta/recipes-core/eglibc/eglibc.inc                |    6 ++
> meta/recipes-core/eglibc/eglibc_2.13.bb            |    4 +-
> 5 files changed, 98 insertions(+), 2 deletions(-)
> create mode 100644 =
meta/recipes-core/eglibc/eglibc-2.13/eglibc-2.13-fix-macro-RTLD_DEBUG.patc=
h
> create mode 100644 meta/recipes-core/eglibc/eglibc-options.inc
>=20
> diff --git a/meta/conf/distro/include/default-distrovars.inc =
b/meta/conf/distro/include/default-distrovars.inc
> index 4b68a0a..16ac681 100644
> --- a/meta/conf/distro/include/default-distrovars.inc
> +++ b/meta/conf/distro/include/default-distrovars.inc
> @@ -10,7 +10,13 @@ LIMIT_BUILT_LOCALES ?=3D "POSIX en_US en_GB"
> ENABLE_BINARY_LOCALE_GENERATION ?=3D "1"
> LOCALE_UTF8_ONLY ?=3D "0"
>=20
> -DISTRO_FEATURES ?=3D "alsa bluetooth ext2 irda pcmcia usbgadget =
usbhost wifi nfs zeroconf pci"
> +DISTRO_FEATURES ?=3D "alsa bluetooth ext2 irda pcmcia usbgadget =
usbhost wifi nfs zeroconf pci \
> +		libc-ipv6 libc-backtrace libc-big-macros libc-bsd =
libc-cxx-tests libc-catgets libc-charsets libc-crypt \
> +		libc-crypt-ufc libc-db-aliases libc-envz libc-fcvt =
libc-fmtmsg libc-fstab libc-ftraverse \
> +		libc-getlogin libc-idn libc-inet libc-inet-anl libc-libm =
libc-libm-big libc-locales libc-locale-code \
> +		libc-memusage libc-nis libc-nsswitch libc-rcmd =
libc-rtld-debug libc-spawn libc-streams libc-sunrpc \
> +		libc-utmp libc-utmpx libc-wordexp libc-posix-clang-wchar =
libc-posix-regexp libc-posix-regexp-glibc \
> +		libc-posix-wchar-io"

I think a seperate DISTRO_LIBC_FEATURES var would be cleaner and easier =
to override.

regards,

Koen=


