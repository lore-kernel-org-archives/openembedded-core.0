Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 0230774559
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Apr 2018 15:58:25 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id n10so3770373wmc.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Apr 2018 08:58:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=vMZghzcsX36IwBY5y/ktbzx7schHI3Vs68IHbz9FP1M=;
	b=cKzFQaN8YfwAvgpTDFE4SVohm9L3ZJfiBX8EuIax13+LM9H803KYlSL/cW1+ZR1/e0
	zwr1C0UkyPUjrD1U/5NunzrQJclSj4O2mPFw6QPIk8odf4qnyIvtl/+Qr0GYpF4F+Y58
	3XKOPSEZtj4OYJMUUN7qa3PkjOdid8nnsuEK6I6uhp1GV+Hn3uibaGXsshjmhCHc3hvz
	J1T73d9TavmltnYm6Dd1WAeyP5TTpCAeeslXpfgc4ccHatZby+VheNEX5e8ygbc+jd8D
	CjRLYAFdDeSfQyarQNIoRmUDH+9+0J0jtPL/6tAxSBorLj1VvWQmB8Q9/pstdoWpS7CG
	B8Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=vMZghzcsX36IwBY5y/ktbzx7schHI3Vs68IHbz9FP1M=;
	b=GBudJE6+BKY2nCK3kLAX54ln1NHhNXMNSbYPEwalSUhxRUv/o8Y1IvIAzVBc8xyIUF
	e8gfk3IYFk5gSiGUUixZ8O3/IS2/Izz0kyqbrEQVBpKzqParmFQ7CDD2tD4C0w7/uHkr
	qRWdTlQnXexJGprJaAFgfeeHNsPpauIKKj/pA9mV8ebYLK6lH1NQAJWl5EEH4sIqeK/h
	H6ZilLGm0xPUbeVLU0r+iDrl7ZQ+aiTR3BrYy/a7wm0YExed7Yx/nB5hFTaon6k9/tEW
	8j8L9q3hpbsYEsSuRkZ7lGauRDa3Ktk1NhhzfppAaoIBCx+zqgRZRRqnupHuB7eMN+Oc
	77BQ==
X-Gm-Message-State: ALQs6tAmmiHtY/Zt6g6fPBwi8oNLo8c1/0SSUugOmlER8kEFo0d7PItD
	gOI5pGiBxXTMPXLzpQiR7clU+3r2
X-Google-Smtp-Source: AB8JxZoFnO0DDyQCYHVOTU66FBaD4LvonfxaTz7IwYbAbk3xmBMKlUSBKFktrlW52vu5y4wkh9y//w==
X-Received: by 10.28.94.201 with SMTP id s192mr1862759wmb.42.1524844706109;
	Fri, 27 Apr 2018 08:58:26 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	q138sm1724000wmd.1.2018.04.27.08.58.25
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 27 Apr 2018 08:58:25 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 Apr 2018 16:58:22 +0100
Message-Id: <20180427155823.30464-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH 1/2] package_manager: expand the removal list for RPM
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
X-List-Received-Date: Fri, 27 Apr 2018 15:58:26 -0000

If package management is disabled we remove the state and configuration for the
package manager after the rootfs has been populated.  This list wasn't complete
and the DNF/RPM configuration files were left behind.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/lib/oe/package_manager.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index 2d8aeba037c..813f6799fef 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -668,7 +668,7 @@ class RpmPM(PackageManager):
         self.saved_packaging_data = self.d.expand('${T}/saved_packaging_data/%s' % self.task_name)
         if not os.path.exists(self.d.expand('${T}/saved_packaging_data')):
             bb.utils.mkdirhier(self.d.expand('${T}/saved_packaging_data'))
-        self.packaging_data_dirs = ['var/lib/rpm', 'var/lib/dnf', 'var/cache/dnf']
+        self.packaging_data_dirs = ['etc/rpm', 'etc/rpmrc', 'etc/dnf', 'var/lib/rpm', 'var/lib/dnf', 'var/cache/dnf']
         self.solution_manifest = self.d.expand('${T}/saved/%s_solution' %
                                                self.task_name)
         if not os.path.exists(self.d.expand('${T}/saved')):
-- 
2.11.0


