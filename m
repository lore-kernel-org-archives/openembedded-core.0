Return-Path: <brian.avery@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 830347773F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Mar 2017 00:02:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1489536146; x=1521072146;
	h=from:to:cc:subject:date:message-id:in-reply-to: references;
	bh=g8lwqX4zA0v7Wk9yYpV6vVjP0AMxFqdP7pP961jX7Yg=;
	b=OlbBFv16p6LSaEb2COkVeKNmze7xgjy5HJv+uiMIhINbXXVd8sFK1Pll
	LC1qEtFzQeXtAsuYUarDSNNdVapR+w==;
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	14 Mar 2017 17:02:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,166,1486454400"; d="scan'208";a="944347732"
Received: from bavery-ws-desk.jf.intel.com ([10.7.198.85])
	by orsmga003.jf.intel.com with ESMTP; 14 Mar 2017 17:02:25 -0700
From: brian avery <brian.avery@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Mar 2017 17:04:32 -0700
Message-Id: <44af73e99b58322b14a9490f67c9417377404966.1489534872.git.brian.avery@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1489534872.git.brian.avery@intel.com>
References: <cover.1489534872.git.brian.avery@intel.com>
Subject: [PATCH 1/1] gen-lockedsig-cache: catch os.link error
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
X-List-Received-Date: Wed, 15 Mar 2017 00:02:24 -0000

We do a hard link to speed up sdk creation but if your sstate-cache is
across a file system boundary, this tries and fails. This patch catches
that error and does a copy instead.

Signed-off-by: brian avery <brian.avery@intel.com>
---
 scripts/gen-lockedsig-cache | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/scripts/gen-lockedsig-cache b/scripts/gen-lockedsig-cache
index 49de74ed..1cfbeae 100755
--- a/scripts/gen-lockedsig-cache
+++ b/scripts/gen-lockedsig-cache
@@ -63,6 +63,12 @@ for f in files:
     if (os.stat(src).st_dev == os.stat(destdir).st_dev):
         print('linking')
         os.link(src, dst)
+        try:
+            os.link(src, dst)
+        except Exception:
+            print('hard linking failed, copying')
+            shutil.copyfile(src, dst)
+        os.link(src, dst)
     else:
         print('copying')
         shutil.copyfile(src, dst)
-- 
1.9.1


