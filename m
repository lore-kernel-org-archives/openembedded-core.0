Return-Path: <Noor_Ahsan@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id BA10073217
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jul 2015 12:32:14 +0000 (UTC)
Received: from nat-ies.mentorg.com ([192.94.31.2]
	helo=SVR-IES-FEM-05.mgc.mentorg.com)
	by relay1.mentorg.com with esmtp 
	id 1ZJhZl-0006AH-OA from Noor_Ahsan@mentor.com ;
	Mon, 27 Jul 2015 05:32:14 -0700
Received: from EU-MBX-01.mgc.mentorg.com ([169.254.1.194]) by
	SVR-IES-FEM-05.mgc.mentorg.com ([137.202.0.112]) with mapi id
	14.03.0224.002; Mon, 27 Jul 2015 13:32:12 +0100
From: "Ahsan, Noor" <Noor_Ahsan@mentor.com>
To: Chen Qi <Qi.Chen@windriver.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH V3 3/4] sysklogd: add systemd support
Thread-Index: AQHP2shf7i8wg5Ey70GS+iGkST32KZ3xGpMg
Date: Mon, 27 Jul 2015 12:32:12 +0000
Message-ID: <365E1805BC95084CBE82381A0B86999401095B33A5@EU-MBX-01.mgc.mentorg.com>
References: <cover.1411721793.git.Qi.Chen@windriver.com>
	<318b7aafa24c267330b5e4d02f5cd66099cd0b5f.1411721794.git.Qi.Chen@windriver.com>
In-Reply-To: <318b7aafa24c267330b5e4d02f5cd66099cd0b5f.1411721794.git.Qi.Chen@windriver.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [137.202.0.76]
MIME-Version: 1.0
Subject: Re: [PATCH V3 3/4] sysklogd: add systemd support
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
X-List-Received-Date: Mon, 27 Jul 2015 12:32:14 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello Chen,

May I know why your patch series is still pending merge?

Noor

-----Original Message-----
From: openembedded-core-bounces@lists.openembedded.org [mailto:openembedded=
-core-bounces@lists.openembedded.org] On Behalf Of Chen Qi
Sent: Sunday, September 28, 2014 8:00 AM
To: openembedded-core@lists.openembedded.org
Subject: [OE-core] [PATCH V3 3/4] sysklogd: add systemd support

This patch includes the following changes:
1. Add socket activation support for sysklogd 2. Add systemd service file 3=
. Use ALTERNATIVE mechanism in OE to manage the syslog service 4. Set ALTER=
NATIVE_PRIORITY to "100" regardless of whether 'systemd'
   is in DISTRO_FEATURES or not because sysklogd now has systemd support.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../files/0001-syslogd.c-add-systemd-support.patch | 246 +++++++++++++++++=
++++
 meta/recipes-extended/sysklogd/files/klogd.service |   9 +
 .../sysklogd/files/sysklogd.service                |  14 ++
 meta/recipes-extended/sysklogd/sysklogd.inc        |  38 +++-
 4 files changed, 300 insertions(+), 7 deletions(-)  create mode 100644 met=
a/recipes-extended/sysklogd/files/0001-syslogd.c-add-systemd-support.patch
 create mode 100644 meta/recipes-extended/sysklogd/files/klogd.service
 create mode 100644 meta/recipes-extended/sysklogd/files/sysklogd.service

