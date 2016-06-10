Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f52.google.com (mail-wm0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id 11E2762135
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jun 2016 11:38:54 +0000 (UTC)
Received: by mail-wm0-f52.google.com with SMTP id m124so98181625wme.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jun 2016 04:38:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=v52D6avfAouYLNx7dPIBdGnFzxUJHVWWkq9Q/3tZdog=;
	b=mt5F5sQEFDy20h6j8Vnt+zQ2h74FWCJVYcixbodl3Kodg2amhV+17F0sJCS2ByexlD
	iugvZgG5qznwwCFmFWvqkh/kRydq0OJZvCRUOqBJGmgl3tVaIKOQE7Z3F4jE/FX3BJbO
	AHa/rAYw1q2sx4fEJM0TiR/PzTWaJnMqduC56Ia8DMEfpVX/d+2R/mA1yTsiAKJt77FA
	L5IjzgXJzaRCFF8BS6T+9XKEmI/uiLuLyPx7YvLaY9ImLJFFxOjh4tupUbsm7SSvIPnc
	r9D0kIfijP5WiWQpSjBXFFozS5Tv5VbWCsR8a11bMo0bOEMC3dMc1DJ5im3d4YUoL2n+
	0w2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=v52D6avfAouYLNx7dPIBdGnFzxUJHVWWkq9Q/3tZdog=;
	b=IJ1F07M82N2iWyMDMtwNpNWebp5gAmxVflPXhbazeu1z70MParF0gGAqDexzjYNFsE
	9dC61JQlhyXUnxZhzqfaK4p0OHS7QeQPqI2YPqpYYTsn9m3IP4jMDn2kWfZHm0aanToO
	li8TDFsntNMlrlkw+Trldyn+Bv7Oj09gLBTdrHHrIuWt3G+jInSriAMYmIU0L4ytQf4v
	IhQle0rQFEcxmnreyxN8mNPg4m0wmf9J1keIy8vQkv1H17e00hgWUuD9X3mL6MRiQYBo
	JpZliVx4Q9KpXtA7kdrUSuDzawS2btXCxi9tKMnJk8MdqgskRZY2BxtYrQGNIyLEPMJx
	2Wsg==
X-Gm-Message-State: ALyK8tKjRfmbg3aiGvOCH56f7rWS5xzWLuRz50gykOcbn8HiLPjScZpTVm2nPPd5wZP0O4M3
X-Received: by 10.194.167.39 with SMTP id zl7mr1851521wjb.98.1465558734979;
	Fri, 10 Jun 2016 04:38:54 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	c62sm12483763wmd.1.2016.06.10.04.38.53
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 10 Jun 2016 04:38:54 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 Jun 2016 12:38:52 +0100
Message-Id: <1465558732-26363-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.0.rc3
Subject: [PATCH] packagegroup-self-hosted: port to Python 3
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
X-List-Received-Date: Fri, 10 Jun 2016 11:38:55 -0000

A self-hosting packagegroup needs to ship Python 3 for bitbake, not Python 2.

Remove python-compiler as it was a standard module in Py2 and removed in Py3.

Remove python-misc as it is pulled in via python3-modules.

Remove python-rpm as it is only required by Smart, and if smart is installed
then python-rpm will be too.

[ YOCTO #9713 ]

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/packagegroups/packagegroup-self-hosted.bb | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb b/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
index c43e7e8..4e7fd4d 100644
--- a/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
@@ -148,12 +148,9 @@ RDEPENDS_packagegroup-self-hosted-extended = "\
     perl-dev \
     perl-modules \
     perl-pod \
-    python \
-    python-compiler \
-    python-git \
-    python-misc \
-    python-modules \
-    python-rpm \
+    python3 \
+    python3-modules \
+    python3-git \
     quota \
     readline \
     rpm \
-- 
2.8.0.rc3


