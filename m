Return-Path: <gary@mlbassoc.com>
Received: from mail.chez-thomas.org (mail.mlbassoc.com [65.100.170.105])
	by mail.openembedded.org (Postfix) with ESMTP id 086EA6F33F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Feb 2014 17:11:47 +0000 (UTC)
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id 6D096F811EF; Mon, 24 Feb 2014 10:11:48 -0700 (MST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=unavailable version=3.3.2
Received: from zeus.chez-thomas.org (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id B61C2F811F5;
	Mon, 24 Feb 2014 10:11:44 -0700 (MST)
From: Gary Thomas <gary@mlbassoc.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 24 Feb 2014 10:11:48 -0700
Message-Id: <1393261909-14802-3-git-send-email-gary@mlbassoc.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1393261909-14802-1-git-send-email-gary@mlbassoc.com>
References: <1393261909-14802-1-git-send-email-gary@mlbassoc.com>
Cc: Gary Thomas <gary@mlbassoc.com>
Subject: [PATCH 2/3 v2] scripts/oe-setup-builddir: Keep track of TEMPLATECONF setting
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
X-List-Received-Date: Mon, 24 Feb 2014 17:11:51 -0000

Keeping track of the TEMPLATECONF variable in the build
tree will let this script produce the same output when
listing 'conf-notes.txt' every time the script is run,
regardless of whether or not TEMPLATECONF has been
provided by the user.

Note that the default value for TEMPLATECONF now comes from
an easily customizable file $OEROOT/.templateconf

Signed-off-by: Gary Thomas <gary@mlbassoc.com>
---
 scripts/oe-setup-builddir |   10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/scripts/oe-setup-builddir b/scripts/oe-setup-builddir
index a869fdc..e4356f1 100755
--- a/scripts/oe-setup-builddir
+++ b/scripts/oe-setup-builddir
@@ -37,7 +37,15 @@ fi
 
 cd "$BUILDDIR"
 
-TEMPLATECONF=${TEMPLATECONF:-meta/conf}
+if (test -f "$BUILDDIR/conf/templateconf.cfg") then
+    TEMPLATECONF=$(cat $BUILDDIR/conf/templateconf.cfg)
+fi
+
+source $OEROOT/.templateconf
+
+if ! (test -f "$BUILDDIR/conf/templateconf.cfg") then
+    echo "$TEMPLATECONF" >$BUILDDIR/conf/templateconf.cfg
+fi
 
 # 
 # $TEMPLATECONF can point to a directory for the template local.conf & bblayers.conf
-- 
1.7.9.5