diff --git a/meta/recipes-extended/sysklogd/files/0001-syslogd.c-add-system=
d-support.patch b/meta/recipes-extended/sysklogd/files/0001-syslogd.c-add-s=
ystemd-support.patch
new file mode 100644
index 0000000..1706906
--- /dev/null
+++ b/meta/recipes-extended/sysklogd/files/0001-syslogd.c-add-systemd-su
+++ pport.patch
@@ -0,0 +1,246 @@
+Upstream-Status: Pending
+
+Subject: syslogd.c: add systemd support
+
+1. add socket activation support
+2. unlink /dev/log if it's not provided by systemd
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ syslogd.c | 157=20
+++++++++++++++++++++++++++++++++++++++++++++++++++++++--------
+ 1 file changed, 137 insertions(+), 20 deletions(-)
+
+diff --git a/syslogd.c b/syslogd.c
+index acfd8f1..81e45e6 100644
+--- a/syslogd.c
++++ b/syslogd.c
+@@ -602,6 +602,9 @@ static char sccsid[] =3D "@(#)syslogd.c	5.27 (Berkeley=
) 10/10/88";
+ #define _PATH_LOG	"/dev/log"
+ #endif
+=20
++/* systemd support */
++#define SD_LISTEN_FDS_START 3
++
+ char	*ConfFile =3D _PATH_LOGCONF;
+ char	*PidFile =3D _PATH_LOGPID;
+ char	ctty[] =3D _PATH_CONSOLE;
+@@ -612,6 +615,7 @@ int inetm =3D 0;
+ static int debugging_on =3D 0;
+ static int nlogs =3D -1;
+ static int restart =3D 0;
++static int socket_from_systemd =3D 0;
+=20
+ #define MAXFUNIX	20
+=20
+@@ -822,6 +826,8 @@ int decode(char *name, struct code *codetab); =20
+static void dprintf(char *, ...);  static void allocate_log(void); =20
+void sighup_handler();
++/* systemd support */
++int sd_listen_fds(void);
+=20
+ #ifdef SYSLOG_UNIXAF
+ static int create_unix_socket(const char *path); @@ -963,9 +969,37 @@=20
+int main(argc, argv)
+ 				 */
+ 				exit(1);
+ 			}
++
++			/* We keep stdout and stderr open in case we have to emit something */
++			close(0);
++			i =3D 3;
++
++			/* Trying to pass on LISTEN_PID with appropriate value */
++			const char *e;
++			unsigned long l;
++			char buf[24] =3D { '\0' };
++			int sd_fds;
++
++			if ( (e =3D getenv("LISTEN_PID")) ) {
++				errno =3D 0;
++				l =3D strtoul(e, NULL, 10);
++				if (errno =3D=3D 0) {
++					if (getppid() =3D=3D (pid_t)l) {
++						snprintf(buf,sizeof(buf), "%d", (int)getpid());
++						setenv("LISTEN_PID", buf, 1);
++					}=20
++				}
++			}
++
+ 			signal (SIGTERM, SIG_DFL);
+ 			num_fds =3D getdtablesize();
+-			for (i=3D 0; i < num_fds; i++)
++
++			/* close all further fds except of the fds provided by systemd */
++			sd_fds =3D sd_listen_fds();
++			if (sd_fds > 0) {
++				i =3D SD_LISTEN_FDS_START + sd_fds;
++			}
++			for ( ; i < num_fds; i++)
+ 				(void) close(i);
+ 			untty();
+ 		}
+@@ -1248,28 +1282,37 @@ static int create_unix_socket(const char *path) =20
+{
+ 	struct sockaddr_un sunx;
+ 	int fd;
++	int n;
+ 	char line[MAXLINE +1];
+=20
+-	if (path[0] =3D=3D '\0')
++	n =3D sd_listen_fds();
++	if (n > 1) {
+ 		return -1;
+-
+-	(void) unlink(path);
+-
+-	memset(&sunx, 0, sizeof(sunx));
+-	sunx.sun_family =3D AF_UNIX;
+-	(void) strncpy(sunx.sun_path, path, sizeof(sunx.sun_path));
+-	fd =3D socket(AF_UNIX, SOCK_DGRAM, 0);
+-	if (fd < 0 || bind(fd, (struct sockaddr *) &sunx,
+-			   sizeof(sunx.sun_family)+strlen(sunx.sun_path)) < 0 ||
+-	    chmod(path, 0666) < 0) {
+-		(void) snprintf(line, sizeof(line), "cannot create %s", path);
+-		logerror(line);
+-		dprintf("cannot create %s (%d).\n", path, errno);
+-		close(fd);
++	} else if (n =3D=3D 1) {
++		socket_from_systemd =3D 1;
++		fd =3D SD_LISTEN_FDS_START + 0;
++	} else {
++		if (path[0] =3D=3D '\0')
++			return -1;
++
++		(void) unlink(path);
++
++		memset(&sunx, 0, sizeof(sunx));
++		sunx.sun_family =3D AF_UNIX;
++		(void) strncpy(sunx.sun_path, path, sizeof(sunx.sun_path));
++		fd =3D socket(AF_UNIX, SOCK_DGRAM, 0);
++		if (fd < 0 || bind(fd, (struct sockaddr *) &sunx,
++				   sizeof(sunx.sun_family)+strlen(sunx.sun_path)) < 0 ||
++		    chmod(path, 0666) < 0) {
++			(void) snprintf(line, sizeof(line), "cannot create %s", path);
++			logerror(line);
++			dprintf("cannot create %s (%d).\n", path, errno);
++			close(fd);
+ #ifndef SYSV
+-		die(0);
++			die(0);
+ #endif
+-		return -1;
++			return -1;
++		}
+ 	}
+ 	return fd;
+ }
+@@ -1998,12 +2041,27 @@ void wallmsg(f, iov)
+ 	/* open the user login file */
+ 	setutent();
+=20
+-
+ 	/*
+ 	 * Might as well fork instead of using nonblocking I/O
+ 	 * and doing notty().
+ 	 */
+ 	if (fork() =3D=3D 0) {
++		/* Trying to pass on the LISTEN_PID with appropriate value */
++		const char *e;
++		unsigned long l;
++		char buf[24] =3D { '\0' };
++
++		if ( (e =3D getenv("LISTEN_PID")) ) {
++			errno =3D 0;
++			l =3D strtoul(e, NULL, 10);
++			if (errno =3D=3D 0) {
++				if (getppid() =3D=3D (pid_t)l) {
++					snprintf(buf,sizeof(buf), "%d", (int)getpid());
++					setenv("LISTEN_PID", buf, 1);
++				}
++			}=20
++		}
++
+ 		(void) signal(SIGTERM, SIG_DFL);
+ 		(void) alarm(0);
+ #ifndef SYSV
+@@ -2254,9 +2312,15 @@ void die(sig)
+ 	if (InetInuse) close(inetm);
+=20
+ 	/* Clean-up files. */
+-        for (i =3D 0; i < nfunix; i++)
++	if (socket_from_systemd) {
++		i =3D 1;
++	} else {
++		i =3D 0;
++	}
++	for (; i < nfunix; i++)
+ 		if (funixn[i] && funix[i] !=3D -1)
+ 			(void)unlink(funixn[i]);
++
+ #ifndef TESTING
+ 	(void) remove_pid(PidFile);
+ #endif
+@@ -2896,6 +2960,59 @@ void sighup_handler()
+ 	return;
+ }
+=20
++int sd_listen_fds() {
++	int r, fd;
++	const char *e;
++	unsigned long l;
++
++	e =3D getenv("LISTEN_PID");
++	if (!e) {
++		return 0;
++	}
++
++	errno =3D 0;
++	l =3D strtoul(e, NULL, 10);
++
++	if (errno !=3D 0) {
++		return -errno;
++	}
++
++	if (getpid() !=3D (pid_t)l) {
++		return 0;
++	}
++
++	e =3D getenv("LISTEN_FDS");
++	if (!e) {
++		return 0;
++	}
++
++	errno =3D 0;
++	l =3D strtoul(e, NULL, 10);
++
++	if (errno !=3D 0) {
++		return -errno;
++	}
++
++	for (fd =3D SD_LISTEN_FDS_START; fd < SD_LISTEN_FDS_START + (int)l; fd++=
) {
++		int flags;
++
++		flags =3D fcntl(fd, F_GETFD);
++		if (flags < 0) {
++			return -errno;
++		}
++
++		if (flags & FD_CLOEXEC)
++			continue;
++
++		if (fcntl(fd, F_SETFD, flags | FD_CLOEXEC) < 0) {
++			return -errno;
++		}
++	}
++
++	r =3D (int)l;
++
++	return r;
++}
+ /*
+  * Local variables:
+  *  c-indent-level: 8
+--
+1.9.1
+
diff --git a/meta/recipes-extended/sysklogd/files/klogd.service b/meta/reci=
pes-extended/sysklogd/files/klogd.service
new file mode 100644
index 0000000..cf97e9c
--- /dev/null
+++ b/meta/recipes-extended/sysklogd/files/klogd.service
@@ -0,0 +1,9 @@
+[Unit]
+Description=3Dsysklogd Kernel Logging Service
+
+[Service]
+Type=3Dforking
+EnvironmentFile=3D-@SYSCONFDIR@/default/klogd
+PIDFile=3D/var/run/klogd.pid
+ExecStart=3D@BASE_SBINDIR@/klogd $KLOGD
+StandardOutput=3Dnull
diff --git a/meta/recipes-extended/sysklogd/files/sysklogd.service b/meta/r=
ecipes-extended/sysklogd/files/sysklogd.service
new file mode 100644
index 0000000..7806320
--- /dev/null
+++ b/meta/recipes-extended/sysklogd/files/sysklogd.service
@@ -0,0 +1,14 @@
+[Unit]
+Description=3DSystem Logging Service
+Wants=3Dklogd.service
+Requires=3Dsyslog.socket
+
+[Service]
+Type=3Dforking
+EnvironmentFile=3D-@SYSCONFDIR@/default/sysklogd
+PIDFile=3D/var/run/syslogd.pid
+ExecStart=3D@BASE_SBINDIR@/syslogd $SYSLOGD StandardOutput=3Dnull
+
+[Install]
+Also=3Dklogd.service
diff --git a/meta/recipes-extended/sysklogd/sysklogd.inc b/meta/recipes-ext=
ended/sysklogd/sysklogd.inc
index bcf8aa7..294eb4f 100644
--- a/meta/recipes-extended/sysklogd/sysklogd.inc
+++ b/meta/recipes-extended/sysklogd/sysklogd.inc
@@ -11,12 +11,15 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D8ca43cbc842c=
2336e835926c2166c28b \
                     file://klogd.c;beginline=3D2;endline=3D19;md5=3D7e87ed=
0ae6142de079bce738c10c899d \
                    "
=20
-inherit update-rc.d update-alternatives
+inherit update-rc.d systemd update-alternatives
=20
 SRC_URI =3D "http://www.infodrom.org/projects/sysklogd/download/sysklogd-$=
{PV}.tar.gz \
            file://no-strip-install.patch \
+           file://0001-syslogd.c-add-systemd-support.patch \
            file://sysklogd \
            file://syslog.conf \
+           file://sysklogd.service \
+           file://klogd.service \
            "
=20
 SRC_URI_append_e500v2 =3D " file://no-vectorization.patch"
@@ -24,6 +27,8 @@ SRC_URI_append_e500v2 =3D " file://no-vectorization.patch=
"
 INITSCRIPT_NAME =3D "syslog"
 CONFFILES_${PN} =3D "${sysconfdir}/syslog.conf.${BPN}"
=20
+SYSTEMD_SERVICE_${PN} =3D "sysklogd.service"
+
 CFLAGS_append =3D " -DSYSV"
=20
 do_install () {
@@ -35,20 +40,39 @@ do_install () {
 	install -d ${D}${sysconfdir}
 	install -m 644 ${WORKDIR}/syslog.conf ${D}${sysconfdir}/syslog.conf
 	install -d ${D}${sysconfdir}/init.d
-	install -m 755 ${WORKDIR}/sysklogd ${D}${sysconfdir}/init.d/syslog
+	install -m 755 ${WORKDIR}/sysklogd=20
+${D}${sysconfdir}/init.d/syslog.${BPN}
+
+        install -d ${D}${systemd_unitdir}/system
+        install -m 0644 ${WORKDIR}/sysklogd.service ${D}${systemd_unitdir}=
/system
+        install -m 0644 ${WORKDIR}/klogd.service ${D}${systemd_unitdir}/sy=
stem
+	sed -i -e 's,@BASE_SBINDIR@,${base_sbindir},g' \
+		-e 's,@SYSCONFDIR@,${sysconfdir},g' \
+		${D}${systemd_unitdir}/system/*.service
 }
=20
-# sysklogd package has no internal systemd support, so we weigh busybox's =
-# sysklogd utility over it in case of systemd -ALTERNATIVE_PRIORITY =3D "$=
{@bb.utils.contains('DISTRO_FEATURES','systemd','10','100',d)}"
+ALTERNATIVE_PRIORITY =3D '100'
=20
-ALTERNATIVE_${PN} =3D "syslogd klogd syslog-init syslog-conf"
+ALTERNATIVE_${PN} =3D "syslogd klogd syslog-conf"
=20
 ALTERNATIVE_LINK_NAME[syslogd] =3D "${base_sbindir}/syslogd"
 ALTERNATIVE_LINK_NAME[klogd] =3D "${base_sbindir}/klogd"
-ALTERNATIVE_LINK_NAME[syslog-init] =3D "${sysconfdir}/init.d/syslog"
 ALTERNATIVE_LINK_NAME[syslog-conf] =3D "${sysconfdir}/syslog.conf"
=20
+python () {
+    if bb.utils.contains('DISTRO_FEATURES', 'sysvinit', True, False, d):
+        pn =3D d.getVar('PN', True)
+        sysconfdir =3D d.getVar('sysconfdir', True)
+        d.appendVar('ALTERNATIVE_%s' % (pn), ' syslog-init')
+        d.setVarFlag('ALTERNATIVE_LINK_NAME', 'syslog-init', '%s/init.d/sy=
slog' % (sysconfdir))
+        d.setVarFlag('ALTERNATIVE_TARGET', 'syslog-init',=20
+'%s/init.d/syslog.%s' % (d.getVar('sysconfdir', True), d.getVar('BPN',=20
+True)))
+
+    if bb.utils.contains('DISTRO_FEATURES', 'systemd', True, False, d):
+        pn =3D d.getVar('PN', True)
+        d.appendVar('ALTERNATIVE_%s' % (pn), ' syslog-service')
+        d.setVarFlag('ALTERNATIVE_LINK_NAME', 'syslog-service', '%s/system=
d/system/syslog.service' % (d.getVar('sysconfdir', True)))
+        d.setVarFlag('ALTERNATIVE_TARGET', 'syslog-service',=20
+'%s/system/sysklogd.service' % (d.getVar('systemd_unitdir', True))) }
+
 pkg_prerm_${PN} () {
 	if test "x$D" =3D "x"; then
 	if test "$1" =3D "upgrade" -o "$1" =3D "remove"; then
--
1.9.1

--
_______________________________________________
Openembedded-core mailing list
Openembedded-core@lists.openembedded.org
http://lists.openembedded.org/mailman/listinfo/openembedded-core

