Return-Path: <patrick.ohly@intel.com>
Received: from mail-ie0-f182.google.com (mail-ie0-f182.google.com
	[209.85.223.182])
	by mail.openembedded.org (Postfix) with ESMTP id 0256874115
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jun 2015 16:05:17 +0000 (UTC)
Received: by iebgx4 with SMTP id gx4so65552798ieb.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jun 2015 09:05:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=vJT9K7eEVyI5jVkwwZilvS7mk9dn5jKPL3dKema/tKE=;
	b=abYotcYbcWcIHT6xWSvpO1V8gsDGB34rhkdlpEnNqd/0WuOgiIE71BfKM2I4KKqZ7q
	QkpN/SFZ/LKyoxSxG0/d+ZAQdC/ZpanvGkuffAtcZqwwq2ftso61zVBqGClJFu+kU/EY
	GRYnkJONgPcwW8m2zbrSjp+VhNpdl2mFrBmHzYlPhgN6xyEIFDNsAQ2zLpHVp7rVdJfQ
	Qk34+D8h/T86/XHcysH8020AtqNSstGUPw6SXZESR7EPei9wvlD2kjl2QA17XPd7lZft
	KnH6w3cqdIocWq3XrizfM7F11rh+IiqkRYX6md3i+fdypGIldQfq6t0VA8IR/d98+U/T
	lJYg==
X-Gm-Message-State: ALoCoQkbuKHTon+WevHjGGja8eJ5htP6xV2PiORBVYZS2wJEZvhNngbIXPfWbJTMFhTW2Kr8kYiK
X-Received: by 10.42.235.200 with SMTP id kh8mr8575278icb.39.1434384318467;
	Mon, 15 Jun 2015 09:05:18 -0700 (PDT)
Received: from pohly-desktop.fritz.box (p5DE8CA13.dip0.t-ipconnect.de.
	[93.232.202.19])
	by mx.google.com with ESMTPSA id a82sm9094154ioe.22.2015.06.15.09.05.16
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 15 Jun 2015 09:05:17 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 15 Jun 2015 18:05:13 +0200
Message-Id: <1434384313-16563-1-git-send-email-patrick.ohly@intel.com>
X-Mailer: git-send-email 2.1.4
Cc: Alexander Kanevskiy <alexander.kanevskiy@intel.com>
Subject: [PATCH] insane.bbclass: fix false negative in build-deps QA check
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
X-List-Received-Date: Mon, 15 Jun 2015 16:05:20 -0000

When a recipe called 'foobar-test' links against 'foobar' without
listing that in DEPENDS, the build-deps check misses that error
because it looks for 'foobar' in a package string containing (among
others) the 'foobar-test' name, leading to the incorrect conclusion
that the package is listed as dependency.

The 'packages' string needs to be split into individual package names
before the check. Doing that once directly after reading the value is
more efficient than splitting inside package_qa_check_rdepends() because
the caller also needs the individual components.

Also use a set to speed up the 'package in packages' check.

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 meta/classes/insane.bbclass | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index ab7ca3b..156ae5a 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -975,12 +975,12 @@ python do_package_qa () {
 
     # Scan the packages...
     pkgdest = d.getVar('PKGDEST', True)
-    packages = d.getVar('PACKAGES', True)
+    packages = set((d.getVar('PACKAGES', True) or '').split())
 
     cpath = oe.cachedpath.CachedPath()
     global pkgfiles
     pkgfiles = {}
-    for pkg in (packages or "").split():
+    for pkg in packages:
         pkgfiles[pkg] = []
         for walkroot, dirs, files in cpath.walk(pkgdest + "/" + pkg):
             for file in files:
@@ -1004,7 +1004,7 @@ python do_package_qa () {
     walk_sane = True
     rdepends_sane = True
     deps_sane = True
-    for package in packages.split():
+    for package in packages:
         skip = (d.getVar('INSANE_SKIP_' + package, True) or "").split()
         if skip:
             bb.note("Package %s skipping QA tests: %s" % (package, str(skip)))
-- 
2.1.4


