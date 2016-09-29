Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id 085CE60557
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Sep 2016 01:27:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 06136208EA;
	Thu, 29 Sep 2016 01:27:39 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id YHCn0oTThzGR; Thu, 29 Sep 2016 01:27:38 +0000 (UTC)
Received: from gandalf.denix.org (pool-100-15-110-130.washdc.fios.verizon.net
	[100.15.110.130])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id CA16E20068;
	Thu, 29 Sep 2016 01:27:36 +0000 (UTC)
Received: from sam.denix (sam [192.168.0.5])
	by gandalf.denix.org (Postfix) with ESMTP id 4A34416211C;
	Wed, 28 Sep 2016 21:27:36 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 28 Sep 2016 21:27:35 -0400
Message-Id: <1475112455-7624-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [krogoth][PATCH] useradd: Fix infinite build loop
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
X-List-Received-Date: Thu, 29 Sep 2016 01:27:39 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

http://git.openembedded.org/openembedded-core-contrib/commit/?id=642c6cf0b6a0371de476513162bd0cefa9c438b3
introduces a problem if the USERADD_PARAM variable has trailing
whitespace as the code infinitely loops causing build hangs.

Add a similar sed expression to $remaining to avoid this.

(From OE-Core rev: d6241e4c94a0a72acfc57e96a59918c0b2146d65)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta/classes/useradd.bbclass | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/classes/useradd.bbclass b/meta/classes/useradd.bbclass
index 67dae88..28dd341 100644
--- a/meta/classes/useradd.bbclass
+++ b/meta/classes/useradd.bbclass
@@ -55,14 +55,14 @@ if test "x`echo $GROUPADD_PARAM | tr -d '[:space:]'`" != "x"; then
 	# Invoke multiple instances of groupadd for parameter lists
 	# separated by ';'
 	opts=`echo "$GROUPADD_PARAM" | cut -d ';' -f 1 | sed -e 's#[ \t]*$##'`
-	remaining=`echo "$GROUPADD_PARAM" | cut -d ';' -f 2-`
+	remaining=`echo "$GROUPADD_PARAM" | cut -d ';' -f 2- | sed -e 's#[ \t]*$##'`
 	while test "x$opts" != "x"; do
 		perform_groupadd "$SYSROOT" "$OPT $opts"
 		if test "x$opts" = "x$remaining"; then
 			break
 		fi
 		opts=`echo "$remaining" | cut -d ';' -f 1 | sed -e 's#[ \t]*$##'`
-		remaining=`echo "$remaining" | cut -d ';' -f 2-`
+		remaining=`echo "$remaining" | cut -d ';' -f 2- | sed -e 's#[ \t]*$##'`
 	done
 fi 
 
@@ -71,14 +71,14 @@ if test "x`echo $USERADD_PARAM | tr -d '[:space:]'`" != "x"; then
 	# Invoke multiple instances of useradd for parameter lists
 	# separated by ';'
 	opts=`echo "$USERADD_PARAM" | cut -d ';' -f 1 | sed -e 's#[ \t]*$##'`
-	remaining=`echo "$USERADD_PARAM" | cut -d ';' -f 2-`
+	remaining=`echo "$USERADD_PARAM" | cut -d ';' -f 2- | sed -e 's#[ \t]*$##'`
 	while test "x$opts" != "x"; do
 		perform_useradd "$SYSROOT" "$OPT $opts"
 		if test "x$opts" = "x$remaining"; then
 			break
 		fi
 		opts=`echo "$remaining" | cut -d ';' -f 1 | sed -e 's#[ \t]*$##'`
-		remaining=`echo "$remaining" | cut -d ';' -f 2-`
+		remaining=`echo "$remaining" | cut -d ';' -f 2- | sed -e 's#[ \t]*$##'`
 	done
 fi
 
@@ -87,14 +87,14 @@ if test "x`echo $GROUPMEMS_PARAM | tr -d '[:space:]'`" != "x"; then
 	# Invoke multiple instances of groupmems for parameter lists
 	# separated by ';'
 	opts=`echo "$GROUPMEMS_PARAM" | cut -d ';' -f 1 | sed -e 's#[ \t]*$##'`
-	remaining=`echo "$GROUPMEMS_PARAM" | cut -d ';' -f 2-`
+	remaining=`echo "$GROUPMEMS_PARAM" | cut -d ';' -f 2- | sed -e 's#[ \t]*$##'`
 	while test "x$opts" != "x"; do
 		perform_groupmems "$SYSROOT" "$OPT $opts"
 		if test "x$opts" = "x$remaining"; then
 			break
 		fi
 		opts=`echo "$remaining" | cut -d ';' -f 1 | sed -e 's#[ \t]*$##'`
-		remaining=`echo "$remaining" | cut -d ';' -f 2-`
+		remaining=`echo "$remaining" | cut -d ';' -f 2- | sed -e 's#[ \t]*$##'`
 	done
 fi
 }
-- 
2.7.4


