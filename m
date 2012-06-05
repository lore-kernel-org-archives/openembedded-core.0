Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1SbwSH-0005zp-AI
	for openembedded-core@lists.openembedded.org;
	Tue, 05 Jun 2012 18:18:02 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q55G7Yu5018172
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 5 Jun 2012 09:07:34 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Tue, 5 Jun 2012 09:07:33 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 5 Jun 2012 11:13:17 -0500
Message-ID: <2165f5a6b10e1a45c66fb52730d62e08dfbaba39.1338912425.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1338912425.git.mark.hatle@windriver.com>
References: <cover.1338912425.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 7/7] createrepo: For compatibility w/ RPM 5.4.9 remove RPMVSF_NOSIGNATURES flag
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 05 Jun 2012 16:18:02 -0000
Content-Type: text/plain

The RPMVSF_NOSIGNATURES flag was removed from RPM5 - 5.4.9 as a result of
additional -requires- package validation to help protect from malicious
packages.  The createrepo "dump" script has been updated to no longer use
this flag.  This remains compatible with prior versions of RPM.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 .../createrepo/createrepo/createrepo-rpm549.patch  |   19 +++++++++++++++++++
 .../createrepo/createrepo_0.4.11.bb                |    3 ++-
 2 files changed, 21 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-support/createrepo/createrepo/createrepo-rpm549.patch

diff --git a/meta/recipes-support/createrepo/createrepo/createrepo-rpm549.patch b/meta/recipes-support/createrepo/createrepo/createrepo-rpm549.patch
new file mode 100644
index 0000000..3423c44
--- /dev/null
+++ b/meta/recipes-support/createrepo/createrepo/createrepo-rpm549.patch
@@ -0,0 +1,19 @@
+dumpMetadata.py: Fix for RPM5 - 5.4.9 integration
+
+RPM5 no longer has a switch to disable signature validation.  (Due to security
+validation concerns.)
+
+Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
+
+diff -u createrepo-0.4.11.orig/dumpMetadata.py createrepo-0.4.11/dumpMetadata.py
+--- createrepo-0.4.11.orig/dumpMetadata.py	2012-06-05 10:12:55.687964222 -0500
++++ createrepo-0.4.11/dumpMetadata.py	2012-06-05 10:40:08.154060600 -0500
+@@ -92,7 +92,7 @@
+             fdno = package # let's assume this is an fdno and go with it :)
+     except OSError:
+         raise MDError, "Error opening file"
+-    ts.setVSFlags((rpm._RPMVSF_NOSIGNATURES|rpm.RPMVSF_NOMD5|rpm.RPMVSF_NEEDPAYLOAD))
++    ts.setVSFlags((rpm.RPMVSF_NOMD5|rpm.RPMVSF_NEEDPAYLOAD))
+     try:
+         hdr = ts.hdrFromFdno(fdno)
+     except rpm.error:
diff --git a/meta/recipes-support/createrepo/createrepo_0.4.11.bb b/meta/recipes-support/createrepo/createrepo_0.4.11.bb
index 989a745..060ed59 100644
--- a/meta/recipes-support/createrepo/createrepo_0.4.11.bb
+++ b/meta/recipes-support/createrepo/createrepo_0.4.11.bb
@@ -4,11 +4,12 @@ HOMEPAGE = "http://createrepo.baseurl.org/"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=18810669f13b87348459e611d31ab760"
 
-PR = "r2"
+PR = "r3"
 
 SRC_URI= "http://createrepo.baseurl.org/download/${BP}.tar.gz \
           file://fix-native-install.patch \
           file://python-scripts-should-use-interpreter-from-env.patch \
+	  file://createrepo-rpm549.patch \
          "
 
 SRC_URI[md5sum] = "3e9ccf4abcffe3f49af078c83611eda2"
-- 
1.7.3.4



