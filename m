Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SXQ2f-00056b-VP
	for openembedded-core@lists.openembedded.org;
	Thu, 24 May 2012 06:52:54 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 23 May 2012 21:42:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="144034676"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.24])
	by orsmga001.jf.intel.com with ESMTP; 23 May 2012 21:42:41 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 23 May 2012 21:42:15 -0700
Message-Id: <7f6f80e44680998a32e855ed48b02f9ec2718ca7.1337834073.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1337834073.git.sgw@linux.intel.com>
References: <cover.1337834073.git.sgw@linux.intel.com>
In-Reply-To: <cover.1337834073.git.sgw@linux.intel.com>
References: <cover.1337834073.git.sgw@linux.intel.com>
Subject: [Consolidated Pull 12/28] rpm 5.4.0: respect to the arch when choose the alternatives
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 24 May 2012 04:52:55 -0000

From: Robert Yang <liezhi.yang@windriver.com>

There is a bug if we:
1) bitbake diffutils with MACHINE=crownbay
2) bitbake diffutils with MACHINE=qemux86
3) bitbake core-image-sato with MACHINE=crownbay

Then the diffutils.i586 would be installed to the crownbay's image, this
is because diffutils.i586 is newer than diffutils.core2, and rpm doesn't
respect to the arch priorities:

We have put the archs in order in _solve_dbpath:

crownbay/solvedb:core2/solvedb:i586/solvedb:all/solvedb

Fix rpm to respect to the order, for example, if it finds a pkg in both
core2/ and i586/, and the core2/ comes first, it should not use the one
in i586/ even if it's build time is newer.

Note: Don't worry about the _free(*ptr), it can check whether ptr is
NULL or not.

This is for the denzil branch, and the master branch also needs it.

[YOCTO #2360]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../rpm/rpm/rpm-respect-arch.patch                 |   67 ++++++++++++++++++++
 meta/recipes-devtools/rpm/rpm_5.4.0.bb             |    3 +-
 2 files changed, 69 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-respect-arch.patch

diff --git a/meta/recipes-devtools/rpm/rpm/rpm-respect-arch.patch b/meta/recipes-devtools/rpm/rpm/rpm-respect-arch.patch
new file mode 100644
index 0000000..9b63b37
--- /dev/null
+++ b/meta/recipes-devtools/rpm/rpm/rpm-respect-arch.patch
@@ -0,0 +1,67 @@
+rpmts.c: respect to the arch priorities
+
+Let rpm respect to the priorities when choose alternatives rpm, the arch
+which comes first is preferred.
+
+Upstream-Status: Pending
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+---
+ lib/rpmts.c |   14 ++++++++++++++
+ 1 files changed, 14 insertions(+), 0 deletions(-)
+
+diff --git a/lib/rpmts.c b/lib/rpmts.c
+index 3fbbc9e..40ec08e 100644
+--- a/lib/rpmts.c
++++ b/lib/rpmts.c
+@@ -353,6 +353,7 @@ int rpmtsSolve(rpmts ts, rpmds ds, /*@unused@*/ const void * data)
+     Header h = NULL;
+     size_t bhnamelen = 0;
+     time_t bhtime = 0;
++    const char *bharch = NULL;
+     rpmTag rpmtag;
+     const char * keyp;
+     size_t keylen = 0;
+@@ -409,6 +410,7 @@ fprintf(stderr, "--> %s(%p,%p,%p)\n", __FUNCTION__, ts, ds, data);
+ 	while ((h = rpmmiNext(mi)) != NULL) {
+ 	    size_t hnamelen;
+ 	    time_t htime;
++	    const char *harch = NULL;
+ 
+ 	    if (rpmtag == RPMTAG_PROVIDENAME && !rpmdsAnyMatchesDep(h, ds, 1))
+ 		continue;
+@@ -431,12 +433,23 @@ fprintf(stderr, "--> %s(%p,%p,%p)\n", __FUNCTION__, ts, ds, data);
+ 	    if (htime <= bhtime)
+ 		continue;
+ 
++	    /* XXX Respect to the arch priorities */
++	    he->tag = RPMTAG_ARCH;
++	    xx = headerGet(h, he, 0);
++	    harch = ((xx && he->p.str) ? xstrdup(he->p.str) : NULL);
++	    he->p.ptr = _free(he->p.ptr);
++	    if (bharch && (strcmp(bharch, harch) != 0))
++		continue;
++
+ 	    /* Save new "best" candidate. */
+ 	    (void)headerFree(bh);
+ 	    bh = NULL;
+ 	    bh = headerLink(h);
+ 	    bhtime = htime;
+ 	    bhnamelen = hnamelen;
++	    bharch = _free(bharch);
++	    bharch = xstrdup(harch);
++	    harch = _free(harch);
+ 	}
+ 	mi = rpmmiFree(mi);
+ 
+@@ -449,6 +462,7 @@ fprintf(stderr, "--> %s(%p,%p,%p)\n", __FUNCTION__, ts, ds, data);
+       } while (1);
+ 
+     }
++    bharch = _free(bharch);
+ 
+     /* Is there a suggested resolution? */
+     if (bh == NULL)
+-- 
+1.7.1
+
diff --git a/meta/recipes-devtools/rpm/rpm_5.4.0.bb b/meta/recipes-devtools/rpm/rpm_5.4.0.bb
index 5ee6b47..d79d199 100644
--- a/meta/recipes-devtools/rpm/rpm_5.4.0.bb
+++ b/meta/recipes-devtools/rpm/rpm_5.4.0.bb
@@ -45,7 +45,7 @@ LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=2d5025d4aa3495befef8f17206a5b0a1"
 DEPENDS = "bzip2 zlib db openssl elfutils expat libpcre attr acl popt ${extrarpmdeps}"
 extrarpmdeps = "python perl file"
 extrarpmdeps_virtclass-native = "python-native file-native"
-PR = "r36"
+PR = "r37"
 
 # rpm2cpio is a shell script, which is part of the rpm src.rpm.  It is needed
 # in order to extract the distribution SRPM into a format we can extract...
@@ -70,6 +70,7 @@ SRC_URI = "http://www.rpm5.org/files/rpm/rpm-5.4/rpm-5.4.0-0.20101229.src.rpm;ex
 	   file://pythondeps.sh \
 	   file://rpmdeps-oecore.patch \
 	   file://rpm-resolvedep.patch \
+	   file://rpm-respect-arch.patch \
 	  "
 
 #	   file://rpm-autoconf.patch \
-- 
1.7.7.6



