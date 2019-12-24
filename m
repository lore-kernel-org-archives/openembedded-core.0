Return-Path: <Zhixiong.Chi@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id C78857F899
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Dec 2019 06:21:44 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id xBO6LKnd004941
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Dec 2019 22:21:35 -0800
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.468.0;
	Mon, 23 Dec 2019 22:21:09 -0800
From: Zhixiong Chi <zhixiong.chi@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 23 Dec 2019 22:21:09 -0800
Message-ID: <20191224062109.61957-1-zhixiong.chi@windriver.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [V3][PATCH] inetutils: Fix the rcp couldn't copy subdirectory issue
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
X-List-Received-Date: Tue, 24 Dec 2019 06:21:44 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Since snprintf doesn't support the same src and dst address, it will get
the wrong result.
In the sink second recursive call env, the argv and the namebuf will point
the same address, after free operation for namebuf.
Overall the last change for this is wrong, now we just move the memory free
to the end of the sink function, so that we can correct the value and fix
the memory leak issue.

Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
---
 ...e-rcp-couldn-t-copy-subdirectory-iss.patch | 90 +++++++++++++++++++
 .../inetutils/inetutils_1.9.4.bb              |  1 +
 2 files changed, 91 insertions(+)
 create mode 100644 meta/recipes-connectivity/inetutils/inetutils/0001-inetutils-Fix-the-rcp-couldn-t-copy-subdirectory-iss.patch

diff --git a/meta/recipes-connectivity/inetutils/inetutils/0001-inetutils-Fix-the-rcp-couldn-t-copy-subdirectory-iss.patch b/meta/recipes-connectivity/inetutils/inetutils/0001-inetutils-Fix-the-rcp-couldn-t-copy-subdirectory-iss.patch
new file mode 100644
index 0000000000..e90781998a
--- /dev/null
+++ b/meta/recipes-connectivity/inetutils/inetutils/0001-inetutils-Fix-the-rcp-couldn-t-copy-subdirectory-iss.patch
@@ -0,0 +1,90 @@
+The namebuf will get the same allocation address as the one before
+free operation, at the same time because of the recursive call for
+sink function, the targ and namebuf point the same address, then it
+cause the namebuf will get the wrong value with the snprintf function.
+Since the snprintf function doesn't like the strcpy function which
+can overwrite the destination.
+eg:
+ char tmp[20] = "test";
+ snprintf(tmp,20,"%s%s",tmp,"yes");
+The result of tmp -> yes. It will cause the wrong value.
+
+The sink function flow is as follows:
+ >sink(int argc, char*argv[])
+ >{
+ > ...
+ > targ = *argv;
+ > static char *namebuf = NULL;
+ > free (namebuf);
+ > namebuf = malloc (need);
+ > snprintf (namebuf, cursize, "%s%s%s", targ, *targ ? "/" : "", cp);
+ > np = namebuf;
+ > vect[0] = np;
+ > sink (1, vect);
+ > ...
+ >}
+
+At the same time, we couldn't add the condition(need > corsize),
+the same snprintf issue still exists. for example:
+#ls rccopy/*/*
+rccopy/fold1/1  rccopy/fold2/2  rccopy/fold3/3
+
+Since the cursize static variable is still the old value after copying the
+rccopy/fold1/1, when it copys the directory rccopy/fold2 during recursive,
+the value of need < cursize, the namebuf still use the old vlaue without being
+allocated the new space, the incorrect namebuf value issue is still here.
+
+We move the memory free to the end of this fucntion.
+
+Upstream-Status: Submitted
+Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
+Index: inetutils-1.9.4/src/rcp.c
+===================================================================
+--- inetutils-1.9.4.orig/src/rcp.c
++++ inetutils-1.9.4/src/rcp.c
+@@ -881,6 +881,7 @@ sink (int argc, char *argv[])
+   int setimes, targisdir, wrerrno;
+   char ch, *cp, *np, *targ, *vect[1], buf[BUFSIZ];
+   const char *why;
++  static char *namebuf = NULL;
+ 
+ #define atime	tv[0]
+ #define mtime	tv[1]
+@@ -988,25 +989,14 @@ sink (int argc, char *argv[])
+ 	SCREWUP ("size not delimited");
+       if (targisdir)
+ 	{
+-	  static char *namebuf = NULL;
+-	  static size_t cursize = 0;
+ 	  size_t need;
+ 
+ 	  need = strlen (targ) + strlen (cp) + 250;
+-	  if (need > cursize)
++	  if (!(namebuf = malloc (need)));
+ 	    {
+-	      free (namebuf);
+-	      namebuf = malloc (need);
+-	      if (namebuf)
+-		cursize = need;
+-	      else
+-		{
+-		  run_err ("%s", strerror (errno));
+-		  cursize = 0;
+-		  continue;
+-		}
++	      run_err ("%s", strerror (errno));
+ 	    }
+-	  snprintf (namebuf, cursize, "%s%s%s", targ, *targ ? "/" : "", cp);
++	  snprintf (namebuf, need, "%s%s%s", targ, *targ ? "/" : "", cp);
+ 	  np = namebuf;
+ 	}
+       else
+@@ -1163,6 +1153,8 @@ sink (int argc, char *argv[])
+ 	  break;
+ 	}
+     }
++    if (namebuf)
++      free(namebuf);
+ screwup:
+   run_err ("protocol error: %s", why);
+   exit (EXIT_FAILURE);
diff --git a/meta/recipes-connectivity/inetutils/inetutils_1.9.4.bb b/meta/recipes-connectivity/inetutils/inetutils_1.9.4.bb
index 684fbe09e1..bc944131fa 100644
--- a/meta/recipes-connectivity/inetutils/inetutils_1.9.4.bb
+++ b/meta/recipes-connectivity/inetutils/inetutils_1.9.4.bb
@@ -23,6 +23,7 @@ SRC_URI = "${GNU_MIRROR}/inetutils/inetutils-${PV}.tar.gz \
            file://inetutils-only-check-pam_appl.h-when-pam-enabled.patch \
            file://0001-rcp-fix-to-work-with-large-files.patch \
            file://fix-buffer-fortify-tfpt.patch \
+           file://0001-inetutils-Fix-the-rcp-couldn-t-copy-subdirectory-iss.patch \
 "
 
 SRC_URI[md5sum] = "04852c26c47cc8c6b825f2b74f191f52"
-- 
2.23.0


