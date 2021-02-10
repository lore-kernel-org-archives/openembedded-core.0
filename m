Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by mx.groups.io with SMTP id smtpd.web09.5034.1612961449989319010
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Feb 2021 04:50:50 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.88, mailfrom: chee.yang.lee@intel.com)
IronPort-SDR: B0J7Jo7vY11XDFglspkw4M9bERjAXIqyun/QP9pMn5vbV1WC0+Wi1Vr2Sb1wEhsSLazSGR3ZsQ
 o1/S9WU/uY7Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9890"; a="201170141"
X-IronPort-AV: E=Sophos;i="5.81,168,1610438400"; 
   d="scan'208";a="201170141"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2021 04:50:49 -0800
IronPort-SDR: EroZ13jMXfh7JchWDOGizWFgLnEkG085gkIb8z9LBo8DdsTMr7OrSfPsCQOB14G3oQy9dwFfve
 FY/lzr/0fE9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,168,1610438400"; 
   d="scan'208";a="421037414"
Received: from unknown (HELO guest1-ubuntu1804.png.intel.com) ([10.221.183.51])
  by fmsmga002.fm.intel.com with ESMTP; 10 Feb 2021 04:50:48 -0800
From: "Lee Chee Yang" <chee.yang.lee@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH][gatesgarth 1/2] openssh: fix CVE-2020-14145
Date: Wed, 10 Feb 2021 20:50:46 +0800
Message-Id: <20210210125047.42657-1-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.17.1

From: Lee Chee Yang <chee.yang.lee@intel.com>

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
---
 .../openssh/openssh/CVE-2020-14145.patch      | 90 +++++++++++++++++++
 .../openssh/openssh_8.3p1.bb                  |  1 +
 2 files changed, 91 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2020-14145.patch

diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2020-14145.patch b/meta/recipes-connectivity/openssh/openssh/CVE-2020-14145.patch
new file mode 100644
index 0000000000..0046ee1a51
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/CVE-2020-14145.patch
@@ -0,0 +1,90 @@
+From b3855ff053f5078ec3d3c653cdaedefaa5fc362d Mon Sep 17 00:00:00 2001
+From: "djm@openbsd.org" <djm@openbsd.org>
+Date: Fri, 18 Sep 2020 05:23:03 +0000
+Subject: [PATCH] upstream: tweak the client hostkey preference ordering
+ algorithm to
+
+prefer the default ordering if the user has a key that matches the
+best-preference default algorithm.
+
+feedback and ok markus@
+
+OpenBSD-Commit-ID: a92dd7d7520ddd95c0a16786a7519e6d0167d35f
+
+Upstream-Status: Backport
+[https://github.com/openssh/openssh-portable/commit/b3855ff053f5078ec3d3c653cdaedefaa5fc362d]
+CVE: CVE-2020-14145
+Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
+
+---
+ sshconnect2.c | 41 ++++++++++++++++++++++++++++++++++++++---
+ 1 file changed, 37 insertions(+), 2 deletions(-)
+
+diff --git a/sshconnect2.c b/sshconnect2.c
+index 347e348c60..f64aae66af 100644
+--- a/sshconnect2.c
++++ b/sshconnect2.c
+@@ -102,12 +102,25 @@ verify_host_key_callback(struct sshkey *hostkey, struct ssh *ssh)
+ 	return 0;
+ }
+ 
++/* Returns the first item from a comma-separated algorithm list */
++static char *
++first_alg(const char *algs)
++{
++	char *ret, *cp;
++
++	ret = xstrdup(algs);
++	if ((cp = strchr(ret, ',')) != NULL)
++		*cp = '\0';
++	return ret;
++}
++
+ static char *
+ order_hostkeyalgs(char *host, struct sockaddr *hostaddr, u_short port)
+ {
+-	char *oavail, *avail, *first, *last, *alg, *hostname, *ret;
++	char *oavail = NULL, *avail = NULL, *first = NULL, *last = NULL;
++	char *alg = NULL, *hostname = NULL, *ret = NULL, *best = NULL;
+ 	size_t maxlen;
+-	struct hostkeys *hostkeys;
++	struct hostkeys *hostkeys = NULL;
+ 	int ktype;
+ 	u_int i;
+ 
+@@ -119,6 +132,26 @@ order_hostkeyalgs(char *host, struct sockaddr *hostaddr, u_short port)
+ 	for (i = 0; i < options.num_system_hostfiles; i++)
+ 		load_hostkeys(hostkeys, hostname, options.system_hostfiles[i]);
+ 
++	/*
++	 * If a plain public key exists that matches the type of the best
++	 * preference HostkeyAlgorithms, then use the whole list as is.
++	 * Note that we ignore whether the best preference algorithm is a
++	 * certificate type, as sshconnect.c will downgrade certs to
++	 * plain keys if necessary.
++	 */
++	best = first_alg(options.hostkeyalgorithms);
++	if (lookup_key_in_hostkeys_by_type(hostkeys,
++	    sshkey_type_plain(sshkey_type_from_name(best)), NULL)) {
++		debug3("%s: have matching best-preference key type %s, "
++		    "using HostkeyAlgorithms verbatim", __func__, best);
++		ret = xstrdup(options.hostkeyalgorithms);
++		goto out;
++	}
++
++	/*
++	 * Otherwise, prefer the host key algorithms that match known keys
++	 * while keeping the ordering of HostkeyAlgorithms as much as possible.
++	 */
+ 	oavail = avail = xstrdup(options.hostkeyalgorithms);
+ 	maxlen = strlen(avail) + 1;
+ 	first = xmalloc(maxlen);
+@@ -159,6 +192,8 @@ order_hostkeyalgs(char *host, struct sockaddr *hostaddr, u_short port)
+ 	if (*first != '\0')
+ 		debug3("%s: prefer hostkeyalgs: %s", __func__, first);
+ 
++ out:
++	free(best);
+ 	free(first);
+ 	free(last);
+ 	free(hostname);
diff --git a/meta/recipes-connectivity/openssh/openssh_8.3p1.bb b/meta/recipes-connectivity/openssh/openssh_8.3p1.bb
index 2aa1df20bd..70174c5197 100644
--- a/meta/recipes-connectivity/openssh/openssh_8.3p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_8.3p1.bb
@@ -24,6 +24,7 @@ SRC_URI = "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar
            file://fix-potential-signed-overflow-in-pointer-arithmatic.patch \
            file://sshd_check_keys \
            file://add-test-support-for-busybox.patch \
+           file://CVE-2020-14145.patch \
            "
 SRC_URI[sha256sum] = "f2befbe0472fe7eb75d23340eb17531cb6b3aac24075e2066b41f814e12387b2"
 
-- 
2.17.1

