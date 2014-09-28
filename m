Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8E5507160A
	for <openembedded-core@lists.openembedded.org>;
	Sun, 28 Sep 2014 02:59:34 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s8S2xZQA001232
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 27 Sep 2014 19:59:36 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.187) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Sat, 27 Sep 2014 19:59:35 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 28 Sep 2014 11:00:19 +0800
Message-ID: <318b7aafa24c267330b5e4d02f5cd66099cd0b5f.1411721794.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1411721793.git.Qi.Chen@windriver.com>
References: <cover.1411721793.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH V3 3/4] sysklogd: add systemd support
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
X-List-Received-Date: Sun, 28 Sep 2014 02:59:34 -0000
Content-Type: text/plain

This patch includes the following changes:
1. Add socket activation support for sysklogd
2. Add systemd service file
3. Use ALTERNATIVE mechanism in OE to manage the syslog service
4. Set ALTERNATIVE_PRIORITY to "100" regardless of whether 'systemd'
   is in DISTRO_FEATURES or not because sysklogd now has systemd support.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../files/0001-syslogd.c-add-systemd-support.patch | 246 +++++++++++++++++++++
 meta/recipes-extended/sysklogd/files/klogd.service |   9 +
 .../sysklogd/files/sysklogd.service                |  14 ++
 meta/recipes-extended/sysklogd/sysklogd.inc        |  38 +++-
 4 files changed, 300 insertions(+), 7 deletions(-)
 create mode 100644 meta/recipes-extended/sysklogd/files/0001-syslogd.c-add-systemd-support.patch
 create mode 100644 meta/recipes-extended/sysklogd/files/klogd.service
 create mode 100644 meta/recipes-extended/sysklogd/files/sysklogd.service

