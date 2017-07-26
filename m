Return-Path: <n.merinov@inango-systems.com>
X-Greylist: delayed 511 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 26 Jul 2017 08:17:04 UTC
Received: from main-2.inango-systems.com (main-2.inango-systems.com
	[193.200.241.242])
	by mail.openembedded.org (Postfix) with ESMTP id AC4D07823F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Jul 2017 08:17:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by main-2.inango-systems.com (Postfix) with ESMTP id 19FD232DE4E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Jul 2017 11:10:19 +0300 (IDT)
X-Virus-Scanned: Debian amavisd-new at mail.inango-systems.com
Received: from main-2.inango-systems.com ([127.0.0.1])
	by localhost (main-2.inango-systems.com [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id LA1gUwqntA_4; Wed, 26 Jul 2017 11:10:17 +0300 (IDT)
Received: from nmerinov.inango-sw (unknown [194.60.247.123])
	by main-2.inango-systems.com (Postfix) with ESMTPSA id CF41B3256F8;
	Wed, 26 Jul 2017 11:10:16 +0300 (IDT)
From: Nikolay Merinov <n.merinov@inango-systems.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 26 Jul 2017 13:10:31 +0500
Message-Id: <20170726081031.12637-1-n.merinov@inango-systems.com>
X-Mailer: git-send-email 2.13.0
Subject: [krogoth][morty][PATCH] systemd: Disable DefaultDependencies for sysv scripts on rcS runlevel
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
X-List-Received-Date: Wed, 26 Jul 2017 08:17:05 -0000

systemd-sysv-generator translate sysv services on rcS runlevel to
services that starts before sysinit.target. This behavour conflict
with default dependency on same tartget.

String that define "DefaultDependency=no" was lost from patch for
sysv generator during porting patches to systemd 229 in commit
64ab17b707dc431aaed880d6d8615971243f46f8.

Current commit returns changes required for services that work on
rcS runlevel.

Signed-off-by: Nikolay Merinov <n.merinov@inango-systems.com>
---
 ...nerator-add-support-for-executing-scripts-und.patch | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd/0013-sysv-generator-add-support-for-executing-scripts-und.patch b/meta/recipes-core/systemd/systemd/0013-sysv-generator-add-support-for-executing-scripts-und.patch
index ac67f65685..5736f57814 100644
--- a/meta/recipes-core/systemd/systemd/0013-sysv-generator-add-support-for-executing-scripts-und.patch
+++ b/meta/recipes-core/systemd/systemd/0013-sysv-generator-add-support-for-executing-scripts-und.patch
@@ -57,7 +57,17 @@ index b5925a4..ea06d6a 100644
  } SysvStub;
  
  static void free_sysvstub(SysvStub *s) {
-@@ -711,17 +717,31 @@ static int fix_order(SysvStub *s, Hashmap *all_services) {
+@@ -194,6 +198,9 @@ static int generate_unit_file(SysvStub *s) {
+         if (s->description)
+                 fprintf(f, "Description=%s\n", s->description);
+ 
++        if (!s->default_dependencies)
++                fprintf(f, "DefaultDependencies=no\n");
++
+         STRV_FOREACH(p, s->before)
+                 fprintf(f, "Before=%s\n", *p);
+         STRV_FOREACH(p, s->after)
+@@ -711,17 +720,31 @@ static int fix_order(SysvStub *s, Hashmap *all_services) {
                  if (s->has_lsb && other->has_lsb)
                          continue;
  
@@ -95,7 +105,7 @@ index b5925a4..ea06d6a 100644
  
                  /* FIXME: Maybe we should compare the name here lexicographically? */
          }
-@@ -788,6 +808,8 @@ static int enumerate_sysv(const LookupPaths *lp, Hashmap *all_services) {
+@@ -788,6 +811,8 @@ static int enumerate_sysv(const LookupPaths *lp, Hashmap *all_services) {
                                  return log_oom();
  
                          service->sysv_start_priority = -1;
@@ -104,7 +114,7 @@ index b5925a4..ea06d6a 100644
                          service->name = name;
                          service->path = fpath;
                          name = fpath = NULL;
-@@ -871,9 +893,11 @@ static int set_dependencies_from_rcnd(const LookupPaths *lp, Hashmap *all_servic
+@@ -871,9 +896,11 @@ static int set_dependencies_from_rcnd(const LookupPaths *lp, Hashmap *all_servic
  
                                  if (de->d_name[0] == 'S')  {
  
@@ -118,7 +128,7 @@ index b5925a4..ea06d6a 100644
                                          r = set_ensure_allocated(&runlevel_services[i], NULL);
                                          if (r < 0) {
                                                  log_oom();
-@@ -887,7 +911,8 @@ static int set_dependencies_from_rcnd(const LookupPaths *lp, Hashmap *all_servic
+@@ -887,7 +914,8 @@ static int set_dependencies_from_rcnd(const LookupPaths *lp, Hashmap *all_servic
                                          }
  
                                  } else if (de->d_name[0] == 'K' &&
-- 
2.13.0


