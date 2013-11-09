Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id DD4B46D784
	for <openembedded-core@lists.openembedded.org>;
	Sat,  9 Nov 2013 05:29:00 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id rA95T31r025403
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 8 Nov 2013 21:29:03 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.213) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Fri, 8 Nov 2013 21:29:02 -0800
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sat, 9 Nov 2013 13:28:55 +0800
Message-ID: <f848a2ff5e5545b9e3f4b914677417359735f3e1.1383974819.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1383974819.git.Qi.Chen@windriver.com>
References: <cover.1383974819.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 5/8] udev: fix unsafe reference by installing libgudev in libdir
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
X-List-Received-Date: Sat, 09 Nov 2013 05:29:01 -0000
Content-Type: text/plain

From: Chen Qi <qi.chen@windriver.com>

This patch fixes the following QA issue about unsafe reference in
binaries.

/lib/libgudev-1.0.so.0.1.1 requires /usr/lib/libgobject-2.0.so.0.

As libgudev is a GObject wrapper for libudev, and the purpose of
it is to make the development of GObject based applications easier,
there's no reason why it should remain in /lib. So this patches moves
the libgudev to /usr/lib.

This patch also removes a duplicate line in the EXTRA_OECONF.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-core/udev/udev.inc |    6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/udev/udev.inc b/meta/recipes-core/udev/udev.inc
index 69ce123..5b926c3 100644
--- a/meta/recipes-core/udev/udev.inc
+++ b/meta/recipes-core/udev/udev.inc
@@ -39,7 +39,6 @@ EXTRA_OECONF = "--disable-introspection \
                 ac_cv_file__usr_share_misc_pci_ids=yes \
                 --sbindir=${base_sbindir} \
                 --libexecdir=${nonarch_base_libdir} \
-                --with-rootlibdir=${base_libdir} \
                 --with-rootprefix= \
                 --without-systemdsystemunitdir \
                "
@@ -97,6 +96,11 @@ do_install_append () {
 	# hid2hci has moved to bluez4. removed in udev as of version 169
 	rm -f ${D}${base_libdir}/udev/hid2hci
 
+	# install libgudev.so.* into libdir.
+	so_img_name=`basename $(readlink ${D}${libdir}/libgudev-1.0.so)`
+	mv ${D}${base_libdir}/libgudev-1.0.so.* ${D}${libdir}
+	ln -sf $so_img_name ${D}${libdir}/libgudev-1.0.so
+
 	echo 'udev_run="/var/run/udev"' >> ${D}${sysconfdir}/udev/udev.conf
 }
 
-- 
1.7.9.5


