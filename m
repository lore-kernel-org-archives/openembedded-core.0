Return-Path: <psaavedra@igalia.com>
X-Greylist: delayed 1288 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 27 Nov 2017 10:56:48 UTC
Received: from fanzine.igalia.com (fanzine.igalia.com [91.117.99.155])
	by mail.openembedded.org (Postfix) with ESMTP id ACE6577F76
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Nov 2017 10:56:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Message-Id:Date:Subject:Cc:To:From;
	bh=hgvvbl7E090IlYwVeEADRSpuG0Qr+amjfYPyu0mRKEE=; 
	b=TU0CDyAii0H6vZs1evCk25f3MUbcJpynKpdFeKrk3Rp5wZWfV2ZKzKfjF29e4J0alH4e2422BORkhUhNnziOv+GM1T/kqUpGvZYyCq6I7V4LhFNTwSx0EfRESGUx2JIjtPs4G9qWPW6orhBSqKijwUvNkTWK9NlII5/h6vg3DfZTHhxpY1XevoBng+vmYDmCDyOa/eNhvb5McOOO90ocJ1nD+7wjX3yIaWdPCfPXtP66DnDhYTT0zgrPWUTbNv7FR/k1Lgv9153YL18d67dut6/LlX85EtbRVbLHdgDjwAYcSxWNsMTMUhmz+DGdKgubeu689OSaa+lT7/IzrII1iw==;
Received: from [192.168.10.187] (helo=localhost.localdomain)
	by fanzine.igalia.com with esmtpsa 
	(Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
	id 1eJGkz-00089A-1l; Mon, 27 Nov 2017 11:35:21 +0100
From: Pablo Saavedra <psaavedra@igalia.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 27 Nov 2017 11:35:17 +0100
Message-Id: <20171127103517.6845-1-psaavedra@igalia.com>
X-Mailer: git-send-email 2.11.0
Cc: Pablo Saavedra <psaavedra@igalia.com>
Subject: [PATCH] puppet: add recipe for puppet 4.10.9
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
X-List-Received-Date: Mon, 27 Nov 2017 10:56:49 -0000

Added Yocto recipe for Puppet 4.10.9

Signed-off-by: Pablo Saavedra <psaavedra@igalia.com>
---
 recipes-support/puppet/puppet_4.10.9.bb | 41 +++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 recipes-support/puppet/puppet_4.10.9.bb

diff --git a/recipes-support/puppet/puppet_4.10.9.bb b/recipes-support/puppet/puppet_4.10.9.bb
new file mode 100644
index 0000000..a335546
--- /dev/null
+++ b/recipes-support/puppet/puppet_4.10.9.bb
@@ -0,0 +1,41 @@
+SUMMARY = "Open source Puppet is a configuration management system"
+HOMEPAGE = "https://puppetlabs.com/puppet/puppet-open-source"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=7c9045ec00cc0d6b6e0e09ee811da4a0"
+
+SRC_URI = " \
+    https://downloads.puppetlabs.com/puppet/puppet-${PV}.tar.gz \
+    file://add_puppet_gemspec.patch \
+    file://puppet.conf \
+"
+SRC_URI[md5sum] = "8af3c2fec5dc4683d80aab4efc1614c6"
+SRC_URI[sha256sum] = "e667bd825e54bbc38c30534c25adc441ed638fc484fe0abe278f0335770cd161"
+
+inherit ruby
+
+DEPENDS += " \
+        ruby \
+        facter \
+        hiera \
+"
+
+RDEPENDS_${PN} += " \
+        ruby \
+        facter \
+        hiera \
+        ruby-shadow \
+        bash \
+"
+
+RUBY_INSTALL_GEMS = "puppet-${PV}.gem"
+
+do_install_append() {
+    install -d ${D}${sysconfdir}/puppet
+    install -d ${D}${sysconfdir}/puppet/manifests
+    install -d ${D}${sysconfdir}/puppet/modules
+
+    install -m 655 ${S}/conf/auth.conf ${D}${sysconfdir}/puppet/
+    install -m 655 ${S}/conf/fileserver.conf ${D}${sysconfdir}/puppet/
+    install -m 655 ${S}/conf/environment.conf ${D}${sysconfdir}/puppet/
+    install -m 655 ${WORKDIR}/puppet.conf ${D}${sysconfdir}/puppet/
+}
-- 
2.11.0


