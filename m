Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1QMkQl-0005dZ-3j
	for openembedded-core@lists.openembedded.org;
	Wed, 18 May 2011 19:21:07 +0200
Received: by pwj9 with SMTP id 9so878198pwj.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 May 2011 10:18:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references:in-reply-to:references;
	bh=kkOvbRSi7O8quHsWe3+Hxkkv4a/jalbI1AguW8U0m7E=;
	b=MJFlXWpDtQW87auNOQLURB7fy7OeQ59WZrmxCFhckOOschUdMzIxOEtBpZs99kUEpo
	P4CVuz2QZfaiJP56lrjIsGeuKyguCq5+ln1NzgpHKBXlgkt9ynzKuOHQ9bRXB6VZywU+
	uwV5xRtahQw8sG8Uw+8Ep9vyueGxLT2TTmdJ4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=COOkXRvve7j8mjRG20aPPyQFnVvt/lcSBiJM+2FFpJLRQSw6vyveQCArfteC1jdgoF
	95Vv3rcf4MurCI+evE14USsBrLv1Dl8DLVr6LL8ayDImi8xll74WUrK3f9F8zenb2HgI
	0R+a5pwQeDJpsSfGMkGu9twX7iShjFKZwwVjY=
Received: by 10.142.191.1 with SMTP id o1mr1153476wff.396.1305739090742;
	Wed, 18 May 2011 10:18:10 -0700 (PDT)
Received: from localhost.localdomain (ip24-251-173-232.ph.ph.cox.net
	[24.251.173.232])
	by mx.google.com with ESMTPS id 25sm1550869wfb.10.2011.05.18.10.18.09
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 18 May 2011 10:18:10 -0700 (PDT)
From: Chris Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 May 2011 10:17:59 -0700
Message-Id: <95c1c690d14f493b615eafeb349d57aa67366b5d.1305737923.git.chris_larson@mentor.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1305737923.git.chris_larson@mentor.com>
References: <cover.1305737923.git.chris_larson@mentor.com>
In-Reply-To: <cover.1305737923.git.chris_larson@mentor.com>
References: <cover.1305737923.git.chris_larson@mentor.com>
Cc: Chris Larson <chris_larson@mentor.com>
Subject: [PATCH (v2,resend) 1/3] oe.classutils: add module
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
X-List-Received-Date: Wed, 18 May 2011 17:21:07 -0000

From: Chris Larson <chris_larson@mentor.com>

This adds a ClassRegistry utility metaclass, as maintaining a class registry
is a fairly common thing to do.

Signed-off-by: Chris Larson <chris_larson@mentor.com>
---
 meta/lib/oe/classutils.py |   43 +++++++++++++++++++++++++++++++++++++++++++
 1 files changed, 43 insertions(+), 0 deletions(-)
 create mode 100644 meta/lib/oe/classutils.py

diff --git a/meta/lib/oe/classutils.py b/meta/lib/oe/classutils.py
new file mode 100644
index 0000000..58188fd
--- /dev/null
+++ b/meta/lib/oe/classutils.py
@@ -0,0 +1,43 @@
+class ClassRegistry(type):
+    """Maintain a registry of classes, indexed by name.
+
+Note that this implementation requires that the names be unique, as it uses
+a dictionary to hold the classes by name.
+
+The name in the registry can be overridden via the 'name' attribute of the
+class, and the 'priority' attribute controls priority. The prioritized()
+method returns the registered classes in priority order.
+
+Subclasses of ClassRegistry may define an 'implemented' property to exert
+control over whether the class will be added to the registry (e.g. to keep
+abstract base classes out of the registry)."""
+    priority = 0
+    class __metaclass__(type):
+        """Give each ClassRegistry their own registry"""
+        def __init__(cls, name, bases, attrs):
+            cls.registry = {}
+            type.__init__(cls, name, bases, attrs)
+
+    def __init__(cls, name, bases, attrs):
+        super(ClassRegistry, cls).__init__(name, bases, attrs)
+        try:
+            if not cls.implemented:
+                return
+        except AttributeError:
+            pass
+
+        try:
+            cls.name
+        except AttributeError:
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
1.7.1



