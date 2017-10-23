Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 56D7B6FFA1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Oct 2017 02:57:17 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v9N2vJcY029395
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 22 Oct 2017 19:57:19 -0700
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.361.1; Sun, 22 Oct 2017 19:57:16 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 23 Oct 2017 10:56:36 +0800
Message-ID: <bd775e649a6e9942c66d2cd538940b1e9fd7eacc.1508727336.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1508727336.git.liezhi.yang@windriver.com>
References: <cover.1508727336.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] sstate.bbclass: sstate_hardcode_path(): fix for multilib
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
X-List-Received-Date: Mon, 23 Oct 2017 02:57:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

It only substituted staging_target for target recipe which didn't work
for multilib, for example, postinst-useradd-lib32-polkit:

* No multilib:
  PATH=/path/to/tmp-glibc/work/core2-64-wrs-linux/polkit/0.113-r0/recipe-sysroot-native/bin
  It would be substituted to:
  FIXMESTAGINGDIRTARGET-native/bin
  Not the funny "-native/bin", this works well.

* When multilib:
  PATH=/path/to/tmp-glibc/work/core2-32-wrsmllib32-linux/lib32-polkit/0.113-r0/recipe-sysroot-native/bin
  Now staging_target endswith "/lib32-recipe-sysroot", so it can't
  replace '/recipe-sysroot-native', there would be build errors when
  building multilib + rm_work, for example:
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


