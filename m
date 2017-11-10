Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 08FB578636
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Nov 2017 13:22:51 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id vAADMqlb001312
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Nov 2017 05:22:52 -0800 (PST)
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.361.1; Fri, 10 Nov 2017 05:22:51 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 10 Nov 2017 14:27:07 +0800
Message-ID: <2e28e24e7eac3acdd2478aa85f2d191842aef2dd.1510275834.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1510275834.git.liezhi.yang@windriver.com>
References: <cover.1510275834.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 07/23] sstate.bbclass: sstate_hardcode_path(): fix for multilib
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
X-List-Received-Date: Fri, 10 Nov 2017 13:22:51 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

It only substituted staging_target for target recipe which didn't work
for multilib, for example, postinst-useradd-lib32-polkit:

* No multilib:
  PATH=/path/to/tmp-glibc/work/core2-64-wrs-linux/polkit/0.113-r0/recipe-sysroot-native/bin
  staging_target=/path/to/tmp-glibc/work/core2-64-wrs-linux/polkit/0.113-r0/recipe-sysroot
  The PATH would be substituted to:
  FIXMESTAGINGDIRTARGET-native/bin
  Not the funny "-native/bin", this works well.

* When multilib:
  PATH=/path/to/tmp-glibc/work/core2-32-wrsmllib32-linux/lib32-polkit/0.113-r0/recipe-sysroot-native/bin
  staging_target=/path/to/tmp-glibc/work/core2-32-wrsmllib32-linux/lib32-polkit/0.113-r0/lib32-recipe-sysroot
  Now staging_target endswith "/lib32-recipe-sysroot", so it can't
  replace '/recipe-sysroot-native' in PATH , so PATH can't be fixed, and
  there would be build errors when building multilib + rm_work, for
  example:
  chown: invalid user: ‘polkitd:root’

Substitute staging_host for target recipe can fix the problem, now all
of native, cross and target need substitute staging_host, so we can
simply the code a little.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/sstate.bbclass | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index e30fbe1..314a14d 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -538,15 +538,15 @@ python sstate_hardcode_path () {
     staging_host = d.getVar('RECIPE_SYSROOT_NATIVE')
     sstate_builddir = d.getVar('SSTATE_BUILDDIR')
 
+    sstate_sed_cmd = "sed -i -e 's:%s:FIXMESTAGINGDIRHOST:g'" % staging_host
     if bb.data.inherits_class('native', d) or bb.data.inherits_class('cross-canadian', d):
         sstate_grep_cmd = "grep -l -e '%s'" % (staging_host)
-        sstate_sed_cmd = "sed -i -e 's:%s:FIXMESTAGINGDIRHOST:g'" % (staging_host)
     elif bb.data.inherits_class('cross', d) or bb.data.inherits_class('crosssdk', d):
         sstate_grep_cmd = "grep -l -e '%s' -e '%s'" % (staging_target, staging_host)
-        sstate_sed_cmd = "sed -i -e 's:%s:FIXMESTAGINGDIRTARGET:g; s:%s:FIXMESTAGINGDIRHOST:g'" % (staging_target, staging_host)
+        sstate_sed_cmd += " -e 's:%s:FIXMESTAGINGDIRTARGET:g'" % staging_target
     else:
         sstate_grep_cmd = "grep -l -e '%s'" % (staging_target)
-        sstate_sed_cmd = "sed -i -e 's:%s:FIXMESTAGINGDIRTARGET:g'" % (staging_target)
+        sstate_sed_cmd += " -e 's:%s:FIXMESTAGINGDIRTARGET:g'" % staging_target
 
     extra_staging_fixmes = d.getVar('EXTRA_STAGING_FIXMES') or ''
     for fixmevar in extra_staging_fixmes.split():
-- 
2.7.4


