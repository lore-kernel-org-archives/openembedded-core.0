Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 2F0B460CEB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jan 2014 02:39:43 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s0M2dhLm002624
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jan 2014 18:39:44 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.164) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Tue, 21 Jan 2014 18:39:43 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 22 Jan 2014 10:39:49 +0800
Message-ID: <bd961e2d3e4697290f6aaeff2843094453d1929a.1390358320.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1390358320.git.Qi.Chen@windriver.com>
References: <cover.1390358320.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 4/4] procps: make the 'watch' command register to /bin/watch
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
X-List-Received-Date: Wed, 22 Jan 2014 02:39:43 -0000
Content-Type: text/plain

This solves the integration problem with busybox.

Previously, there was a patch in busybox to move 'watch' to /usr/bin.
Such patch is not accepted by upsteam and really not necessary as
our ALTERNATIVE system can easily solve such intergration problem.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-extended/procps/procps.inc |    6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-extended/procps/procps.inc b/meta/recipes-extended/procps/procps.inc
index 6ee4a04..20d5fc2 100644
--- a/meta/recipes-extended/procps/procps.inc
+++ b/meta/recipes-extended/procps/procps.inc
@@ -15,6 +15,10 @@ SRC_URI = "http://procps.sourceforge.net/procps-${PV}.tar.gz \
 
 inherit autotools update-alternatives
 
+do_install_append() {
+	mv ${D}${bindir}/watch ${D}${bindir}/watch.${BPN}
+}
+
 FILES_${PN} += "${libdir}/*-${PV}.so ${base_libdir}/*-${PV}.so"
 FILES_SOLIBSDEV = ""
 
@@ -22,4 +26,6 @@ ALTERNATIVE_${PN} = "top uptime free pkill pmap kill sysctl ps pgrep pwdx watch"
 ALTERNATIVE_LINK_NAME[kill] = "${base_bindir}/kill"
 ALTERNATIVE_LINK_NAME[sysctl] = "${base_sbindir}/sysctl"
 ALTERNATIVE_LINK_NAME[ps] = "${base_bindir}/ps"
+ALTERNATIVE_LINK_NAME[watch] = "${base_bindir}/watch"
+ALTERNATIVE_TARGET[watch] = "${bindir}/watch.${BPN}"
 ALTERNATIVE_PRIORITY = "110"
-- 
1.7.9.5


