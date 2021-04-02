Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web08.14886.1617363944611264546
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Apr 2021 04:45:45 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=48588 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lSIFA-00071r-LN; Fri, 02 Apr 2021 14:45:41 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-oe][PATCH] python3-setuptools-rust: Add release 0.11.6
Date: Fri,  2 Apr 2021 14:45:21 +0300
Message-Id: <20210402114521.3888-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
X-OutGoing-Spam-Status: No, score=-0.5
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - voyager.icnhost.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - konsulko.com
X-Get-Message-Sender-Via: voyager.icnhost.net: authenticated_id: leon@anavi.org
X-Authenticated-Sender: voyager.icnhost.net: leon@anavi.org
X-Source: 
X-Source-Args: 
X-Source-Dir: 

Add setuptools-rust release 0.11.6:

- Respect CARGO_BUILD_TARGET environment variable if set.
- Add setuptools_rust.__version__ and require setuptools >= 46.1.

This recipe is required as a dependency of Python packages relying
on Rust, for example newer versions of python3-cryptography from
layer meta-python.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/python3-setuptools-rust_0.11.6.bb  | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-setuptools-rust_0.11.6.bb

diff --git a/meta/recipes-devtools/python/python3-setuptools-rust_0.11.6.bb b/meta/recipes-devtools/python/python3-setuptools-rust_0.11.6.bb
new file mode 100644
index 0000000000..58b6f8180f
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-setuptools-rust_0.11.6.bb
@@ -0,0 +1,28 @@
+SUMMARY = "Setuptools rust extension plugin"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=011cd92e702dd9e6b1a26157b6fd53f5"
+
+SRC_URI[sha256sum] = "a5b5954909cbc5d66b914ee6763f81fa2610916041c7266105a469f504a7c4ca"
+
+inherit pypi setuptools3
+
+#UPSTREAM_CHECK_REGEX = "setuptools_scm-(?P<pver>.*)\.tar"
+
+DEPENDS += "\
+    ${PYTHON_PN}-wheel-native \
+    ${PYTHON_PN}-setuptools-scm-native \
+"
+
+RDEPENDS_${PN} = "\
+    ${PYTHON_PN}-json \
+    ${PYTHON_PN}-py \
+    ${PYTHON_PN}-setuptools \
+    ${PYTHON_PN}-toml \
+"
+
+RDEPENDS_${PN}_class-native = "\
+    ${PYTHON_PN}-setuptools-native \
+    ${PYTHON_PN}-toml-native \
+"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1

