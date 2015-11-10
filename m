Return-Path: <mark.hatle@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4871477145
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Nov 2015 14:31:50 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id tAAEVnfq029719
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Tue, 10 Nov 2015 06:31:50 -0800
Received: from Marks-MacBook-Pro.local (172.25.36.227) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.248.2; Tue, 10 Nov 2015 06:31:48 -0800
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>,
	<openembedded-core@lists.openembedded.org>
References: <cover.1447080392.git.alexander.kanavin@linux.intel.com>
From: Mark Hatle <mark.hatle@windriver.com>
X-Enigmail-Draft-Status: N1110
Organization: Wind River Systems
Message-ID: <5641FFD4.1050506@windriver.com>
Date: Tue, 10 Nov 2015 08:31:48 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:38.0)
	Gecko/20100101 Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <cover.1447080392.git.alexander.kanavin@linux.intel.com>
Subject: Re: [PATCH 00/29] Add gobject introspection support to oe-core
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 10 Nov 2015 14:31:51 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 8bit

On 11/9/15 8:50 AM, Alexander Kanavin wrote:
> 1. Introduction
> 
> This patchset adds support for gobject introspection to oe-core. 
> Gir files go to -dev packages, typelib files go to main packages 
> (they are packaged together with libraries that are 
> introspected).
> 
> The work is based on a meta-gir layer, which was used as a proof of
> concept; overall approach is same and some implementation ideas were 
> used, but this implementation is otherwise different, and hopefully 
> simpler and cleaner.

I have a concern since this uses QEMU.  What do we do for BSPs that do NOT have
QEMU support?

I realize QEMU supports most of the major arch families, but once we enable
certain tuning flags and such there are a fair number of common configurations
that do not have QEMU support.

> 
> 2. 30 second tutorial for adding introspection support to a package:
> 
> a. Inherit gobject-introspection class (or a class that inherits it,
> such as gnome-base).
> 
> b. Make sure introspection is not disabled anywhere in the recipe or
> its includes.
> 
> c. Try to build the recipe; if this results in build errors that look 
> like something is unable to find .so libraries, check where these libraries 
> are in the source tree and add GIR_EXTRA_LIBS_PATH=${B}/something/.libs
> to the recipe.
> 
> c. Any other errors probably mean that introspection support in a package
> is not entirely standard, and breaks down in a cross-compilation environment.
> Custom-made fixing is needed then.

Is there a way that the qemu calls can be replaced by calls to an actual running
board (via SSH perhaps) to get the necessary information?  While inconvenient
this might be a valid workaround.

Also is there any facility to caching the gobject responses (other then standard
sstate-cache) so for machine that do not have QEMU support we can used a cached
set of responses?  (I'm not sure if these responses could be considered to be a
global cache, or if they are distribution specific in configuration.  Likely the
later.)

> 
> 3. How to verify that introspection works in an image:
> 
> a. Build core-image-sato.
> 
> b. Start terminal, start python3 in the terminal.
> 
> c. Type out something like:
> 
>>>> from gi.repository import GLib
>>>> GLib.get_host_name()
> 
> d. Also, try something more advanced, for example:
> http://python-gtk-3-tutorial.readthedocs.org/en/latest/introduction.html
> 
> 
> 4. Request for testing - I would like this patchset to be checked on three
> levels:
> 
> a. Test it in all of the build environments you have. Let me know any errors
> or warnings. Also let me know, if some package can be built with introspection
> enabled, but is not.
> 
> b. Check the patchset for correct use of Yocto idioms. It touches a lot of things
> in a lot of different ways, and maybe there are better ways to do what it does.
> 
> c. Check that the overall design is sensible: how things work is hopefully
> explained in comments and commit messages.
> 
> 
> 5. Known issues:
> 
> - there is no way to globally switch off the whole thing at the moment;
> this should probably be a DISTRO_FEATURE (also see the next item)

I agree.  For tunes where QEMU can't be used there should be a way to switch
this behavior off.  I don't know if it should be a DISTRO_FEATURE or other switch.

> - qemu-ppc64 crashes out immediately; so anything that supports introspection 
> cannot be built on that architecture:
> Invalid data memory access: 0x00000040d89c5008
> ...
> 
> - gcr introspection is disabled in x86_64, because introspection helper binary
> goes into an infinite loop under qemu (on that architecture only).
> 
> - gcr and libsecret introspection is disabled in mips64, because introspection helper
> binary fails an assertion in libgpg-error
> 
> - webkit introspection is disabled in powerpc, because qemu-ppc crashes out when
> running g-ir-compiler

