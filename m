Return-Path: <michael.g.wood@intel.com>
Received: from mail-we0-f179.google.com (mail-we0-f179.google.com
	[74.125.82.179])
	by mail.openembedded.org (Postfix) with ESMTP id DFFBA60132
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Jan 2015 16:36:41 +0000 (UTC)
Received: by mail-we0-f179.google.com with SMTP id q59so23896563wes.10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Jan 2015 08:36:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=/F4nrKBfpyP9P+pPHLuMQFE+1bM6i0COlxTDf30RnEg=;
	b=FY8edTZNjDQ5lr8ewLNBRyla3Z9LwdLOCyxGbArkCrGQCI4uisB/xG5m/lLI5IWIgj
	9J7QU1qJWVZd4wlUmjAmninljxgMGGQX4vJt0NfnwUzN8yBtzVbF013tY7kh/vC/LYD2
	+IQrCiccx/wteiAm1LV4VPVEU++CuxcqcKI25Cfpm2hfmf2YYecbZWM+3BKu/+EAHi7F
	dc1DZ2xlYOJVL6yOowxbfayDYz/gwstNxktVW7QfR4JWjam9WM6JtZwKncU2P4xz81rZ
	PoF/UCHjfw5TxJVxXycBaggRlxqxrfRnskCAjkRrPd47Kzzu+cJq8IXs9IBiH64mZV1c
	Mc5w==
X-Gm-Message-State: ALoCoQn/MRIyF6rxGPsHFI7Puk6izqVmKF3QqzdVWj6R8/beJ+Sz9Kgxnryg9OQD/Nx37V6xIvah
X-Received: by 10.194.93.129 with SMTP id cu1mr2981837wjb.44.1422549401425;
	Thu, 29 Jan 2015 08:36:41 -0800 (PST)
Received: from draco.icx.intel.com ([83.217.123.106])
	by mx.google.com with ESMTPSA id d6sm3176853wic.1.2015.01.29.08.36.40
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 29 Jan 2015 08:36:40 -0800 (PST)
From: Michael Wood <michael.g.wood@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 29 Jan 2015 16:36:09 +0000
Message-Id: <1422549369-23245-1-git-send-email-michael.g.wood@intel.com>
X-Mailer: git-send-email 2.1.0
Subject: [PATCH] report-error: Add a check for binary log file
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
X-List-Received-Date: Thu, 29 Jan 2015 16:36:47 -0000

Check to see if the log file is a binary. If it is do not try to submit
it in our error-report.

[YOCTO #7263]

Signed-off-by: Michael Wood <michael.g.wood@intel.com>
---
 meta/classes/report-error.bbclass | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/meta/classes/report-error.bbclass b/meta/classes/report-error.bbclass
index 8b30422..101fe9b 100644
--- a/meta/classes/report-error.bbclass
+++ b/meta/classes/report-error.bbclass
@@ -24,6 +24,15 @@ def errorreport_savedata(e, newdata, file):
         json.dump(newdata, f, indent=4, sort_keys=True)
     return datafile
 
+def errorreport_testlogforbinary(data):
+    for c in data:
+      # If the data contains non visible character below 10 it's a binary
+      if (ord(c) < 10):
+        return True
+
+    return False
+
+
 python errorreport_handler () {
         import json
 
@@ -48,7 +57,13 @@ python errorreport_handler () {
             taskdata['task'] = task
             if log:
                 logFile = open(log, 'r')
-                taskdata['log'] = logFile.read()
+                # Detect binary log output
+                logdata = logFile.read()
+                if  errorreport_testlogforbinary(logdata):
+                    taskdata['log'] = "Log in binary format"
+                else:
+                    taskdata['log'] = logdata
+
                 logFile.close()
             else:
                 taskdata['log'] = "No Log"
-- 
2.1.0


