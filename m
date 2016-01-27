Return-Path: <olof.johansson@axis.com>
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id EF38360112
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jan 2016 10:14:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id CD3BD2E3B4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jan 2016 11:14:34 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id IH2Brzy4aOeu
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jan 2016 11:14:33 +0100 (CET)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by bes.se.axis.com (Postfix) with ESMTP id 6C28B2E3AE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jan 2016 11:14:33 +0100 (CET)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id 4DAA41540
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jan 2016 11:14:33 +0100 (CET)
Received: from thoth.se.axis.com (thoth.se.axis.com [10.0.2.173])
	by boulder.se.axis.com (Postfix) with ESMTP id 425021458
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jan 2016 11:14:33 +0100 (CET)
Received: from xmail2.se.axis.com (xmail2.se.axis.com [10.0.5.74])
	by thoth.se.axis.com (Postfix) with ESMTP id 3FFC7341BD
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jan 2016 11:14:33 +0100 (CET)
Received: from lnxolofjn.se.axis.com (10.92.17.1) by xmail2.se.axis.com
	(10.0.5.74) with Microsoft SMTP Server id 8.3.342.0; Wed, 27 Jan 2016
	11:14:32 +0100
Received: by lnxolofjn.se.axis.com (Postfix, from userid 20466)	id D1E419C075; 
	Wed, 27 Jan 2016 11:14:32 +0100 (CET)
From: Olof Johansson <olof.johansson@axis.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 27 Jan 2016 11:14:32 +0100
Message-ID: <1453889672-17360-1-git-send-email-olof.johansson@axis.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Subject: [PATCH] bitbake-whatchanged: avoid double do_ task name prefix
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
X-List-Received-Date: Wed, 27 Jan 2016 10:14:41 -0000
Content-Type: text/plain

When used with --verbose, the heading for each task looks like

  === The verbose changes of example.do_do_compile:

This should instead be

  === The verbose changes of example.do_compile:

Signed-off-by: Olof Johansson <olof.johansson@axis.com>
---
 scripts/bitbake-whatchanged | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/bitbake-whatchanged b/scripts/bitbake-whatchanged
index 55cfe4b..af54d16 100755
--- a/scripts/bitbake-whatchanged
+++ b/scripts/bitbake-whatchanged
@@ -190,7 +190,7 @@ def print_depchanged(d_new = None, d_old = None, verbose = False):
             if sigdata_re.match(full_path_old) and sigdata_re.match(full_path_new):
                 output = bb.siggen.compare_sigfiles(full_path_old, full_path_new)
                 if output:
-                    print("\n=== The verbose changes of %s.do_%s:" % (pn, task))
+                    print("\n=== The verbose changes of %s.%s:" % (pn, task))
                     print('\n'.join(output))
         else:
             # Format the output, the format is:
-- 
2.1.4


