Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id DE7876C543
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Dec 2018 20:35:19 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id y1so7276112wmi.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Dec 2018 12:35:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=MckTPQe0gDBiTt+2lEsjgxc5g/sSQfHSeW52NJWUSM4=;
	b=DlmrKc+qRcZXS1KxKWTmagc54XAIwD6x91x4QEIxORDOFUOJGIFl+/4BzdqoTp9uoO
	SgRSVjqBFuj8FDW2Fz+uAxnIUlnhOUevEuhM47khhWg6kmrZXZFlIaq8Iyay8ipyN+s+
	ptH9mEBSPlFkfReMVwitjwYgijAvysZt/D+KMJ98n3UCF4IMfgJtlwoNlGtRIoYb/0H3
	Q4TUBUwoD9dSO2JaqVjgbkmZ8ITNkLWk1m2eiquoH8g5VFDme0HZgqjguZoqcWT+oSkW
	d3gW+m53YUhnHTTcMzJs7Lsk47Ok2cusMA3UePW9f2/QuK9P5q/DARkkKyc+hNLc2f2v
	7KXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=MckTPQe0gDBiTt+2lEsjgxc5g/sSQfHSeW52NJWUSM4=;
	b=kr6aLUMqV+ibJkprw/atEJP5ubIBKrOsMC2C6mQMjVXR72UPV4Pw3QbexgQXeIshVf
	yBSvrD2ALyx4RIWlBd4ZCbq+3OmKA8HTzhX3oQ6ZRNfmSQSsBnoRFpNVXozwD/LPBm66
	9eR9c72ghfkMbZ73f6Wkqvs3aphSFTlhbO7MeNeEX1BHoYW/V2JlerXTMjhveMNz6GFZ
	DUFJ7b2n427Vs4o1gQ/JeesqqsKoCI6ZVu4QviT95OtVqj32L+7XMlrSnt9+tWfh3BMm
	aA5SFSPfDwPl0bLwyLO0pJxVHZZeK+9EO/AYwB70rFv3sfTzTg9Ck0vDX5VCXnjpjHc6
	LBuA==
X-Gm-Message-State: AA+aEWbda6+nObt+4uR/X7xrsbtKlIqfhYjlVdkRzeOIYknGU9PnXjHz
	+UfkFCOjqWinmGRT/8/2+FjIZXuoUC8=
X-Google-Smtp-Source: AFSGD/WA+s0VS6Mm/VBTsrsoIVRSvBbf9TdpC35W9D+KTwxGMYHOb9GmsvMDvWBSqMPP1cYx7cDnmg==
X-Received: by 2002:a1c:c543:: with SMTP id v64mr9219711wmf.123.1543869320165; 
	Mon, 03 Dec 2018 12:35:20 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	q2sm15361570wru.56.2018.12.03.12.35.19
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 03 Dec 2018 12:35:19 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Dec 2018 20:35:14 +0000
Message-Id: <20181203203516.26461-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH 1/3] oeqa: don't litter /tmp with temporary directories
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
X-List-Received-Date: Mon, 03 Dec 2018 20:35:20 -0000

If we need to create a temporary directory in targetbuild or buildproject use
tempfile.TemporaryDirectory so that when the test case is finished, the
directory is deleted.

Also synchronise the logic and don't possibly store the temporary directory in
self.tmpdir as nothing uses that.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/lib/oeqa/utils/buildproject.py | 5 ++++-
 meta/lib/oeqa/utils/targetbuild.py  | 5 +++--
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oeqa/utils/buildproject.py b/meta/lib/oeqa/utils/buildproject.py
index 7e9b84955f5..524015ede4b 100644
--- a/meta/lib/oeqa/utils/buildproject.py
+++ b/meta/lib/oeqa/utils/buildproject.py
@@ -17,7 +17,10 @@ class BuildProject(metaclass=ABCMeta):
         self.uri = uri
         self.archive = os.path.basename(uri)
         if not tmpdir:
-            tmpdir = tempfile.mkdtemp(prefix='buildproject')
+            tmpdir = self.d.getVar('WORKDIR')
+            if not tmpdir:
+                self.tempdirobj = tempfile.TemporaryDirectory(prefix='buildproject-')
+                tmpdir = self.tempdirobj.name
         self.localarchive = os.path.join(tmpdir, self.archive)
         self.dl_dir = dl_dir
         if foldername:
diff --git a/meta/lib/oeqa/utils/targetbuild.py b/meta/lib/oeqa/utils/targetbuild.py
index 1202d579fb0..b8db7b2aca0 100644
--- a/meta/lib/oeqa/utils/targetbuild.py
+++ b/meta/lib/oeqa/utils/targetbuild.py
@@ -20,8 +20,9 @@ class BuildProject(metaclass=ABCMeta):
         if not tmpdir:
             tmpdir = self.d.getVar('WORKDIR')
             if not tmpdir:
-                tmpdir = tempfile.mkdtemp(prefix='buildproject')
-        self.localarchive = os.path.join(tmpdir,self.archive)
+                self.tempdirobj = tempfile.TemporaryDirectory(prefix='buildproject-')
+                tmpdir = self.tempdirobj.name
+        self.localarchive = os.path.join(tmpdir, self.archive)
         if foldername:
             self.fname = foldername
         else:
-- 
2.11.0


