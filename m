Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1U3b9x-0004NG-J7
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Feb 2013 00:45:42 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r17NTnPt006234
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 7 Feb 2013 15:29:50 -0800 (PST)
Received: from msp-mhatle-lx2.wrs.com (172.25.34.61) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.318.4; Thu, 7 Feb 2013 15:29:47 -0800
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 7 Feb 2013 17:56:28 -0600
Message-ID: <c3987be969d51494a4879b476a7d03fda27ad05f.1360270199.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.8.1.2.545.g2f19ada
In-Reply-To: <cover.1360270199.git.mark.hatle@windriver.com>
References: <cover.1360270199.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [denzil 01/18] Patch ocf-linux.inc to work with the 2010 and 2012 versions
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
X-List-Received-Date: Thu, 07 Feb 2013 23:45:42 -0000
Content-Type: text/plain

From: dhall <dennis.hall@windriver.com>

The 2010 version of the ocf-linux package contains an embedded
tar file that has to be expanded.  The 2012 version of the package
comes with the contents of the tar file extracted in the source
tree.  This patch to ocf-linux.inc allows it to handle both versions.

Signed-off-by: dhall <dennis.hall@windriver.com>
Signed-off-by: Jeff Polk <jeff.polk@windriver.com>
Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/recipes-connectivity/openssl/ocf-linux.inc | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/openssl/ocf-linux.inc b/meta/recipes-connectivity/openssl/ocf-linux.inc
index f4ec7c9..15a553a 100644
--- a/meta/recipes-connectivity/openssl/ocf-linux.inc
+++ b/meta/recipes-connectivity/openssl/ocf-linux.inc
@@ -9,6 +9,12 @@ SRC_URI = "http://sourceforge.net/projects/ocf-linux/files/ocf-linux/${PV}/ocf-l
 
 S = "${WORKDIR}/ocf-linux-${PV}"
 
+get_headers() {
+    if [ -f ocf-linux.tar.gz ]; then
+        tar -xf ocf-linux.tar.gz
+    fi
+}
+
 # Need to unpack the the ocf-linux.tar.gz file contained inside the
 # downloaded tarball
 # Install the OCF Linux headers so that other packages such as openssl
@@ -16,7 +22,10 @@ S = "${WORKDIR}/ocf-linux-${PV}"
 # the README file.
 do_install() {
     cd ${S}
-    tar xzf ocf-linux.tar.gz
+    # if ocf-linux.tar.gz exists extract the contents or else go to 
+    #    the next do_install step
+    # Added to maintain compatibility between the 2010 and 2012+ versions
+    get_headers
     install -d ${D}${includedir}/crypto
     install -m 0644 ${S}/ocf/*.h ${D}${includedir}/crypto/
 }
-- 
1.8.1.2.545.g2f19ada



