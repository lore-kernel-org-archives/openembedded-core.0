Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f50.google.com (mail-wm0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id 24A6177298
	for <openembedded-core@lists.openembedded.org>;
	Sat, 27 Feb 2016 22:08:22 +0000 (UTC)
Received: by mail-wm0-f50.google.com with SMTP id l68so14929771wml.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 27 Feb 2016 14:08:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=mXc5IlnQ538V6q0y8Yz6R0P0gIhxd/Cy2f6cPl98rFU=;
	b=YdEqrlFj3pQBLnpGCbtyFFet7m0vnUMA0Szll3+ViH/SPwD0qD6N8EFpgyawXh+Jny
	94CLgGDA1VE1uycO6CvQCr+FpjDyOmwLSNzfn7Kfo+lDXy0ILgAmvVECtGyFVqX7HEZF
	iOUDNbhzoGRp1Du2vkR9bst5MuA3jx4mUo5XUvJT/7FVr/gHxMApWLy5wKZSwjMH4EGL
	lp4NrNvfp7HW0dsvgcZ0qGQE2RHRiVgqFwHRKGQdhpz0MIxfUqyMi8aa5ezeiJkJQkQf
	GESglmgZZOVvZKfIkKADtQxmSKRosaTFMlq4NL4vsozn6TwixomeW5t1nKLXOpOpnoqA
	fHLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=mXc5IlnQ538V6q0y8Yz6R0P0gIhxd/Cy2f6cPl98rFU=;
	b=m74BrrvadPQqlKT2eHxgZ/JxT/V7SUUmSgivNnjfgARbnn19hkkiEOfVbMimdAx799
	Td52ow1s+/D7+xVg4S80ujmVI7LOn81LvGS1qr8DB4TBjofdC+iEjeIN9+ddo5esa0+c
	aOY+tH3ujNYFRDlydBEFLXI2CQ/0U/QRhZ8FzATtpA+nLuNM+SQL1wkg1NZ/POZhJEBR
	RgkfOTykBffiapwH9DmmBTFtR75/PAQ715OGuPL8rWODhkkC15qFvUw+Q3RlMnBg0s0D
	LmvLEOOIPlJSrAbl0oYDLAWoW71frSq5zq84DBccLRGOWhnuQcYYZjciARX9AR8pNVN5
	7Ogg==
X-Gm-Message-State: AD7BkJIQ5jDUA1q6Oa4NJHXJ4Jv4C/dCvstZ8yUUMiYbonB+iQjDy+yZH3PjDAL/I3Pzrw==
X-Received: by 10.28.53.4 with SMTP id c4mr4470256wma.34.1456610903296;
	Sat, 27 Feb 2016 14:08:23 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id 63sm7783731wms.1.2016.02.27.14.08.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 27 Feb 2016 14:08:22 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 27 Feb 2016 23:09:47 +0100
Message-Id: <1456610987-17836-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.7.1
Subject: [PATCH][RFC] base.bbclass: Introduce EXTRA_CONF_PACKAGECONFIG variable
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
X-List-Received-Date: Sat, 27 Feb 2016 22:08:25 -0000

* add separate variable for configuration options generated from
  PACKAGECONFIG setting, this helps other bbclasses and recipes
  to take advantage of PACKAGECONFIG mechanism, without including
  other options from EXTRA_OECONF
* e.g. meta-qt5 recipes are abusing EXTRA_OECONF to get options
  from PACKAGECONFIG:
  EXTRA_QMAKEVARS_PRE +=
  but with
  conf/distro/include/no-static-libs.inc
  it means getting --disable-static as invalid option inside
  EXTRA_QMAKEVARS_PRE as reported by Alexandre Belloni who tried
  to use poky with meta-qt5.
* once we migrate all bbclasses and recipes to EXTRA_CONF_PACKAGECONFIG
  we should also restrict EXTRA_OECONF append only to autotools.bbclass
  like I did for cmake.bbclass

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/base.bbclass  | 9 ++++++---
 meta/classes/cmake.bbclass | 2 ++
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 1372f38..6e94995 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -428,9 +428,12 @@ python () {
                     extraconf.append(items[1])
         appendVar('DEPENDS', extradeps)
         appendVar('RDEPENDS_${PN}', extrardeps)
-        if bb.data.inherits_class('cmake', d):
-            appendVar('EXTRA_OECMAKE', extraconf)
-        else:
+        appendVar('EXTRA_CONF_PACKAGECONFIG', extraconf)
+
+        # TODO once are all recipes/bbclass abusign EXTRA_OECONF
+        # to get PACKAGECONFIG options fixed to use EXTRA_CONF_PACKAGECONFIG
+        # move this append to autotools.bbclass
+        if not bb.data.inherits_class('cmake', d):
             appendVar('EXTRA_OECONF', extraconf)
 
     pn = d.getVar('PN', True)
diff --git a/meta/classes/cmake.bbclass b/meta/classes/cmake.bbclass
index 22cd61e..122718e 100644
--- a/meta/classes/cmake.bbclass
+++ b/meta/classes/cmake.bbclass
@@ -27,6 +27,8 @@ OECMAKE_EXTRA_ROOT_PATH ?= ""
 OECMAKE_FIND_ROOT_PATH_MODE_PROGRAM = "ONLY"
 OECMAKE_FIND_ROOT_PATH_MODE_PROGRAM_class-native = "BOTH"
 
+EXTRA_OECMAKE_append = " ${EXTRA_CONF_PACKAGECONFIG}"
+
 # CMake expects target architectures in the format of uname(2),
 # which do not always match TARGET_ARCH, so all the necessary
 # conversions should happen here.
-- 
2.7.1


