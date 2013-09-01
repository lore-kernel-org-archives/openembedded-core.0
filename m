Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f170.google.com (mail-ea0-f170.google.com
	[209.85.215.170])
	by mail.openembedded.org (Postfix) with ESMTP id 4E8EC6BE4C;
	Sun,  1 Sep 2013 20:27:36 +0000 (UTC)
Received: by mail-ea0-f170.google.com with SMTP id h14so1957624eak.15
	for <multiple recipients>; Sun, 01 Sep 2013 13:27:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=0bq44gOlobGwPzFWfoDfUY5dBSyDy0rSmWT4kmZ2E34=;
	b=qvpaPZXtEj3lB5vsuCXm9HsKVYLxUl+jzs2/5/seVSZj3XElTnHGU6UO8L61XbIBjG
	Icc3UXrRJDYfgrEXvUtvop/t/omxc0Z9dsIbE8J//4mbOxmJwWHD+ruK4z4DLSWQGzGG
	eM7m8oBJykwSBlogV67FAqp2jWFb7TzWmyCjF1QoRjNJGigT23T7soa5LGsMJcvhFpPj
	cXwkHvNusGUXS/CmQ0pZtGGxbUyxQhQCHOtRdhhqgOu5EsXf2E5Gi6peEoqGWvp/mc3D
	pI22Rn8/TdbR9YI+F94guUN5NPRKJNPi1D0WG8SRtYNChCiSpJfMKEOoSAyaMMHHr0VV
	S4ww==
X-Received: by 10.14.99.193 with SMTP id x41mr6151759eef.52.1378067255931;
	Sun, 01 Sep 2013 13:27:35 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	t6sm16102201eel.12.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Sun, 01 Sep 2013 13:27:35 -0700 (PDT)
Date: Sun, 1 Sep 2013 22:28:52 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Message-ID: <20130901202852.GX3544@jama>
References: <cover.1377791377.git.Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <cover.1377791377.git.Martin.Jansa@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: State of bitbake world Was: [WIP][PATCH 00/66] Deterministic dependencies II
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
X-List-Received-Date: Sun, 01 Sep 2013 20:27:38 -0000
X-Groupsio-MsgNum: 44359
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="dfd2vGAGWPaUxtUA"
Content-Disposition: inline

--dfd2vGAGWPaUxtUA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 29, 2013 at 05:50:53PM +0200, Martin Jansa wrote:
> WIP because verification build is still running and I must admit that I'm=
 mostly
> testing that all dependencies are correctly "disabled" and in the end det=
erministic.
>=20
> I'm not testing if every possible combination of PACKAGECONFIG options pr=
ovide sufficient
> dependency tree.

Logs from world build with this patchset (and corresponding one in
oe-core) is here:
http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.world.201=
30830_054414.log/

Some of these issues were supposed to be fixed by patches I've sent, so I'l=
l first
concentrate on fixing those, other issues are still free for volunteers :).

cmake is broken by one meta-qt5 change, so many recipe issues are "hidden" =
by that.

Summary: 8 tasks failed:
  meta-openembedded/meta-oe/recipes-connectivity/daq/daq_2.0.0.bb, do_fetch
  meta-openembedded/meta-oe/recipes-qt/qt-creator/qt-creator_2.8.0.bb, do_c=
ompile
  meta-openembedded/meta-oe/recipes-navigation/monav/monav_0.3.bb, do_compi=
le
  openembedded-core/meta/recipes-devtools/cmake/cmake_2.8.11.2.bb, do_confi=
gure
  meta-openembedded/meta-multimedia/recipes-dvb/dvb-apps/dvb-apps_1.1.1.bb,=
 do_fetch
  meta-openembedded/meta-multimedia/recipes-multimedia/vlc/vlc_1.1.11.bb, d=
o_compile
  meta-openembedded/meta-oe/recipes-devtools/tcltk/tk_8.6.0.bb, do_compile
  meta-openembedded/meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb, d=
o_compile

