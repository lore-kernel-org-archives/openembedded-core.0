Return-Path: <joshua.lock@collabora.co.uk>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [93.93.135.160])
	by mail.openembedded.org (Postfix) with ESMTP id 0346C77154
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Oct 2015 15:22:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: joshuagl) with ESMTPSA id 613AE60029B
From: Joshua Lock <joshua.lock@collabora.co.uk>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Oct 2015 16:21:47 +0100
Message-Id: <38567f910130f8559c2ba6935e0bfad61f6b1f4f.1445527096.git.joshua.lock@collabora.co.uk>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1445527096.git.joshua.lock@collabora.co.uk>
References: <cover.1445527096.git.joshua.lock@collabora.co.uk>
In-Reply-To: <cover.1445527096.git.joshua.lock@collabora.co.uk>
References: <cover.1445527096.git.joshua.lock@collabora.co.uk>
Subject: [PATCH v3 26/52] openssh: fix file permission for /etc/pam.d/sshd
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
X-List-Received-Date: Thu, 22 Oct 2015 15:22:24 -0000

From: Chen Qi <Qi.Chen@windriver.com>

The file permission should be 0644 instead of 0755.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
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
2.1.4


