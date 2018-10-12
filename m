Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
	[209.85.221.51])
	by mail.openembedded.org (Postfix) with ESMTP id 140A760234
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Oct 2018 11:55:05 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id l6-v6so12714551wrt.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Oct 2018 04:55:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=XgcAJS/+rClFYL7zQ+hKW4id096tPXOgwlmTHmQLhGU=;
	b=O3t/JT7wIFZ5JpbL6nIy6HtQ2Oz4twhsw6i8HLT1X8VSFp0ZLEk/ChdRMzPqX4cFY6
	uVhVGTjip2lD4Mx3ONJex98Kqswp7o3A19RqI8GOxHQgArD47y/P2YGRV7tG111Oeuum
	88aJijAdNWIKvdWVygSNFuqSvx+1QCetp4VLwgyiCR7CPWTRGmSl/Y+7fxYBpmRG1d22
	1p/vn3+Prody6VnZqYe8+Go/IZPdM4t0nJVw2VEUhlitRUuN4a/r+4GjjK1H1A8KZqaK
	tObIOTcoXsjI6KfwMkfQD+hx1O3qsR5bT34ePQiSQji4MVZQ6cYSewxV8Fgkdx9Cl881
	Utuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=XgcAJS/+rClFYL7zQ+hKW4id096tPXOgwlmTHmQLhGU=;
	b=pfusnhA75PIgt7i7ZGCH/QlTsd3hthaq493m1r1hiVhgY9SJz6rw1a2M6DfZAaTnBD
	8n+2g5HbtlSsIHU1hQorEKjmTZkfxEdoa8ic8qqsM+eivdDFEhNJOlwaDdUjKU0WDO8S
	Lbb71vck0XCxrjyK4HidrJQuO8EA5xypSlguiFKLkgSxPPTd8cHEpP2q1P9feIN2N+lm
	PfEK9eo0vJpp60R+IPJp+DkZMWjAyFIJpVhDDmFpuVlLaE4MdmiZj/2PCROGfHs324WO
	2g9vvE2sS3d4qsS2N6/IqEhs5yxY3p4aFUnxlQRbM+PcYOiDftO6DzCztRy/Li4JI/hd
	cBYQ==
X-Gm-Message-State: ABuFfogeve9Tpwj+b0pJUOnE/SldNfAi0qPPSaiYe/MNJ7kYJieLj6wJ
	t+xsCnqlIN6xYuzTxQ92N/657Wli6Ck=
X-Google-Smtp-Source: ACcGV60cl0HboztQPBqnglB8l5wHJvjQIgql0zLnJJ9hdFDQFxCTPauNHS+JYH90y5Xv3hj5m6Taxw==
X-Received: by 2002:adf:ba87:: with SMTP id
	p7-v6mr4716853wrg.203.1539345306319; 
	Fri, 12 Oct 2018 04:55:06 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	a205-v6sm1223160wmh.19.2018.10.12.04.55.05
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 12 Oct 2018 04:55:05 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 12 Oct 2018 12:55:00 +0100
Message-Id: <20181012115502.14205-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH 1/3] python: don't wipe RDEPENDS when parsing manifest
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
X-List-Received-Date: Fri, 12 Oct 2018 11:55:06 -0000

We want to allow the main recipe to extend RDEPENDS directly, so don't wipe
RDEPENDS when reading the manifest.

This fixes the missing python-misc dependency from python-modules.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/python/python3_3.5.6.bb | 1 -
 meta/recipes-devtools/python/python_2.7.15.bb | 1 -
 2 files changed, 2 deletions(-)

diff --git a/meta/recipes-devtools/python/python3_3.5.6.bb b/meta/recipes-devtools/python/python3_3.5.6.bb
index e1796581342..489baa294fd 100644
--- a/meta/recipes-devtools/python/python3_3.5.6.bb
+++ b/meta/recipes-devtools/python/python3_3.5.6.bb
@@ -285,7 +285,6 @@ python(){
             for value in python_manifest[key]['cached']:
                     d.appendVar('FILES_' + pypackage, ' ' + value)
 
-        d.setVar('RDEPENDS_' + pypackage, '')
         for value in python_manifest[key]['rdepends']:
             # Make it work with or without $PN
             if '${PN}' in value:
diff --git a/meta/recipes-devtools/python/python_2.7.15.bb b/meta/recipes-devtools/python/python_2.7.15.bb
index 472c1da4bf7..f30d3f4d25c 100644
--- a/meta/recipes-devtools/python/python_2.7.15.bb
+++ b/meta/recipes-devtools/python/python_2.7.15.bb
@@ -240,7 +240,6 @@ python(){
                 if value.endswith('.py'):
                     d.appendVar('FILES_' + pypackage, ' ' + value + 'c')
 
-        d.setVar('RDEPENDS_' + pypackage, '')
         for value in python_manifest[key]['rdepends']:
             # Make it work with or without $PN
             if '${PN}' in value:
-- 
2.11.0


