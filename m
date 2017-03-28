Return-Path: <spopovyc@cisco.com>
Received: from rcdn-iport-3.cisco.com (rcdn-iport-3.cisco.com [173.37.86.74])
	by mail.openembedded.org (Postfix) with ESMTP id 59DE777ACD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Mar 2017 19:00:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=3654; q=dns/txt; s=iport;
	t=1490727656; x=1491937256;
	h=from:to:cc:subject:date:message-id;
	bh=MykZoeE5lMIieiftAhtykd8OjlDVv05uZYs1/OFxR24=;
	b=dbDQGSpYCBUv/66RXw03rObJyVM3i7/+xkuppsoYkL9geOESkS/jXEWh
	uHQnWbBmDkLcKo6/IROoRI6dF2zbwFewYftdQMOOkc8XWtg44d33rLgV5
	XfzWcd/x9WNvp6KkOyGqrf/Uyla5HqaTptQL46j94lYwO0YsAICNND+b7 E=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0AmAQAPstpY/4MNJK1dGQEBAQEBAQEBA?=
	=?us-ascii?q?QEBBwEBAQEBg1RhgQuNcZExk1yCD4IOJoV8gyU/GAECAQEBAQEBAWsohRUBfyw?=
	=?us-ascii?q?DAQJ+IYl6DQ6vYopMAQEBAQYoE4Y7gg2HBoJ8gxkFnGCGfItTgXxUjmOIWIsSH?=
	=?us-ascii?q?ziBBDofFYcZQDWHFSiCFQEBAQ?=
X-IronPort-AV: E=Sophos;i="5.36,237,1486425600"; d="scan'208";a="215518489"
Received: from alln-core-1.cisco.com ([173.36.13.131])
	by rcdn-iport-3.cisco.com with ESMTP/TLS/DHE-RSA-AES256-SHA;
	28 Mar 2017 19:00:54 +0000
Received: from sjc-ads-6963.cisco.com (sjc-ads-6963.cisco.com [10.30.218.83])
	by alln-core-1.cisco.com (8.14.5/8.14.5) with ESMTP id v2SJ0rLg019327
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=NO);
	Tue, 28 Mar 2017 19:00:54 GMT
From: Serhii Popovych <spopovyc@cisco.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 28 Mar 2017 19:00:48 +0000
Message-Id: <e1eee1aa56e1dc59a55a9cac25a00a1ea2f9375e.1490727568.git.spopovyc@cisco.com>
X-Mailer: git-send-email 2.7.4
X-Auto-Response-Suppress: DR, OOF, AutoReply
Cc: XE-Linux <xe-linux-external@cisco.com>
Subject: [PATCH] ca-certificates: Fix symlinks to the certificates in nativesdk
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
X-List-Received-Date: Tue, 28 Mar 2017 19:00:54 -0000

Symlinks to certificates in buildtools-tarball at /etc/ssl/certs
installed with absolute pathes making these sumlinks pointing
outside of toolchain to the host system locations.

These locations may not contain some certificates (thus link to
the certificate in toolchain is broken) or host system
certificate may be revoked by CRL or outdated.

Since this change seems non intrusive for target package apply
patch for all builds.

Cc: XE-Linux <xe-linux-external@cisco.com>
Signed-off-by: Serhii Popovych <spopovyc@cisco.com>
---
 ...ertificates-Use-relative-paths-when-linki.patch | 38 ++++++++++++++++++++++
 .../ca-certificates/ca-certificates_20161130.bb    |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta/recipes-support/ca-certificates/ca-certificates/0003-update-ca-certificates-Use-relative-paths-when-linki.patch

diff --git a/meta/recipes-support/ca-certificates/ca-certificates/0003-update-ca-certificates-Use-relative-paths-when-linki.patch b/meta/recipes-support/ca-certificates/ca-certificates/0003-update-ca-certificates-Use-relative-paths-when-linki.patch
new file mode 100644
index 0000000..8666e30
--- /dev/null
+++ b/meta/recipes-support/ca-certificates/ca-certificates/0003-update-ca-certificates-Use-relative-paths-when-linki.patch
@@ -0,0 +1,38 @@
+From 912e7be8e7151bd4a2feed6d34f927d42b12bb7e Mon Sep 17 00:00:00 2001
+From: Serhii Popovych <spopovyc@cisco.com>
+Date: Wed, 16 Dec 2015 16:48:03 +0200
+Subject: [PATCH] update-ca-certificates: Use relative paths when linking certs
+
+Creating links in $ETCCERTSDIR (/etc/ssl/certs) with absolute
+path could broke paths to the certificates in toolchains by
+pointing to the outside of toolchain root directory. These
+absolute paths may not exist in the host system or contain
+certificates older than provided within toolchain.
+
+Use absolute pathes when creating symbolic links to the
+certificates to ensure we always pointing to the toolchain
+provied certificates.
+
+Upstream-Status: Pending
+
+Signed-off-by: Serhii Popovych <spopovyc@cisco.com>
+---
+ sbin/update-ca-certificates | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/sbin/update-ca-certificates b/sbin/update-ca-certificates
+index 3a5ffd3..cb3c1f1 100755
+--- a/sbin/update-ca-certificates
++++ b/sbin/update-ca-certificates
+@@ -94,7 +94,7 @@ add() {
+                                                   -e 's/,/_/g').pem"
+   if ! test -e "$PEM" || [ "$(readlink "$PEM")" != "${CERT##$SYSROOT}" ]
+   then
+-    ln -sf "${CERT##$SYSROOT}" "$PEM"
++    ln -sf "$(echo "${ETCCERTSDIR##$SYSROOT}" | sed -e 's/\/[^/]\+/..\//g')${CERT##$SYSROOT/}" "$PEM"
+     echo "+$PEM" >> "$ADDED"
+   fi
+   # Add trailing newline to certificate, if it is missing (#635570)
+-- 
+2.3.0
+
diff --git a/meta/recipes-support/ca-certificates/ca-certificates_20161130.bb b/meta/recipes-support/ca-certificates/ca-certificates_20161130.bb
index 42088b9..e6e17de 100644
--- a/meta/recipes-support/ca-certificates/ca-certificates_20161130.bb
+++ b/meta/recipes-support/ca-certificates/ca-certificates_20161130.bb
@@ -17,6 +17,7 @@ SRCREV = "61b70a1007dc269d56881a0d480fc841daacc77c"
 
 SRC_URI = "git://anonscm.debian.org/collab-maint/ca-certificates.git \
            file://0002-update-ca-certificates-use-SYSROOT.patch \
+           file://0003-update-ca-certificates-Use-relative-paths-when-linki.patch \
            file://0001-update-ca-certificates-don-t-use-Debianisms-in-run-p.patch \
            file://update-ca-certificates-support-Toybox.patch \
            file://default-sysroot.patch \
-- 
2.7.4


