Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B55A16B5C7
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Aug 2013 08:09:00 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r7788uG9027703
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 7 Aug 2013 01:08:57 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.233) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Wed, 7 Aug 2013 01:08:56 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 7 Aug 2013 16:08:57 +0800
Message-ID: <3ea48b1c837fd67e81f367ff6943cae9f7fbeb33.1375862591.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1375862591.git.Qi.Chen@windriver.com>
References: <cover.1375862591.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Cc: clarson@kergoth.com, chen_q07@163.com
Subject: [PATCH V4 09/10] irda-utils: fix for read-only rootfs
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
X-List-Received-Date: Wed, 07 Aug 2013 08:09:00 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

The init script for irda writes configuration items to /etc/sysconfig/irda
if that file is not available in system. But it's actually not necessary,
the behavior doesn't change whether the init script writes to the file or not.

Considering it issues error messages in case of a read-only rootfs, I delete
the writing process.

[YOCTO #4103]
[YOCTO #4886]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../irda-utils/irda-utils-0.9.18/init              |   13 ++-----------
 1 file changed, 2 insertions(+), 11 deletions(-)

diff --git a/meta/recipes-connectivity/irda-utils/irda-utils-0.9.18/init b/meta/recipes-connectivity/irda-utils/irda-utils-0.9.18/init
index 63750f1..14efb94 100755
--- a/meta/recipes-connectivity/irda-utils/irda-utils-0.9.18/init
+++ b/meta/recipes-connectivity/irda-utils/irda-utils-0.9.18/init
@@ -13,7 +13,6 @@ module_id() {
 }
 
 if [ ! -f /etc/sysconfig/irda ]; then
-
     case `module_id` in
 	"HP iPAQ H2200" | "HP iPAQ HX4700" | "HTC Universal")
 	    IRDA=yes
@@ -28,18 +27,10 @@ if [ ! -f /etc/sysconfig/irda ]; then
 	    DISCOVERY=
 	    ;;
     esac
-
-    mkdir -p /etc/sysconfig
-    echo "IRDA=$IRDA" > /etc/sysconfig/irda
-    if [ $IRDA = "yes" ]; then
-	echo "DEVICE=$DEVICE" >> /etc/sysconfig/irda
-	echo "DONGLE=$DONGLE" >> /etc/sysconfig/irda
-	echo "DISCOVERY=$DISCOVERY" >> /etc/sysconfig/irda
-    fi
+else
+    . /etc/sysconfig/irda
 fi
 
-. /etc/sysconfig/irda
-
 # Check that irda is up.
 [ ${IRDA} = "no" ] && exit 0
 
-- 
1.7.9.5


