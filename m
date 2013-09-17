Return-Path: <ross.burton@intel.com>
Received: from mail-we0-f174.google.com (mail-we0-f174.google.com
	[74.125.82.174])
	by mail.openembedded.org (Postfix) with ESMTP id C5A2460F86
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Sep 2013 09:27:41 +0000 (UTC)
Received: by mail-we0-f174.google.com with SMTP id q58so4847748wes.33
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Sep 2013 02:27:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=/MYTdL6PuLRiNg/xmLQOg3hq612yBnVjrYitcNqhQls=;
	b=BXa0ncvd4OjzgF/zP3y2PxHiRjtweQmHBrFhpWR8Mn4fV4f/jtk9PtadeID9tnDJm8
	bCFFdbco5bwTjeWklNFpRKB+CoyxVfieh16/P1AvV9pUARmdaJBQZqdP0+DAPCm52xW/
	+GZagIr+1R7a/83zTGt/D/UVaXLTiAXwBdCmgOHrOSIB0OYvDPI6cz0s20n4CKqGxyXZ
	/gPT1ojmbRHwEOtHUUwUVJXMzvuqMYFr1zbfshehjQvdM/z8IilHpweQXsFKOCXZlgmk
	ylhl3CSxVk5FwqdiNnU6mqFR1QF4t02z8LdNzGi2a8QQxJ761DFe8FnhCifOVCBGpBn/
	ldNQ==
X-Gm-Message-State: ALoCoQkAQ3DLDwt08VMYk42/LaRE7qOadmbkEjHGs/NT9SqBMLviEFuLUkNHQJm6MPx8XhWhclT1
X-Received: by 10.194.109.35 with SMTP id hp3mr513070wjb.55.1379410063171;
	Tue, 17 Sep 2013 02:27:43 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id iz19sm3014620wic.9.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 17 Sep 2013 02:27:42 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Sep 2013 10:27:39 +0100
Message-Id: <1379410059-19120-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] webkit-gtk: remove compile-three-times hack
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
X-List-Received-Date: Tue, 17 Sep 2013 09:27:42 -0000

Remove the hack to handle Make 3.82 which ran make three times, as we sanity
check Make and refuse to build with the broken release.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-sato/webkit/webkit-gtk_1.8.3.bb |   20 --------------------
 1 file changed, 20 deletions(-)

diff --git a/meta/recipes-sato/webkit/webkit-gtk_1.8.3.bb b/meta/recipes-sato/webkit/webkit-gtk_1.8.3.bb
index 5691d3f..30b39d2 100644
--- a/meta/recipes-sato/webkit/webkit-gtk_1.8.3.bb
+++ b/meta/recipes-sato/webkit/webkit-gtk_1.8.3.bb
@@ -86,26 +86,6 @@ do_configure_append() {
 	done
 }
 
-# A dirty hack for GNU make 3.82 bug which means it drops required
-# dependencies. https://bugs.webkit.org/show_bug.cgi?id=79498 is the WebKitGTK+
-# bug, and http://savannah.gnu.org/bugs/?30653 is the GNU Make bug.  This is
-# fixed in Make CVS, so 3.83 won't have this problem.
-do_compile() {
-    if [ x"$MAKE" = x ]; then MAKE=make; fi
-    bbnote ${MAKE} ${EXTRA_OEMAKE} "$@"
-    for error_count in 1 2 3; do
-        bbnote "Attempt $error_count of 3"
-        exit_code=0
-        ${MAKE} ${EXTRA_OEMAKE} "$@" || exit_code=1
-        if [ $exit_code = 0 ]; then
-            break
-        fi
-    done
-    if [ ! $exit_code = 0 ]; then
-        die "oe_runmake failed"
-    fi
-}
-
 do_install_append() {
 	rmdir ${D}${libexecdir}
 }
-- 
1.7.10.4


