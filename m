Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web12.5734.1594192604983709751
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jul 2020 00:16:45 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: changqing.li@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 0687GC3A026528
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Wed, 8 Jul 2020 00:16:33 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
 14.3.487.0; Wed, 8 Jul 2020 00:16:25 -0700
From: "Changqing Li" <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] gtk-icon-cache.bbclass: add features_check
Date: Wed, 8 Jul 2020 15:13:31 +0800
Message-ID: <20200708071331.3449720-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

'bitbake world -k' when DISTRO_FEATURES don't have x11 and wayland,
report errors:
Nothing PROVIDES 'gtk+3'
Nothing RPROVIDES 'blueman'

gtk+3 set ANY_OF_DISTRO_FEATURES, so add it here too
since we DEPENDS on it

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/classes/gtk-icon-cache.bbclass | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/classes/gtk-icon-cache.bbclass b/meta/classes/gtk-icon-cache.bbclass
index dd394af27c..340a283851 100644
--- a/meta/classes/gtk-icon-cache.bbclass
+++ b/meta/classes/gtk-icon-cache.bbclass
@@ -1,5 +1,10 @@
 FILES_${PN} += "${datadir}/icons/hicolor"
 
+#gtk+3 reqiure GTK3DISTROFEATURES, DEPENDS on it make all the
+#recipes inherit this class require GTK3DISTROFEATURES
+inherit features_check
+ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
+
 DEPENDS +=" ${@['hicolor-icon-theme', '']['${BPN}' == 'hicolor-icon-theme']} \
             ${@['gdk-pixbuf', '']['${BPN}' == 'gdk-pixbuf']} \
             ${@['gtk+3', '']['${BPN}' == 'gtk+3']} \
-- 
2.26.2

