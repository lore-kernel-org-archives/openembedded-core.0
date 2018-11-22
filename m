Return-Path: <mac@mcrowe.com>
Received: from avasout02.plus.net (avasout02.plus.net [212.159.14.17])
	by mail.openembedded.org (Postfix) with ESMTP id 29A34607AC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Nov 2018 10:14:17 +0000 (UTC)
Received: from deneb ([80.229.24.9]) by smtp with ESMTP
	id Pm01gMhw8x6b6Pm02g6VSQ; Thu, 22 Nov 2018 10:14:18 +0000
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.3 cv=T4GiscCQ c=1 sm=1 tr=0
	a=E/9URZZQ5L3bK/voZ0g0HQ==:117 a=E/9URZZQ5L3bK/voZ0g0HQ==:17
	a=JHtHm7312UAA:10 a=-An2I_7KAAAA:8 a=WB-9W4BLM8i6LakJYo8A:9
	a=akvmSLiqbP9ghTkR:21 a=rNEf8EMOG7BQ81BH:21 a=Sq34B_EcNBM9_nrAYB9S:22
Received: from mac by deneb with local (Exim 4.89)
	(envelope-from <mac@mcrowe.com>)
	id 1gPm00-00073U-AM; Thu, 22 Nov 2018 10:14:16 +0000
From: Mike Crowe <mac@mcrowe.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Nov 2018 10:14:08 +0000
Message-Id: <20181122101408.20514-1-mac@mcrowe.com>
X-Mailer: git-send-email 2.11.0
X-CMAE-Envelope: MS4wfID73ApmJGvx32jeLg918QJNLFHebe0wk13tHr8bxYh3BibDMzj/SU+agqEtIAacSe3THhiLefmQtToW5J9+y7/QkUGjVY0iJ02GcNMC9uVPcbLnO1Jt
	Vv5IzUu/JRkXf6ykD5mXQvMlC2j3XVCX0j8H7PwWxBSOvcl8xO/D8E70
Cc: Mike Crowe <mac@mcrowe.com>
Subject: [PATCH] terminal: Cope with unreleased versions of tmux
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
X-List-Received-Date: Thu, 22 Nov 2018 10:14:18 -0000

When tmux is built from a non-release Git version, its version number is
"next-X" where X appears to be the expected version number for the next
release. For example, when built from the current state of master, running
"tmux -V" yields:

 tmux next-2.9

Currently check_tmux_pane_size only checks for the version being less than
1.9, so it seems unfair to fail with an obscure Python error in this case.

Let's just use the version number after the "next-" prefix if it is
present.

Signed-off-by: Mike Crowe <mac@mcrowe.com>

---
 meta/lib/oe/terminal.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/lib/oe/terminal.py b/meta/lib/oe/terminal.py
index 94afe394ed..bf5c37f897 100644
--- a/meta/lib/oe/terminal.py
+++ b/meta/lib/oe/terminal.py
@@ -296,6 +296,8 @@ def check_terminal_version(terminalName):
             vernum = ver.split(' ')[-1]
         if ver.startswith('tmux'):
             vernum = ver.split()[-1]
+        if ver.startswith('tmux next-'):
+            vernum = ver.split()[-1][5:]
     return vernum
 
 def distro_name():
-- 
2.19.1


