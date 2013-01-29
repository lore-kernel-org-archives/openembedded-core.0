Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Qi.Chen@windriver.com>) id 1U07KL-0001KE-1i
	for openembedded-core@lists.openembedded.org;
	Tue, 29 Jan 2013 10:18:05 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r0T92K0e004838
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Jan 2013 01:02:20 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.163.154) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.318.4; Tue, 29 Jan 2013 01:02:20 -0800
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 29 Jan 2013 17:02:40 +0800
Message-ID: <5e787fa57650088573366333c26deb9c463bfe6f.1359449833.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1359449833.git.Qi.Chen@windriver.com>
References: <cover.1359449833.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 1/1] rootfs_rpm.bbclass: fix a bug in run-postinst script
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 29 Jan 2013 09:18:10 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

This is a follow-up patch which fixes a bug introduced by the
commit bd10a6d257ab5ce2fc961788c278af7c43637404.

The `` command substitution characters should be excaped by \ to make
things work correctly.

[YOCTO #3767]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/classes/rootfs_rpm.bbclass |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/rootfs_rpm.bbclass b/meta/classes/rootfs_rpm.bbclass
index accd7d9..119bf92 100644
--- a/meta/classes/rootfs_rpm.bbclass
+++ b/meta/classes/rootfs_rpm.bbclass
@@ -108,7 +108,7 @@ fakeroot rootfs_rpm_do_rootfs () {
 	i=\$i
 	cat > ${IMAGE_ROOTFS}${sysconfdir}/rcS.d/S${POSTINSTALL_INITPOSITION}run-postinsts << EOF
 #!/bin/sh
-for i in `ls /etc/rpm-postinsts/`; do
+for i in \`ls /etc/rpm-postinsts/\`; do
 	i=/etc/rpm-postinsts/$i
 	echo "Running postinst $i..."
 	if [ -f $i ] && $i; then
-- 
1.7.9.5



