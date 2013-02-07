Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1U3bAA-0004Qv-3r
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Feb 2013 00:45:55 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r17NU05q026803
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 7 Feb 2013 15:30:00 -0800 (PST)
Received: from msp-mhatle-lx2.wrs.com (172.25.34.61) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.318.4; Thu, 7 Feb 2013 15:29:59 -0800
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 7 Feb 2013 17:56:43 -0600
Message-ID: <8bf049a2add1253e6c0ec1738ab53f78293ab69e.1360270199.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.8.1.2.545.g2f19ada
In-Reply-To: <cover.1360270199.git.mark.hatle@windriver.com>
References: <cover.1360270199.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [denzil 16/18] lighttpd: fixing invalid read in valgrind
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
X-List-Received-Date: Thu, 07 Feb 2013 23:46:19 -0000
Content-Type: text/plain

From: Li Wang <li.wang@windriver.com>

[ CQID: WIND00393362 ]

Fix handling of empty header list entries in http_request_split_value,
fixing invalid read in valgrind (fixes #2413)

http://redmine.lighttpd.net/issues/2413
http://redmine.lighttpd.net/projects/lighttpd/repository/revisions/2830

Signed-off-by: Li Wang <li.wang@windriver.com>
Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 .../lighttpd-fixing-invalid-read-in-valgrind.patch | 33 ++++++++++++++++++++++
 meta/recipes-extended/lighttpd/lighttpd_1.4.30.bb  |  3 +-
 2 files changed, 35 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/lighttpd/files/lighttpd-fixing-invalid-read-in-valgrind.patch

diff --git a/meta/recipes-extended/lighttpd/files/lighttpd-fixing-invalid-read-in-valgrind.patch b/meta/recipes-extended/lighttpd/files/lighttpd-fixing-invalid-read-in-valgrind.patch
new file mode 100644
index 0000000..9c2e574
--- /dev/null
+++ b/meta/recipes-extended/lighttpd/files/lighttpd-fixing-invalid-read-in-valgrind.patch
@@ -0,0 +1,33 @@
+lighttpd: fixing invalid read in valgrind
+
+Fix handling of empty header list entries in http_request_split_value,
+fixing invalid read in valgrind (fixes #2413)
+
+http://redmine.lighttpd.net/issues/2413
+http://redmine.lighttpd.net/projects/lighttpd/repository/revisions/2830
+
+Signed-off-by: Li Wang <li.wang@windriver.com>
+---
+ src/request.c |    4 +++-
+ 1 files changed, 3 insertions(+), 1 deletions(-)
+
+diff --git a/src/request.c b/src/request.c
+index a48bf48..e76a98f 100644
+--- a/src/request.c
++++ b/src/request.c
+@@ -241,9 +241,11 @@ static int http_request_split_value(array *vals, buffer *b) {
+ 			start = s;
+ 
+ 			for (; *s != ',' && i < b->used - 1; i++, s++);
++			if (start == s) break; /* empty fields are skipped */
+ 			end = s - 1;
+ 
+-			for (; (*end == ' ' || *end == '\t') && end > start; end--);
++			for (; end > start && (*end == ' ' || *end == '\t'); end--);
++			if (start == end) break; /* empty fields are skipped */
+ 
+ 			if (NULL == (ds = (data_string *)array_get_unused_element(vals, TYPE_STRING))) {
+ 				ds = data_string_init();
+-- 
+1.7.0.5
+
diff --git a/meta/recipes-extended/lighttpd/lighttpd_1.4.30.bb b/meta/recipes-extended/lighttpd/lighttpd_1.4.30.bb
index 3ae3867..c4008af 100644
--- a/meta/recipes-extended/lighttpd/lighttpd_1.4.30.bb
+++ b/meta/recipes-extended/lighttpd/lighttpd_1.4.30.bb
@@ -16,12 +16,13 @@ RDEPENDS_${PN} += " \
                lighttpd-module-staticfile \
 "
 
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "http://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-${PV}.tar.bz2 \
         file://index.html.lighttpd \
         file://lighttpd.conf \
         file://lighttpd \
+        file://lighttpd-fixing-invalid-read-in-valgrind.patch \
 "
 
 SRC_URI[md5sum] = "63f9df52dcae0ab5689a95c99c54e48a"
-- 
1.8.1.2.545.g2f19ada



