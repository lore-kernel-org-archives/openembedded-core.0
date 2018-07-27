Return-Path: <kergoth@gmail.com>
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com
	[209.85.215.180])
	by mail.openembedded.org (Postfix) with ESMTP id 2937B74581
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jul 2018 17:24:43 +0000 (UTC)
Received: by mail-pg1-f180.google.com with SMTP id k3-v6so3611341pgq.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jul 2018 10:24:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=mEDcCGwqoLdP94WDh6mbJ4UYA5NSyNxou5jKFXmYV9I=;
	b=hBwdbf5tZC/fj0LZ166//d6A7MUPfKSPqLazRct+0X7Xm5mFeHzEIYfrbmxWPt3jqX
	kr/bL+hn+0Kb+/pP4Wxr9Zi34hYMyyb5UidMpHZsfEyCz48PRjMBhpkDkqgIkRUQsMHP
	HcsDM8YxkuRUZXRV1l5C4H5/AjMWAjdm7qhh+ieTBkBBaJwxVAf4G38PtmsV0yrr/h13
	QrBzD/9h7pKJ8Xr9B4NJ4UnGnVOEwHvkLCXxIiZSg/+iHNU4denSBxdIvr1Db3pQBDAg
	0lYdW/hl751UFSPHNRoKNlTlFtC5BeTd6uB+rIRhzyjOB0/BFXJGZimIF7PQloPYBTKM
	eX3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=mEDcCGwqoLdP94WDh6mbJ4UYA5NSyNxou5jKFXmYV9I=;
	b=lETBFG7Gt2R9UsJqRjJl9Cpr9LOxoskzj8Qng/xHrGR/4z8ivshXp8uYsuhEB7QCmq
	1TD2wDhMyhQs7/UWvKJNwmGKnSACjUxVHMy5qjjtLvIlP/K4OB8GQTK3ub2Y66DfTyyO
	fxJVgqNJc/8OWpGEA2HY1vC3KTyjibmVjQUkDPMRhUYO3qQel0nIqnlonCTNWkZ3Wg9o
	TsL65soH4ScmbWUDH6N6MZpNHogaAdDP12NEe+Ux4Rk3MWXdjbHMWd93AjPF1peCB7J/
	x2tKsGamEuu9yVZMHD0cf4c5zpmwT7XDsNVqF7F6FwAKkLCw8BAvu8LU2l9uLoKEx6PG
	JZ2w==
X-Gm-Message-State: AOUpUlEWq5lk6TehHMmB7FCmsylW5VcxxZoATF7ijtuSXL49iC5DBk8g
	EKTtK39NGD2tusirGEYo5J5tJKGvHCg=
X-Google-Smtp-Source: AAOMgpcTPhruRjOqN+yNbOZLLjg+RZbg8N/gVjbSLrT8MT9TBiQYKGumgQHfO+YgOEpm5pY3y4GYPw==
X-Received: by 2002:a63:9b19:: with SMTP id
	r25-v6mr6969100pgd.44.1532712284005; 
	Fri, 27 Jul 2018 10:24:44 -0700 (PDT)
Received: from svr-pkl-eng-07.mgc.mentorg.com ([110.93.212.98])
	by smtp.gmail.com with ESMTPSA id
	v17-v6sm6399195pfn.177.2018.07.27.10.24.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 27 Jul 2018 10:24:43 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 Jul 2018 22:24:27 +0500
Message-Id: <940749ac792fafb0e9d7c92d7f76505a6b36ba0b.1532711448.git.chris_larson@mentor.com>
X-Mailer: git-send-email 2.11.1
In-Reply-To: <cover.1532711448.git.chris_larson@mentor.com>
References: <cover.1532711448.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCHv2 1/4] oe.package_manager: support loading intercepts from multiple paths
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
X-List-Received-Date: Fri, 27 Jul 2018 17:24:43 -0000

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
index 64c8a912160..b983943f1f6 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -335,17 +335,24 @@ class PackageManager(object, metaclass=ABCMeta):
 
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


