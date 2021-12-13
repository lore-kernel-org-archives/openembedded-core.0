Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73618C433FE
	for <webhook@archiver.kernel.org>; Mon, 13 Dec 2021 04:17:47 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by mx.groups.io with SMTP id smtpd.web12.7345.1639369051545710943
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Dec 2021 20:17:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=intel header.b=J6gDyjl4;
 spf=pass (domain: intel.com, ip: 134.134.136.65,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1639369066; x=1670905066;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=nXDQvlM8z2qnKJOjyA531iZGo2qggyFj34yiF9IYqHc=;
  b=J6gDyjl42JR1/bJZZquemlQ5RpT4ID4EQE9x45IX0fr01EG3byvOug67
   ZT0lutm1bH3ew4Z++MdVpN+/gWb2aV5gZPK1JSJ9UYX4eKbotDBvrdXx2
   pdQfC2862JG7uz+l2mEF887Yqmdttv2UM3ya6ibg0tQxv5x26jHAiKvTf
   BKiEvpokW5hA1VeB0JibCZor0NNOVvrRKuE3fWvIitcnykcONa6OC33ie
   eXNKLLXPAq9P6NCa366a0UKbL++TA6TFtHYur0HIpvp1gdb4JfjxVVOcC
   RWG+2ugOMqe5EAtuFGlQajVz7TFROcmYYmtWtw2axTmxbDtF121Tr+Lec
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10196"; a="238602243"
X-IronPort-AV: E=Sophos;i="5.88,201,1635231600";
   d="scan'208";a="238602243"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2021 20:17:46 -0800
X-IronPort-AV: E=Sophos;i="5.88,201,1635231600";
   d="scan'208";a="517589303"
Received: from echan1-mobl.gar.corp.intel.com (HELO anmitta2-mobl3.intel.com)
 ([10.213.132.97])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2021 20:17:45 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 12/20] runqemu: check the qemu PID has been set
 before kill()ing it
Date: Mon, 13 Dec 2021 12:17:11 +0800
Message-Id: 
 <7e37e453e15114dec0b89636e92f93c7fa127ae4.1639365111.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1639365111.git.anuj.mittal@intel.com>
References: <cover.1639365111.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Dec 2021 04:17:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159602

From: Ross Burton <ross@burtonini.com>

If runqemu is killed, check that we have a valid PID for the qemu before
sending a kill() to it.

[ YOCTO #14651 ]

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 0f3afbd3a6a6bef668612f818517df7543c0a683)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 scripts/runqemu | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index f3527a4412..f9a1a0da32 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -1573,7 +1573,8 @@ def main():
 
         def sigterm_handler(signum, frame):
             logger.info("SIGTERM received")
-            os.kill(config.qemupid, signal.SIGTERM)
+            if config.qemupid:
+                os.kill(config.qemupid, signal.SIGTERM)
             config.cleanup()
             # Deliberately ignore the return code of 'tput smam'.
             subprocess.call(["tput", "smam"])
-- 
2.33.1


