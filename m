Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 208D765CAC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Oct 2014 01:46:29 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s9M1kUSK021091
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Oct 2014 18:46:30 -0700 (PDT)
Received: from pek-hostel-vm12.wrs.com (128.224.153.182) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Tue, 21 Oct 2014 18:46:30 -0700
From: <wenzong.fan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 21 Oct 2014 21:46:24 -0400
Message-ID: <ea955e7272a5cd7137a55eee6ea694ee6a55b837.1413941715.git.wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1413941715.git.wenzong.fan@windriver.com>
References: <cover.1413941715.git.wenzong.fan@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/4] bind: clean host path in isc-config.sh
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
X-List-Received-Date: Wed, 22 Oct 2014 01:46:36 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

* /usr/bin/isc-config.sh
* /usr/bin/bind9-config - hardlink to isc-config.sh

Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
---
 meta/recipes-connectivity/bind/bind_9.9.5.bb |    7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/recipes-connectivity/bind/bind_9.9.5.bb b/meta/recipes-connectivity/bind/bind_9.9.5.bb
index ebd38ef..dd171c1 100644
--- a/meta/recipes-connectivity/bind/bind_9.9.5.bb
+++ b/meta/recipes-connectivity/bind/bind_9.9.5.bb
@@ -51,6 +51,13 @@ FILES_${PN}-utils = "${bindir}/host ${bindir}/dig"
 FILES_${PN}-dev += "${bindir}/isc-config.h"
 FILES_${PN} += "${sbindir}/generate-rndc-key.sh"
 
+do_install_prepend() {
+	# clean host path in isc-config.sh before the hardlink created
+	# by "make install":
+	#   bind9-config -> isc-config.sh
+	sed -i -e "s,${STAGING_LIBDIR},${libdir}," ${S}/isc-config.sh
+}
+
 do_install_append() {
 	rm "${D}${bindir}/nslookup"
 	rm "${D}${mandir}/man1/nslookup.1"
-- 
1.7.9.5


