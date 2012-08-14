Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1T1Jt6-0008PH-UU
	for openembedded-core@lists.openembedded.org;
	Tue, 14 Aug 2012 18:22:37 +0200
Received: from mail-wi0-f170.google.com ([209.85.212.170])
	by mga03.intel.com with ESMTP/TLS/RC4-SHA; 14 Aug 2012 09:10:39 -0700
Received: by wibhq12 with SMTP id hq12so4057933wib.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Aug 2012 09:10:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=RDtCcWY3So2Ch2S3OGZprGou9THiiix0eCn/pcxmq0I=;
	b=pwiCZoqkKkw2MOP2TNxugEzjlr4tOFyFjs106jsg74XHUsO5Rnjio4seHKF1UKUh1g
	CaI7VIDY4NJi9pm6YS+qE3q+gZjSqryr+yKNS2rp7JfLsREg7rL3O0IARi5Pu8rDIGNC
	CislKIoSvuCUdzhiaslcO0WT4HjFk5cp+4rAgsWnwLm4E//YcXLFASi/t5xo1Fknu6Z2
	zAA+AfC9Xrf0MymwmhpLlHs+RR/I9mcnXC/LsEzvb1VTW6ulEka8rXvHN5EzdY6iObSL
	jgUrkPn3FWG7UF1DKCO8rlqIjnA4hMcoYEbPeCte6qFX/TVNjtwHryMQuiDJ7HaoEzc3
	IGew==
Received: by 10.180.97.106 with SMTP id dz10mr29023593wib.21.1344960637924;
	Tue, 14 Aug 2012 09:10:37 -0700 (PDT)
Received: from flashheart.burtonini.com ([83.217.123.106])
	by mx.google.com with ESMTPS id el6sm23121985wib.8.2012.08.14.09.10.36
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 14 Aug 2012 09:10:37 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Aug 2012 17:10:31 +0100
Message-Id: <1344960631-8817-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
X-Gm-Message-State: ALoCoQlB3ISB5vUMHdfN+SAWv9dtplOyJ3ENQ8t3oEkXc3bEnrPyY/0ya5s2qpKYmcyP1ZDPlKzO
Subject: [PATCH] classes: add gsettings.bbclass
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
X-List-Received-Date: Tue, 14 Aug 2012 16:22:37 -0000

This class registers postinst/postrm hooks to compile the GSetting schemas, and
adds the relevant dependencies.  If possible the postinst happens on the host to
avoid running it on the target.

[ YOCTO #2798 ]
---
 meta/classes/gsettings.bbclass |   37 +++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 meta/classes/gsettings.bbclass

diff --git a/meta/classes/gsettings.bbclass b/meta/classes/gsettings.bbclass
new file mode 100644
index 0000000..1e3f7a1
--- /dev/null
+++ b/meta/classes/gsettings.bbclass
@@ -0,0 +1,37 @@
+# A bbclass to handle installed GSettings (glib) schemas, updated the compiled
+# form on package install and remove.
+#
+# The compiled schemas are platform-agnostic, so we can depend on
+# glib-2.0-native for the native tool and run the postinst script when the
+# rootfs builds to save a little time on first boot.
+
+# TODO use a trigger so that this runs once per package operation run
+
+DEPENDS += "glib-2.0-native"
+
+RDEPENDS_${PN} += "glib-2.0-utils"
+
+FILES_${PN} += "${datadir}/glib-2.0/schemas"
+
+gsettings_postinstrm () {
+	glib-compile-schemas $D${datadir}/glib-2.0/schemas
+}
+
+python populate_packages_append () {
+	pkg = d.getVar('PN', True)
+	bb.note("adding gsettings postinst scripts to %s" % pkg)
+
+	postinst = d.getVar('pkg_postinst_%s' % pkg, True) or d.getVar('pkg_postinst', True)
+	if not postinst:
+		postinst = '#!/bin/sh\n'
+	postinst += d.getVar('gsettings_postinstrm', True)
+	d.setVar('pkg_postinst_%s' % pkg, postinst)
+
+	bb.note("adding gsettings postrm scripts to %s" % pkg)
+
+	postrm = d.getVar('pkg_postrm_%s' % pkg, True) or d.getVar('pkg_postrm', True)
+	if not postrm:
+		postrm = '#!/bin/sh\n'
+	postrm += d.getVar('gsettings_postinstrm', True)
+	d.setVar('pkg_postrm_%s' % pkg, postrm)
+}
-- 
1.7.10.4