Found differences:=20
WARN: packages/armv5te-oe-linux-gnueabi/consolekit/consolekit/latest lost d=
ependency on  polkit
WARN: packages/armv5te-oe-linux-gnueabi/epiphany/epiphany/latest lost depen=
dency on  libnotify
WARN: packages/armv5te-oe-linux-gnueabi/expedite/expedite/latest lost depen=
dency on  libsdl
WARN: packages/armv5te-oe-linux-gnueabi/fbida/fbida/latest lost dependency =
on  libx11 libxext libxpm libxt openmotif
WARN: packages/armv5te-oe-linux-gnueabi/gammu/gammu/latest lost dependency =
on  libgudev-1.0
WARN: packages/armv5te-oe-linux-gnueabi/gimp/gimp/latest lost dependency on=
  libxmu
WARN: packages/armv5te-oe-linux-gnueabi/glade3/glade3/latest lost dependenc=
y on  dbus-glib dbus-lib gconf gnome-vfs libart-lgpl libavahi-client libava=
hi-common libavahi-glib libbonobo libbonoboui libcanberra libcap libgcrypt =
libgnome libgnome-keyring libgnomecanvas libgnomeui libgpg-error libice lib=
ltdl libogg libsm libvorbis libxcomposite libxcursor libxdamage libxfixes l=
ibxrandr orbit2 popt util-linux-libuuid
WARN: packages/armv5te-oe-linux-gnueabi/gmtk/gmtk/latest lost dependency on=
  cairo-gobject dbus-lib gtk+3 libcap libice libjson libpulse libpulse-main=
loop-glib libpulsecommon libsm libsndfile1 libx11-xcb libxi libxtst util-li=
nux-libuuid
WARN: packages/armv5te-oe-linux-gnueabi/gnome-mplayer/gnome-mplayer-nautilu=
s-extension/latest lost dependency on  eglibc glib-2.0 gtk+
WARN: packages/armv5te-oe-linux-gnueabi/gnome-panel/gnome-panel/latest lost=
 dependency on  dbus-lib
WARN: packages/armv5te-oe-linux-gnueabi/gnome-panel3/gnome-panel3/latest lo=
st dependency on  telepathy-glib
WARN: packages/armv5te-oe-linux-gnueabi/gnuradio/gnuradio/latest lost depen=
dency on  libpython3
WARN: packages/armv5te-oe-linux-gnueabi/guile/guile/latest lost dependency =
on  ncurses-libncurses readline
WARN: packages/armv5te-oe-linux-gnueabi/libmatchbox/libmatchbox/latest lost=
 dependency on  libpng12
WARN: packages/armv5te-oe-linux-gnueabi/libungif/libungif/latest lost depen=
dency on  libice libsm util-linux-libuuid
WARN: packages/armv5te-oe-linux-gnueabi/maliit-framework/maliit-framework-g=
tk/latest lost dependency on  gtk+
WARN: packages/armv5te-oe-linux-gnueabi/midori/midori/latest lost dependenc=
y on  libxscrnsaver
WARN: packages/armv5te-oe-linux-gnueabi/mpd/mpd/latest lost dependency on  =
yajl
WARN: packages/armv5te-oe-linux-gnueabi/mpeg2dec/mpeg2dec/latest lost depen=
dency on  libx11 libxext libxv
WARN: packages/armv5te-oe-linux-gnueabi/mpg123/mpg123/latest lost dependenc=
y on  audiofile esound libjack libsdl openal-soft portaudio-v19 tslib
WARN: packages/armv5te-oe-linux-gnueabi/mplayer2/mplayer2/latest lost depen=
dency on  libxxf86dga
WARN: packages/armv5te-oe-linux-gnueabi/navit/navit/latest lost dependency =
on  fribidi
WARN: packages/armv5te-oe-linux-gnueabi/navit/navit-graphics-gtk/latest los=
t dependency on  imlib2
WARN: packages/armv5te-oe-linux-gnueabi/navit/navit-graphics-sdl/latest los=
t dependency on  eglibc freetype libjpeg-turbo liblzma libpng libsdl libsdl=
-image tiff tslib zlib
WARN: packages/armv5te-oe-linux-gnueabi/network-manager-applet/network-mana=
ger-applet/latest lost dependency on  libnotify3
WARN: packages/armv5te-oe-linux-gnueabi/opencv/libopencv-highgui/latest los=
t dependency on  jasper
WARN: packages/armv5te-oe-linux-gnueabi/qemu/qemu/latest lost dependency on=
  cairo gdk-pixbuf gnutls gtk+ libvte
