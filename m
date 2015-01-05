Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id BA31965D27
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Jan 2015 11:27:50 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP; 05 Jan 2015 03:23:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,698,1413270000"; d="scan'208";a="646388900"
Received: from kregan-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.17.116])
	by fmsmga001.fm.intel.com with ESMTP; 05 Jan 2015 03:27:50 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  5 Jan 2015 11:27:44 +0000
Message-Id: <3600fe71ea5d77f4f92e6f8b460f8d56298e2dfb.1420457243.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1420457243.git.paul.eggleton@linux.intel.com>
References: <cover.1420457243.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1420457243.git.paul.eggleton@linux.intel.com>
References: <cover.1420457243.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 2/3] openssh: upgrade to 6.7p1
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
X-List-Received-Date: Mon, 05 Jan 2015 11:27:50 -0000

* Drop two CVE patches already handled upstream.
* Drop nostrip.patch which no longer applies and use the existing
  --disable-strip configure option instead.
* OpenSSH 6.7+ no longer supports tcp wrappers. We could apply the
  Debian patch to add support back in, but it seems best to follow
  upstream here unless we have a good reason to do otherwise.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../openssh/openssh/nostrip.patch                  |  20 ----
 .../openssh/openssh/openssh-CVE-2011-4327.patch    |  29 ------
 .../openssh/openssh/openssh-CVE-2014-2653.patch    | 114 ---------------------
 .../openssh/{openssh_6.6p1.bb => openssh_6.7p1.bb} |  14 +--
 4 files changed, 5 insertions(+), 172 deletions(-)
 delete mode 100644 meta/recipes-connectivity/openssh/openssh/nostrip.patch
 delete mode 100644 meta/recipes-connectivity/openssh/openssh/openssh-CVE-2011-4327.patch
 delete mode 100644 meta/recipes-connectivity/openssh/openssh/openssh-CVE-2014-2653.patch
 rename meta/recipes-connectivity/openssh/{openssh_6.6p1.bb => openssh_6.7p1.bb} (93%)

