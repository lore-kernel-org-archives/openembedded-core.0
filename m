Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 835A065E1A
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Sep 2014 06:35:33 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s896ZYU8005086
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 8 Sep 2014 23:35:35 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.187) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Mon, 8 Sep 2014 23:35:34 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 9 Sep 2014 14:35:48 +0800
Message-ID: <aad5305342e10b8fdbf9f7fab8a07dab65412255.1410244514.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1410244514.git.Qi.Chen@windriver.com>
References: <cover.1410244514.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/6] udev: fix unsafe reference by installing libgudev in libdir
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
X-List-Received-Date: Tue, 09 Sep 2014 06:35:33 -0000
Content-Type: text/plain

From: Chen Qi <qi.chen@windriver.com>

[CQID: WIND00444742]

This patch fixes the following QA issue about unsafe reference in
binaries.

/lib/libgudev-1.0.so.0.1.1 requires /usr/lib/libgobject-2.0.so.0.

As libgudev is a GObject wrapper for libudev, and the purpose of
it is to make the development of GObject based applications easier,
there's no reason why it should remain in /lib. So this patches moves
the libgudev to /usr/lib.

This patch also removes a duplicate line in the EXTRA_OECONF.

(LOCAL REV: NOT UPSTREAM) -- Sent to oe-core on 20131113

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Joe MacDonald <joe.macdonald@windriver.com>
Signed-off-by: Joe MacDonald <joe@deserted.net>
---
 meta/recipes-core/udev/udev.inc | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/udev/udev.inc b/meta/recipes-core/udev/udev.inc
index 280da10..cb6279f 100644
--- a/meta/recipes-core/udev/udev.inc
+++ b/meta/recipes-core/udev/udev.inc
@@ -42,7 +42,6 @@ EXTRA_OECONF = "--disable-introspection \
                 ac_cv_file__usr_share_misc_pci_ids=yes \
                 --sbindir=${base_sbindir} \
                 --libexecdir=${nonarch_base_libdir} \
-                --with-rootlibdir=${base_libdir} \
                 --with-rootprefix= \
                 --without-systemdsystemunitdir \
                "
@@ -92,6 +91,13 @@ do_install_append () {
 	# hid2hci has moved to bluez4. removed in udev as of version 169
 	rm -f ${D}${base_libdir}/udev/hid2hci
 
+	if [ "${libdir}" != "${base_libdir}" ]; then
+	    # install libgudev.so.* into libdir.
+	    so_img_name=`basename $(readlink ${D}${libdir}/libgudev-1.0.so)`
+	    mv ${D}${base_libdir}/libgudev-1.0.so.* ${D}${libdir}
+	    ln -sf $so_img_name ${D}${libdir}/libgudev-1.0.so
+	fi
+
 	echo 'udev_run="/var/run/udev"' >> ${D}${sysconfdir}/udev/udev.conf
 }
 
-- 
1.9.1


