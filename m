Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1TI7Mz-0001no-S3
	for openembedded-core@lists.openembedded.org;
	Sun, 30 Sep 2012 02:26:54 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q8U0DvBn020480
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Sep 2012 17:13:57 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.309.2;
	Sat, 29 Sep 2012 17:13:57 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sat, 29 Sep 2012 19:19:18 -0500
Message-ID: <53e86e3f0ccef5ab98d1370912023e67f7e9462b.1348963477.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1348963477.git.mark.hatle@windriver.com>
References: <cover.1348963477.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 12/12] rpm: Implement workaround for DB_BUFFER_SMALL error
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
X-List-Received-Date: Sun, 30 Sep 2012 00:26:54 -0000
Content-Type: text/plain

In certain cases with BerkleyDB 5.3.x we are getting the error:

db3.c:1443: dbcursor->pget(-30999): BDB0063 DB_BUFFER_SMALL: User memory too small fo

See https://bugs.launchpad.net/rpm/+bug/934420 for more information.

It appears to be some type of a bug in the BerkleyDB 5.3.x.  In an attempt
to workaround the problem, when we encounter this situation we attempt
to adjust the size of the mmap buffer until the call works, or we
end up trying 10 times.  The new size is either the updated vp->size
from the failed pget call, or the previous size + 1024.

If DBI debugging is enabled, additional diagnostics are printed, otherwise
a basic retry and success message is added to show that the failure was
resolved.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 .../rpm/rpm/rpm-db_buffer_small.patch              |   77 ++++++++++++++++++++
 meta/recipes-devtools/rpm/rpm_5.4.9.bb             |    3 +-
 2 files changed, 79 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-db_buffer_small.patch

