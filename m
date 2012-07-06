Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1Sn73a-0007iN-Px
	for openembedded-core@lists.openembedded.org;
	Fri, 06 Jul 2012 13:50:42 +0200
Received: from mail-wi0-f178.google.com ([209.85.212.178])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 06 Jul 2012 04:39:35 -0700
Received: by wibhr14 with SMTP id hr14so521541wib.13
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Jul 2012 04:39:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:x-gm-message-state;
	bh=aK7i+cnj4TLNIgrxC2wgkfSszeH/oD/u1jIskounC2Y=;
	b=pyUonQPZDfiYK01JhcyM/AjWS2gLkX07kAOWqxWY983lzVY3GzhxG6jYke9a5J82pm
	ElOpCxe/2NnnMEoZf63ipLxPwe9/RGjML7n+iMnRQUEK/hd1jJHwXYmZ6s7aYGldjuK/
	w8C8P4Lh3RpbXh+XxD7YCp5Dfdtx2dOfHQ+h68vWEo9y4v7ZgxG06CjefNw2NRvEIIqc
	Q2gGJX3TElZx4jXB3tGyYcf5kCtEURZsJ2B05A0kqDSB0RmVrKmdlTMimwUGSWWjJ/o7
	Sr/MPMq7FCI3i5A8DKPZ+EVGzENJjBC1xdfXb2UoQal7djn96RWl32de/8xFcF/MRhIP
	BN2Q==
Received: by 10.216.225.23 with SMTP id y23mr9753851wep.67.1341574773774;
	Fri, 06 Jul 2012 04:39:33 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id df4sm5300627wib.4.2012.07.06.04.39.32
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 06 Jul 2012 04:39:33 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 Jul 2012 12:39:18 +0100
Message-Id: <e7d865a01ec2b7f0aaf8bfd38d1604e9c1764207.1341574354.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <cover.1341574354.git.ross.burton@intel.com>
References: <cover.1341574354.git.ross.burton@intel.com>
In-Reply-To: <cover.1341574354.git.ross.burton@intel.com>
References: <cover.1341574354.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQms2LVBLzy1a3LGTekxeEhUS3DcBb+H2IjYU/qYSUJNM7JdkMb7eRoi8HLwNzxsfyiV/87x
Subject: [PATCH 2/2] connman: ship the empty plugins directory in the connman package
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
X-List-Received-Date: Fri, 06 Jul 2012 11:50:43 -0000

Otherwise we get a QA warning that /usr/lib/connman/packages isn't shipped.
---
 meta/recipes-connectivity/connman/connman.inc |    5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/connman/connman.inc b/meta/recipes-connectivity/connman/connman.inc
index 73e7818..12378e9 100644
--- a/meta/recipes-connectivity/connman/connman.inc
+++ b/meta/recipes-connectivity/connman/connman.inc
@@ -20,7 +20,7 @@ DEPENDS  = "dbus glib-2.0 ppp iptables gnutls \
             ${@base_contains('DISTRO_FEATURES', '3g','ofono', '', d)} \
             "
 
-INC_PR = "r10"
+INC_PR = "r11"
 
 TIST = "--enable-tist"
 TIST_powerpc = ""
@@ -99,7 +99,7 @@ python populate_packages_prepend() {
 	hook = lambda file,pkg,b,c,d:packages.append((file,pkg))
 	plugin_dir = d.expand('${libdir}/connman/plugins/')
 	plugin_name = d.expand('${PN}-plugin-%s')
-	do_split_packages(d, plugin_dir, '^(.*).so$', plugin_name, '${PN} plugin for %s', extra_depends='', hook=hook )
+	do_split_packages(d, plugin_dir, '^(.*).so$', plugin_name, '${PN} plugin for %s', extra_depends='', hook=hook, prepend=True )
 	for (file, package) in packages:
 		plugintype = package.split( '-' )[-1]
 		if plugintype in depmap:
@@ -116,6 +116,7 @@ FILES_${PN}-tests = "${bindir}/*-test ${libdir}/${BPN}/test/*"
 RDEPENDS_${PN}-tests = "python-dbus"
 
 FILES_${PN} = "${bindir}/* ${sbindir}/* ${libexecdir}/* ${libdir}/lib*.so.* \
+            ${libdir}/connman/plugins \
             ${sysconfdir} ${sharedstatedir} ${localstatedir} \
             ${base_bindir}/* ${base_sbindir}/* ${base_libdir}/*.so* ${datadir}/${PN} \
             ${datadir}/dbus-1/system-services/*"
-- 
1.7.10



