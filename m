Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1U3bAA-0004Qx-Os
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Feb 2013 00:46:08 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r17NU3Yb006266
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 7 Feb 2013 15:30:03 -0800 (PST)
Received: from msp-mhatle-lx2.wrs.com (172.25.34.61) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.318.4; Thu, 7 Feb 2013 15:30:00 -0800
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 7 Feb 2013 17:56:44 -0600
Message-ID: <5ad95c2baac5c230efad96f49cc489b3ba8bac72.1360270199.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.8.1.2.545.g2f19ada
In-Reply-To: <cover.1360270199.git.mark.hatle@windriver.com>
References: <cover.1360270199.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [denzil 17/18] lighttpd: CVE-2012-5533
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

[ CQID: WIND00392071 ]

fix DoS in Connection header value split.
http://download.lighttpd.net/lighttpd/security/lighttpd_sa_2012_01.txt
http://download.lighttpd.net/lighttpd/security/lighttpd-1.4.31_fix_connection_header_dos.patch

Signed-off-by: Li Wang <li.wang@windriver.com>
Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 .../lighttpd/files/lighttpd-CVE-2012-5533.patch    | 120 +++++++++++++++++++++
 meta/recipes-extended/lighttpd/lighttpd_1.4.30.bb  |   3 +-
 2 files changed, 122 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/lighttpd/files/lighttpd-CVE-2012-5533.patch

diff --git a/meta/recipes-extended/lighttpd/files/lighttpd-CVE-2012-5533.patch b/meta/recipes-extended/lighttpd/files/lighttpd-CVE-2012-5533.patch
new file mode 100644
index 0000000..a9a35a6
--- /dev/null
+++ b/meta/recipes-extended/lighttpd/files/lighttpd-CVE-2012-5533.patch
@@ -0,0 +1,120 @@
+lighttpd: CVE-2012-5533
+
+fix DoS in Connection header value split.
+http://download.lighttpd.net/lighttpd/security/lighttpd_sa_2012_01.txt
+http://download.lighttpd.net/lighttpd/security/lighttpd-1.4.31_fix_connection_header_dos.patch
+
+Signed-off-by: Li Wang <li.wang@windriver.com>
+---
+ src/request.c |   75 +++++++++++++++++++++++++++++----------------------------
+ 1 files changed, 38 insertions(+), 37 deletions(-)
+
+diff --git a/src/request.c b/src/request.c
+index e76a98f..46d636c 100644
+--- a/src/request.c
++++ b/src/request.c
+@@ -209,9 +209,11 @@ static int request_check_hostname(server *srv, connection *con, buffer *host) {
+ #endif
+ 
+ static int http_request_split_value(array *vals, buffer *b) {
+-	char *s;
+ 	size_t i;
+ 	int state = 0;
++
++	const char *current;
++	const char *token_start = NULL, *token_end = NULL;
+ 	/*
+ 	 * parse
+ 	 *
+@@ -222,53 +224,52 @@ static int http_request_split_value(array *vals, buffer *b) {
+ 
+ 	if (b->used == 0) return 0;
+ 
+-	s = b->ptr;
+-
+-	for (i =0; i < b->used - 1; ) {
+-		char *start = NULL, *end = NULL;
++	current = b->ptr;
++	for (i =  0; i < b->used; ++i, ++current) {
+ 		data_string *ds;
+ 
+ 		switch (state) {
+-		case 0: /* ws */
+-
+-			/* skip ws */
+-			for (; (*s == ' ' || *s == '\t') && i < b->used - 1; i++, s++);
+-
+-
+-			state = 1;
+-			break;
+-		case 1: /* value */
+-			start = s;
+-
+-			for (; *s != ',' && i < b->used - 1; i++, s++);
+-			if (start == s) break; /* empty fields are skipped */
+-			end = s - 1;
+-
+-			for (; end > start && (*end == ' ' || *end == '\t'); end--);
+-			if (start == end) break; /* empty fields are skipped */
+-
+-			if (NULL == (ds = (data_string *)array_get_unused_element(vals, TYPE_STRING))) {
+-				ds = data_string_init();
++		case 0: /* find start of a token */
++			switch (*current) {
++			case ' ':
++			case '\t': /* skip white space */
++			case ',': /* skip empty token */
++				break;
++			case '\0': /* end of string */
++				return 0;
++			default:
++				/* found real data, switch to state 1 to find the end of the token */
++				token_start = token_end = current;
++				state = 1;
++				break;
+ 			}
++			break;
++		case 1: /* find end of token and last non white space character */
++			switch (*current) {
++			case ' ':
++			case '\t':
++				/* space - don't update token_end */
++				break;
++			case ',':
++			case '\0': /* end of string also marks the end of a token */
++				if (NULL == (ds = (data_string *)array_get_unused_element(vals, TYPE_STRING))) {
++					ds = data_string_init();
++				}
+ 
+-			buffer_copy_string_len(ds->value, start, end-start+1);
+-			array_insert_unique(vals, (data_unset *)ds);
++				buffer_copy_string_len(ds->value, token_start, token_end-token_start+1);
++				array_insert_unique(vals, (data_unset *)ds);
+ 
+-			if (*s == ',') {
+ 				state = 0;
+-				i++;
+-				s++;
+-			} else {
+-				/* end of string */
+-
+-				state = 2;
++				break;
++			default:
++				/* no white space, update token_end to include current character */
++				token_end = current;
++				break;
+ 			}
+ 			break;
+-		default:
+-			i++;
+-			break;
+ 		}
+ 	}
++
+ 	return 0;
+ }
+ 
+-- 
+1.7.0.5
+
diff --git a/meta/recipes-extended/lighttpd/lighttpd_1.4.30.bb b/meta/recipes-extended/lighttpd/lighttpd_1.4.30.bb
index c4008af..b86fd4a 100644
--- a/meta/recipes-extended/lighttpd/lighttpd_1.4.30.bb
+++ b/meta/recipes-extended/lighttpd/lighttpd_1.4.30.bb
@@ -16,13 +16,14 @@ RDEPENDS_${PN} += " \
                lighttpd-module-staticfile \
 "
 
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "http://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-${PV}.tar.bz2 \
         file://index.html.lighttpd \
         file://lighttpd.conf \
         file://lighttpd \
         file://lighttpd-fixing-invalid-read-in-valgrind.patch \
+        file://lighttpd-CVE-2012-5533.patch \
 "
 
 SRC_URI[md5sum] = "63f9df52dcae0ab5689a95c99c54e48a"
-- 
1.8.1.2.545.g2f19ada



