Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 96FD9713C0
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Sep 2014 07:09:31 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s8379XFr005262
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 3 Sep 2014 00:09:33 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.187) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Wed, 3 Sep 2014 00:09:32 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 3 Sep 2014 15:09:09 +0800
Message-ID: <100fff4a1759500fef8fb62d5645fc2fc3df2653.1409728004.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1409728004.git.Qi.Chen@windriver.com>
References: <cover.1409728004.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 12/25] cups: make cups daemon start correctly
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
X-List-Received-Date: Wed, 03 Sep 2014 07:09:31 -0000
Content-Type: text/plain

From: In Long <inlong_tec@163.com>

The cups daemon needs the lpadmin group to start correctly.

Also add 'procps' to RDEPENDS if 'sysvinit' is in DISTRO_FEATURES,
because the init script shipped with cups needs it.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-extended/cups/cups.inc | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/cups/cups.inc
index adf21eb..162b3fd 100644
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
 
+RDEPENDS_${PN} += "${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'procps', '', d)}"
 FILES_${PN} += "${libdir}/cups/backend \
 		${libdir}/cups/cgi-bin \
 		${libdir}/cups/filter \
-- 
1.9.1


