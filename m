Return-Path: <ross.burton@intel.com>
Received: from mail-we0-f176.google.com (mail-we0-f176.google.com
	[74.125.82.176])
	by mail.openembedded.org (Postfix) with ESMTP id 686986DF72
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Dec 2013 10:47:42 +0000 (UTC)
Received: by mail-we0-f176.google.com with SMTP id w62so455386wes.21
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Dec 2013 02:47:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=bZ/7AQ/INvLehCwqB7JgnfrtuUykXq/HV+Ik7Xl/O08=;
	b=XCNMjWRw1l1n0QjXImoe6ILreIkCUlN2CbH/l4vKttlN3sb9ERn8QmDo8AX9C1/rPv
	hU9RzB59wTKWwHx7bUYddlP4/nUNuHDpiuN3vVddSA0/0xAYRRs8evi3vO+3Z9k1+iDg
	pd8sI5ag9HyCdO7sed8bIQqFnjwd8jiY8XQ6ux1357kmbfXrhSnM+2wwExsnzP3cspaI
	cbicAGkD3yQHueLRmXW4lv6q9j93YWFviRWwvjOwjGJ1pKQvx+Qxfx6iMUUYPYYJREx6
	rGRiUa4NpXVZCJDPPV+H7u6nZ92QDfCweECXqEs3S19BQxOjvavNXAa6vUy+MQ0yJmg8
	Yjfw==
X-Gm-Message-State: ALoCoQk48S8Vy52vjcgD/en1WTn+lhku3bqdsJCfgcCOa+fGrDYdnvz8ULs3VYb0pO9Fy/VfqVx1
X-Received: by 10.180.14.195 with SMTP id r3mr1770450wic.51.1386326861204;
	Fri, 06 Dec 2013 02:47:41 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id je17sm5039957wic.4.2013.12.06.02.47.39
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 Dec 2013 02:47:40 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 Dec 2013 10:47:37 +0000
Message-Id: <1386326857-24765-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] python-imaging: fix compilation with Freetype 2.5.1
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
X-List-Received-Date: Fri, 06 Dec 2013 10:47:43 -0000

Take a patch from the Pillow "friendly fork" to fix compilation with Freetype
2.5.1.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../python-imaging/fix-freetype-includes.patch     |   30 ++++++++++++++++++++
 .../python/python-imaging_1.1.7.bb                 |    3 +-
 2 files changed, 32 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/python/python-imaging/fix-freetype-includes.patch

diff --git a/meta/recipes-devtools/python/python-imaging/fix-freetype-includes.patch b/meta/recipes-devtools/python/python-imaging/fix-freetype-includes.patch
new file mode 100644
index 0000000..9ecc63a
--- /dev/null
+++ b/meta/recipes-devtools/python/python-imaging/fix-freetype-includes.patch
@@ -0,0 +1,30 @@
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+From c6040f618d8f2706a7b46d1cdf37d1a587f9701f Mon Sep 17 00:00:00 2001
+From: Andrew Stromnov <stromnov@gmail.com>
+Date: Thu, 28 Nov 2013 16:58:43 +0400
+Subject: [PATCH] fix compiling with FreeType 2.5.1
+
+---
+ _imagingft.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/_imagingft.c b/_imagingft.c
+index 47d50bd..f19555b 100644
+--- a/_imagingft.c
++++ b/_imagingft.c
+@@ -59,7 +59,11 @@ struct {
+     const char* message;
+ } ft_errors[] =
+ 
++#if defined(USE_FREETYPE_2_1)
++#include FT_ERRORS_H
++#else
+ #include <freetype/fterrors.h>
++#endif
+ 
+ /* -------------------------------------------------------------------- */
+ /* font objects */
+-- 
+1.8.5.1
diff --git a/meta/recipes-devtools/python/python-imaging_1.1.7.bb b/meta/recipes-devtools/python/python-imaging_1.1.7.bb
index e100358..efc57cf 100644
--- a/meta/recipes-devtools/python/python-imaging_1.1.7.bb
+++ b/meta/recipes-devtools/python/python-imaging_1.1.7.bb
@@ -8,7 +8,8 @@ PR = "r5"
 
 SRC_URI = "http://effbot.org/downloads/Imaging-${PV}.tar.gz \
            file://0001-python-imaging-setup.py-force-paths-for-zlib-freetyp.patch \
-           file://allow.to.disable.some.features.patch"
+           file://allow.to.disable.some.features.patch \
+           file://fix-freetype-includes.patch"
 
 SRC_URI[md5sum] = "fc14a54e1ce02a0225be8854bfba478e"
 SRC_URI[sha256sum] = "895bc7c2498c8e1f9b99938f1a40dc86b3f149741f105cf7c7bd2e0725405211"
-- 
1.7.10.4


