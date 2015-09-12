Return-Path: <Nathan_Lynch@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 2E7B26E630
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Sep 2015 00:02:52 +0000 (UTC)
Received: from svr-orw-fem-04.mgc.mentorg.com ([147.34.97.41])
	by relay1.mentorg.com with esmtp 
	id 1ZaYHM-0000uw-Ck from Nathan_Lynch@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Fri, 11 Sep 2015 17:02:52 -0700
Received: from localhost (147.34.91.1) by SVR-ORW-FEM-04.mgc.mentorg.com
	(147.34.97.41) with Microsoft SMTP Server (TLS) id 14.3.224.2;
	Fri, 11 Sep 2015 17:02:51 -0700
From: Nathan Lynch <nathan_lynch@mentor.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 11 Sep 2015 19:02:50 -0500
Message-ID: <1442016170-15447-1-git-send-email-nathan_lynch@mentor.com>
X-Mailer: git-send-email 2.4.3
MIME-Version: 1.0
Subject: [PATCH] as-needed.inc: add babeltrace exception
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
X-List-Received-Date: Sat, 12 Sep 2015 00:02:55 -0000
Content-Type: text/plain

The babeltrace command has plugins which it specifies in its link step
but on which (in the linker's view) it does not depend, so --as-needed
causes some of them to be omitted from the executable's dependencies.
This prevents babeltrace on OE-built systems from handling
streaming/live tracing sessions.

Babeltrace's makefiles already try to prevent this by using
--no-as-needed, but --as-needed gets placed afterward in the command
line, so it wins.

Signed-off-by: Nathan Lynch <nathan_lynch@mentor.com>
---
 meta/conf/distro/include/as-needed.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/distro/include/as-needed.inc b/meta/conf/distro/include/as-needed.inc
index 9d2056e17a96..4f249fd3e65c 100644
--- a/meta/conf/distro/include/as-needed.inc
+++ b/meta/conf/distro/include/as-needed.inc
@@ -1,6 +1,7 @@
 
 ASNEEDED = "-Wl,--as-needed"
 
+ASNEEDED_pn-babeltrace = ""
 ASNEEDED_pn-console-tools = ""
 ASNEEDED_pn-distcc = ""
 ASNEEDED_pn-openobex = ""
-- 
2.4.3


