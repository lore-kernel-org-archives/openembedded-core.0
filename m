Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8967375C51
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Aug 2016 07:52:56 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u7M7qvm1011089
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Aug 2016 00:52:57 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 22 Aug 2016 00:52:56 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 22 Aug 2016 00:52:46 -0700
Message-ID: <0f1b231e37198a836a19f1f6a3f6b1734261cc60.1471850849.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <cover.1471850849.git.liezhi.yang@windriver.com>
References: <cover.1471850849.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH V4 09/11] python-3.5-manifest.inc: the signal module RDEPENDS on enum
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
X-List-Received-Date: Mon, 22 Aug 2016 07:52:56 -0000
Content-Type: text/plain

Fixed:
$ python3
>>> import signal
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
  File "/path/to/sdk/sysroots/x86_64-pokysdk-linux/usr/lib/python3.5/signal.py", line 4, in <module>
    from enum import IntEnum as _IntEnum
ImportError: No module named 'enum'

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-devtools/python/python-3.5-manifest.inc | 2 +-
 scripts/contrib/python/generate-manifest-3.5.py      | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/python/python-3.5-manifest.inc b/meta/recipes-devtools/python/python-3.5-manifest.inc
index b9c2fec..bc6842b 100644
--- a/meta/recipes-devtools/python/python-3.5-manifest.inc
+++ b/meta/recipes-devtools/python/python-3.5-manifest.inc
@@ -206,7 +206,7 @@ RDEPENDS_${PN}-shell="${PN}-core ${PN}-re ${PN}-compression"
 FILES_${PN}-shell="${libdir}/python3.5/cmd.* ${libdir}/python3.5/commands.* ${libdir}/python3.5/dircache.* ${libdir}/python3.5/fnmatch.* ${libdir}/python3.5/glob.* ${libdir}/python3.5/popen2.* ${libdir}/python3.5/shlex.* ${libdir}/python3.5/shutil.* "
 
 SUMMARY_${PN}-signal="Python set handlers for asynchronous events support"
-RDEPENDS_${PN}-signal="${PN}-core"
+RDEPENDS_${PN}-signal="${PN}-core ${PN}-enum"
 FILES_${PN}-signal="${libdir}/python3.5/signal.* "
 
 SUMMARY_${PN}-smtpd="Python Simple Mail Transport Daemon"
diff --git a/scripts/contrib/python/generate-manifest-3.5.py b/scripts/contrib/python/generate-manifest-3.5.py
index 3a88018..9f53dbe 100755
--- a/scripts/contrib/python/generate-manifest-3.5.py
+++ b/scripts/contrib/python/generate-manifest-3.5.py
@@ -345,7 +345,7 @@ if __name__ == "__main__":
     m.addPackage( "${PN}-shell", "Python shell-like functionality", "${PN}-core ${PN}-re ${PN}-compression",
     "cmd.* commands.* dircache.* fnmatch.* glob.* popen2.* shlex.* shutil.*" )
 
-    m.addPackage( "${PN}-signal", "Python set handlers for asynchronous events support", "${PN}-core",
+    m.addPackage( "${PN}-signal", "Python set handlers for asynchronous events support", "${PN}-core ${PN}-enum",
     "signal.*" )
 
     m.addPackage( "${PN}-subprocess", "Python subprocess support", "${PN}-core ${PN}-io ${PN}-re ${PN}-fcntl ${PN}-pickle ${PN}-threading ${PN}-signal ${PN}-selectors",
-- 
2.9.0


