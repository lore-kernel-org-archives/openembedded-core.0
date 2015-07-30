Return-Path: <sona.sarmadi@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id D89C07626F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jul 2015 11:49:02 +0000 (UTC)
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 30 Jul 2015 13:49:01 +0200
From: Sona Sarmadi <sona.sarmadi@enea.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 30 Jul 2015 13:48:55 +0200
Message-ID: <1438256935-6126-1-git-send-email-sona.sarmadi@enea.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Received-SPF: None (SESTOEX08.enea.se: sona.sarmadi@enea.com does not
	designate permitted sender hosts)
Subject: [dizzy][PATCH] bind9.9.5: CVE-2015-5477
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
X-List-Received-Date: Thu, 30 Jul 2015 11:49:04 -0000
Content-Type: text/plain

Fixed a flaw in the way BIND handled requests for TKEY
DNS resource records.

References:
https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2015-5477
https://kb.isc.org/article/AA-01272

Signed-off-by: Sona Sarmadi <sona.sarmadi@enea.com>
---
 .../bind/bind/bind9_9_5-CVE-2015-5477.patch        | 45 ++++++++++++++++++++++
 meta/recipes-connectivity/bind/bind_9.9.5.bb       |  1 +
 2 files changed, 46 insertions(+)
 create mode 100644 meta/recipes-connectivity/bind/bind/bind9_9_5-CVE-2015-5477.patch

diff --git a/meta/recipes-connectivity/bind/bind/bind9_9_5-CVE-2015-5477.patch b/meta/recipes-connectivity/bind/bind/bind9_9_5-CVE-2015-5477.patch
new file mode 100644
index 0000000..896272a
--- /dev/null
+++ b/meta/recipes-connectivity/bind/bind/bind9_9_5-CVE-2015-5477.patch
@@ -0,0 +1,45 @@
+From dbb064aa7972ef918d9a235b713108a4846cbb62 Mon Sep 17 00:00:00 2001
+From: Mark Andrews <marka@isc.org>
+Date: Tue, 14 Jul 2015 14:48:42 +1000
+Subject: [PATCH] 4165.   [bug]           An failure to reset a value to NULL
+ in tkey.c could                         result in an assertion failure.
+ (CVE-2015-5477)                         [RT #40046]
+
+Upstream-Status: Backport
+[CHANGES file has been edited manually to add CVE-2015-5477 and
+an already applied CVE (CVE-2014-8500)].
+
+Referenc: https://kb.isc.org/article/AA-01272
+
+Signed-off-by: Sona Sarmadi <sona.sarmadi@enea.com>
+
+diff -ruN a/CHANGES b/CHANGES
+--- a/CHANGES	2014-01-27 19:58:24.000000000 +0100
++++ b/CHANGES	2015-07-30 11:03:18.871670769 +0200
+@@ -1,4 +1,15 @@
+ 	--- 9.9.5 released ---
++4165.   [security]      An failure to reset a value to NULL in tkey.c could
++                        result in an assertion failure. (CVE-2015-5477)
++                        [RT #40046]
++
++4006.   [security]      A flaw in delegation handling could be exploited
++                        to put named into an infinite loop.  This has
++                        been addressed by placing limits on the number
++                        of levels of recursion named will allow (default 7),
++                        and the number of iterative queries that it will
++                        send (default 50) before terminating a recursive
++                        query (CVE-2014-8500).
+ 
+ 	--- 9.9.5rc2 released ---
+ 
+diff -ruN a/lib/dns/tkey.c b/lib/dns/tkey.c
+--- a/lib/dns/tkey.c	2014-01-27 19:58:24.000000000 +0100
++++ b/lib/dns/tkey.c	2015-07-30 10:58:30.647945942 +0200
+@@ -650,6 +650,7 @@
+ 		 * Try the answer section, since that's where Win2000
+ 		 * puts it.
+ 		 */
++		name = NULL;
+ 		if (dns_message_findname(msg, DNS_SECTION_ANSWER, qname,
+ 					 dns_rdatatype_tkey, 0, &name,
+ 					 &tkeyset) != ISC_R_SUCCESS) {
diff --git a/meta/recipes-connectivity/bind/bind_9.9.5.bb b/meta/recipes-connectivity/bind/bind_9.9.5.bb
index 8e04f8a..e206cc4 100644
--- a/meta/recipes-connectivity/bind/bind_9.9.5.bb
+++ b/meta/recipes-connectivity/bind/bind_9.9.5.bb
@@ -18,6 +18,7 @@ SRC_URI = "ftp://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.gz \
            file://bind9 \
            file://init.d-add-support-for-read-only-rootfs.patch \
            file://bind9_9_5-CVE-2014-8500.patch \
+           file://bind9_9_5-CVE-2015-5477.patch \
 	   "
 
 SRC_URI[md5sum] = "e676c65cad5234617ee22f48e328c24e"
-- 
1.9.1


