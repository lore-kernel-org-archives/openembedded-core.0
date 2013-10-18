Return-Path: <Ming.Liu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id BDA776CD55
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Oct 2013 11:11:50 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r9IBBqMT015065
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Oct 2013 04:11:52 -0700 (PDT)
Received: from pek-lpgbuild1.wrs.com (128.224.153.21) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.347.0; Fri, 18 Oct 2013 04:11:52 -0700
From: Ming Liu <ming.liu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 18 Oct 2013 19:11:40 +0800
Message-ID: <1382094700-17805-3-git-send-email-ming.liu@windriver.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1382094700-17805-1-git-send-email-ming.liu@windriver.com>
References: <1382094700-17805-1-git-send-email-ming.liu@windriver.com>
MIME-Version: 1.0
Subject: [PATCH V3 3/3] bash: add pkg_postrm to remove the entry in /etc/shells
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
X-List-Received-Date: Fri, 18 Oct 2013 11:11:50 -0000
Content-Type: text/plain

Signed-off-by: Ming Liu <ming.liu@windriver.com>
---
 meta/recipes-extended/bash/bash.inc |   18 +++++++++++++++---
 1 files changed, 15 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/bash/bash.inc b/meta/recipes-extended/bash/bash.inc
index 64b476f..7c18f37 100644
--- a/meta/recipes-extended/bash/bash.inc
+++ b/meta/recipes-extended/bash/bash.inc
@@ -44,7 +44,19 @@ do_install_ptest () {
 }
 
 pkg_postinst_${PN} () {
-	touch $D${sysconfdir}/shells
-	grep -q "bin/bash" $D${sysconfdir}/shells || echo /bin/bash >> $D${sysconfdir}/shells
-	grep -q "bin/sh" $D${sysconfdir}/shells || echo /bin/sh >> $D${sysconfdir}/shells
+	if [ ! -f $D${sysconfdir}/shells ]; then
+		touch $D${sysconfdir}/shells
+	fi
+
+	grep -q "^${base_bindir}/bash$" $D${sysconfdir}/shells || echo ${base_bindir}/bash >> $D${sysconfdir}/shells
+}
+
+pkg_postrm_${PN} () {
+	if [ -f $D${sysconfdir}/shells ]; then
+		printf "$(grep -v "^${base_bindir}/bash$" $D${sysconfdir}/shells)\n" > $D${sysconfdir}/shells
+
+		if [ ! -s $D${sysconfdir}/shells ]; then
+			rm $D${sysconfdir}/shells
+		fi
+	fi
 }
-- 
1.7.1


