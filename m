Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 8A308712AC
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Sep 2014 10:54:21 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s82AsKmN010814
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 2 Sep 2014 03:54:23 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.187) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Tue, 2 Sep 2014 03:54:20 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 2 Sep 2014 18:53:59 +0800
Message-ID: <010279d1b3a4c009f7231f646d2d34fbce904656.1409655125.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1409655125.git.Qi.Chen@windriver.com>
References: <cover.1409655125.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 13/26] cups: make cups daemon start correctly
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
X-List-Received-Date: Tue, 02 Sep 2014 10:54:21 -0000
Content-Type: text/plain

From: In Long <inlong_tec@163.com>

The cups daemon needs the lpadmin group to start correctly.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-extended/cups/cups.inc | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/cups/cups.inc
index adf21eb..d29b875 100644
--- a/meta/recipes-extended/cups/cups.inc
+++ b/meta/recipes-extended/cups/cups.inc
@@ -12,7 +12,10 @@ SRC_URI = "http://www.cups.org/software/${PV}/${BP}-source.tar.bz2 \
 
 LEAD_SONAME = "libcupsdriver.so"
 
-inherit autotools-brokensep binconfig
+inherit autotools-brokensep binconfig useradd
+
+USERADD_PACKAGES = "${PN}"
+GROUPADD_PARAM_${PN} = "--system lpadmin"
 
 PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'zeroconf', 'avahi', '', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam', '', d)}"
@@ -79,6 +82,7 @@ python do_package_append() {
 
 PACKAGES =+ "${PN}-lib ${PN}-libimage"
 
+RDEPENDS_${PN} += "procps"
 FILES_${PN} += "${libdir}/cups/backend \
 		${libdir}/cups/cgi-bin \
 		${libdir}/cups/filter \
-- 
1.9.1


