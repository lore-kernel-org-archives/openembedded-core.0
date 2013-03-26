Received: from mail-we0-f180.google.com ([74.125.82.180])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UKXO6-00077L-Ei
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Mar 2013 18:10:19 +0100
Received: by mail-we0-f180.google.com with SMTP id r5so3893309wey.11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Mar 2013 09:53:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references:x-gm-message-state;
	bh=5D3Xq89X+CUJupu8k/Q0XkmmIwxNbvXcHdlB8z+S0/Q=;
	b=hxsu+cBRzMmPBXfVXzH7QwUncPgPKh5e3pm4EMi/jAskbVdmgATSbPVtr2YEpOA/yu
	RRuweuXAeqs4ag3EAOB7cn23B9UcXhpfmOxOcsJkBPytY+70QlB0wolxyXoeLLNNyZUL
	RLX/dz2DJznOrqlwgYKkLCy43Z/sG9V/OW7GLdf98yLSFvxjHJQDUBOeLq5Vy+hqCXuS
	SU40w1ElKRm82EpTfTIZoAQTrjuKMU/ypWzWodfgYq0fUzQZY3TvGi5+YL6sG75Wsf/Y
	FK+1GdLhfvD6yjpiY0TgnOVeWJAxkvRoWONGenGQn+vGnuu4eLSCSLdU97CFWuroAmvk
	dZ0Q==
X-Received: by 10.194.11.70 with SMTP id o6mr17184278wjb.29.1364316798846;
	Tue, 26 Mar 2013 09:53:18 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id bk1sm4522670wib.2.2013.03.26.09.53.17
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 26 Mar 2013 09:53:18 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Mar 2013 16:50:10 +0000
Message-Id: <af2dc30ef30ece9caa1a2d4c8e68a5aeefe0282a.1364316412.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1364316411.git.ross.burton@intel.com>
References: <cover.1364316411.git.ross.burton@intel.com>
In-Reply-To: <cover.1364316411.git.ross.burton@intel.com>
References: <cover.1364316411.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQkvEL+fg+MmQURlVIaWjAoH3QBIEym84JNOV6SCVTGWuGNofwE5S9BCUeW2ahLJD5CnFIB5
Subject: [PATCH 12/24] systemd: check for systemctl first, and don't force systemd to be installed.
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
X-List-Received-Date: Tue, 26 Mar 2013 17:10:23 -0000

With both sysvinit and systemd features enabled these postinsts may actually run
on a target without systemd, so check that systemctl is present before using it.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/systemd.bbclass |   27 +++++++++++----------------
 1 file changed, 11 insertions(+), 16 deletions(-)

diff --git a/meta/classes/systemd.bbclass b/meta/classes/systemd.bbclass
index 564cd72..cca2152 100644
--- a/meta/classes/systemd.bbclass
+++ b/meta/classes/systemd.bbclass
@@ -24,19 +24,23 @@ if [ -n "$D" ]; then
     OPTS="--root=$D"
 fi
 
-systemctl $OPTS ${SYSTEMD_AUTO_ENABLE} ${SYSTEMD_SERVICE}
+if type systemctl >/dev/null; then
+	systemctl $OPTS ${SYSTEMD_AUTO_ENABLE} ${SYSTEMD_SERVICE}
 
-if [ -z "$D" -a "${SYSTEMD_AUTO_ENABLE}" = "enable" ]; then
-    systemctl start ${SYSTEMD_SERVICE}
+	if [ -z "$D" -a "${SYSTEMD_AUTO_ENABLE}" = "enable" ]; then
+		systemctl start ${SYSTEMD_SERVICE}
+	fi
 fi
 }
 
 systemd_prerm() {
-if [ -z "$D" ]; then
-    systemctl stop ${SYSTEMD_SERVICE}
-fi
+if type systemctl >/dev/null; then
+	if [ -z "$D" ]; then
+		systemctl stop ${SYSTEMD_SERVICE}
+	fi
 
-systemctl disable ${SYSTEMD_SERVICE}
+	systemctl disable ${SYSTEMD_SERVICE}
+fi
 }
 
 python systemd_populate_packages() {
@@ -56,14 +60,6 @@ python systemd_populate_packages() {
             bb.error('%s does not appear in package list, please add it' % pkg_systemd)
 
 
-    # Add a runtime dependency on systemd to pkg
-    def systemd_add_rdepends(pkg):
-        rdepends = d.getVar('RDEPENDS_' + pkg, True) or ""
-        if not 'systemd' in rdepends.split():
-            rdepends = '%s %s' % (rdepends, 'systemd')
-        d.setVar('RDEPENDS_' + pkg, rdepends)
-
-
     def systemd_generate_package_scripts(pkg):
         bb.debug(1, 'adding systemd calls to postinst/postrm for %s' % pkg)
 
@@ -156,7 +152,6 @@ python systemd_populate_packages() {
             systemd_check_package(pkg)
             if d.getVar('SYSTEMD_SERVICE_' + pkg, True):
                 systemd_generate_package_scripts(pkg)
-                systemd_add_rdepends(pkg)
         systemd_check_services()
 }
 
-- 
1.7.10.4



