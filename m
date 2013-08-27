Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 330B56BA9F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Aug 2013 07:07:46 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r7R77kpc005169
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Aug 2013 00:07:46 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.233) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Tue, 27 Aug 2013 00:07:46 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 27 Aug 2013 15:08:00 +0800
Message-ID: <e071a6a03a66f2765c8943e737de00215a9a4b7c.1377587203.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1377587203.git.Qi.Chen@windriver.com>
References: <cover.1377587203.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/4] runqemu-ifdown: clean up the remaining iptables rules
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
X-List-Received-Date: Tue, 27 Aug 2013 07:07:46 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

The iptables rules for the tap interface are added by runqemu-ifup
everytime we use runqemu to start a qemu target. But it's not cleaned
up when runqemu exits.

This patch cleans up the remaining iptables rules for the tap interface
in runqemu-ifdown.

[YOCTO #5047]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 scripts/runqemu-ifdown |   14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/scripts/runqemu-ifdown b/scripts/runqemu-ifdown
index 8b8c5a4..8f66cfa2 100755
--- a/scripts/runqemu-ifdown
+++ b/scripts/runqemu-ifdown
@@ -50,3 +50,17 @@ if [ ! -e "$TUNCTL" ]; then
 fi
 
 $TUNCTL -d $TAP
+
+# cleanup the remaining iptables rules
+IPTABLES=`which iptables 2> /dev/null`
+if [ "x$IPTABLES" = "x" ]; then
+	IPTABLES=/sbin/iptables
+fi
+if [ ! -x "$IPTABLES" ]; then
+	echo "$IPTABLES cannot be executed"
+	exit 1
+fi
+n=$[ (`echo $TAP | sed 's/tap//'` * 2) + 1 ]
+dest=$[ (`echo $TAP | sed 's/tap//'` * 2) + 2 ]
+$IPTABLES -D POSTROUTING -t nat -j MASQUERADE -s 192.168.7.$n/32
+$IPTABLES -D POSTROUTING -t nat -j MASQUERADE -s 192.168.7.$dest/32
-- 
1.7.9.5