We should definitely inspect the items above and see if any of them are bugs in
the built software or due to the QEMU application environment.

> - the patchset has not been tested with layers in meta-oe; just making oe-core 
> build without errors on all standard architectures has been a big, long task.

Thanks for the work.  Hopefully this and the work to follow will make it easier
to build more complex gobject based components in the future.

> - the whole thing should be documented in Yocto manuals
> 
> The following changes since commit fc45deac89ef63ca1c44e763c38ced7dfd72cbe1:
> 
>   build-appliance-image: Update to jethro head revision (2015-11-03 14:03:03 +0000)
> 
> are available in the git repository at:
> 
>   git://git.yoctoproject.org/poky-contrib akanavin/gobject-introspection-experimental
>   http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=akanavin/gobject-introspection-experimental
> 
> Alexander Kanavin (29):
>   qemu.bbclass: add qemu_wrapper_cmdline()
>   qemu: don't blacklist mips64 when building runners of userspace
>     binaries
>   gobject-introspection: add the recipe
>   gtk-doc-stub: remove introspection stubs
>   gobject-introspection.bbclass: add a class that enables gobject
>     introspection
>   python3-native: use the previous version of python-config script
>   avahi-ui: remove the dependency on python-pygtk by disabling
>     avahi-discover
>   python-pygtk: remove the recipe
>   avahi: enable gobject-introspection
>   udev: enable gobject introspection
>   vala: enable the use of vapigen by packages with vala support
>   gcr: enable generation of vapi files using vapigen
>   gdk-pixbuf: enable gobject introspection
>   gconf: enable gobject-introspection
>   gtk+: enable gobject introspection
>   gtk+3: enable gobject-introspection
>   libsecret: enable generation of vapi files using vapigen
>   clutter: enable gobject introspection
>   vala.bbclass: remove pre-packaged vapigen.m4 from tarballs
>   libsoup-2.4: enable gobject introspection
>   at-spi2-core: enable gobject introspection
>   gstreamer: enable gobject introspection
>   gnomebase.bbclass: enable gobject introspection
>   webkitgtk: enable gobject introspection
>   gcr: disable gobject introspection on x86-64 for now
>   gcr: disable gobject-introspection on mips64
>   libsecret: disable gobject-introspection on mips64
>   webkitgtk: disable gobject-introspection on powerpc
>   packagegroup-core-x11-sato: add python-pygobject and gtk+3
> 
>  meta/classes/gnomebase.bbclass                     |   5 +-
>  meta/classes/gobject-introspection.bbclass         |  36 +++
>  meta/classes/qemu.bbclass                          |  23 +-
>  meta/classes/vala.bbclass                          |   6 +
>  meta/conf/distro/include/distro_alias.inc          |   1 -
>  meta/recipes-connectivity/avahi/avahi-ui_0.6.31.bb |  16 +-
>  meta/recipes-connectivity/avahi/avahi.inc          |  12 +-
>  .../packagegroups/packagegroup-self-hosted.bb      |   1 -
>  meta/recipes-core/udev/udev.inc                    |  10 +-
>  ...file.am-don-t-hardcode-g-ir-compiler-name.patch |  27 ++
>  ...c-use-PKG_CONFIG_SYSROOT_PATH-when-findin.patch |  32 +++
>  ....am-use-libtool-when-running-g-ir-scanner.patch |  26 ++
>  ...c-add-sysroot-path-to-GI_DATADIR-don-t-se.patch |  41 +++
>  .../python/python-pygobject_2.28.3.bb              |  53 ----
>  .../python/python-pygobject_3.18.0.bb              |  29 ++
>  .../python/python-pygtk/acinclude.m4               |  90 ------
>  .../add-gtk-types.defs-into-gdk.c-dependence.patch |  32 ---
>  .../python/python-pygtk/fix-gtkunixprint.patch     |  20 --
>  .../python/python-pygtk/fix-pygtk-2.0.pc.patch     |  13 -
>  .../python/python-pygtk/nodocs.patch               |  15 -
>  .../prevent_to_get_display_during_import.patch     |  16 --
>  .../python/python-pygtk/python-pygtk2/acinclude.m4 |  90 ------
>  .../update-dependences-of-defs.c.patch             |  38 ---
>  .../recipes-devtools/python/python-pygtk_2.24.0.bb |  55 ----
>  .../python/python3-native_3.4.3.bb                 |   1 +
>  ...the-shell-version-of-python-config-that-w.patch |  38 +++
>  meta/recipes-devtools/qemu/qemu-targets.inc        |   2 +-
>  meta/recipes-devtools/vala/vala.inc                |  10 +
>  ...001-vapigen.m4-use-PKG_CONFIG_SYSROOT_DIR.patch |  38 +++
>  meta/recipes-devtools/vala/vala_0.28.0.bb          |   4 +-
>  meta/recipes-gnome/gcr/gcr_3.16.0.bb               |  22 +-
>  meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.30.8.bb |   7 +-
>  meta/recipes-gnome/gnome/gconf_3.2.6.bb            |   6 +-
>  ...config-paths-with-PKG_CONFIG_SYSROOT_DIR-.patch |  99 +++++++
>  ...01-giscanner-add-a-use-ldd-wrapper-option.patch |  48 ++++
>  ...1-giscanner-add-use-binary-wrapper-option.patch |  52 ++++
>  ...c-add-host-gi-and-gi-cross-wrapper-option.patch | 158 +++++++++++
>  .../gobject-introspection_1.44.0.bb                | 146 ++++++++++
>  .../gsettings-desktop-schemas_3.16.1.bb            |   2 +-
>  meta/recipes-gnome/gtk+/gtk+.inc                   |   9 +-
>  meta/recipes-gnome/gtk+/gtk+3.inc                  |  10 +-
>  ...t-Import-introspection-stub-machinery-too.patch | 305 +++++++++++++++++++++
>  .../recipes-gnome/gtk-doc-stub/gtk-doc-stub_git.bb |   6 +-
>  meta/recipes-gnome/librsvg/librsvg_2.40.10.bb      |   3 -
>  meta/recipes-gnome/libsecret/libsecret_0.18.2.bb   |  14 +-
>  ...ation-paths-for-.gir-and-.typelib-as-reco.patch |  32 +++
>  meta/recipes-gnome/libwnck/libwnck3_3.14.0.bb      |   3 +-
>  meta/recipes-graphics/clutter/clutter-1.0.inc      |   5 +-
>  meta/recipes-graphics/clutter/clutter-gst-3.0.inc  |   4 +-
>  meta/recipes-graphics/clutter/clutter-gtk-1.0.inc  |   3 +-
>  meta/recipes-graphics/cogl/cogl-1.0.inc            |   8 +-
>  meta/recipes-graphics/mx/mx.inc                    |   5 +-
>  meta/recipes-graphics/pango/pango.inc              |   3 +-
>  ...op-introspection-macros-from-acinclude.m4.patch | 121 ++++++++
>  meta/recipes-graphics/pango/pango_1.36.8.bb        |   1 +
>  .../recipes-multimedia/gstreamer/gst-player_git.bb |   2 +-
>  .../gstreamer/gst-plugins-package.inc              |   1 +
>  ...-don-t-hardcode-libtool-name-when-running.patch |  42 +++
>  .../gstreamer/gstreamer1.0-plugins-bad_1.4.5.bb    |   1 +
>  .../gstreamer/gstreamer1.0-plugins-base.inc        |   4 +
>  ...-don-t-hardcode-libtool-name-when-running.patch | 168 ++++++++++++
>  ...-prefix-calls-to-pkg-config-with-PKG_CONF.patch | 298 ++++++++++++++++++++
>  ...ssing-include-directories-when-calling-in.patch |  28 ++
>  ...ncorrect-reference-to-gstreamer-sdp-in-Ma.patch |  27 ++
>  .../gstreamer/gstreamer1.0-plugins-base_1.4.5.bb   |   4 +
>  .../gstreamer/gstreamer1.0-plugins.inc             |  10 +-
>  .../gstreamer/gstreamer1.0-rtsp-server.inc         |   9 +-
>  ...ode-libtool-name-when-using-introspection.patch |  27 ++
>  .../gstreamer/gstreamer1.0-rtsp-server_1.4.5.bb    |   2 +
>  meta/recipes-multimedia/gstreamer/gstreamer1.0.inc |  12 +-
>  .../packagegroups/packagegroup-core-x11-sato.bb    |   2 +
>  ...Introspection.cmake-prefix-variables-obta.patch |  27 ++
>  ...ng-introspection-files-add-CMAKE_C_FLAGS-.patch |  40 +++
>  meta/recipes-sato/webkit/webkitgtk_2.8.5.bb        |  13 +-
>  meta/recipes-support/atk/at-spi2-core_2.16.0.bb    |   4 +-
>  meta/recipes-support/atk/atk_2.16.0.bb             |   2 +-
>  meta/recipes-support/libsoup/libsoup-2.4_2.50.0.bb |   2 +-
>  ...file.am-install-gir-typelib-using-datadir.patch |  34 +++
>  meta/recipes-support/vte/vte.inc                   |   4 +-
>  meta/recipes-support/vte/vte_0.28.2.bb             |   3 +-
>  80 files changed, 2106 insertions(+), 512 deletions(-)
>  create mode 100644 meta/classes/gobject-introspection.bbclass
>  create mode 100644 meta/recipes-core/udev/udev/0001-Makefile.am-don-t-hardcode-g-ir-compiler-name.patch
>  create mode 100644 meta/recipes-core/udev/udev/0001-configure.ac-use-PKG_CONFIG_SYSROOT_PATH-when-findin.patch
>  create mode 100644 meta/recipes-core/udev/udev/0002-Makefile.am-use-libtool-when-running-g-ir-scanner.patch
>  create mode 100644 meta/recipes-devtools/python/python-pygobject/0001-configure.ac-add-sysroot-path-to-GI_DATADIR-don-t-se.patch
>  delete mode 100644 meta/recipes-devtools/python/python-pygobject_2.28.3.bb
>  create mode 100644 meta/recipes-devtools/python/python-pygobject_3.18.0.bb
>  delete mode 100644 meta/recipes-devtools/python/python-pygtk/acinclude.m4
>  delete mode 100644 meta/recipes-devtools/python/python-pygtk/add-gtk-types.defs-into-gdk.c-dependence.patch
>  delete mode 100644 meta/recipes-devtools/python/python-pygtk/fix-gtkunixprint.patch
>  delete mode 100644 meta/recipes-devtools/python/python-pygtk/fix-pygtk-2.0.pc.patch
>  delete mode 100644 meta/recipes-devtools/python/python-pygtk/nodocs.patch
>  delete mode 100644 meta/recipes-devtools/python/python-pygtk/prevent_to_get_display_during_import.patch
>  delete mode 100644 meta/recipes-devtools/python/python-pygtk/python-pygtk2/acinclude.m4
>  delete mode 100644 meta/recipes-devtools/python/python-pygtk/update-dependences-of-defs.c.patch
>  delete mode 100644 meta/recipes-devtools/python/python-pygtk_2.24.0.bb
>  create mode 100644 meta/recipes-devtools/python/python3/0001-Do-not-use-the-shell-version-of-python-config-that-w.patch
>  create mode 100644 meta/recipes-devtools/vala/vala/0001-vapigen.m4-use-PKG_CONFIG_SYSROOT_DIR.patch
>  create mode 100644 meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-Prefix-pkg-config-paths-with-PKG_CONFIG_SYSROOT_DIR-.patch
>  create mode 100644 meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-giscanner-add-a-use-ldd-wrapper-option.patch
>  create mode 100644 meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-giscanner-add-use-binary-wrapper-option.patch
>  create mode 100644 meta/recipes-gnome/gobject-introspection/gobject-introspection/0002-configure.ac-add-host-gi-and-gi-cross-wrapper-option.patch
>  create mode 100644 meta/recipes-gnome/gobject-introspection/gobject-introspection_1.44.0.bb
>  create mode 100644 meta/recipes-gnome/gtk-doc-stub/files/0001-Revert-Import-introspection-stub-machinery-too.patch
>  create mode 100644 meta/recipes-gnome/libwnck/files/0001-Fix-installation-paths-for-.gir-and-.typelib-as-reco.patch
>  create mode 100644 meta/recipes-graphics/pango/pango/0001-Drop-introspection-macros-from-acinclude.m4.patch
>  create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-Makefile.am-don-t-hardcode-libtool-name-when-running.patch
>  create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-Makefile.am-don-t-hardcode-libtool-name-when-running.patch
>  create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-Makefile.am-prefix-calls-to-pkg-config-with-PKG_CONF.patch
>  create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0003-riff-add-missing-include-directories-when-calling-in.patch
>  create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0004-rtsp-drop-incorrect-reference-to-gstreamer-sdp-in-Ma.patch
>  create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server/0001-Don-t-hardcode-libtool-name-when-using-introspection.patch
>  create mode 100644 meta/recipes-sato/webkit/files/0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch
>  create mode 100644 meta/recipes-sato/webkit/files/0001-When-building-introspection-files-add-CMAKE_C_FLAGS-.patch
>  create mode 100644 meta/recipes-support/vte/vte-0.28.2/0001-Makefile.am-install-gir-typelib-using-datadir.patch
> 


