Return-Path: <Changqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 1F1CE74D03
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Sep 2018 01:23:05 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w8B1N7Gv015278
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Sep 2018 18:23:07 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Mon, 10 Sep 2018 18:23:06 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 11 Sep 2018 09:23:05 +0800
Message-ID: <1536628985-377640-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH V2] bind: patch for CVE-2018-5740
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
X-List-Received-Date: Tue, 11 Sep 2018 01:23:06 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../bind/bind/CVE-2018-5740.patch                  | 72 ++++++++++++++++++++++
 meta/recipes-connectivity/bind/bind_9.11.4.bb      |  1 +
 2 files changed, 73 insertions(+)
 create mode 100644 meta/recipes-connectivity/bind/bind/CVE-2018-5740.patch

diff --git a/meta/recipes-connectivity/bind/bind/CVE-2018-5740.patch b/meta/recipes-connectivity/bind/bind/CVE-2018-5740.patch
new file mode 100644
index 0000000..4236b3b
--- /dev/null
+++ b/meta/recipes-connectivity/bind/bind/CVE-2018-5740.patch
@@ -0,0 +1,72 @@
+Upstream-Status: Backport[https://ftp.isc.org/isc/bind9/9.11.4-P1/patches/CVE-2018-5740]
+
+CVE: CVE-2018-5740
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+
+diff --git a/CHANGES b/CHANGES
+index 750b600..3d8d655 100644
+--- a/CHANGES
++++ b/CHANGES
+@@ -1,3 +1,9 @@
++	--- 9.11.4-P1 released ---
++
++4997.	[security]	named could crash during recursive processing
++			of DNAME records when "deny-answer-aliases" was
++			in use. (CVE-2018-5740) [GL #387]
++
+ 	--- 9.11.4 released ---
+ 
+ 	--- 9.11.4rc2 released ---
+diff --git a/lib/dns/resolver.c b/lib/dns/resolver.c
+index 8f674a2..41d1385 100644
+--- a/lib/dns/resolver.c
++++ b/lib/dns/resolver.c
+@@ -6318,6 +6318,7 @@ is_answertarget_allowed(fetchctx_t *fctx, dns_name_t *qname, dns_name_t *rname,
+ 	unsigned int nlabels;
+ 	dns_fixedname_t fixed;
+ 	dns_name_t prefix;
++	int order;
+ 
+ 	REQUIRE(rdataset != NULL);
+ 	REQUIRE(rdataset->type == dns_rdatatype_cname ||
+@@ -6340,17 +6341,25 @@ is_answertarget_allowed(fetchctx_t *fctx, dns_name_t *qname, dns_name_t *rname,
+ 		tname = &cname.cname;
+ 		break;
+ 	case dns_rdatatype_dname:
++		if (dns_name_fullcompare(qname, rname, &order, &nlabels) !=
++		    dns_namereln_subdomain)
++		{
++			return (ISC_TRUE);
++		}
+ 		result = dns_rdata_tostruct(&rdata, &dname, NULL);
+ 		RUNTIME_CHECK(result == ISC_R_SUCCESS);
+ 		dns_name_init(&prefix, NULL);
+ 		tname = dns_fixedname_initname(&fixed);
+-		nlabels = dns_name_countlabels(qname) -
+-			  dns_name_countlabels(rname);
++		nlabels = dns_name_countlabels(rname);
+ 		dns_name_split(qname, nlabels, &prefix, NULL);
+ 		result = dns_name_concatenate(&prefix, &dname.dname, tname,
+ 					      NULL);
+-		if (result == DNS_R_NAMETOOLONG)
++		if (result == DNS_R_NAMETOOLONG) {
++			if (chainingp != NULL) {
++				*chainingp = ISC_TRUE;
++			}
+ 			return (ISC_TRUE);
++		}
+ 		RUNTIME_CHECK(result == ISC_R_SUCCESS);
+ 		break;
+ 	default:
+@@ -7071,7 +7080,9 @@ answer_response(fetchctx_t *fctx) {
+ 		}
+ 		if ((ardataset->type == dns_rdatatype_cname ||
+ 		     ardataset->type == dns_rdatatype_dname) &&
+-		     !is_answertarget_allowed(fctx, qname, aname, ardataset,
++		    type != ardataset->type &&
++		    type != dns_rdatatype_any &&
++		    !is_answertarget_allowed(fctx, qname, aname, ardataset,
+ 					      NULL))
+ 		{
+ 			return (DNS_R_SERVFAIL);
diff --git a/meta/recipes-connectivity/bind/bind_9.11.4.bb b/meta/recipes-connectivity/bind/bind_9.11.4.bb
index d27068c..23c3aad 100644
--- a/meta/recipes-connectivity/bind/bind_9.11.4.bb
+++ b/meta/recipes-connectivity/bind/bind_9.11.4.bb
@@ -19,6 +19,7 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.gz \
            file://0001-lib-dns-gen.c-fix-too-long-error.patch \
            file://0001-configure.in-remove-useless-L-use_openssl-lib.patch \
            file://0001-named-lwresd-V-and-start-log-hide-build-options.patch \
+           file://CVE-2018-5740.patch \
 "
 
 SRC_URI[md5sum] = "9b4834d78f30cdb796ce437262272a36"
-- 
2.7.4


