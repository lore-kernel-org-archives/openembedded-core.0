Return-Path: <jpewhacker@gmail.com>
Received: from mail-it1-f193.google.com (mail-it1-f193.google.com
	[209.85.166.193])
	by mail.openembedded.org (Postfix) with ESMTP id 031F86C4A2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Nov 2018 14:57:24 +0000 (UTC)
Received: by mail-it1-f193.google.com with SMTP id i7so3969186iti.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Nov 2018 06:57:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=p1iwQ6xjq35k2kiqPBzIDFCekLGMeoK7MsHn78fthcs=;
	b=QPuO/sUvstgShcyuORmYkyCuI0W6qV+GyljNFlzIiIj/bZK0N5+pgucS9PQEulG1ml
	fftXBgpd7EgYHywgUbOngLQJ8UcD4W+tAuwJvalscn8MBsar7PDgg7yXvITooek25DI8
	zTaPrXtgLDFL98kkrYKIKpQXOsgXsxO0F4Q0zgkcxpKHE6SzcBp/zyeUkmrrr/3Ecbtx
	HnyaFIliq4JhKtk9dIOhYlwJMNMWnRmj9TTj3XUucKq1vNEv/Fu7v2jaHBxr9+O0ypJU
	P8CouYjaW9LdZZGQ9lSv7kUB1ASUGVLHiOYbL3lWNItqCqm1sJOPNsYHTjqUZ7GUkZVp
	dyhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=p1iwQ6xjq35k2kiqPBzIDFCekLGMeoK7MsHn78fthcs=;
	b=RnJZICuEUazd9wuqx8x1bHHXOnY7EI3NkbHUXkuXRN+nOrlG34t2bKlfjATkFI08YO
	IF0BbU/+fi7s4GdV4e28r/y0bm4FzkKVKlUOMLif5FOj49y8EzQaRPZy/Hbjpr8OWbRk
	+ZozKJCvkcyADj6S/6cmBm4Qho+1ipTu6+WFBogDIOGCF5gMWl/McmQ7wXr3MU9N/XSV
	ldYMw/UOIEsYFVMCE/SavtNtUIjhrcSTpRjdMfJ/B3hFjDvuA7WTIoXJnettsK4dvl2x
	f8ahMUW0R3cUp2ZBpXzXwFHMsl37ysP6oKjdBz25IZmYaM2/5fBxsT2062F652Ho31ne
	rLGA==
X-Gm-Message-State: AA+aEWboftA46/3NniDp7CHhLGfVkyiTpZcabjbjWBxSCCHyxsR48UHH
	sRBtFO7kUYUuKxIkM3o5ao8xX7PpmRY=
X-Google-Smtp-Source: AFSGD/WYJU8In9Cd3Y+QL59dR46pWRVAipwtj58P1yp5lqFgWHx6C/6RfLjyWP1NPJKLXq4l8IUUbA==
X-Received: by 2002:a02:5618:: with SMTP id o24mr1576072jab.111.1543503445555; 
	Thu, 29 Nov 2018 06:57:25 -0800 (PST)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.gmail.com with ESMTPSA id
	n198sm744206iod.76.2018.11.29.06.57.24
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 29 Nov 2018 06:57:24 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 29 Nov 2018 08:57:20 -0600
Message-Id: <20181129145720.22520-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Subject: [PATCH] classes/update-alternatives: Skip alternatives when disabled
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
X-List-Received-Date: Thu, 29 Nov 2018 14:57:25 -0000
Content-Transfer-Encoding: 8bit

Skips the update alternative steps for recipes that shouldn't have them
enabled.

Fixes errors like:

 nativesdk-bzip2-1.0.6-r5 do_package: bzip2: alternative target
 (/opt/poky/2.5+snapshot/sysroots/i686-pokysdk-mingw32/usr/bin/bunzip2
 or
 /opt/poky/2.5+snapshot/sysroots/i686-pokysdk-mingw32/usr/bin/bunzip2.bzip2)
 does not exist, skipping...

When building mingw SDKs

[YOCTO #12962]

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes/update-alternatives.bbclass | 27 +++++++++++++++++++-----
 1 file changed, 22 insertions(+), 5 deletions(-)

diff --git a/meta/classes/update-alternatives.bbclass b/meta/classes/update-alternatives.bbclass
index aa01058cf99..ee663799332 100644
--- a/meta/classes/update-alternatives.bbclass
+++ b/meta/classes/update-alternatives.bbclass
@@ -89,15 +89,21 @@ def ua_extend_depends(d):
     if not 'virtual/update-alternatives' in d.getVar('PROVIDES'):
         d.appendVar('DEPENDS', ' virtual/${MLPREFIX}update-alternatives')
 
-python __anonymous() {
+def update_alternatives_enabled(d):
     # Update Alternatives only works on target packages...
     if bb.data.inherits_class('native', d) or \
        bb.data.inherits_class('cross', d) or bb.data.inherits_class('crosssdk', d) or \
        bb.data.inherits_class('cross-canadian', d):
-        return
+        return False
 
     # Disable when targeting mingw32 (no target support)
     if d.getVar("TARGET_OS") == "mingw32":
+        return False
+
+    return True
+
+python __anonymous() {
+    if not update_alternatives_enabled(d):
         return
 
     # compute special vardeps
@@ -128,6 +134,11 @@ populate_packages[vardeps] += "${UPDALTVARS} ${@gen_updatealternativesvars(d)}"
 # the split and strip steps..  packagecopy seems to be the earliest reasonable
 # place.
 python perform_packagecopy_append () {
+    if update_alternatives_enabled(d):
+        apply_update_alternative_renames(d)
+}
+
+def apply_update_alternative_renames(d):
     # Check for deprecated usage...
     pn = d.getVar('BPN')
     if d.getVar('ALTERNATIVE_LINKS') != None:
@@ -194,11 +205,13 @@ python perform_packagecopy_append () {
                     os.unlink(src)
                 else:
                     bb.warn('%s: Unable to resolve dangling symlink: %s' % (pn, alt_target))
-}
 
 PACKAGESPLITFUNCS_prepend = "populate_packages_updatealternatives "
 
 python populate_packages_updatealternatives () {
+    if not update_alternatives_enabled(d):
+        return
+
     pn = d.getVar('BPN')
 
     # Do actual update alternatives processing
@@ -252,10 +265,15 @@ python populate_packages_updatealternatives () {
 }
 
 python package_do_filedeps_append () {
+    if update_alternatives_enabled(d):
+        apply_update_alternative_provides(d)
+}
+
+def apply_update_alternative_provides(d):
     pn = d.getVar('BPN')
     pkgdest = d.getVar('PKGDEST')
 
-    for pkg in packages.split():
+    for pkg in d.getVar('PACKAGES').split():
         for alt_name in (d.getVar('ALTERNATIVE_%s' % pkg) or "").split():
             alt_link     = d.getVarFlag('ALTERNATIVE_LINK_NAME', alt_name)
             alt_target   = d.getVarFlag('ALTERNATIVE_TARGET_%s' % pkg, alt_name) or d.getVarFlag('ALTERNATIVE_TARGET', alt_name)
@@ -273,5 +291,4 @@ python package_do_filedeps_append () {
             d.appendVar('FILERPROVIDES_%s_%s' % (trans_target, pkg), " " + alt_link)
             if not trans_target in (d.getVar('FILERPROVIDESFLIST_%s' % pkg) or ""):
                 d.appendVar('FILERPROVIDESFLIST_%s' % pkg, " " + trans_target)
-}
 
-- 
2.19.1


