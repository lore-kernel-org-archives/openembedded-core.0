Return-Path: <net147@gmail.com>
Received: from mail-vb0-f51.google.com (mail-vb0-f51.google.com
	[209.85.212.51])
	by mail.openembedded.org (Postfix) with ESMTP id D3CD560897
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 May 2013 03:52:29 +0000 (UTC)
Received: by mail-vb0-f51.google.com with SMTP id x16so1850549vbf.10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 May 2013 20:52:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=+/MDTGej1Rzga4P/8QyKOeXn4t5/b2FV8nmwg64Sxno=;
	b=IO5/hr6A5O3IC/rRrDfz2ednx20xspGD82PShY1UmXHO0R5lZcbgzr3GtqjWlZEKBS
	uSJXK+FoLe9w1otv5GGJcs09jWZ+WyGBhIUFwFAnwtz6AnzUNGUF1EJg4VxRyYKbL1qG
	osnCr84Vmmp74gwYB6EYAjLlywGJITKWPlP4N6KvT1v7o81vS+Pgdom/tkLr7pVMdZ1p
	RfDKPYP4fV70EzP7MDPjMjNiRgFi0caU1W+LNxYq0tulZxvWmsVbh9kAG0JHoGoS/YMa
	noZ6ES0dX4n3TWEM0gsTA9LJAa7u7eMwIzQGhlLRrbaiZuowFSuUOGf5DWSJNTsxZ6UT
	NcQQ==
MIME-Version: 1.0
X-Received: by 10.52.95.227 with SMTP id dn3mr3437604vdb.111.1369281150338;
	Wed, 22 May 2013 20:52:30 -0700 (PDT)
Received: by 10.58.34.132 with HTTP; Wed, 22 May 2013 20:52:30 -0700 (PDT)
In-Reply-To: <1369281721-7933-1-git-send-email-net147@gmail.com>
References: <1369281721-7933-1-git-send-email-net147@gmail.com>
Date: Thu, 23 May 2013 13:52:30 +1000
Message-ID: <CANwerB2Vx6Qy2sdbJQ92NUWqg7rB1UH84ZQ4uLkwfiteTVgEdQ@mail.gmail.com>
From: Jonathan Liu <net147@gmail.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v4] base-files: add /run directory from FHS 3 draft specification
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
X-List-Received-Date: Thu, 23 May 2013 03:52:30 -0000
Content-Type: multipart/alternative; boundary=20cf307d04ae906c0804dd5a9c28

--20cf307d04ae906c0804dd5a9c28
Content-Type: text/plain; charset=UTF-8

Note that I have rebased the patch so it depends on:
- [PATCH v4] systemd: update to 204

Regards,
Jonathan


On 23 May 2013 14:02, Jonathan Liu <net147@gmail.com> wrote:

