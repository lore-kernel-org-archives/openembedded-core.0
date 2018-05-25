Return-Path: <Yue.Tao@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id EBC77744EC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 May 2018 03:10:19 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w4P39sC8026747
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 May 2018 20:10:10 -0700
Received: from ala-lpd-susbld2.wrs.com (147.11.105.122) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.361.1; Thu, 24 May 2018 20:09:44 -0700
From: Yue Tao <Yue.Tao@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 24 May 2018 20:09:11 -0700
Message-ID: <20180525030911.55982-1-Yue.Tao@windriver.com>
X-Mailer: git-send-email 2.17.0
MIME-Version: 1.0
X-Originating-IP: [147.11.105.122]
Cc: yue.tao@windriver.com
Subject: [PATCH] waf.bbclass: correct the searching patch of waf
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
X-List-Received-Date: Fri, 25 May 2018 03:10:20 -0000
Content-Type: text/plain

The waf is localed at ${S}/buildtools/bin/, not ${S}. Update the
subsrcdir to look for the right path. The WARNINGs below can be fixed
by the fix.

WARNING: lib32-libtalloc-2.1.9-r0 do_configure: Unable to execute waf --version, exit code 127. Assuming waf version without bindir/libdir support.
WARNING: lib32-libtdb-1.3.14-r0 do_configure: Unable to execute waf --version, exit code 127. Assuming waf version without bindir/libdir support.
WARNING: lib32-libtevent-0.9.31-r0 do_configure: Unable to execute waf --version, exit code 127. Assuming waf version without bindir/libdir support.
WARNING: lib32-libldb-1.1.29-r0 do_configure: Unable to execute waf --version, exit code 127. Assuming waf version without bindir/libdir support.
WARNING: lib32-samba-4.6.7-r0 do_configure: Unable to execute waf --version, exit code 127. Assuming waf version without bindir/libdir support.

Signed-off-by: Yue Tao <Yue.Tao@windriver.com>
---
 meta/classes/waf.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/waf.bbclass b/meta/classes/waf.bbclass
index 19e93761b3..f8e66835fb 100644
--- a/meta/classes/waf.bbclass
+++ b/meta/classes/waf.bbclass
@@ -7,7 +7,7 @@ python waf_preconfigure() {
     import subprocess
     from distutils.version import StrictVersion
     subsrcdir = d.getVar('S')
-    wafbin = os.path.join(subsrcdir, 'waf')
+    wafbin = os.path.join(subsrcdir + '/buildtools/bin/', 'waf')
     try:
         result = subprocess.check_output([wafbin, '--version'], cwd=subsrcdir, stderr=subprocess.STDOUT)
         version = result.decode('utf-8').split()[1]
-- 
2.17.0


