Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Rongqing.Li@windriver.com>) id 1TeEqD-0002T5-Tc
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Nov 2012 01:52:30 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id qAU0cC9L013523
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Nov 2012 16:38:13 -0800 (PST)
Received: from [128.224.162.143] (128.224.162.143) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.318.4;
	Thu, 29 Nov 2012 16:38:11 -0800
Message-ID: <50B7FFF5.4020001@windriver.com>
Date: Fri, 30 Nov 2012 08:38:13 +0800
From: Rongqing Li <rongqing.li@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120615 Thunderbird/13.0.1
MIME-Version: 1.0
To: <rongqing.li@windriver.com>
References: <cover.1352947538.git.rongqing.li@windriver.com>
	<5b89a0f8d7c21c947eb3363c6c65b3246fb888fe.1352947538.git.rongqing.li@windriver.com>
In-Reply-To: <5b89a0f8d7c21c947eb3363c6c65b3246fb888fe.1352947538.git.rongqing.li@windriver.com>
X-MIME-Autoconverted: from 8bit to quoted-printable by mail1.windriver.com id
	qAU0cC9L013523
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] Change some applets dirs to make them FHS and LSB compliance
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
X-List-Received-Date: Fri, 30 Nov 2012 00:52:30 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

Any comments?


On 2012=E5=B9=B411=E6=9C=8815=E6=97=A5 10:47, rongqing.li@windriver.com w=
rote:
> From: Roy.Li <rongqing.li@windriver.com>
>
> Change some applets dirs to make them FHS and LSB compliance by backpor=
ting
> patch dac8e79a190fcfe (Move several applets to different install dir) a=
nd
> adjusting alternatives in several bb files, the result is below:
> 	ip: /bin/-->/sbin/
> 	adduser deluser addgroup delgroup: /bin/-->/usr/sbin/
> 	fdformat: /usr/bin/-->/usr/sbin/
> 	kbd_mode: /usr/bin/-->/bin/
> 	rtcwake: /usr/bin/-->/usr/sbin/
> 	readahead: /usr/bin/-->/usr/sbin/
>
> The patch dac8e79a190fcfe also changes the below applets dirs, but thes=
e applets
> are not enabled in our busybox, or the change for these applets dirs in=
 patch
