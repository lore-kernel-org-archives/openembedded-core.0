Return-Path: <msach@mailbox.tu-berlin.de>
X-Greylist: delayed 979 seconds by postgrey-1.34 at layers.openembedded.org;
	Sat, 22 Nov 2014 22:11:22 UTC
Received: from wp101.webpack.hosteurope.de (wp101.webpack.hosteurope.de
	[80.237.132.108])
	by mail.openembedded.org (Postfix) with ESMTP id 78B6F718EC
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Nov 2014 22:11:22 +0000 (UTC)
Received: from dhcp-213-120.vpn.tu-berlin.de ([130.149.213.120]
	helo=merten-desktop.vpn.tu-berlin.de); authenticated
	by wp101.webpack.hosteurope.de running ExIM with esmtpsa
	(TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	id 1XsIdz-0002RM-KX; Sat, 22 Nov 2014 22:55:03 +0100
From: Merten Sach <msach@mailbox.tu-berlin.de>
To: openembedded-core@lists.openembedded.org
Date: Sat, 22 Nov 2014 22:54:55 +0100
Message-Id: <1416693295-21521-1-git-send-email-msach@mailbox.tu-berlin.de>
X-Mailer: git-send-email 1.9.3
X-bounce-key: webpack.hosteurope.de; msach@mailbox.tu-berlin.de; 1416694286;
	ceb6a512; 
Subject: [PATCH] metadata_scm: Fix crash due to uncaught python exception
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
X-List-Received-Date: Sat, 22 Nov 2014 22:11:25 -0000

Function base_get_metadata_svn_revision was crashing due to an uncaught
IndexError exception.

The except notation without parentheses is legacy syntax. It is the equivalent
to 'except IOError as IndexError' which is not what we want here.

The change catches both exceptions.

Signed-off-by: Merten Sach <msach@mailbox.tu-berlin.de>
---
 meta/classes/metadata_scm.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/metadata_scm.bbclass b/meta/classes/metadata_scm.bbclass
index ba0edf9..237e618 100644
--- a/meta/classes/metadata_scm.bbclass
+++ b/meta/classes/metadata_scm.bbclass
@@ -60,7 +60,7 @@ def base_get_metadata_svn_revision(path, d):
     try:
         with open("%s/.svn/entries" % path) as f:
             revision = f.readlines()[3].strip()
-    except IOError, IndexError:
+    except (IOError, IndexError):
         pass
     return revision
 
-- 
1.9.3


