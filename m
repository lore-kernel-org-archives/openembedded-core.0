Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1Q7Bdw-00069g-Hc
	for openembedded-core@lists.openembedded.org;
	Tue, 05 Apr 2011 21:10:24 +0200
Received: by gyf1 with SMTP id 1so287663gyf.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Apr 2011 12:08:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references:in-reply-to:references;
	bh=tMatQul1vW34glwj+cZDoMqfMjv4U+6SjhkfBJkvzeQ=;
	b=DCRU7UH+EvmwmQ3+GBOqr2wLHOCo1nS4rxzbJA6KzxPhsH6Jd3Bjm/8KlqupG8t1lB
	ZRIKH8qm7fK11hqSbhGKlzV+E/v7uFMjxcBT/SZPUU5g7PI8d7mj4rLtykc34bV3X06m
	eAKmHR2x9wGdkibZQxHuGlINhF8K444PkI+58=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=rBccy96ZpZw/W9G+SihfG0e01xszgFn5gcQ12wbSP9kiAM9GZz6pdUUaeR0/0oLCMc
	NdeszbvAHyIBE4O7hsb2upmKQLR8PeGjQzivVmcmbDwUvCvH7W0dj9+/79C6lRBE0HY6
	WDKHHp3/uf9H3l7w1BksTpdGfQTpcOWUcmZHE=
Received: by 10.236.185.137 with SMTP id u9mr93069yhm.124.1302030498262;
	Tue, 05 Apr 2011 12:08:18 -0700 (PDT)
Received: from localhost.localdomain (ip24-251-170-95.ph.ph.cox.net
	[24.251.170.95])
	by mx.google.com with ESMTPS id x28sm2974573yhc.81.2011.04.05.12.08.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 05 Apr 2011 12:08:17 -0700 (PDT)
From: Chris Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Apr 2011 12:08:05 -0700
Message-Id: <8109d803d93d3101593825d3ee1abe4d7ac84ac4.1302030219.git.chris_larson@mentor.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1302030219.git.chris_larson@mentor.com>
References: <cover.1302030219.git.chris_larson@mentor.com>
In-Reply-To: <cover.1302030219.git.chris_larson@mentor.com>
References: <cover.1302030219.git.chris_larson@mentor.com>
Cc: Chris Larson <chris_larson@mentor.com>
Subject: [PATCH 1/3] oe.classutils: add module
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
X-List-Received-Date: Tue, 05 Apr 2011 19:10:24 -0000

From: Chris Larson <chris_larson@mentor.com>

This adds a ClassRegistry utility metaclass, as maintaining a class registry
is a fairly common thing to do.

Signed-off-by: Chris Larson <chris_larson@mentor.com>
---
 meta/lib/oe/classutils.py |   24 ++++++++++++++++++++++++
 1 files changed, 24 insertions(+), 0 deletions(-)
 create mode 100644 meta/lib/oe/classutils.py

diff --git a/meta/lib/oe/classutils.py b/meta/lib/oe/classutils.py
new file mode 100644
index 0000000..855d2fa
--- /dev/null
+++ b/meta/lib/oe/classutils.py
@@ -0,0 +1,24 @@
+class ClassRegistry(type):
+    """Maintain a registry of classes, indexed by name.
+
+    The name in the registry can be overridden via the 'name' attribute of the
+    class, and the 'priority' attribute controls priority.  The prioritized()
+    method returns the registered classes in priority order."""
+    registry = {}
+    priority = 0
+
+    def __init__(cls, name, bases, attrs):
+        super(ClassRegistry, cls).__init__(name, bases, attrs)
+        if not hasattr(cls, name):
+            cls.name = name
+        cls.registry[cls.name] = cls
+
+    @classmethod
+    def prioritized(tcls):
+        return sorted(tcls.registry.values(),
+                      key=lambda v: v.priority, reverse=True)
+
+    def unregister(cls):
+        for key in cls.registry.keys():
+            if cls.registry[key] is cls:
+                del cls.registry[key]
-- 
1.7.4.1



