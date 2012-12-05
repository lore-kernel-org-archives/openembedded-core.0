Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TgNDm-0001AM-2i
	for openembedded-core@lists.openembedded.org;
	Wed, 05 Dec 2012 23:13:39 +0100
Received: by mail-ee0-f47.google.com with SMTP id e51so3182827eek.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Dec 2012 13:59:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=chZUcoASxeWcjSgYnTRKeCVSRqkpyYTYwjHH39/eyD0=;
	b=hV21/YhyomPQvsgR92tnF1l6pgdOVaAwOTN/YnIDZtk2waJgGb//83kUR4vbA3JjGk
	0nEeqg1AurABMGKk/i2/r9jg9rSVYyEmREKu5YnEm3bNbzXmMTbIZVRtAGOPELRMEJK+
	v00g3l1x/4fEv4n4zJnRr0uF1ZGLMZVYrjas4fNlcbqVpHpMgOZz849XsCrm8ySgF5WF
	/kQBurXH/EAFSYaSHnjviBBniAQFbnkN2APvjKFohvhaI4ZYNLLxmhslOicmMzckdgHI
	FwHLBsfZBErIVKnuXi4mlJfQx+uzWcs3WZiQER3XxJODzdNJsgX+SkdCY0ZvodqhOPkB
	oOkg==
Received: by 10.14.225.4 with SMTP id y4mr35173659eep.6.1354744756000;
	Wed, 05 Dec 2012 13:59:16 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id v46sm11826452eep.1.2012.12.05.13.59.14
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 05 Dec 2012 13:59:14 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  5 Dec 2012 22:59:02 +0100
Message-Id: <1354744742-31355-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <1354744742-31355-1-git-send-email-Martin.Jansa@gmail.com>
References: <1354744742-31355-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH 2/2] nativesdk-qt4-tools: fix do_configure to be reentrant
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
X-List-Received-Date: Wed, 05 Dec 2012 22:13:39 -0000

* without = it can add g++ prefix multiple time when you reexecute do_configure (e.g. after failure)

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-qt/qt4/nativesdk-qt4-tools.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-qt/qt4/nativesdk-qt4-tools.inc b/meta/recipes-qt/qt4/nativesdk-qt4-tools.inc
index 85c7eab..5ed0e90 100644
--- a/meta/recipes-qt/qt4/nativesdk-qt4-tools.inc
+++ b/meta/recipes-qt/qt4/nativesdk-qt4-tools.inc
@@ -63,8 +63,8 @@ do_configure() {
 
     if [ -f mkspecs/common/g++-base.conf ] ; then
         # don't use host g++ even during configure (4.8.0+)
-        sed -i -e "s#g++#${CXX}#" mkspecs/common/g++-base.conf
-        sed -i -e "s#gcc#${CC}#" mkspecs/common/g++-base.conf
+        sed -i -e "s#= g++#= ${CXX}#" mkspecs/common/g++-base.conf
+        sed -i -e "s#= gcc#= ${CC}#" mkspecs/common/g++-base.conf
     fi
 
     # Use qmake from qt4-native for building
-- 
1.8.0



