Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f50.google.com (mail-wm0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id 0092E60119
	for <openembedded-core@lists.openembedded.org>;
	Sun,  5 Jun 2016 21:52:44 +0000 (UTC)
Received: by mail-wm0-f50.google.com with SMTP id k204so4409904wmk.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 05 Jun 2016 14:52:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=FthxuYwdBvRlpaGyjYcefZStPpRBMXaiKQMuMHyU7mc=;
	b=D1HT0MOPMIdE06v0CF6eOPjw53qougSU7z3z1uWRFmbhexgarUiuEF7bO/Mn9+uw4w
	IRzs4kptMuBowS0bNvsaXLhDdj94/EUI3xZd2gfL+LBdQLnWhwnxfi5tY3WA8Zdyp/yT
	hK2kFrELDd0TSIGuDAUMAG0+0IVTCj3g5xivVX3AUswI4IAfp1G57ZO9+hkp0XPFOQIf
	9OaHArcoEjSpOf5qaSJU1Yl93Fk7rkUnY7yDWGrDijgqoySU2KT2uvmWgRd+Ce6jdvAf
	tcm2qkjRhEmQ6B9UjARbXqho4350yyd6JFJN4FGmy7DOW0jOHsG3WZVNJYB/5xMU7VbF
	LwiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=FthxuYwdBvRlpaGyjYcefZStPpRBMXaiKQMuMHyU7mc=;
	b=XbNCYGI2zEZF4t0UrquqBOaLW21UogJtdnNZ6CkGYTVNN3rQTaBaYGMkkpjA6tEcq3
	/TeusK8OhyyAoyyBFJR/nNtNqrvzK0xQAWSbNoubzzOeoAo3i+64S16beb6pF9Y0kEX5
	MFCmN4hDJT+sM6C7dk5k4/gOBCUh3+50RJ+shX3w7fBkCwyAnl7JYWnXvUGNRsthILdb
	atGHtwHqn/bjPjd6fv/+t3TeuP7tigxn/65OwVVtV7tXGI6nUf3OYZVGgQp/EJObxnb7
	KPSDhjriByoaC6Qf0vsDsvzWa5A4e6H/3DmtedLW0X+2iNPD2FKCdEeNuY+V0c4Go5q1
	VTBg==
X-Gm-Message-State: ALyK8tJJSNY3NqFzf8mu88y7tOQUHM69ieOqqALhZrtLV9gKP1JS1BPB2H2vwbsKH1RT19ZV
X-Received: by 10.28.17.3 with SMTP id 3mr9401237wmr.94.1465163564883;
	Sun, 05 Jun 2016 14:52:44 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	r76sm9175427wme.14.2016.06.05.14.52.43
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 05 Jun 2016 14:52:44 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  5 Jun 2016 22:52:42 +0100
Message-Id: <1465163562-17671-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.0.rc3
Subject: [PATCH] lib/oe/package_manager: adapt for Python 3
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
X-List-Received-Date: Sun, 05 Jun 2016 21:52:48 -0000

string.rstrip() doesn't exist in Python 3, so use the .rstrip method on the
object itself instead.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/lib/oe/package_manager.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index 71e5b50..3b1d24f 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -638,8 +638,8 @@ class PackageManager(object, metaclass=ABCMeta):
     def construct_uris(self, uris, base_paths):
         def _append(arr1, arr2, sep='/'):
             res = []
-            narr1 = [string.rstrip(a, sep) for a in arr1]
-            narr2 = [string.lstrip(string.rstrip(a, sep), sep) for a in arr2]
+            narr1 = [a.rstrip(sep) for a in arr1]
+            narr2 = [a.rstrip(sep).lstrip(sep) for a in arr2]
             for a1 in narr1:
                 if arr2:
                     for a2 in narr2:
-- 
2.8.0.rc3


