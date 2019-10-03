Return-Path: <Trevor.Gamblin@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 968186C106
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Oct 2019 22:45:45 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id x93MjiZr014933
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 3 Oct 2019 15:45:44 -0700 (PDT)
Received: from yow-tgamblin-lx.wrs.com (128.224.20.237) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.468.0; Thu, 3 Oct 2019 15:45:44 -0700
From: Trevor Gamblin <trevor.gamblin@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 3 Oct 2019 18:45:43 -0400
Message-ID: <20191003224543.5892-1-trevor.gamblin@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [PATCH] lib/oe/terminal.py: fix gnome-terminal start behavior
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
X-List-Received-Date: Thu, 03 Oct 2019 22:45:45 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

[Bugzilla Bug 13201] -- https://bugzilla.yoctoproject.org/show_bug.cgi?id=13201

Newer versions of gnome-terminal (3.32.0 and up) are not starting
as expected for commands e.g. "bitbake -c devshell zlib". This
manifests as the instance appearing as a new tab rather than a
new window. Fix this (and maintain new window preferred behavior)
by changing the "-x" option to "--" as per the warning message,
avoiding deprecated options:

    # Option “--command” is deprecated and might be removed in a later version of gnome-terminal.
    # Use “-- ” to terminate the options and put the command line to execute after it.

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
---
 meta/lib/oe/terminal.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/terminal.py b/meta/lib/oe/terminal.py
index 9bda3efdc7..a1daa2bed6 100644
--- a/meta/lib/oe/terminal.py
+++ b/meta/lib/oe/terminal.py
@@ -55,7 +55,7 @@ class XTerminal(Terminal):
             raise UnsupportedTerminal(self.name)
 
 class Gnome(XTerminal):
-    command = 'gnome-terminal -t "{title}" -x {command}'
+    command = 'gnome-terminal -t "{title}" -- {command}'
     priority = 2
 
     def __init__(self, sh_cmd, title=None, env=None, d=None):
-- 
2.17.1


