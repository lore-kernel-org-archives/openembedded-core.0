Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TfhaQ-0000ij-Qc
	for openembedded-core@lists.openembedded.org;
	Tue, 04 Dec 2012 02:46:16 +0100
Received: by mail-ee0-f47.google.com with SMTP id e51so1918643eek.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Dec 2012 17:31:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=Fiv/Egtq4b6ZTDQVIjmupE2UMWiMJfXEYt7J1pNs8jE=;
	b=fJkLaZREORs1E3dr60BvUoso9/uNkwV1kw52RfF2u6cbmqEFBYdcrGsviS1kiAUj8l
	Dwm+K/WQv65HwHv2Snes1JKftlDRkxaXalKSzg+RQ2vbNzD7OMZF1mUvitEsrO7ZokM4
	8AwtTLy8cU0V2rZRZIZlU69kNK7ELRkIUt3d+t+lqughphteIDotblm0Vy3JaVv370dg
	ZJoS31Hb9OuV/ykK5r253+CVtw1y/1WrsNvvSPYlY0BkCvrkKpSErFe1LPnwrX5oDLfE
	uKPJP7EPy6TPQHWAhZtdec0NjyZVAGppd8zEIsSyBcyiIPxfNndLcbCGIqI+ILNGs+F2
	jatg==
Received: by 10.14.175.198 with SMTP id z46mr42439478eel.26.1354584715253;
	Mon, 03 Dec 2012 17:31:55 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id b2sm34684456eep.9.2012.12.03.17.31.54
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 03 Dec 2012 17:31:54 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  4 Dec 2012 02:31:14 +0100
Message-Id: <4dcfc906292eba51ed2ca1c326048f27d19560b0.1354584580.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <cover.1354584580.git.Martin.Jansa@gmail.com>
References: <cover.1354584580.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1354584580.git.Martin.Jansa@gmail.com>
References: <cover.1354584580.git.Martin.Jansa@gmail.com>
Subject: [PATCH 5/6] sstate.bbclass: fixed file-conflict check
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 04 Dec 2012 01:46:16 -0000

From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>

The value of subprocess.Popen().communicate()[0] is a string.
Checking for '!= None' will always match causing bogus warnings
regarding already staged files.

Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/sstate.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 6de35e6..967ae9b 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -171,7 +171,7 @@ def sstate_install(ss, d):
                 sstate_search_cmd = "grep -rl %s %s --exclude=master.list | sed -e 's:^.*/::' -e 's:\.populate-sysroot::'" % (f, d.expand("${SSTATE_MANIFESTS}"))
                 cmd_array = sstate_search_cmd.split(' ')
                 search_output = subprocess.Popen(cmd_array, stdout=subprocess.PIPE).communicate()[0]
-                if search_output != None:
+                if search_output != "":
                     match.append("Matched in %s" % search_output.rstrip())
     if match:
         bb.warn("The recipe %s is trying to install files into a shared area when those files already exist. Those files and their manifest location are:\n   %s\nPlease verify which package should provide the above files." % (d.getVar('PN', True), "\n   ".join(match)))
-- 
1.8.0



