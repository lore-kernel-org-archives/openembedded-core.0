Return-Path: <dmitry.rozhkov@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 198BA77211
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Aug 2016 09:48:16 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP; 10 Aug 2016 02:48:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,499,1464678000"; d="scan'208";a="1033030888"
Received: from drozhkov-desk.fi.intel.com ([10.237.72.185])
	by orsmga002.jf.intel.com with ESMTP; 10 Aug 2016 02:48:17 -0700
From: Dmitry Rozhkov <dmitry.rozhkov@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 10 Aug 2016 12:47:56 +0300
Message-Id: <1470822476-2758-1-git-send-email-dmitry.rozhkov@linux.intel.com>
X-Mailer: git-send-email 2.5.5
Subject: [PATCH] systemd: fix typo in avoid-using-system-auth.patch
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
X-List-Received-Date: Wed, 10 Aug 2016 09:48:17 -0000

The patch 0015-systemd-user-avoid-using-system-auth.patch
makes PAM session for systemd-user include common-account file
which doesn't contain any session related lines and that breaks
launching "systemd --user" with the error:

Jul 29 13:03:24 intel-corei7-64 systemd[691]: user@0.service: Failed
at step PAM spawning /lib/systemd/systemd: Operation not permitted

This change fixes the patch by including common-session file
instead.

Signed-off-by: Dmitry Rozhkov <dmitry.rozhkov@linux.intel.com>
---
 .../systemd/systemd/0015-systemd-user-avoid-using-system-auth.patch     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd/0015-systemd-user-avoid-using-system-auth.patch b/meta/recipes-core/systemd/systemd/0015-systemd-user-avoid-using-system-auth.patch
index f7a5b19..6e6f344 100644
--- a/meta/recipes-core/systemd/systemd/0015-systemd-user-avoid-using-system-auth.patch
+++ b/meta/recipes-core/systemd/systemd/0015-systemd-user-avoid-using-system-auth.patch
@@ -29,7 +29,7 @@ index f188a8e..862d8d7 100644
  )m4_dnl
  session  required pam_loginuid.so
 -session  include system-auth
-+session  include common-account
++session  include common-session
 -- 
 2.8.3
 
-- 
2.5.5


