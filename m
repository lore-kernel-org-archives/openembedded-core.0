Received: from mga11.intel.com (mga11.intel.com [])
 by mx.groups.io with SMTP id smtpd.web12.36963.1614009640008517381
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Feb 2021 08:00:58 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: yzYgeNmsnM8DyGvtMjy+ZIVu5ALMcFZ8scKjJ3IZdsMrX/uRTGgBha5E18F6LwljsSSTWIOC1h
 nT3Ex8Dw8Frg==
X-IronPort-AV: E=McAfee;i="6000,8403,9903"; a="181049494"
X-IronPort-AV: E=Sophos;i="5.81,197,1610438400"; 
   d="scan'208";a="181049494"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2021 08:00:57 -0800
IronPort-SDR: McfqCt8qpucsRl5xtoXtVvsecpyMcwjs30qcTPhJGGz4/lP6tetw2mdSom5e8x02oWeUsMg6oi
 vp6YRDEC25JQ==
X-IronPort-AV: E=Sophos;i="5.81,197,1610438400"; 
   d="scan'208";a="430301900"
Received: from yrajendx-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.147.39])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2021 08:00:56 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 11/30] openssh: fix CVE-2020-14145
Date: Tue, 23 Feb 2021 00:00:14 +0800
Message-Id: <38482edf1a31ed0735b746cf0ab3e1adda4199d1.1614009417.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1614009417.git.anuj.mittal@intel.com>
References: <cover.1614009417.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lee Chee Yang <chee.yang.lee@intel.com>

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
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
index 3061ed2975..a1e34a9379 100644
--- a/meta/recipes-connectivity/openssh/openssh_8.3p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_8.3p1.bb
@@ -25,6 +25,7 @@ SRC_URI = "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar
            file://sshd_check_keys \
            file://add-test-support-for-busybox.patch \
            file://0f90440ca70abab947acbd77795e9f130967956c.patch \
+           file://CVE-2020-14145.patch \
            "
 SRC_URI[sha256sum] = "f2befbe0472fe7eb75d23340eb17531cb6b3aac24075e2066b41f814e12387b2"
 
-- 
2.29.2