diff --git a/meta/recipes-extended/sysklogd/files/0001-syslogd.c-add-systemd-support.patch b/meta/recipes-extended/sysklogd/files/0001-syslogd.c-add-systemd-support.patch
new file mode 100644
index 0000000..1706906
--- /dev/null
+++ b/meta/recipes-extended/sysklogd/files/0001-syslogd.c-add-systemd-support.patch
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
+ syslogd.c | 157 ++++++++++++++++++++++++++++++++++++++++++++++++++++++--------
+ 1 file changed, 137 insertions(+), 20 deletions(-)
+
+diff --git a/syslogd.c b/syslogd.c
+index acfd8f1..81e45e6 100644
+--- a/syslogd.c
++++ b/syslogd.c
+@@ -602,6 +602,9 @@ static char sccsid[] = "@(#)syslogd.c	5.27 (Berkeley) 10/10/88";
+ #define _PATH_LOG	"/dev/log"
+ #endif
+ 
++/* systemd support */
++#define SD_LISTEN_FDS_START 3
++
+ char	*ConfFile = _PATH_LOGCONF;
+ char	*PidFile = _PATH_LOGPID;
+ char	ctty[] = _PATH_CONSOLE;
+@@ -612,6 +615,7 @@ int inetm = 0;
+ static int debugging_on = 0;
+ static int nlogs = -1;
+ static int restart = 0;
++static int socket_from_systemd = 0;
+ 
+ #define MAXFUNIX	20
+ 
+@@ -822,6 +826,8 @@ int decode(char *name, struct code *codetab);
+ static void dprintf(char *, ...);
+ static void allocate_log(void);
+ void sighup_handler();
++/* systemd support */
++int sd_listen_fds(void);
+ 
+ #ifdef SYSLOG_UNIXAF
+ static int create_unix_socket(const char *path);
+@@ -963,9 +969,37 @@ int main(argc, argv)
+ 				 */
+ 				exit(1);
+ 			}
++
++			/* We keep stdout and stderr open in case we have to emit something */
++			close(0);
++			i = 3;
++
++			/* Trying to pass on LISTEN_PID with appropriate value */
++			const char *e;
++			unsigned long l;
++			char buf[24] = { '\0' };
++			int sd_fds;
++
++			if ( (e = getenv("LISTEN_PID")) ) {
++				errno = 0;
++				l = strtoul(e, NULL, 10);
++				if (errno == 0) {
++					if (getppid() == (pid_t)l) {
++						snprintf(buf,sizeof(buf), "%d", (int)getpid());
++						setenv("LISTEN_PID", buf, 1);
++					} 
++				}
++			}
++
+ 			signal (SIGTERM, SIG_DFL);
+ 			num_fds = getdtablesize();
+-			for (i= 0; i < num_fds; i++)
++
++			/* close all further fds except of the fds provided by systemd */
++			sd_fds = sd_listen_fds();
++			if (sd_fds > 0) {
++				i = SD_LISTEN_FDS_START + sd_fds;
++			}
++			for ( ; i < num_fds; i++)
+ 				(void) close(i);
+ 			untty();
+ 		}
+@@ -1248,28 +1282,37 @@ static int create_unix_socket(const char *path)
+ {
+ 	struct sockaddr_un sunx;
+ 	int fd;
++	int n;
+ 	char line[MAXLINE +1];
+ 
+-	if (path[0] == '\0')
++	n = sd_listen_fds();
++	if (n > 1) {
+ 		return -1;
+-
+-	(void) unlink(path);
+-
+-	memset(&sunx, 0, sizeof(sunx));
+-	sunx.sun_family = AF_UNIX;
+-	(void) strncpy(sunx.sun_path, path, sizeof(sunx.sun_path));
+-	fd = socket(AF_UNIX, SOCK_DGRAM, 0);
+-	if (fd < 0 || bind(fd, (struct sockaddr *) &sunx,
+-			   sizeof(sunx.sun_family)+strlen(sunx.sun_path)) < 0 ||
+-	    chmod(path, 0666) < 0) {
+-		(void) snprintf(line, sizeof(line), "cannot create %s", path);
+-		logerror(line);
+-		dprintf("cannot create %s (%d).\n", path, errno);
+-		close(fd);
++	} else if (n == 1) {
++		socket_from_systemd = 1;
++		fd = SD_LISTEN_FDS_START + 0;
++	} else {
++		if (path[0] == '\0')
++			return -1;
++
++		(void) unlink(path);
++
++		memset(&sunx, 0, sizeof(sunx));
++		sunx.sun_family = AF_UNIX;
++		(void) strncpy(sunx.sun_path, path, sizeof(sunx.sun_path));
++		fd = socket(AF_UNIX, SOCK_DGRAM, 0);
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
+ 
+-
+ 	/*
+ 	 * Might as well fork instead of using nonblocking I/O
+ 	 * and doing notty().
+ 	 */
+ 	if (fork() == 0) {
++		/* Trying to pass on the LISTEN_PID with appropriate value */
++		const char *e;
++		unsigned long l;
++		char buf[24] = { '\0' };
++
++		if ( (e = getenv("LISTEN_PID")) ) {
++			errno = 0;
++			l = strtoul(e, NULL, 10);
++			if (errno == 0) {
++				if (getppid() == (pid_t)l) {
++					snprintf(buf,sizeof(buf), "%d", (int)getpid());
++					setenv("LISTEN_PID", buf, 1);
++				}
++			} 
++		}
++
+ 		(void) signal(SIGTERM, SIG_DFL);
+ 		(void) alarm(0);
+ #ifndef SYSV
+@@ -2254,9 +2312,15 @@ void die(sig)
+ 	if (InetInuse) close(inetm);
+ 
+ 	/* Clean-up files. */
+-        for (i = 0; i < nfunix; i++)
++	if (socket_from_systemd) {
++		i = 1;
++	} else {
++		i = 0;
++	}
++	for (; i < nfunix; i++)
+ 		if (funixn[i] && funix[i] != -1)
+ 			(void)unlink(funixn[i]);
++
+ #ifndef TESTING
+ 	(void) remove_pid(PidFile);
+ #endif
+@@ -2896,6 +2960,59 @@ void sighup_handler()
+ 	return;
+ }
+ 
++int sd_listen_fds() {
++	int r, fd;
++	const char *e;
++	unsigned long l;
++
++	e = getenv("LISTEN_PID");
++	if (!e) {
++		return 0;
++	}
++
++	errno = 0;
++	l = strtoul(e, NULL, 10);
++
++	if (errno != 0) {
++		return -errno;
++	}
++
++	if (getpid() != (pid_t)l) {
++		return 0;
++	}
++
++	e = getenv("LISTEN_FDS");
++	if (!e) {
++		return 0;
++	}
++
++	errno = 0;
++	l = strtoul(e, NULL, 10);
++
++	if (errno != 0) {
++		return -errno;
++	}
++
++	for (fd = SD_LISTEN_FDS_START; fd < SD_LISTEN_FDS_START + (int)l; fd++) {
++		int flags;
++
++		flags = fcntl(fd, F_GETFD);
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
++	r = (int)l;
++
++	return r;
++}
+ /*
+  * Local variables:
+  *  c-indent-level: 8
+-- 
+1.9.1
+
diff --git a/meta/recipes-extended/sysklogd/files/klogd.service b/meta/recipes-extended/sysklogd/files/klogd.service
new file mode 100644
index 0000000..cf97e9c
--- /dev/null
+++ b/meta/recipes-extended/sysklogd/files/klogd.service
@@ -0,0 +1,9 @@
+[Unit]
+Description=sysklogd Kernel Logging Service
+
+[Service]
+Type=forking
+EnvironmentFile=-@SYSCONFDIR@/default/klogd
+PIDFile=/var/run/klogd.pid
+ExecStart=@BASE_SBINDIR@/klogd $KLOGD
+StandardOutput=null
diff --git a/meta/recipes-extended/sysklogd/files/sysklogd.service b/meta/recipes-extended/sysklogd/files/sysklogd.service
new file mode 100644
index 0000000..7806320
--- /dev/null
+++ b/meta/recipes-extended/sysklogd/files/sysklogd.service
@@ -0,0 +1,14 @@
+[Unit]
+Description=System Logging Service
+Wants=klogd.service
+Requires=syslog.socket
+
+[Service]
+Type=forking
+EnvironmentFile=-@SYSCONFDIR@/default/sysklogd
+PIDFile=/var/run/syslogd.pid
+ExecStart=@BASE_SBINDIR@/syslogd $SYSLOGD
+StandardOutput=null
+
+[Install]
+Also=klogd.service
diff --git a/meta/recipes-extended/sysklogd/sysklogd.inc b/meta/recipes-extended/sysklogd/sysklogd.inc
index bcf8aa7..294eb4f 100644
--- a/meta/recipes-extended/sysklogd/sysklogd.inc
+++ b/meta/recipes-extended/sysklogd/sysklogd.inc
@@ -11,12 +11,15 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b \
                     file://klogd.c;beginline=2;endline=19;md5=7e87ed0ae6142de079bce738c10c899d \
                    "
 
-inherit update-rc.d update-alternatives
+inherit update-rc.d systemd update-alternatives
 
 SRC_URI = "http://www.infodrom.org/projects/sysklogd/download/sysklogd-${PV}.tar.gz \
            file://no-strip-install.patch \
+           file://0001-syslogd.c-add-systemd-support.patch \
            file://sysklogd \
            file://syslog.conf \
+           file://sysklogd.service \
+           file://klogd.service \
            "
 
 SRC_URI_append_e500v2 = " file://no-vectorization.patch"
@@ -24,6 +27,8 @@ SRC_URI_append_e500v2 = " file://no-vectorization.patch"
 INITSCRIPT_NAME = "syslog"
 CONFFILES_${PN} = "${sysconfdir}/syslog.conf.${BPN}"
 
+SYSTEMD_SERVICE_${PN} = "sysklogd.service"
+
 CFLAGS_append = " -DSYSV"
 
 do_install () {
@@ -35,20 +40,39 @@ do_install () {
 	install -d ${D}${sysconfdir}
 	install -m 644 ${WORKDIR}/syslog.conf ${D}${sysconfdir}/syslog.conf
 	install -d ${D}${sysconfdir}/init.d
-	install -m 755 ${WORKDIR}/sysklogd ${D}${sysconfdir}/init.d/syslog
+	install -m 755 ${WORKDIR}/sysklogd ${D}${sysconfdir}/init.d/syslog.${BPN}
+
+        install -d ${D}${systemd_unitdir}/system
+        install -m 0644 ${WORKDIR}/sysklogd.service ${D}${systemd_unitdir}/system
+        install -m 0644 ${WORKDIR}/klogd.service ${D}${systemd_unitdir}/system
+	sed -i -e 's,@BASE_SBINDIR@,${base_sbindir},g' \
+		-e 's,@SYSCONFDIR@,${sysconfdir},g' \
+		${D}${systemd_unitdir}/system/*.service
 }
 
-# sysklogd package has no internal systemd support, so we weigh busybox's
-# sysklogd utility over it in case of systemd
-ALTERNATIVE_PRIORITY = "${@bb.utils.contains('DISTRO_FEATURES','systemd','10','100',d)}"
+ALTERNATIVE_PRIORITY = '100'
 
-ALTERNATIVE_${PN} = "syslogd klogd syslog-init syslog-conf"
+ALTERNATIVE_${PN} = "syslogd klogd syslog-conf"
 
 ALTERNATIVE_LINK_NAME[syslogd] = "${base_sbindir}/syslogd"
 ALTERNATIVE_LINK_NAME[klogd] = "${base_sbindir}/klogd"
-ALTERNATIVE_LINK_NAME[syslog-init] = "${sysconfdir}/init.d/syslog"
 ALTERNATIVE_LINK_NAME[syslog-conf] = "${sysconfdir}/syslog.conf"
 
+python () {
+    if bb.utils.contains('DISTRO_FEATURES', 'sysvinit', True, False, d):
+        pn = d.getVar('PN', True)
+        sysconfdir = d.getVar('sysconfdir', True)
+        d.appendVar('ALTERNATIVE_%s' % (pn), ' syslog-init')
+        d.setVarFlag('ALTERNATIVE_LINK_NAME', 'syslog-init', '%s/init.d/syslog' % (sysconfdir))
+        d.setVarFlag('ALTERNATIVE_TARGET', 'syslog-init', '%s/init.d/syslog.%s' % (d.getVar('sysconfdir', True), d.getVar('BPN', True)))
+
+    if bb.utils.contains('DISTRO_FEATURES', 'systemd', True, False, d):
+        pn = d.getVar('PN', True)
+        d.appendVar('ALTERNATIVE_%s' % (pn), ' syslog-service')
+        d.setVarFlag('ALTERNATIVE_LINK_NAME', 'syslog-service', '%s/systemd/system/syslog.service' % (d.getVar('sysconfdir', True)))
+        d.setVarFlag('ALTERNATIVE_TARGET', 'syslog-service', '%s/system/sysklogd.service' % (d.getVar('systemd_unitdir', True)))
+}
+
 pkg_prerm_${PN} () {
 	if test "x$D" = "x"; then
 	if test "$1" = "upgrade" -o "$1" = "remove"; then
-- 
1.9.1


