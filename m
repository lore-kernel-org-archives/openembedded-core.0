Return-Path: <kergoth@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id 7244B78520
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jun 2018 21:08:38 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id r21-v6so1964313pgv.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jun 2018 14:08:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ICSdU9P1ii0/Qo2fYWdBpuhM7jHEbhxsvM29tSvomsk=;
	b=pl/w2RyUOfQt4vqdYLUVu+5HrelnO9sDwLO+NeoWMyQN87BmbKG7NuCm6y8yz/diUA
	kqKog8uC1ooP2yxDgoSDnM13dwox8Ew26+FBHCgCA32yX4ekLE7nyN2lNqW3PGKtwnH0
	6x9gY2gq89DCd1WfrtoRMDNlVoxp5Kq1zaNNOZvvV18HIjMnNBHjR02GqI3GpfIRRibp
	NNMSc6usUErXAhvv9rWknL9QaZh6qxmToP2xumEoifM+XaQgy4t5iBhSw/pufQx7ECRK
	MC1Jf3hrOrUYoU3CpsDgpf9TyoeAZkZvzxi+T8mKC7FykAtcKLXa6FJ7bD6XKOvhYpUv
	BcQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=ICSdU9P1ii0/Qo2fYWdBpuhM7jHEbhxsvM29tSvomsk=;
	b=JcR3na54e7+qdhSnWa7XBp3M5NpCXJqDj39TYUfoAOC/Ld6iplcvizvAg8C7ssmyLF
	+LpV8gB8y7fh23lcvtI5BjKi24AHjCwzmXyZUMIWQSTi5PPX5Un+FSllxvC0kgfkpnfr
	G/3G05JzyFNIoNSuL3ZfolnyCkNpDn4vi3t3EhpTYEYjaiEnqnvZt4rIZd5YHwfeKFBg
	Sn+///0+K3WNeyISHskwmXi0YaYWSRbDxSCTtgc7AiimNa+CWz5KFvEYmOWw57fxhV8V
	QA6yS6TjVa9AB/hbvkXpI3cGugv44l+zlo6cSIlmCAH1X0JXA23NvG9qEi7nNpbg0E4B
	r2wg==
X-Gm-Message-State: APt69E3wvb6QJ8MYZ0L37l75zLjud3IpWPVanyIl1lU6m8FJKbH077Cp
	bZKK2zdZNbOGuvqwyOVGVJ7yoAj4
X-Google-Smtp-Source: ADUXVKJkYkkpqXkDo2VXyJxqZOuUSF5mO1HPGF+41fI6KH3A7H4JggJQE+7qz3f3StfF0KqDUT9tcw==
X-Received: by 2002:a63:6fce:: with SMTP id
	k197-v6mr23992177pgc.307.1529615319152; 
	Thu, 21 Jun 2018 14:08:39 -0700 (PDT)
Received: from svr-pkl-eng-07.mgc.mentorg.com ([110.93.212.98])
	by smtp.gmail.com with ESMTPSA id
	8-v6sm10513508pfk.132.2018.06.21.14.08.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 21 Jun 2018 14:08:37 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Jun 2018 02:08:20 +0500
Message-Id: <083106e90ca8d4114d7661e073b5b09a70af4b20.1529603271.git.chris_larson@mentor.com>
X-Mailer: git-send-email 2.11.1
In-Reply-To: <cover.1529603271.git.chris_larson@mentor.com>
References: <cover.1529603271.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 2/5] oe.package_manager: support loading intercepts from multiple paths
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
X-List-Received-Date: Thu, 21 Jun 2018 21:08:38 -0000

From: Christopher Larson <chris_larson@mentor.com>

- if POSTINST_INTERCEPTS is set, use the listed intercept files, or
- if POSTINST_INTERCEPTS_PATH is set, load from the listed paths, or
- if POSTINST_INTERCEPTS_DIR is set, load from it (for compatibility), or
- load from ${COREBASE}/meta/postinst-intercepts

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/lib/oe/package_manager.py | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index 5ac729455e9..7f9cbba7084 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -336,17 +336,24 @@ class PackageManager(object, metaclass=ABCMeta):
 
     def _initialize_intercepts(self):
         bb.note("Initializing intercept dir for %s" % self.target_rootfs)
-        postinst_intercepts_dir = self.d.getVar("POSTINST_INTERCEPTS_DIR")
-        if not postinst_intercepts_dir:
-            postinst_intercepts_dir = self.d.expand("${COREBASE}/scripts/postinst-intercepts")
         # As there might be more than one instance of PackageManager operating at the same time
         # we need to isolate the intercept_scripts directories from each other,
         # hence the ugly hash digest in dir name.
-        self.intercepts_dir = os.path.join(self.d.getVar('WORKDIR'),
-                                      "intercept_scripts-%s" %(hashlib.sha256(self.target_rootfs.encode()).hexdigest()) )
+        self.intercepts_dir = os.path.join(self.d.getVar('WORKDIR'), "intercept_scripts-%s" %
+                                           (hashlib.sha256(self.target_rootfs.encode()).hexdigest()))
 
+        postinst_intercepts = (self.d.getVar("POSTINST_INTERCEPTS") or "").split()
+        if not postinst_intercepts:
+            postinst_intercepts_path = self.d.getVar("POSTINST_INTERCEPTS_PATH")
+            if not postinst_intercepts_path:
+                postinst_intercepts_path = self.d.getVar("POSTINST_INTERCEPTS_DIR") or self.d.expand("${COREBASE}/scripts/postinst-intercepts")
+            postinst_intercepts = oe.path.which_wild('*', postinst_intercepts_path)
+
+        bb.debug(1, 'Collected intercepts:\n%s' % ''.join('  %s\n' % i for i in postinst_intercepts))
         bb.utils.remove(self.intercepts_dir, True)
-        shutil.copytree(postinst_intercepts_dir, self.intercepts_dir)
+        bb.utils.mkdirhier(self.intercepts_dir)
+        for intercept in postinst_intercepts:
+            bb.utils.copyfile(intercept, os.path.join(self.intercepts_dir, os.path.basename(intercept)))
 
     @abstractmethod
     def _handle_intercept_failure(self, failed_script):
-- 
2.11.1


