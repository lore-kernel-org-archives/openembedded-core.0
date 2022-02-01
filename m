Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3115C433EF
	for <webhook@archiver.kernel.org>; Tue,  1 Feb 2022 17:15:13 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.51914.1643735712789570007
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Feb 2022 09:15:13 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 46F6F40C76;
	Tue,  1 Feb 2022 17:15:11 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CkfT_N2q9eQf; Tue,  1 Feb 2022 17:15:11 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
 [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id E894540A47;
	Tue,  1 Feb 2022 17:15:01 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 7FAB917472A; Tue,  1 Feb 2022 12:15:01 -0500 (EST)
Date: Tue, 1 Feb 2022 12:15:01 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
	Alexander Kanavin <alex@linutronix.de>,
	Marius Vlad <marius.vlad@collabora.com>,
	Daniel Stone <daniel.stone@collabora.com>,
	Chen Qi <Qi.Chen@windriver.com>,
	Denys Dmytriyenko <denys@konsulko.com>,
	Tom Hochstein <tom.hochstein@nxp.com>,
	Jussi Kukkonen <jussi.kukkonen@intel.com>,
	Ming Liu <ming.liu@toradex.com>
Subject: Re: [OE-core] [RFC PATCH 2/2] weston: upgrade 9.0.0 -> 10.0.0
Message-ID: <20220201171501.GA26229@denix.org>
References: <20220201133054.3265186-1-alex@linutronix.de>
 <20220201133054.3265186-2-alex@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20220201133054.3265186-2-alex@linutronix.de>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Feb 2022 17:15:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161163

On Tue, Feb 01, 2022 at 02:30:54PM +0100, Alexander Kanavin wrote:
> Upstream has deprecated both weston-launch and fbdev backend, so let's
> not delay the inevitable and find replacements.
>=20
> Fbdev can be replaced by passing --use-pixman to drm backend;
> this will bypass the opengl paths and use CPU for rendering.
> Apply where GL is too slow or unavailable.
>=20
> weston-launch can be replaced by starting weston directly, with
> a seat management daemon for support. This is provided either
> by systemd, or on systemd-less systems, by seatd. The sysvinit
> startup scripts and tests have been rewritten accordingly. Bonus
> fix: under sysvinit weston now starts under weston user as it should,
> and not under root.

Thanks, Alex, for working on this big upgrade ahead of schedule!

Just to make it clear to everyone else on the list - this is not the fina=
l=20
10.0.0 release, but rather an RC1 that is versioned as 9.0.93, hence the =
RFC=20
status of the patch, just for review.

And this would definitely require extra testing on different actual platf=
orms,=20
as I'm a bit worried about root-less execution...

--=20
Denys


> Upstream discussion:
> https://gitlab.freedesktop.org/wayland/weston/-/merge_requests/725
>=20
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>  meta/lib/oeqa/runtime/cases/weston.py         |   6 +-
>  .../recipes-graphics/wayland/weston-init/init |   2 +-
>  .../wayland/weston-init/weston-start          |  30 +--
>  ...d-drm-Re-order-gbm-destruction-at-DR.patch |  50 -----
>  ...001-meson.build-fix-incorrect-header.patch |  32 ---
>  ...ntl.h-for-open-O_RDWR-O_CLOEXEC-and-.patch |  47 -----
>  ...ovide-a-default-version-that-doesn-t.patch | 199 ------------------
>  .../weston/dont-use-plane-add-prop.patch      |  13 +-
>  .../{weston_9.0.0.bb =3D> weston_9.0.93.bb}     |  50 +++--
>  9 files changed, 52 insertions(+), 377 deletions(-)
>  delete mode 100644 meta/recipes-graphics/wayland/weston/0001-libweston=
-backend-drm-Re-order-gbm-destruction-at-DR.patch
>  delete mode 100644 meta/recipes-graphics/wayland/weston/0001-meson.bui=
ld-fix-incorrect-header.patch
>  delete mode 100644 meta/recipes-graphics/wayland/weston/0001-tests-inc=
lude-fcntl.h-for-open-O_RDWR-O_CLOEXEC-and-.patch
>  delete mode 100644 meta/recipes-graphics/wayland/weston/0001-weston-la=
unch-Provide-a-default-version-that-doesn-t.patch
>  rename meta/recipes-graphics/wayland/{weston_9.0.0.bb =3D> weston_9.0.=
93.bb} (79%)
>=20
> diff --git a/meta/lib/oeqa/runtime/cases/weston.py b/meta/lib/oeqa/runt=
ime/cases/weston.py
> index b3a7c2776d..b81cc299ef 100644
> --- a/meta/lib/oeqa/runtime/cases/weston.py
> +++ b/meta/lib/oeqa/runtime/cases/weston.py
> @@ -10,7 +10,7 @@ import threading
>  import time
> =20
>  class WestonTest(OERuntimeTestCase):
> -    weston_log_file =3D '/tmp/weston.log'
> +    weston_log_file =3D '/tmp/weston-2.log'
> =20
>      @classmethod
>      def tearDownClass(cls):
> @@ -31,13 +31,13 @@ class WestonTest(OERuntimeTestCase):
>          return output.split(" ")
> =20
>      def get_weston_command(self, cmd):
> -        return 'export XDG_RUNTIME_DIR=3D/run/user/0; export WAYLAND_D=
ISPLAY=3Dwayland-0; %s' % cmd
> +        return 'export XDG_RUNTIME_DIR=3D/run/user/`id -u weston`; exp=
ort WAYLAND_DISPLAY=3Dwayland-1; %s' % cmd
> =20
>      def run_weston_init(self):
>          if 'systemd' in self.tc.td['VIRTUAL-RUNTIME_init_manager']:
>              self.target.run('systemd-run --collect --unit=3Dweston-pte=
st.service --uid=3D0 -p PAMName=3Dlogin -p TTYPath=3D/dev/tty6 -E XDG_RUN=
TIME_DIR=3D/tmp -E WAYLAND_DISPLAY=3Dwayland-0 /usr/bin/weston --socket=3D=
wayland-1 --log=3D%s' % self.weston_log_file)
>          else:
> -            self.target.run(self.get_weston_command('openvt -- weston =
--socket=3Dwayland-1 --log=3D%s' % self.weston_log_file))
> +            self.target.run(self.get_weston_command('openvt -- weston =
--socket=3Dwayland-2 --log=3D%s' % self.weston_log_file))
> =20
>      def get_new_wayland_processes(self, existing_wl_processes):
>          try_cnt =3D 0
> diff --git a/meta/recipes-graphics/wayland/weston-init/init b/meta/reci=
pes-graphics/wayland/weston-init/init
> index a849f29bcb..d3b0d1873e 100644
> --- a/meta/recipes-graphics/wayland/weston-init/init
> +++ b/meta/recipes-graphics/wayland/weston-init/init
> @@ -32,7 +32,7 @@ case "$1" in
>          . /etc/profile
>  	export HOME=3DROOTHOME
> =20
> -        weston-start -- $OPTARGS
> +        WESTON_USER=3Dweston weston-start $OPTARGS &
>    ;;
> =20
>    stop)
> diff --git a/meta/recipes-graphics/wayland/weston-init/weston-start b/m=
eta/recipes-graphics/wayland/weston-init/weston-start
> index 0f1bc4c29d..01670cd4f5 100755
> --- a/meta/recipes-graphics/wayland/weston-init/weston-start
> +++ b/meta/recipes-graphics/wayland/weston-init/weston-start
> @@ -6,7 +6,7 @@ export PATH=3D"/sbin:/usr/sbin:/bin:/usr/bin"
> =20
>  usage() {
>  	cat <<EOF
> -	$0 [<openvt arguments>] [-- <weston options>]
> +	$0 [<weston options>]
>  EOF
>  }
> =20
> @@ -18,11 +18,6 @@ add_weston_argument() {
>  	weston_args=3D"$weston_args $1"
>  }
> =20
> -# Add openvt extra argument
> -add_openvt_argument() {
> -	openvt_args=3D"$openvt_args $1"
> -
> -}
>  ## Add module to --modules argument
>  add_weston_module() {
>  	if [[ "x${weston_modules}" =3D=3D "x" ]]; then
> @@ -37,33 +32,12 @@ if [ -n "$WAYLAND_DISPLAY" ]; then
>  fi
> =20
>  if [ -n "$WESTON_USER" ]; then
> -	if [ -z "$WESTON_TTY" ]; then
> -		echo "ERROR: If you have WESTON_USER variable set, you also need WES=
TON_TTY."
> -		exit 1
> -	fi
>  	if [ -z "$WESTON_GROUP" ]; then
>  		# no explicit WESTON_GROUP given, therefore use WESTON_USER
>  		export WESTON_GROUP=3D"${WESTON_USER}"
>  	fi
> -	weston_args_user=3D"-u $WESTON_USER -t $WESTON_TTY"
>  fi
> =20
> -if [ -n "$DISPLAY" ]; then
> -	launcher=3D"weston"
> -else
> -	launcher=3D"weston-launch $weston_args_user --"
> -fi
> -
> -openvt_args=3D"-s"
> -while [ -n "$1" ]; do
> -	if [ "$1" =3D "--" ]; then
> -		shift
> -		break
> -	fi
> -	openvt_args=3D"$openvt_args $1"
> -	shift
> -done
> -
>  weston_args=3D$*
> =20
>  # Load and run modules
> @@ -94,4 +68,4 @@ if test -z "$XDG_RUNTIME_DIR"; then
>  	fi
>  fi
> =20
> -exec openvt $openvt_args -- $launcher $weston_args --log=3D@LOCALSTATE=
DIR@/log/weston.log
> +su -c "XDG_RUNTIME_DIR=3D/run/user/`id -u ${WESTON_USER}` weston $west=
on_args --log=3D/tmp/weston.log" $WESTON_USER
> diff --git a/meta/recipes-graphics/wayland/weston/0001-libweston-backen=
d-drm-Re-order-gbm-destruction-at-DR.patch b/meta/recipes-graphics/waylan=
d/weston/0001-libweston-backend-drm-Re-order-gbm-destruction-at-DR.patch
> deleted file mode 100644
> index f8f7589499..0000000000
> --- a/meta/recipes-graphics/wayland/weston/0001-libweston-backend-drm-R=
e-order-gbm-destruction-at-DR.patch
> +++ /dev/null
> @@ -1,50 +0,0 @@
> -From c8bfa1f8d576cdc6d515dbbac36c48c6166be0d5 Mon Sep 17 00:00:00 2001
> -From: Marius Vlad <marius.vlad@collabora.com>
> -Date: Thu, 1 Apr 2021 00:12:00 +0300
> -Subject: [PATCH] libweston/backend-drm: Re-order gbm destruction at DR=
M-backend tear down
> -
> -Tearing down the drm-backend when there are no input devices, would ca=
ll
> -for the gbm device destruction before compositor shutdown. The latter
> -would call into the renderer detroy function and assume that the
> -EGLDisplay, which was created using the before-mentioned gbm device, i=
s
> -still available. This patch re-orders the gbm destruction after the
> -compositor shutdown when no one would make use of it.
> -
> -Fixes: #314
> -
> -Signed-off-by: Marius Vlad <marius.vlad@collabora.com>
> -Suggested-by: Daniel Stone <daniel.stone@collabora.com>
> -
> -Upstream-Status: Backport [https://gitlab.freedesktop.org/wayland/west=
on/-/commit/d171c7b3ba346c4d0bd6494f45ebf0be3c3cc5fb]
> ----
> - libweston/backend-drm/drm.c | 8 ++++----
> - 1 file changed, 4 insertions(+), 4 deletions(-)
> -
> -diff --git a/libweston/backend-drm/drm.c b/libweston/backend-drm/drm.c
> -index 2780f3b..fbcfeca 100644
> ---- a/libweston/backend-drm/drm.c
> -+++ b/libweston/backend-drm/drm.c
> -@@ -3025,10 +3025,6 @@ err_drm_source:
> - err_udev_input:
> - 	udev_input_destroy(&b->input);
> - err_sprite:
> --#ifdef BUILD_DRM_GBM
> --	if (b->gbm)
> --		gbm_device_destroy(b->gbm);
> --#endif
> - 	destroy_sprites(b);
> - err_udev_dev:
> - 	udev_device_unref(drm_device);
> -@@ -3038,6 +3034,10 @@ err_launcher:
> - 	weston_launcher_destroy(compositor->launcher);
> - err_compositor:
> - 	weston_compositor_shutdown(compositor);
> -+#ifdef BUILD_DRM_GBM
> -+	if (b->gbm)
> -+		gbm_device_destroy(b->gbm);
> -+#endif
> - 	free(b);
> - 	return NULL;
> - }
> ---
> -2.33.0
> diff --git a/meta/recipes-graphics/wayland/weston/0001-meson.build-fix-=
incorrect-header.patch b/meta/recipes-graphics/wayland/weston/0001-meson.=
build-fix-incorrect-header.patch
> deleted file mode 100644
> index 06e0f7baec..0000000000
> --- a/meta/recipes-graphics/wayland/weston/0001-meson.build-fix-incorre=
ct-header.patch
> +++ /dev/null
> @@ -1,32 +0,0 @@
> -From a2ba4714a6872e547621d29d9ddcb0f374b88cf6 Mon Sep 17 00:00:00 2001
> -From: Chen Qi <Qi.Chen@windriver.com>
> -Date: Tue, 20 Apr 2021 20:42:18 -0700
> -Subject: [PATCH] meson.build: fix incorrect header
> -
> -The wayland.c actually include 'xdg-shell-client-protocol.h' instead o=
f
> -the server one, so fix it. Otherwise, it's possible to get build failu=
re
> -due to race condition.
> -
> -Upstream-Status: Pending
> -
> -Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ----
> - libweston/backend-wayland/meson.build | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/libweston/backend-wayland/meson.build b/libweston/backend=
-wayland/meson.build
> -index 7e82513..29270b5 100644
> ---- a/libweston/backend-wayland/meson.build
> -+++ b/libweston/backend-wayland/meson.build
> -@@ -10,7 +10,7 @@ srcs_wlwl =3D [
> - 	fullscreen_shell_unstable_v1_protocol_c,
> - 	presentation_time_protocol_c,
> - 	presentation_time_server_protocol_h,
> --	xdg_shell_server_protocol_h,
> -+	xdg_shell_client_protocol_h,
> - 	xdg_shell_protocol_c,
> - ]
> -=20
> ---=20
> -2.30.2
> -
> diff --git a/meta/recipes-graphics/wayland/weston/0001-tests-include-fc=
ntl.h-for-open-O_RDWR-O_CLOEXEC-and-.patch b/meta/recipes-graphics/waylan=
d/weston/0001-tests-include-fcntl.h-for-open-O_RDWR-O_CLOEXEC-and-.patch
> deleted file mode 100644
> index 6fe86ff3f0..0000000000
> --- a/meta/recipes-graphics/wayland/weston/0001-tests-include-fcntl.h-f=
or-open-O_RDWR-O_CLOEXEC-and-.patch
> +++ /dev/null
> @@ -1,47 +0,0 @@
> -From 58760e09eed662a72da939ff4802d605489cff8e Mon Sep 17 00:00:00 2001
> -From: Denys Dmytriyenko <denys@ti.com>
> -Date: Tue, 8 Sep 2020 19:37:42 -0400
> -Subject: [PATCH] tests: include fcntl.h for open(), O_RDWR, O_CLOEXEC =
and
> - O_CREAT
> -
> -musl libc (unlike glibc) requires explicitly incuding fcntl.h to defin=
e open(),
> -O_RDWR, O_CLOEXEC and O_CREAT. Otherwise the build fails with the erro=
rs:
> -
> -| ../weston-9.0.0/tests/weston-test-fixture-compositor.c: In function =
'wait_for_lock':
> -| ../weston-9.0.0/tests/weston-test-fixture-compositor.c:135:7: warnin=
g: implicit declaration of function 'open'; did you mean 'popen'? [-Wimpl=
icit-function-declaration]
> -|   135 |  fd =3D open(lock_path, O_RDWR | O_CLOEXEC | O_CREAT, 00700)=
;
> -|       |       ^~~~
> -|       |       popen
> -| ../weston-9.0.0/tests/weston-test-fixture-compositor.c:135:23: error=
: 'O_RDWR' undeclared (first use in this function)
> -|   135 |  fd =3D open(lock_path, O_RDWR | O_CLOEXEC | O_CREAT, 00700)=
;
> -|       |                       ^~~~~~
> -| ../weston-9.0.0/tests/weston-test-fixture-compositor.c:135:23: note:=
 each undeclared identifier is reported only once for each function it ap=
pears in
> -| ../weston-9.0.0/tests/weston-test-fixture-compositor.c:135:32: error=
: 'O_CLOEXEC' undeclared (first use in this function)
> -|   135 |  fd =3D open(lock_path, O_RDWR | O_CLOEXEC | O_CREAT, 00700)=
;
> -|       |                                ^~~~~~~~~
> -| ../weston-9.0.0/tests/weston-test-fixture-compositor.c:135:44: error=
: 'O_CREAT' undeclared (first use in this function)
> -|   135 |  fd =3D open(lock_path, O_RDWR | O_CLOEXEC | O_CREAT, 00700)=
;
> -|       |                                            ^~~~~~~
> -
> -Upstream-Status: Submitted [https://gitlab.freedesktop.org/wayland/wes=
ton/-/merge_requests/493/diffs?commit_id=3Db10c0e843dcb8148bbe869bb152619=
55b94ac98c]
> -
> -Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ----
> - tests/weston-test-fixture-compositor.c | 1 +
> - 1 file changed, 1 insertion(+)
> -
> -diff --git a/tests/weston-test-fixture-compositor.c b/tests/weston-tes=
t-fixture-compositor.c
> -index 0c9855f..e0e32c9 100644
> ---- a/tests/weston-test-fixture-compositor.c
> -+++ b/tests/weston-test-fixture-compositor.c
> -@@ -31,6 +31,7 @@
> - #include <unistd.h>
> - #include <sys/file.h>
> - #include <errno.h>
> -+#include <fcntl.h>
> -=20
> - #include "shared/helpers.h"
> - #include "weston-test-fixture-compositor.h"
> ---=20
> -2.7.4
> -
> diff --git a/meta/recipes-graphics/wayland/weston/0001-weston-launch-Pr=
ovide-a-default-version-that-doesn-t.patch b/meta/recipes-graphics/waylan=
d/weston/0001-weston-launch-Provide-a-default-version-that-doesn-t.patch
> deleted file mode 100644
> index f6ebfd8f61..0000000000
> --- a/meta/recipes-graphics/wayland/weston/0001-weston-launch-Provide-a=
-default-version-that-doesn-t.patch
> +++ /dev/null
> @@ -1,199 +0,0 @@
> -From a1548c742bf2dedbb47282d8a00407b60bbab669 Mon Sep 17 00:00:00 2001
> -From: Tom Hochstein <tom.hochstein@nxp.com>
> -Date: Wed, 22 Feb 2017 15:53:30 +0200
> -Subject: [PATCH] weston-launch: Provide a default version that doesn't=
 require
> -
> - PAM
> -
> -weston-launch requires PAM for starting weston as a non-root user.
> -
> -Since starting weston as root is a valid use case by itself, if
> -PAM is not available, provide a default version of weston-launch
> -without non-root-user support.
> -
> -Upstream-Status: Denied [https://gitlab.freedesktop.org/wayland/weston=
/-/merge_requests/725]
> -
> -Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>
> -Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
> -Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> -Signed-off-by: Ming Liu <ming.liu@toradex.com>
> -
> ----
> - libweston/meson.build     | 16 ++++++++++++----
> - libweston/weston-launch.c | 21 +++++++++++++++++++++
> - meson_options.txt         |  7 +++++++
> - 3 files changed, 40 insertions(+), 4 deletions(-)
> -
> -diff --git a/libweston/meson.build b/libweston/meson.build
> -index 08d23ec..cb9fd3f 100644
> ---- a/libweston/meson.build
> -+++ b/libweston/meson.build
> -@@ -216,16 +216,24 @@ dep_vertex_clipping =3D declare_dependency(
> - )
> -=20
> - if get_option('weston-launch')
> --	dep_pam =3D cc.find_library('pam')
> -+	deps_weston_launch =3D [systemd_dep, dep_libdrm]
> -=20
> --	if not cc.has_function('pam_open_session', dependencies: dep_pam)
> --		error('pam_open_session not found for weston-launch')
> -+	if get_option('pam')
> -+		dep_pam =3D cc.find_library('pam')
> -+		if not cc.has_function('pam_open_session', dependencies: dep_pam)
> -+			error('pam_open_session not found for weston-launch')
> -+		endif
> -+
> -+		if dep_pam.found()
> -+			deps_weston_launch +=3D dep_pam
> -+			config_h.set('HAVE_PAM', '1')
> -+		endif
> - 	endif
> -=20
> - 	executable(
> - 		'weston-launch',
> - 		'weston-launch.c',
> --		dependencies: [dep_pam, systemd_dep, dep_libdrm],
> -+		dependencies: deps_weston_launch,
> - 		include_directories: common_inc,
> - 		install: true
> - 	)
> -diff --git a/libweston/weston-launch.c b/libweston/weston-launch.c
> -index 521cb2c..2d42d33 100644
> ---- a/libweston/weston-launch.c
> -+++ b/libweston/weston-launch.c
> -@@ -51,7 +51,9 @@
> -=20
> - #include <pwd.h>
> - #include <grp.h>
> -+#ifdef HAVE_PAM
> - #include <security/pam_appl.h>
> -+#endif
> -=20
> - #ifdef HAVE_SYSTEMD_LOGIN
> - #include <systemd/sd-login.h>
> -@@ -100,8 +102,10 @@ drmSetMaster(int drm_fd)
> - #endif
> -=20
> - struct weston_launch {
> -+#ifdef HAVE_PAM
> - 	struct pam_conv pc;
> - 	pam_handle_t *ph;
> -+#endif
> - 	int tty;
> - 	int ttynr;
> - 	int sock[2];
> -@@ -192,6 +196,7 @@ weston_launch_allowed(struct weston_launch *wl)
> - 	return false;
> - }
> -=20
> -+#ifdef HAVE_PAM
> - static int
> - pam_conversation_fn(int msg_count,
> - 		    const struct pam_message **messages,
> -@@ -232,6 +237,7 @@ setup_pam(struct weston_launch *wl)
> -=20
> - 	return 0;
> - }
> -+#endif
> -=20
> - static int
> - setup_launcher_socket(struct weston_launch *wl)
> -@@ -466,6 +472,7 @@ quit(struct weston_launch *wl, int status)
> - 	close(wl->signalfd);
> - 	close(wl->sock[0]);
> -=20
> -+#ifdef HAVE_PAM
> - 	if (wl->new_user) {
> - 		err =3D pam_close_session(wl->ph, 0);
> - 		if (err)
> -@@ -473,6 +480,7 @@ quit(struct weston_launch *wl, int status)
> - 				err, pam_strerror(wl->ph, err));
> - 		pam_end(wl->ph, err);
> - 	}
> -+#endif
> -=20
> - 	/*
> - 	 * Get a fresh handle to the tty as the previous one is in
> -@@ -710,6 +718,7 @@ setup_session(struct weston_launch *wl, char **chi=
ld_argv)
> - 	setenv("HOME", wl->pw->pw_dir, 1);
> - 	setenv("SHELL", wl->pw->pw_shell, 1);
> -=20
> -+#ifdef HAVE_PAM
> - 	env =3D pam_getenvlist(wl->ph);
> - 	if (env) {
> - 		for (i =3D 0; env[i]; ++i) {
> -@@ -718,6 +727,7 @@ setup_session(struct weston_launch *wl, char **chi=
ld_argv)
> - 		}
> - 		free(env);
> - 	}
> -+#endif
> -=20
> - 	/*
> - 	 * We open a new session, so it makes sense
> -@@ -789,8 +799,10 @@ static void
> - help(const char *name)
> - {
> - 	fprintf(stderr, "Usage: %s [args...] [-- [weston args..]]\n", name);
> -+#ifdef HAVE_PAM
> - 	fprintf(stderr, "  -u, --user      Start session as specified userna=
me,\n"
> - 			"                  e.g. -u joe, requires root.\n");
> -+#endif
> - 	fprintf(stderr, "  -t, --tty       Start session on alternative tty,=
\n"
> - 			"                  e.g. -t /dev/tty4, requires -u option.\n");
> - 	fprintf(stderr, "  -v, --verbose   Be verbose\n");
> -@@ -804,7 +816,9 @@ main(int argc, char *argv[])
> - 	int i, c;
> - 	char *tty =3D NULL;
> - 	struct option opts[] =3D {
> -+#ifdef HAVE_PAM
> - 		{ "user",    required_argument, NULL, 'u' },
> -+#endif
> - 		{ "tty",     required_argument, NULL, 't' },
> - 		{ "verbose", no_argument,       NULL, 'v' },
> - 		{ "help",    no_argument,       NULL, 'h' },
> -@@ -816,11 +830,16 @@ main(int argc, char *argv[])
> - 	while ((c =3D getopt_long(argc, argv, "u:t:vh", opts, &i)) !=3D -1) =
{
> - 		switch (c) {
> - 		case 'u':
> -+#ifdef HAVE_PAM
> - 			wl.new_user =3D optarg;
> - 			if (getuid() !=3D 0) {
> - 				fprintf(stderr, "weston: Permission denied. -u allowed for root o=
nly\n");
> - 				exit(EXIT_FAILURE);
> - 			}
> -+#else
> -+			fprintf(stderr, "weston: -u is unsupported in this weston-launch b=
uild\n");
> -+			exit(EXIT_FAILURE);
> -+#endif
> - 			break;
> - 		case 't':
> - 			tty =3D optarg;
> -@@ -872,8 +891,10 @@ main(int argc, char *argv[])
> - 	if (setup_tty(&wl, tty) < 0)
> - 		exit(EXIT_FAILURE);
> -=20
> -+#ifdef HAVE_PAM
> - 	if (wl.new_user && setup_pam(&wl) < 0)
> - 		exit(EXIT_FAILURE);
> -+#endif
> -=20
> - 	if (setup_launcher_socket(&wl) < 0)
> - 		exit(EXIT_FAILURE);
> -diff --git a/meson_options.txt b/meson_options.txt
> -index 239bd2d..99e4ec3 100644
> ---- a/meson_options.txt
> -+++ b/meson_options.txt
> -@@ -73,6 +73,13 @@ option(
> - )
> -=20
> - option(
> -+	'pam',
> -+	type: 'boolean',
> -+	value: true,
> -+	description: 'Define if PAM is available'
> -+)
> -+
> -+option(
> - 	'xwayland',
> - 	type: 'boolean',
> - 	value: true,
> diff --git a/meta/recipes-graphics/wayland/weston/dont-use-plane-add-pr=
op.patch b/meta/recipes-graphics/wayland/weston/dont-use-plane-add-prop.p=
atch
> index a4444e5d18..c2486b90bf 100644
> --- a/meta/recipes-graphics/wayland/weston/dont-use-plane-add-prop.patc=
h
> +++ b/meta/recipes-graphics/wayland/weston/dont-use-plane-add-prop.patc=
h
> @@ -1,4 +1,7 @@
> -Fix atomic modesetting with musl
> +From 2501702805a1ba669c546111f1a4840e49a29d75 Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Sat, 12 Sep 2020 14:04:04 -0700
> +Subject: [PATCH] Fix atomic modesetting with musl
> =20
>  atomic modesetting seems to fail with drm weston backend and this patc=
h fixes
>  it, below errors are seen before weston exits
> @@ -8,9 +11,15 @@ atomic: couldn't commit new state: Invalid argument
>  Upstream-Status: Submitted [https://gitlab.freedesktop.org/wayland/wes=
ton/-/issues/158]
>  Signed-off-by: Khem Raj <raj.khem@gmail.com>
> =20
> +---
> + libweston/backend-drm/kms.c | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/libweston/backend-drm/kms.c b/libweston/backend-drm/kms.c
> +index 780d007..9994da1 100644
>  --- a/libweston/backend-drm/kms.c
>  +++ b/libweston/backend-drm/kms.c
> -@@ -1168,8 +1168,8 @@ drm_pending_state_apply_atomic(struct dr
> +@@ -1142,8 +1142,8 @@ drm_pending_state_apply_atomic(struct drm_pendin=
g_state *pending_state,
>   		wl_list_for_each(plane, &b->plane_list, link) {
>   			drm_debug(b, "\t\t[atomic] starting with plane %lu disabled\n",
>   				  (unsigned long) plane->plane_id);
> diff --git a/meta/recipes-graphics/wayland/weston_9.0.0.bb b/meta/recip=
es-graphics/wayland/weston_9.0.93.bb
> similarity index 79%
> rename from meta/recipes-graphics/wayland/weston_9.0.0.bb
> rename to meta/recipes-graphics/wayland/weston_9.0.93.bb
> index 59ab217a3b..88fd859e72 100644
> --- a/meta/recipes-graphics/wayland/weston_9.0.0.bb
> +++ b/meta/recipes-graphics/wayland/weston_9.0.93.bb
> @@ -1,24 +1,43 @@
> +# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upg=
rade'.
> +# The following is the difference between the old and the new license =
text.
> +# Please update the LICENSE value if needed, and summarize the changes=
 in
> +# the commit message via 'License-Update:' tag.
> +# (example: 'License-Update: copyright years updated.')
> +#
> +# The changes:
> +#
> +# --- libweston/compositor.c
> +# +++ libweston/compositor.c
> +# @@ -1,7 +1,7 @@
> +#  /*
> +#   * Copyright =A9 2010-2011 Intel Corporation
> +#   * Copyright =A9 2008-2011 Kristian H=F8gsberg
> +# - * Copyright =A9 2012-2018 Collabora, Ltd.
> +# + * Copyright =A9 2012-2018, 2021 Collabora, Ltd.
> +#   * Copyright =A9 2017, 2018 General Electric Company
> +#   *
> +#   * Permission is hereby granted, free of charge, to any person obta=
ining
> +#=20
> +#
> +
>  SUMMARY =3D "Weston, a Wayland compositor"
>  DESCRIPTION =3D "Weston is the reference implementation of a Wayland c=
ompositor"
>  HOMEPAGE =3D "http://wayland.freedesktop.org"
>  LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd79ee9e66bb0f95d3386a7acae7=
80b70 \
> -                    file://libweston/compositor.c;endline=3D27;md5=3D6=
c53bbbd99273f4f7c4affa855c33c0a"
> +                    file://libweston/compositor.c;endline=3D27;md5=3De=
b6d5297798cabe2ddc65e2af519bcf0 \
> +                    "
> =20
>  SRC_URI =3D "https://wayland.freedesktop.org/releases/${BPN}-${PV}.tar=
.xz \
>             file://weston.png \
>             file://weston.desktop \
>             file://xwayland.weston-start \
>             file://systemd-notify.weston-start \
> -           file://0001-weston-launch-Provide-a-default-version-that-do=
esn-t.patch \
> -           file://0001-tests-include-fcntl.h-for-open-O_RDWR-O_CLOEXEC=
-and-.patch \
> -           file://0001-meson.build-fix-incorrect-header.patch \
> -           file://0001-libweston-backend-drm-Re-order-gbm-destruction-=
at-DR.patch \
> -"
> +           "
> =20
>  SRC_URI:append:libc-musl =3D " file://dont-use-plane-add-prop.patch "
> =20
> -SRC_URI[sha256sum] =3D "5cf5d6ce192e0eb15c1fc861a436bf21b5bb3b91dbdabb=
debe83e1f83aa098fe"
> +SRC_URI[sha256sum] =3D "4536cf68f320d260a891871f3607b93d8cc9111fbb12df=
1e0460d26490129ef7"
> =20
>  UPSTREAM_CHECK_URI =3D "https://wayland.freedesktop.org/releases.html"
> =20
> @@ -32,15 +51,16 @@ DEPENDS +=3D "wayland wayland-protocols libinput vi=
rtual/egl pango wayland-native"
> =20
>  LDFLAGS +=3D "${@bb.utils.contains('DISTRO_FEATURES', 'lto', '-Wl,-z,u=
ndefs', '', d)}"
> =20
> -WESTON_MAJOR_VERSION =3D "${@'.'.join(d.getVar('PV').split('.')[0:1])}=
"
> +#WESTON_MAJOR_VERSION =3D "${@'.'.join(d.getVar('PV').split('.')[0:1])=
}"
> +WESTON_MAJOR_VERSION =3D "10"
> =20
> -EXTRA_OEMESON +=3D "-Dbackend-default=3Dauto -Dpipewire=3Dfalse"
> +EXTRA_OEMESON +=3D "-Dpipewire=3Dfalse"
> =20
> -PACKAGECONFIG ??=3D "${@bb.utils.contains('DISTRO_FEATURES', 'wayland'=
, 'kms fbdev wayland egl clients', '', d)} \
> +PACKAGECONFIG ??=3D "${@bb.utils.contains('DISTRO_FEATURES', 'wayland'=
, 'kms wayland egl clients', '', d)} \
>                     ${@bb.utils.contains('DISTRO_FEATURES', 'x11 waylan=
d', 'xwayland', '', d)} \
> -                   ${@bb.utils.filter('DISTRO_FEATURES', 'pam systemd =
x11', d)} \
> +                   ${@bb.utils.filter('DISTRO_FEATURES', 'systemd x11'=
, d)} \
>                     ${@bb.utils.contains_any('DISTRO_FEATURES', 'waylan=
d x11', '', 'headless', d)} \
> -                   launch \
> +                   ${@oe.utils.conditional('VIRTUAL-RUNTIME_init_manag=
er', 'sysvinit', 'launcher-libseat', '', d)} \
>                     image-jpeg \
>                     screenshare \
>                     shell-desktop \
> @@ -59,7 +79,7 @@ PACKAGECONFIG[x11] =3D "-Dbackend-x11=3Dtrue,-Dbacken=
d-x11=3Dfalse,virtual/libx11 libx
>  # Headless Weston
>  PACKAGECONFIG[headless] =3D "-Dbackend-headless=3Dtrue,-Dbackend-headl=
ess=3Dfalse"
>  # Weston on framebuffer
> -PACKAGECONFIG[fbdev] =3D "-Dbackend-fbdev=3Dtrue,-Dbackend-fbdev=3Dfal=
se,udev mtdev"
> +PACKAGECONFIG[fbdev] =3D "-Ddeprecated-backend-fbdev=3Dtrue,-Ddeprecat=
ed-backend-fbdev=3Dfalse,udev mtdev"
>  # Weston on RDP
>  PACKAGECONFIG[rdp] =3D "-Dbackend-rdp=3Dtrue,-Dbackend-rdp=3Dfalse,fre=
erdp"
>  # weston-launch
> @@ -82,8 +102,6 @@ PACKAGECONFIG[colord] =3D "-Dcolor-management-colord=
=3Dtrue,-Dcolor-management-color
>  PACKAGECONFIG[clients] =3D "-Dsimple-clients=3Dall -Ddemo-clients=3Dtr=
ue,-Dsimple-clients=3D -Ddemo-clients=3Dfalse"
>  # Virtual remote output with GStreamer on DRM backend
>  PACKAGECONFIG[remoting] =3D "-Dremoting=3Dtrue,-Dremoting=3Dfalse,gstr=
eamer1.0 gstreamer1.0-plugins-base"
> -# Weston with PAM support
> -PACKAGECONFIG[pam] =3D "-Dpam=3Dtrue,-Dpam=3Dfalse,libpam"
>  # Weston with screen-share support
>  PACKAGECONFIG[screenshare] =3D "-Dscreenshare=3Dtrue,-Dscreenshare=3Df=
alse"
>  # Traditional desktop shell
> @@ -94,6 +112,8 @@ PACKAGECONFIG[shell-fullscreen] =3D "-Dshell-fullscr=
een=3Dtrue,-Dshell-fullscreen=3Dfa
>  PACKAGECONFIG[shell-ivi] =3D "-Dshell-ivi=3Dtrue,-Dshell-ivi=3Dfalse"
>  # JPEG image loading support
>  PACKAGECONFIG[image-jpeg] =3D "-Dimage-jpeg=3Dtrue,-Dimage-jpeg=3Dfals=
e, jpeg"
> +# support libseat based launch
> +PACKAGECONFIG[launcher-libseat] =3D "-Dlauncher-libseat=3Dtrue,-Dlaunc=
her-libseat=3Dfalse,seatd"
> =20
>  do_install:append() {
>  	# Weston doesn't need the .la files to load modules, so wipe them
> --=20
> 2.20.1
>=20

