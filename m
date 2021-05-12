Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by mx.groups.io with SMTP id smtpd.web09.4074.1620808565759951992
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 May 2021 01:36:05 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.151, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: +ha+HOfAI7G3euBJ8krmd9YEkl53k74qr1Se6LfuAAseihINRJPFAtFIF1uG7LrrJH6Es/cSeW
 rmIpSh6sn5KA==
X-IronPort-AV: E=McAfee;i="6200,9189,9981"; a="179917781"
X-IronPort-AV: E=Sophos;i="5.82,293,1613462400"; 
   d="scan'208";a="179917781"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2021 01:36:04 -0700
IronPort-SDR: 6R6uANbAPA96ri3WfILVSPpDd97ZomcJmDtaJdAWiMGgeD4MhJkyjKeI0WSQoehiXqz5Y6Ep9m
 UWJssCSU31jw==
X-IronPort-AV: E=Sophos;i="5.82,293,1613462400"; 
   d="scan'208";a="430645735"
Received: from tmustofa-mobl1.amr.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.213.35.122])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2021 01:36:03 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 03/15] oeqa/qemurunner: Fix binary vs str issue
Date: Wed, 12 May 2021 16:35:35 +0800
Message-Id: <000feb98ff99e74d6118fc3f53330b8e975923d9.1620808329.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1620808329.git.anuj.mittal@intel.com>
References: <cover.1620808329.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

The recent logging changes for qemurunner showed up as errors on the
autobuilder where decode couldn't be called on the returned string.
Since the code returns binary data, return b'' instead of '' to match
to avoid tracebacks.

One of these cases was newly added, copied from the other which has
been there for a long time, always broken.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b8995b27db265b0a0b2d2ca595915f70f9f96e07)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/lib/oeqa/utils/qemurunner.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index 84f7c5e76d..526b493669 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -650,7 +650,7 @@ class LoggingThread(threading.Thread):
             data = self.readsock.recv(count)
         except socket.error as e:
             if e.errno == errno.EAGAIN or e.errno == errno.EWOULDBLOCK:
-                return ''
+                return b''
             else:
                 raise
 
@@ -663,7 +663,7 @@ class LoggingThread(threading.Thread):
             # until qemu exits.
             if not self.canexit:
                 raise Exception("Console connection closed unexpectedly")
-            return ''
+            return b''
 
         return data
 
-- 
2.31.1

