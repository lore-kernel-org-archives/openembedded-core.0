Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TQFrJ-0006Iu-Mk
	for openembedded-core@lists.openembedded.org;
	Mon, 22 Oct 2012 13:07:49 +0200
Received: from mail-we0-f197.google.com ([74.125.82.197])
	by mga03.intel.com with ESMTP/TLS/RC4-SHA; 22 Oct 2012 03:54:24 -0700
Received: by mail-we0-f197.google.com with SMTP id x43so1892624wey.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Oct 2012 03:54:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=/JLEANHUAtdL9nhN8fGv/aUZ+JH4TL8hkUo76kXnrec=;
	b=YAFxl35WBEyOmld1Io1/0ufVBCx/o15SGE0sZH0ep1aqJbLwdBBJq6q1xckjBDgZUm
	MvOLOshUin72acqfNo2eh+KVyqfJMHxabCiItGavGypL1s7o8t0GA49XWUjq6B1zFeZu
	oTtnScOWsPfzEiAcia2l+tkFGeZKZkHQ8fUUX1BXq3EJCcWEHxZwxfeuGRduMBQnpaRm
	Qzju9jFbLolffxWPYO4O51IRbPJ7tXFvydbkesNiLLHNbNrXHxtEk6xI2VS3eqn1e+/A
	eaXgC6z/rWLVfXvVI9jNmaV9+4++1Aj9rhL/vOnqYqXOEG7ybHMDLBc1PjtcCTBYybZ+
	Nq5w==
Received: by 10.216.199.30 with SMTP id w30mr4937474wen.25.1350903263047;
	Mon, 22 Oct 2012 03:54:23 -0700 (PDT)
Received: by 10.216.199.30 with SMTP id w30mr4937471wen.25.1350903262926;
	Mon, 22 Oct 2012 03:54:22 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id k20sm50675173wiv.11.2012.10.22.03.54.21
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 22 Oct 2012 03:54:22 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 22 Oct 2012 11:53:06 +0100
Message-Id: <1350903186-20334-3-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <1350903186-20334-1-git-send-email-ross.burton@intel.com>
References: <1350903186-20334-1-git-send-email-ross.burton@intel.com>
X-Gm-Message-State: ALoCoQlZdWygCJwhhCnOyrEzSfmNTKduooELX1khHtD0La+stczLjtH8i2YJN/HspuKVYzuvNzgCPq/tgr63NN7ZDD8qURshgrCnDisJ+HFlBmDb5v9KIFlsT2B+E65vkmrfTKAqYCCQezdpeYjl/AIfqBUS7tBc7brRj/4DR32K+QhxVSZ5e1RuODs7kWYVpRCra1Ojs1rm
Subject: [PATCH 3/3] libical: remove
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 22 Oct 2012 11:07:49 -0000

This was only used by evolution-data-server and is now maintained in
meta-oe/meta-gnome.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-sato/libical/files/pthread-fix.patch |   52 ---------------------
 meta/recipes-sato/libical/libical_0.48.bb         |   17 -------
 2 files changed, 69 deletions(-)
 delete mode 100644 meta/recipes-sato/libical/files/pthread-fix.patch
 delete mode 100644 meta/recipes-sato/libical/libical_0.48.bb

diff --git a/meta/recipes-sato/libical/files/pthread-fix.patch b/meta/recipes-sato/libical/files/pthread-fix.patch
deleted file mode 100644
index aa7767f..0000000
--- a/meta/recipes-sato/libical/files/pthread-fix.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-New added pthread feathre leads some deadlock with some unlock code missing.
-This patch fix it.
-
-Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
-
-Upstream-Status: Pending
-
-Index: libical-0.47/src/libical/icaltimezone.c
-===================================================================
---- libical-0.47.orig/src/libical/icaltimezone.c	2011-12-16 13:42:25.000000000 +0800
-+++ libical-0.47/src/libical/icaltimezone.c	2011-12-16 14:16:25.000000000 +0800
-@@ -1773,7 +1773,7 @@
-     filename = (char*) malloc (filename_len);
-     if (!filename) {
- 	icalerror_set_errno(ICAL_NEWFAILED_ERROR);
--	return;
-+	goto out;
-     }
- 
-     snprintf (filename, filename_len, "%s/%s.ics", get_zone_directory(),
-@@ -1783,7 +1783,7 @@
-     free (filename);
-     if (!fp) {
- 	icalerror_set_errno(ICAL_FILE_ERROR);
--	return;
-+	goto out;
-     }
- 
- 	
-@@ -1807,7 +1807,7 @@
- 
-     if (!subcomp) {
- 	icalerror_set_errno(ICAL_PARSE_ERROR);
--	return;
-+	goto out;
-     }
- 
-     icaltimezone_get_vtimezone_properties (zone, subcomp);
-@@ -1817,10 +1817,12 @@
-     icalcomponent_free(comp);
-     }
- #endif 
--#ifdef HAVE_PTHREAD
-+
-  out:
-+#ifdef HAVE_PTHREAD
-     pthread_mutex_unlock(&builtin_mutex);
- #endif
-+    return;
- }
- 
- 
diff --git a/meta/recipes-sato/libical/libical_0.48.bb b/meta/recipes-sato/libical/libical_0.48.bb
deleted file mode 100644
index 80f629c..0000000
--- a/meta/recipes-sato/libical/libical_0.48.bb
+++ /dev/null
@@ -1,17 +0,0 @@
-DESCRIPTION = "iCal and scheduling (RFC 2445, 2446, 2447) library"
-HOMEPAGE = "http://sourceforge.net/projects/freeassociation/"
-BUGTRACKER = "http://sourceforge.net/tracker/?group_id=16077&atid=116077"
-LICENSE = "LGPLv2.1 | MPL-1"
-LIC_FILES_CHKSUM = "file://COPYING;md5=d4fc58309d8ed46587ac63bb449d82f8 \
-                    file://LICENSE;md5=d1a0891cd3e582b3e2ec8fe63badbbb6"
-SECTION = "libs"
-
-PR = "r0"
-
-SRC_URI = "${SOURCEFORGE_MIRROR}/project/freeassociation/${BPN}/${P}/${BPN}-${PV}.tar.gz\
-           file://pthread-fix.patch"
-
-SRC_URI[md5sum] = "e549f434d5fbf9cd156c60ed4943618f"
-SRC_URI[sha256sum] = "2ae78b0757f0dd13431acf42a9a8d038339fd4767fd5134e650bf60ee0b4dff0"
-
-inherit autotools
-- 
1.7.10



