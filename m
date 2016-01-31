Return-Path: <Paul.Gortmaker@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 57861731EF
	for <openembedded-core@lists.openembedded.org>;
	Sun, 31 Jan 2016 19:56:37 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u0VJuK6w007201
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 31 Jan 2016 11:56:21 -0800 (PST)
Received: from yow-cube1.wrs.com (128.224.56.98) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Sun, 31 Jan 2016 11:56:19 -0800
From: Paul Gortmaker <paul.gortmaker@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 31 Jan 2016 14:56:03 -0500
Message-ID: <1454270163-5294-1-git-send-email-paul.gortmaker@windriver.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Subject: [PATCH] xterm: revert FILES_PN change from recent package uprev
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
X-List-Received-Date: Sun, 31 Jan 2016 19:56:40 -0000
Content-Type: text/plain

After the uprev in: commit ad5d2ff6c782a3319aedc25cc641574e39328460
("xterm: 308 -> 320") I started getting this failure:

ERROR: QA Issue: xterm: Files/directories were installed but not shipped in any package:
  /usr/lib
  /usr/lib/X11
  /usr/lib/X11/app-defaults
  /usr/lib/X11/app-defaults/XTerm-color
  /usr/lib/X11/app-defaults/UXTerm
  /usr/lib/X11/app-defaults/UXTerm-color
  /usr/lib/X11/app-defaults/XTerm
  /usr/lib/X11/app-defaults/KOI8RXTerm-color
  /usr/lib/X11/app-defaults/KOI8RXTerm
Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
xterm: 9 installed and not shipped files. [installed-vs-shipped]
ERROR: Fatal QA errors found, failing task.
ERROR: Function failed: do_package
ERROR: Logfile of failure stored in: /home/paul/poky/build/tmp/work/core2-64-overc-linux/xterm/320-r0/temp/log.do_package.4639
ERROR: Task 11 (/home/paul/poky/meta-openembedded/meta-oe/recipes-graphics/xorg-app/xterm_320.bb, do_package) failed with exit code '1'
NOTE: Tasks Summary: Attempted 1056 tasks of which 858 didn't need to be rerun and 1 failed.

The fail can be avoided by the revert of one line that was in
the above commit, as which is done here.  Should there be a
desire to better absract out FILES_${PN} that can be done in
a separate follow on commit that is tested to confirm it does
not reintroduce this same build regression.

Cc: Li xin <lixin.fnst@cn.fujitsu.com>
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
---
 meta-oe/recipes-graphics/xorg-app/xterm_320.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/xorg-app/xterm_320.bb b/meta-oe/recipes-graphics/xorg-app/xterm_320.bb
index f67d890abcae..10b75fca32db 100644
--- a/meta-oe/recipes-graphics/xorg-app/xterm_320.bb
+++ b/meta-oe/recipes-graphics/xorg-app/xterm_320.bb
@@ -27,4 +27,4 @@ do_configure() {
     oe_runconf
 }
 
-FILES_${PN} += "${libdir}/X11"
+FILES_${PN} += "/usr/lib/X11"
-- 
2.1.4


