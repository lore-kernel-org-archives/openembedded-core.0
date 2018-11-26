Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B56B46C0DC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Nov 2018 06:49:57 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id wAQ6nwL4007237
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 25 Nov 2018 22:49:58 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.163.141) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.408.0; Sun, 25 Nov 2018 22:49:57 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 26 Nov 2018 14:56:38 +0800
Message-ID: <5e62cfa7835011994fbfbd9b0f1cfd22b0b53bf3.1543215301.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1543215301.git.Qi.Chen@windriver.com>
References: <cover.1543215301.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] netbase: add entry to /etc/hosts according to /etc/hostname
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
X-List-Received-Date: Mon, 26 Nov 2018 06:49:57 -0000
Content-Type: text/plain

We default hostname to ${MACHINE}, but it's not in /etc/hosts,
resulting in commands like `hostname -f' failing due to lack
of entry.

So add entry to /etc/hosts according to /etc/hostname. We do
this via pkg_postinst because hostname is set in base-files
recipe.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-core/netbase/netbase_5.4.bb | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta/recipes-core/netbase/netbase_5.4.bb b/meta/recipes-core/netbase/netbase_5.4.bb
index 5ab0c58..384c430 100644
--- a/meta/recipes-core/netbase/netbase_5.4.bb
+++ b/meta/recipes-core/netbase/netbase_5.4.bb
@@ -23,3 +23,12 @@ do_install () {
 }
 
 CONFFILES_${PN} = "${sysconfdir}/hosts"
+
+RDEPENDS_${PN} += "base-files"
+
+pkg_postinst_${PN} () {
+	if [ -s $D/etc/hostname ]; then
+		hostname=`cat $D/etc/hostname`
+		echo "127.0.1.1 $hostname" >> $D/etc/hosts
+	fi
+}
-- 
1.9.1


