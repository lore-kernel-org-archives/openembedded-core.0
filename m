Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web12.14697.1601218216635409517
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Sep 2020 07:50:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Yose/7O+;
 spf=pass (domain: gmail.com, ip: 209.85.218.42, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id r7so4811182ejs.11
        for <openembedded-core@lists.openembedded.org>; Sun, 27 Sep 2020 07:50:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=eMOyIkXBBrPdsU8SfaOGKnI2P1nTcU1Zyl2PZOPpBko=;
        b=Yose/7O+3AZ43cQ/fIZuQWj/ZVnNTcy/FcdEDvNGdDyosAWbLYX61+wDU2UgnJ3fGE
         m9AMOhsQQzdn5Qq3WyghA1VLaSNy+CkZebK8U6dGhH3WLw0CQiWafRyC4KfaIAmBHS8Z
         KlV3BuCH9l7lq8PVT3iWHTDdMoA86w6aYac66OcPpsc1yhnyoMJ+2kSt7/PF8tIhMp7h
         JOpTEDu7UXk2nV6oZsRPWOzU8u0wFAKQ1n7fR3K90+SgOH9jB8GfONHjK2l8DDFn7By9
         nsXg7uSH6pKrIarK87FhE7dobwJPOStI0pdQZWuKq2kNHoHPM9gF3Phn0DNe9upLqXqs
         Qqmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eMOyIkXBBrPdsU8SfaOGKnI2P1nTcU1Zyl2PZOPpBko=;
        b=AzQvfBQ5oTSRdqo7p83yscoaPX0E8IXVyNtGtMBGRDOSa9tnsmJ9T2v6C6SC5zMiAz
         VoU/M57eZxSKA6dsEFTglY29s6+vcLud3mqBTRU8JxhbiT2nm+z5fHoPvZ8JY87DMsf3
         Cx8XD1s23VVIDh3hCVrcsJ/uFzYjx/7t6qHaw5VwMibrI2xSn2WpcjWB4giOZmkhBvcw
         KiADU5gZQRnG4/AoQmW6ioT4MIZ6HRWTgOPSmQ2YTrZCMGI8H6KA/q3wShjkH4J9iKpO
         rN3wGqTMoYSdXGtiZCprWrYtWGmD5lwRDwMM+jv6twWjuyNEFiNOxpWCFZy3GtdDvw5t
         OOHw==
X-Gm-Message-State: AOAM533s0CsZX+gWKIKV6NFM/hAgXsjJZryk0VfqREiAsngYgyzriyg5
	cRQE6BnPkqlLhbDkStJD0RAlSNWK74keZqz2mVM=
X-Google-Smtp-Source: ABdhPJx4Y6OZGCPJVTbSTymmh66B/5j1XE5Aq7c3znpfSWyjsrmYJIz0WRbJe14GtC2/YixV9wrmCcCylp9LzpMRbeI=
X-Received: by 2002:a17:907:444f:: with SMTP id on23mr11404066ejb.392.1601218214782;
 Sun, 27 Sep 2020 07:50:14 -0700 (PDT)
MIME-Version: 1.0
References: <20200923181447.31521-1-geissonator@gmail.com>
In-Reply-To: <20200923181447.31521-1-geissonator@gmail.com>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Sun, 27 Sep 2020 16:50:03 +0200
Message-ID: <CA+chaQdb7g+M7c-v_a_HozyOafdb5zEfP1wTOe9L2+6h5Xzvpw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] systemd: Upgrade v246.2 -> v246.6
To: Andrew Geissler <geissonator@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000e66c1205b04caa8a"

--000000000000e66c1205b04caa8a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

There seems to be small regression in the modules-load.d path caused by
this.

E.g. iwd recipe from meta-openembedded now fails with:
ERROR: iwd-1.9-r0 do_package: QA Issue: iwd: Files/directories were
installed but not shipped in any package:
  /lib/modules-load.d
  /lib/modules-load.d/pkcs8.conf
Please set FILES such that these items are packaged. Alternatively if they
are unneeded, avoid installing them or delete them within do_install.
iwd: 2 installed and not shipped files. [installed-vs-shipped]

because iwd's configure is using modulesloaddir from pkg-config:

iwd/1.9-r0/build$ pkg-config --variable=3Dmodulesloaddir systemd
/lib/modules-load.d

But for FILES_${PN} it uses:
${nonarch_libdir}/modules-load.d
which in default setup is
/usr/lib/modules-load.d

I've added a comment in upstream issue ticket to see if this pkg-config
change was really intentional
https://github.com/systemd/systemd/issues/16773#issuecomment-699644407

On Wed, Sep 23, 2020 at 8:15 PM Andrew Geissler <geissonator@gmail.com>
wrote:

> 0001-Use-PREFIX-ROOTPREFIX-correctly.patch was fixed fix the following:
> https://github.com/systemd/systemd/pull/17009
>
> 2ee1c57c4f (tag: v246.6) kernel-install/90-loaderentry: fix when /boot i=
s
> not mountpoint
> a2a8802abe homed: make clean that --storage=3Ddirectory
> --image-path=3D/dev/some-block-device is not supported
> e1df274a76 homed: make sure our worker processes finish before we exit
> f2763ff6cd nspawn: fix fd leak on failure path
> 6f9c8af500 nspawn: check return of setsid()
> 31875b3cb0 dissect: is_loop_device() returns negative on error, don't
> mistake that is true
> 418cf0e78c dissect: always invalidate secondary arch partitions if we
> found primary arch
> 1d17c00260 util: wireguard is merged into upstream kernel
> 48a308b76a repart: don't mark image files generated with --empty=3Dcreat=
e
> executable
> 9353607ef3 man: substitute path to rc.local in the man page
> f2b9345cd2 meson: RC_LOCAL_SCRIPT_PATH_START to RC_LOCAL_PATH
> b0fff9012a socket-proxy: allow localhost addresses
> 5e8bf33de1 sd-bus: allow localhost addresses
> ad77a988f2 fstab-generator: add 'nofail' when  NFS 'bg' option is used
> d08f6fddc0 busctl: add missing shortopt -l
> 64d58480ac socket-util: reset length argument for second getsockopt call
> in fd_[gs]et_rcvbuf
> 0046c58334 test: use pclose() for popen()
> 689d2e061b core: propagate unit start limit hit state to triggering path
> unit
> 2f53d690ea core: propagate triggered unit in more load states
> a06cf9a5ba bootctl: handle if LoaderSystemToken is invalid for some reas=
on
> e2c0023dd2 test-fileio: test test strings with shell, too
> 251b96c9b5 test-env-file: add test that tests our env file read + writer=
 +
