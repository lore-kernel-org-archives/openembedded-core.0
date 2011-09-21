Received: from mail-ew0-f41.google.com ([209.85.215.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dbaryshkov@gmail.com>) id 1R6Rnc-0001Gs-Gt
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Sep 2011 20:45:36 +0200
Received: by ewy23 with SMTP id 23so565122ewy.28
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Sep 2011 11:40:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=KQOqm5oVY/4BJtyF9mAarZRFkcBuRtDJhEnD8FEFJXk=;
	b=GDXdknuDR60f0qFi/qqpYYWHdHWyVapJYk7NKJTRVJimCYxV/usehFrUJXkW8o6g6P
	415NnDs/dAbFlPKgbhxLwE0MmKStauRuOek7v4ph+/CTURqNZxIyzha1v/reh18KuVif
	Qxa9mp1MTPGMCKYN3c1FRvFrb0qaUIFvgtVpM=
Received: by 10.204.148.18 with SMTP id n18mr754501bkv.166.1316630417632;
	Wed, 21 Sep 2011 11:40:17 -0700 (PDT)
Received: from localhost.localdomain ([194.85.238.22])
	by mx.google.com with ESMTPS id t16sm5806554bkv.11.2011.09.21.11.40.15
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 21 Sep 2011 11:40:16 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 21 Sep 2011 22:39:50 +0400
Message-Id: <1316630404-10336-3-git-send-email-dbaryshkov@gmail.com>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1316630404-10336-1-git-send-email-dbaryshkov@gmail.com>
References: <1316630404-10336-1-git-send-email-dbaryshkov@gmail.com>
Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Subject: [PATCH 03/17] insane.bbclass: don't warn on .so files in -nativesdk packages
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 21 Sep 2011 18:45:36 -0000

There is no point in warning against .so symlinks in -nativesdk
packages. They have to contain such links, so shut up the warning.

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 meta/classes/insane.bbclass |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index a660a06..addb9ac 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -179,8 +179,8 @@ def package_qa_check_dev(path, name, d, elf, messages):
     Check for ".so" library symlinks in non-dev packages
     """
 
-    if not name.endswith("-dev") and not name.endswith("-dbg") and path.endswith(".so") and os.path.islink(path):
-        messages.append("non -dev/-dbg package contains symlink .so: %s path '%s'" % \
+    if not name.endswith("-dev") and not name.endswith("-dbg") and not name.endswith("-nativesdk") and path.endswith(".so") and os.path.islink(path):
+        messages.append("non -dev/-dbg/-nativesdk package contains symlink .so: %s path '%s'" % \
                  (name, package_qa_clean_path(path,d)))
 
 QAPATHTEST[debug-files] = "package_qa_check_dbg"
-- 
1.7.2.5



