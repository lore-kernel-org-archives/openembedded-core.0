Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id F0D3B7713D
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Jun 2018 07:50:37 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w577odPZ023976
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 7 Jun 2018 00:50:39 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.218) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.399.0; Thu, 7 Jun 2018 00:50:38 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 7 Jun 2018 15:52:47 +0800
Message-ID: <3afd66f7ab09914a3717995d51de83e88f376d20.1528357628.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1528357628.git.Qi.Chen@windriver.com>
References: <cover.1528357628.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] runqemu-ifdown: ensure to clean up TAP
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
X-List-Received-Date: Thu, 07 Jun 2018 07:50:38 -0000
Content-Type: text/plain

In runqemu-ifup, ip command is used to add TAP; in runqemu-ifdown,
we should do the reversed logic, using ip command to delete TAP, to
make sure TAP is cleaned up by ourselves.

I can see that in runqemu-ifdown script, 'tunctl -d' and 'iptables'
commands are used to deal with TAP, but these two commands cannot
make sure that the TAP is cleaned up.

runqemu-ifup uses 'ip' to set up TAP, we really need to do the opposite
in runqemu-ifdown.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 scripts/runqemu-ifdown | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/scripts/runqemu-ifdown b/scripts/runqemu-ifdown
index ffbc9de..2486968 100755
--- a/scripts/runqemu-ifdown
+++ b/scripts/runqemu-ifdown
@@ -51,6 +51,16 @@ fi
 
 $TUNCTL -d $TAP
 
+IFCONFIG=`which ip 2> /dev/null`
+if [ "x$IFCONFIG" = "x" ]; then
+	# better than nothing...
+	IFCONFIG=/sbin/ip
+fi
+if [ -x "$IFCONFIG" ]; then
+	if `$IFCONFIG link show $TAP > /dev/null 2>&1`; then
+		$IFCONFIG link del $TAP
+	fi
+fi
 # cleanup the remaining iptables rules
 IPTABLES=`which iptables 2> /dev/null`
 if [ "x$IPTABLES" = "x" ]; then
-- 
1.9.1


