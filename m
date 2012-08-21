Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bogdan.a.marinescu@intel.com>) id 1T3kCi-0008Nn-8T
	for openembedded-core@lists.openembedded.org;
	Tue, 21 Aug 2012 10:52:53 +0200
Received: from mail-qa0-f52.google.com ([209.85.216.52])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 21 Aug 2012 01:40:46 -0700
Received: by qabg14 with SMTP id g14so3181724qab.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Aug 2012 01:40:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:x-gm-message-state;
	bh=zvz6sE6uBqMNLO59lC/cd2AzJO4ySsnxi1UILFJhWKo=;
	b=EC1bHz5Wph+rGDpoY2txbL8Ir25hDMaoazjJ6y7lF1fnlXG82dX1ioqA2fS+LMTevA
	IHjUP3BscbPlv3pl94NdpukkMgerGr/kxa72wNdJzdBAZP74v0O/NNh18CGobDXfUxPy
	kgSi4x8RH3SB6MRtc3+znxdg719jFT0tqFkldssxrfVzQ0Y1GFV9MUeta6e0m+NbtvAR
	5hba7P/vpzIceVYjLsxve6hvC7msPqocetffCukRiaVWua4eXm+mL0gN5g7lts7sTG5d
	MUsptInbY95SWdEDxiFJlra45M+cB8msYEVwmV6RWflcKw0sUNa0g/u5q6xl33uPHBrD
	YAHw==
Received: by 10.224.174.75 with SMTP id s11mr2851955qaz.88.1345538445624; Tue,
	21 Aug 2012 01:40:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.49.74.74 with HTTP; Tue, 21 Aug 2012 01:40:25 -0700 (PDT)
In-Reply-To: <1343893746-4260-1-git-send-email-bogdan.a.marinescu@intel.com>
References: <1343893746-4260-1-git-send-email-bogdan.a.marinescu@intel.com>
From: "Marinescu, Bogdan A" <bogdan.a.marinescu@intel.com>
Date: Tue, 21 Aug 2012 11:40:25 +0300
Message-ID: <CAMZjud3O9u4EyO8gt2wPYWW=N8vpJAHQp4y-4-UWU8TwMsS07A@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
X-Gm-Message-State: ALoCoQnW0CDnYqvbSw6CBYRJdsAG3JP1IChpVGynC/rO6t2uEE1y2FXf0ATvWG53wrpxJdSMYDcv
Subject: Re: [PATCH] [Multilib] Complete recipe enablement
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 21 Aug 2012 08:52:53 -0000
Content-Type: multipart/alternative; boundary=20cf3033481115474604c7c2953c

--20cf3033481115474604c7c2953c
Content-Type: text/plain; charset=ISO-8859-1

Resending.

On Thu, Aug 2, 2012 at 10:49 AM, Bogdan Marinescu <
bogdan.a.marinescu@intel.com> wrote:

