Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BF43C74A5B
	for <webhook@archiver.kernel.org>; Fri, 17 Mar 2023 06:04:56 +0000 (UTC)
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by mx.groups.io with SMTP id smtpd.web10.13249.1679033087763784826
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Mar 2023 23:04:48 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.18, mailfrom: f_l_k@t-online.de)
Received: from fwd87.dcpf.telekom.de (fwd87.aul.t-online.de [10.223.144.113])
	by mailout04.t-online.de (Postfix) with SMTP id 5340F19B43
	for <openembedded-core@lists.openembedded.org>; Fri, 17 Mar 2023 07:04:46 +0100 (CET)
Received: from [192.168.178.83] ([79.219.227.8]) by fwd87.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pd3Ck-2KP9NI0; Fri, 17 Mar 2023 07:04:42 +0100
Date: Fri, 17 Mar 2023 07:04:36 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe-core][PATCH] Remove usage of /var/volatile/tmp
To: openembedded-core@lists.openembedded.org
Message-Id: <O7INRR.LVNJR6LGYTEB1@t-online.de>
In-Reply-To: <20230317060202.385862-1-f_l_k@t-online.de>
References: <20230317060202.385862-1-f_l_k@t-online.de>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-mh58mNlQvRfQn5tb/I/r"
X-TOI-EXPURGATEID: 150726::1679033082-9EA9F0AF-34BC4670/0/0 CLEAN NORMAL
X-TOI-MSGID: b6d976df-ca6b-49f4-85ef-b4c2181eed31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Mar 2023 06:04:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178740

--=-mh58mNlQvRfQn5tb/I/r
Content-Type: text/plain; charset=iso-8859-13; format=flowed
Content-Transfer-Encoding: quoted-printable

sorry, I forgot to mark this one RFC

