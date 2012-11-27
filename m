Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Li.Wang@windriver.com>) id 1TdGQM-0006KS-RE
	for openembedded-core@lists.openembedded.org;
	Tue, 27 Nov 2012 09:21:48 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id qAR5rqca025733
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Nov 2012 21:53:52 -0800 (PST)
Received: from pek-lpgbuild4.wrs.com (128.224.153.32) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.318.4; Mon, 26 Nov 2012 21:53:51 -0800
From: Li Wang <li.wang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 27 Nov 2012 13:53:47 +0800
Message-ID: <1353995627-635-1-git-send-email-li.wang@windriver.com>
X-Mailer: git-send-email 1.7.11
MIME-Version: 1.0
Subject: [PATCH] openssh: CVE-2011-4327
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
X-List-Received-Date: Tue, 27 Nov 2012 08:21:48 -0000
Content-Type: text/plain

A security flaw was found in the way ssh-keysign,
a ssh helper program for host based authentication,
attempted to retrieve enough entropy information on configurations that
lacked a built-in entropy pool in OpenSSL (a ssh-rand-helper program would
be executed to retrieve the entropy from the system environment).
A local attacker could use this flaw to obtain unauthorized access to host keys
via ptrace(2) process trace attached to the 'ssh-rand-helper' program.

https://bugzilla.redhat.com/show_bug.cgi?id=CVE-2011-4327
http://www.openssh.com/txt/portable-keysign-rand-helper.adv

[YOCTO #3493]

Signed-off-by: Li Wang <li.wang@windriver.com>
---
 .../openssh-6.0p1/openssh-CVE-2011-4327.patch      | 27 ++++++++++++++++++++++
 meta/recipes-connectivity/openssh/openssh_6.0p1.bb |  3 ++-
 2 files changed, 29 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-connectivity/openssh/openssh-6.0p1/openssh-CVE-2011-4327.patch

diff --git a/meta/recipes-connectivity/openssh/openssh-6.0p1/openssh-CVE-2011-4327.patch b/meta/recipes-connectivity/openssh/openssh-6.0p1/openssh-CVE-2011-4327.patch
new file mode 100644
index 0000000..8489edc
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh-6.0p1/openssh-CVE-2011-4327.patch
@@ -0,0 +1,27 @@
+openssh-CVE-2011-4327
+
+A security flaw was found in the way ssh-keysign,
+a ssh helper program for host based authentication,
+attempted to retrieve enough entropy information on configurations that
+lacked a built-in entropy pool in OpenSSL (a ssh-rand-helper program would
+be executed to retrieve the entropy from the system environment).
+A local attacker could use this flaw to obtain unauthorized access to host keys
+via ptrace(2) process trace attached to the 'ssh-rand-helper' program.
+
+https://bugzilla.redhat.com/show_bug.cgi?id=CVE-2011-4327
+http://www.openssh.com/txt/portable-keysign-rand-helper.adv
+
+Signed-off-by: Li Wang <li.wang@windriver.com>
+--- a/ssh-keysign.c
++++ b/ssh-keysign.c
+@@ -170,6 +170,10 @@
+ 	key_fd[i++] = open(_PATH_HOST_DSA_KEY_FILE, O_RDONLY);
+ 	key_fd[i++] = open(_PATH_HOST_ECDSA_KEY_FILE, O_RDONLY);
+ 	key_fd[i++] = open(_PATH_HOST_RSA_KEY_FILE, O_RDONLY);
++	if (fcntl(key_fd[0], F_SETFD, FD_CLOEXEC) != 0 ||
++	    fcntl(key_fd[1], F_SETFD, FD_CLOEXEC) != 0 ||
++	    fcntl(key_fd[2], F_SETFD, FD_CLOEXEC) != 0)
++		fatal("fcntl failed");
+ 
+ 	original_real_uid = getuid();	/* XXX readconf.c needs this */
+ 	if ((pw = getpwuid(original_real_uid)) == NULL)
diff --git a/meta/recipes-connectivity/openssh/openssh_6.0p1.bb b/meta/recipes-connectivity/openssh/openssh_6.0p1.bb
index 31202d4..df77040 100644
--- a/meta/recipes-connectivity/openssh/openssh_6.0p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_6.0p1.bb
@@ -7,7 +7,7 @@ SECTION = "console/network"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENCE;md5=e326045657e842541d3f35aada442507"
 
-PR = "r3"
+PR = "r4"
 
 DEPENDS = "zlib openssl"
 DEPENDS += "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
@@ -23,6 +23,7 @@ SRC_URI = "ftp://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar.
            file://sshd_config \
            file://ssh_config \
            file://init \
+           file://openssh-CVE-2011-4327.patch \
            ${@base_contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)}"
 
 PAM_SRC_URI = "file://sshd"
-- 
1.7.11



