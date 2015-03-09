Return-Path: <Rob.Woolley@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 73DA573970
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Mar 2015 23:53:02 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t29Nr1oJ001267
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 9 Mar 2015 16:53:02 -0700 (PDT)
Received: from yow-rwoolley-lx.wrs.com (128.224.20.140) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.224.2; Mon, 9 Mar 2015 16:53:01 -0700
From: Rob Woolley <rob.woolley@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 9 Mar 2015 19:52:56 -0400
Message-ID: <1425945178-14806-2-git-send-email-rob.woolley@windriver.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1425945178-14806-1-git-send-email-rob.woolley@windriver.com>
References: <1425945178-14806-1-git-send-email-rob.woolley@windriver.com>
MIME-Version: 1.0
Subject: [PATCH v2 1/3] nfs-utils: Install nfsmount.conf
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
X-List-Received-Date: Mon, 09 Mar 2015 23:53:03 -0000
Content-Type: text/plain

The file nfsmount.conf is present in nfs-utils but not installed to the 
filesystem.  It has been added to nfs-utils-client as it seemed to be 
missing accidentally rather than being removed intentionally.  The binary
files in nfs-utils-client have a hard-coded reference to it and we 
already provide the manpage for it in nfs-utils-doc.

Signed-off by: Rob Woolley <rob.woolley@windriver.com>
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_1.3.1.bb b/meta/recipes-connectivity/nfs-utils/nfs-utils_1.3.1.bb
index e4655d9..1439063 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils_1.3.1.bb
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_1.3.1.bb
@@ -73,6 +73,7 @@ FILES_${PN}-client = "${base_sbindir}/*mount.nfs* ${sbindir}/*statd \
 		      ${sbindir}/showmount ${sbindir}/nfsstat \
 		      ${localstatedir}/lib/nfs \
 		      ${sysconfdir}/nfs-utils.conf \
+		      ${sysconfdir}/nfsmount.conf \
 		      ${sysconfdir}/init.d/nfscommon \
 		      ${systemd_unitdir}/system/nfs-statd.service"
 FILES_${PN}-stats = "${sbindir}/mountstats ${sbindir}/nfsiostat"
@@ -90,6 +91,8 @@ do_install_append () {
 	install -m 0755 ${WORKDIR}/nfscommon ${D}${sysconfdir}/init.d/nfscommon
 
 	install -m 0755 ${WORKDIR}/nfs-utils.conf ${D}${sysconfdir}
+	install -m 0755 ${S}/utils/mount/nfsmount.conf ${D}${sysconfdir}
+
 	install -d ${D}${systemd_unitdir}/system
 	install -m 0644 ${WORKDIR}/nfs-server.service ${D}${systemd_unitdir}/system/
 	install -m 0644 ${WORKDIR}/nfs-mountd.service ${D}${systemd_unitdir}/system/

