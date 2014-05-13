Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (unknown [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9FBDC660B5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 May 2014 07:46:07 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s4D7k8rr029352
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 May 2014 00:46:08 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.187) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.169.1; Tue, 13 May 2014 00:46:07 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 13 May 2014 15:46:27 +0800
Message-ID: <aa7f7a7416cf76cec6e5f02f7741126417fb76d7.1399967110.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1399967110.git.Qi.Chen@windriver.com>
References: <cover.1399967110.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] openssh: fix for CVE-2014-2653
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
X-List-Received-Date: Tue, 13 May 2014 07:46:07 -0000
Content-Type: text/plain

The verify_host_key function in sshconnect.c in the client in OpenSSH 6.6 and
earlier allows remote servers to trigger the skipping of SSHFP DNS RR checking
by presenting an unacceptable HostCertificate.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../openssh/openssh/openssh-CVE-2014-2653.patch    |  114 ++++++++++++++++++++
 meta/recipes-connectivity/openssh/openssh_6.5p1.bb |    3 +-
 2 files changed, 116 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/openssh-CVE-2014-2653.patch

diff --git a/meta/recipes-connectivity/openssh/openssh/openssh-CVE-2014-2653.patch b/meta/recipes-connectivity/openssh/openssh/openssh-CVE-2014-2653.patch
new file mode 100644
index 0000000..674d186
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/openssh-CVE-2014-2653.patch
@@ -0,0 +1,114 @@
+Upstream-Status: Backport
+
+This CVE could be removed if openssh is upgrade to 6.6 or higher.
+Below are some details.
+
+Attempt SSHFP lookup even if server presents a certificate
+
+Reference:
+https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=742513
+
+If an ssh server presents a certificate to the client, then the client
+does not check the DNS for SSHFP records. This means that a malicious
+server can essentially disable DNS-host-key-checking, which means the
+client will fall back to asking the user (who will just say "yes" to
+the fingerprint, sadly).
+
+This patch means that the ssh client will, if necessary, extract the
+server key from the proffered certificate, and attempt to verify it
+against the DNS. The patch was written by Mark Wooding
+<mdw@distorted.org.uk>. I modified it to add one debug2 call, reviewed
+it, and tested it.
+
+Signed-off-by: Matthew Vernon <matthew@debian.org>
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+--- a/sshconnect.c
++++ b/sshconnect.c
+@@ -1210,36 +1210,63 @@ fail:
+ 	return -1;
+ }
+ 
++static int
++check_host_key_sshfp(char *host, struct sockaddr *hostaddr, Key *host_key)
++{
++	int rc = -1;
++	int flags = 0;
++	Key *raw_key = NULL;
++
++	if (!options.verify_host_key_dns)
++		goto done;
++
++	/* XXX certs are not yet supported for DNS; try looking the raw key
++	 * up in the DNS anyway.
++	 */
++	if (key_is_cert(host_key)) {
++		debug2("Extracting key from cert for SSHFP lookup");
++		raw_key = key_from_private(host_key);
++		if (key_drop_cert(raw_key))
++			fatal("Couldn't drop certificate");
++		host_key = raw_key;
++	}
++
++	if (verify_host_key_dns(host, hostaddr, host_key, &flags))
++		goto done;
++
++	if (flags & DNS_VERIFY_FOUND) {
++
++		if (options.verify_host_key_dns == 1 &&
++				flags & DNS_VERIFY_MATCH &&
++				flags & DNS_VERIFY_SECURE) {
++			rc = 0;
++		} else if (flags & DNS_VERIFY_MATCH) {
++			matching_host_key_dns = 1;
++		} else {
++			warn_changed_key(host_key);
++			error("Update the SSHFP RR in DNS with the new "
++					"host key to get rid of this message.");
++		}
++	}
++
++done:
++	if (raw_key)
++		key_free(raw_key);
++	return rc;
++}
++
+ /* returns 0 if key verifies or -1 if key does NOT verify */
+ int
+ verify_host_key(char *host, struct sockaddr *hostaddr, Key *host_key)
+ {
+-	int flags = 0;
+ 	char *fp;
+ 
+ 	fp = key_fingerprint(host_key, SSH_FP_MD5, SSH_FP_HEX);
+ 	debug("Server host key: %s %s", key_type(host_key), fp);
+ 	free(fp);
+ 
+-	/* XXX certs are not yet supported for DNS */
+-	if (!key_is_cert(host_key) && options.verify_host_key_dns &&
+-	    verify_host_key_dns(host, hostaddr, host_key, &flags) == 0) {
+-		if (flags & DNS_VERIFY_FOUND) {
+-
+-			if (options.verify_host_key_dns == 1 &&
+-			    flags & DNS_VERIFY_MATCH &&
+-			    flags & DNS_VERIFY_SECURE)
+-				return 0;
+-
+-			if (flags & DNS_VERIFY_MATCH) {
+-				matching_host_key_dns = 1;
+-			} else {
+-				warn_changed_key(host_key);
+-				error("Update the SSHFP RR in DNS with the new "
+-				    "host key to get rid of this message.");
+-			}
+-		}
+-	}
++	if (check_host_key_sshfp(host, hostaddr, host_key) == 0)
++		return 0;
+ 
+ 	return check_host_key(host, hostaddr, options.port, host_key, RDRW,
+ 	    options.user_hostfiles, options.num_user_hostfiles,
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-connectivity/openssh/openssh_6.5p1.bb b/meta/recipes-connectivity/openssh/openssh_6.5p1.bb
index 230f38a..795e085 100644
--- a/meta/recipes-connectivity/openssh/openssh_6.5p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_6.5p1.bb
@@ -30,7 +30,8 @@ SRC_URI = "ftp://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar.
            file://volatiles.99_sshd \
            file://add-test-support-for-busybox.patch \
            file://run-ptest \
-           file://openssh-CVE-2014-2532.patch"
+           file://openssh-CVE-2014-2532.patch \
+           file://openssh-CVE-2014-2653.patch"
 
 PAM_SRC_URI = "file://sshd"
 
-- 
1.7.9.5


