Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (unknown [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 7A31166007
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 May 2014 07:33:40 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s4G7Xfqn011381
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 May 2014 00:33:41 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.149) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.169.1; Fri, 16 May 2014 00:33:40 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 16 May 2014 15:33:39 +0800
Message-ID: <a035b8d802e65ff5dc58ab12b2f474ef444102bb.1400225425.git.rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1400225425.git.rongqing.li@windriver.com>
References: <cover.1400225425.git.rongqing.li@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] Screen: fix for Security Advisory CVE-2009-1214
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
X-List-Received-Date: Fri, 16 May 2014 07:33:42 -0000
Content-Type: text/plain

From: Yue Tao <Yue.Tao@windriver.com>

GNU screen 4.0.3 creates the /tmp/screen-exchange temporary file with
world-readable permissions, which might allow local users to obtain
sensitive session information.

Signed-off-by: Yue Tao <Yue.Tao@windriver.com>
Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 .../screen-4.0.3/screen-4.0.3-CVE-2009-1214.patch  |   86 ++++++++++++++++++++
 meta/recipes-extended/screen/screen_4.0.3.bb       |    1 +
 2 files changed, 87 insertions(+)
 create mode 100644 meta/recipes-extended/screen/screen-4.0.3/screen-4.0.3-CVE-2009-1214.patch

diff --git a/meta/recipes-extended/screen/screen-4.0.3/screen-4.0.3-CVE-2009-1214.patch b/meta/recipes-extended/screen/screen-4.0.3/screen-4.0.3-CVE-2009-1214.patch
new file mode 100644
index 0000000..104fa82
--- /dev/null
+++ b/meta/recipes-extended/screen/screen-4.0.3/screen-4.0.3-CVE-2009-1214.patch
@@ -0,0 +1,86 @@
+Upstream-Status: Backport
+
+The patch to fix CVE-2009-1214
+A security flaw was found in the screen utility in the way it used to create
+one particular temporary file. An attacker could use this flaw to perform
+a symlink attack. 
+Fix race condition creating temporary file
+
+Reference:
+https://bugzilla.redhat.com/show_bug.cgi?id=492104
+
+Signed-off-by: Chenyang Guo <chenyang.guo@windriver.com>
+---
+ fileio.c |   48 ++++++++++++++++++++++++++++++++----------------
+ 1 file changed, 32 insertions(+), 16 deletions(-)
+
+--- a/fileio.c
++++ b/fileio.c
+@@ -414,6 +414,14 @@ int dump;
+ 	}
+       public = !strcmp(fn, DEFAULT_BUFFERFILE);
+ # ifdef HAVE_LSTAT
++      /*
++       * Note: In the time between lstat() and open()/remove() below are
++       * called, the file can be created/removed/modified.  Therefore the
++       * information lstat() returns is taken into consideration, but not
++       * relied upon.  In particular, the open()/remove() calls can fail, and
++       * the code must account for that.  Symlink attack could be mounted if
++       * the code is changed carelessly.  --rdancer 2009-01-11
++       */
+       exists = !lstat(fn, &stb);
+       if (public && exists && (S_ISLNK(stb.st_mode) || stb.st_nlink > 1))
+ 	{
+@@ -432,28 +440,36 @@ int dump;
+ #ifdef COPY_PASTE
+       if (dump == DUMP_EXCHANGE && public)
+ 	{
++	  /*
++	   * Setting umask to zero is a bad idea -- the user surely doesn't
++	   * expect a publicly readable file in a publicly readable directory 
++	   * --rdancer 2009-01-11
++	   */
++	  /*
+           old_umask = umask(0);
++	   */
+ # ifdef HAVE_LSTAT
+ 	  if (exists)
+-	    {
+-	      if ((fd = open(fn, O_WRONLY, 0666)) >= 0)
+-		{
+-		  if (fstat(fd, &stb2) == 0 && stb.st_dev == stb2.st_dev && stb.st_ino == stb2.st_ino)
+-		    ftruncate(fd, 0);
+-		  else
+-		    {
+-		      close(fd);
+-		      fd = -1;
+-		    }
+-		}
+-	    }
+-	  else
+-	    fd = open(fn, O_WRONLY|O_CREAT|O_EXCL, 0666);
+-	  f = fd >= 0 ? fdopen(fd, mode) : 0;
++	      if (remove(fn) == -1)
++	        {
++		  /* Error */
++		  debug2("WriteFile: File exists and remove(%s) failed: %s\n",
++			  fn, strerror(errno));
++		  UserReturn(0);
++	        }
+ # else
+-          f = fopen(fn, mode);
++	  (void) remove(fn);
+ # endif
++	  /*
++	   * No r/w permissions for anybody but the user, as the file may be in
++	   * a public directory -- if the user chooses, they can chmod the file
++	   * afterwards. --rdancer 2008-01-11
++	   */
++	  fd = open(fn, O_WRONLY|O_CREAT|O_EXCL, 0600);
++	  f = fd >= 0 ? fdopen(fd, mode) : 0;
++	  /*
+           umask(old_umask);
++	   */
+ 	}
+       else
+ #endif /* COPY_PASTE */
diff --git a/meta/recipes-extended/screen/screen_4.0.3.bb b/meta/recipes-extended/screen/screen_4.0.3.bb
index 5850560..a0aa15c 100644
--- a/meta/recipes-extended/screen/screen_4.0.3.bb
+++ b/meta/recipes-extended/screen/screen_4.0.3.bb
@@ -20,6 +20,7 @@ SRC_URI = "${GNU_MIRROR}/screen/screen-${PV}.tar.gz;name=tarball \
            ${DEBIAN_MIRROR}/main/s/screen/screen_4.0.3-14.diff.gz;name=patch \
            file://configure.patch \
            file://fix-parallel-make.patch \
+           file://screen-4.0.3-CVE-2009-1214.patch \
            ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)}"
 
 PAM_SRC_URI = "file://screen.pam"
-- 
1.7.10.4


