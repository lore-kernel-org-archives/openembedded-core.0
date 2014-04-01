Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4F4306F8CE
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Apr 2014 01:59:46 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s311xlOA000483
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Mar 2014 18:59:48 -0700 (PDT)
Received: from pek-kkang-d1.wrs.com (128.224.162.231) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.169.1; Mon, 31 Mar 2014 18:59:47 -0700
From: Kai Kang <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 1 Apr 2014 09:59:36 +0800
Message-ID: <1396317576-25426-2-git-send-email-kai.kang@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <1396317576-25426-1-git-send-email-kai.kang@windriver.com>
References: <1396317576-25426-1-git-send-email-kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.231]
Subject: [PATCH] bash-3.2.48: fix error path of getc_with_restart
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
X-List-Received-Date: Tue, 01 Apr 2014 01:59:47 -0000
Content-Type: text/plain

From: Yong Zhang <yong.zhang@windriver.com>

1. let getc_with_restart() handle EAGAIN|EWOULDBLOCK
   correctly.
2. When read() returns with ERROR, local_bufused will be set
   to -1; and if we return with local_bufused == -1 left,
   the next time we call getc_with_restart(), the condition
   (local_index == local_bufused || local_bufused == 0)
   will not match, thus we get random data from localbuf[]
   with local_index increased each time, eventually we may
   access data beyond array localbuf[]. Fix it by resetting
   local_index and local_bufused in case of read failure.

Signed-off-by: Yong Zhang <yong.zhang@windriver.com>
Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../bash-fix-error-path-of-getc_with_restart.patch | 41 ++++++++++++++++++++++
 .../bash-3.2.48/bash-fix-getc_with_restart.patch   | 28 +++++++++++++++
 meta/recipes-extended/bash/bash_3.2.48.bb          |  2 ++
 3 files changed, 71 insertions(+)
 create mode 100644 meta/recipes-extended/bash/bash-3.2.48/bash-fix-error-path-of-getc_with_restart.patch
 create mode 100644 meta/recipes-extended/bash/bash-3.2.48/bash-fix-getc_with_restart.patch

diff --git a/meta/recipes-extended/bash/bash-3.2.48/bash-fix-error-path-of-getc_with_restart.patch b/meta/recipes-extended/bash/bash-3.2.48/bash-fix-error-path-of-getc_with_restart.patch
new file mode 100644
index 0000000..045124f
--- /dev/null
+++ b/meta/recipes-extended/bash/bash-3.2.48/bash-fix-error-path-of-getc_with_restart.patch
@@ -0,0 +1,41 @@
+Upstream-Status: Accepted
+
+When read() returns with ERROR, local_bufused will be set
+to -1; and if we return with local_bufused == -1 left,
+the next time we call getc_with_restart(), the condition
+(local_index == local_bufused || local_bufused == 0)
+will not match, thus we get random data from localbuf[]
+with local_index increased each time, eventually we may
+access data beyond array localbuf[]. Fix it by resetting
+local_index and local_bufused in case of read failure.
+
+Merged by:
+http://git.savannah.gnu.org/cgit/bash.git/commit/input.c?id=ac50fbac377e32b98d2de396f016ea81e8ee9961
+
+Signed-off-by: Yong Zhang <yong.zhang@windriver.com>
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+---
+ input.c |    7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
+
+--- a/input.c
++++ b/input.c
+@@ -78,12 +78,17 @@ getc_with_restart (stream)
+ 	  else if (errno == EAGAIN || errno == EWOULDBLOCK)
+ 	    {
+ 	      if (sh_unset_nodelay_mode (fileno (stream)) < 0)
+-	        return EOF;
++	        {
++	          local_index = 0;
++	          local_bufused = 0;
++		  return EOF;
++		}
+ 	      continue;
+ 	    }
+ 	  else if (local_bufused == 0 || errno != EINTR)
+ 	    {
+ 	      local_index = 0;
++	      local_bufused = 0;
+ 	      return EOF;
+ 	    }
+ 	}
diff --git a/meta/recipes-extended/bash/bash-3.2.48/bash-fix-getc_with_restart.patch b/meta/recipes-extended/bash/bash-3.2.48/bash-fix-getc_with_restart.patch
new file mode 100644
index 0000000..45d93b1
--- /dev/null
+++ b/meta/recipes-extended/bash/bash-3.2.48/bash-fix-getc_with_restart.patch
@@ -0,0 +1,28 @@
+Upstream-Status: Accepted
+
+Let getc_with_restart() handle EAGAIN|EWOULDBLOCK correctly.
+
+Merged by:
+http://git.savannah.gnu.org/cgit/bash.git/commit/input.c?id=3185942a5234e26ab13fa02f9c51d340cec514f8
+
+Signed-off-by: Yong Zhang <yong.zhang@windriver.com>
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+---
+ input.c |    6 ++++++
+ 1 file changed, 6 insertions(+)
+
+--- a/input.c
++++ b/input.c
+@@ -75,6 +75,12 @@ getc_with_restart (stream)
+ 	  local_bufused = read (fileno (stream), localbuf, sizeof(localbuf));
+ 	  if (local_bufused > 0)
+ 	    break;
++	  else if (errno == EAGAIN || errno == EWOULDBLOCK)
++	    {
++	      if (sh_unset_nodelay_mode (fileno (stream)) < 0)
++	        return EOF;
++	      continue;
++	    }
+ 	  else if (local_bufused == 0 || errno != EINTR)
+ 	    {
+ 	      local_index = 0;
diff --git a/meta/recipes-extended/bash/bash_3.2.48.bb b/meta/recipes-extended/bash/bash_3.2.48.bb
index fe04b28..619c3ad 100644
--- a/meta/recipes-extended/bash/bash_3.2.48.bb
+++ b/meta/recipes-extended/bash/bash_3.2.48.bb
@@ -13,6 +13,8 @@ SRC_URI = "${GNU_MIRROR}/bash/bash-${PV}.tar.gz;name=tarball \
            file://build-tests.patch \
            file://test-output.patch \
            file://run-ptest \
+           file://bash-fix-getc_with_restart.patch;striplevel=1 \
+           file://bash-fix-error-path-of-getc_with_restart.patch;striplevel=1 \
           "
 
 SRC_URI[tarball.md5sum] = "338dcf975a93640bb3eaa843ca42e3f8"
-- 
1.8.1.2


