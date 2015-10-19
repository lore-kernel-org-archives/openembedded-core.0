Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0C29477046
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Oct 2015 03:16:07 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t9J3G7ZU020964
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 18 Oct 2015 20:16:07 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.211) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Sun, 18 Oct 2015 20:16:06 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 19 Oct 2015 11:16:40 +0800
Message-ID: <9a2f02ae5505b4c9cbfa0ba502cbcd6db2c0b803.1445224515.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1445224515.git.Qi.Chen@windriver.com>
References: <cover.1445224515.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] openssh: fix file permission for /etc/pam.d/sshd
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
X-List-Received-Date: Mon, 19 Oct 2015 03:16:10 -0000
Content-Type: text/plain

The file permission should be 0644 instead of 0755.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-connectivity/openssh/openssh_7.1p1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/openssh/openssh_7.1p1.bb b/meta/recipes-connectivity/openssh/openssh_7.1p1.bb
index eeeb4b4..40938cc 100644
--- a/meta/recipes-connectivity/openssh/openssh_7.1p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_7.1p1.bb
@@ -87,7 +87,7 @@ do_compile_ptest() {
 
 do_install_append () {
 	if [ "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam', '', d)}" = "pam" ]; then
-		install -D -m 0755 ${WORKDIR}/sshd ${D}${sysconfdir}/pam.d/sshd
+		install -D -m 0644 ${WORKDIR}/sshd ${D}${sysconfdir}/pam.d/sshd
 		sed -i -e 's:#UsePAM no:UsePAM yes:' ${WORKDIR}/sshd_config ${D}${sysconfdir}/ssh/sshd_config
 	fi
 
-- 
1.9.1


