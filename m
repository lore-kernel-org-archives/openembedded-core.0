Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 2A67B72F21
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Mar 2017 09:41:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v2D9fkRf000522; Mon, 13 Mar 2017 09:41:46 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id pTxPQUIjaMKy; Mon, 13 Mar 2017 09:41:46 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v2D9ff4b000496
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 13 Mar 2017 09:41:42 GMT
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1cnMU1-0008DU-A7; Mon, 13 Mar 2017 09:41:41 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 Mar 2017 09:41:40 +0000
Message-Id: <1489398100-31546-1-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] terminal: Use original PATH for terminals
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
X-List-Received-Date: Mon, 13 Mar 2017 09:41:47 -0000

Now that we filter out PATH to only the utilities we rely upon, the devshel
terminal was broken since it can no longer find the terminals. Even if
we fix that, the user couldn't access any of their commands within
devshell which somewhat defeats its purpose.

Add the original PATH back to the environment to restore that behaviour
since this is more in line with user expectations and it wouldn't be possible
(or desireable) to whitelist all the commands a user might want to use from
the shell.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/terminal.bbclass | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/classes/terminal.bbclass b/meta/classes/terminal.bbclass
index 62409c0..a27e10c 100644
--- a/meta/classes/terminal.bbclass
+++ b/meta/classes/terminal.bbclass
@@ -66,6 +66,11 @@ def oe_terminal(command, title, d):
             envdata.setVar(key, str(value))
             envdata.setVarFlag(key, 'export', '1')
 
+    # Use original PATH as a fallback
+    path = d.getVar('PATH') + ":" + origbbenv.getVar('PATH')
+    os.environ['PATH'] = path
+    envdata.setVar('PATH', path)
+
     # A complex PS1 might need more escaping of chars.
     # Lets not export PS1 instead.
     envdata.delVar("PS1")
-- 
2.7.4


