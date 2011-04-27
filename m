Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QFCbi-0000F1-Tq
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Apr 2011 23:49:15 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 27 Apr 2011 14:46:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,276,1301900400"; d="scan'208";a="635021599"
Received: from unknown (HELO [10.255.13.18]) ([10.255.13.18])
	by orsmga002.jf.intel.com with ESMTP; 27 Apr 2011 14:46:42 -0700
Message-ID: <4DB88EC1.8000703@linux.intel.com>
Date: Wed, 27 Apr 2011 14:46:41 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.10) Gecko/20100621 Fedora/3.0.5-1.fc13 Lightning/1.0b2pre
	Thunderbird/3.0.5
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1303921688-610-1-git-send-email-raj.khem@gmail.com>
In-Reply-To: <1303921688-610-1-git-send-email-raj.khem@gmail.com>
Subject: Re: [PATCH] recipes: Replace gconf-dbus with gconf
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
X-List-Received-Date: Wed, 27 Apr 2011 21:49:15 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 04/27/2011 09:28 AM, Khem Raj wrote:
> Some distributions e.g. angstrom do not support gconf-dbus
> anymore since its now provided by gconf and in oe-core we
> have PREFERRED_PROVIDER_gconf tunable, here we replace all
> dependencies on gconf-dbus with gconf, which should work
> in both cases where poky defines
> PREFERRED_PROVIDER-gconf = "gconf-dbus" and for angstrom
> it is simply gconf
>
> Without this meta-toolchain-sdk ends up with conflicts in
> runqueue and does not build
>
I think that we would need a generic gconf recipe also, since one of the 
goals is to build oe-core out of the box without any DISRO set by 
default, this would fail since there would be no generic gconf.

Sau!

> Signed-off-by: Khem Raj<raj.khem@gmail.com>
> ---
>   .../recipes-gnome/gnome/libgnomekbd_2.26.0.bb      |    2 +-
>   meta/recipes-gnome/gnome/gnome-desktop.inc         |    2 +-
>   meta/recipes-gnome/gthumb/gthumb_2.12.2.bb         |    2 +-
>   meta/recipes-gnome/tasks/task-sdk-gmae.inc         |    2 +-
>   meta/recipes-support/libproxy/libproxy_0.4.6.bb    |    2 +-
>   5 files changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/meta-demoapps/recipes-gnome/gnome/libgnomekbd_2.26.0.bb b/meta-demoapps/recipes-gnome/gnome/libgnomekbd_2.26.0.bb
> index f2e4ec5..68e4eee 100644
> --- a/meta-demoapps/recipes-gnome/gnome/libgnomekbd_2.26.0.bb
> +++ b/meta-demoapps/recipes-gnome/gnome/libgnomekbd_2.26.0.bb
> @@ -1,7 +1,7 @@
>   DESCRIPTION = "GNOME keyboard library"
>   LICENSE = "LGPL"
>
> -DEPENDS = "gconf-dbus dbus libxklavier gtk+"
> +DEPENDS = "gconf dbus libxklavier gtk+"
>
>   inherit gnome
>
> diff --git a/meta/recipes-gnome/gnome/gnome-desktop.inc b/meta/recipes-gnome/gnome/gnome-desktop.inc
> index 123f82d..336b87f 100644
> --- a/meta/recipes-gnome/gnome/gnome-desktop.inc
> +++ b/meta/recipes-gnome/gnome/gnome-desktop.inc
> @@ -1,7 +1,7 @@
>   DESCRIPTION = "GNOME library for reading .desktop files"
>   SECTION = "x11/gnome"
>   LICENSE = "GPLv2&  LGPLv2"
> -DEPENDS = "gconf-dbus libxrandr virtual/libx11 gtk+ glib-2.0 gnome-doc-utils"
> +DEPENDS = "gconf libxrandr virtual/libx11 gtk+ glib-2.0 gnome-doc-utils"
>
>   EXTRA_OECONF = "--disable-scrollkeeper --disable-desktop-docs"
>
> diff --git a/meta/recipes-gnome/gthumb/gthumb_2.12.2.bb b/meta/recipes-gnome/gthumb/gthumb_2.12.2.bb
> index 0b3bd1a..258f2d5 100644
> --- a/meta/recipes-gnome/gthumb/gthumb_2.12.2.bb
> +++ b/meta/recipes-gnome/gthumb/gthumb_2.12.2.bb
> @@ -2,7 +2,7 @@ DESCRIPTION = "gThumb is an image viewer and browser for the GNOME Desktop"
>   SECTION = "x11/gnome"
>   LICENSE = "GPLv2"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
> -DEPENDS = "glib-2.0 gtk+ libxml2 gnome-doc-utils libunique gconf-dbus libpng gstreamer jpeg tiff gst-plugins-base"
> +DEPENDS = "glib-2.0 gtk+ libxml2 gnome-doc-utils libunique gconf libpng gstreamer jpeg tiff gst-plugins-base"
>   PR = "r0"
>
>   EXTRA_OECONF = "--disable-gnome-keyring --disable-libsoup --disable-exiv2 --disable-clutter"
> diff --git a/meta/recipes-gnome/tasks/task-sdk-gmae.inc b/meta/recipes-gnome/tasks/task-sdk-gmae.inc
> index 2071089..0bf9d8b 100644
> --- a/meta/recipes-gnome/tasks/task-sdk-gmae.inc
> +++ b/meta/recipes-gnome/tasks/task-sdk-gmae.inc
> @@ -4,7 +4,7 @@ SDK-GMAE = " \
>       gtk+-dev \
>       gstreamer-dev \
>       bluez4-dev \
> -    gconf-dbus-dev \
> +    gconf-dev \
>       avahi-dev \
>       telepathy-glib-dev \
>       eds-dbus-dev \
> diff --git a/meta/recipes-support/libproxy/libproxy_0.4.6.bb b/meta/recipes-support/libproxy/libproxy_0.4.6.bb
> index 255cd5b..2e18065 100644
> --- a/meta/recipes-support/libproxy/libproxy_0.4.6.bb
> +++ b/meta/recipes-support/libproxy/libproxy_0.4.6.bb
> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=7d7044444a7b1b116e8783edcdb44ff4 \
>                       file://utils/proxy.c;beginline=1;endline=18;md5=55152a1006d7dafbef32baf9c30a99c0"
>
>
> -DEPENDS = "virtual/libx11 xmu gconf-dbus"
> +DEPENDS = "virtual/libx11 xmu gconf"
>
>   SRC_URI = "http://libproxy.googlecode.com/files/libproxy-${PV}.tar.gz"
>


