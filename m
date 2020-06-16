Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web11.1808.1592272351746932078
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jun 2020 18:52:31 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: yi.zhao@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 05G1pSdM012169
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL);
	Mon, 15 Jun 2020 18:52:05 -0700
Received: from localhost (128.224.162.174) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.487.0; Mon, 15 Jun
 2020 18:51:56 -0700
From: "Yi Zhao" <yi.zhao@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <peter.kjellerstedt@axis.com>
Subject: [PATCH 2/2] iptables: split iptables-apply to its own package
Date: Tue, 16 Jun 2020 09:51:06 +0800
Message-ID: <20200616015106.11022-2-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200616015106.11022-1-yi.zhao@windriver.com>
References: <20200616015106.11022-1-yi.zhao@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.174]
Content-Type: text/plain

We do not want iptables to depend on bash. So move
iptables-apply/ip6tables-apply to a separate package.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta/recipes-extended/iptables/iptables_1.8.5.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/iptables/iptables_1.8.5.bb b/meta/recipes-extended/iptables/iptables_1.8.5.bb
index 8664a9751a..5976128807 100644
--- a/meta/recipes-extended/iptables/iptables_1.8.5.bb
+++ b/meta/recipes-extended/iptables/iptables_1.8.5.bb
@@ -68,7 +68,7 @@ do_install_append() {
     fi
 }
 
-PACKAGES += "${PN}-modules"
+PACKAGES =+ "${PN}-modules ${PN}-apply"
 PACKAGES_DYNAMIC += "^${PN}-module-.*"
 
 python populate_packages_prepend() {
@@ -98,6 +98,9 @@ RRECOMMENDS_${PN} = " \
 
 FILES_${PN} += "${datadir}/xtables"
 
+FILES_${PN}-apply = "${sbindir}/ip*-apply"
+RDEPENDS_${PN}-apply = "${PN} bash"
+
 # Include the symlinks as well in respective packages
 FILES_${PN}-module-xt-conntrack += "${libdir}/xtables/libxt_state.so"
 FILES_${PN}-module-xt-ct += "${libdir}/xtables/libxt_NOTRACK.so"
-- 
2.17.1

