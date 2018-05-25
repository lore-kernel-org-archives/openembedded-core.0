Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9260374889
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 May 2018 02:42:06 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w4P2g7g6022156
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 May 2018 19:42:07 -0700 (PDT)
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.361.1; Thu, 24 May 2018 19:42:07 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 25 May 2018 10:48:23 +0800
Message-ID: <98279ee06e1843d8074add35ee3e865ce509c383.1527216285.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1527216285.git.liezhi.yang@windriver.com>
References: <cover.1527216285.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 18/24] shadow: update ownership and permission of /var/spool/mail
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
X-List-Received-Date: Fri, 25 May 2018 02:42:06 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Update shadow to change ownership of /var/spool/mail from root:root to
root:mail and permission from 0755 to 0775 just as in most popular
distributions such as fedora and debian(It also set setgid bit in debian
but we don't need it).

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-extended/shadow/shadow.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/shadow/shadow.inc b/meta/recipes-extended/shadow/shadow.inc
index 673207f..ca1facf 100644
--- a/meta/recipes-extended/shadow/shadow.inc
+++ b/meta/recipes-extended/shadow/shadow.inc
@@ -127,7 +127,8 @@ do_install_append() {
 	# Ensure that the image has as a /var/spool/mail dir so shadow can
 	# put mailboxes there if the user reconfigures shadow to its
 	# defaults (see sed below).
-	install -d ${D}${localstatedir}/spool/mail
+	install -m 0775 -d ${D}${localstatedir}/spool/mail
+	chown root:mail ${D}${localstatedir}/spool/mail
 
 	if [ -e ${WORKDIR}/pam.d ]; then
 		install -d ${D}${sysconfdir}/pam.d/
-- 
2.7.4