diff --git a/meta/recipes-connectivity/openssh/openssh/nostrip.patch b/meta/recipes-connectivity/openssh/openssh/nostrip.patch
deleted file mode 100644
index 33111f5..0000000
--- a/meta/recipes-connectivity/openssh/openssh/nostrip.patch
+++ /dev/null
@@ -1,20 +0,0 @@
-Disable stripping binaries during make install.
-
-Upstream-Status: Inappropriate [configuration]
-
-Build system specific.
-
-Signed-off-by: Scott Garman <scott.a.garman@intel.com>
-
-diff -ur openssh-5.6p1.orig/Makefile.in openssh-5.6p1/Makefile.in
---- openssh-5.6p1.orig/Makefile.in	2010-05-11 23:51:39.000000000 -0700
-+++ openssh-5.6p1/Makefile.in	2010-08-30 16:49:54.000000000 -0700
-@@ -29,7 +29,7 @@
- RAND_HELPER=$(libexecdir)/ssh-rand-helper
- PRIVSEP_PATH=@PRIVSEP_PATH@
- SSH_PRIVSEP_USER=@SSH_PRIVSEP_USER@
--STRIP_OPT=@STRIP_OPT@
-+STRIP_OPT=
- 
- PATHS= -DSSHDIR=\"$(sysconfdir)\" \
- 	-D_PATH_SSH_PROGRAM=\"$(SSH_PROGRAM)\" \
diff --git a/meta/recipes-connectivity/openssh/openssh/openssh-CVE-2011-4327.patch b/meta/recipes-connectivity/openssh/openssh/openssh-CVE-2011-4327.patch
deleted file mode 100644
index 30c11cf..0000000
--- a/meta/recipes-connectivity/openssh/openssh/openssh-CVE-2011-4327.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-openssh-CVE-2011-4327
-
-A security flaw was found in the way ssh-keysign,
-a ssh helper program for host based authentication,
-attempted to retrieve enough entropy information on configurations that
-lacked a built-in entropy pool in OpenSSL (a ssh-rand-helper program would
-be executed to retrieve the entropy from the system environment).
-A local attacker could use this flaw to obtain unauthorized access to host keys
-via ptrace(2) process trace attached to the 'ssh-rand-helper' program.
-
-https://bugzilla.redhat.com/show_bug.cgi?id=CVE-2011-4327
-http://www.openssh.com/txt/portable-keysign-rand-helper.adv
-
-Upstream-Status: Pending
-
-Signed-off-by: Li Wang <li.wang@windriver.com>
---- a/ssh-keysign.c
-+++ b/ssh-keysign.c
-@@ -170,6 +170,10 @@
- 	key_fd[i++] = open(_PATH_HOST_DSA_KEY_FILE, O_RDONLY);
- 	key_fd[i++] = open(_PATH_HOST_ECDSA_KEY_FILE, O_RDONLY);
- 	key_fd[i++] = open(_PATH_HOST_RSA_KEY_FILE, O_RDONLY);
-+	if (fcntl(key_fd[0], F_SETFD, FD_CLOEXEC) != 0 ||
-+	    fcntl(key_fd[1], F_SETFD, FD_CLOEXEC) != 0 ||
-+	    fcntl(key_fd[2], F_SETFD, FD_CLOEXEC) != 0)
-+		fatal("fcntl failed");
- 
- 	original_real_uid = getuid();	/* XXX readconf.c needs this */
- 	if ((pw = getpwuid(original_real_uid)) == NULL)
diff --git a/meta/recipes-connectivity/openssh/openssh/openssh-CVE-2014-2653.patch b/meta/recipes-connectivity/openssh/openssh/openssh-CVE-2014-2653.patch
deleted file mode 100644
index 674d186..0000000
--- a/meta/recipes-connectivity/openssh/openssh/openssh-CVE-2014-2653.patch
+++ /dev/null
@@ -1,114 +0,0 @@
-Upstream-Status: Backport
-
-This CVE could be removed if openssh is upgrade to 6.6 or higher.
-Below are some details.
-
-Attempt SSHFP lookup even if server presents a certificate
-
-Reference:
-https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=742513
-
-If an ssh server presents a certificate to the client, then the client
-does not check the DNS for SSHFP records. This means that a malicious
-server can essentially disable DNS-host-key-checking, which means the
-client will fall back to asking the user (who will just say "yes" to
-the fingerprint, sadly).
-
-This patch means that the ssh client will, if necessary, extract the
-server key from the proffered certificate, and attempt to verify it
-against the DNS. The patch was written by Mark Wooding
-<mdw@distorted.org.uk>. I modified it to add one debug2 call, reviewed
-it, and tested it.
-
-Signed-off-by: Matthew Vernon <matthew@debian.org>
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
----
---- a/sshconnect.c
-+++ b/sshconnect.c
-@@ -1210,36 +1210,63 @@ fail:
- 	return -1;
- }
- 
-+static int
-+check_host_key_sshfp(char *host, struct sockaddr *hostaddr, Key *host_key)
-+{
-+	int rc = -1;
-+	int flags = 0;
-+	Key *raw_key = NULL;
-+
-+	if (!options.verify_host_key_dns)
-+		goto done;
-+
-+	/* XXX certs are not yet supported for DNS; try looking the raw key
-+	 * up in the DNS anyway.
-+	 */
-+	if (key_is_cert(host_key)) {
-+		debug2("Extracting key from cert for SSHFP lookup");
-+		raw_key = key_from_private(host_key);
-+		if (key_drop_cert(raw_key))
-+			fatal("Couldn't drop certificate");
-+		host_key = raw_key;
-+	}
-+
-+	if (verify_host_key_dns(host, hostaddr, host_key, &flags))
-+		goto done;
-+
-+	if (flags & DNS_VERIFY_FOUND) {
-+
-+		if (options.verify_host_key_dns == 1 &&
-+				flags & DNS_VERIFY_MATCH &&
-+				flags & DNS_VERIFY_SECURE) {
-+			rc = 0;
-+		} else if (flags & DNS_VERIFY_MATCH) {
-+			matching_host_key_dns = 1;
-+		} else {
-+			warn_changed_key(host_key);
-+			error("Update the SSHFP RR in DNS with the new "
-+					"host key to get rid of this message.");
-+		}
-+	}
-+
-+done:
-+	if (raw_key)
-+		key_free(raw_key);
-+	return rc;
-+}
-+
- /* returns 0 if key verifies or -1 if key does NOT verify */
- int
- verify_host_key(char *host, struct sockaddr *hostaddr, Key *host_key)
- {
--	int flags = 0;
- 	char *fp;
- 
- 	fp = key_fingerprint(host_key, SSH_FP_MD5, SSH_FP_HEX);
- 	debug("Server host key: %s %s", key_type(host_key), fp);
- 	free(fp);
- 
--	/* XXX certs are not yet supported for DNS */
--	if (!key_is_cert(host_key) && options.verify_host_key_dns &&
--	    verify_host_key_dns(host, hostaddr, host_key, &flags) == 0) {
--		if (flags & DNS_VERIFY_FOUND) {
--
--			if (options.verify_host_key_dns == 1 &&
--			    flags & DNS_VERIFY_MATCH &&
--			    flags & DNS_VERIFY_SECURE)
--				return 0;
--
--			if (flags & DNS_VERIFY_MATCH) {
--				matching_host_key_dns = 1;
--			} else {
--				warn_changed_key(host_key);
--				error("Update the SSHFP RR in DNS with the new "
--				    "host key to get rid of this message.");
--			}
--		}
--	}
-+	if (check_host_key_sshfp(host, hostaddr, host_key) == 0)
-+		return 0;
- 
- 	return check_host_key(host, hostaddr, options.port, host_key, RDRW,
- 	    options.user_hostfiles, options.num_user_hostfiles,
--- 
-1.7.9.5
-
diff --git a/meta/recipes-connectivity/openssh/openssh_6.6p1.bb b/meta/recipes-connectivity/openssh/openssh_6.7p1.bb
similarity index 93%
rename from meta/recipes-connectivity/openssh/openssh_6.6p1.bb
rename to meta/recipes-connectivity/openssh/openssh_6.7p1.bb
index abc302b..19093fc 100644
--- a/meta/recipes-connectivity/openssh/openssh_6.6p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_6.7p1.bb
@@ -11,11 +11,9 @@ DEPENDS = "zlib openssl"
 DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 
 SRC_URI = "ftp://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar.gz \
-           file://nostrip.patch \
            file://sshd_config \
            file://ssh_config \
            file://init \
-           file://openssh-CVE-2011-4327.patch \
            ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)} \
            file://sshd.socket \
            file://sshd@.service \
@@ -23,13 +21,12 @@ SRC_URI = "ftp://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar.
            file://volatiles.99_sshd \
            file://add-test-support-for-busybox.patch \
            file://run-ptest \
-           file://openssh-CVE-2014-2653.patch \
            file://auth2-none.c-avoid-authenticate-empty-passwords-to-m.patch"
 
 PAM_SRC_URI = "file://sshd"
 
-SRC_URI[md5sum] = "3e9800e6bca1fbac0eea4d41baa7f239"
-SRC_URI[sha256sum] = "48c1f0664b4534875038004cc4f3555b8329c2a81c1df48db5c517800de203bb"
+SRC_URI[md5sum] = "3246aa79317b1d23cae783a3bf8275d6"
+SRC_URI[sha256sum] = "b2f8394eae858dabbdef7dac10b99aec00c95462753e80342e530bbb6f725507"
 
 inherit useradd update-rc.d update-alternatives systemd
 
@@ -42,9 +39,6 @@ INITSCRIPT_PARAMS_${PN}-sshd = "defaults 9"
 SYSTEMD_PACKAGES = "${PN}-sshd"
 SYSTEMD_SERVICE_${PN}-sshd = "sshd.socket"
 
-PACKAGECONFIG ??= "tcp-wrappers"
-PACKAGECONFIG[tcp-wrappers] = "--with-tcp-wrappers,,tcp-wrappers"
-
 inherit autotools-brokensep ptest
 
 # LFS support:
@@ -56,7 +50,9 @@ EXTRA_OECONF = "'LOGIN_PROGRAM=${base_bindir}/login' \
                 --without-zlib-version-check \
                 --with-privsep-path=/var/run/sshd \
                 --sysconfdir=${sysconfdir}/ssh \
-                --with-xauth=/usr/bin/xauth"
+                --with-xauth=/usr/bin/xauth \
+                --disable-strip \
+                "
 
 # Since we do not depend on libbsd, we do not want configure to use it
 # just because it finds libutil.h.  But, specifying --disable-libutil
-- 
1.9.3


