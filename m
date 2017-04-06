Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3A2F877BAF
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Apr 2017 06:41:42 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v366fh6T004280
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 5 Apr 2017 23:41:43 -0700
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 5 Apr 2017 23:41:42 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 5 Apr 2017 23:41:37 -0700
Message-ID: <fed21b19e1d665e16c0b1b945ac29f080f770301.1491460816.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.11.0.rc2.dirty
In-Reply-To: <cover.1491460816.git.liezhi.yang@windriver.com>
References: <cover.1491460816.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 5/6] runqemu: use realpath for imgdir
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
X-List-Received-Date: Thu, 06 Apr 2017 06:41:42 -0000
Content-Type: text/plain

The DEPLOY_DIR_IMAGE maybe relative or absolute path since it can be
read from env vars, so use realpath for both imgdir and
DEPLOY_DIR_IMAGE when compare.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 scripts/runqemu | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 1b330b7cfd..b9646223c4 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -705,8 +705,8 @@ class BaseConfig(object):
         # artefacts are relative to that file, rather than in whatever
         # directory DEPLOY_DIR_IMAGE in the conf file points to.
         if self.qbconfload:
-            imgdir = os.path.dirname(self.qemuboot)
-            if imgdir != self.get('DEPLOY_DIR_IMAGE'):
+            imgdir = os.path.realpath(os.path.dirname(self.qemuboot))
+            if imgdir != os.path.realpath(self.get('DEPLOY_DIR_IMAGE')):
                 logger.info('Setting DEPLOY_DIR_IMAGE to folder containing %s (%s)' % (self.qemuboot, imgdir))
                 self.set('DEPLOY_DIR_IMAGE', imgdir)
 
-- 
2.11.0.rc2.dirty


