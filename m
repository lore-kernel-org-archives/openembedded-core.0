Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1R6mre-0007Dk-UB
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Sep 2011 19:15:11 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p8MH9nLe007374
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Sep 2011 10:09:49 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Thu, 22 Sep 2011 10:09:48 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 22 Sep 2011 12:12:10 -0500
Message-ID: <4eb0c2ea9d7712636edba5d56c77e76d4461352f.1316711477.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1316711477.git.mark.hatle@windriver.com>
References: <cover.1316711477.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 2/2] foomatic-filters: Disable filter checking
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
X-List-Received-Date: Thu, 22 Sep 2011 17:15:11 -0000
Content-Type: text/plain

Disable a few checks, and hard code the values for a few other items
to work around potential host contamination issues.  We also default
to the cups configuration for items.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 .../foomatic/foomatic-filters_4.0.7.bb             |   21 ++++++++++++++-----
 1 files changed, 15 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-extended/foomatic/foomatic-filters_4.0.7.bb b/meta/recipes-extended/foomatic/foomatic-filters_4.0.7.bb
index 9627187..e3bcf78 100644
--- a/meta/recipes-extended/foomatic/foomatic-filters_4.0.7.bb
+++ b/meta/recipes-extended/foomatic/foomatic-filters_4.0.7.bb
@@ -10,7 +10,7 @@ format using a printer-specific, but spooler-independent PPD file. \
 "
 
 DEPENDS += "cups perl libxml2"
-PR = "r1"
+PR = "r2"
 
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://${WORKDIR}/foomatic-filters-${PV}/COPYING;md5=393a5ca445f6965873eca0259a17f833"
@@ -20,11 +20,20 @@ SRC_URI = "http://www.openprinting.org/download/foomatic/foomatic-filters-${PV}.
 SRC_URI[md5sum] = "20abd25c1c98b2dae68709062a132a7d"
 SRC_URI[sha256sum] = "090313fae40b177f505d9c9b93d7a4d7188b6d5d18b6ae41ab24903ac983478d"
 
-do_install_append_linuxstdbase() {
-    install -d ${D}${libdir}/cups/filter
-    ln -sf ${bindir}/foomatic-rip ${D}${libdir}/cups/filter
+inherit autotools
+
+EXTRA_OECONF += "--disable-file-converter-check --with-file-converter=texttops"
+
+do_configure_prepend() {
+    export LIB_CUPS=${exec_prefix}/lib/cups               # /usr/lib NOT libdir
+    export CUPS_BACKENDS=${exec_prefix}/lib/cups/backend  # /usr/lib NOT libdir
+    export CUPS_FILTERS=${exec_prefix}/lib/cups/filter    # /usr/lib NOT libdir
+    export CUPS_PPDS=${datadir}/cups/model
 }
 
-FILES_${PN}_append_linuxstdbase += "${libdir}/cups/filter/foomatic-rip"
+do_install_append_linuxstdbase() {
+    install -d ${D}${exec_prefix}/lib/cups/filter
+    ln -sf ${bindir}/foomatic-rip ${D}${exec_prefix}/lib/cups/filter
+}
 
-inherit autotools
+FILES_${PN}_append_linuxstdbase += "${exec_prefix}/lib/cups/filter/foomatic-rip"
-- 
1.7.3.4



