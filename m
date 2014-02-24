Return-Path: <gary@mlbassoc.com>
Received: from mail.chez-thomas.org (mail.mlbassoc.com [65.100.170.105])
	by mail.openembedded.org (Postfix) with ESMTP id 447316B206
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Feb 2014 15:18:09 +0000 (UTC)
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id 19F71F811F0; Mon, 24 Feb 2014 08:18:11 -0700 (MST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=unavailable version=3.3.2
Received: from zeus.chez-thomas.org (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id A21EDF811F1;
	Mon, 24 Feb 2014 08:18:07 -0700 (MST)
From: Gary Thomas <gary@mlbassoc.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 24 Feb 2014 08:18:00 -0700
Message-Id: <1393255080-12382-3-git-send-email-gary@mlbassoc.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1393255080-12382-1-git-send-email-gary@mlbassoc.com>
References: <1393255080-12382-1-git-send-email-gary@mlbassoc.com>
Cc: Gary Thomas <gary@mlbassoc.com>
Subject: [PATCH 2/2] scripts/oe-setup-builddir: Keep track of TEMPLATECONF setting
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
X-List-Received-Date: Mon, 24 Feb 2014 15:18:11 -0000

Keeping track of the TEMPLATECONF variable in the build
tree will let this script produce the same output when
listing 'conf-notes.txt' every time the script is run,
regardless of whether or not TEMPLATECONF has been provided
by the user.

Signed-off-by: Gary Thomas <gary@mlbassoc.com>
---
 scripts/oe-setup-builddir |    8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/scripts/oe-setup-builddir b/scripts/oe-setup-builddir
index a869fdc..4322158 100755
--- a/scripts/oe-setup-builddir
+++ b/scripts/oe-setup-builddir
@@ -37,8 +37,16 @@ fi
 
 cd "$BUILDDIR"
 
+if (test -f "$BUILDDIR/conf/template.conf") then
+    TEMPLATECONF=$(cat $BUILDDIR/conf/template.conf)
+fi
+
 TEMPLATECONF=${TEMPLATECONF:-meta/conf}
 
+if ! (test -f "$BUILDDIR/conf/template.conf") then
+    echo "$TEMPLATECONF" >$BUILDDIR/conf/template.conf
+fi
+
 # 
 # $TEMPLATECONF can point to a directory for the template local.conf & bblayers.conf
 #
-- 
1.7.9.5


