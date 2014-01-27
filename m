Return-Path: <jacob.kroon@gmail.com>
Received: from mail-la0-f48.google.com (mail-la0-f48.google.com
	[209.85.215.48])
	by mail.openembedded.org (Postfix) with ESMTP id EF2606E787
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jan 2014 21:01:54 +0000 (UTC)
Received: by mail-la0-f48.google.com with SMTP id mc6so4835505lab.7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jan 2014 13:01:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:subject:date:message-id;
	bh=PYDR6qXNja/BqwXIg9bn7YxqayQ/Igj8YVbZitDBh6Q=;
	b=EgBXG5Hzp+87Qn6xkAn5cnY3P/h5lraCEK/2mFB/islD7VNPFDU2ywss2A9vbOia45
	qHlzdQwTex/9i56Q1KxvfZxgG9u7cl3RGs4GEArGCM5Ixy3GdvsTpz5908t6lZxMp5su
	u67tXEuXv/9wGq2LR83yKQtQQCIDkBun3yg146EJJ3vsL7kVi4c08LyLW9GAhj/7bX8D
	MX66j6mi4jq6e+orm+3nL0iaOVhjCQwnku0kN4PWccFD4/T0jcT6t7nIVwnod970OMVs
	c5DTyhtVSM9P3da6eyenEvmoXXBfZz1LB4JDBOFuSqtC2dItzeuPfPmYbRRSqwabnezi
	8lFg==
X-Received: by 10.152.4.99 with SMTP id j3mr5773195laj.31.1390856515002;
	Mon, 27 Jan 2014 13:01:55 -0800 (PST)
Received: from localhost.localdomain (89-253-118-72.customers.ownit.se.
	[89.253.118.72])
	by mx.google.com with ESMTPSA id sv5sm13580298lbb.9.2014.01.27.13.01.54
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 27 Jan 2014 13:01:54 -0800 (PST)
Sender: Jacob Kroon <jacob.kroon@gmail.com>
From: Jacob Kroon <jacob.kroon@mikrodidakt.se>
To: openembedded-core@lists.openembedded.org
Date: Mon, 27 Jan 2014 22:00:21 +0100
Message-Id: <1390856421-9971-1-git-send-email-jacob.kroon@mikrodidakt.se>
X-Mailer: git-send-email 1.8.5.3
Subject: [PATCH] cml1.bbclass: Fix return code handling in do_menuconfig()
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
X-List-Received-Date: Mon, 27 Jan 2014 21:01:55 -0000

On my system, doing "bitbake -c menuconfig busybox" pops up
a gnome-terminal, I can see that the compilation starts but then the
terminal automatically exits.

It turns out I don't have ncurses development package installed on my host,
and OE's host sysroot isn't being passed to gcc, so compilation fails.
The window automatically closes before I can read the error message
since the '$' in the return code check needs to be escaped.

Make sure the user can read the error message by properly checking the
return code.

Signed-off-by: Jacob Kroon <jacob.kroon@mikrodidakt.se>
---
 meta/classes/cml1.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/cml1.bbclass b/meta/classes/cml1.bbclass
index bb95639..e292ecb 100644
--- a/meta/classes/cml1.bbclass
+++ b/meta/classes/cml1.bbclass
@@ -21,7 +21,7 @@ python do_menuconfig() {
     except OSError:
         mtime = 0
 
-    oe_terminal("${SHELL} -c \"make menuconfig; if [ $? -ne 0 ]; then echo 'Command failed.'; printf 'Press any key to continue... '; read r; fi\"", '${PN} Configuration', d)
+    oe_terminal("${SHELL} -c \"make menuconfig; if [ \$? -ne 0 ]; then echo 'Command failed.'; printf 'Press any key to continue... '; read r; fi\"", '${PN} Configuration', d)
 
     # FIXME this check can be removed when the minimum bitbake version has been bumped
     if hasattr(bb.build, 'write_taint'):
-- 
1.8.5.3