WARN: packages/armv5te-oe-linux-gnueabi/synergy/synergy/latest lost depende=
ncy on  libxinerama
WARN: packages/armv5te-oe-linux-gnueabi/thunar/thunar/latest lost dependenc=
y on  libnotify3
WARN: packages/armv5te-oe-linux-gnueabi/tracker/tracker/latest lost depende=
ncy on  dbus-glib enca gnome-panel3 gnutls libgee libgudev-1.0 liblzma libn=
mglib libnmutil libtasn1 libudev libunistring tiff
WARN: packages/armv5te-oe-linux-gnueabi/tracker/tracker-nautilus-extension/=
latest lost dependency on  libunistring
WARN: packages/armv5te-oe-linux-gnueabi/tumbler/tumbler/latest lost depende=
ncy on  libbz2 libgsf libxml2
WARN: packages/armv5te-oe-linux-gnueabi/weston/weston-examples/latest lost =
dependency on  libpoppler-glib
WARN: packages/armv5te-oe-linux-gnueabi/wv/wv/latest lost dependency on  li=
bpng
WARN: packages/armv5te-oe-linux-gnueabi/x11vnc/x11vnc/latest lost dependenc=
y on  libxtst
WARN: packages/armv5te-oe-linux-gnueabi/xfce4-power-manager/xfce4-power-man=
ager/latest lost dependency on  libnotify3
WARN: packages/armv5te-oe-linux-gnueabi/xterm/xterm/latest lost dependency =
on  fontconfig libxft

Found errors:=20
ERROR: test-dependencies/1377841454/3_min/packages/armv5te-oe-linux-gnueabi=
/qemu/qemu-locale-de-de/latest doesn't exist
ERROR: test-dependencies/1377841454/3_min/packages/armv5te-oe-linux-gnueabi=
/qemu/qemu-locale-fr-fr/latest doesn't exist
ERROR: test-dependencies/1377841454/3_min/packages/armv5te-oe-linux-gnueabi=
/qemu/qemu-locale-it/latest doesn't exist
ERROR: test-dependencies/1377841454/3_min/packages/armv5te-oe-linux-gnueabi=
/qemu/qemu-locale-tr/latest doesn't exist

QA:
libav-0.8.8: ELF binary '/home/jenkins/oe/shr-core-branches/shr-core/tmp-eg=
libc/work/armv5te-oe-linux-gnueabi/libav/0.8.8-r0/packages-split/libswscale=
/usr/lib/libswscale.so.2.1.0' has relocations in .text
libav-0.8.8: ELF binary '/home/jenkins/oe/shr-core-branches/shr-core/tmp-eg=
libc/work/armv5te-oe-linux-gnueabi/libav/0.8.8-r0/packages-split/libpostpro=
c/usr/lib/libpostproc.so.52.0.0' has relocations in .text
libav-0.8.8: ELF binary '/home/jenkins/oe/shr-core-branches/shr-core/tmp-eg=
libc/work/armv5te-oe-linux-gnueabi/libav/0.8.8-r0/packages-split/libavutil/=
usr/lib/libavutil.so.51.22.1' has relocations in .text
libav-0.8.8: ELF binary '/home/jenkins/oe/shr-core-branches/shr-core/tmp-eg=
libc/work/armv5te-oe-linux-gnueabi/libav/0.8.8-r0/packages-split/libavforma=
t/usr/lib/libavformat.so.53.21.1' has relocations in .text
libav-0.8.8: ELF binary '/home/jenkins/oe/shr-core-branches/shr-core/tmp-eg=
libc/work/armv5te-oe-linux-gnueabi/libav/0.8.8-r0/packages-split/libavfilte=
r/usr/lib/libavfilter.so.2.15.0' has relocations in .text
libav-0.8.8: ELF binary '/home/jenkins/oe/shr-core-branches/shr-core/tmp-eg=
libc/work/armv5te-oe-linux-gnueabi/libav/0.8.8-r0/packages-split/libavdevic=
e/usr/lib/libavdevice.so.53.2.0' has relocations in .text
libav-0.8.8: ELF binary '/home/jenkins/oe/shr-core-branches/shr-core/tmp-eg=
libc/work/armv5te-oe-linux-gnueabi/libav/0.8.8-r0/packages-split/libavcodec=
/usr/lib/libavcodec.so.53.35.0' has relocations in .text
qtwebkit-5.1.0: package qtwebkit contains bad RPATH /home/jenkins/oe/shr-co=
re-branches/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/qtwebkit/5.1.=
0-r0/build/lib in file /home/jenkins/oe/shr-core-branches/shr-core/tmp-egli=
bc/work/armv5te-oe-linux-gnueabi/qtwebkit/5.1.0-r0/packages-split/qtwebkit/=
usr/lib/qt5/libexec/QtWebPluginProcess
qtwebkit-5.1.0: package qtwebkit contains bad RPATH /home/jenkins/oe/shr-co=
re-branches/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/qtwebkit/5.1.=
0-r0/build/lib in file /home/jenkins/oe/shr-core-branches/shr-core/tmp-egli=
bc/work/armv5te-oe-linux-gnueabi/qtwebkit/5.1.0-r0/packages-split/qtwebkit/=
usr/lib/qt5/libexec/QtWebProcess
qwt-6.0.1: File '/usr/lib/libqwt.so.6.0.1' from qwt was already stripped, t=
his will prevent future debugging!
qwt-6.0.1: File '/usr/lib/libqwtmathml.so.6.0.1' from qwt was already strip=
ped, this will prevent future debugging!
qwt-6.0.1: File '/usr/lib/qt4/plugins/designer/libqwt_designer_plugin.so' f=
rom qwt was already stripped, this will prevent future debugging!
ed-1.9: The /usr/share/info/dir file is not meant to be shipped in a partic=
ular package.
oscam-1.10+7974: File '/usr/bin/oscam' from oscam was already stripped, thi=
s will prevent future debugging!
aurora-daemon-0.1+gitrAUTOINC+b65354ad6c: aurora-daemon: found library in w=
rong location: /usr/share/aurora/applications/settings/libaurora-app-settin=
gs.so
quagga-0.99.21: The /usr/share/info/dir file is not meant to be shipped in =
a particular package.
gstreamer1.0-libav-1.0.9: ELF binary '/home/jenkins/oe/shr-core-branches/sh=
r-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/gstreamer1.0-libav/1.0.9-r1=
/packages-split/gstreamer1.0-libav/usr/lib/gstreamer-1.0/libgstlibav.so' ha=
s relocations in .text
inetutils-1.9.1: inetutils: Files/directories were installed but not shipped
  /usr/lib
