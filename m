Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id 409226FFC8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Apr 2016 13:31:40 +0000 (UTC)
Received: by mail-wm0-f42.google.com with SMTP id u206so125914053wme.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Apr 2016 06:31:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=l/7q75S3faD752EDHYwmpBOdknsRhn+e7+dpiBkshhQ=;
	b=hyom+il+JJXReEslUDljskNBgkS2XuWc6mXH/qa/8eec2ArePVDJLieJsIB3H0E7SK
	3LrBn4ZgmqRC36i1hrX7IHItpOGw9NB0ueeHaoowlntd+QALLWt4aLgypVduQvtNK0hj
	E+epLrZ46fIKpEhuWbJESjLrOhkj43cjSRJ2inptNGbypnlNphrGgi+go+jxFzZdmw9X
	kPTVlojKLUZPbi+F0vIZWEHSIyaSj5GE9gqNEXhZ2YnDl0qeMig6EWk+r2c7sSV9dkQ+
	K+5ld5wLwW368ljQMm7B3/vbJ7yPaB64/XQxajja/bHO5mAG/twn3W/eCv0/jVwOCv3+
	wx5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=l/7q75S3faD752EDHYwmpBOdknsRhn+e7+dpiBkshhQ=;
	b=DllTNWdkU+lIY456lyIAqwl5fd/tbyXuj0IAfw23t1UBxXg4iEvo9U5MfCW9YeIN80
	RwQIhIU5hvC2YbTA2RXQklBjdEH+Ui6f0xI4/6ZGWVScLypd5fef11HEh7mWghoIPg+B
	S9gmwm7yyzyTNuKegrRsMxi9tQ02sJGKqycKonK28TaxmSPPTzcHHJD8LwkjjEeRaSro
	3fLMrAB14Yakz+gwm9VTNW3WbLDh28sblkT6o87XxMWQdyQGQCOQtL0QkxmmcB64gml4
	LqVXr65qOYyfPlvO2Rslbsd6tsLKGtNU20VFF8H2WJ9lkREhE3cghOLeKElW9be0B8tV
	JIVQ==
X-Gm-Message-State: AOPr4FUXSKnoIMQnVhCBwFiPZc8XxHnLAvzTMUvJJIygXtl39Z782ySJSOKzHmzvgprrdm7y
X-Received: by 10.194.112.34 with SMTP id in2mr17453036wjb.160.1460640701206; 
	Thu, 14 Apr 2016 06:31:41 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	i206sm33380957wmf.1.2016.04.14.06.31.39
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 14 Apr 2016 06:31:39 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 Apr 2016 14:31:36 +0100
Message-Id: <1460640696-16164-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.0.rc3
In-Reply-To: <1460640696-16164-1-git-send-email-ross.burton@intel.com>
References: <1460640696-16164-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 2/2] oeqa/selftest/sstatetests: fix no-op sstate test
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
X-List-Received-Date: Thu, 14 Apr 2016 13:31:41 -0000

The test to verify that certain classes when inherited were no-ops only passed
if the build already inherited buildhistory.

To ensure that the test works as expected, use INHERITS_remove to ensure that
the classes are not inherited in the base run.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/lib/oeqa/selftest/sstatetests.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/lib/oeqa/selftest/sstatetests.py b/meta/lib/oeqa/selftest/sstatetests.py
index d41b1d3..acaf405 100644
--- a/meta/lib/oeqa/selftest/sstatetests.py
+++ b/meta/lib/oeqa/selftest/sstatetests.py
@@ -411,6 +411,7 @@ PARALLEL_MAKE = "-j 1"
 DL_DIR = "${TOPDIR}/download1"
 TIME = "111111"
 DATE = "20161111"
+INHERIT_remove = "buildstats-summary buildhistory"
 """)
         self.track_for_cleanup(topdir + "/tmp-sstatesamehash")
         bitbake("world meta-toolchain -S none")
-- 
2.8.0.rc3