diff --git a/meta/recipes-devtools/rpm/rpm/rpm-db_buffer_small.patch b/meta/recipes-devtools/rpm/rpm/rpm-db_buffer_small.patch
new file mode 100644
index 0000000..d2ed853
--- /dev/null
+++ b/meta/recipes-devtools/rpm/rpm/rpm-db_buffer_small.patch
@@ -0,0 +1,77 @@
+In certain cases with BerkleyDB 5.3.x we are getting the error:
+
+db3.c:1443: dbcursor->pget(-30999): BDB0063 DB_BUFFER_SMALL: User memory too small for return value
+
+See https://bugs.launchpad.net/rpm/+bug/934420 for more information.
+
+It appears to be some type of a bug in the BerkleyDB 5.3.x.  In an attempt
+to workaround the problem, when we encounter this situation we attempt
+to adjust the size of the mmap buffer until the call works, or we
+end up trying 10 times.  The new size is either the updated vp->size
+from the failed pget call, or the previous size + 1024.
+
+If DBI debugging is enabled, additional diagnostics are printed, otherwise
+a basic retry and success message is added to show that the failure was
+resolved.
+
+Upstream-status: Inappropriate (workaround)
+
+Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
+
+Index: rpm-5.4.9/rpmdb/rpmdb.c
+===================================================================
+--- rpm-5.4.9.orig/rpmdb/rpmdb.c
++++ rpm-5.4.9/rpmdb/rpmdb.c
+@@ -2212,8 +2212,12 @@ static int rpmmiGet(dbiIndex dbi, DBC * 
+ 	vp->flags |= DB_DBT_USERMEM;
+ 	rc = dbiGet(dbi, dbcursor, kp, vp, flags);
+ 	if (rc == DB_BUFFER_SMALL) {
++	    int retry = 0;
++	    size_t origlen = vp->size;
+ 	    size_t uhlen = vp->size;
+-	    void * uh = mmap(NULL, uhlen, _prot, _flags, _fdno, _off);
++	    void * uh;
++retry_get:
++	    uh = mmap(NULL, uhlen, _prot, _flags, _fdno, _off);
+ 	    if (uh == NULL || uh == (void *)-1)
+ 		fprintf(stderr,
+ 		    "==> mmap(%p[%u], 0x%x, 0x%x, %d, 0x%x) error(%d): %s\n",
+@@ -2235,6 +2239,25 @@ static int rpmmiGet(dbiIndex dbi, DBC * 
+ 		if (munmap(uh, uhlen) != 0)
+ 		    fprintf(stderr, "==> munmap(%p[%u]) error(%d): %s\n",
+                 	uh, (unsigned)uhlen, errno, strerror(errno));
++	        /* We want to be sure to limit the number of retry attempts to avoid a loop! */
++	        if (rc == DB_BUFFER_SMALL && retry < 10) {
++		   /* If we got a largr vp-size back, use that, otherwise increment the size by 1k */
++	           uhlen = vp->size > uhlen ? vp->size : uhlen + 1024;
++		   retry++;
++	           if ((dbi)->dbi_debug)
++	               fprintf(stderr, "==> DB_BUFFER_SMALL orig requested (%d), configured (%d), forcing larger buffer (%d), new size (%d)\n",
++	                    origlen, vp->ulen, uhlen, vp->size);
++	           else
++	               fprintf(stderr, "==> retry (%d) db3cpget (%d)\n", retry, uhlen);
++	           goto retry_get;
++	        }
++	    }
++	    if (retry) {
++	        if ((dbi)->dbi_debug)
++	           fprintf(stderr, "==> success orig requested (%d), configured buffer (%d), buffer (%d), size after dbiGet (%d)\n",
++			origlen, vp->ulen, uhlen, vp->size);
++	        else
++	           fprintf(stderr, "==> success\n");
+ 	    }
+ 	}
+     } else
+Index: rpm-5.4.9/rpmdb/db3.c
+===================================================================
+--- rpm-5.4.9.orig/rpmdb/db3.c
++++ rpm-5.4.9/rpmdb/db3.c
+@@ -1452,7 +1452,7 @@ assert(db != NULL);
+ #endif
+     }
+ 
+-DBIDEBUG(dbi, (stderr, "<-- %s(%p,%p,%p,%p,%p,0x%x) rc %d %s%s\n", __FUNCTION__, dbi, dbcursor, key, pkey, data, flags, rc, _DBCFLAGS(flags), _KEYDATA(key, pkey, data, NULL)));
++DBIDEBUG(dbi, (stderr, "<-- %s(%p,%p,%p,%p,%p,0x%x) rc %d %s%s\n", __FUNCTION__, dbi, dbcursor, key, pkey, data, flags, rc, _DBCFLAGS(flags), _KEYDATA(key, pkey, rc == DB_BUFFER_SMALL ? NULL : data, NULL)));
+     return rc;
+ }
+ /*@=mustmod@*/
diff --git a/meta/recipes-devtools/rpm/rpm_5.4.9.bb b/meta/recipes-devtools/rpm/rpm_5.4.9.bb
index dda5611..2dbdf54 100644
--- a/meta/recipes-devtools/rpm/rpm_5.4.9.bb
+++ b/meta/recipes-devtools/rpm/rpm_5.4.9.bb
@@ -43,7 +43,7 @@ LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=2d5025d4aa3495befef8f17206a5b0a1"
 
 DEPENDS = "libpcre attr acl popt ossp-uuid file bison-native"
-PR = "r51"
+PR = "r52"
 
 # rpm2cpio is a shell script, which is part of the rpm src.rpm.  It is needed
 # in order to extract the distribution SRPM into a format we can extract...
@@ -79,6 +79,7 @@ SRC_URI = "http://www.rpm5.org/files/rpm/rpm-5.4/rpm-5.4.9-0.20120508.src.rpm;ex
 	   file://rpm-uuid-include.patch \
 	   file://makefile-am-exec-hook.path \
 	   file://rpm-stub-out-git_strerror.patch \
+	   file://rpm-db_buffer_small.patch \
 	  "
 
 SRC_URI[md5sum] = "60d56ace884340c1b3fcac6a1d58e768"
-- 
1.7.3.4



