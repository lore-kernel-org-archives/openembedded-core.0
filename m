Received: from mga07.intel.com (mga07.intel.com [])
 by mx.groups.io with SMTP id smtpd.web12.8249.1595926401137223222
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Jul 2020 01:53:22 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: RaQ1SE61IEJHpw/axhosMzGl8bkXKHH7C06suSwOxlE0wdkdZLju3Q5zv9Y70InGfXHtUBWiAP
 LYBLWzonpYfQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9695"; a="215699773"
X-IronPort-AV: E=Sophos;i="5.75,405,1589266800"; 
   d="scan'208";a="215699773"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2020 01:53:22 -0700
IronPort-SDR: XRzsqw9da3e69u87RckQrgj8XI0gB+gnWMqFnP6b4VlimkKf4VgLczo0tRAh9OKGJ/3FsDa5cF
 kBcJR0nOx+4A==
X-IronPort-AV: E=Sophos;i="5.75,405,1589266800"; 
   d="scan'208";a="434245960"
Received: from unknown (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.137.161])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2020 01:53:21 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [zeus][PATCH 26/32] selftest/context: Avoid tracebacks from tests using multiprocessing
Date: Tue, 28 Jul 2020 16:51:27 +0800
Message-Id: <45b4bd7b4d30d81bdff0d471e8d97c2322ed2f75.1595924916.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <cover.1595924916.git.anuj.mittal@intel.com>
References: <cover.1595924916.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

We can see tracebacks where the SIGTERM handler catches things
it shouldn't. Avoid exit(1) unless we're the process that
it was intended for.

[YOCTO #13664]

(From OE-Core rev: d9c62ffac611310efd47ed6397d31dccb72fe868)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit dba8c1d5ef0b574b7772d59e5992bfad8b7cca13)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/lib/oeqa/selftest/context.py | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/context.py b/meta/lib/oeqa/selftest/context.py
index c4eb5d614e..3d3b19c6e8 100644
--- a/meta/lib/oeqa/selftest/context.py
+++ b/meta/lib/oeqa/selftest/context.py
@@ -280,11 +280,15 @@ class OESelftestTestContextExecutor(OETestContextExecutor):
         return rc
 
     def _signal_clean_handler(self, signum, frame):
-        sys.exit(1)
+        if self.ourpid == os.getpid():
+            sys.exit(1)
     
     def run(self, logger, args):
         self._process_args(logger, args)
 
+        # Setup a SIGTERM handler to allow restoration of files like local.conf and bblayers.conf
+        # but don't interfer with other processes
+        self.ourpid = os.getpid()
         signal.signal(signal.SIGTERM, self._signal_clean_handler)
 
         rc = None
-- 
2.25.4