> shell against each other
> 4d1922d8bb env-file: bring our decoding of double-quoted strings in env
> files in line with shell
> 281581cd74 test-fileio: use test strings that are actually valid in shel=
l
> 366d38d8ed man: document that RemainAfterElapse=3Dno means that also the
> triggered unit needs to deactivate
> d0f0f048ec (tag: v246.5) sd-path: use ROOTPREFIX without suffixed slash
> e662cf6d51 hashmap: make sure to initialize shared hash key atomically
> da310c6b45 socket: downgrade log warnings about inability to set socket
> buffer sizes
> ab6fcd9135 core: fix securebits setting
> 4f6925484d capability-util: add new function for raising setpcap
> 771436884d network: do not add prefix to RA if radv is not configured
> fb2afc5f30 man: document the random delay of persistent timers
> b2006ddc8f test-network: add test for ENOBUFS issue #17012
> 8758580ef5 backlight: do not claim that ID_BACKLIGHT_CLAMP=3D property i=
s
> not set
> 57fc184a6c fs-util,tmpfiles: fix error handling of fchmod_opath()
> db0f031e70 bootctl: don't accidentally propagate errors in "bootctl stat=
us"
> 3e2c806681 ethtool-util: don't pass error value that isn't used to
> log_syntax
> b671730edb network: don't fail on various config parse errors
> 0ad86030c5 man: document that sd_bus_message_close_container() may only =
be
> called at end of container
> f3da018017 cryptsetup: Fix null pointer dereference (#16987)
> 6f65eaf9c2 core: fix set keep caps for ambient capabilities
> 08338a234e core: fix comments on ambient capabilities
> f0e6d9876d network: make log_link_error() or friends return void
> 35766dc61b core: make log_unit_error() or friends return void
> 3ed10b2ee8 core/slice: explicitly specify return value
> 2f6406914b udev: do not discard const qualifier
> 07671aa4cc sd-device: make log_device_error() or friends return void
> d4bea73972 udev: explicitly specify return value
> 7db399be1e udev: return negative errno for invalid EVDEV_ABS_XXX=3D prop=
erty
> 8c8d188e85 udev: make log_rule_error() or friends return void
> 4921375fd3 socket: fix copy/paste error
> 0f7fd97749 udev: warn if failed to set buffer size for device monitor
> fc763d38d8 network: increase receive buffer size for device monitor
> 3bf7797f1f network: do not start device monitor if /sys is read-only
> ebc0729c6a network: honor the buffer size specified in networkd.socket
> ef3d2e178b core/socket: use fd_set_{rcv,snd}buf()
> 5dd4cc4b10 sd-device-monitor: use fd_set_rcvbuf()
> fe9b92e566 util: introduce fd_set_{snd,rcv}buf()
> 4dcae66688 util: try to set with SO_{RCV,SND}BUFFORCE when requested siz=
e
> is larger than the kernel limit
> 4b6b523946 util: refuse to set too large value for socket buffer size
> b4be8edb45 network: ignore error on increasing netlink receive buffer si=
ze
> 5ce47fb491 tree-wide: if get_block_device() returns zero devno, check fo=
r
> it in all cases
> 8ea6ec18e7 btrfs: if BTRFS_IOC_DEV_INFO returns /dev/root generate a
> friendly error message
> e1ff4947d2 basic/log: make log_{info,warning,...} return void
> 8019995e9a tree-wide: correct cases where return log_{error,warning} is
> used without value
> 932f4c3e8b test-execute/exec-dynamicuser-statedir.service: fix quoting
> 16b9426f70 man: fix quickhelp listing in sysusers.d(5)
> bde903d9e9 network: fix NDisc handling for the case when multiple router=
s
> exist
> c965063b64 network: expose route_{hash,compare}_func()
> 6d24a40669 network: expose address_{hash,compare}_func()
> 054838a2e0 util: expose in6_addr_{hash,compare}_func()
> 58bd4a70de network: fixes gateway assignment through DHCPv4
> 8ad5382fe3 bash-completion: resolvectl: support 'log-level' command
> a98bd75072 resolvectl: add 'log-level' to help message
> 78262fe807 core/socket: we may get ENOTCONN from
> socket_instantiate_service()
> fecb3f00c4 homed: remember the secret even when the for_state is
> FIXATING_FOR_ACQUIRE
> dc2e82af33 (tag: v246.4) core: create per-user inaccessible node from th=
e
> service manager
> 0b3c497347 nspawn,pid1: pass "inaccessible" nodes from cntr mgr to pid1
> payload via /run/host
> 2239965c29 coredump: don't convert s =E2=86=92 =C2=B5s twice
> 61d29b7f8c firstboot: fill empty color if ansi_color unavailable from
> os-release
> 9678a3daf6 varlink: do not parse invalid messages twice
> 4e516dcbc1 userdbctl: add forgotten --output mode in help
> aee20dfbd8 shared/{user,group}-record-nss: adjust filtering of "valid"
> passwords
> 5933d77afe doc: cross link sd_listen_fd() docs a bit
> 97fdde3239 Rework how we cache mtime to figure out if units changed
> 0500968241 core: always try to reload not-found unit
> 8ae22f0d64 pid1: use the cache mtime not clock to "mark" load attempts
> 715507c277 core: rename manager_unit_file_maybe_loadable_from_cache()
> 20ad76d0a7 man: document fd ownership for sd-bus fd marshalling
> 38ae73fafd resolved: make sure we initialize t->answer_errno before
> completing the transaction
> a1ba0fbef6 homed: fix log message to honor real homework path
> d6b1e659b3 src/shared/dissect-image.c: fix build without blkdid (#16901)
> e42f9add21 analyze: fix error handling in one case
> 4804ce1488 units: add missing usb-gadget.target
> 5ad4e68c37 man: extend on the usec/sec discrepancy
> 2fb612371d login/logind: Include sys/stat.h for struct stat usage
> 5e884e7ee0 partition/makefs: Include missing sys/file.h header
> 7bbc3807da network: dhcp6: logs only new address
> 2056429e0f Don't run test-repart when loop devices are not available
> dcbea51c5a man: clarify that several networkctl commands takes device na=
mes
> 16e4cfcc82 networkctl: label command does not take any argument
> 2352921244 missing: Add new Linux capability
> 8b29c4a4f9 tty-ask-pw-agent: properly propagate error
> f7ce2e9839 tty-ask-pw-agent: the message string might not be set
> 29cba5c9ef tty-ask-pw-agent: make sure "--list" works correctly
> e1ce367d73 add "list" verb to autocompleted commands
> 1f4cb5da1e shell-completion/zsh: add missing verbs for networkctl
> a4236a2764 path: Improve $PATH search directory case
> b7cef386bd (tag: v246.3) path: Skip directories when finalising $PATH
> search
> 122945f315 rules: don't install 80-drivers.rules when kmod is disabled
> 42fab2d454 zsh: correct journalctl command completion parsing
> ed3f97f962 basic/missing_syscall: fix syscall numbers for arm64 :(
> ba6e7f7c46 shared/install: fix preset operations for non-service
> instantiated units
> d39f139348 nss-resolve: treat BUS_ERROR_NO_SUCH_UNIT the same as
> SD_BUS_ERROR_SERVICE_UNKNOWN too
> 9bb3e64d71 various: treat BUS_ERROR_NO_SUCH_UNIT the same as
> SD_BUS_ERROR_SERVICE_UNKNOWN
> 6d802dd596 man: drop reference to long gone .busname unit type
> a29656804b man: fix a fix of a typo in systemd.service example
> 21ce0f5b33 network: can: Fix CAN initialization
> cab5cde8c9 man: update autogenerated dbus api lists
> 0d8000522b man: fix invalid tag place
> ea94f218be man: add conditionals to more man pages
> ef91325349 meson: add ENABLE_ANALYZE conditional
> 83f7c0a7ec core: add missing conditions/asserts to unit file parsing
> 716718155d analyze: rework condition testing
> 5c4c7581bc sd-bus: fix error handling on readv()
> 6cd058f305 user-runtime-dir: deal gracefully with missing logind propert=
ies
> 6a2d73638d shared/seccomp: do not use ifdef guards around textual syscal=
l
> names
> 7355ac9689 machine-id-setup: don't use KVM or container manager supplied
> uuid if in chroot env
> 496a71f444 man: Fix typo in systemd-tmpfiles
> 6c5d216ad8 homework: downgrade chattr failure log message
> 1708f06a00 homework: explicitly close cryptsetup context, to not keep
> loopback device busy
> a21eaa2a3a homework: correct error passed into log message
> 3a2d169f36 homework: sync everything to disk before we rename LUKS
> loopback file into place
> 84e1ab74d2 homed: downgrade quota message in containers
> 8b62cadf36 analyze-security: do not assign badness to filtered-out sysca=
lls
> 29854a5437 NEWS: clarify two points
> 4cb4fb82f7 meson: add min version for libfdisk
> 76331f86f6 load-fragment: fix grammar in error messages
> 1e53c2d70f Fix function description in logind man page
> 669066564d network: do not fail if UseMTU=3Dyes on DHCP lease lost
> a2a3f16cdc missing_syscall: do not use function name that may conflict
> with glibc
> 4091dcd469 missing_syscall: fix pidfd_{send_signal,open} numbers for alp=
ha
> 7875daf52b network: wait for previous address removal before configuring
> static addresses
> 120064b4a1 network: only process non-error message
> f44ec1de15 test: accept that char device 0/0 can now be created witout
> privileges
>
> Signed-off-by: Andrew Geissler <geissonator@gmail.com>
> ---
>  meta/recipes-core/systemd/systemd.inc         |  2 +-
>  ...0001-Use-PREFIX-ROOTPREFIX-correctly.patch | 81 -------------------
>  .../{systemd_246.2.bb =3D> systemd_246.6.bb}    |  1 -
>  3 files changed, 1 insertion(+), 83 deletions(-)
>  delete mode 100644
> meta/recipes-core/systemd/systemd/0001-Use-PREFIX-ROOTPREFIX-correctly.p=
atch
>  rename meta/recipes-core/systemd/{systemd_246.2.bb =3D> systemd_246.6.b=
b}
> (99%)
>
> diff --git a/meta/recipes-core/systemd/systemd.inc
> b/meta/recipes-core/systemd/systemd.inc
> index b0d4fe4033..1733565fc0 100644
> --- a/meta/recipes-core/systemd/systemd.inc
> +++ b/meta/recipes-core/systemd/systemd.inc
> @@ -14,7 +14,7 @@ LICENSE =3D "GPLv2 & LGPLv2.1"
>  LIC_FILES_CHKSUM =3D
> "file://LICENSE.GPL2;md5=3D751419260aa954499f7abaabaa882bbe \
>
>  file://LICENSE.LGPL2.1;md5=3D4fbd65380cdd255951079008b364516c"
>
> -SRCREV =3D "91b37e6f0982e1e64c63017000248d7441a83a2e"
> +SRCREV =3D "2ee1c57c4ff4fd3349cf03c2e89fbd18ca0b3a4a"
>  SRCBRANCH =3D "v246-stable"
>  SRC_URI =3D "git://
> github.com/systemd/systemd-stable.git;protocol=3Dgit;branch=3D${SRCBRANC=
H}
> <http://github.com/systemd/systemd-stable.git;protocol=3Dgit;branch=3D$%=
7BSRCBRANCH%7D>
> "
>
> diff --git
> a/meta/recipes-core/systemd/systemd/0001-Use-PREFIX-ROOTPREFIX-correctly=
.patch
> b/meta/recipes-core/systemd/systemd/0001-Use-PREFIX-ROOTPREFIX-correctly=
.patch
> deleted file mode 100644
> index c61941df91..0000000000
> ---
> a/meta/recipes-core/systemd/systemd/0001-Use-PREFIX-ROOTPREFIX-correctly=
.patch
> +++ /dev/null
> @@ -1,81 +0,0 @@
> -From 2868e3b72d4ac02860e380d70c9af0d61a985790 Mon Sep 17 00:00:00 2001
> -From: Alex Kiernan <alex.kiernan@gmail.com>
> -Date: Sun, 16 Aug 2020 16:07:12 +0000
> -Subject: [PATCH] Use PREFIX/ROOTPREFIX correctly
> -
> -Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> -Upstream-status: Pending [https://github.com/systemd/systemd/issues/167=
73
> ]
> ----
> - meson.build                      | 1 +
> - src/core/systemd.pc.in           | 8 ++++----
> - src/libsystemd/sd-path/sd-path.c | 8 ++++----
> - 3 files changed, 9 insertions(+), 8 deletions(-)
> -
> -diff --git a/meson.build b/meson.build
> -index dbbddb68e232..18618dba0623 100644
> ---- a/meson.build
> -+++ b/meson.build
> -@@ -226,6 +226,7 @@ conf.set_quoted('SYSTEMD_SHUTDOWN_BINARY_PATH',
>          join_paths(rootlib
> - conf.set_quoted('SYSTEMCTL_BINARY_PATH',
> join_paths(rootbindir, 'systemctl'))
> - conf.set_quoted('SYSTEMD_TTY_ASK_PASSWORD_AGENT_BINARY_PATH',
> join_paths(rootbindir, 'systemd-tty-ask-password-agent'))
> - conf.set_quoted('SYSTEMD_STDIO_BRIDGE_BINARY_PATH',
>  join_paths(bindir, 'systemd-stdio-bridge'))
> -+conf.set_quoted('PREFIX',                                     prefixdi=
r)
> - conf.set_quoted('ROOTPREFIX',
>  rootprefixdir)
> - conf.set_quoted('RANDOM_SEED_DIR',
> randomseeddir)
> - conf.set_quoted('RANDOM_SEED',
> join_paths(randomseeddir, 'random-seed'))
> -diff --git a/src/core/systemd.pc.in b/src/core/systemd.pc.in
> -index 8424837824b5..410a126317ad 100644
> ---- a/src/core/systemd.pc.in
> -+++ b/src/core/systemd.pc.in
> -@@ -65,16 +65,16 @@ systemdshutdowndir=3D${systemd_shutdown_dir}
> - tmpfiles_dir=3D${prefix}/lib/tmpfiles.d
> - tmpfilesdir=3D${tmpfiles_dir}
> -
> --sysusers_dir=3D${rootprefix}/lib/sysusers.d
> -+sysusers_dir=3D${prefix}/lib/sysusers.d
> - sysusersdir=3D${sysusers_dir}
> -
> --sysctl_dir=3D${rootprefix}/lib/sysctl.d
> -+sysctl_dir=3D${prefix}/lib/sysctl.d
> - sysctldir=3D${sysctl_dir}
> -
> --binfmt_dir=3D${rootprefix}/lib/binfmt.d
> -+binfmt_dir=3D${prefix}/lib/binfmt.d
> - binfmtdir=3D${binfmt_dir}
> -
> --modules_load_dir=3D${rootprefix}/lib/modules-load.d
> -+modules_load_dir=3D${prefix}/lib/modules-load.d
> - modulesloaddir=3D${modules_load_dir}
> -
> - catalog_dir=3D${prefix}/lib/systemd/catalog
> -diff --git a/src/libsystemd/sd-path/sd-path.c
> b/src/libsystemd/sd-path/sd-path.c
> -index 736795d1d797..3572916dc073 100644
> ---- a/src/libsystemd/sd-path/sd-path.c
> -+++ b/src/libsystemd/sd-path/sd-path.c
> -@@ -371,19 +371,19 @@ static int get_path(uint64_t type, char **buffer,
> const char **ret) {
> -                 return 0;
> -
> -         case SD_PATH_SYSUSERS:
> --                *ret =3D ROOTPREFIX "/lib/sysusers.d";
> -+                *ret =3D PREFIX "/lib/sysusers.d";
> -                 return 0;
> -
> -         case SD_PATH_SYSCTL:
> --                *ret =3D ROOTPREFIX "/lib/sysctl.d";
> -+                *ret =3D PREFIX "/lib/sysctl.d";
> -                 return 0;
> -
> -         case SD_PATH_BINFMT:
> --                *ret =3D ROOTPREFIX "/lib/binfmt.d";
> -+                *ret =3D PREFIX "/lib/binfmt.d";
> -                 return 0;
> -
> -         case SD_PATH_MODULES_LOAD:
> --                *ret =3D ROOTPREFIX "/lib/modules-load.d";
> -+                *ret =3D PREFIX "/lib/modules-load.d";
> -                 return 0;
> -
> -         case SD_PATH_CATALOG:
> ---
> -2.17.1
> -
> diff --git a/meta/recipes-core/systemd/systemd_246.2.bb
> b/meta/recipes-core/systemd/systemd_246.6.bb
> similarity index 99%
> rename from meta/recipes-core/systemd/systemd_246.2.bb
> rename to meta/recipes-core/systemd/systemd_246.6.bb
> index af10e4212b..0167346522 100644
> --- a/meta/recipes-core/systemd/systemd_246.2.bb
> +++ b/meta/recipes-core/systemd/systemd_246.6.bb
> @@ -20,7 +20,6 @@ SRC_URI +=3D "file://touchscreen.rules \
>             file://99-default.preset \
>
> file://0001-binfmt-Don-t-install-dependency-links-at-install-tim.patch \
>             file://0003-implment-systemd-sysv-install-for-OE.patch \
> -           file://0001-Use-PREFIX-ROOTPREFIX-correctly.patch \
>             "
>
>  # patches needed by musl
> --
> 2.24.3 (Apple Git-128)
>
>
>=20
>
>

--000000000000e66c1205b04caa8a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">There seems to be small regression in the modules-load.d p=
ath caused by this.<div><br></div><div>E.g. iwd recipe=C2=A0from meta-opene=
mbedded now fails with:</div><div>ERROR: iwd-1.9-r0 do_package: QA Issue: i=
wd: Files/directories were installed but not shipped in any package:<br>=C2=
=
=A0 /lib/modules-load.d<br>=C2=A0 /lib/modules-load.d/pkcs8.conf<br>Please=
 set FILES such that these items are packaged. Alternatively if they are un=
needed, avoid installing them or delete them within do_install.<br>iwd: 2 i=
nstalled and not shipped files. [installed-vs-shipped]<br></div><div><br></=
div><div>because iwd&#39;s configure is using=C2=A0modulesloaddir from pkg-=
config:</div><div><br></div><div>iwd/1.9-r0/build$ pkg-config --variable=3D=
modulesloaddir systemd<br>/lib/modules-load.d<br></div><div><br></div><div>=
But for FILES_${PN} it uses:</div><div>${nonarch_libdir}/modules-load.d<br>=
</div><div>which in default setup is</div><div>/usr/lib/modules-load.d</div=
><div><br></div><div>I&#39;ve added a comment=C2=A0in upstream issue ticket=
 to see if this pkg-config change was really intentional</div><div><a href=
=3D"https://github.com/systemd/systemd/issues/16773#issuecomment-699644407=
">https://github.com/systemd/systemd/issues/16773#issuecomment-699644407</a=
><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"g=
mail_attr">On Wed, Sep 23, 2020 at 8:15 PM Andrew Geissler &lt;<a href=3D"m=
ailto:geissonator@gmail.com">geissonator@gmail.com</a>&gt; wrote:<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">0001-Use-PREFIX-ROOTPREFI=
X-correctly.patch was fixed fix the following:<br>
<a href=3D"https://github.com/systemd/systemd/pull/17009" rel=3D"noreferre=
r" target=3D"_blank">https://github.com/systemd/systemd/pull/17009</a><br>
<br>
2ee1c57c4f (tag: v246.6) kernel-install/90-loaderentry: fix when /boot is =
not mountpoint<br>
a2a8802abe homed: make clean that --storage=3Ddirectory --image-path=3D/de=
v/some-block-device is not supported<br>
e1df274a76 homed: make sure our worker processes finish before we exit<br>
f2763ff6cd nspawn: fix fd leak on failure path<br>
6f9c8af500 nspawn: check return of setsid()<br>
31875b3cb0 dissect: is_loop_device() returns negative on error, don&#39;t =
mistake that is true<br>
418cf0e78c dissect: always invalidate secondary arch partitions if we foun=
d primary arch<br>
1d17c00260 util: wireguard is merged into upstream kernel<br>
48a308b76a repart: don&#39;t mark image files generated with --empty=3Dcre=
ate executable<br>
9353607ef3 man: substitute path to rc.local in the man page<br>
f2b9345cd2 meson: RC_LOCAL_SCRIPT_PATH_START to RC_LOCAL_PATH<br>
b0fff9012a socket-proxy: allow localhost addresses<br>
5e8bf33de1 sd-bus: allow localhost addresses<br>
ad77a988f2 fstab-generator: add &#39;nofail&#39; when=C2=A0 NFS &#39;bg&#3=
9; option is used<br>
d08f6fddc0 busctl: add missing shortopt -l<br>
64d58480ac socket-util: reset length argument for second getsockopt call i=
n fd_[gs]et_rcvbuf<br>
0046c58334 test: use pclose() for popen()<br>
689d2e061b core: propagate unit start limit hit state to triggering path u=
nit<br>
2f53d690ea core: propagate triggered unit in more load states<br>
a06cf9a5ba bootctl: handle if LoaderSystemToken is invalid for some reason=
<br>
e2c0023dd2 test-fileio: test test strings with shell, too<br>
251b96c9b5 test-env-file: add test that tests our env file read + writer +=
 shell against each other<br>
4d1922d8bb env-file: bring our decoding of double-quoted strings in env fi=
les in line with shell<br>
281581cd74 test-fileio: use test strings that are actually valid in shell<=
br>
366d38d8ed man: document that RemainAfterElapse=3Dno means that also the t=
riggered unit needs to deactivate<br>
d0f0f048ec (tag: v246.5) sd-path: use ROOTPREFIX without suffixed slash<br=
>
e662cf6d51 hashmap: make sure to initialize shared hash key atomically<br>
da310c6b45 socket: downgrade log warnings about inability to set socket bu=
ffer sizes<br>
ab6fcd9135 core: fix securebits setting<br>
4f6925484d capability-util: add new function for raising setpcap<br>
771436884d network: do not add prefix to RA if radv is not configured<br>
fb2afc5f30 man: document the random delay of persistent timers<br>
b2006ddc8f test-network: add test for ENOBUFS issue #17012<br>
8758580ef5 backlight: do not claim that ID_BACKLIGHT_CLAMP=3D property is =
not set<br>
57fc184a6c fs-util,tmpfiles: fix error handling of fchmod_opath()<br>
db0f031e70 bootctl: don&#39;t accidentally propagate errors in &quot;bootc=
tl status&quot;<br>
3e2c806681 ethtool-util: don&#39;t pass error value that isn&#39;t used to=
 log_syntax<br>
b671730edb network: don&#39;t fail on various config parse errors<br>
0ad86030c5 man: document that sd_bus_message_close_container() may only be=
 called at end of container<br>
f3da018017 cryptsetup: Fix null pointer dereference (#16987)<br>
6f65eaf9c2 core: fix set keep caps for ambient capabilities<br>
08338a234e core: fix comments on ambient capabilities<br>
f0e6d9876d network: make log_link_error() or friends return void<br>
35766dc61b core: make log_unit_error() or friends return void<br>
3ed10b2ee8 core/slice: explicitly specify return value<br>
2f6406914b udev: do not discard const qualifier<br>
07671aa4cc sd-device: make log_device_error() or friends return void<br>
d4bea73972 udev: explicitly specify return value<br>
7db399be1e udev: return negative errno for invalid EVDEV_ABS_XXX=3D proper=
ty<br>
8c8d188e85 udev: make log_rule_error() or friends return void<br>
4921375fd3 socket: fix copy/paste error<br>
0f7fd97749 udev: warn if failed to set buffer size for device monitor<br>
fc763d38d8 network: increase receive buffer size for device monitor<br>
3bf7797f1f network: do not start device monitor if /sys is read-only<br>
ebc0729c6a network: honor the buffer size specified in networkd.socket<br>
ef3d2e178b core/socket: use fd_set_{rcv,snd}buf()<br>
5dd4cc4b10 sd-device-monitor: use fd_set_rcvbuf()<br>
fe9b92e566 util: introduce fd_set_{snd,rcv}buf()<br>
4dcae66688 util: try to set with SO_{RCV,SND}BUFFORCE when requested size =
is larger than the kernel limit<br>
4b6b523946 util: refuse to set too large value for socket buffer size<br>
b4be8edb45 network: ignore error on increasing netlink receive buffer size=
<br>
5ce47fb491 tree-wide: if get_block_device() returns zero devno, check for =
it in all cases<br>
8ea6ec18e7 btrfs: if BTRFS_IOC_DEV_INFO returns /dev/root generate a frien=
dly error message<br>
e1ff4947d2 basic/log: make log_{info,warning,...} return void<br>
8019995e9a tree-wide: correct cases where return log_{error,warning} is us=
ed without value<br>
932f4c3e8b test-execute/exec-dynamicuser-statedir.service: fix quoting<br>
16b9426f70 man: fix quickhelp listing in sysusers.d(5)<br>
bde903d9e9 network: fix NDisc handling for the case when multiple routers =
exist<br>
c965063b64 network: expose route_{hash,compare}_func()<br>
6d24a40669 network: expose address_{hash,compare}_func()<br>
054838a2e0 util: expose in6_addr_{hash,compare}_func()<br>
58bd4a70de network: fixes gateway assignment through DHCPv4<br>
8ad5382fe3 bash-completion: resolvectl: support &#39;log-level&#39; comman=
d<br>
a98bd75072 resolvectl: add &#39;log-level&#39; to help message<br>
78262fe807 core/socket: we may get ENOTCONN from socket_instantiate_servic=
e()<br>
fecb3f00c4 homed: remember the secret even when the for_state is FIXATING_=
FOR_ACQUIRE<br>
dc2e82af33 (tag: v246.4) core: create per-user inaccessible node from the =
service manager<br>
0b3c497347 nspawn,pid1: pass &quot;inaccessible&quot; nodes from cntr mgr =
to pid1 payload via /run/host<br>
2239965c29 coredump: don&#39;t convert s =E2=86=92 =C2=B5s twice<br>
61d29b7f8c firstboot: fill empty color if ansi_color unavailable from os-r=
elease<br>
9678a3daf6 varlink: do not parse invalid messages twice<br>
4e516dcbc1 userdbctl: add forgotten --output mode in help<br>
aee20dfbd8 shared/{user,group}-record-nss: adjust filtering of &quot;valid=
&quot; passwords<br>
5933d77afe doc: cross link sd_listen_fd() docs a bit<br>
97fdde3239 Rework how we cache mtime to figure out if units changed<br>
0500968241 core: always try to reload not-found unit<br>
8ae22f0d64 pid1: use the cache mtime not clock to &quot;mark&quot; load at=
tempts<br>
715507c277 core: rename manager_unit_file_maybe_loadable_from_cache()<br>
20ad76d0a7 man: document fd ownership for sd-bus fd marshalling<br>
38ae73fafd resolved: make sure we initialize t-&gt;answer_errno before com=
pleting the transaction<br>
a1ba0fbef6 homed: fix log message to honor real homework path<br>
d6b1e659b3 src/shared/dissect-image.c: fix build without blkdid (#16901)<b=
r>
e42f9add21 analyze: fix error handling in one case<br>
4804ce1488 units: add missing usb-gadget.target<br>
5ad4e68c37 man: extend on the usec/sec discrepancy<br>
2fb612371d login/logind: Include sys/stat.h for struct stat usage<br>
5e884e7ee0 partition/makefs: Include missing sys/file.h header<br>
7bbc3807da network: dhcp6: logs only new address<br>
2056429e0f Don&#39;t run test-repart when loop devices are not available<b=
r>
dcbea51c5a man: clarify that several networkctl commands takes device name=
s<br>
16e4cfcc82 networkctl: label command does not take any argument<br>
2352921244 missing: Add new Linux capability<br>
8b29c4a4f9 tty-ask-pw-agent: properly propagate error<br>
f7ce2e9839 tty-ask-pw-agent: the message string might not be set<br>
29cba5c9ef tty-ask-pw-agent: make sure &quot;--list&quot; works correctly<=
br>
e1ce367d73 add &quot;list&quot; verb to autocompleted commands<br>
1f4cb5da1e shell-completion/zsh: add missing verbs for networkctl<br>
a4236a2764 path: Improve $PATH search directory case<br>
b7cef386bd (tag: v246.3) path: Skip directories when finalising $PATH sear=
ch<br>
122945f315 rules: don&#39;t install 80-drivers.rules when kmod is disabled=
<br>
42fab2d454 zsh: correct journalctl command completion parsing<br>
ed3f97f962 basic/missing_syscall: fix syscall numbers for arm64 :(<br>
ba6e7f7c46 shared/install: fix preset operations for non-service instantia=
ted units<br>
d39f139348 nss-resolve: treat BUS_ERROR_NO_SUCH_UNIT the same as SD_BUS_ER=
ROR_SERVICE_UNKNOWN too<br>
9bb3e64d71 various: treat BUS_ERROR_NO_SUCH_UNIT the same as SD_BUS_ERROR_=
SERVICE_UNKNOWN<br>
6d802dd596 man: drop reference to long gone .busname unit type<br>
a29656804b man: fix a fix of a typo in systemd.service example<br>
21ce0f5b33 network: can: Fix CAN initialization<br>
cab5cde8c9 man: update autogenerated dbus api lists<br>
0d8000522b man: fix invalid tag place<br>
ea94f218be man: add conditionals to more man pages<br>
ef91325349 meson: add ENABLE_ANALYZE conditional<br>
83f7c0a7ec core: add missing conditions/asserts to unit file parsing<br>
716718155d analyze: rework condition testing<br>
5c4c7581bc sd-bus: fix error handling on readv()<br>
6cd058f305 user-runtime-dir: deal gracefully with missing logind propertie=
s<br>
6a2d73638d shared/seccomp: do not use ifdef guards around textual syscall =
names<br>
7355ac9689 machine-id-setup: don&#39;t use KVM or container manager suppli=
ed uuid if in chroot env<br>
496a71f444 man: Fix typo in systemd-tmpfiles<br>
6c5d216ad8 homework: downgrade chattr failure log message<br>
1708f06a00 homework: explicitly close cryptsetup context, to not keep loop=
back device busy<br>
a21eaa2a3a homework: correct error passed into log message<br>
3a2d169f36 homework: sync everything to disk before we rename LUKS loopbac=
k file into place<br>
84e1ab74d2 homed: downgrade quota message in containers<br>
8b62cadf36 analyze-security: do not assign badness to filtered-out syscall=
s<br>
29854a5437 NEWS: clarify two points<br>
4cb4fb82f7 meson: add min version for libfdisk<br>
76331f86f6 load-fragment: fix grammar in error messages<br>
1e53c2d70f Fix function description in logind man page<br>
669066564d network: do not fail if UseMTU=3Dyes on DHCP lease lost<br>
a2a3f16cdc missing_syscall: do not use function name that may conflict wit=
h glibc<br>
4091dcd469 missing_syscall: fix pidfd_{send_signal,open} numbers for alpha=
<br>
7875daf52b network: wait for previous address removal before configuring s=
tatic addresses<br>
120064b4a1 network: only process non-error message<br>
f44ec1de15 test: accept that char device 0/0 can now be created witout pri=
vileges<br>
<br>
Signed-off-by: Andrew Geissler &lt;<a href=3D"mailto:geissonator@gmail.com=
" target=3D"_blank">geissonator@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-core/systemd/systemd.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0|=C2=A0 2 +-<br>
=C2=A0...0001-Use-PREFIX-ROOTPREFIX-correctly.patch | 81 -----------------=
--<br>
=C2=A0.../{<a href=3D"http://systemd_246.2.bb" rel=3D"noreferrer" target=
=3D"_blank">systemd_246.2.bb</a> =3D&gt; <a href=3D"http://systemd_246.6.b=
b" rel=3D"noreferrer" target=3D"_blank">systemd_246.6.bb</a>}=C2=A0 =C2=A0 =
|=C2=A0 1 -<br>
=C2=A03 files changed, 1 insertion(+), 83 deletions(-)<br>
=C2=A0delete mode 100644 meta/recipes-core/systemd/systemd/0001-Use-PREFIX=
-ROOTPREFIX-correctly.patch<br>
=C2=A0rename meta/recipes-core/systemd/{<a href=3D"http://systemd_246.2.bb=
" rel=3D"noreferrer" target=3D"_blank">systemd_246.2.bb</a> =3D&gt; <a href=
=
=3D"http://systemd_246.6.bb" rel=3D"noreferrer" target=3D"_blank">systemd_=
246.6.bb</a>} (99%)<br>
<br>
diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/sys=
temd/systemd.inc<br>
index b0d4fe4033..1733565fc0 100644<br>
--- a/meta/recipes-core/systemd/systemd.inc<br>
+++ b/meta/recipes-core/systemd/systemd.inc<br>
@@ -14,7 +14,7 @@ LICENSE =3D &quot;GPLv2 &amp; LGPLv2.1&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://LICENSE.GPL2;md5=3D751419260aa9544=
99f7abaabaa882bbe \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0file://LICENSE.LGPL2.1;md5=3D4fbd65380cdd255951079008b364516c&quot;<br>
<br>
-SRCREV =3D &quot;91b37e6f0982e1e64c63017000248d7441a83a2e&quot;<br>
+SRCREV =3D &quot;2ee1c57c4ff4fd3349cf03c2e89fbd18ca0b3a4a&quot;<br>
=C2=A0SRCBRANCH =3D &quot;v246-stable&quot;<br>
=C2=A0SRC_URI =3D &quot;git://<a href=3D"http://github.com/systemd/systemd=
-stable.git;protocol=3Dgit;branch=3D$%7BSRCBRANCH%7D" rel=3D"noreferrer" ta=
rget=3D"_blank">github.com/systemd/systemd-stable.git;protocol=3Dgit;branch=
=
=3D${SRCBRANCH}</a>&quot;<br>
<br>
diff --git a/meta/recipes-core/systemd/systemd/0001-Use-PREFIX-ROOTPREFIX-=
correctly.patch b/meta/recipes-core/systemd/systemd/0001-Use-PREFIX-ROOTPRE=
FIX-correctly.patch<br>
deleted file mode 100644<br>
index c61941df91..0000000000<br>
--- a/meta/recipes-core/systemd/systemd/0001-Use-PREFIX-ROOTPREFIX-correct=
ly.patch<br>
+++ /dev/null<br>
@@ -1,81 +0,0 @@<br>
-From 2868e3b72d4ac02860e380d70c9af0d61a985790 Mon Sep 17 00:00:00 2001<br=
>
-From: Alex Kiernan &lt;<a href=3D"mailto:alex.kiernan@gmail.com" target=
=3D"_blank">alex.kiernan@gmail.com</a>&gt;<br>
-Date: Sun, 16 Aug 2020 16:07:12 +0000<br>
-Subject: [PATCH] Use PREFIX/ROOTPREFIX correctly<br>
-<br>
-Signed-off-by: Alex Kiernan &lt;<a href=3D"mailto:alex.kiernan@gmail.com"=
 target=3D"_blank">alex.kiernan@gmail.com</a>&gt;<br>
-Upstream-status: Pending [<a href=3D"https://github.com/systemd/systemd/i=
ssues/16773" rel=3D"noreferrer" target=3D"_blank">https://github.com/system=
d/systemd/issues/16773</a>]<br>
----<br>
- meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 | 1 +<br>
- src/core/<a href=3D"http://systemd.pc.in" rel=3D"noreferrer" target=3D"_=
blank">systemd.pc.in</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 8 ++++--=
--<br>
- src/libsystemd/sd-path/sd-path.c | 8 ++++----<br>
- 3 files changed, 9 insertions(+), 8 deletions(-)<br>
-<br>
-diff --git a/meson.build b/meson.build<br>
-index dbbddb68e232..18618dba0623 100644<br>
---- a/meson.build<br>
-+++ b/meson.build<br>
-@@ -226,6 +226,7 @@ conf.set_quoted(&#39;SYSTEMD_SHUTDOWN_BINARY_PATH&#39=
;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0join_paths(rootlib=
<br>
- conf.set_quoted(&#39;SYSTEMCTL_BINARY_PATH&#39;,=C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 join_paths(rootbindir=
, &#39;systemctl&#39;))<br>
- conf.set_quoted(&#39;SYSTEMD_TTY_ASK_PASSWORD_AGENT_BINARY_PATH&#39;, jo=
in_paths(rootbindir, &#39;systemd-tty-ask-password-agent&#39;))<br>
- conf.set_quoted(&#39;SYSTEMD_STDIO_BRIDGE_BINARY_PATH&#39;,=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0join_paths(bindir, &#39;systemd-stdio-bridge&#3=
9;))<br>
-+conf.set_quoted(&#39;PREFIX&#39;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0prefixdir)<br>
- conf.set_quoted(&#39;ROOTPREFIX&#39;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0rootprefixdir)<br>
- conf.set_quoted(&#39;RANDOM_SEED_DIR&#39;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rand=
omseeddir)<br>
- conf.set_quoted(&#39;RANDOM_SEED&#39;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 join_paths(randomseeddir, &#39;random-seed&#39;))<br>
-diff --git a/src/core/<a href=3D"http://systemd.pc.in" rel=3D"noreferrer"=
 target=3D"_blank">systemd.pc.in</a> b/src/core/<a href=3D"http://systemd.p=
c.in" rel=3D"noreferrer" target=3D"_blank">systemd.pc.in</a><br>
-index 8424837824b5..410a126317ad 100644<br>
---- a/src/core/<a href=3D"http://systemd.pc.in" rel=3D"noreferrer" target=
=
=3D"_blank">systemd.pc.in</a><br>
-+++ b/src/core/<a href=3D"http://systemd.pc.in" rel=3D"noreferrer" target=
=
=3D"_blank">systemd.pc.in</a><br>
-@@ -65,16 +65,16 @@ systemdshutdowndir=3D${systemd_shutdown_dir}<br>
- tmpfiles_dir=3D${prefix}/lib/tmpfiles.d<br>
- tmpfilesdir=3D${tmpfiles_dir}<br>
- <br>
--sysusers_dir=3D${rootprefix}/lib/sysusers.d<br>
-+sysusers_dir=3D${prefix}/lib/sysusers.d<br>
- sysusersdir=3D${sysusers_dir}<br>
- <br>
--sysctl_dir=3D${rootprefix}/lib/sysctl.d<br>
-+sysctl_dir=3D${prefix}/lib/sysctl.d<br>
- sysctldir=3D${sysctl_dir}<br>
- <br>
--binfmt_dir=3D${rootprefix}/lib/binfmt.d<br>
-+binfmt_dir=3D${prefix}/lib/binfmt.d<br>
- binfmtdir=3D${binfmt_dir}<br>
- <br>
--modules_load_dir=3D${rootprefix}/lib/modules-load.d<br>
-+modules_load_dir=3D${prefix}/lib/modules-load.d<br>
- modulesloaddir=3D${modules_load_dir}<br>
- <br>
- catalog_dir=3D${prefix}/lib/systemd/catalog<br>
-diff --git a/src/libsystemd/sd-path/sd-path.c b/src/libsystemd/sd-path/sd=
-path.c<br>
-index 736795d1d797..3572916dc073 100644<br>
---- a/src/libsystemd/sd-path/sd-path.c<br>
-+++ b/src/libsystemd/sd-path/sd-path.c<br>
-@@ -371,19 +371,19 @@ static int get_path(uint64_t type, char **buffer, c=
onst char **ret) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<b=
r>
- <br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case SD_PATH_SYSUSERS:<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *ret =3D ROOTPRE=
FIX &quot;/lib/sysusers.d&quot;;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *ret =3D PREFIX =
&quot;/lib/sysusers.d&quot;;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<b=
r>
- <br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case SD_PATH_SYSCTL:<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *ret =3D ROOTPRE=
FIX &quot;/lib/sysctl.d&quot;;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *ret =3D PREFIX =
&quot;/lib/sysctl.d&quot;;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<b=
r>
- <br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case SD_PATH_BINFMT:<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *ret =3D ROOTPRE=
FIX &quot;/lib/binfmt.d&quot;;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *ret =3D PREFIX =
&quot;/lib/binfmt.d&quot;;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<b=
r>
- <br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case SD_PATH_MODULES_LOAD:<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *ret =3D ROOTPRE=
FIX &quot;/lib/modules-load.d&quot;;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *ret =3D PREFIX =
&quot;/lib/modules-load.d&quot;;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<b=
r>
- <br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case SD_PATH_CATALOG:<br>
--- <br>
-2.17.1<br>
-<br>
diff --git a/meta/recipes-core/systemd/<a href=3D"http://systemd_246.2.bb"=
 rel=3D"noreferrer" target=3D"_blank">systemd_246.2.bb</a> b/meta/recipes-c=
ore/systemd/<a href=3D"http://systemd_246.6.bb" rel=3D"noreferrer" target=
=3D"_blank">systemd_246.6.bb</a><br>
similarity index 99%<br>
rename from meta/recipes-core/systemd/<a href=3D"http://systemd_246.2.bb" =
rel=3D"noreferrer" target=3D"_blank">systemd_246.2.bb</a><br>
rename to meta/recipes-core/systemd/<a href=3D"http://systemd_246.6.bb" re=
l=3D"noreferrer" target=3D"_blank">systemd_246.6.bb</a><br>
index af10e4212b..0167346522 100644<br>
--- a/meta/recipes-core/systemd/<a href=3D"http://systemd_246.2.bb" rel=3D=
"noreferrer" target=3D"_blank">systemd_246.2.bb</a><br>
+++ b/meta/recipes-core/systemd/<a href=3D"http://systemd_246.6.bb" rel=3D=
"noreferrer" target=3D"_blank">systemd_246.6.bb</a><br>
@@ -20,7 +20,6 @@ SRC_URI +=3D &quot;file://touchscreen.rules \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://99-default.preset \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-binfmt-Don-t-install=
-dependency-links-at-install-tim.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0003-implment-systemd-sys=
v-install-for-OE.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Use-PREFIX-ROOTPREFI=
X-correctly.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
=C2=A0# patches needed by musl<br>
-- <br>
2.24.3 (Apple Git-128)<br>
<br>
<br>
<br>
<br>
</blockquote></div>

--000000000000e66c1205b04caa8a--