> dac8e79a190fcfe maybe not good, so do not update their alternatives.
> 	killall5 arping chat ether-wake ifplugd ipaddr iproute iprule iptunnel
>
> Signed-off-by: Roy.Li <rongqing.li@windriver.com>
> ---
>   meta/recipes-bsp/pm-utils/pm-utils_1.4.1.bb        |    6 +-
>   meta/recipes-connectivity/iproute2/iproute2.inc    |    2 +-
>   .../iproute2/iproute2_3.5.1.bb                     |    2 +-
>   ...-several-applets-to-different-install-dir.patch |  174 +++++++++++=
+++++++++
>   meta/recipes-core/busybox/busybox_1.20.2.bb        |    5 +-
>   meta/recipes-core/kbd/kbd_1.15.2.bb                |    9 +-
>   meta/recipes-core/tinylogin/tinylogin_1.4.bb       |   22 ++-
>   meta/recipes-core/util-linux/util-linux.inc        |    5 +-
>   meta/recipes-core/util-linux/util-linux_2.21.2.bb  |    2 +-
>   9 files changed, 214 insertions(+), 13 deletions(-)
>   create mode 100644 meta/recipes-core/busybox/busybox-1.20.2/Move-seve=
ral-applets-to-different-install-dir.patch
>
> diff --git a/meta/recipes-bsp/pm-utils/pm-utils_1.4.1.bb b/meta/recipes=
-bsp/pm-utils/pm-utils_1.4.1.bb
> index faa0e4e..a8f3314 100644
> --- a/meta/recipes-bsp/pm-utils/pm-utils_1.4.1.bb
> +++ b/meta/recipes-bsp/pm-utils/pm-utils_1.4.1.bb
> @@ -14,7 +14,7 @@ SRC_URI =3D "http://pm-utils.freedesktop.org/releases=
/pm-utils-${PV}.tar.gz"
>   SRC_URI[md5sum] =3D "1742a556089c36c3a89eb1b957da5a60"
>   SRC_URI[sha256sum] =3D "8ed899032866d88b2933a1d34cc75e8ae42dcde20e1cc=
21836baaae3d4370c0b"
>
> -inherit pkgconfig autotools
> +inherit pkgconfig autotools update-alternatives
>
>   RDEPENDS_${PN} =3D "grep"
>
> @@ -25,3 +25,7 @@ do_configure_prepend () {
>   FILES_${PN} +=3D "${libdir}/${BPN}/*"
>   FILES_${PN}-dbg +=3D "${libdir}/${BPN}/bin/.debug \
>   		    ${datadir}/doc/pm-utils/README.debugging"
> +
> +ALTERNATIVE_${PN} =3D "readahead"
> +ALTERNATIVE_LINK_NAME[readahead] =3D "${sbindir}/readahead"
> +ALTERNATIVE_TARGET[readahead] =3D "${libdir}/${BPN}/power.d/readahead"
> diff --git a/meta/recipes-connectivity/iproute2/iproute2.inc b/meta/rec=
ipes-connectivity/iproute2/iproute2.inc
> index d8b1a17..e3fc9e8 100644
> --- a/meta/recipes-connectivity/iproute2/iproute2.inc
> +++ b/meta/recipes-connectivity/iproute2/iproute2.inc
> @@ -31,7 +31,7 @@ FILES_${PN}-dbg +=3D "${libdir}/tc/.debug"
>
>   ALTERNATIVE_${PN} =3D "ip"
>   ALTERNATIVE_TARGET[ip] =3D "${base_sbindir}/ip.${BPN}"
> -ALTERNATIVE_LINK_NAME[ip] =3D "${base_bindir}/ip"
> +ALTERNATIVE_LINK_NAME[ip] =3D "${base_sbindir}/ip"
>   ALTERNATIVE_PRIORITY =3D "100"
>
>   PARALLEL_MAKE =3D ""
> diff --git a/meta/recipes-connectivity/iproute2/iproute2_3.5.1.bb b/met=
a/recipes-connectivity/iproute2/iproute2_3.5.1.bb
> index c1e9bd3..643f0e3 100644
> --- a/meta/recipes-connectivity/iproute2/iproute2_3.5.1.bb
> +++ b/meta/recipes-connectivity/iproute2/iproute2_3.5.1.bb
> @@ -1,6 +1,6 @@
>   require iproute2.inc
>
> -PR =3D "r1"
> +PR =3D "r2"
>
>   SRC_URI =3D "${KERNELORG_MIRROR}/linux/utils/net/${BPN}/${BPN}-${PV}.=
tar.xz \
>              file://configure-cross.patch"
> diff --git a/meta/recipes-core/busybox/busybox-1.20.2/Move-several-appl=
ets-to-different-install-dir.patch b/meta/recipes-core/busybox/busybox-1.=
20.2/Move-several-applets-to-different-install-dir.patch
> new file mode 100644
> index 0000000..2ec57cd
> --- /dev/null
> +++ b/meta/recipes-core/busybox/busybox-1.20.2/Move-several-applets-to-=
different-install-dir.patch
> @@ -0,0 +1,174 @@
> +Move several applets to different install dir:
> +
> +Upstream-Status: Backport
> +dac8e79a190fcfedb9c9054034a521e84c7bec72
> +
> +Moved to [/usr]/sbin:
> +addgroup, adduser, delgroup, deluser,
> +arping, chat, ether-wake, fdformat, ifplugd,
> +ip, ipaddr, iplink, iproute, iprule, iptunnel,
> +killall5, readahead, rtcwake, tftpd, add-shell, remove-shell, powertop.
> +
> +Moved to /bin for /usr/bin: kbd_mode.
> +
> +Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
> +---
> + include/applets.src.h         |   40 ++++++++++++++++++++------------=
--------
> + loginutils/add-remove-shell.c |    4 ++--
> + procps/powertop.c             |    2 +-
> + 3 files changed, 23 insertions(+), 23 deletions(-)
> +
> +diff --git a/include/applets.src.h b/include/applets.src.h
> +index 02b995b..867b19e 100644
> +--- a/include/applets.src.h
> ++++ b/include/applets.src.h
> +@@ -70,12 +70,12 @@ INSERT
> + IF_TEST(APPLET_NOFORK([,  test, BB_DIR_USR_BIN, BB_SUID_DROP, test))
> + IF_TEST(APPLET_NOFORK([[, test, BB_DIR_USR_BIN, BB_SUID_DROP, test))
> + IF_ACPID(APPLET(acpid, BB_DIR_SBIN, BB_SUID_DROP))
> +-IF_ADDGROUP(APPLET(addgroup, BB_DIR_BIN, BB_SUID_DROP))
> +-IF_ADDUSER(APPLET(adduser, BB_DIR_BIN, BB_SUID_DROP))
> ++IF_ADDGROUP(APPLET(addgroup, BB_DIR_USR_SBIN, BB_SUID_DROP))
> ++IF_ADDUSER(APPLET(adduser, BB_DIR_USR_SBIN, BB_SUID_DROP))
> + IF_ADJTIMEX(APPLET(adjtimex, BB_DIR_SBIN, BB_SUID_DROP))
> + IF_AR(APPLET(ar, BB_DIR_USR_BIN, BB_SUID_DROP))
> + IF_ARP(APPLET(arp, BB_DIR_SBIN, BB_SUID_DROP))
> +-IF_ARPING(APPLET(arping, BB_DIR_USR_BIN, BB_SUID_DROP))
> ++IF_ARPING(APPLET(arping, BB_DIR_USR_SBIN, BB_SUID_DROP))
> + IF_AWK(APPLET_NOEXEC(awk, awk, BB_DIR_USR_BIN, BB_SUID_DROP, awk))
> + IF_BASENAME(APPLET_NOFORK(basename, basename, BB_DIR_USR_BIN, BB_SUID=
_DROP, basename))
> + IF_BBCONFIG(APPLET(bbconfig, BB_DIR_BIN, BB_SUID_DROP))
> +@@ -86,7 +86,7 @@ IF_BZIP2(APPLET(bzip2, BB_DIR_USR_BIN, BB_SUID_DROP)=
)
> + IF_CAL(APPLET(cal, BB_DIR_USR_BIN, BB_SUID_DROP))
> + IF_CAT(APPLET_NOFORK(cat, cat, BB_DIR_BIN, BB_SUID_DROP, cat))
> + IF_CATV(APPLET(catv, BB_DIR_BIN, BB_SUID_DROP))
> +-IF_CHAT(APPLET(chat, BB_DIR_USR_BIN, BB_SUID_DROP))
> ++IF_CHAT(APPLET(chat, BB_DIR_USR_SBIN, BB_SUID_DROP))
> + IF_CHATTR(APPLET(chattr, BB_DIR_BIN, BB_SUID_DROP))
> + IF_CHCON(APPLET(chcon, BB_DIR_USR_BIN, BB_SUID_DROP))
> + IF_CHGRP(APPLET_NOEXEC(chgrp, chgrp, BB_DIR_BIN, BB_SUID_DROP, chgrp)=
)
> +@@ -111,8 +111,8 @@ IF_CUT(APPLET_NOEXEC(cut, cut, BB_DIR_USR_BIN, BB_=
SUID_DROP, cut))
> + IF_DC(APPLET(dc, BB_DIR_USR_BIN, BB_SUID_DROP))
> + IF_DD(APPLET_NOEXEC(dd, dd, BB_DIR_BIN, BB_SUID_DROP, dd))
> + IF_DEALLOCVT(APPLET(deallocvt, BB_DIR_USR_BIN, BB_SUID_DROP))
> +-IF_DELGROUP(APPLET_ODDNAME(delgroup, deluser, BB_DIR_BIN, BB_SUID_DRO=
P, delgroup))
> +-IF_DELUSER(APPLET(deluser, BB_DIR_BIN, BB_SUID_DROP))
> ++IF_DELGROUP(APPLET_ODDNAME(delgroup, deluser, BB_DIR_USR_SBIN, BB_SUI=
D_DROP, delgroup))
> ++IF_DELUSER(APPLET(deluser, BB_DIR_USR_SBIN, BB_SUID_DROP))
> + IF_DEVFSD(APPLET(devfsd, BB_DIR_SBIN, BB_SUID_DROP))
> + IF_DEVMEM(APPLET(devmem, BB_DIR_SBIN, BB_SUID_DROP))
> + IF_DF(APPLET(df, BB_DIR_BIN, BB_SUID_DROP))
> +@@ -136,7 +136,7 @@ IF_EJECT(APPLET(eject, BB_DIR_USR_BIN, BB_SUID_DRO=
P))
> + IF_ENV(APPLET_NOEXEC(env, env, BB_DIR_USR_BIN, BB_SUID_DROP, env))
> + IF_ENVDIR(APPLET_ODDNAME(envdir, chpst, BB_DIR_USR_BIN, BB_SUID_DROP,=
 envdir))
> + IF_ENVUIDGID(APPLET_ODDNAME(envuidgid, chpst, BB_DIR_USR_BIN, BB_SUID=
_DROP, envuidgid))
> +-IF_ETHER_WAKE(APPLET_ODDNAME(ether-wake, ether_wake, BB_DIR_USR_BIN, =
BB_SUID_DROP, ether_wake))
> ++IF_ETHER_WAKE(APPLET_ODDNAME(ether-wake, ether_wake, BB_DIR_USR_SBIN,=
 BB_SUID_DROP, ether_wake))
> + IF_EXPAND(APPLET(expand, BB_DIR_USR_BIN, BB_SUID_DROP))
> + IF_EXPR(APPLET(expr, BB_DIR_USR_BIN, BB_SUID_DROP))
> + IF_FAKEIDENTD(APPLET(fakeidentd, BB_DIR_USR_SBIN, BB_SUID_DROP))
> +@@ -144,7 +144,7 @@ IF_FALSE(APPLET_NOFORK(false, false, BB_DIR_BIN, B=
B_SUID_DROP, false))
> + IF_FBSET(APPLET(fbset, BB_DIR_USR_SBIN, BB_SUID_DROP))
> + IF_FBSPLASH(APPLET(fbsplash, BB_DIR_SBIN, BB_SUID_DROP))
> + IF_FDFLUSH(APPLET_ODDNAME(fdflush, freeramdisk, BB_DIR_BIN, BB_SUID_D=
ROP, fdflush))
> +-IF_FDFORMAT(APPLET(fdformat, BB_DIR_USR_BIN, BB_SUID_DROP))
> ++IF_FDFORMAT(APPLET(fdformat, BB_DIR_USR_SBIN, BB_SUID_DROP))
> + IF_FDISK(APPLET(fdisk, BB_DIR_SBIN, BB_SUID_DROP))
> + IF_FGCONSOLE(APPLET(fgconsole, BB_DIR_USR_BIN, BB_SUID_DROP))
> + /* Benefits from suid root: better access to /dev/BLOCKDEVs: */
> +@@ -182,7 +182,7 @@ IF_HWCLOCK(APPLET(hwclock, BB_DIR_SBIN, BB_SUID_DR=
OP))
> + IF_IFCONFIG(APPLET(ifconfig, BB_DIR_SBIN, BB_SUID_DROP))
> + IF_IFUPDOWN(APPLET_ODDNAME(ifdown, ifupdown, BB_DIR_SBIN, BB_SUID_DRO=
P, ifdown))
> + IF_IFENSLAVE(APPLET(ifenslave, BB_DIR_SBIN, BB_SUID_DROP))
> +-IF_IFPLUGD(APPLET(ifplugd, BB_DIR_USR_BIN, BB_SUID_DROP))
> ++IF_IFPLUGD(APPLET(ifplugd, BB_DIR_USR_SBIN, BB_SUID_DROP))
> + IF_IFUPDOWN(APPLET_ODDNAME(ifup, ifupdown, BB_DIR_SBIN, BB_SUID_DROP,=
 ifup))
> + IF_INETD(APPLET(inetd, BB_DIR_USR_SBIN, BB_SUID_DROP))
> + IF_INOTIFYD(APPLET(inotifyd, BB_DIR_SBIN, BB_SUID_DROP))
> +@@ -193,20 +193,20 @@ IF_IONICE(APPLET(ionice, BB_DIR_BIN, BB_SUID_DRO=
P))
> +  || ENABLE_FEATURE_IP_LINK \
> +  || ENABLE_FEATURE_IP_TUNNEL \
> +  || ENABLE_FEATURE_IP_RULE
> +-IF_IP(APPLET(ip, BB_DIR_BIN, BB_SUID_DROP))
> ++IF_IP(APPLET(ip, BB_DIR_SBIN, BB_SUID_DROP))
> + #endif
> +-IF_IPADDR(APPLET(ipaddr, BB_DIR_BIN, BB_SUID_DROP))
> ++IF_IPADDR(APPLET(ipaddr, BB_DIR_SBIN, BB_SUID_DROP))
> + IF_IPCALC(APPLET(ipcalc, BB_DIR_BIN, BB_SUID_DROP))
> + IF_IPCRM(APPLET(ipcrm, BB_DIR_USR_BIN, BB_SUID_DROP))
> + IF_IPCS(APPLET(ipcs, BB_DIR_USR_BIN, BB_SUID_DROP))
> +-IF_IPLINK(APPLET(iplink, BB_DIR_BIN, BB_SUID_DROP))
> +-IF_IPROUTE(APPLET(iproute, BB_DIR_BIN, BB_SUID_DROP))
> +-IF_IPRULE(APPLET(iprule, BB_DIR_BIN, BB_SUID_DROP))
> +-IF_IPTUNNEL(APPLET(iptunnel, BB_DIR_BIN, BB_SUID_DROP))
> +-IF_KBD_MODE(APPLET(kbd_mode, BB_DIR_USR_BIN, BB_SUID_DROP))
> ++IF_IPLINK(APPLET(iplink, BB_DIR_SBIN, BB_SUID_DROP))
> ++IF_IPROUTE(APPLET(iproute, BB_DIR_SBIN, BB_SUID_DROP))
> ++IF_IPRULE(APPLET(iprule, BB_DIR_SBIN, BB_SUID_DROP))
> ++IF_IPTUNNEL(APPLET(iptunnel, BB_DIR_SBIN, BB_SUID_DROP))
> ++IF_KBD_MODE(APPLET(kbd_mode, BB_DIR_BIN, BB_SUID_DROP))
> + IF_KILL(APPLET(kill, BB_DIR_BIN, BB_SUID_DROP))
> + IF_KILLALL(APPLET_ODDNAME(killall, kill, BB_DIR_USR_BIN, BB_SUID_DROP=
, killall))
> +-IF_KILLALL5(APPLET_ODDNAME(killall5, kill, BB_DIR_USR_BIN, BB_SUID_DR=
OP, killall5))
> ++IF_KILLALL5(APPLET_ODDNAME(killall5, kill, BB_DIR_USR_SBIN, BB_SUID_D=
ROP, killall5))
> + IF_KLOGD(APPLET(klogd, BB_DIR_SBIN, BB_SUID_DROP))
> + IF_LAST(APPLET(last, BB_DIR_USR_BIN, BB_SUID_DROP))
> + //IF_LENGTH(APPLET_NOFORK(length, length, BB_DIR_USR_BIN, BB_SUID_DRO=
P, length))
> +@@ -288,7 +288,7 @@ IF_PWD(APPLET_NOFORK(pwd, pwd, BB_DIR_BIN, BB_SUID=
_DROP, pwd))
> + IF_RAIDAUTORUN(APPLET(raidautorun, BB_DIR_SBIN, BB_SUID_DROP))
> + IF_RDATE(APPLET(rdate, BB_DIR_USR_SBIN, BB_SUID_DROP))
> + IF_RDEV(APPLET(rdev, BB_DIR_USR_SBIN, BB_SUID_DROP))
> +-IF_READAHEAD(APPLET(readahead, BB_DIR_USR_BIN, BB_SUID_DROP))
> ++IF_READAHEAD(APPLET(readahead, BB_DIR_USR_SBIN, BB_SUID_DROP))
> + IF_READLINK(APPLET(readlink, BB_DIR_USR_BIN, BB_SUID_DROP))
> + IF_READPROFILE(APPLET(readprofile, BB_DIR_USR_SBIN, BB_SUID_DROP))
> + IF_REALPATH(APPLET(realpath, BB_DIR_USR_BIN, BB_SUID_DROP))
> +@@ -303,7 +303,7 @@ IF_RMDIR(APPLET_NOFORK(rmdir, rmdir, BB_DIR_BIN, B=
B_SUID_DROP, rmdir))
> + IF_ROUTE(APPLET(route, BB_DIR_SBIN, BB_SUID_DROP))
> + IF_RPM(APPLET(rpm, BB_DIR_BIN, BB_SUID_DROP))
> + IF_RPM2CPIO(APPLET(rpm2cpio, BB_DIR_USR_BIN, BB_SUID_DROP))
> +-IF_RTCWAKE(APPLET(rtcwake, BB_DIR_USR_BIN, BB_SUID_DROP))
> ++IF_RTCWAKE(APPLET(rtcwake, BB_DIR_USR_SBIN, BB_SUID_DROP))
> + IF_RUN_PARTS(APPLET_ODDNAME(run-parts, run_parts, BB_DIR_USR_BIN, BB_=
SUID_DROP, run_parts))
> + IF_RUNCON(APPLET(runcon, BB_DIR_USR_BIN, BB_SUID_DROP))
> + IF_RUNLEVEL(APPLET(runlevel, BB_DIR_SBIN, BB_SUID_DROP))
> +@@ -365,7 +365,7 @@ IF_TELNETD(APPLET(telnetd, BB_DIR_USR_SBIN, BB_SUI=
D_DROP))
> + IF_TEST(APPLET_NOFORK(test, test, BB_DIR_USR_BIN, BB_SUID_DROP, test)=
)
> + #if ENABLE_FEATURE_TFTP_GET || ENABLE_FEATURE_TFTP_PUT
> + IF_TFTP(APPLET(tftp, BB_DIR_USR_BIN, BB_SUID_DROP))
> +-IF_TFTPD(APPLET(tftpd, BB_DIR_USR_BIN, BB_SUID_DROP))
> ++IF_TFTPD(APPLET(tftpd, BB_DIR_USR_SBIN, BB_SUID_DROP))
> + #endif
> + IF_TIME(APPLET(time, BB_DIR_USR_BIN, BB_SUID_DROP))
> + IF_TIMEOUT(APPLET(timeout, BB_DIR_USR_BIN, BB_SUID_DROP))
> +diff --git a/loginutils/add-remove-shell.c b/loginutils/add-remove-she=
ll.c
> +index 9a14544..e492b6e 100644
> +--- a/loginutils/add-remove-shell.c
> ++++ b/loginutils/add-remove-shell.c
> +@@ -8,8 +8,8 @@
> +  * for details.
> +  */
> +
> +-//applet:IF_ADD_SHELL(   APPLET_ODDNAME(add-shell   , add_remove_shel=
l, BB_DIR_USR_BIN, BB_SUID_DROP, add_shell   ))
> +-//applet:IF_REMOVE_SHELL(APPLET_ODDNAME(remove-shell, add_remove_shel=
l, BB_DIR_USR_BIN, BB_SUID_DROP, remove_shell))
> ++//applet:IF_ADD_SHELL(   APPLET_ODDNAME(add-shell   , add_remove_shel=
l, BB_DIR_USR_SBIN, BB_SUID_DROP, add_shell   ))
> ++//applet:IF_REMOVE_SHELL(APPLET_ODDNAME(remove-shell, add_remove_shel=
l, BB_DIR_USR_SBIN, BB_SUID_DROP, remove_shell))
> +
> + //kbuild:lib-$(CONFIG_ADD_SHELL)    +=3D add-remove-shell.o
> + //kbuild:lib-$(CONFIG_REMOVE_SHELL) +=3D add-remove-shell.o
> +diff --git a/procps/powertop.c b/procps/powertop.c
> +index 008cdfc..b4c45ed 100644
> +--- a/procps/powertop.c
> ++++ b/procps/powertop.c
> +@@ -9,7 +9,7 @@
> +  * Licensed under GPLv2, see file LICENSE in this source tree.
> +  */
> +
> +-//applet:IF_POWERTOP(APPLET(powertop, BB_DIR_BIN, BB_SUID_DROP))
> ++//applet:IF_POWERTOP(APPLET(powertop, BB_DIR_USR_SBIN, BB_SUID_DROP))
> +
> + //kbuild:lib-$(CONFIG_POWERTOP) +=3D powertop.o
> +
> +--
> +1.7.5.4
> +
> diff --git a/meta/recipes-core/busybox/busybox_1.20.2.bb b/meta/recipes=
-core/busybox/busybox_1.20.2.bb
> index 3e628d2..69c3dc8 100644
> --- a/meta/recipes-core/busybox/busybox_1.20.2.bb
> +++ b/meta/recipes-core/busybox/busybox_1.20.2.bb
> @@ -1,5 +1,5 @@
>   require busybox.inc
> -PR =3D "r4"
> +PR =3D "r5"
>
>   SRC_URI =3D "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;n=
ame=3Dtarball \
>              file://B921600.patch \
> @@ -27,7 +27,8 @@ SRC_URI =3D "http://www.busybox.net/downloads/busybox=
-${PV}.tar.bz2;name=3Dtarball \
>              file://busybox-mkfs-minix-tests_bigendian.patch \
>              file://fix-for-spurious-testsuite-failure.patch \
>              file://busybox-1.20.2-kernel_ver.patch \
> -           file://stat-usr-bin.patch"
> +           file://stat-usr-bin.patch \
> +           file://Move-several-applets-to-different-install-dir.patch"
>
>   SRC_URI[tarball.md5sum] =3D "e025414bc6cd79579cc7a32a45d3ae1c"
>   SRC_URI[tarball.sha256sum] =3D "eb13ff01dae5618ead2ef6f92ba879e9e0390=
f9583bd545d8789d27cf39b6882"
> diff --git a/meta/recipes-core/kbd/kbd_1.15.2.bb b/meta/recipes-core/kb=
d/kbd_1.15.2.bb
> index 79ea468..c1d89af 100644
> --- a/meta/recipes-core/kbd/kbd_1.15.2.bb
> +++ b/meta/recipes-core/kbd/kbd_1.15.2.bb
> @@ -10,7 +10,7 @@ RREPLACES_${PN} =3D "console-tools"
>   RPROVIDES_${PN} =3D "console-tools"
>   RCONFLICTS_${PN} =3D "console-tools"
>
> -PR =3D "r4"
> +PR =3D "r5"
>
>   SRC_URI=3D"${KERNELORG_MIRROR}/linux/utils/kbd/kbd-1.15.2.tar.bz2"
>   SRC_URI[md5sum] =3D "e850eb91e4d3b94b194efe8e953204c5"
> @@ -25,6 +25,11 @@ FILES_${PN}-unimaps =3D "${datadir}/unimaps"
>
>   inherit update-alternatives
>
> +do_install_append() {
> +    install -d ${D}${base_bindir}/
> +    mv ${D}/${bindir}/kbd_mode ${D}/${base_bindir}/
> +}
>
> -ALTERNATIVE_${PN} =3D "chvt deallocvt fgconsole openvt"
> +ALTERNATIVE_${PN} =3D "chvt deallocvt fgconsole openvt kbd_mode"
>   ALTERNATIVE_PRIORITY =3D "100"
> +ALTERNATIVE_LINK_NAME[kbd_mode] =3D "${base_bindir}/kbd_mode"
> diff --git a/meta/recipes-core/tinylogin/tinylogin_1.4.bb b/meta/recipe=
s-core/tinylogin/tinylogin_1.4.bb
> index aaed92a..b270f31 100644
> --- a/meta/recipes-core/tinylogin/tinylogin_1.4.bb
> +++ b/meta/recipes-core/tinylogin/tinylogin_1.4.bb
> @@ -7,7 +7,7 @@ and groups on an embedded system."
>   HOMEPAGE =3D "http://tinylogin.busybox.net/"
>   LICENSE =3D "GPLv2"
>   LIC_FILES_CHKSUM=3D"file://LICENSE;md5=3Df1060fa3a366f098b5b1d8c2077b=
a269"
> -PR =3D "r9"
> +PR =3D "r10"
>
>   inherit update-alternatives
>
> @@ -33,11 +33,25 @@ do_install () {
>   	install -d ${D}${base_bindir}
>   	install -m 4755 tinylogin ${D}${base_bindir}/tinylogin
>   	for i in `cat tinylogin.links`; do
> -		mkdir -p ${D}/`dirname $i`
> -		ln -sf /bin/tinylogin ${D}$i
> +		case `basename $i` in
> +			adduser|addgroup|deluser|delgroup)
> +				;;
> +			*)
> +				mkdir -p ${D}/`dirname $i`
> +				ln -sf /bin/tinylogin ${D}$i
> +				;;
> +		esac
>   	done
>   }
>
> -ALTERNATIVE_${PN} =3D "getty"
> +ALTERNATIVE_${PN} =3D "getty adduser addgroup deluser delgroup"
> +
>   ALTERNATIVE_LINK_NAME[getty] =3D "${base_sbindir}/getty"
>   ALTERNATIVE_PRIORITY =3D "80"
> +
> +ALTERNATIVE_TARGET =3D "${base_bindir}/tinylogin"
> +
> +ALTERNATIVE_LINK_NAME[adduser] =3D "${sbindir}/adduser"
> +ALTERNATIVE_LINK_NAME[addgroup] =3D "${sbindir}/addgroup"
> +ALTERNATIVE_LINK_NAME[deluser] =3D "${sbindir}/deluser"
> +ALTERNATIVE_LINK_NAME[delgroup] =3D "${sbindir}/delgroup"
> diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes=
-core/util-linux/util-linux.inc
> index f2f9a04..147c65f 100644
> --- a/meta/recipes-core/util-linux/util-linux.inc
> +++ b/meta/recipes-core/util-linux/util-linux.inc
> @@ -133,7 +133,7 @@ ALTERNATIVE_PRIORITY =3D "100"
>
>   ALTERNATIVE_${PN}  =3D "dmesg kill more reset mkswap blockdev pivot_r=
oot"
>   ALTERNATIVE_${PN} +=3D "mkfs.minix hexdump last logger mesg renice wa=
ll"
> -ALTERNATIVE_${PN} +=3D "setsid chrt flock hwclock"
> +ALTERNATIVE_${PN} +=3D "setsid chrt flock hwclock rtcwake fdformat"
>
>   ALTERNATIVE_LINK_NAME[dmesg] =3D "${base_bindir}/dmesg"
>   ALTERNATIVE_LINK_NAME[kill] =3D "${base_bindir}/kill"
> @@ -145,6 +145,9 @@ ALTERNATIVE_LINK_NAME[blockdev] =3D "${base_sbindir=
}/blockdev"
>   ALTERNATIVE_LINK_NAME[pivot_root] =3D "${base_sbindir}/pivot_root"
>   ALTERNATIVE_LINK_NAME[mkfs.minix] =3D "${base_sbindir}/mkfs.minix"
>
> +ALTERNATIVE_LINK_NAME[fdformat] =3D "${sbindir}/fdformat"
> +ALTERNATIVE_LINK_NAME[rtcwake] =3D "${sbindir}/rtcwake"
> +
>   # There seems to be problem, atleast on nslu2, with these, untill the=
y are
>   # fixed the busybox ones have higher priority
>   ALTERNATIVE_PRIORITY[hwclock] =3D "10"
> diff --git a/meta/recipes-core/util-linux/util-linux_2.21.2.bb b/meta/r=
ecipes-core/util-linux/util-linux_2.21.2.bb
> index 24bed27..ebf1bd2 100644
> --- a/meta/recipes-core/util-linux/util-linux_2.21.2.bb
> +++ b/meta/recipes-core/util-linux/util-linux_2.21.2.bb
> @@ -1,5 +1,5 @@
>   MAJOR_VERSION =3D "2.21"
> -PR =3D "r6"
> +PR =3D "r7"
>   require util-linux.inc
>
>   # note that `lscpu' is under GPLv3+
>

--=20
Best Reagrds,
Roy | RongQing Li