> This adds the /run directory from the Filesystem Hierarchy Standard 3.0
> Draft [1] and refactors the filesystem as follows:
> - Remove creation of /var/volatile/run
> - Remove creation of /var/volatile/lock
> - Remove symbolic link from /var/run to /var/volatile/run
> - Remove symbolic link from /var/lock to /var/volatile/lock
> - Add symbolic link from /var/run to /run
> - Add symbolic link from /var/lock -> /run/lock
> - Add /run to /etc/fstab for sysvinit compatibility
>
> The systemd init script has been modified as follows:
> - Do not create /var/volatile/run
> - Do not create symbolic link from /run to /var/run if /run doesn't
>   exist
>
> A few things have also been cleaned up:
> - Remove udev workaround to ensure /run exists
> - Remove clearing of /var/run as it points to a tmpfs anyway
> - Remove permissions workaround for /var/run/utmp as
>   systemd-update-utmp-runlevel.service starts correctly without it
>
> [1] http://www.linuxbase.org/betaspecs/fhs/fhs.html#runRuntimeVariableData
>
> Signed-off-by: Jonathan Liu <net147@gmail.com>
> ---
>  meta/files/fs-perms.txt                                   |  5 ++---
>  meta/recipes-core/base-files/base-files/fstab             |  1 +
>  meta/recipes-core/base-files/base-files_3.0.14.bb         | 10 +++++-----
>  meta/recipes-core/initscripts/initscripts-1.0/volatiles   |  7 +++----
>  meta/recipes-core/systemd/systemd/00-create-volatile.conf |  2 --
>  meta/recipes-core/systemd/systemd/init                    |  4 ----
>  meta/recipes-core/systemd/systemd/var-run.conf            |  4 ----
>  meta/recipes-core/systemd/systemd_204.bb                  |  3 ---
>  meta/recipes-core/udev/udev.inc                           |  6 +-----
>  meta/recipes-core/udev/udev/init                          |  1 -
>  meta/recipes-core/udev/udev/volatiles                     |  1 -
>  11 files changed, 12 insertions(+), 32 deletions(-)
>  delete mode 100644 meta/recipes-core/systemd/systemd/var-run.conf
>  delete mode 100644 meta/recipes-core/udev/udev/volatiles
>
> diff --git a/meta/files/fs-perms.txt b/meta/files/fs-perms.txt
> index becb85c..c829bec 100644
> --- a/meta/files/fs-perms.txt
> +++ b/meta/files/fs-perms.txt
> @@ -45,15 +45,14 @@ ${oldincludedir}    0755    root    root    true
>  0644    root    root
>
>  # Items from base-files
>  # Links
> -${localstatedir}/run   link    volatile/run
> +${localstatedir}/run   link    /run
>  ${localstatedir}/log   link    volatile/log
> -${localstatedir}/lock  link    volatile/lock
> +${localstatedir}/lock  link    /run/lock
>  ${localstatedir}/tmp   link    volatile/tmp
>
>  # Special permissions from base-files
>  # Set 1777
>  /tmp                           01777   root    root    false - - -
> -${localstatedir}/volatile/lock 01777   root    root    false - - -
>  ${localstatedir}/volatile/tmp  01777   root    root    false - - -
>
>  # Set 2775
> diff --git a/meta/recipes-core/base-files/base-files/fstab
> b/meta/recipes-core/base-files/base-files/fstab
> index f0eed36..dd613a1 100644
> --- a/meta/recipes-core/base-files/base-files/fstab
> +++ b/meta/recipes-core/base-files/base-files/fstab
> @@ -4,6 +4,7 @@ rootfs               /                    auto
> defaults              1  1
>  proc                 /proc                proc       defaults
>  0  0
>  devpts               /dev/pts             devpts     mode=0620,gid=5
>   0  0
>  usbdevfs             /proc/bus/usb        usbdevfs   noauto
>  0  0
> +tmpfs                /run                 tmpfs
>  mode=0755,nodev,nosuid,strictatime 0  0
>  tmpfs                /var/volatile        tmpfs      defaults
>  0  0
>  tmpfs                /media/ram           tmpfs      defaults
>  0  0
>
> diff --git a/meta/recipes-core/base-files/base-files_3.0.14.bbb/meta/recipes-core/base-files/
> base-files_3.0.14.bb
> index a56450d..60185e1 100644
> --- a/meta/recipes-core/base-files/base-files_3.0.14.bb
> +++ b/meta/recipes-core/base-files/base-files_3.0.14.bb
> @@ -31,10 +31,10 @@ S = "${WORKDIR}"
>  INHIBIT_DEFAULT_DEPS = "1"
>
>  docdir_append = "/${P}"
> -dirs1777 = "/tmp ${localstatedir}/volatile/lock
> ${localstatedir}/volatile/tmp"
> +dirs1777 = "/tmp ${localstatedir}/volatile/tmp"
>  dirs2775 = "/home ${prefix}/src ${localstatedir}/local"
>  dirs755 = "/bin /boot /dev ${sysconfdir} ${sysconfdir}/default \
> -           ${sysconfdir}/skel /lib /mnt /proc ${ROOT_HOME} /sbin \
> +           ${sysconfdir}/skel /lib /mnt /proc ${ROOT_HOME} /run /sbin \
>             ${prefix} ${bindir} ${docdir} /usr/games ${includedir} \
>             ${libdir} ${sbindir} ${datadir} \
>             ${datadir}/common-licenses ${datadir}/dict ${infodir} \
> @@ -42,9 +42,7 @@ dirs755 = "/bin /boot /dev ${sysconfdir}
> ${sysconfdir}/default \
>             ${localstatedir}/backups ${localstatedir}/lib \
>             /sys ${localstatedir}/lib/misc ${localstatedir}/spool \
>             ${localstatedir}/volatile \
> -           ${localstatedir}/volatile/lock/subsys \
>             ${localstatedir}/volatile/log \
> -           ${localstatedir}/volatile/run \
>             /mnt /media /media/card /media/cf /media/net /media/ram \
>             /media/union /media/realroot /media/hdd \
>             /media/mmc1"
> @@ -54,7 +52,7 @@ dirs3755 = "/srv  \
>              ${prefix}/local/share ${prefix}/local/src"
>  dirs4775 = "/var/mail"
>
> -volatiles = "run log lock tmp"
> +volatiles = "log tmp"
>  conffiles = "${sysconfdir}/debian_version ${sysconfdir}/host.conf \
>               ${sysconfdir}/inputrc ${sysconfdir}/issue /${sysconfdir}/
> issue.net \
>               ${sysconfdir}/nsswitch.conf ${sysconfdir}/profile \
> @@ -83,6 +81,8 @@ do_install () {
>         for d in card cf net ram; do
>                 ln -sf /media/$d ${D}/mnt/$d
>         done
> +       ln -sf /run ${D}${localstatedir}/run
> +       ln -sf /run/lock ${D}${localstatedir}/lock
>
>         ${BASEFILESISSUEINSTALL}
>
> diff --git a/meta/recipes-core/initscripts/initscripts-1.0/volatiles
> b/meta/recipes-core/initscripts/initscripts-1.0/volatiles
> index 270f128..297245d 100644
> --- a/meta/recipes-core/initscripts/initscripts-1.0/volatiles
> +++ b/meta/recipes-core/initscripts/initscripts-1.0/volatiles
> @@ -21,13 +21,12 @@
>  # This explains the order of "link before object" as in the example
> above, where
>  # a link will be created at /var/test pointing to /tmp/testfile and due
> to this
>  # link the file defined as /var/test will actually be created as
> /tmp/testfile.
> -d root root 1777 /var/volatile/lock none
> +d root root 1777 /run/lock none
>  d root root 0755 /var/volatile/log none
> -d root root 0755 /var/volatile/run none
>  d root root 1777 /var/volatile/tmp none
> -l root root 1777 /var/lock /var/volatile/lock
> +l root root 1777 /var/lock /run/lock
>  l root root 0755 /var/log /var/volatile/log
> -l root root 0755 /var/run /var/volatile/run
> +l root root 0755 /var/run /run
>  l root root 1777 /var/tmp /var/volatile/tmp
>  l root root 1777 /tmp /var/tmp
>  d root root 0755 /var/lock/subsys none
> diff --git a/meta/recipes-core/systemd/systemd/00-create-volatile.conf
> b/meta/recipes-core/systemd/systemd/00-create-volatile.conf
> index 6163a9c..9ffa88e 100644
> --- a/meta/recipes-core/systemd/systemd/00-create-volatile.conf
> +++ b/meta/recipes-core/systemd/systemd/00-create-volatile.conf
> @@ -4,6 +4,4 @@
>
>
>  d              /var/volatile/log               -       -       -       -
> -d              /var/volatile/lock              -       -       -       -
> -d              /var/volatile/run               -       -       -       -
>  d              /var/volatile/tmp               -       -       -       -
> diff --git a/meta/recipes-core/systemd/systemd/init
> b/meta/recipes-core/systemd/systemd/init
> index ac56cca..7e67a50 100644
> --- a/meta/recipes-core/systemd/systemd/init
> +++ b/meta/recipes-core/systemd/systemd/init
> @@ -42,10 +42,6 @@ case "$1" in
>      [ -e /dev/pts ] || mkdir -m 0755 /dev/pts
>      [ -e /dev/shm ] || mkdir -m 1777 /dev/shm
>      mount -a -t tmpfs 2>/dev/null
> -    mkdir -p /var/volatile/run
> -    if [ ! -e /run ]; then
> -        ln -s /var/run /run
> -    fi
>
>      # cache handling
>      if [ "$DEVCACHE" != "" ]; then
> diff --git a/meta/recipes-core/systemd/systemd/var-run.conf
> b/meta/recipes-core/systemd/systemd/var-run.conf
> deleted file mode 100644
> index c2c18e2..0000000
> --- a/meta/recipes-core/systemd/systemd/var-run.conf
> +++ /dev/null
> @@ -1,4 +0,0 @@
> -# empty /var/run
> -R      /var/run/*      -       -       -       -       -
> -# systemd-update-utmp-runlevel.service fails to start without this
> -f /var/run/utmp 0644 root root - -
> diff --git a/meta/recipes-core/systemd/systemd_204.bbb/meta/recipes-core/systemd/
> systemd_204.bb
> index 8536b2b..74cd3c8 100644
> --- a/meta/recipes-core/systemd/systemd_204.bb
> +++ b/meta/recipes-core/systemd/systemd_204.bb
> @@ -20,7 +20,6 @@ inherit gtk-doc useradd pkgconfig autotools perlnative
> update-rc.d update-altern
>  SRC_URI = "
> http://www.freedesktop.org/software/systemd/systemd-${PV}.tar.xz \
>             file://touchscreen.rules \
>             file://modprobe.rules \
> -           file://var-run.conf \
>             ${UCLIBCPATCHES} \
>
> file://0001-utmp-turn-systemd-update-utmp-shutdown.service-into-.patch \
>             file://00-create-volatile.conf \
> @@ -105,8 +104,6 @@ do_install() {
>
>         install -m 0644 ${WORKDIR}/*.rules ${D}${sysconfdir}/udev/rules.d/
>
> -       install -m 0644 ${WORKDIR}/var-run.conf
> ${D}${sysconfdir}/tmpfiles.d/
> -
>         install -m 0644 ${WORKDIR}/00-create-volatile.conf
> ${D}${sysconfdir}/tmpfiles.d/
>
>         if
> ${@base_contains('DISTRO_FEATURES','sysvinit','true','false',d)}; then
> diff --git a/meta/recipes-core/udev/udev.inc
> b/meta/recipes-core/udev/udev.inc
> index 769d861..92485f5 100644
> --- a/meta/recipes-core/udev/udev.inc
> +++ b/meta/recipes-core/udev/udev.inc
> @@ -26,8 +26,7 @@ SRC_URI =
> "${KERNELORG_MIRROR}/linux/utils/kernel/hotplug/udev-${PV}.tar.gz \
>             file://local.rules \
>             file://udev-cache \
>             file://udev-cache.default \
> -           file://init \
> -           file://volatiles"
> +           file://init"
>
>  inherit autotools pkgconfig update-rc.d
>
> @@ -85,9 +84,6 @@ do_install_append () {
>         install -d ${D}${sysconfdir}/default
>         install -m 0755 ${WORKDIR}/udev-cache.default
> ${D}${sysconfdir}/default/udev-cache
>
> -       install -d ${D}${sysconfdir}/default/volatiles
> -       install -m 0644 ${WORKDIR}/volatiles
> ${D}${sysconfdir}/default/volatiles/00_udev
> -
>         touch ${D}${sysconfdir}/udev/cache.data
>
>         install -d ${D}${sysconfdir}/udev/rules.d/
> diff --git a/meta/recipes-core/udev/udev/init
> b/meta/recipes-core/udev/udev/init
> index cd87f50..95f9c03 100644
> --- a/meta/recipes-core/udev/udev/init
> +++ b/meta/recipes-core/udev/udev/init
> @@ -50,7 +50,6 @@ case "$1" in
>      [ -e /dev/pts ] || mkdir -m 0755 /dev/pts
>      [ -e /dev/shm ] || mkdir -m 1777 /dev/shm
>      mount -a -t tmpfs 2>/dev/null
> -    mkdir -p /var/volatile/run
>      mkdir -p /var/volatile/tmp
>
>      # cache handling
> diff --git a/meta/recipes-core/udev/udev/volatiles
> b/meta/recipes-core/udev/udev/volatiles
> deleted file mode 100644
> index e33561b..0000000
> --- a/meta/recipes-core/udev/udev/volatiles
> +++ /dev/null
> @@ -1 +0,0 @@
> -l root root 0755 /run /var/run
> --
> 1.8.2.3
>
>

--20cf307d04ae906c0804dd5a9c28
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Note that I have rebased the patch so it depends on:<div>-=
=C2=A0[PATCH v4] systemd: update to 204</div><div><br></div><div style>Rega=
rds,</div><div style>Jonathan</div></div><div class=3D"gmail_extra"><br><br=
><div class=3D"gmail_quote">
On 23 May 2013 14:02, Jonathan Liu <span dir=3D"ltr">&lt;<a href=3D"mailto:=
net147@gmail.com" target=3D"_blank">net147@gmail.com</a>&gt;</span> wrote:<=
br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left=
:1px #ccc solid;padding-left:1ex">
<div class=3D"im">This adds the /run directory from the Filesystem Hierarch=
y Standard 3.0<br>
Draft [1] and refactors the filesystem as follows:<br>
</div><div class=3D"im">- Remove creation of /var/volatile/run<br>
- Remove creation of /var/volatile/lock<br>
- Remove symbolic link from /var/run to /var/volatile/run<br>
- Remove symbolic link from /var/lock to /var/volatile/lock<br>
- Add symbolic link from /var/run to /run<br>
- Add symbolic link from /var/lock -&gt; /run/lock<br>
- Add /run to /etc/fstab for sysvinit compatibility<br>
<br>
The systemd init script has been modified as follows:<br>
- Do not create /var/volatile/run<br>
- Do not create symbolic link from /run to /var/run if /run doesn&#39;t<br>
=C2=A0 exist<br>
<br>
A few things have also been cleaned up:<br>
- Remove udev workaround to ensure /run exists<br>
- Remove clearing of /var/run as it points to a tmpfs anyway<br>
- Remove permissions workaround for /var/run/utmp as<br>
=C2=A0 systemd-update-utmp-runlevel.service starts correctly without it<br>
<br>
</div><div class=3D"im">[1] <a href=3D"http://www.linuxbase.org/betaspecs/f=
hs/fhs.html#runRuntimeVariableData" target=3D"_blank">http://www.linuxbase.=
org/betaspecs/fhs/fhs.html#runRuntimeVariableData</a><br>
<br>
Signed-off-by: Jonathan Liu &lt;<a href=3D"mailto:net147@gmail.com">net147@=
gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/files/fs-perms.txt =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
 =C2=A05 ++---<br>
</div>=C2=A0meta/recipes-core/base-files/base-files/fstab =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A01 +<br>
=C2=A0meta/recipes-core/base-files/<a href=3D"http://base-files_3.0.14.bb" =
target=3D"_blank">base-files_3.0.14.bb</a> =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 10=
 +++++-----<br>
=C2=A0meta/recipes-core/initscripts/initscripts-1.0/volatiles =C2=A0 | =C2=
=A07 +++----<br>
<div class=3D"im">=C2=A0meta/recipes-core/systemd/systemd/00-create-volatil=
e.conf | =C2=A02 --<br>
=C2=A0meta/recipes-core/systemd/systemd/init =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A04 ----<br>
=C2=A0meta/recipes-core/systemd/systemd/var-run.conf =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0| =C2=A04 ----<br>
</div>=C2=A0meta/recipes-core/systemd/<a href=3D"http://systemd_204.bb" tar=
get=3D"_blank">systemd_204.bb</a> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0| =C2=A03 ---<br>
<div class=3D"im">=C2=A0meta/recipes-core/udev/udev.inc =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
 =C2=A06 +-----<br>
=C2=A0meta/recipes-core/udev/udev/init =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A01 -<br>
=C2=A0meta/recipes-core/udev/udev/volatiles =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A01 -<br>
</div>=C2=A011 files changed, 12 insertions(+), 32 deletions(-)<br>
<div class=3D"im">=C2=A0delete mode 100644 meta/recipes-core/systemd/system=
d/var-run.conf<br>
=C2=A0delete mode 100644 meta/recipes-core/udev/udev/volatiles<br>
<br>
</div><div class=3D"im">diff --git a/meta/files/fs-perms.txt b/meta/files/f=
s-perms.txt<br>
index becb85c..c829bec 100644<br>
--- a/meta/files/fs-perms.txt<br>
+++ b/meta/files/fs-perms.txt<br>
@@ -45,15 +45,14 @@ ${oldincludedir} =C2=A0 =C2=A00755 =C2=A0 =C2=A0root =
=C2=A0 =C2=A0root =C2=A0 =C2=A0true =C2=A0 =C2=A00644 =C2=A0 =C2=A0root =C2=
=A0 =C2=A0root<br>
<br>
=C2=A0# Items from base-files<br>
=C2=A0# Links<br>
-${localstatedir}/run =C2=A0 link =C2=A0 =C2=A0volatile/run<br>
+${localstatedir}/run =C2=A0 link =C2=A0 =C2=A0/run<br>
=C2=A0${localstatedir}/log =C2=A0 link =C2=A0 =C2=A0volatile/log<br>
-${localstatedir}/lock =C2=A0link =C2=A0 =C2=A0volatile/lock<br>
+${localstatedir}/lock =C2=A0link =C2=A0 =C2=A0/run/lock<br>
=C2=A0${localstatedir}/tmp =C2=A0 link =C2=A0 =C2=A0volatile/tmp<br>
<br>
=C2=A0# Special permissions from base-files<br>
=C2=A0# Set 1777<br>
=C2=A0/tmp =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 01777 =C2=A0 root =C2=A0 =C2=A0root =C2=A0 =C2=
=A0false - - -<br>
-${localstatedir}/volatile/lock 01777 =C2=A0 root =C2=A0 =C2=A0root =C2=A0 =
=C2=A0false - - -<br>
=C2=A0${localstatedir}/volatile/tmp =C2=A001777 =C2=A0 root =C2=A0 =C2=A0ro=
ot =C2=A0 =C2=A0false - - -<br>
<br>
</div>=C2=A0# Set 2775<br>
<div class=3D"im">diff --git a/meta/recipes-core/base-files/base-files/fsta=
b b/meta/recipes-core/base-files/base-files/fstab<br>
index f0eed36..dd613a1 100644<br>
--- a/meta/recipes-core/base-files/base-files/fstab<br>
+++ b/meta/recipes-core/base-files/base-files/fstab<br>
@@ -4,6 +4,7 @@ rootfs =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 / =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0auto =
=C2=A0 =C2=A0 =C2=A0 defaults =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A01 =C2=A01<br>
=C2=A0proc =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /proc =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0proc =C2=A0 =C2=A0 =
=C2=A0 defaults =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00 =C2=A00<b=
r>
=C2=A0devpts =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /dev/pts =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 devpts =C2=A0 =C2=A0 mode=3D0620,gid=
=3D5 =C2=A0 =C2=A0 =C2=A0 0 =C2=A00<br>
=C2=A0usbdevfs =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /proc/bus/usb =C2=
=A0 =C2=A0 =C2=A0 =C2=A0usbdevfs =C2=A0 noauto =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A00 =C2=A00<br>
+tmpfs =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/run =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tmpfs =C2=A0 =C2=A0 =C2=A0=
mode=3D0755,nodev,nosuid,strictatime 0 =C2=A00<br>
=C2=A0tmpfs =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/var/vol=
atile =C2=A0 =C2=A0 =C2=A0 =C2=A0tmpfs =C2=A0 =C2=A0 =C2=A0defaults =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00 =C2=A00<br>
=C2=A0tmpfs =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/media/r=
am =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tmpfs =C2=A0 =C2=A0 =C2=A0defaults =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00 =C2=A00<br>
<br>
diff --git a/meta/recipes-core/base-files/<a href=3D"http://base-files_3.0.=
14.bb" target=3D"_blank">base-files_3.0.14.bb</a> b/meta/recipes-core/base-=
files/<a href=3D"http://base-files_3.0.14.bb" target=3D"_blank">base-files_=
3.0.14.bb</a><br>

</div>index a56450d..60185e1 100644<br>
--- a/meta/recipes-core/base-files/<a href=3D"http://base-files_3.0.14.bb" =
target=3D"_blank">base-files_3.0.14.bb</a><br>
+++ b/meta/recipes-core/base-files/<a href=3D"http://base-files_3.0.14.bb" =
target=3D"_blank">base-files_3.0.14.bb</a><br>
<div><div class=3D"h5">@@ -31,10 +31,10 @@ S =3D &quot;${WORKDIR}&quot;<br>
=C2=A0INHIBIT_DEFAULT_DEPS =3D &quot;1&quot;<br>
<br>
=C2=A0docdir_append =3D &quot;/${P}&quot;<br>
-dirs1777 =3D &quot;/tmp ${localstatedir}/volatile/lock ${localstatedir}/vo=
latile/tmp&quot;<br>
+dirs1777 =3D &quot;/tmp ${localstatedir}/volatile/tmp&quot;<br>
=C2=A0dirs2775 =3D &quot;/home ${prefix}/src ${localstatedir}/local&quot;<b=
r>
=C2=A0dirs755 =3D &quot;/bin /boot /dev ${sysconfdir} ${sysconfdir}/default=
 \<br>
- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${sysconfdir}/skel /lib /mnt /proc ${R=
OOT_HOME} /sbin \<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${sysconfdir}/skel /lib /mnt /proc ${R=
OOT_HOME} /run /sbin \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${prefix} ${bindir} ${docdir} /us=
r/games ${includedir} \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${libdir} ${sbindir} ${datadir} \=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${datadir}/common-licenses ${data=
dir}/dict ${infodir} \<br>
@@ -42,9 +42,7 @@ dirs755 =3D &quot;/bin /boot /dev ${sysconfdir} ${sysconf=
dir}/default \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${localstatedir}/backups ${locals=
tatedir}/lib \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /sys ${localstatedir}/lib/misc ${=
localstatedir}/spool \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${localstatedir}/volatile \<br>
- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${localstatedir}/volatile/lock/subsys =
\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${localstatedir}/volatile/log \<b=
r>
- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${localstatedir}/volatile/run \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /mnt /media /media/card /media/cf=
 /media/net /media/ram \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /media/union /media/realroot /med=
ia/hdd \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /media/mmc1&quot;<br>
@@ -54,7 +52,7 @@ dirs3755 =3D &quot;/srv =C2=A0\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${prefix}/local/share ${pre=
fix}/local/src&quot;<br>
=C2=A0dirs4775 =3D &quot;/var/mail&quot;<br>
<br>
-volatiles =3D &quot;run log lock tmp&quot;<br>
+volatiles =3D &quot;log tmp&quot;<br>
=C2=A0conffiles =3D &quot;${sysconfdir}/debian_version ${sysconfdir}/host.c=
onf \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${sysconfdir}/inputrc ${sy=
sconfdir}/issue /${sysconfdir}/<a href=3D"http://issue.net" target=3D"_blan=
k">issue.net</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${sysconfdir}/nsswitch.con=
f ${sysconfdir}/profile \<br>
@@ -83,6 +81,8 @@ do_install () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 for d in card cf net ram; do<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ln -sf /media/$d ${=
D}/mnt/$d<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 done<br>
+ =C2=A0 =C2=A0 =C2=A0 ln -sf /run ${D}${localstatedir}/run<br>
+ =C2=A0 =C2=A0 =C2=A0 ln -sf /run/lock ${D}${localstatedir}/lock<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ${BASEFILESISSUEINSTALL}<br>
<br>
</div></div><div class=3D"im">diff --git a/meta/recipes-core/initscripts/in=
itscripts-1.0/volatiles b/meta/recipes-core/initscripts/initscripts-1.0/vol=
atiles<br>
index 270f128..297245d 100644<br>
--- a/meta/recipes-core/initscripts/initscripts-1.0/volatiles<br>
+++ b/meta/recipes-core/initscripts/initscripts-1.0/volatiles<br>
@@ -21,13 +21,12 @@<br>
=C2=A0# This explains the order of &quot;link before object&quot; as in the=
 example above, where<br>
=C2=A0# a link will be created at /var/test pointing to /tmp/testfile and d=
ue to this<br>
=C2=A0# link the file defined as /var/test will actually be created as /tmp=
/testfile.<br>
-d root root 1777 /var/volatile/lock none<br>
+d root root 1777 /run/lock none<br>
=C2=A0d root root 0755 /var/volatile/log none<br>
-d root root 0755 /var/volatile/run none<br>
=C2=A0d root root 1777 /var/volatile/tmp none<br>
-l root root 1777 /var/lock /var/volatile/lock<br>
+l root root 1777 /var/lock /run/lock<br>
=C2=A0l root root 0755 /var/log /var/volatile/log<br>
-l root root 0755 /var/run /var/volatile/run<br>
+l root root 0755 /var/run /run<br>
=C2=A0l root root 1777 /var/tmp /var/volatile/tmp<br>
=C2=A0l root root 1777 /tmp /var/tmp<br>
=C2=A0d root root 0755 /var/lock/subsys none<br>
</div><div><div class=3D"h5">diff --git a/meta/recipes-core/systemd/systemd=
/00-create-volatile.conf b/meta/recipes-core/systemd/systemd/00-create-vola=
tile.conf<br>
index 6163a9c..9ffa88e 100644<br>
--- a/meta/recipes-core/systemd/systemd/00-create-volatile.conf<br>
+++ b/meta/recipes-core/systemd/systemd/00-create-volatile.conf<br>
@@ -4,6 +4,4 @@<br>
<br>
<br>
=C2=A0d =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/var/volatile/log =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 - =C2=A0 =C2=A0 =C2=A0 - =
=C2=A0 =C2=A0 =C2=A0 - =C2=A0 =C2=A0 =C2=A0 -<br>
-d =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/var/volatile/lock =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0- =C2=A0 =C2=A0 =C2=A0 - =C2=
=A0 =C2=A0 =C2=A0 - =C2=A0 =C2=A0 =C2=A0 -<br>
-d =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/var/volatile/run =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 - =C2=A0 =C2=A0 =C2=A0 - =C2=A0 =
=C2=A0 =C2=A0 - =C2=A0 =C2=A0 =C2=A0 -<br>
=C2=A0d =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/var/volatile/tmp =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 - =C2=A0 =C2=A0 =C2=A0 - =
=C2=A0 =C2=A0 =C2=A0 - =C2=A0 =C2=A0 =C2=A0 -<br>
diff --git a/meta/recipes-core/systemd/systemd/init b/meta/recipes-core/sys=
temd/systemd/init<br>
index ac56cca..7e67a50 100644<br>
--- a/meta/recipes-core/systemd/systemd/init<br>
+++ b/meta/recipes-core/systemd/systemd/init<br>
@@ -42,10 +42,6 @@ case &quot;$1&quot; in<br>
=C2=A0 =C2=A0 =C2=A0[ -e /dev/pts ] || mkdir -m 0755 /dev/pts<br>
=C2=A0 =C2=A0 =C2=A0[ -e /dev/shm ] || mkdir -m 1777 /dev/shm<br>
=C2=A0 =C2=A0 =C2=A0mount -a -t tmpfs 2&gt;/dev/null<br>
- =C2=A0 =C2=A0mkdir -p /var/volatile/run<br>
- =C2=A0 =C2=A0if [ ! -e /run ]; then<br>
- =C2=A0 =C2=A0 =C2=A0 =C2=A0ln -s /var/run /run<br>
- =C2=A0 =C2=A0fi<br>
<br>
=C2=A0 =C2=A0 =C2=A0# cache handling<br>
=C2=A0 =C2=A0 =C2=A0if [ &quot;$DEVCACHE&quot; !=3D &quot;&quot; ]; then<br=
>
diff --git a/meta/recipes-core/systemd/systemd/var-run.conf b/meta/recipes-=
core/systemd/systemd/var-run.conf<br>
deleted file mode 100644<br>
index c2c18e2..0000000<br>
--- a/meta/recipes-core/systemd/systemd/var-run.conf<br>
+++ /dev/null<br>
@@ -1,4 +0,0 @@<br>
-# empty /var/run<br>
-R =C2=A0 =C2=A0 =C2=A0/var/run/* =C2=A0 =C2=A0 =C2=A0- =C2=A0 =C2=A0 =C2=
=A0 - =C2=A0 =C2=A0 =C2=A0 - =C2=A0 =C2=A0 =C2=A0 - =C2=A0 =C2=A0 =C2=A0 -<=
br>
-# systemd-update-utmp-runlevel.service fails to start without this<br>
-f /var/run/utmp 0644 root root - -<br>
</div></div>diff --git a/meta/recipes-core/systemd/<a href=3D"http://system=
d_204.bb" target=3D"_blank">systemd_204.bb</a> b/meta/recipes-core/systemd/=
<a href=3D"http://systemd_204.bb" target=3D"_blank">systemd_204.bb</a><br>
index 8536b2b..74cd3c8 100644<br>
--- a/meta/recipes-core/systemd/<a href=3D"http://systemd_204.bb" target=3D=
"_blank">systemd_204.bb</a><br>
+++ b/meta/recipes-core/systemd/<a href=3D"http://systemd_204.bb" target=3D=
"_blank">systemd_204.bb</a><br>
@@ -20,7 +20,6 @@ inherit gtk-doc useradd pkgconfig autotools perlnative up=
date-rc.d update-altern<br>
<div class=3D"im">=C2=A0SRC_URI =3D &quot;<a href=3D"http://www.freedesktop=
.org/software/systemd/systemd-${PV}.tar.xz" target=3D"_blank">http://www.fr=
eedesktop.org/software/systemd/systemd-${PV}.tar.xz</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://touchscreen.rules \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://modprobe.rules \<br>
- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://var-run.conf \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${UCLIBCPATCHES} \<br>
</div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-utmp-turn-syste=
md-update-utmp-shutdown.service-into-.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://00-create-volatile.conf \<=
br>
@@ -105,8 +104,6 @@ do_install() {<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m 0644 ${WORKDIR}/*.rules ${D}${syscon=
fdir}/udev/rules.d/<br>
<br>
- =C2=A0 =C2=A0 =C2=A0 install -m 0644 ${WORKDIR}/var-run.conf ${D}${syscon=
fdir}/tmpfiles.d/<br>
-<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m 0644 ${WORKDIR}/00-create-volatile.c=
onf ${D}${sysconfdir}/tmpfiles.d/<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ${@base_contains(&#39;DISTRO_FEATURES&#39;,&=
#39;sysvinit&#39;,&#39;true&#39;,&#39;false&#39;,d)}; then<br>
diff --git a/meta/recipes-core/udev/udev.inc b/meta/recipes-core/udev/udev.=
inc<br>
index 769d861..92485f5 100644<br>
--- a/meta/recipes-core/udev/udev.inc<br>
+++ b/meta/recipes-core/udev/udev.inc<br>
@@ -26,8 +26,7 @@ SRC_URI =3D &quot;${KERNELORG_MIRROR}/linux/utils/kernel/=
hotplug/udev-${PV}.tar.gz \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://local.rules \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://udev-cache \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://udev-cache.default \<br>
- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://init \<br>
- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://volatiles&quot;<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://init&quot;<br>
<br>
=C2=A0inherit autotools pkgconfig update-rc.d<br>
<br>
@@ -85,9 +84,6 @@ do_install_append () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -d ${D}${sysconfdir}/default<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m 0755 ${WORKDIR}/udev-cache.default $=
{D}${sysconfdir}/default/udev-cache<br>
<br>
- =C2=A0 =C2=A0 =C2=A0 install -d ${D}${sysconfdir}/default/volatiles<br>
- =C2=A0 =C2=A0 =C2=A0 install -m 0644 ${WORKDIR}/volatiles ${D}${sysconfdi=
r}/default/volatiles/00_udev<br>
-<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 touch ${D}${sysconfdir}/udev/cache.data<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -d ${D}${sysconfdir}/udev/rules.d/<br>
diff --git a/meta/recipes-core/udev/udev/init b/meta/recipes-core/udev/udev=
/init<br>
index cd87f50..95f9c03 100644<br>
--- a/meta/recipes-core/udev/udev/init<br>
+++ b/meta/recipes-core/udev/udev/init<br>
@@ -50,7 +50,6 @@ case &quot;$1&quot; in<br>
=C2=A0 =C2=A0 =C2=A0[ -e /dev/pts ] || mkdir -m 0755 /dev/pts<br>
=C2=A0 =C2=A0 =C2=A0[ -e /dev/shm ] || mkdir -m 1777 /dev/shm<br>
=C2=A0 =C2=A0 =C2=A0mount -a -t tmpfs 2&gt;/dev/null<br>
- =C2=A0 =C2=A0mkdir -p /var/volatile/run<br>
=C2=A0 =C2=A0 =C2=A0mkdir -p /var/volatile/tmp<br>
<br>
=C2=A0 =C2=A0 =C2=A0# cache handling<br>
diff --git a/meta/recipes-core/udev/udev/volatiles b/meta/recipes-core/udev=
/udev/volatiles<br>
deleted file mode 100644<br>
index e33561b..0000000<br>
--- a/meta/recipes-core/udev/udev/volatiles<br>
+++ /dev/null<br>
@@ -1 +0,0 @@<br>
-l root root 0755 /run /var/run<br>
</div></div><span class=3D"HOEnZb"><font color=3D"#888888">--<br>
1.8.2.3<br>
<br>
</font></span></blockquote></div><br></div>

--20cf307d04ae906c0804dd5a9c28--
