Return-Path: <Zhixiong.Chi@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 35CAE7C4F9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Jun 2019 08:26:14 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x5H8PtZD002730
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Jun 2019 01:26:06 -0700
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.439.0;
	Mon, 17 Jun 2019 01:25:24 -0700
From: Zhixiong Chi <zhixiong.chi@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 17 Jun 2019 01:25:24 -0700
Message-ID: <20190617082524.40579-1-zhixiong.chi@windriver.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [PATCH] inetutils: Fix the rcp couldn't copy subdirectory issue
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
X-List-Received-Date: Mon, 17 Jun 2019 08:26:15 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Since snprintf doesn't support the same src and dst address, it will get
the wrong result.
In the sink second recursive call env, the argv and the namebuf will point
the same address, after free operation for namebuf.
So the last change for this is wrong, now we just drop the free function
in the recursive loop to get the correct path of file and directory.
Even though there will be memory leak, the allocated static area memory
will be released after process exited.

Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
---
 .../0001-Fix-the-rcp-copy-issue.patch         | 38 +++++++++++++++++++
 .../inetutils/inetutils_1.9.4.bb              |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta/recipes-connectivity/inetutils/inetutils/0001-Fix-the-rcp-copy-issue.patch

diff --git a/meta/recipes-connectivity/inetutils/inetutils/0001-Fix-the-rcp-copy-issue.patch b/meta/recipes-connectivity/inetutils/inetutils/0001-Fix-the-rcp-copy-issue.patch
new file mode 100644
index 0000000000..0c488df1d4
--- /dev/null
+++ b/meta/recipes-connectivity/inetutils/inetutils/0001-Fix-the-rcp-copy-issue.patch
@@ -0,0 +1,38 @@
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
+Upstream-Status: Pending
+signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
+--- inetutils-1.9.4.orig/src/rcp.c	2019-05-16 16:54:01.293997574 +0800
++++ inetutils-1.9.4/src/rcp.c	2019-05-16 16:56:55.981998792 +0800
+@@ -995,7 +995,6 @@
+ 	  need = strlen (targ) + strlen (cp) + 250;
+ 	  if (need > cursize)
+ 	    {
+-	      free (namebuf);
+ 	      namebuf = malloc (need);
+ 	      if (namebuf)
+ 		cursize = need;
diff --git a/meta/recipes-connectivity/inetutils/inetutils_1.9.4.bb b/meta/recipes-connectivity/inetutils/inetutils_1.9.4.bb
index ac2e017d8b..fab6f3d3af 100644
--- a/meta/recipes-connectivity/inetutils/inetutils_1.9.4.bb
+++ b/meta/recipes-connectivity/inetutils/inetutils_1.9.4.bb
@@ -22,6 +22,7 @@ SRC_URI = "${GNU_MIRROR}/inetutils/inetutils-${PV}.tar.gz \
            file://inetutils-1.9-PATH_PROCNET_DEV.patch \
            file://inetutils-only-check-pam_appl.h-when-pam-enabled.patch \
            file://0001-rcp-fix-to-work-with-large-files.patch \
+           file://0001-Fix-the-rcp-copy-issue.patch \
 "
 
 SRC_URI[md5sum] = "04852c26c47cc8c6b825f2b74f191f52"
-- 
2.21.0


