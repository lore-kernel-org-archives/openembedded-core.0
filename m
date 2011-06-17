Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QXaSO-0004YP-8d
	for openembedded-core@lists.openembedded.org;
	Fri, 17 Jun 2011 16:55:37 +0200
Received: by ywa12 with SMTP id 12so857481ywa.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jun 2011 07:52:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:from:to:cc:subject:date:message-id
	:x-mailer:in-reply-to:references:in-reply-to:references;
	bh=VlBRGRr4KNk0e2NPz0d4yAmu01QZUrxowk96bNiLGG0=;
	b=KCC7SvXaXNNyrI86B3j8OTFL9187Gu5GxsovbSFmnHX7SPYxuaIal7ZzaRtI24Q6nI
	8JeVKlCyYWkdUIUdmtrgHhq/taRqmzq92R24zASXk8qpQ1iIen3rzQHam2r/34cvajqD
	L2Q1ZnWomexnVkNFaoLrPbjZeRO6IiSnUgbX0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=K99ST+ZMIacJbvoWyrU5IeJbhl2ris03Aa1TacwG75jPDZfCWp3sPhaHkYteeDDDZC
	cGr7JLPOP1nbmcgf4HvVEr/A2B4t+WwWr2mK0hpS57JCr5rDZnJ27taLPZ9JPJaslU1Z
	IKvGA4Cl2MsWa+TP2Ts7UeWRMCe2eJY/i40MY=
Received: by 10.236.181.39 with SMTP id k27mr3788904yhm.7.1308322326674;
	Fri, 17 Jun 2011 07:52:06 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id k10sm1754092yhj.50.2011.06.17.07.52.02
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 17 Jun 2011 07:52:04 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 Jun 2011 14:51:35 +0000
Message-Id: <a322eed8819621c33cc120bd3200a29006476b67.1308322247.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1308322247.git.otavio@ossystems.com.br>
References: <cover.1308322247.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1308322247.git.otavio@ossystems.com.br>
References: <cover.1308322247.git.otavio@ossystems.com.br>
Cc: Chris Larson <chris_larson@mentor.com>
Subject: [PATCH 1/9] oe.classutils: add module
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
X-List-Received-Date: Fri, 17 Jun 2011 14:55:37 -0000

From: Chris Larson <chris_larson@mentor.com>

This adds a ClassRegistry utility metaclass, as maintaining a class registry
is a fairly common thing to do.

Signed-off-by: Chris Larson <chris_larson@mentor.com>
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
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
1.7.2.5



