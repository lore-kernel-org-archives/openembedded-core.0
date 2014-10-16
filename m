Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 92C2C60DD7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Oct 2014 09:51:01 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s9G9p2l6012518
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Oct 2014 02:51:02 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.174.1; Thu, 16 Oct 2014 02:51:02 -0700
From: Kai Kang <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 16 Oct 2014 17:48:33 +0800
Message-ID: <6958f500cac37c3534a9f58a8bc7b90cc4c94b7f.1413452836.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1413452836.git.kai.kang@windriver.com>
References: <cover.1413452836.git.kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.153.152]
Subject: [PATCH 1/3] readline: Security Advisory - readline - CVE-2014-2524
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
X-List-Received-Date: Thu, 16 Oct 2014 09:51:01 -0000
Content-Type: text/plain

The _rl_tropen function in util.c in GNU readline before 6.3 patch 3
allows local users to create or overwrite arbitrary files via a symlink
attack on a /var/tmp/rltrace.[PID] file.

http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2014-2524

Signed-off-by: Yue Tao <Yue.Tao@windriver.com>
Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../readline/readline-6.3/readline63-003           | 43 ++++++++++++++++++++++
 meta/recipes-core/readline/readline_6.3.bb         |  2 +
 2 files changed, 45 insertions(+)
 create mode 100644 meta/recipes-core/readline/readline-6.3/readline63-003

diff --git a/meta/recipes-core/readline/readline-6.3/readline63-003 b/meta/recipes-core/readline/readline-6.3/readline63-003
new file mode 100644
index 0000000..98a9d81
--- /dev/null
+++ b/meta/recipes-core/readline/readline-6.3/readline63-003
@@ -0,0 +1,43 @@
+readline: Security Advisory - readline - CVE-2014-2524
+
+Upstream-Status: Backport
+
+Signed-off-by: Yue Tao <yue.tao@windriver.com>
+
+			   READLINE PATCH REPORT
+			   =====================
+
+Readline-Release: 6.3
+Patch-ID: readline63-003
+
+Bug-Reported-by:
+Bug-Reference-ID:
+Bug-Reference-URL:
+
+Bug-Description:
+
+There are debugging functions in the readline release that are theoretically
+exploitable as security problems.  They are not public functions, but have
+global linkage.
+
+Patch (apply with `patch -p0'):
+
+*** ../readline-6.3/util.c	2013-09-02 13:36:12.000000000 -0400
+--- util.c	2014-03-20 10:25:53.000000000 -0400
+***************
+*** 477,480 ****
+--- 479,483 ----
+  }
+  
++ #if defined (DEBUG)
+  #if defined (USE_VARARGS)
+  static FILE *_rl_tracefp;
+***************
+*** 539,542 ****
+--- 542,546 ----
+  }
+  #endif
++ #endif /* DEBUG */
+  
+  
+
diff --git a/meta/recipes-core/readline/readline_6.3.bb b/meta/recipes-core/readline/readline_6.3.bb
index aa30f66..2ae73ea 100644
--- a/meta/recipes-core/readline/readline_6.3.bb
+++ b/meta/recipes-core/readline/readline_6.3.bb
@@ -1,5 +1,7 @@
 require readline.inc
 
+SRC_URI_append = " file://readline63-003"
+
 SRC_URI[archive.md5sum] = "33c8fb279e981274f485fd91da77e94a"
 SRC_URI[archive.sha256sum] = "56ba6071b9462f980c5a72ab0023893b65ba6debb4eeb475d7a563dc65cafd43"
 
-- 
1.9.1