Am Fr, 17. M=E4r 2023 um 07:02:02 +0100 schrieb Markus Volk=20
<f_l_k@t-online.de>:
> Currently /tmp is a link to /var/tmp which breaks glib-2.0 ptest
> Systemd documentation describes tmpdir usage as follows:
>=20
> /tmp/ and /var/tmp/ are two world-writable directories Linux systems=20
> provide for temporary files. The former is
> typically on tmpfs and thus backed by RAM/swap, and flushed out on=20
> each reboot. The latter is typically a proper,
> persistent file system, and thus backed by physical storage.
>=20
> By default, systemd-tmpfiles will apply a concept of =B4ageing=A1 to=20
> all files and directories stored in /tmp/ and
> /var/tmp/. This means that files that have neither been changed nor=20
> read within a specific time frame are auto-
> matically removed in regular intervals.
> (This concept is not new to systemd-tmpfiles btw, it=FFs inherited=20
> from previous subsystems such as tmpwatch.)
> By default files in /tmp/ are cleaned up after 10 days, and those in=20
> /var/tmp after 30 days.
>=20
> This commit tries to align tmpdir to what systemd expects.
>=20
> Signed-off-by: Markus Volk <f_l_k@t-online.de=20
> <mailto:f_l_k@t-online.de>>
> ---
>  meta/conf/bitbake.conf                        |  4 ---
>  meta/files/fs-perms-persistent-log.txt        |  2 --
>  meta/files/fs-perms.txt                       |  2 --
>  .../lib/oeqa/files/buildhistory_filelist1.txt |  1 -
>  .../lib/oeqa/files/buildhistory_filelist2.txt |  1 -
>  meta/recipes-core/base-files/base-files/fstab |  1 +
>  .../base-files/base-files_3.0.14.bb           |  4 +--
>  .../initscripts-1.0/populate-volatile.sh      |  2 +-
>  .../initscripts/initscripts-1.0/volatiles     |  5 ++-
>  .../initscripts/initscripts_1.0.bb            |  3 --
>  .../systemd/systemd/00-create-volatile.conf   |  4 +--
>  meta/recipes-core/systemd/systemd_253.1.bb    |  7 ----
>  meta/recipes-core/udev/eudev/init             |  4 ---
>  .../e2fsprogs/e2fsprogs/run-ptest             |  2 +-
>  ...eak_cmsg.stderr.exp-adjust-tmp-paths.patch | 34=20
> -------------------
>  .../valgrind/valgrind_3.20.0.bb               |  1 -
>  16 files changed, 8 insertions(+), 69 deletions(-)
>  delete mode 100644=20
> meta/recipes-devtools/valgrind/valgrind/0001-none-tests-fdleak_cmsg.stder=
r.exp-adjust-tmp-paths.patch
>=20
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index afd9e2f552..dcf6ce99d1 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -90,10 +90,6 @@ ROOT_HOME ??=3D "/home/root"
>  # If set to boolean false ('no', 'n', 'false', 'f', '0'), /var/log=20
> is on persistent storage.
>  VOLATILE_LOG_DIR ?=3D "yes"
>=20
> -# if set to 'yes': /tmp links to /var/tmp which links to=20
> /var/volatile/tmp
> -# otherwise:       /tmp is on persistent storage
> -VOLATILE_TMP_DIR ?=3D "yes"
> -
>  BB_RENAMED_VARIABLES[PNBLACKLIST] =3D "SKIP_RECIPE"
>  BB_RENAMED_VARIABLES[CVE_CHECK_PN_WHITELIST] =3D=20
> "CVE_CHECK_SKIP_RECIPE"
>  BB_RENAMED_VARIABLES[CVE_CHECK_WHITELIST] =3D "CVE_CHECK_IGNORE"
> diff --git a/meta/files/fs-perms-persistent-log.txt=20
> b/meta/files/fs-perms-persistent-log.txt
> index 518c1be3c9..326c0ed092 100644
> --- a/meta/files/fs-perms-persistent-log.txt
> +++ b/meta/files/fs-perms-persistent-log.txt
> @@ -47,7 +47,6 @@ ${oldincludedir}	0755	root	root	true	0644	root	root
>  # Links
>  ${localstatedir}/run	link	/run
>  ${localstatedir}/lock	link	/run/lock
> -${localstatedir}/tmp	link	volatile/tmp
>=20
>  /home				0755	root	root	false - - -
>  /srv				0755	root	root	false - - -
> @@ -57,7 +56,6 @@ ${localstatedir}/local		0755	root	root	false - - -
>  # Special permissions from base-files
>  # Set 1777
>  /tmp				01777	root	root	false - - -
> -${localstatedir}/volatile/tmp	01777	root	root	false - - -
>=20
>  # Set 0700
>  ${ROOT_HOME}			0700	root	root	false - - -
> diff --git a/meta/files/fs-perms.txt b/meta/files/fs-perms.txt
> index daa4aed840..ed59311035 100644
> --- a/meta/files/fs-perms.txt
> +++ b/meta/files/fs-perms.txt
> @@ -48,7 +48,6 @@ ${oldincludedir}	0755	root	root	true	0644	root	root
>  ${localstatedir}/run	link	/run
>  ${localstatedir}/log	link	volatile/log
>  ${localstatedir}/lock	link	/run/lock
> -${localstatedir}/tmp	link	volatile/tmp
>=20
>  /home				0755	root	root	false - - -
>  /srv				0755	root	root	false - - -
> @@ -58,7 +57,6 @@ ${localstatedir}/local		0755	root	root	false - - -
>  # Special permissions from base-files
>  # Set 1777
>  /tmp				01777	root	root	false - - -
> -${localstatedir}/volatile/tmp	01777	root	root	false - - -
>=20
>  # Set 0700
>  ${ROOT_HOME}			0700	root	root	false - - -
> diff --git a/meta/lib/oeqa/files/buildhistory_filelist1.txt=20
> b/meta/lib/oeqa/files/buildhistory_filelist1.txt
> index 8d882895ad..ec50017383 100644
> --- a/meta/lib/oeqa/files/buildhistory_filelist1.txt
> +++ b/meta/lib/oeqa/files/buildhistory_filelist1.txt
> @@ -9210,5 +9210,4 @@ lrwxrwxrwx root       root               12=20
> ./var/log -> volatile/log
>  lrwxrwxrwx root       root                6 ./var/run -> ../run
>  drwxr-xr-x root       root             4096 ./var/spool
>  drwxrwxr-x root       mail             4096 ./var/spool/mail
> -lrwxrwxrwx root       root               12 ./var/tmp -> volatile/tmp
>  drwxr-xr-x root       root             4096 ./var/volatile
> diff --git a/meta/lib/oeqa/files/buildhistory_filelist2.txt=20
> b/meta/lib/oeqa/files/buildhistory_filelist2.txt
> index ac6307060d..cedec51c38 100644
> --- a/meta/lib/oeqa/files/buildhistory_filelist2.txt
> +++ b/meta/lib/oeqa/files/buildhistory_filelist2.txt
> @@ -9213,5 +9213,4 @@ lrwxrwxrwx root       root               12=20
> ./var/log -> volatile/log
>  lrwxrwxrwx root       root                6 ./var/run -> ../run
>  drwxr-xr-x root       root             4096 ./var/spool
>  drwxrwxr-x root       mail             4096 ./var/spool/mail
> -lrwxrwxrwx root       root               12 ./var/tmp -> volatile/tmp
>  drwxr-xr-x root       root             4096 ./var/volatile
> diff --git a/meta/recipes-core/base-files/base-files/fstab=20
> b/meta/recipes-core/base-files/base-files/fstab
> index 70e400f567..7064573130 100644
> --- a/meta/recipes-core/base-files/base-files/fstab
> +++ b/meta/recipes-core/base-files/base-files/fstab
> @@ -5,6 +5,7 @@ proc                 /proc                proc      =20
> defaults              0  0
>  devpts               /dev/pts             devpts    =20
> mode=3D0620,ptmxmode=3D0666,gid=3D5      0  0
>  tmpfs                /run                 tmpfs     =20
> mode=3D0755,nodev,nosuid,strictatime 0  0
>  tmpfs                /var/volatile        tmpfs      defaults       =20
>       0  0
> +tmpfs                /tmp                 tmpfs      defaults       =20
>       0  0
>=20
>  # uncomment this if your device has a SD/MMC/Transflash slot
>  #/dev/mmcblk0p1       /media/card          auto      =20
> defaults,sync,noauto  0  0
> diff --git a/meta/recipes-core/base-files/base-files_3.0.14.bb=20
> b/meta/recipes-core/base-files/base-files_3.0.14.bb
> index ff83567bd9..c2ecea0a25 100644
> --- a/meta/recipes-core/base-files/base-files_3.0.14.bb
> +++ b/meta/recipes-core/base-files/base-files_3.0.14.bb
> @@ -29,7 +29,7 @@ S =3D "${WORKDIR}"
>  INHIBIT_DEFAULT_DEPS =3D "1"
>=20
>  docdir:append =3D "/${P}"
> -dirs1777 =3D "/tmp ${localstatedir}/volatile/tmp"
> +dirs1777 =3D "/tmp /var/tmp"
>  dirs2775 =3D ""
>  dirs555 =3D "/sys /proc"
>  dirs755 =3D "/boot /dev ${base_bindir} ${base_sbindir} ${base_libdir} \
> @@ -53,7 +53,7 @@ dirs755-lsb =3D "/srv  \
>                 ${prefix}/lib/locale"
>  dirs2775-lsb =3D "/var/mail"
>=20
> -volatiles =3D "${@'log' if oe.types.boolean('${VOLATILE_LOG_DIR}')=20
> else ''} tmp"
> +volatiles =3D "${@'log' if oe.types.boolean('${VOLATILE_LOG_DIR}')=20
> else ''}"
>  conffiles =3D "${sysconfdir}/debian_version ${sysconfdir}/host.conf \
>               ${sysconfdir}/issue /${sysconfdir}/issue.net \
>               ${sysconfdir}/nsswitch.conf ${sysconfdir}/profile \
> diff --git=20
> a/meta/recipes-core/initscripts/initscripts-1.0/populate-volatile.sh=20
> b/meta/recipes-core/initscripts/initscripts-1.0/populate-volatile.sh
> index bc630e871c..ecfb6fdc2b 100755
> ---=20
> a/meta/recipes-core/initscripts/initscripts-1.0/populate-volatile.sh
> +++=20
> b/meta/recipes-core/initscripts/initscripts-1.0/populate-volatile.sh
> @@ -23,7 +23,7 @@ ROOT_DIR=3D"$(echo "$DIRNAME" | sed -ne=20
> 's:/etc/.*::p')"
>  [ "$ROOTFS_READ_ONLY" =3D "yes" ] && VOLATILE_ENABLE_CACHE=3Dno
>=20
>  CFGDIR=3D"${ROOT_DIR}/etc/default/volatiles"
> -TMPROOT=3D"${ROOT_DIR}/var/volatile/tmp"
> +TMPROOT=3D"${ROOT_DIR}/tmp"
>  COREDEF=3D"00_core"
>=20
>  [ "${VERBOSE}" !=3D "no" ] && echo "Populating volatile Filesystems."
> diff --git a/meta/recipes-core/initscripts/initscripts-1.0/volatiles=20
> b/meta/recipes-core/initscripts/initscripts-1.0/volatiles
> index cd8a4be05f..7232a8ef90 100644
> --- a/meta/recipes-core/initscripts/initscripts-1.0/volatiles
> +++ b/meta/recipes-core/initscripts/initscripts-1.0/volatiles
> @@ -25,11 +25,10 @@
>  # link the file defined as /var/test will actually be created as=20
> /tmp/testfile.
>  d root root 1777 /run/lock none
>  d root root 0755 /var/volatile/log none
> -d root root 1777 /var/volatile/tmp none
>  l root root 1777 /var/lock /run/lock
>  l root root 0755 /var/run /run
> -l root root 1777 /var/tmp /var/volatile/tmp
> -l root root 1777 /tmp /var/tmp
> +d root root 1777 /tmp
> +d root root 1777 /var/tmp
>  d root root 0755 /var/lock/subsys none
>  f root root 0664 /var/log/wtmp none
>  f root root 0664 /var/run/utmp none
> diff --git a/meta/recipes-core/initscripts/initscripts_1.0.bb=20
> b/meta/recipes-core/initscripts/initscripts_1.0.bb
> index 4dc477bb8d..7c9d9ca4f1 100644
> --- a/meta/recipes-core/initscripts/initscripts_1.0.bb
> +++ b/meta/recipes-core/initscripts/initscripts_1.0.bb
> @@ -108,9 +108,6 @@ do_install () {
>  		sed -i -e '\@^d root root 0755 /var/volatile/log none$@ a\l root=20
> root 0755 /var/log /var/volatile/log' \
>  			${D}${sysconfdir}/default/volatiles/00_core
>  	fi
> -	if [ "${VOLATILE_TMP_DIR}" !=3D "yes" ]; then
> -		sed -i -e "/\<tmp\>/d" ${D}${sysconfdir}/default/volatiles/00_core
> -	fi
>  	install -m 0755    ${WORKDIR}/dmesg.sh		${D}${sysconfdir}/init.d
>  	install -m 0644    ${WORKDIR}/logrotate-dmesg.conf=20
> ${D}${sysconfdir}/
>=20
> diff --git=20
> a/meta/recipes-core/systemd/systemd/00-create-volatile.conf=20
> b/meta/recipes-core/systemd/systemd/00-create-volatile.conf
> index c4277221a2..1ba9b836cf 100644
> --- a/meta/recipes-core/systemd/systemd/00-create-volatile.conf
> +++ b/meta/recipes-core/systemd/systemd/00-create-volatile.conf
> @@ -1,8 +1,6 @@
>  #This goes hand-in-hand with the base-files of OE-Core. The file must
> -# be sorted before 'systemd.conf' becuase this attempts to create a=20
> file
> +# be sorted before 'systemd.conf' because this attempts to create a=20
> file
>  # inside /var/log.
>=20
> -
>  d		/run/lock		1777	-	-	-
>  d		/var/volatile/log		-	-	-	-
> -d		/var/volatile/tmp		1777	-	-
> diff --git a/meta/recipes-core/systemd/systemd_253.1.bb=20
> b/meta/recipes-core/systemd/systemd_253.1.bb
> index 4a0bb18254..1084040a25 100644
> --- a/meta/recipes-core/systemd/systemd_253.1.bb
> +++ b/meta/recipes-core/systemd/systemd_253.1.bb
> @@ -289,13 +289,6 @@ do_install() {
>  		rm -rf ${D}${localstatedir}/log/journal/remote
>  	fi
>=20
> -	# if the user requests /tmp be on persistent storage (i.e. not=20
> volatile)
> -	# then don't use a tmpfs for /tmp
> -	if [ "${VOLATILE_TMP_DIR}" !=3D "yes" ]; then
> -		rm -f ${D}${rootlibdir}/systemd/system/tmp.mount
> -		rm -f=20
> ${D}${rootlibdir}/systemd/system/local-fs.target.wants/tmp.mount
> -	fi
> -
>  	install -d ${D}${systemd_system_unitdir}/graphical.target.wants
>  	install -d ${D}${systemd_system_unitdir}/multi-user.target.wants
>  	install -d ${D}${systemd_system_unitdir}/poweroff.target.wants
> diff --git a/meta/recipes-core/udev/eudev/init=20
> b/meta/recipes-core/udev/eudev/init
> index 477a525b21..2084de83ae 100644
> --- a/meta/recipes-core/udev/eudev/init
> +++ b/meta/recipes-core/udev/eudev/init
> @@ -79,10 +79,6 @@ case "$1" in
>      }
>      [ -e /dev/pts ] || mkdir -m 0755 /dev/pts
>      [ -e /dev/shm ] || mkdir -m 1777 /dev/shm
> -    # the automount rule for udev needs /tmp directory available, as=20
> /tmp is a symlink
> -    # to /var/tmp which in turn is a symlink to /var/volatile/tmp,=20
> we need to make sure
> -    # /var/volatile/tmp directory to be available.
> -    mkdir -m 1777 -p /var/volatile/tmp
>=20
>      # make_extra_nodes
>      kill_udevd > "/dev/null" 2>&1
> diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/run-ptest=20
> b/meta/recipes-devtools/e2fsprogs/e2fsprogs/run-ptest
> index c97c0377e9..1f873b055e 100644
> --- a/meta/recipes-devtools/e2fsprogs/e2fsprogs/run-ptest
> +++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs/run-ptest
> @@ -2,7 +2,7 @@
>=20
>  cd ./test
>  SKIP_SLOW_TESTS=3Dyes ./test_script | sed -u -e=20
> '/:[[:space:]]ok/s/^/PASS: /' -e '/:[[:space:]]failed/s/^/FAIL: /' -e=20
> '/:[[:space:]]skipped/s/^/SKIP: /'
> -rm -rf /var/volatile/tmp/*e2fsprogs*
> +rm -rf /tmp/*e2fsprogs*
>  rm -f tmp-*
>  rm -f *.tmp
>  rm -f *.ok
> diff --git=20
> a/meta/recipes-devtools/valgrind/valgrind/0001-none-tests-fdleak_cmsg.std=
err.exp-adjust-tmp-paths.patch=20
> b/meta/recipes-devtools/valgrind/valgrind/0001-none-tests-fdleak_cmsg.std=
err.exp-adjust-tmp-paths.patch
> deleted file mode 100644
> index e421ac6c80..0000000000
> ---=20
> a/meta/recipes-devtools/valgrind/valgrind/0001-none-tests-fdleak_cmsg.std=
err.exp-adjust-tmp-paths.patch
> +++ /dev/null
> @@ -1,34 +0,0 @@
> -From f405297d3382cd98391d02f397e2387da1f42879 Mon Sep 17 00:00:00=20
> 2001
> -From: Alexander Kanavin <alex.kanavin@gmail.com=20
> <mailto:alex.kanavin@gmail.com>>
> -Date: Fri, 24 Jan 2020 17:55:39 +0100
> -Subject: [PATCH] none/tests/fdleak_cmsg.stderr.exp: adjust /tmp paths
> -
> -In oe-core, /tmp is linked to /var/volatile/tmp and
> -valgrind output changes accordingly
> -
> -Upstream-Status: Inappropriate [oe-core specific]
> -Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com=20
> <mailto:alex.kanavin@gmail.com>>
> ----
> - none/tests/fdleak_cmsg.stderr.exp | 4 ++--
> - 1 file changed, 2 insertions(+), 2 deletions(-)
> -
> -diff --git a/none/tests/fdleak_cmsg.stderr.exp=20
> b/none/tests/fdleak_cmsg.stderr.exp
> -index 6e5a797b9..0ede1ab18 100644
> ---- a/none/tests/fdleak_cmsg.stderr.exp
> -+++ b/none/tests/fdleak_cmsg.stderr.exp
> -@@ -25,10 +25,10 @@ Open file descriptor ...: /dev/null
> -
> -
> - FILE DESCRIPTORS: 6 open (3 std) at exit.
> --Open file descriptor ...: /tmp/data2
> -+Open file descriptor ...: ...
> -    ...
> -
> --Open file descriptor ...: /tmp/data1
> -+Open file descriptor ...: ...
> -    ...
> -
> - Open AF_UNIX socket ...: <unknown>
> ---
> -2.17.1
> -
> diff --git a/meta/recipes-devtools/valgrind/valgrind_3.20.0.bb=20
> b/meta/recipes-devtools/valgrind/valgrind_3.20.0.bb
> index 07e50426e4..4ea173ba80 100644
> --- a/meta/recipes-devtools/valgrind/valgrind_3.20.0.bb
> +++ b/meta/recipes-devtools/valgrind/valgrind_3.20.0.bb
> @@ -36,7 +36,6 @@ SRC_URI =3D=20
> "https://sourceware.org/pub/valgrind/valgrind-${PV}.tar.bz2 \
>            =20
> file://0001-valgrind-filter_xml_frames-do-not-filter-usr.patch=20
> <file://0001-valgrind-filter_xml_frames-do-not-filter-usr.patch/> \
>            =20
> file://0001-memcheck-vgtests-remove-fullpath-after-flags.patch=20
> <file://0001-memcheck-vgtests-remove-fullpath-after-flags.patch/> \
>             file://s390x_vec_op_t.patch=20
> <file://s390x_vec_op_t.patch/> \
> -          =20
> file://0001-none-tests-fdleak_cmsg.stderr.exp-adjust-tmp-paths.patch=20
> <file://0001-none-tests-fdleak_cmsg.stderr.exp-adjust-tmp-paths.patch/>=20
> \
>             file://0001-memcheck-tests-Fix-timerfd-syscall-test.patch=20
> <file://0001-memcheck-tests-fix-timerfd-syscall-test.patch/> \
>             file://0001-docs-Disable-manual-validation.patch=20
> <file://0001-docs-disable-manual-validation.patch/> \
>             file://0001-drd-tests-Include-missing-cstdint.patch=20
> <file://0001-drd-tests-include-missing-cstdint.patch/> \
> --
> 2.34.1
>=20


--=-mh58mNlQvRfQn5tb/I/r
Content-Type: text/html; charset=iso-8859-13
Content-Transfer-Encoding: quoted-printable

<div id=3D"geary-body" dir=3D"auto"><div>sorry, I forgot to mark this one R=
FC</div></div><div id=3D"geary-quote" dir=3D"auto"><br>Am Fr, 17. M=E4r 202=
3 um 07:02:02 +0100 schrieb Markus Volk &lt;f_l_k@t-online.de&gt;:<br><bloc=
kquote type=3D"cite"><div class=3D"plaintext" style=3D"white-space: break-s=
paces;">Currently /tmp is a link to /var/tmp which breaks glib-2.0 ptest
Systemd documentation describes tmpdir usage as follows:

/tmp/ and /var/tmp/ are two world-writable directories Linux systems provid=
e for temporary files. The former is
typically on tmpfs and thus backed by RAM/swap, and flushed out on each reb=
oot. The latter is typically a proper,
persistent file system, and thus backed by physical storage.

By default, systemd-tmpfiles will apply a concept of =B4ageing=A1 to all fi=
les and directories stored in /tmp/ and
/var/tmp/. This means that files that have neither been changed nor read wi=
thin a specific time frame are auto-
matically removed in regular intervals.
(This concept is not new to systemd-tmpfiles btw, it=FFs inherited from pre=
vious subsystems such as tmpwatch.)
By default files in /tmp/ are cleaned up after 10 days, and those in /var/t=
mp after 30 days.

This commit tries to align tmpdir to what systemd expects.

Signed-off-by: Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de">f_l_k@t=
-online.de</a>&gt;
---
 meta/conf/bitbake.conf                        |  4 ---
 meta/files/fs-perms-persistent-log.txt        |  2 --
 meta/files/fs-perms.txt                       |  2 --
 .../lib/oeqa/files/buildhistory_filelist1.txt |  1 -
 .../lib/oeqa/files/buildhistory_filelist2.txt |  1 -
 meta/recipes-core/base-files/base-files/fstab |  1 +
 .../base-files/base-files_3.0.14.bb           |  4 +--
 .../initscripts-1.0/populate-volatile.sh      |  2 +-
 .../initscripts/initscripts-1.0/volatiles     |  5 ++-
 .../initscripts/initscripts_1.0.bb            |  3 --
 .../systemd/systemd/00-create-volatile.conf   |  4 +--
 meta/recipes-core/systemd/systemd_253.1.bb    |  7 ----
 meta/recipes-core/udev/eudev/init             |  4 ---
 .../e2fsprogs/e2fsprogs/run-ptest             |  2 +-
 ...eak_cmsg.stderr.exp-adjust-tmp-paths.patch | 34 -------------------
 .../valgrind/valgrind_3.20.0.bb               |  1 -
 16 files changed, 8 insertions(+), 69 deletions(-)
 delete mode 100644 meta/recipes-devtools/valgrind/valgrind/0001-none-tests=
-fdleak_cmsg.stderr.exp-adjust-tmp-paths.patch

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index afd9e2f552..dcf6ce99d1 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -90,10 +90,6 @@ ROOT_HOME ??=3D "/home/root"
 # If set to boolean false ('no', 'n', 'false', 'f', '0'), /var/log is on p=
ersistent storage.
 VOLATILE_LOG_DIR ?=3D "yes"
=20
-# if set to 'yes': /tmp links to /var/tmp which links to /var/volatile/tmp
-# otherwise:       /tmp is on persistent storage
-VOLATILE_TMP_DIR ?=3D "yes"
-
 BB_RENAMED_VARIABLES[PNBLACKLIST] =3D "SKIP_RECIPE"
 BB_RENAMED_VARIABLES[CVE_CHECK_PN_WHITELIST] =3D "CVE_CHECK_SKIP_RECIPE"
 BB_RENAMED_VARIABLES[CVE_CHECK_WHITELIST] =3D "CVE_CHECK_IGNORE"
diff --git a/meta/files/fs-perms-persistent-log.txt b/meta/files/fs-perms-p=
ersistent-log.txt
index 518c1be3c9..326c0ed092 100644
--- a/meta/files/fs-perms-persistent-log.txt
+++ b/meta/files/fs-perms-persistent-log.txt
@@ -47,7 +47,6 @@ ${oldincludedir}	0755	root	root	true	0644	root	root
 # Links
 ${localstatedir}/run	link	/run
 ${localstatedir}/lock	link	/run/lock
-${localstatedir}/tmp	link	volatile/tmp
=20
 /home				0755	root	root	false - - -
 /srv				0755	root	root	false - - -
@@ -57,7 +56,6 @@ ${localstatedir}/local		0755	root	root	false - - -
 # Special permissions from base-files
 # Set 1777
 /tmp				01777	root	root	false - - -
-${localstatedir}/volatile/tmp	01777	root	root	false - - -
=20
 # Set 0700
 ${ROOT_HOME}			0700	root	root	false - - -
diff --git a/meta/files/fs-perms.txt b/meta/files/fs-perms.txt
index daa4aed840..ed59311035 100644
--- a/meta/files/fs-perms.txt
+++ b/meta/files/fs-perms.txt
@@ -48,7 +48,6 @@ ${oldincludedir}	0755	root	root	true	0644	root	root
 ${localstatedir}/run	link	/run
 ${localstatedir}/log	link	volatile/log
 ${localstatedir}/lock	link	/run/lock
-${localstatedir}/tmp	link	volatile/tmp
=20
 /home				0755	root	root	false - - -
 /srv				0755	root	root	false - - -
@@ -58,7 +57,6 @@ ${localstatedir}/local		0755	root	root	false - - -
 # Special permissions from base-files
 # Set 1777
 /tmp				01777	root	root	false - - -
-${localstatedir}/volatile/tmp	01777	root	root	false - - -
=20
 # Set 0700
 ${ROOT_HOME}			0700	root	root	false - - -
diff --git a/meta/lib/oeqa/files/buildhistory_filelist1.txt b/meta/lib/oeqa=
/files/buildhistory_filelist1.txt
index 8d882895ad..ec50017383 100644
--- a/meta/lib/oeqa/files/buildhistory_filelist1.txt
+++ b/meta/lib/oeqa/files/buildhistory_filelist1.txt
@@ -9210,5 +9210,4 @@ lrwxrwxrwx root       root               12 ./var/log=
 -&gt; volatile/log
 lrwxrwxrwx root       root                6 ./var/run -&gt; ../run
 drwxr-xr-x root       root             4096 ./var/spool
 drwxrwxr-x root       mail             4096 ./var/spool/mail
-lrwxrwxrwx root       root               12 ./var/tmp -&gt; volatile/tmp
 drwxr-xr-x root       root             4096 ./var/volatile
diff --git a/meta/lib/oeqa/files/buildhistory_filelist2.txt b/meta/lib/oeqa=
/files/buildhistory_filelist2.txt
index ac6307060d..cedec51c38 100644
--- a/meta/lib/oeqa/files/buildhistory_filelist2.txt
+++ b/meta/lib/oeqa/files/buildhistory_filelist2.txt
@@ -9213,5 +9213,4 @@ lrwxrwxrwx root       root               12 ./var/log=
 -&gt; volatile/log
 lrwxrwxrwx root       root                6 ./var/run -&gt; ../run
 drwxr-xr-x root       root             4096 ./var/spool
 drwxrwxr-x root       mail             4096 ./var/spool/mail
-lrwxrwxrwx root       root               12 ./var/tmp -&gt; volatile/tmp
 drwxr-xr-x root       root             4096 ./var/volatile
diff --git a/meta/recipes-core/base-files/base-files/fstab b/meta/recipes-c=
ore/base-files/base-files/fstab
index 70e400f567..7064573130 100644
--- a/meta/recipes-core/base-files/base-files/fstab
+++ b/meta/recipes-core/base-files/base-files/fstab
@@ -5,6 +5,7 @@ proc                 /proc                proc       defaul=
ts              0  0
 devpts               /dev/pts             devpts     mode=3D0620,ptmxmode=
=3D0666,gid=3D5      0  0
 tmpfs                /run                 tmpfs      mode=3D0755,nodev,nos=
uid,strictatime 0  0
 tmpfs                /var/volatile        tmpfs      defaults             =
 0  0
+tmpfs                /tmp                 tmpfs      defaults             =
 0  0
=20
 # uncomment this if your device has a SD/MMC/Transflash slot
 #/dev/mmcblk0p1       /media/card          auto       defaults,sync,noauto=
  0  0
diff --git a/meta/recipes-core/base-files/base-files_3.0.14.bb b/meta/recip=
es-core/base-files/base-files_3.0.14.bb
index ff83567bd9..c2ecea0a25 100644
--- a/meta/recipes-core/base-files/base-files_3.0.14.bb
+++ b/meta/recipes-core/base-files/base-files_3.0.14.bb
@@ -29,7 +29,7 @@ S =3D "${WORKDIR}"
 INHIBIT_DEFAULT_DEPS =3D "1"
=20
 docdir:append =3D "/${P}"
-dirs1777 =3D "/tmp ${localstatedir}/volatile/tmp"
+dirs1777 =3D "/tmp /var/tmp"
 dirs2775 =3D ""
 dirs555 =3D "/sys /proc"
 dirs755 =3D "/boot /dev ${base_bindir} ${base_sbindir} ${base_libdir} \
@@ -53,7 +53,7 @@ dirs755-lsb =3D "/srv  \
                ${prefix}/lib/locale"
 dirs2775-lsb =3D "/var/mail"
=20
-volatiles =3D "${@'log' if oe.types.boolean('${VOLATILE_LOG_DIR}') else ''=
} tmp"
+volatiles =3D "${@'log' if oe.types.boolean('${VOLATILE_LOG_DIR}') else ''=
}"
 conffiles =3D "${sysconfdir}/debian_version ${sysconfdir}/host.conf \
              ${sysconfdir}/issue /${sysconfdir}/issue.net \
              ${sysconfdir}/nsswitch.conf ${sysconfdir}/profile \
diff --git a/meta/recipes-core/initscripts/initscripts-1.0/populate-volatil=
e.sh b/meta/recipes-core/initscripts/initscripts-1.0/populate-volatile.sh
index bc630e871c..ecfb6fdc2b 100755
--- a/meta/recipes-core/initscripts/initscripts-1.0/populate-volatile.sh
+++ b/meta/recipes-core/initscripts/initscripts-1.0/populate-volatile.sh
@@ -23,7 +23,7 @@ ROOT_DIR=3D"$(echo "$DIRNAME" | sed -ne 's:/etc/.*::p')"
 [ "$ROOTFS_READ_ONLY" =3D "yes" ] &amp;&amp; VOLATILE_ENABLE_CACHE=3Dno
=20
 CFGDIR=3D"${ROOT_DIR}/etc/default/volatiles"
-TMPROOT=3D"${ROOT_DIR}/var/volatile/tmp"
+TMPROOT=3D"${ROOT_DIR}/tmp"
 COREDEF=3D"00_core"
=20
 [ "${VERBOSE}" !=3D "no" ] &amp;&amp; echo "Populating volatile Filesystem=
s."
diff --git a/meta/recipes-core/initscripts/initscripts-1.0/volatiles b/meta=
/recipes-core/initscripts/initscripts-1.0/volatiles
index cd8a4be05f..7232a8ef90 100644
--- a/meta/recipes-core/initscripts/initscripts-1.0/volatiles
+++ b/meta/recipes-core/initscripts/initscripts-1.0/volatiles
@@ -25,11 +25,10 @@
 # link the file defined as /var/test will actually be created as /tmp/test=
file.
 d root root 1777 /run/lock none
 d root root 0755 /var/volatile/log none
-d root root 1777 /var/volatile/tmp none
 l root root 1777 /var/lock /run/lock
 l root root 0755 /var/run /run
-l root root 1777 /var/tmp /var/volatile/tmp
-l root root 1777 /tmp /var/tmp
+d root root 1777 /tmp
+d root root 1777 /var/tmp
 d root root 0755 /var/lock/subsys none
 f root root 0664 /var/log/wtmp none
 f root root 0664 /var/run/utmp none
diff --git a/meta/recipes-core/initscripts/initscripts_1.0.bb b/meta/recipe=
s-core/initscripts/initscripts_1.0.bb
index 4dc477bb8d..7c9d9ca4f1 100644
--- a/meta/recipes-core/initscripts/initscripts_1.0.bb
+++ b/meta/recipes-core/initscripts/initscripts_1.0.bb
@@ -108,9 +108,6 @@ do_install () {
 		sed -i -e '\@^d root root 0755 /var/volatile/log none$@ a\l root root 07=
55 /var/log /var/volatile/log' \
 			${D}${sysconfdir}/default/volatiles/00_core
 	fi
-	if [ "${VOLATILE_TMP_DIR}" !=3D "yes" ]; then
-		sed -i -e "/\&lt;tmp\&gt;/d" ${D}${sysconfdir}/default/volatiles/00_core
-	fi
 	install -m 0755    ${WORKDIR}/dmesg.sh		${D}${sysconfdir}/init.d
 	install -m 0644    ${WORKDIR}/logrotate-dmesg.conf ${D}${sysconfdir}/
=20
diff --git a/meta/recipes-core/systemd/systemd/00-create-volatile.conf b/me=
ta/recipes-core/systemd/systemd/00-create-volatile.conf
index c4277221a2..1ba9b836cf 100644
--- a/meta/recipes-core/systemd/systemd/00-create-volatile.conf
+++ b/meta/recipes-core/systemd/systemd/00-create-volatile.conf
@@ -1,8 +1,6 @@
 #This goes hand-in-hand with the base-files of OE-Core. The file must
-# be sorted before 'systemd.conf' becuase this attempts to create a file
+# be sorted before 'systemd.conf' because this attempts to create a file
 # inside /var/log.
=20
-
 d		/run/lock		1777	-	-	-
 d		/var/volatile/log		-	-	-	-
-d		/var/volatile/tmp		1777	-	-
diff --git a/meta/recipes-core/systemd/systemd_253.1.bb b/meta/recipes-core=
/systemd/systemd_253.1.bb
index 4a0bb18254..1084040a25 100644
--- a/meta/recipes-core/systemd/systemd_253.1.bb
+++ b/meta/recipes-core/systemd/systemd_253.1.bb
@@ -289,13 +289,6 @@ do_install() {
 		rm -rf ${D}${localstatedir}/log/journal/remote
 	fi
=20
-	# if the user requests /tmp be on persistent storage (i.e. not volatile)
-	# then don't use a tmpfs for /tmp
-	if [ "${VOLATILE_TMP_DIR}" !=3D "yes" ]; then
-		rm -f ${D}${rootlibdir}/systemd/system/tmp.mount
-		rm -f ${D}${rootlibdir}/systemd/system/local-fs.target.wants/tmp.mount
-	fi
-
 	install -d ${D}${systemd_system_unitdir}/graphical.target.wants
 	install -d ${D}${systemd_system_unitdir}/multi-user.target.wants
 	install -d ${D}${systemd_system_unitdir}/poweroff.target.wants
diff --git a/meta/recipes-core/udev/eudev/init b/meta/recipes-core/udev/eud=
ev/init
index 477a525b21..2084de83ae 100644
--- a/meta/recipes-core/udev/eudev/init
+++ b/meta/recipes-core/udev/eudev/init
@@ -79,10 +79,6 @@ case "$1" in
     }
     [ -e /dev/pts ] || mkdir -m 0755 /dev/pts
     [ -e /dev/shm ] || mkdir -m 1777 /dev/shm
-    # the automount rule for udev needs /tmp directory available, as /tmp =
is a symlink
-    # to /var/tmp which in turn is a symlink to /var/volatile/tmp, we need=
 to make sure
-    # /var/volatile/tmp directory to be available.
-    mkdir -m 1777 -p /var/volatile/tmp
=20
     # make_extra_nodes
     kill_udevd &gt; "/dev/null" 2&gt;&amp;1
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/run-ptest b/meta/rec=
ipes-devtools/e2fsprogs/e2fsprogs/run-ptest
index c97c0377e9..1f873b055e 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs/run-ptest
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs/run-ptest
@@ -2,7 +2,7 @@
=20
 cd ./test
 SKIP_SLOW_TESTS=3Dyes ./test_script | sed -u -e '/:[[:space:]]ok/s/^/PASS:=
 /' -e '/:[[:space:]]failed/s/^/FAIL: /' -e '/:[[:space:]]skipped/s/^/SKIP:=
 /'
-rm -rf /var/volatile/tmp/*e2fsprogs*
+rm -rf /tmp/*e2fsprogs*
 rm -f tmp-*
 rm -f *.tmp
 rm -f *.ok
diff --git a/meta/recipes-devtools/valgrind/valgrind/0001-none-tests-fdleak=
_cmsg.stderr.exp-adjust-tmp-paths.patch b/meta/recipes-devtools/valgrind/va=
lgrind/0001-none-tests-fdleak_cmsg.stderr.exp-adjust-tmp-paths.patch
deleted file mode 100644
index e421ac6c80..0000000000
--- a/meta/recipes-devtools/valgrind/valgrind/0001-none-tests-fdleak_cmsg.s=
tderr.exp-adjust-tmp-paths.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From f405297d3382cd98391d02f397e2387da1f42879 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com">alex=
.kanavin@gmail.com</a>&gt;
-Date: Fri, 24 Jan 2020 17:55:39 +0100
-Subject: [PATCH] none/tests/fdleak_cmsg.stderr.exp: adjust /tmp paths
-
-In oe-core, /tmp is linked to /var/volatile/tmp and
-valgrind output changes accordingly
-
-Upstream-Status: Inappropriate [oe-core specific]
-Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.=
com">alex.kanavin@gmail.com</a>&gt;
----
- none/tests/fdleak_cmsg.stderr.exp | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/none/tests/fdleak_cmsg.stderr.exp b/none/tests/fdleak_cmsg.st=
derr.exp
-index 6e5a797b9..0ede1ab18 100644
---- a/none/tests/fdleak_cmsg.stderr.exp
-+++ b/none/tests/fdleak_cmsg.stderr.exp
-@@ -25,10 +25,10 @@ Open file descriptor ...: /dev/null
-=20
-=20
- FILE DESCRIPTORS: 6 open (3 std) at exit.
--Open file descriptor ...: /tmp/data2
-+Open file descriptor ...: ...
-    ...
-=20
--Open file descriptor ...: /tmp/data1
-+Open file descriptor ...: ...
-    ...
-=20
- Open AF_UNIX socket ...: &lt;unknown&gt;
---=20
-2.17.1
-
diff --git a/meta/recipes-devtools/valgrind/valgrind_3.20.0.bb b/meta/recip=
es-devtools/valgrind/valgrind_3.20.0.bb
index 07e50426e4..4ea173ba80 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.20.0.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.20.0.bb
@@ -36,7 +36,6 @@ SRC_URI =3D "https://sourceware.org/pub/valgrind/valgrind=
-${PV}.tar.bz2 \
            <a href=3D"file://0001-valgrind-filter_xml_frames-do-not-filter=
-usr.patch">file://0001-valgrind-filter_xml_frames-do-not-filter-usr.patch<=
/a> \
            <a href=3D"file://0001-memcheck-vgtests-remove-fullpath-after-f=
lags.patch">file://0001-memcheck-vgtests-remove-fullpath-after-flags.patch<=
/a> \
            <a href=3D"file://s390x_vec_op_t.patch">file://s390x_vec_op_t.p=
atch</a> \
-           <a href=3D"file://0001-none-tests-fdleak_cmsg.stderr.exp-adjust=
-tmp-paths.patch">file://0001-none-tests-fdleak_cmsg.stderr.exp-adjust-tmp-=
paths.patch</a> \
            <a href=3D"file://0001-memcheck-tests-Fix-timerfd-syscall-test.=
patch">file://0001-memcheck-tests-Fix-timerfd-syscall-test.patch</a> \
            <a href=3D"file://0001-docs-Disable-manual-validation.patch">fi=
le://0001-docs-Disable-manual-validation.patch</a> \
            <a href=3D"file://0001-drd-tests-Include-missing-cstdint.patch"=
>file://0001-drd-tests-Include-missing-cstdint.patch</a> \
<div>--=20
</div>2.34.1

</div></blockquote></div>
--=-mh58mNlQvRfQn5tb/I/r--


