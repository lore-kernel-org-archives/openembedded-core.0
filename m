Return-Path: <anibal.limon@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id AE7FF734B8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Aug 2015 14:48:15 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga102.fm.intel.com with ESMTP; 26 Aug 2015 07:48:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,416,1437462000"; d="scan'208";a="755816360"
Received: from hmsaaved-mobl.amr.corp.intel.com (HELO
	alimon-ThinkPad-W540.amr.corp.intel.com) ([10.252.197.19])
	by orsmga001.jf.intel.com with ESMTP; 26 Aug 2015 07:48:14 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 26 Aug 2015 09:48:18 -0500
Message-Id: <1440600498-10313-1-git-send-email-anibal.limon@linux.intel.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] runqemu-internal: Fixes unary operator expected in new TCPSERIAL_PORTNUM
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
X-List-Received-Date: Wed, 26 Aug 2015 14:48:16 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

If $TCPSERIAL_PORTNUM is empty string causes an error because
expands the expresion to,

$TCPSERIAL_PORTNUM == "" -> == ""

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 scripts/runqemu-internal | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/runqemu-internal b/scripts/runqemu-internal
index b317358..1b1bc9e 100755
--- a/scripts/runqemu-internal
+++ b/scripts/runqemu-internal
@@ -620,7 +620,7 @@ if [ "x$QEMUOPTIONS" = "x" ]; then
     return 1
 fi
 
-if [ $TCPSERIAL_PORTNUM != "" ]; then
+if [ "$TCPSERIAL_PORTNUM" != "" ]; then
     if [ "$MACHINE" = "qemuarm64" ]; then
         QEMUOPTIONS="$QEMUOPTIONS -device virtio-serial-device -chardev socket,id=virtcon,port=$TCPSERIAL_PORTNUM,host=127.0.0.1 -device virtconsole,chardev=virtcon"
     else
-- 
1.9.1


