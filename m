Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id A3DC96612C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jun 2016 15:18:52 +0000 (UTC)
Received: by mail-wm0-f42.google.com with SMTP id m124so127995364wme.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jun 2016 08:18:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=31YXYNQGKOK3k4lHdZEVOwkqq89QeDEVQYQ2h8JdT04=;
	b=iJae0TlbPP1TdEaRMDE5BUBcAgdUS1uNnyk722vMoF2XYicBUK7IIfuPdDqILBZ5mO
	Krh1S25ZWYu5LzJNPVEQb/jdclEAnTWhfHsUrs86Pq+1z/8mWhaeIIBZkO2Mtj76ScMd
	t2uXDtESQQ76pQFv3QZXidfyhqOUFVVGywIdxvgl5a1Z32eWWYn+9jUgQ5AFwdsF48Z/
	Kz8zuzC4HO7PziTVS0cFbyguWzBPViJkVNSBIRubCGJEL05CscvE0NAlDwwQ3Ggb8pcu
	CMVrwciJVXQIDgib0isnFgGdYf0bLD8Us1rWPAF+ttwb8+Bq6ushHscsDSjSLozhCeqt
	2Psg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=31YXYNQGKOK3k4lHdZEVOwkqq89QeDEVQYQ2h8JdT04=;
	b=AR4L+mvszsdv8CIewMbfhj5iynRGbN0D0so5CYo+3OLmgGIQ/TME91HPTEp+B9b7ne
	EYi7YCTfj8HmZqOBirtO1/4yMp87VpvLS3xOjMFVAe4IsH60RUZQVxLgrqKsxUBrPx7O
	V8Ub3SaImX1hx2sUYjfaGc04z0Y7Aa06BTOBcC+XBM4dlHhf0DvG5SnedkXlkDdxjqPD
	PvXp9gJWwYGhPLHfQguSzCRnonE0jVZ6Ld2i44ZnQs1jdiVKsx8WsucF8147+MzMISaT
	g6uhjyiO8lwR/tp3yGtmum2Juowgwp7AuVxdsM+RfMwMcvecprGLLuhj9xtFrCfbL6Ae
	gFAQ==
X-Gm-Message-State: ALyK8tIjdevbrTSz2vCahLA7ZUxtsVHGMVsjxOAjZpa/8IjkT8YASmkI/MhhcxPiyqLBAGOJ
X-Received: by 10.28.223.215 with SMTP id w206mr5208454wmg.61.1465917532288;
	Tue, 14 Jun 2016 08:18:52 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	zc7sm33426328wjb.42.2016.06.14.08.18.51
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 14 Jun 2016 08:18:51 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Jun 2016 16:18:49 +0100
Message-Id: <1465917529-18674-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.0.rc3
Subject: [PATCH] classes/rm_work: use the idle I/O scheduler class
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
X-List-Received-Date: Tue, 14 Jun 2016 15:18:53 -0000

As rm_work is just cleanup it shouldn't starve more important tasks such as
do_compile of I/O, so use BB_TASK_IONICE_LEVEL to run the task in the idle
scheduler class.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/rm_work.bbclass | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/classes/rm_work.bbclass b/meta/classes/rm_work.bbclass
index 3ebf095..3e6c5ac 100644
--- a/meta/classes/rm_work.bbclass
+++ b/meta/classes/rm_work.bbclass
@@ -15,6 +15,9 @@
 # to try and reduce disk usage
 BB_SCHEDULER ?= "completion"
 
+# Run the rm_work task in the idle scheduling class
+BB_TASK_IONICE_LEVEL_task-rm_work = "3.0"
+
 RMWORK_ORIG_TASK := "${BB_DEFAULT_TASK}"
 BB_DEFAULT_TASK = "rm_work_all"
 
-- 
2.8.0.rc3


