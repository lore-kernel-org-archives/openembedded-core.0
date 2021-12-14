Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CD7FC433F5
	for <webhook@archiver.kernel.org>; Tue, 14 Dec 2021 01:21:20 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by mx.groups.io with SMTP id smtpd.web10.20093.1639444861529217620
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Dec 2021 17:21:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=intel header.b=jP2VAfF8;
 spf=pass (domain: intel.com, ip: 134.134.136.24,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1639444879; x=1670980879;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=MeQW4eMrzteROjiofR9UdC6VrQNLz7l33J0icJGLwys=;
  b=jP2VAfF8CYOTbro5S6EhwACEprkmgCfUI/UGIPAiqOdZl4eR0UUGTxZ0
   xm6n/0cPfGDZvq43sSKqyqLiihhl3LIHSZ8aV4r/fW5kjR2teJSwQ3jpB
   XQtXnrR/L6JV5+lh+RRMnbryQIxdZD3rzzrKfb1MPseSMAfVRuy0VqrLn
   nMMFdDG8OTIxMEF5CBz4CMN3M3DvvdNMF7lKe7WaTXQPTJMNdj0yB7JyE
   9S8XO+k1NTM4IulAxQ6Hup+1rG449AVrq/gUgrOe2Sa1XLz+ZwdWacWrw
   s6hve8uUxrrGGFUTS3Aqmy8Y/RpXV8ymYRESWheXafdcZGTP8idexNXlC
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10197"; a="238682542"
X-IronPort-AV: E=Sophos;i="5.88,204,1635231600";
   d="scan'208";a="238682542"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2021 17:21:19 -0800
X-IronPort-AV: E=Sophos;i="5.88,204,1635231600";
   d="scan'208";a="464869219"
Received: from zyteoh-mobl.gar.corp.intel.com (HELO anmitta2-mobl3.intel.com)
 ([10.215.239.31])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2021 17:21:18 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 12/17] runqemu: check the qemu PID has been set
 before kill()ing it
Date: Tue, 14 Dec 2021 09:20:47 +0800
Message-Id: 
 <48bd07808672fe84a452a5b0f4f4b6ff7daa32ae.1639444641.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1639444641.git.anuj.mittal@intel.com>
References: <cover.1639444641.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Dec 2021 01:21:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159674

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
index c467b0eb19..66e035c9af 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -1580,7 +1580,8 @@ def main():
 
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


