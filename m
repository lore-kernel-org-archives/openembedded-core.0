Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1SCQZJ-0008PU-Bn
	for openembedded-core@lists.openembedded.org;
	Tue, 27 Mar 2012 09:11:49 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q2R72ioo012666
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Mar 2012 00:02:44 -0700 (PDT)
Received: from usp-ub10.corp.ad.wrs.com (128.224.163.69) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Tue, 27 Mar 2012 00:02:44 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 27 Mar 2012 15:01:42 +0800
Message-ID: <88f002ce4cb394f9df1edea313f9c7338b1b155f.1332831633.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1332831633.git.liezhi.yang@windriver.com>
References: <cover.1332831633.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] contacts.inc: conditionally install shema
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 27 Mar 2012 07:11:49 -0000
Content-Type: text/plain

Install schema should respect to GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL,
If GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL is set, the schema should not
be installed, but it always installed shema before, this was incorrect
and it would cause host contamination since it would read
$HOME/gconf/.gconf.

[YOCTO #2178]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-sato/pimlico/contacts.inc             |    4 ++-
 .../contacts-conditionally-install-schema.patch    |   37 ++++++++++++++++++++
 2 files changed, 40 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-sato/pimlico/contacts/contacts-conditionally-install-schema.patch

diff --git a/meta/recipes-sato/pimlico/contacts.inc b/meta/recipes-sato/pimlico/contacts.inc
index 52c65ec..e3921d8 100644
--- a/meta/recipes-sato/pimlico/contacts.inc
+++ b/meta/recipes-sato/pimlico/contacts.inc
@@ -27,6 +27,8 @@ FILES_${PN} += "${datadir}/pixmaps/stock_contact.png \
 		${datadir}/icons/hicolor"
 
 SRC_URI = "file://stock_contact.png \
-           file://stock_person.png"
+           file://stock_person.png \
+           file://contacts-conditionally-install-schema.patch \
+          "
 
 SRC_URI_append_poky = " file://contacts-owl-window-menu.patch;apply=yes "
diff --git a/meta/recipes-sato/pimlico/contacts/contacts-conditionally-install-schema.patch b/meta/recipes-sato/pimlico/contacts/contacts-conditionally-install-schema.patch
new file mode 100644
index 0000000..2ab7882
--- /dev/null
+++ b/meta/recipes-sato/pimlico/contacts/contacts-conditionally-install-schema.patch
@@ -0,0 +1,37 @@
+Install schema should respect to GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL
+
+If GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL is set, the schema should not
+be installed.
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+
+Upstream-Status: Pending
+---
+ data/Makefile.am |    7 ++++---
+ 1 files changed, 4 insertions(+), 3 deletions(-)
+
+diff --git a/data/Makefile.am b/data/Makefile.am
+index f790823..b6fd643 100644
+--- a/data/Makefile.am
++++ b/data/Makefile.am
+@@ -14,13 +14,14 @@ dist_man1_MANS = contacts.1
+ 
+ if HAVE_GCONF
+ install-data-local:
+-	GCONF_CONFIG_SOURCE=$(GCONF_SCHEMA_CONFIG_SOURCE) \
++	if [ "$(GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL)" != "1" ]; then \
++		GCONF_CONFIG_SOURCE=$(GCONF_SCHEMA_CONFIG_SOURCE) \
+ 		$(GCONFTOOL) --makefile-install-rule $(schema_DATA) || \
+ 		(echo ;\
+ 		echo "*****************************************************"; \
+ 		echo "Installation of schemas failed, install them manually"; \
+-		echo "*****************************************************";)
+-		@true
++		echo "*****************************************************";); \
++	fi
+ endif
+ 
+ CLEANFILES = $(desktop_DATA)
+-- 
+1.7.7.6
+
-- 
1.7.1



