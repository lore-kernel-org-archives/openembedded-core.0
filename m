Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 368E76D543
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Nov 2018 09:30:29 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id wAT9UUNH022927
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Nov 2018 01:30:30 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.163.141) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.408.0; Thu, 29 Nov 2018 01:30:29 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 29 Nov 2018 17:37:24 +0800
Message-ID: <75835e51f6c88a58056350759080d5c0004562b7.1543484174.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1543484174.git.Qi.Chen@windriver.com>
References: <cover.1543484174.git.Qi.Chen@windriver.com>
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
X-List-Received-Date: Thu, 29 Nov 2018 09:30:29 -0000
Content-Type: text/plain

We default hostname to ${MACHINE}, but it's not in /etc/hosts,
resulting in commands like `hostname -f' failing due to lack
of entry.

So add entry to /etc/hosts according to /etc/hostname. We do
this via pkg_postinst because hostname is set in base-files
recipe.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-core/netbase/netbase_5.4.bb | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/meta/recipes-core/netbase/netbase_5.4.bb b/meta/recipes-core/netbase/netbase_5.4.bb
index 5ab0c58..da9255a 100644
--- a/meta/recipes-core/netbase/netbase_5.4.bb
+++ b/meta/recipes-core/netbase/netbase_5.4.bb
@@ -23,3 +23,14 @@ do_install () {
 }
 
 CONFFILES_${PN} = "${sysconfdir}/hosts"
+
+RDEPENDS_${PN} += "base-files"
+
+pkg_postinst_${PN} () {
+	if [ -s $D${sysconfdir}/hostname ]; then
+		hostname=`cat $D${sysconfdir}/hostname`
+		if ! grep -q "[[:space:]]$hostname[[:space:]]*" $D${sysconfdir}/hosts; then
+			echo "127.0.1.1 $hostname" >> $D${sysconfdir}/hosts
+		fi
+	fi
+}
-- 
1.9.1


