Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 9B6B56100B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Sep 2013 08:14:45 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r8D8Emvj003928
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Sep 2013 01:14:48 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Fri, 13 Sep 2013 01:14:46 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 13 Sep 2013 16:14:41 +0800
Message-ID: <575d09ea00809baeb03bee042e70711f4c70d81f.1379059861.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1379059861.git.hongxu.jia@windriver.com>
References: <cover.1379059861.git.hongxu.jia@windriver.com>
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
X-List-Received-Date: Fri, 13 Sep 2013 08:14:45 -0000
Content-Type: text/plain

The install_initd and remove_initd are linked to /sbin/chkconfig for lsb
core test, but chkconfig has been moved from /sbin to /usr/sbin in order
to fix QA warning about unsafe references in binaries.
(In commit e486242db83297701803866bea971a2f1a1135fe)

Let install_initd and remove_initd link to /usr/sbin/chkconfig could fix
this issue.

[YOCTO #5152]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-extended/lsb/lsb_4.1.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

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


