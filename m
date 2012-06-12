Received: from masterfoo.zenlinux.com ([207.192.74.254])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1SeXzu-00025m-R9
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Jun 2012 22:47:31 +0200
Received: from localhost (c-76-105-137-48.hsd1.or.comcast.net [76.105.137.48])
	(using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by masterfoo.zenlinux.com (Postfix) with ESMTP id 0E4DD2FD1D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jun 2012 16:36:50 -0400 (EDT)
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Jun 2012 13:36:34 -0700
Message-Id: <dbb88617576ea9bbeec08f5e5e15c26c4c18347f.1339533128.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1339533128.git.scott.a.garman@intel.com>
References: <cover.1339533128.git.scott.a.garman@intel.com>
In-Reply-To: <cover.1339533128.git.scott.a.garman@intel.com>
References: <cover.1339533128.git.scott.a.garman@intel.com>
X-MasterFoo-MailScanner-Information: Please contact the ISP for more
	information
X-MailScanner-ID: 0E4DD2FD1D.CB575
X-MasterFoo-MailScanner: Found to be clean
X-MasterFoo-MailScanner-SpamCheck: not spam
X-MasterFoo-MailScanner-From: scott.a.garman@intel.com
X-Spam-Status: No
Subject: [PATCH 03/16] bitbake.conf: Improve wget timeouts
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
X-List-Received-Date: Tue, 12 Jun 2012 20:47:31 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

The wget default is a 900 second timeout and 20 retries. This is way too long
for most of our usecases so this patch changes it to a 30 second timeout and
reduces retries from 5 to 2. We have good mirror infrastructure, this will
let us fall back to it easier.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/bitbake.conf |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 56e3e4d..618780c 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -559,17 +559,17 @@ XORG_MIRROR = "http://xorg.freedesktop.org/releases"
 
 FETCHCMD_svn = "/usr/bin/env svn"
 FETCHCMD_cvs = "/usr/bin/env cvs"
-FETCHCMD_wget = "/usr/bin/env wget -t 5 -nv --no-check-certificate"
+FETCHCMD_wget = "/usr/bin/env wget -t 2 -T 30 -nv --no-check-certificate"
 FETCHCMD_bzr = "/usr/bin/env bzr"
 FETCHCMD_hg = "/usr/bin/env hg"
 
 FETCHCOMMAND = "ERROR, this must be a BitBake bug"
-FETCHCOMMAND_wget = "/usr/bin/env wget -t 5 -nv --passive-ftp --no-check-certificate -P ${DL_DIR} '${URI}'"
+FETCHCOMMAND_wget = "/usr/bin/env wget  -t 2 -T 30 -nv --passive-ftp --no-check-certificate -P ${DL_DIR} '${URI}'"
 FETCHCOMMAND_cvs = "/usr/bin/env cvs '-d${CVSROOT}' co ${CVSCOOPTS} ${CVSMODULE}"
 FETCHCOMMAND_svn = "/usr/bin/env svn co ${SVNCOOPTS} ${SVNROOT} ${SVNMODULE}"
-CHECKCOMMAND_wget = "/usr/bin/env wget --spider -t 5 --passive-ftp --no-check-certificate -P ${DL_DIR} '${URI}'"
+CHECKCOMMAND_wget = "/usr/bin/env wget --spider  -t 2 -T 30 --passive-ftp --no-check-certificate -P ${DL_DIR} '${URI}'"
 RESUMECOMMAND = "ERROR, this must be a BitBake bug"
-RESUMECOMMAND_wget = "/usr/bin/env wget -c -t 5 -nv --passive-ftp --no-check-certificate -P ${DL_DIR} '${URI}'"
+RESUMECOMMAND_wget = "/usr/bin/env wget -c -t 2 -T 30 -nv --passive-ftp --no-check-certificate -P ${DL_DIR} '${URI}'"
 UPDATECOMMAND = "ERROR, this must be a BitBake bug"
 UPDATECOMMAND_cvs = "/usr/bin/env cvs -d${CVSROOT} update -d -P ${CVSCOOPTS}"
 UPDATECOMMAND_svn = "/usr/bin/env svn update ${SVNCOOPTS}"
-- 
1.7.9.5



