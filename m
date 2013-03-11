Received: from mail-da0-f51.google.com ([209.85.210.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UF9HG-0002tl-5c
	for openembedded-core@lists.openembedded.org;
	Mon, 11 Mar 2013 21:25:03 +0100
Received: by mail-da0-f51.google.com with SMTP id z17so971267dal.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Mar 2013 13:08:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references:x-gm-message-state;
	bh=HytgPguBHIWznTA8otX3SiwNcu2YQMi3gTCdLlm92Fw=;
	b=iO+zt7z5C2a72fkZH+QDw2Kg0JXZANtl6kLl96A/IIbqnQnMDWhJWLvxlzqnr4Zsc1
	/zR0zyMmpWcxUhm1pIWpJ3Pv+Wm2nbXOl5Hh1wggKxr32DuHLQ/GQalxEaL2Hdl/ZIbG
	DDX74sg06FCQvtgsRVfhkvOwwrTd1caYUZrUNKpdxcylJAVlBYv+QjhBowxFlT5+0J0w
	AisAq1gCO1leNCctCuAXNzfDFLbZSX0/hcd/tWxDMqx1ucDvhpf8yfbkQhEHOodHdI+8
	QGu3aeQW3IGUj9xyJyhBzAm+SQM2mrIk9lj/WXaZajb0OmBqfUVGGIxMIJ5k+yvAJanf
	yDQg==
X-Received: by 10.68.189.8 with SMTP id ge8mr31758931pbc.166.1363032498604;
	Mon, 11 Mar 2013 13:08:18 -0700 (PDT)
Received: from flashheart.burtonini.com (or-67-237-97-32.sta.embarqhsd.net.
	[67.237.97.32])
	by mx.google.com with ESMTPS id eh5sm21700910pbc.44.2013.03.11.13.08.12
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 11 Mar 2013 13:08:17 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Mar 2013 13:07:36 -0700
Message-Id: <4ad7ea263a05fb3c1960623760340549a20c849c.1363031776.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1363031776.git.ross.burton@intel.com>
References: <cover.1363031776.git.ross.burton@intel.com>
In-Reply-To: <cover.1363031776.git.ross.burton@intel.com>
References: <cover.1363031776.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQlT42uJcvrZfXVPcI0skZoBuiaDnPaQNHTHbKnpKE8CxGQHyIdFd15cQP1Uvc1ey2ME7UQa
Subject: [PATCH 6/9] systemd: allow postinsts to run without systemd being present
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
X-List-Received-Date: Mon, 11 Mar 2013 20:25:33 -0000

These fragments may be used on a system that didn't actually boot with systemd,
so check for systemctl first, and don't force systemd to be installed.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/systemd.bbclass |   27 +++++++++++----------------
 1 file changed, 11 insertions(+), 16 deletions(-)

diff --git a/meta/classes/systemd.bbclass b/meta/classes/systemd.bbclass
index 564cd72..f622f9c 100644
--- a/meta/classes/systemd.bbclass
+++ b/meta/classes/systemd.bbclass
@@ -24,19 +24,23 @@ if [ -n "$D" ]; then
     OPTS="--root=$D"
 fi
 
-systemctl $OPTS ${SYSTEMD_AUTO_ENABLE} ${SYSTEMD_SERVICE}
+if which systemctl >/dev/null; then
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
+if which systemctl >/dev/null; then
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



