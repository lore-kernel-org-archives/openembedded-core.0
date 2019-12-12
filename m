Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
	[209.85.128.44])
	by mail.openembedded.org (Postfix) with ESMTP id 4615D7FBEF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Dec 2019 21:52:17 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id p17so4310282wma.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Dec 2019 13:52:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=/aVPs5PSoOJqx5whoaSV+/S7ntY6fIzSlrFPys85M3k=;
	b=suZ5YC6qi6mCf3Q65u86ODYHiTVMb9+MW9mmYiQZdv1fokXwbJMV7EdL2d4AwuRzFb
	tgx60nbTTvbcvw8qZSPov4lbQCurCFP8G9l1H0YuGH0MB+rNYCUqpWS/lXRHrUb2sYYi
	JPmXPcc2sxmcq33p9LGk7eBBG2wnO7jsIGf49ZOaVr+W0EnEU7rKbwC3gEKdFZsThvH9
	2iEI/tKE7dAiIuAAcWeqc6xUSnAElDs4OFHY1plaboZTdIs7YD1Pv+GUtKAfVTz27ZX4
	V2+BPCQzjH88byT7Dlsuxbmfi5EiiCX56cbYkoetB9alQDNW7vinxsXwgQ/ObRY1323v
	/fgg==
X-Gm-Message-State: APjAAAVwmawSwXliwFoJWPe+DsY1kEggAgP7fnmCYXH6e8yXyBB7Df6s
	qxjWhrTHMpv7H57O0D0MKd1ak61B
X-Google-Smtp-Source: APXvYqxT/zab0BQllCqy8bbuaygX5QzilUFwGVe2to7NHpaRFY5Yp9Nf0Iz9BeEqDMKPVrbDN1kknA==
X-Received: by 2002:a05:600c:1:: with SMTP id g1mr8681632wmc.131.1576187537921;
	Thu, 12 Dec 2019 13:52:17 -0800 (PST)
Received: from tfsielt31850.fritz.box ([79.97.20.138])
	by smtp.gmail.com with ESMTPSA id
	v188sm7723704wma.10.2019.12.12.13.52.17
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 12 Dec 2019 13:52:17 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 Dec 2019 21:52:12 +0000
Message-Id: <20191212215212.27089-5-git@andred.net>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191212215212.27089-1-git@andred.net>
References: <20191212215212.27089-1-git@andred.net>
MIME-Version: 1.0
Subject: [PATCH 4/4] oeqa/runtime/apt dnf opkg: support running from within docker container
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
X-List-Received-Date: Thu, 12 Dec 2019 21:52:18 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

If the user specified an http port to use for serving
files, use that instead of a random one. At the same
time, have the http server bind to all interfaces.

Binding to the server_ip might not always be possible,
e.g. in the case of running bitbake / oeqa from within
a docker container. In this case, the ip address is valid
outside the container, but not inside, and hence can't
be bound to. So switch to simply binding to all interfaces.

Signed-off-by: André Draszik <git@andred.net>
---
 meta/lib/oeqa/runtime/cases/apt.py  | 4 +++-
 meta/lib/oeqa/runtime/cases/dnf.py  | 3 ++-
 meta/lib/oeqa/runtime/cases/opkg.py | 4 +++-
 3 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oeqa/runtime/cases/apt.py b/meta/lib/oeqa/runtime/cases/apt.py
index 74a940d80f..c5378d90c3 100644
--- a/meta/lib/oeqa/runtime/cases/apt.py
+++ b/meta/lib/oeqa/runtime/cases/apt.py
@@ -22,7 +22,9 @@ class AptRepoTest(AptTest):
     @classmethod
     def setUpClass(cls):
         service_repo = os.path.join(cls.tc.td['DEPLOY_DIR_DEB'], 'all')
-        cls.repo_server = HTTPService(service_repo, cls.tc.target.server_ip, logger=cls.tc.logger)
+        cls.repo_server = HTTPService(service_repo,
+                                      '0.0.0.0', port=cls.tc.target.server_port,
+                                      logger=cls.tc.logger)
         cls.repo_server.start()
 
     @classmethod
diff --git a/meta/lib/oeqa/runtime/cases/dnf.py b/meta/lib/oeqa/runtime/cases/dnf.py
index de3759995e..f40c63026e 100644
--- a/meta/lib/oeqa/runtime/cases/dnf.py
+++ b/meta/lib/oeqa/runtime/cases/dnf.py
@@ -53,7 +53,8 @@ class DnfRepoTest(DnfTest):
     @classmethod
     def setUpClass(cls):
         cls.repo_server = HTTPService(os.path.join(cls.tc.td['WORKDIR'], 'oe-testimage-repo'),
-                                      cls.tc.target.server_ip, logger=cls.tc.logger)
+                                      '0.0.0.0', port=cls.tc.target.server_port,
+                                      logger=cls.tc.logger)
         cls.repo_server.start()
 
     @classmethod
diff --git a/meta/lib/oeqa/runtime/cases/opkg.py b/meta/lib/oeqa/runtime/cases/opkg.py
index 750706161b..9cfee1cd88 100644
--- a/meta/lib/oeqa/runtime/cases/opkg.py
+++ b/meta/lib/oeqa/runtime/cases/opkg.py
@@ -25,7 +25,9 @@ class OpkgRepoTest(OpkgTest):
         if cls.tc.td["MULTILIB_VARIANTS"]:
             allarchfeed = cls.tc.td["TUNE_PKGARCH"]
         service_repo = os.path.join(cls.tc.td['DEPLOY_DIR_IPK'], allarchfeed)
-        cls.repo_server = HTTPService(service_repo, cls.tc.target.server_ip, logger=cls.tc.logger)
+        cls.repo_server = HTTPService(service_repo,
+                                      '0.0.0.0', port=cls.tc.target.server_port,
+                                      logger=cls.tc.logger)
         cls.repo_server.start()
 
     @classmethod
-- 
2.24.0