> RP: The list of recipes in multilib.conf needs to go away and we need
> to just be able to extend all recipes with the multilib class.
> Tested by building and running lib32-core-image-sato-sdk.
>
> [YOCTO #1563]
>
> Signed-off-by: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
> ---
>  meta/classes/multilib.bbclass |    3 +
>  meta/conf/multilib.conf       |  745
> +----------------------------------------
>  2 files changed, 5 insertions(+), 743 deletions(-)
>
> diff --git a/meta/classes/multilib.bbclass b/meta/classes/multilib.bbclass
> index b92a3ff..b1a593e 100644
> --- a/meta/classes/multilib.bbclass
> +++ b/meta/classes/multilib.bbclass
> @@ -15,6 +15,9 @@ python multilib_virtclass_handler () {
>          e.data.setVar("PN", variant + "-" + e.data.getVar("PN", False))
>          return
>
> +    if bb.data.inherits_class('native', e.data):
> +        raise bb.parse.SkipPackage("We can't extend native recipes")
> +
>      save_var_name=e.data.getVar("MULTILIB_SAVE_VARNAME", True) or ""
>      for name in save_var_name.split():
>          val=e.data.getVar(name, True)
> diff --git a/meta/conf/multilib.conf b/meta/conf/multilib.conf
> index a23a0ee..a64fd2f 100644
> --- a/meta/conf/multilib.conf
> +++ b/meta/conf/multilib.conf
> @@ -12,746 +12,5 @@ STAGING_DIR_TARGET =
> "${STAGING_DIR}/${MLPREFIX}${MACHINE}"
>
>  INHERIT += "multilib_global"
>
> -BBCLASSEXTEND_append_pn-abiword-embedded = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-abiword = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-acl = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-acpid = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-adt-installer = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-alsa-lib = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-alsa-state = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-alsa-tools = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-alsa-utils = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-apmd = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-apr = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-apr-util = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-apt = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-aspell = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-atk = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-at = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-attr = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-augeas = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-autoconf = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-automake = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-avahi = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-avahi-ui = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-base-files = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-base-passwd = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-bash = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-bc = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-beagleboard-audio = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-beecrypt = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-bigreqsproto = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-bind = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-binutils-cross-canadian = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-binutils-cross = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-binutils = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-bison = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-blktool = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-blktrace = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-bluez4 = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-bluez-hcidump = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-boost = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-btrfs-tools = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-builder = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-busybox = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-byacc = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-bzip2 = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-cairo = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-calibrateproto = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-ccache = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-chkconfig = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-chrpath = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-claws-mail = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-claws-plugin-gtkhtml2-viewer = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-claws-plugin-maildir = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-claws-plugin-mailmbox = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-claws-plugin-rssyl = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-clipboard-manager = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-clutter-1.8 = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-clutter-box2d = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-clutter-gst-1.8 = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-clutter-gtk-1.8 = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-clutter = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-cmake = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-cogl = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-compositeproto = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-connman-gnome = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-connman = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-consolekit = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-console-tools = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-contacts = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-core-image-base = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-core-image-basic = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-core-image-clutter = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-core-image-core = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-core-image-gtk-directfb = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-core-image-lsb-dev = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-core-image-lsb = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-core-image-lsb-sdk = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-core-image-minimal-dev = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-core-image-minimal-initramfs = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-core-image-minimal-mtdutils = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-core-image-minimal = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-core-image-rt = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-core-image-rt-sdk = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-core-image-sato-dev = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-core-image-sato = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-core-image-sato-sdk = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-coreutils = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-cpio = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-cracklib = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-createrepo = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-cronie = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-cups = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-curl = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-cwautomacros = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-damageproto = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-dates = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-db = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-dbus-glib = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-dbus = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-dbus-wait = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-dhcp = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-diffstat = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-diffutils = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-directfb-examples = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-directfb = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-distcc = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-dmxproto = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-dosfstools = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-dpkg = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-dri2proto = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-dropbear = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-dtc = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-e2fsprogs = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-ed = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-evolution-data-server = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-eds-tools = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-eee-acpi-scripts = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-eglibc-initial = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-eglibc-locale = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-eglibc = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-elfutils = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-empathy = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-enchant = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-encodings = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-epdfview = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-ethtool = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-evieext = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-expat = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-external-csl-toolchain = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-external-poky-toolchain = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-external-python-tarball = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-farsight2 = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-file = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-findutils = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-fixesproto = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-flac = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-flex = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-font-alias = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-fontcacheproto = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-fontconfig = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-fontsproto = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-font-util = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-foomatic-filters = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-formfactor = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-fotowall = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-freetype = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-fstests = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-gail = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-gaku = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-galago-daemon = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-gamin = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-gawk = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-gcalctool = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-gcc-cross-canadian = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-gcc-cross-initial = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-gcc-cross-intermediate = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-gcc-cross = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-gcc-crosssdk-initial = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-gcc-crosssdk-intermediate = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-gccmakedep = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-gcc = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-gcc-runtime = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-gconf = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-gdb-cross-canadian = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-gdb-cross = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-gdbm = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-gdb = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-gdk-pixbuf = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-genext2fs = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-gettext = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-ghostscript = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-git = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-glew = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-glib-2.0 = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-glib-networking = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-glproto = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-gmp = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-gnome-common = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-gnome-desktop = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-gnome-doc-utils = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-gnome-icon-theme = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-gnome-keyring = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-gnome-mime-data = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-gnome-settings-daemon = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-gnome-terminal = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-gnu-config = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-gnupg = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-gnutls = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-gobject-introspection = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-gperf = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-gpgme = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-grep = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-groff = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-grub = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-gssdp = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-gst-ffmpeg = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-gst-fluendo-mp3 = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-gst-fluendo-mpegdemux = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-gst-meta-base = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-gst-openmax = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-gst-plugin-bluetooth = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-gst-plugins-bad = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-gst-plugins-base = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-gst-plugins-good = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-gst-plugins-ugly = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-gstreamer = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-gthumb = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-gtk-doc = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-gtk-engines = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-gtkhtml2 = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-gtk+ = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-gtk-sato-engine = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-gtk-theme-torturer = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-gupnp-av = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-gupnp = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-gupnp-tools = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-gypsy = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-gzip = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-hdparm = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-hello-mod = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-hicolor-icon-theme = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-hostap-conf = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-hostap-utils = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-icu = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-imake = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-initramfs-boot = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-initramfs-framework = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-initramfs-live-boot = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-initramfs-live-install = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-initscripts = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-inputproto = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-insserv = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-intltool = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-iproute2 = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-iptables = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-iputils = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-irda-utils = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-iso-codes = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-jpeg = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-js = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-json-glib = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-kbd = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-kbproto = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-kernelshark = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-kexec-tools = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-keymaps = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-kf = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-lame = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-latencytop = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-leafpad = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-less = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-liba52 = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-libacpi = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-libaio = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-libarchive = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-libart-lgpl = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-libassuan = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-libatomics-ops = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-libcanberra = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-libcap = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-libcheck = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-libconvert-asn1-perl = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-libcroco = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-libdaemon = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-libdmx = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-libdrm = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-liberation-fonts = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-libetpan = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-libevent = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-libexif = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-libfakekey = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-libffi = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-libfm = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-libfontenc = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-libfribidi = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-libgalago = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-libgcc = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-libgcrypt = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-libgdata = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-libgdbus = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-libglade = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-libgnomecanvas = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-libgnomekbd = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-libgnome-keyring = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-libgpg-error = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-libgsf = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-libgtkstylus = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-libical = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-libice = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-libiconv = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-libid3tag = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-libidn = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-libjson = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-libksba = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-liblbxutil = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-libmad = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-libmatchbox = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-libmpc = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-libmusicbrainz = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-libnewt = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-libnfsidmap = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-libnice = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-libnl = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-libnss-mdns = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-libogg = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-liboil = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-libomxil = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-libopensync = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-libopensync-plugin-evolution2 = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-libopensync-plugin-file = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-libopensync-plugin-google-calendar = "
> ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-libopensync-plugin-irmc = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-libopensync-plugin-syncml = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-libopensync-plugin-vformat = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-libowl-av = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-libowl = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-libpam = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-libpcap = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-libpciaccess = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-libpcre = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-libpng = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-libproxy = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-libpthread-stubs = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-librsvg = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-libsamplerate0 = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-libsdl = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-libsm = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-libsndfile1 = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-libsoup-2.4 = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-libsoup = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-libsyncml = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-libsync = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-libtasn1 = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-libtelepathy = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-libtheora = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-libtimedate-perl = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-libtirpc = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-libtool-cross = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-libtool = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-libunique = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-liburcu = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-liburi-perl = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-libusb1 = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-libusb-compat = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-libuser = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-libvorbis = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-libx11-diet = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-libx11 = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-libx11-trim = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-libxau = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-libxaw = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-libxcalibrate = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-libxcb = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-libxcomposite = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-libxcursor = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-libxdamage = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-libxdmcp = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-libxevie = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-libxext = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-libxfixes = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-libxfontcache = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-libxfont = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-libxft = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-libxi = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-libxinerama = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-libxkbfile = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-libxkbui = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-libxklavier = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-libxml2 = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-libxml-namespacesupport-perl = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-libxml-parser-perl = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-libxml-perl = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-libxml-sax-perl = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-libxml-simple-perl = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-libxmu = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-libxpm = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-libxp = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-libxprintapputil = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-libxprintutil = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-libxrandr = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-libxrender = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-libxres = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-libxscrnsaver = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-libxsettings-client = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-libxslt = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-libxt = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-libxtrap = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-libxtst = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-libxvmc = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-libxv = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-libxxf86dga = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-libxxf86misc = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-libxxf86vm = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-libzypp = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-lighttpd = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-linux-dummy = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-linux-firmware = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-linux-libc-headers = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-linux-libc-headers-yocto = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-linux-yocto = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-linux-yocto-rt = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-linux-yocto-tiny = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-logrotate = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-loudmouth = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-lrzsz = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-lsb = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-lsbsetup = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-lsbtest = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-lsbinitscripts = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-lsof = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-ltp = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-lttng-control = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-lttng-ust = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-lttng-viewer = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-lzo = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-lzop = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-m4 = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-mailx = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-makedepend = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-makedevs = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-make = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-man = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-man-pages = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-matchbox-config-gtk = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-matchbox-desktop = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-matchbox-desktop-sato = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-matchbox-keyboard = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-matchbox-panel-2 = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-matchbox-session = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-matchbox-session-sato = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-matchbox-stroke = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-matchbox-terminal = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-matchbox-theme-sato-2 = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-matchbox-theme-sato = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-matchbox-themes-extra = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-matchbox-themes-gtk = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-matchbox-wm-2 = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-matchbox-wm = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-mc = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-mdadm = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-menu-cache = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-mesa-demos = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-mesa-dri = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-mesa-xlib = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-metacity = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-meta-environment = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-meta-ide-support = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-meta-toolchain-gmae = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-meta-toolchain = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-meta-toolchain-qte = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-mingetty = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-minicom = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-mini-x-session = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-mkfontdir = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-mkfontscale = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-mktemp = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-mobile-broadband-provider-info = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-module-init-tools-cross = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-module-init-tools = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-kmod = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-modutils-initscripts = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-mpeg2dec = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-mpfr = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-msmtp = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-msynctool = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-mtd-utils = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-mtools = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-mutter = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-mx = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-nasm = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-ncurses = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-neon = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-netbase = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-net-tools = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-nfs-utils = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-ocf-linux = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-ofono = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-oh-puzzles = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-openobex = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-opensp = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-openssh = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-openssl = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-openswan = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-opkg-collateral = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-opkg-config-base = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-opkg = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-opkg-nogpg = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-opkg-utils = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-oprofile = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-oprofileui = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-orinoco-conf = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-owl-video = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-package-index = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-pango = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-parted = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-patch = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-pax = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-pax-utils = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-pciutils = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-pcmanfm = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-pcmciautils = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-perf = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-perl = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-pixman = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-pkgconfig = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-pm-utils = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-pointercal = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-poky-feed-config-opkg = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-polkit-gnome = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-polkit = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-pong-clock = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-poppler-data = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-poppler = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-popt = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-portmap = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-powertop = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-ppp-dialin = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-ppp = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-prelink = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-printproto = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-procps = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-pseudo = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-psmisc = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-psplash = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-pth = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-pulseaudio = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-puzzles = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-python-argparse = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-python-dbus = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-python-gst = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-python-imaging = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-python = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-python-pycairo = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-python-pycurl = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-python-pygobject = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-python-pygtk = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-python-pyrex = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-python-scons = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-python-setuptools = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-qemu-config = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-qemugl = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-qemu = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-qmmp = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-qt4e-demo-image = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-qt4-embedded = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-qt4-graphics-system = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-qt4-x11-free = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-qt-demo-init = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-qt-mobility-embedded = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-qt-mobility-x11 = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-quicky = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-quilt = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-quota = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-randrproto = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-readline = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-recordproto = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-renderproto = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-resolvconf = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-resourceproto = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-rgb = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-rpcbind = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-rpm = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-rsync = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-rt-tests = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-run-postinsts = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-rxvt-unicode = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-sato-icon-theme = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-sato-screenshot = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-sat-solver = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-screen = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-scrnsaverproto = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-sed = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-build-appliance-image = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-service = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-setserial = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-settings-daemon = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-sgml-common = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-shadow = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-shadow-securetty = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-shadow-sysroot = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-shared-mime-info = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-slang = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-socat = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-speex = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-sqlite3 = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-squashfs-tools = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-startup-notification = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-stat = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-strace = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-subversion = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-sudo = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-sysfsutils = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-sysklogd = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-syslinux = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-sysprof = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-sysstat = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-systemtap = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-sysvinit-inittab = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-sysvinit = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-taglib = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-tar = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-task-base = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-task-core-apps-x11-pimlico = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-task-core-basic = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-task-core-boot = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-task-core-clutter = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-task-core-console = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-task-core-gtk-directfb = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-task-core-lsb = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-task-core-nfs = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-task-core-qt = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-task-core-sdk-gmae = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-task-core-sdk = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-task-core-ssh-dropbear = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-task-core-ssh-openssh = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-task-core-tools-debug = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-task-core-tools-profile = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-task-core-tools-testapps = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-task-core-standalone-gmae-sdk-target = "
> ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-task-core-standalone-sdk-target = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-task-core-tools = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-task-core-x11-mini = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-task-core-x11 = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-task-core-x11-sato = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-task-cross-canadian = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-task-qt4e = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-task-qte-toolchain-target = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-task-self-hosted = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-tasks = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-tcf-agent = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-tcl = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-tcp-wrappers = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-telepathy-farsight = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-telepathy-gabble = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-telepathy-glib = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-telepathy-idle = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-telepathy-mission-control = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-telepathy-python = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-texi2html = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-texinfo = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-tidy = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-tiff = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-time = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-tinylogin = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-trace-cmd = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-trapproto = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-tremor = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-tslib = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-ttf-bitstream-vera = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-tzdata = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-ubootchart = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-u-boot-mkimage = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-u-boot = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-uclibc-initial = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-uclibc = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-udev-extraconf = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-udev = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-unfs-server = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-unzip = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-update-modules = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-update-rc.d = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-usbinit = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-usbutils = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-useradd-example = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-util-linux = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-util-macros = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-v86d = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-valgrind = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-videoproto = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-vte = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-watchdog = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-wbxml2 = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-webkit-gtk = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-web = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-web-webkit = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-wget = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-which = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-wireless-tools = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-wpa-supplicant = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-wv = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-x11-common = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-x11perf = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-x11vnc = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-xauth = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-xbacklight = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-xcb-proto = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-xcb-util = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-xcmiscproto = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-xcursor-transparent-theme = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-xdg-utils = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-xdpyinfo = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-xev = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-xextproto = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-xeyes = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-xf86bigfontproto = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-xf86dgaproto = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-xf86driproto = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-xf86-input-evdev = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-xf86-input-keyboard = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-xf86-input-mouse = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-xf86-input-synaptics = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-xf86-input-vmmouse = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-xf86miscproto = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-xf86rushproto = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-xf86-video-fbdev = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-xf86-video-intel = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-xf86-video-omapfb = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-xf86-video-vesa = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-xf86-video-vmware = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-xf86vidmodeproto = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-xhost = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-xineramaproto = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-xinetd = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-xinit = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-xkbcomp = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-xkeyboard-config = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-x-load = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-xmodmap = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-xorg-cf-files = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-xorg-minimal-fonts = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-xournal = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-xprop = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-xproto = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-xproxymanagementprotocol = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-xrandr = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-xrdb = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-xrestop = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-xserver-kdrive = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-xserver-nodm-init = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-xserver-xf86-config = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-xserver-xorg-lite = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-xserver-xorg = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-xset = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-xtrans = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-xtscal = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-xvideo-tests = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-xvinfo = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-xwininfo = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-xz = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-zaurusd = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-zeroconf = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-zip = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-zlib = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-zypper = " ${MULTILIBS}"
> +BBCLASSEXTEND_append = " ${MULTILIBS}"
> +
> --
> 1.7.9.5
>
>

--20cf3033481115474604c7c2953c
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Resending.<br><br><div class=3D"gmail_quote">On Thu, Aug 2, 2012 at 10:49 A=
M, Bogdan Marinescu <span dir=3D"ltr">&lt;<a href=3D"mailto:bogdan.a.marine=
scu@intel.com" target=3D"_blank">bogdan.a.marinescu@intel.com</a>&gt;</span=
> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">RP: The list of recipes in multilib.conf nee=
ds to go away and we need<br>
to just be able to extend all recipes with the multilib class.<br>
Tested by building and running lib32-core-image-sato-sdk.<br>
<br>
[YOCTO #1563]<br>
<br>
Signed-off-by: Bogdan Marinescu &lt;<a href=3D"mailto:bogdan.a.marinescu@in=
tel.com">bogdan.a.marinescu@intel.com</a>&gt;<br>
---<br>
=A0meta/classes/multilib.bbclass | =A0 =A03 +<br>
=A0meta/conf/multilib.conf =A0 =A0 =A0 | =A0745 +--------------------------=
--------------<br>
=A02 files changed, 5 insertions(+), 743 deletions(-)<br>
<br>
diff --git a/meta/classes/multilib.bbclass b/meta/classes/multilib.bbclass<=
br>
index b92a3ff..b1a593e 100644<br>
--- a/meta/classes/multilib.bbclass<br>
+++ b/meta/classes/multilib.bbclass<br>
@@ -15,6 +15,9 @@ python multilib_virtclass_handler () {<br>
=A0 =A0 =A0 =A0 =A0e.data.setVar(&quot;PN&quot;, variant + &quot;-&quot; + =
e.data.getVar(&quot;PN&quot;, False))<br>
=A0 =A0 =A0 =A0 =A0return<br>
<br>
+ =A0 =A0if bb.data.inherits_class(&#39;native&#39;, e.data):<br>
+ =A0 =A0 =A0 =A0raise bb.parse.SkipPackage(&quot;We can&#39;t extend nativ=
e recipes&quot;)<br>
+<br>
=A0 =A0 =A0save_var_name=3De.data.getVar(&quot;MULTILIB_SAVE_VARNAME&quot;,=
 True) or &quot;&quot;<br>
=A0 =A0 =A0for name in save_var_name.split():<br>
=A0 =A0 =A0 =A0 =A0val=3De.data.getVar(name, True)<br>
diff --git a/meta/conf/multilib.conf b/meta/conf/multilib.conf<br>
index a23a0ee..a64fd2f 100644<br>
--- a/meta/conf/multilib.conf<br>
+++ b/meta/conf/multilib.conf<br>
@@ -12,746 +12,5 @@ STAGING_DIR_TARGET =3D &quot;${STAGING_DIR}/${MLPREFIX}=
${MACHINE}&quot;<br>
<br>
=A0INHERIT +=3D &quot;multilib_global&quot;<br>
<br>
-BBCLASSEXTEND_append_pn-abiword-embedded =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-abiword =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-acl =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-acpid =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-adt-installer =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-alsa-lib =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-alsa-state =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-alsa-tools =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-alsa-utils =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-apmd =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-apr =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-apr-util =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-apt =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-aspell =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-atk =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-at =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-attr =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-augeas =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-autoconf =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-automake =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-avahi =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-avahi-ui =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-base-files =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-base-passwd =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-bash =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-bc =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-beagleboard-audio =3D &quot; ${MULTILIBS}&quot;<br=
>
-BBCLASSEXTEND_append_pn-beecrypt =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-bigreqsproto =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-bind =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-binutils-cross-canadian =3D &quot; ${MULTILIBS}&qu=
ot;<br>
-BBCLASSEXTEND_append_pn-binutils-cross =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-binutils =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-bison =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-blktool =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-blktrace =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-bluez4 =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-bluez-hcidump =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-boost =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-btrfs-tools =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-builder =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-busybox =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-byacc =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-bzip2 =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-cairo =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-calibrateproto =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-ccache =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-chkconfig =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-chrpath =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-claws-mail =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-claws-plugin-gtkhtml2-viewer =3D &quot; ${MULTILIB=
S}&quot;<br>
-BBCLASSEXTEND_append_pn-claws-plugin-maildir =3D &quot; ${MULTILIBS}&quot;=
<br>
-BBCLASSEXTEND_append_pn-claws-plugin-mailmbox =3D &quot; ${MULTILIBS}&quot=
;<br>
-BBCLASSEXTEND_append_pn-claws-plugin-rssyl =3D &quot; ${MULTILIBS}&quot;<b=
r>
-BBCLASSEXTEND_append_pn-clipboard-manager =3D &quot; ${MULTILIBS}&quot;<br=
>
-BBCLASSEXTEND_append_pn-clutter-1.8 =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-clutter-box2d =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-clutter-gst-1.8 =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-clutter-gtk-1.8 =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-clutter =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-cmake =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-cogl =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-compositeproto =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-connman-gnome =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-connman =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-consolekit =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-console-tools =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-contacts =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-core-image-base =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-core-image-basic =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-core-image-clutter =3D &quot; ${MULTILIBS}&quot;<b=
r>
-BBCLASSEXTEND_append_pn-core-image-core =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-core-image-gtk-directfb =3D &quot; ${MULTILIBS}&qu=
ot;<br>
-BBCLASSEXTEND_append_pn-core-image-lsb-dev =3D &quot; ${MULTILIBS}&quot;<b=
r>
-BBCLASSEXTEND_append_pn-core-image-lsb =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-core-image-lsb-sdk =3D &quot; ${MULTILIBS}&quot;<b=
r>
-BBCLASSEXTEND_append_pn-core-image-minimal-dev =3D &quot; ${MULTILIBS}&quo=
t;<br>
-BBCLASSEXTEND_append_pn-core-image-minimal-initramfs =3D &quot; ${MULTILIB=
S}&quot;<br>
-BBCLASSEXTEND_append_pn-core-image-minimal-mtdutils =3D &quot; ${MULTILIBS=
}&quot;<br>
-BBCLASSEXTEND_append_pn-core-image-minimal =3D &quot; ${MULTILIBS}&quot;<b=
r>
-BBCLASSEXTEND_append_pn-core-image-rt =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-core-image-rt-sdk =3D &quot; ${MULTILIBS}&quot;<br=
>
-BBCLASSEXTEND_append_pn-core-image-sato-dev =3D &quot; ${MULTILIBS}&quot;<=
br>
-BBCLASSEXTEND_append_pn-core-image-sato =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-core-image-sato-sdk =3D &quot; ${MULTILIBS}&quot;<=
br>
-BBCLASSEXTEND_append_pn-coreutils =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-cpio =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-cracklib =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-createrepo =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-cronie =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-cups =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-curl =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-cwautomacros =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-damageproto =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-dates =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-db =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-dbus-glib =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-dbus =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-dbus-wait =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-dhcp =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-diffstat =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-diffutils =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-directfb-examples =3D &quot; ${MULTILIBS}&quot;<br=
>
-BBCLASSEXTEND_append_pn-directfb =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-distcc =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-dmxproto =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-dosfstools =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-dpkg =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-dri2proto =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-dropbear =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-dtc =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-e2fsprogs =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-ed =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-evolution-data-server =3D &quot; ${MULTILIBS}&quot=
;<br>
-BBCLASSEXTEND_append_pn-eds-tools =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-eee-acpi-scripts =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-eglibc-initial =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-eglibc-locale =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-eglibc =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-elfutils =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-empathy =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-enchant =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-encodings =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-epdfview =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-ethtool =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-evieext =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-expat =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-external-csl-toolchain =3D &quot; ${MULTILIBS}&quo=
t;<br>
-BBCLASSEXTEND_append_pn-external-poky-toolchain =3D &quot; ${MULTILIBS}&qu=
ot;<br>
-BBCLASSEXTEND_append_pn-external-python-tarball =3D &quot; ${MULTILIBS}&qu=
ot;<br>
-BBCLASSEXTEND_append_pn-farsight2 =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-file =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-findutils =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-fixesproto =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-flac =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-flex =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-font-alias =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-fontcacheproto =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-fontconfig =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-fontsproto =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-font-util =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-foomatic-filters =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-formfactor =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-fotowall =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-freetype =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-fstests =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-gail =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-gaku =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-galago-daemon =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-gamin =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-gawk =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-gcalctool =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-gcc-cross-canadian =3D &quot; ${MULTILIBS}&quot;<b=
r>
-BBCLASSEXTEND_append_pn-gcc-cross-initial =3D &quot; ${MULTILIBS}&quot;<br=
>
-BBCLASSEXTEND_append_pn-gcc-cross-intermediate =3D &quot; ${MULTILIBS}&quo=
t;<br>
-BBCLASSEXTEND_append_pn-gcc-cross =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-gcc-crosssdk-initial =3D &quot; ${MULTILIBS}&quot;=
<br>
-BBCLASSEXTEND_append_pn-gcc-crosssdk-intermediate =3D &quot; ${MULTILIBS}&=
quot;<br>
-BBCLASSEXTEND_append_pn-gccmakedep =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-gcc =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-gcc-runtime =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-gconf =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-gdb-cross-canadian =3D &quot; ${MULTILIBS}&quot;<b=
r>
-BBCLASSEXTEND_append_pn-gdb-cross =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-gdbm =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-gdb =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-gdk-pixbuf =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-genext2fs =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-gettext =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-ghostscript =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-git =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-glew =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-glib-2.0 =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-glib-networking =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-glproto =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-gmp =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-gnome-common =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-gnome-desktop =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-gnome-doc-utils =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-gnome-icon-theme =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-gnome-keyring =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-gnome-mime-data =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-gnome-settings-daemon =3D &quot; ${MULTILIBS}&quot=
;<br>
-BBCLASSEXTEND_append_pn-gnome-terminal =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-gnu-config =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-gnupg =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-gnutls =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-gobject-introspection =3D &quot; ${MULTILIBS}&quot=
;<br>
-BBCLASSEXTEND_append_pn-gperf =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-gpgme =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-grep =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-groff =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-grub =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-gssdp =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-gst-ffmpeg =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-gst-fluendo-mp3 =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-gst-fluendo-mpegdemux =3D &quot; ${MULTILIBS}&quot=
;<br>
-BBCLASSEXTEND_append_pn-gst-meta-base =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-gst-openmax =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-gst-plugin-bluetooth =3D &quot; ${MULTILIBS}&quot;=
<br>
-BBCLASSEXTEND_append_pn-gst-plugins-bad =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-gst-plugins-base =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-gst-plugins-good =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-gst-plugins-ugly =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-gstreamer =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-gthumb =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-gtk-doc =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-gtk-engines =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-gtkhtml2 =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-gtk+ =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-gtk-sato-engine =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-gtk-theme-torturer =3D &quot; ${MULTILIBS}&quot;<b=
r>
-BBCLASSEXTEND_append_pn-gupnp-av =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-gupnp =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-gupnp-tools =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-gypsy =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-gzip =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-hdparm =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-hello-mod =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-hicolor-icon-theme =3D &quot; ${MULTILIBS}&quot;<b=
r>
-BBCLASSEXTEND_append_pn-hostap-conf =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-hostap-utils =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-icu =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-imake =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-initramfs-boot =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-initramfs-framework =3D &quot; ${MULTILIBS}&quot;<=
br>
-BBCLASSEXTEND_append_pn-initramfs-live-boot =3D &quot; ${MULTILIBS}&quot;<=
br>
-BBCLASSEXTEND_append_pn-initramfs-live-install =3D &quot; ${MULTILIBS}&quo=
t;<br>
-BBCLASSEXTEND_append_pn-initscripts =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-inputproto =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-insserv =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-intltool =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-iproute2 =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-iptables =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-iputils =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-irda-utils =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-iso-codes =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-jpeg =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-js =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-json-glib =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-kbd =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-kbproto =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-kernelshark =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-kexec-tools =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-keymaps =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-kf =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-lame =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-latencytop =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-leafpad =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-less =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-liba52 =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-libacpi =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-libaio =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-libarchive =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-libart-lgpl =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-libassuan =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-libatomics-ops =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-libcanberra =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-libcap =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-libcheck =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-libconvert-asn1-perl =3D &quot; ${MULTILIBS}&quot;=
<br>
-BBCLASSEXTEND_append_pn-libcroco =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-libdaemon =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-libdmx =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-libdrm =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-liberation-fonts =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-libetpan =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-libevent =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-libexif =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-libfakekey =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-libffi =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-libfm =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-libfontenc =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-libfribidi =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-libgalago =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-libgcc =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-libgcrypt =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-libgdata =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-libgdbus =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-libglade =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-libgnomecanvas =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-libgnomekbd =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-libgnome-keyring =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-libgpg-error =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-libgsf =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-libgtkstylus =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-libical =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-libice =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-libiconv =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-libid3tag =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-libidn =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-libjson =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-libksba =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-liblbxutil =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-libmad =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-libmatchbox =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-libmpc =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-libmusicbrainz =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-libnewt =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-libnfsidmap =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-libnice =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-libnl =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-libnss-mdns =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-libogg =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-liboil =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-libomxil =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-libopensync =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-libopensync-plugin-evolution2 =3D &quot; ${MULTILI=
BS}&quot;<br>
-BBCLASSEXTEND_append_pn-libopensync-plugin-file =3D &quot; ${MULTILIBS}&qu=
ot;<br>
-BBCLASSEXTEND_append_pn-libopensync-plugin-google-calendar =3D &quot; ${MU=
LTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-libopensync-plugin-irmc =3D &quot; ${MULTILIBS}&qu=
ot;<br>
-BBCLASSEXTEND_append_pn-libopensync-plugin-syncml =3D &quot; ${MULTILIBS}&=
quot;<br>
-BBCLASSEXTEND_append_pn-libopensync-plugin-vformat =3D &quot; ${MULTILIBS}=
&quot;<br>
-BBCLASSEXTEND_append_pn-libowl-av =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-libowl =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-libpam =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-libpcap =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-libpciaccess =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-libpcre =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-libpng =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-libproxy =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-libpthread-stubs =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-librsvg =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-libsamplerate0 =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-libsdl =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-libsm =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-libsndfile1 =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-libsoup-2.4 =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-libsoup =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-libsyncml =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-libsync =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-libtasn1 =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-libtelepathy =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-libtheora =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-libtimedate-perl =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-libtirpc =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-libtool-cross =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-libtool =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-libunique =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-liburcu =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-liburi-perl =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-libusb1 =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-libusb-compat =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-libuser =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-libvorbis =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-libx11-diet =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-libx11 =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-libx11-trim =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-libxau =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-libxaw =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-libxcalibrate =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-libxcb =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-libxcomposite =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-libxcursor =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-libxdamage =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-libxdmcp =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-libxevie =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-libxext =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-libxfixes =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-libxfontcache =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-libxfont =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-libxft =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-libxi =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-libxinerama =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-libxkbfile =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-libxkbui =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-libxklavier =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-libxml2 =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-libxml-namespacesupport-perl =3D &quot; ${MULTILIB=
S}&quot;<br>
-BBCLASSEXTEND_append_pn-libxml-parser-perl =3D &quot; ${MULTILIBS}&quot;<b=
r>
-BBCLASSEXTEND_append_pn-libxml-perl =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-libxml-sax-perl =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-libxml-simple-perl =3D &quot; ${MULTILIBS}&quot;<b=
r>
-BBCLASSEXTEND_append_pn-libxmu =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-libxpm =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-libxp =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-libxprintapputil =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-libxprintutil =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-libxrandr =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-libxrender =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-libxres =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-libxscrnsaver =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-libxsettings-client =3D &quot; ${MULTILIBS}&quot;<=
br>
-BBCLASSEXTEND_append_pn-libxslt =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-libxt =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-libxtrap =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-libxtst =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-libxvmc =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-libxv =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-libxxf86dga =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-libxxf86misc =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-libxxf86vm =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-libzypp =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-lighttpd =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-linux-dummy =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-linux-firmware =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-linux-libc-headers =3D &quot; ${MULTILIBS}&quot;<b=
r>
-BBCLASSEXTEND_append_pn-linux-libc-headers-yocto =3D &quot; ${MULTILIBS}&q=
uot;<br>
-BBCLASSEXTEND_append_pn-linux-yocto =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-linux-yocto-rt =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-linux-yocto-tiny =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-logrotate =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-loudmouth =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-lrzsz =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-lsb =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-lsbsetup =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-lsbtest =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-lsbinitscripts =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-lsof =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-ltp =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-lttng-control =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-lttng-ust =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-lttng-viewer =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-lzo =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-lzop =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-m4 =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-mailx =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-makedepend =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-makedevs =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-make =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-man =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-man-pages =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-matchbox-config-gtk =3D &quot; ${MULTILIBS}&quot;<=
br>
-BBCLASSEXTEND_append_pn-matchbox-desktop =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-matchbox-desktop-sato =3D &quot; ${MULTILIBS}&quot=
;<br>
-BBCLASSEXTEND_append_pn-matchbox-keyboard =3D &quot; ${MULTILIBS}&quot;<br=
>
-BBCLASSEXTEND_append_pn-matchbox-panel-2 =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-matchbox-session =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-matchbox-session-sato =3D &quot; ${MULTILIBS}&quot=
;<br>
-BBCLASSEXTEND_append_pn-matchbox-stroke =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-matchbox-terminal =3D &quot; ${MULTILIBS}&quot;<br=
>
-BBCLASSEXTEND_append_pn-matchbox-theme-sato-2 =3D &quot; ${MULTILIBS}&quot=
;<br>
-BBCLASSEXTEND_append_pn-matchbox-theme-sato =3D &quot; ${MULTILIBS}&quot;<=
br>
-BBCLASSEXTEND_append_pn-matchbox-themes-extra =3D &quot; ${MULTILIBS}&quot=
;<br>
-BBCLASSEXTEND_append_pn-matchbox-themes-gtk =3D &quot; ${MULTILIBS}&quot;<=
br>
-BBCLASSEXTEND_append_pn-matchbox-wm-2 =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-matchbox-wm =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-mc =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-mdadm =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-menu-cache =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-mesa-demos =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-mesa-dri =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-mesa-xlib =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-metacity =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-meta-environment =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-meta-ide-support =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-meta-toolchain-gmae =3D &quot; ${MULTILIBS}&quot;<=
br>
-BBCLASSEXTEND_append_pn-meta-toolchain =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-meta-toolchain-qte =3D &quot; ${MULTILIBS}&quot;<b=
r>
-BBCLASSEXTEND_append_pn-mingetty =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-minicom =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-mini-x-session =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-mkfontdir =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-mkfontscale =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-mktemp =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-mobile-broadband-provider-info =3D &quot; ${MULTIL=
IBS}&quot;<br>
-BBCLASSEXTEND_append_pn-module-init-tools-cross =3D &quot; ${MULTILIBS}&qu=
ot;<br>
-BBCLASSEXTEND_append_pn-module-init-tools =3D &quot; ${MULTILIBS}&quot;<br=
>
-BBCLASSEXTEND_append_pn-kmod =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-modutils-initscripts =3D &quot; ${MULTILIBS}&quot;=
<br>
-BBCLASSEXTEND_append_pn-mpeg2dec =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-mpfr =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-msmtp =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-msynctool =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-mtd-utils =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-mtools =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-mutter =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-mx =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-nasm =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-ncurses =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-neon =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-netbase =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-net-tools =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-nfs-utils =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-ocf-linux =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-ofono =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-oh-puzzles =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-openobex =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-opensp =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-openssh =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-openssl =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-openswan =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-opkg-collateral =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-opkg-config-base =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-opkg =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-opkg-nogpg =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-opkg-utils =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-oprofile =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-oprofileui =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-orinoco-conf =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-owl-video =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-package-index =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-pango =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-parted =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-patch =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-pax =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-pax-utils =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-pciutils =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-pcmanfm =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-pcmciautils =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-perf =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-perl =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-pixman =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-pkgconfig =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-pm-utils =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-pointercal =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-poky-feed-config-opkg =3D &quot; ${MULTILIBS}&quot=
;<br>
-BBCLASSEXTEND_append_pn-polkit-gnome =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-polkit =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-pong-clock =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-poppler-data =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-poppler =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-popt =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-portmap =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-powertop =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-ppp-dialin =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-ppp =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-prelink =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-printproto =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-procps =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-pseudo =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-psmisc =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-psplash =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-pth =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-pulseaudio =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-puzzles =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-python-argparse =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-python-dbus =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-python-gst =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-python-imaging =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-python =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-python-pycairo =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-python-pycurl =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-python-pygobject =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-python-pygtk =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-python-pyrex =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-python-scons =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-python-setuptools =3D &quot; ${MULTILIBS}&quot;<br=
>
-BBCLASSEXTEND_append_pn-qemu-config =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-qemugl =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-qemu =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-qmmp =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-qt4e-demo-image =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-qt4-embedded =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-qt4-graphics-system =3D &quot; ${MULTILIBS}&quot;<=
br>
-BBCLASSEXTEND_append_pn-qt4-x11-free =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-qt-demo-init =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-qt-mobility-embedded =3D &quot; ${MULTILIBS}&quot;=
<br>
-BBCLASSEXTEND_append_pn-qt-mobility-x11 =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-quicky =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-quilt =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-quota =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-randrproto =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-readline =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-recordproto =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-renderproto =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-resolvconf =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-resourceproto =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-rgb =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-rpcbind =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-rpm =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-rsync =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-rt-tests =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-run-postinsts =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-rxvt-unicode =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-sato-icon-theme =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-sato-screenshot =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-sat-solver =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-screen =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-scrnsaverproto =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-sed =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-build-appliance-image =3D &quot; ${MULTILIBS}&quot=
;<br>
-BBCLASSEXTEND_append_pn-service =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-setserial =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-settings-daemon =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-sgml-common =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-shadow =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-shadow-securetty =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-shadow-sysroot =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-shared-mime-info =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-slang =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-socat =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-speex =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-sqlite3 =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-squashfs-tools =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-startup-notification =3D &quot; ${MULTILIBS}&quot;=
<br>
-BBCLASSEXTEND_append_pn-stat =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-strace =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-subversion =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-sudo =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-sysfsutils =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-sysklogd =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-syslinux =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-sysprof =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-sysstat =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-systemtap =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-sysvinit-inittab =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-sysvinit =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-taglib =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-tar =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-task-base =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-task-core-apps-x11-pimlico =3D &quot; ${MULTILIBS}=
&quot;<br>
-BBCLASSEXTEND_append_pn-task-core-basic =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-task-core-boot =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-task-core-clutter =3D &quot; ${MULTILIBS}&quot;<br=
>
-BBCLASSEXTEND_append_pn-task-core-console =3D &quot; ${MULTILIBS}&quot;<br=
>
-BBCLASSEXTEND_append_pn-task-core-gtk-directfb =3D &quot; ${MULTILIBS}&quo=
t;<br>
-BBCLASSEXTEND_append_pn-task-core-lsb =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-task-core-nfs =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-task-core-qt =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-task-core-sdk-gmae =3D &quot; ${MULTILIBS}&quot;<b=
r>
-BBCLASSEXTEND_append_pn-task-core-sdk =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-task-core-ssh-dropbear =3D &quot; ${MULTILIBS}&quo=
t;<br>
-BBCLASSEXTEND_append_pn-task-core-ssh-openssh =3D &quot; ${MULTILIBS}&quot=
;<br>
-BBCLASSEXTEND_append_pn-task-core-tools-debug =3D &quot; ${MULTILIBS}&quot=
;<br>
-BBCLASSEXTEND_append_pn-task-core-tools-profile =3D &quot; ${MULTILIBS}&qu=
ot;<br>
-BBCLASSEXTEND_append_pn-task-core-tools-testapps =3D &quot; ${MULTILIBS}&q=
uot;<br>
-BBCLASSEXTEND_append_pn-task-core-standalone-gmae-sdk-target =3D &quot; ${=
MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-task-core-standalone-sdk-target =3D &quot; ${MULTI=
LIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-task-core-tools =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-task-core-x11-mini =3D &quot; ${MULTILIBS}&quot;<b=
r>
-BBCLASSEXTEND_append_pn-task-core-x11 =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-task-core-x11-sato =3D &quot; ${MULTILIBS}&quot;<b=
r>
-BBCLASSEXTEND_append_pn-task-cross-canadian =3D &quot; ${MULTILIBS}&quot;<=
br>
-BBCLASSEXTEND_append_pn-task-qt4e =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-task-qte-toolchain-target =3D &quot; ${MULTILIBS}&=
quot;<br>
-BBCLASSEXTEND_append_pn-task-self-hosted =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-tasks =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-tcf-agent =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-tcl =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-tcp-wrappers =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-telepathy-farsight =3D &quot; ${MULTILIBS}&quot;<b=
r>
-BBCLASSEXTEND_append_pn-telepathy-gabble =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-telepathy-glib =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-telepathy-idle =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-telepathy-mission-control =3D &quot; ${MULTILIBS}&=
quot;<br>
-BBCLASSEXTEND_append_pn-telepathy-python =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-texi2html =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-texinfo =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-tidy =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-tiff =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-time =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-tinylogin =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-trace-cmd =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-trapproto =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-tremor =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-tslib =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-ttf-bitstream-vera =3D &quot; ${MULTILIBS}&quot;<b=
r>
-BBCLASSEXTEND_append_pn-tzdata =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-ubootchart =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-u-boot-mkimage =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-u-boot =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-uclibc-initial =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-uclibc =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-udev-extraconf =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-udev =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-unfs-server =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-unzip =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-update-modules =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-update-rc.d =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-usbinit =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-usbutils =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-useradd-example =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-util-linux =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-util-macros =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-v86d =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-valgrind =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-videoproto =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-vte =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-watchdog =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-wbxml2 =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-webkit-gtk =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-web =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-web-webkit =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-wget =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-which =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-wireless-tools =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-wpa-supplicant =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-wv =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-x11-common =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-x11perf =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-x11vnc =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-xauth =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-xbacklight =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-xcb-proto =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-xcb-util =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-xcmiscproto =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-xcursor-transparent-theme =3D &quot; ${MULTILIBS}&=
quot;<br>
-BBCLASSEXTEND_append_pn-xdg-utils =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-xdpyinfo =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-xev =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-xextproto =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-xeyes =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-xf86bigfontproto =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-xf86dgaproto =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-xf86driproto =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-xf86-input-evdev =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-xf86-input-keyboard =3D &quot; ${MULTILIBS}&quot;<=
br>
-BBCLASSEXTEND_append_pn-xf86-input-mouse =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-xf86-input-synaptics =3D &quot; ${MULTILIBS}&quot;=
<br>
-BBCLASSEXTEND_append_pn-xf86-input-vmmouse =3D &quot; ${MULTILIBS}&quot;<b=
r>
-BBCLASSEXTEND_append_pn-xf86miscproto =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-xf86rushproto =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-xf86-video-fbdev =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-xf86-video-intel =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-xf86-video-omapfb =3D &quot; ${MULTILIBS}&quot;<br=
>
-BBCLASSEXTEND_append_pn-xf86-video-vesa =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-xf86-video-vmware =3D &quot; ${MULTILIBS}&quot;<br=
>
-BBCLASSEXTEND_append_pn-xf86vidmodeproto =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-xhost =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-xineramaproto =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-xinetd =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-xinit =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-xkbcomp =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-xkeyboard-config =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-x-load =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-xmodmap =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-xorg-cf-files =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-xorg-minimal-fonts =3D &quot; ${MULTILIBS}&quot;<b=
r>
-BBCLASSEXTEND_append_pn-xournal =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-xprop =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-xproto =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-xproxymanagementprotocol =3D &quot; ${MULTILIBS}&q=
uot;<br>
-BBCLASSEXTEND_append_pn-xrandr =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-xrdb =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-xrestop =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-xserver-kdrive =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-xserver-nodm-init =3D &quot; ${MULTILIBS}&quot;<br=
>
-BBCLASSEXTEND_append_pn-xserver-xf86-config =3D &quot; ${MULTILIBS}&quot;<=
br>
-BBCLASSEXTEND_append_pn-xserver-xorg-lite =3D &quot; ${MULTILIBS}&quot;<br=
>
-BBCLASSEXTEND_append_pn-xserver-xorg =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-xset =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-xtrans =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-xtscal =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-xvideo-tests =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-xvinfo =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-xwininfo =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-xz =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-zaurusd =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-zeroconf =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-zip =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-zlib =3D &quot; ${MULTILIBS}&quot;<br>
-BBCLASSEXTEND_append_pn-zypper =3D &quot; ${MULTILIBS}&quot;<br>
+BBCLASSEXTEND_append =3D &quot; ${MULTILIBS}&quot;<br>
+<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
1.7.9.5<br>
<br>
</font></span></blockquote></div><br>

--20cf3033481115474604c7c2953c--