emacs-23.4: The /usr/share/info/dir file is not meant to be shipped in a pa=
rticular package.
lzip-1.14: The /usr/share/info/dir file is not meant to be shipped in a par=
ticular package.
atftp-0.7.1+gitAUTOINC+be3291a18c: atftp: Files/directories were installed =
but not shipped
  /etc
tracker-0.14.2: tracker: Files/directories were installed but not shipped
  /usr/lib/tracker-0.14/writeback-modules/libwriteback-taglib.so
  /usr/lib/tracker-0.14/writeback-modules/libwriteback-taglib.la
libpostproc-0.0.0+gitAUTOINC+3b7053f46d: ELF binary '/home/jenkins/oe/shr-c=
ore-branches/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/libpostproc/=
0.0.0+gitAUTOINC+3b7053f46d-r1/packages-split/libpostproc/usr/lib/libpostpr=
oc.so.52.0.100' has relocations in .text
tracker-0.14.2: tracker: Files/directories were installed but not shipped
  /usr/share/gnome-panel
  /usr/share/gnome-panel/4.0
  /usr/share/gnome-panel/4.0/applets
  /usr/share/gnome-panel/4.0/applets/org.gnome.panel.SearchBar.panel-applet
  /usr/lib/tracker-0.14/writeback-modules/libwriteback-taglib.so
  /usr/lib/tracker-0.14/writeback-modules/libwriteback-taglib.la
