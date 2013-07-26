Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id C1FF56B21B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jul 2013 07:39:44 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r6Q7djje024589
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jul 2013 00:39:46 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.233) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Fri, 26 Jul 2013 00:39:45 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 26 Jul 2013 15:39:34 +0800
Message-ID: <8c71c4fc4bb4853341bb51433ce727750fa6fb61.1374642547.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1374642547.git.Qi.Chen@windriver.com>
References: <cover.1374642547.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Cc: Zhangle.Yang@windriver.com
Subject: [PATCH 7/9] irda-utils: make /etc/sysconfig writable in read-only rootfs
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
X-List-Received-Date: Fri, 26 Jul 2013 07:39:44 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

This diretory needs to be writable, the following error will appear
at system start-up.

   /etc/rc5.d/S20irattach: /etc/sysconfig/irda: Read-only file system

[YOCTO #4103]
[YOCTO #4886]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../irda-utils/irda-utils_0.9.18.bb                |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-connectivity/irda-utils/irda-utils_0.9.18.bb b/meta/recipes-connectivity/irda-utils/irda-utils_0.9.18.bb
index 575b0b1..4c8723e 100644
--- a/meta/recipes-connectivity/irda-utils/irda-utils_0.9.18.bb
+++ b/meta/recipes-connectivity/irda-utils/irda-utils_0.9.18.bb
@@ -37,4 +37,8 @@ do_install () {
 
 	install -d ${D}${sysconfdir}/init.d
 	install -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/${INITSCRIPT_NAME}
+
+	# Create config files for read-only rootfs
+	install -d ${D}${sysconfdir}/default/readonly
+	echo "/etc/sysconfig /var/volatile/etc/sysconfig" > ${D}${sysconfdir}/default/readonly/irda-utils
 }
-- 
1.7.9.5


