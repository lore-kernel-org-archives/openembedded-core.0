Return-Path: <Paul.Gortmaker@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D33B475C61
	for <openembedded-core@lists.openembedded.org>;
	Sun, 31 Jan 2016 18:28:07 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u0VIS6PZ000961
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 31 Jan 2016 10:28:06 -0800 (PST)
Received: from yow-cube1.wrs.com (128.224.56.98) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Sun, 31 Jan 2016 10:28:06 -0800
From: Paul Gortmaker <paul.gortmaker@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 31 Jan 2016 13:27:55 -0500
Message-ID: <1454264875-15715-1-git-send-email-paul.gortmaker@windriver.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Subject: [PATCH] git: add site_perl to packaged files to fix QA install error
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
X-List-Received-Date: Sun, 31 Jan 2016 18:28:11 -0000
Content-Type: text/plain

Recently this started appearing on my x86_64 builds:

ERROR: QA Issue: git: Files/directories were installed but not shipped in any package:
  /usr/lib64
  /usr/lib64/site_perl
  /usr/lib64/site_perl/5.22.1
  /usr/lib64/site_perl/5.22.1/Git.pm
  /usr/lib64/site_perl/5.22.1/Error.pm
  /usr/lib64/site_perl/5.22.1/perllocal.pod
  /usr/lib64/site_perl/5.22.1/Git
  /usr/lib64/site_perl/5.22.1/auto
  /usr/lib64/site_perl/5.22.1/Git/IndexInfo.pm
  /usr/lib64/site_perl/5.22.1/Git/SVN.pm
  /usr/lib64/site_perl/5.22.1/Git/I18N.pm
  /usr/lib64/site_perl/5.22.1/Git/SVN
  /usr/lib64/site_perl/5.22.1/Git/SVN/Log.pm
  /usr/lib64/site_perl/5.22.1/Git/SVN/Prompt.pm
 [...]
  /usr/lib64/site_perl/5.22.1/Git/SVN/Memoize/YAML.pm
  /usr/lib64/site_perl/5.22.1/auto/Git
  /usr/lib64/site_perl/5.22.1/auto/Git/.packlist
Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
git: 24 installed and not shipped files. [installed-vs-shipped]
ERROR: Fatal QA errors found, failing task.
ERROR: Function failed: do_package
ERROR: Logfile of failure stored in: /home/paul/poky/build/tmp/work/core2-64-overc-linux/git/2.7.0-r0/temp/log.do_package.15893
ERROR: Task 11 (/home/paul/poky/meta/recipes-devtools/git/git_2.7.0.bb, do_package) failed with exit code '1'

At first I thought it was the git uprev from 2.5 --> 2.7 but even
after reverting that, the problem remained.  So it must be related
to some other infrastructural or perl change.  As the fix was
relatively obvious, I did not investigate the root cause any
further -- as the perl magic in the git bb is enough to scare
small children.

Cc: Robert Yang <liezhi.yang@windriver.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
---
 meta/recipes-devtools/git/git.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/git/git.inc b/meta/recipes-devtools/git/git.inc
index c19e0d47483c..4a0a62888631 100644
--- a/meta/recipes-devtools/git/git.inc
+++ b/meta/recipes-devtools/git/git.inc
@@ -101,6 +101,7 @@ PACKAGES =+ "${PN}-perltools"
 FILES_${PN}-perltools += " \
     ${PERLTOOLS} \
     ${libdir}/perl \
+    ${libdir}/site_perl \
     ${datadir}/perl \
 "
 RDEPENDS_${PN}-perltools = "${PN} perl perl-module-file-path findutils"
-- 
2.1.4


