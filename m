Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1S3MdT-0000cK-9V
	for openembedded-core@lists.openembedded.org;
	Fri, 02 Mar 2012 08:10:39 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q22727J4017148
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 1 Mar 2012 23:02:07 -0800 (PST)
Received: from build-PowerEdge-T100.corp.ad.wrs.com (128.224.163.66) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Thu, 1 Mar 2012 23:02:07 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 2 Mar 2012 15:02:01 +0800
Message-ID: <faf86eef0c803de04cb1a23041cce959a34ecee5.1330670625.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1330670625.git.liezhi.yang@windriver.com>
References: <cover.1330670625.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] Fix libpam's chmod
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
X-List-Received-Date: Fri, 02 Mar 2012 07:10:39 -0000
Content-Type: text/plain

The libpam's has an error when generating the rootfs:

chmod: cannot access `/usr/sbin/unix_chkpwd': No such file or directory

This is because the following code in libpam_1.1.5.bb:

pkg_postinst_pam-plugin-unix () {
    # below is necessary to allow unix_chkpwd get user info from shadow file
    # on lsb images
    chmod 4755 ${sbindir}/unix_chkpwd
}

This is to set the setuid permission for unix_chkpwd (the lsb test
requires this), but it lacks a "${D}", and we can do this in the install
stage.

[YOCTO #2049]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-extended/pam/libpam_1.1.5.bb |    7 ++-----
 1 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-extended/pam/libpam_1.1.5.bb b/meta/recipes-extended/pam/libpam_1.1.5.bb
index 283f477..8cddca9 100644
--- a/meta/recipes-extended/pam/libpam_1.1.5.bb
+++ b/meta/recipes-extended/pam/libpam_1.1.5.bb
@@ -85,10 +85,7 @@ do_install() {
 
 	install -d ${D}${sysconfdir}/pam.d/     
 	install -m 0644 ${WORKDIR}/pam.d/* ${D}${sysconfdir}/pam.d/
-}
 
-pkg_postinst_pam-plugin-unix () {
-    # below is necessary to allow unix_chkpwd get user info from shadow file
-    # on lsb images
-    chmod 4755 ${sbindir}/unix_chkpwd
+    # The lsb requires unix_chkpwd has setuid permission
+    chmod 4755 ${D}${sbindir}/unix_chkpwd
 }
-- 
1.7.4.1