>=20
> The following changes since commit 72e23c12296fbc77193898c38426add58d0c2d=
71:
>=20
>   mysql5: replace with mariadb 5.1.67 and tweak (2013-08-27 16:39:31 +010=
0)
>=20
> are available in the git repository at:
>=20
>   git://git.openembedded.org/meta-openembedded-contrib jansa/deps
>   http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=
=3Djansa/deps
>=20
> Martin Jansa (66):
>   gvfs: Add PACKAGECONFIG for fuse and disable it by default
>   libmikmod: upgrade to 3.2.0
>   gnome-desktop: Add startup-notification dependency
>   gnome-control-center: Add libxscrnsaver dependency
>   gnome-settings-daemon: add PACKAGECONFIG for pulseaudio
>   libgsf: Add PACKAGECONFIG for gdk-pixbuf
>   imagemagick: Add PACKAGECONFIG for jp2
>   libxklavier: Add libxi dependency
>   claws-mail: Add PACKAGECONFIG for enchant, dbus, ldap and
>     startup-notification
>   abiword: Add PACKAGECONFIG for collab-backends and spell
>   mkvtoolnix: Add PACKAGECONFIG for flac
>   uhd: Add PACKAGECONFIG for orc
>   entrance: Add PACKAGECONFIG for consolekit
>   expedite: Add PACKAGECONFIG for sdl
>   metacity: Add dependency on libgtop
>   libgtop: Add dependency on libxau
>   wv: Add PACKAGECONFIG for png
>   libetpan: Add dependency on curl
>   gnuradio: Add PACKAGECONFIG for jack and portaudio
>   fluidsynth: Add PACKAGECONFIG for sndfile, jack, pulseaudio, portaudio
>     and readline
>   vlc: Add PACKAGECONFIG for undeterministic dependencies
>   tracker: Add PACKAGECONFIG for undeterministic dependencies
>   mpd: Add PACKAGECONFIG for undeterministic dependencies
>   cherokee: Add PACKAGECONFIG for ffmpeg and ldap
>   collectd: Add PACKAGECONFIG for undeterministic dependencies
>   xchat: Add PACKAGECONFIG for dbus and openssl
>   xterm: Add fontconfig dependency
>   libwnck(3): Add dependency on libxres
>   e-wm: Add PACKAGECONFIG for pam
>   sox: Add PACKAGECONFIG for mad, id3tag and lame
>   gvfs: Add PACKAGECONFIG for archive, obexftp, cdda
>   upower: Add PACKAGECONFIG for idevice
>   udisks: Add PACKAGECONFIG for parted
>   imlib2: Add PACKAGECONFIG for gif, tiff, id3 and bzip2
>   openmotif: Add PACKAGECONFIG for jpeg and png
>   opencv: Add PACKAGECONFIG for jasper
>   gammu: Add dependency on glib-2.0
>   openbox: Add PACKAGECONFIG for imlib2, xrandr, xinerama, xcursor,
>     startup-notification
>   v4l-utils: Add libx11 dependency
>   epiphany: Add PACKAGECONFIG for zeroconf
>   libungif: Add dependency on libx11
>   libmemcached: Add PACKAGECONFIG for sasl
>   networkmanager: Add PACKAGECONFIG for concheck
>   proftpd: Add PACKAGECONFIG for curses
>   gnuplot: Add PACKAGECONFIG for cairo
>   gnome-mplayer: Add PACKAGECONFIG for gtk3
>   gimp: Add PACKAGECONFIG for bzip2, libxpm, libjasper and gudev
>   gegl: Add PACKAGECONFIG for jasper, avformat
>   edb: Add PACKAGECONFIG for ncurses
>   gnome-vfs: Add PACKAGECONFIG for fam
>   lightmediascanner: Add PACKAGECONFIG for ogg
>   mplayer2: Add PACKAGECONFIG for mpg123 and xss
>   maliit-framework: Add dependency on gtk+3
>   packagekit: Add PACKAGECONFIG for service-packs
>   orage: Add PACKAGECONFIG for notify and dependency on popt
>   thunar: Add PACKAGECONFIG for pcre
>   thunar-volman: Add PACKAGECONFIG for notify
>   tumbler: Add PACKAGECONFIG for gstreamer
>   xfce4-clipman-plugin: Add PACKAGECONFIG for unique
>   xfce4-places-plugin: Add PACKAGECONFIG for notify
>   xfce4-settings: Add PACKAGECONFIG for notify
>   xfdesktop: Add PACKAGECONFIG for notify
>   webkit-efl: Add dependency on gst-plugins-base
>   qt-creator: Add patch to resolve missing cpuid.h in ARM builds
>   xbmc: Add libmad dependency
>   qcanobserver: Move to nonworking
>=20
>  meta-efl/recipes-efl/e17/e-wm.inc                  |   3 +
>  meta-efl/recipes-efl/efl/edb_svn.bb                |   3 +
>  meta-efl/recipes-efl/efl/entrance_svn.bb           |   3 +
>  meta-efl/recipes-efl/efl/expedite.inc              |   3 +
>  meta-efl/recipes-efl/efl/imlib2_svn.bb             |   6 +
>  meta-efl/recipes-efl/webkit/webkit-efl_svn.bb      |   2 +-
>  .../lightmediascanner/lightmediascanner_0.4.4.bb   |   3 +
>  .../gnome-mplayer/gnome-mplayer_1.0.5.bb           |   3 +
>  meta-gnome/recipes-gnome/abiword/abiword_2.8.6.bb  |  15 +-
>  .../recipes-gnome/epiphany/epiphany_2.30.6.bb      |   3 +
>  .../gnome-control-center_2.32.1.bb                 |   2 +-
>  .../gnome-desktop/gnome-desktop3_3.0.2.bb          |   2 +-
>  .../gnome-desktop/gnome-desktop_2.32.1.bb          |   2 +-
>  .../gnome-settings-daemon_2.32.1.bb                |   3 +
>  .../recipes-gnome/gnome-vfs/gnome-vfs_2.24.4.bb    |   1 +
>  meta-gnome/recipes-gnome/gvfs/gvfs_1.10.1.bb       |   7 +-
>  meta-gnome/recipes-gnome/libgsf/libgsf_1.14.26.bb  |   3 +
>  meta-gnome/recipes-gnome/libgtop/libgtop_2.28.2.bb |   2 +-
>  meta-gnome/recipes-gnome/libwnck/libwnck3_3.0.2.bb |   2 +-
>  meta-gnome/recipes-gnome/libwnck/libwnck_2.30.5.bb |   2 +-
>  .../recipes-gnome/libxklavier/libxklavier_5.0.bb   |   2 +-
>  .../recipes-gnome/metacity/metacity_2.34.13.bb     |   2 +-
>  meta-gnome/recipes-gnome/wv/wv_1.2.0.bb            |   3 +
>  .../recipes-mediacentre/xbmc/xbmc_git.bb           |   2 +-
>  .../recipes-mkv/mkvtoolnix/mkvtoolnix_5.9.0.bb     |   3 +
>  .../fluidsynth/fluidsynth_1.1.1.bb                 |   7 +
>  .../recipes-multimedia/musicpd/mpd_0.17.1.bb       |   8 +
>  .../recipes-multimedia/sox/sox_14.4.0.bb           |   3 +
>  meta-multimedia/recipes-multimedia/vlc/vlc.inc     |  20 +-
>  .../recipes-daemons/proftpd/proftpd_1.3.4b.bb      |   3 +
>  .../recipes-support/libmemcached/libmemcached.inc  |   3 +
>  meta-oe/recipes-connectivity/gammu/gammu_1.32.0.bb |   2 +-
>  ...n-t-add-usr-include-and-usr-lib-to-config.patch |  58 ----
>  .../gnuradio/allow-to-disable-jack-portaudio.patch |  34 ++
>  .../recipes-connectivity/gnuradio/gnuradio_git.bb  |   4 +
>  .../networkmanager/networkmanager_0.9.8.0.bb       |   1 +
>  meta-oe/recipes-connectivity/uhd/uhd.inc           |   3 +
>  .../packagekit/packagekit_0.5.6.bb                 |   3 +
>  .../recipes-extended/collectd/collectd_5.2.2.bb    |   7 +
>  meta-oe/recipes-extended/gnuplot/gnuplot.inc       |   5 +-
>  .../recipes-extended/libungif/libungif_4.1.3.bb    |   2 +
>  meta-oe/recipes-graphics/gegl/gegl_0.2.0.bb        |   4 +
>  meta-oe/recipes-graphics/gimp/gimp_2.8.2.bb        |   6 +
>  meta-oe/recipes-graphics/openbox/openbox_3.5.0.bb  |   7 +
>  meta-oe/recipes-graphics/xorg-app/xterm_293.bb     |   2 +-
>  .../mikmod/libmikmod/CVE-2010-2971.patch           |  24 --
>  .../mikmod/libmikmod/ldflags.patch                 |   4 +-
>  .../{libmikmod_3.1.12.bb =3D> libmikmod_3.2.0.bb}    |   7 +-
>  meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb |   2 +
>  .../recipes-multimedia/v4l2apps/v4l-utils_0.8.8.bb |   2 +-
>  .../qcanobserver/qcanobserver-socketcan_svn.bb     |   0
>  ...erinterface.cpp-add-sys-socket.h-as-inclu.patch |   0
>  .../0002-qconsole-writethread-gcc-4.5-fixes.patch  |   0
>  .../qcanobserver/qcanobserver/candemo.xml          |   0
>  .../qcanobserver/qcanobserver_svn.bb               |   0
>  .../qt-creator/fix.missing.cpuid.h.patch           | 384 +++++++++++++++=
++++++
>  meta-oe/recipes-qt/qt-creator/qt-creator_2.8.0.bb  |   4 +-
>  .../recipes-sato/claws-mail/claws-mail_3.9.0.bb    |   6 +
>  .../imagemagick/imagemagick_6.8.6.bb               |   3 +
>  meta-oe/recipes-support/libetpan/libetpan_0.57.bb  |   2 +-
>  .../recipes-support/maliit/maliit-framework_git.bb |   1 +
>  meta-oe/recipes-support/opencv/opencv_2.4.3.bb     |   3 +
>  .../recipes-support/openmotif/openmotif_2.3.3.bb   |   4 +
>  meta-oe/recipes-support/tracker/tracker_0.14.2.bb  |  12 +-
>  meta-oe/recipes-support/udisks/udisks_1.0.4.bb     |   3 +
>  meta-oe/recipes-support/upower/upower_0.9.14.bb    |   3 +
>  meta-oe/recipes-support/xchat/xchat_2.8.8.bb       |   4 +
>  .../recipes-httpd/cherokee/cherokee_1.2.98.bb      |   4 +
>  meta-xfce/recipes-apps/orage/orage_4.8.4.bb        |   5 +-
>  .../clipman/xfce4-clipman-plugin_1.2.3.bb          |   3 +
>  .../places/xfce4-places-plugin_1.5.0.bb            |   3 +
>  .../thunar-volman/thunar-volman_0.8.0.bb           |   3 +
>  meta-xfce/recipes-xfce/thunar/thunar_1.6.3.bb      |   3 +
>  meta-xfce/recipes-xfce/tumbler/tumbler_0.1.29.bb   |   3 +
>  .../xfce4-settings/xfce4-settings_4.11.0.bb        |   3 +
>  .../recipes-xfce/xfdesktop/xfdesktop_4.10.2.bb     |   3 +
>  76 files changed, 648 insertions(+), 114 deletions(-)
>  delete mode 100644 meta-oe/recipes-connectivity/gnuradio/gnuradio/0001-b=
uildsys-don-t-add-usr-include-and-usr-lib-to-config.patch
>  create mode 100644 meta-oe/recipes-connectivity/gnuradio/gnuradio/allow-=
to-disable-jack-portaudio.patch
>  delete mode 100644 meta-oe/recipes-multimedia/mikmod/libmikmod/CVE-2010-=
2971.patch
>  rename meta-oe/recipes-multimedia/mikmod/{libmikmod_3.1.12.bb =3D> libmi=
kmod_3.2.0.bb} (73%)
>  rename meta-oe/recipes-qt/{ =3D> nonworking}/qcanobserver/qcanobserver-s=
ocketcan_svn.bb (100%)
>  rename meta-oe/recipes-qt/{ =3D> nonworking}/qcanobserver/qcanobserver/0=
001-messagebufferinterface.cpp-add-sys-socket.h-as-inclu.patch (100%)
>  rename meta-oe/recipes-qt/{ =3D> nonworking}/qcanobserver/qcanobserver/0=
002-qconsole-writethread-gcc-4.5-fixes.patch (100%)
>  rename meta-oe/recipes-qt/{ =3D> nonworking}/qcanobserver/qcanobserver/c=
andemo.xml (100%)
>  rename meta-oe/recipes-qt/{ =3D> nonworking}/qcanobserver/qcanobserver_s=
vn.bb (100%)
>  create mode 100644 meta-oe/recipes-qt/qt-creator/qt-creator/fix.missing.=
cpuid.h.patch
>=20
> --=20
> 1.8.3.2
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--dfd2vGAGWPaUxtUA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iEYEARECAAYFAlIjo4QACgkQN1Ujt2V2gBxJ6ACgrMS7f4d4KwHW+hqrfT5QBtqV
HuAAnixbmXgt6UAoEdtyPoG3SoX5D28+
=4z7S
-----END PGP SIGNATURE-----

--dfd2vGAGWPaUxtUA--
