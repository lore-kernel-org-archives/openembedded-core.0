Return-Path: <michael.g.wood@intel.com>
Received: from mail-we0-f180.google.com (mail-we0-f180.google.com
	[74.125.82.180])
	by mail.openembedded.org (Postfix) with ESMTP id 40E9060034
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Jan 2015 11:57:56 +0000 (UTC)
Received: by mail-we0-f180.google.com with SMTP id m14so26716907wev.11
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Jan 2015 03:57:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=k2J2pdA2NmkUH9guqx0vDBin94Gi18xiEQwAlCgCF9o=;
	b=A3xMfxAqDlQi68SVs39fJ20pmkWzsS00ORymr0w8pF95sLltif8BataRh0ZSQaQnVz
	HJs/JQa15NWo8XtqXLWJ50M8q9/W5mTH+t/shNr9jYTQvAxL0K0dqphLgnOWQ8NgNOLL
	mFJgKHdiiTesvi161qUjSEBHApnLVSiddK5UYcjJKJCcSQwIMkj1MvRPaoBuRGUizzUB
	zjHFC3WOVZh/LNyxO62YzyhDeqXUx/jqEVEl2mG56zSvehTkuYYY9vHi3aF/ZEf/turr
	KOqsWkY/UWauAqCwxE+4yBFrwHCTsDrU6u2Vg8KpONyrI5IzVV+NhllofhgP06wLJ5D8
	+79A==
X-Gm-Message-State: ALoCoQkeGc+eERKhY9tjLqg1+ZroPt0eQs7v05rIH7/ZvO4jppQiOCZ1yKbWaBG2C9VNq1YUm4FY
X-Received: by 10.194.3.40 with SMTP id 8mr5646783wjz.98.1422619077446;
	Fri, 30 Jan 2015 03:57:57 -0800 (PST)
Received: from draco.icx.intel.com ([83.217.123.106])
	by mx.google.com with ESMTPSA id
	gm10sm6591346wib.19.2015.01.30.03.57.56
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 30 Jan 2015 03:57:56 -0800 (PST)
From: Michael Wood <michael.g.wood@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 30 Jan 2015 11:57:45 +0000
Message-Id: <1422619065-28018-1-git-send-email-michael.g.wood@intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1422613494.25715.1.camel@linuxfoundation.org>
References: <1422613494.25715.1.camel@linuxfoundation.org>
Subject: [PATCH] report-error: Catch un-readable log data
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
X-List-Received-Date: Fri, 30 Jan 2015 11:58:04 -0000

If a log data cannot be decoded to utf-8 or read then handle this
gracefully. This can happen if a log file contains binary or something
goes wrong with the file read process.

Signed-off-by: Michael Wood <michael.g.wood@intel.com>
---
 meta/classes/report-error.bbclass | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/classes/report-error.bbclass b/meta/classes/report-error.bbclass
index 8b30422..750042b 100644
--- a/meta/classes/report-error.bbclass
+++ b/meta/classes/report-error.bbclass
@@ -48,7 +48,11 @@ python errorreport_handler () {
             taskdata['task'] = task
             if log:
                 logFile = open(log, 'r')
-                taskdata['log'] = logFile.read()
+                try:
+                    taskdata['log'] = logFile.read().decode('utf-8')
+                except:
+                    taskdata['log'] = "Unable to read log file"
+
                 logFile.close()
             else:
                 taskdata['log'] = "No Log"
-- 
2.1.0


