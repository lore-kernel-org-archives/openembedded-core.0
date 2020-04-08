Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web11.6909.1586329492053350241
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Apr 2020 00:04:52 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: changqing.li@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 03874oB5022197
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Wed, 8 Apr 2020 00:04:51 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
 14.3.487.0; Wed, 8 Apr 2020 00:04:50 -0700
From: "Changqing Li" <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] parselogs.py: ignore pulseaudio startup warning messages
Date: Wed, 8 Apr 2020 15:04:48 +0800
Message-ID: <1586329488-115444-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

If set default syslog to rsyslog, we can see below messages
in user.log,

[pulseaudio] authkey.c: Failed to open cookie file
[pulseaudio] authkey.c: Failed to load authentication key

They are only warnings when cookie file is not found. And
PulseAudio will create it if it doesn't exist.

refer:
https://wiki.archlinux.org/index.php/PulseAudio/Configuration
https://lists.freedesktop.org/archives/pulseaudio-discuss/2014-December/022719.html

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/lib/oeqa/runtime/cases/parselogs.py | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/runtime/cases/parselogs.py b/meta/lib/oeqa/runtime/cases/parselogs.py
index f94387c..a1791b5 100644
--- a/meta/lib/oeqa/runtime/cases/parselogs.py
+++ b/meta/lib/oeqa/runtime/cases/parselogs.py
@@ -58,7 +58,9 @@ common_errors = [
     "Failed to rename network interface",
     "Failed to process device, ignoring: Device or resource busy",
     "Cannot find a map file",
-    "[rdrand]: Initialization Failed"
+    "[rdrand]: Initialization Failed",
+    "[pulseaudio] authkey.c: Failed to open cookie file",
+    "[pulseaudio] authkey.c: Failed to load authentication key",
     ]
 
 video_related = [
-- 
2.7.4

