Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id CD3DB6A496
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Sep 2013 05:33:16 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r8D5XIWh015005
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Sep 2013 22:33:18 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Thu, 12 Sep 2013 22:33:16 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 13 Sep 2013 13:33:10 +0800
Message-ID: <772c186481bec298466fe249f6be7a661e7c6c7b.1379049723.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1379049723.git.hongxu.jia@windriver.com>
References: <cover.1379049723.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/4] LSB Command Check: fix install_initd and remove_initd not found
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
X-List-Received-Date: Fri, 13 Sep 2013 05:33:17 -0000
Content-Type: text/plain

The install_initd and remove_initd are linked to /sbin/chkconfig for lsb
core test, and chkconfig has been moved from /sbin to /usr/sbin in order
to fix QA warning about unsafe references in binaries.
(In commit e486242db83297701803866bea971a2f1a1135fe)

Let install_initd and remove_initd link to /usr/sbin/chkconfig could fix
this issue.

[YOCTO #5152]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-extended/chkconfig/chkconfig_1.3.58.bb | 4 ++--
 meta/recipes-extended/lsb/lsb_4.1.bb                | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-extended/chkconfig/chkconfig_1.3.58.bb b/meta/recipes-extended/chkconfig/chkconfig_1.3.58.bb
index c6f8b1d..38c3cdf 100644
--- a/meta/recipes-extended/chkconfig/chkconfig_1.3.58.bb
+++ b/meta/recipes-extended/chkconfig/chkconfig_1.3.58.bb
@@ -50,8 +50,8 @@ do_install() {
 
 do_install_append_linuxstdbase() {
 	install -d ${D}${libdir}/lsb/
-	ln -sf ${base_sbindir}/chkconfig ${D}/${libdir}/lsb/install_initd
-	ln -sf ${base_sbindir}/chkconfig ${D}/${libdir}/lsb/remove_initd
+	ln -sf ${sbindir}/chkconfig ${D}/${libdir}/lsb/install_initd
+	ln -sf ${sbindir}/chkconfig ${D}/${libdir}/lsb/remove_initd
 }
 
 PACKAGES =+ "${PN}-alternatives ${PN}-alternatives-doc"
diff --git a/meta/recipes-extended/lsb/lsb_4.1.bb b/meta/recipes-extended/lsb/lsb_4.1.bb
index 59d5bca..c80ff59 100644
--- a/meta/recipes-extended/lsb/lsb_4.1.bb
+++ b/meta/recipes-extended/lsb/lsb_4.1.bb
@@ -79,8 +79,8 @@ do_install_append(){
 
        # creat links for LSB test
        install -d ${D}/${libdir}/lsb
-       ln -sf ${base_sbindir}/chkconfig ${D}/${libdir}/lsb/install_initd
-       ln -sf ${base_sbindir}/chkconfig ${D}/${libdir}/lsb/remove_initd
+       ln -sf ${sbindir}/chkconfig ${D}/${libdir}/lsb/install_initd
+       ln -sf ${sbindir}/chkconfig ${D}/${libdir}/lsb/remove_initd
        ln -sf ${sbindir}/sendmail ${D}/${libdir}/sendmail
 
        if [ "${TARGET_ARCH}" = "x86_64" ];then
-- 
1.8.1.2


