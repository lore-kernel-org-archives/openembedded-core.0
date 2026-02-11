Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54814EB596B
	for <webhook@archiver.kernel.org>; Wed, 11 Feb 2026 06:26:15 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13215.1770791170196649052
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Feb 2026 22:26:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=W8ZaFcJb;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=6502e0d1f2=qi.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61B59q8H4150248
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Feb 2026 22:26:09 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=5iInhz+B5TEGnIEwCvJl
	MaWRcrIHSW0mUiRtaFiYDlk=; b=W8ZaFcJbLdjObAp1SkXDnBelC41sRkaEdC2y
	6NjqzsZtdlVZpo+yvU/2NeLCfCnwtIgwi/VioYPcwuxNgRkLOBTAxeKNP60ep7L5
	v04cLnp1ki5SOapFDQ4pW8UF+keN8tFghkh+C3V//fiX4TgKMRhEqBaB2qg4rXPK
	EN9K4AVKqxBS/Hcikw/qOpgnfAcNqhr3eo5dWTDQWj4W9JyobsETe1Jc15e8VsLw
	qxoVSQCJpfrE+W3k6nZ+agVJS2M+O9zD9h+zi+w9V8vVW2LL28Sz8KqtPrafuUYA
	sHp4hHg05do/43Be2wpEVH/2QMfOG/RgQxH+RAqd3eGchP+PLA==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4c61j4v4bp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Feb 2026 22:26:09 -0800 (PST)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Tue, 10 Feb 2026 22:26:08 -0800
Received: from oak-lpgbuild14.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Tue, 10 Feb 2026 22:26:08 -0800
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][PATCH V2] shadow: upgrade from 4.18.0 to 4.19.3
Date: Wed, 11 Feb 2026 06:26:08 +0000
Message-ID: <20260211062608.1779440-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=Wb0BqkhX c=1 sm=1 tr=0 ts=698c2101 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=jVwDQN0dAAAA:20 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8
 a=RWcsd39Gdv9gFwPY0t0A:9 a=FdTzh2GWekK77mhwV6Dw:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-ORIG-GUID: DBVp55uE1xv8pQK5CsKM-6o-B4LVltkA
X-Proofpoint-GUID: DBVp55uE1xv8pQK5CsKM-6o-B4LVltkA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjExMDA1MCBTYWx0ZWRfX/cUGU1atvC8l
 dIHb5sD81lCf7hG89c933f4QwHNRkKaUr/KHz/zKMGuQt0BoDfNu8pg6j6i4HINc7aKYAhX7qjl
 3RZebhw8MziNa3EiYTfQDr4rXrAvYyiO4GoSJvDudfZaOOqc4PI8XwVk0SXUdFYYmujTzNJdT85
 o1E1nQxeMy+a/Ycj3CmzuBUA2q+CuHOJQ8/TbmYmyPXEs811ZorDqUl6RQawMepcKP6KeTTgl8F
 xNaGh99k1+hFvEat97OwJep6/lB8bUP6Lmv41LvSq8so6joc6mJ8amjpKofJW35ya5anGSTgUb0
 4Vz9O66Gu+G75qMz1nB7Tg84c+e3GCrTIv7VwgtZbS9qAE6GkAQoQOZL92x14rI7ptFbLYK3CiJ
 OXzoU1M0B14B649vuZyjTHT45N89ypeo68xeoQcFHCh5W3+RXkHbDoR1kxqMEBOqWANX0iKZziD
 9R1SVk+YbAwLGz3KQOw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-10_03,2026-02-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 adultscore=0 clxscore=1015 suspectscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602110050
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Feb 2026 06:26:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230964

From: Chen Qi <Qi.Chen@windriver.com>

The major changes in 4.19.x:
https://github.com/shadow-maint/shadow/releases/tag/4.19.0

Note that there is change in 4.19 that breaks build with gcc <= 10.
It removed unused parameter names from function declarations and
definitions.

This is not a problem for target shadow. But for shadow-native,
the build fails on hosts that has gcc <= 10. So add 4 extra patches
for native only. The upstream issue and the PR are as below:
https://github.com/shadow-maint/shadow/pull/1531
https://github.com/shadow-maint/shadow/issues/1530

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 ...ests-Unname-unused-parameters-in-cal.patch | 278 ++++++++++++++++++
 ...-avoid-parameter-name-ommitted-error.patch |  39 +++
 ...-src-Unname-unused-parameter-of-main.patch |  62 ++++
 ...c-avoid-parameter-name-omitted-error.patch |  28 ++
 .../{shadow_4.18.0.bb => shadow_4.19.3.bb}    |   6 +-
 5 files changed, 412 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/shadow/files/0001-Revert-lib-src-tests-Unname-unused-parameters-in-cal.patch
 create mode 100644 meta/recipes-extended/shadow/files/0002-lib-sssd.h-avoid-parameter-name-ommitted-error.patch
 create mode 100644 meta/recipes-extended/shadow/files/0003-Revert-src-Unname-unused-parameter-of-main.patch
 create mode 100644 meta/recipes-extended/shadow/files/0004-src-chsh.c-avoid-parameter-name-omitted-error.patch
 rename meta/recipes-extended/shadow/{shadow_4.18.0.bb => shadow_4.19.3.bb} (95%)

diff --git a/meta/recipes-extended/shadow/files/0001-Revert-lib-src-tests-Unname-unused-parameters-in-cal.patch b/meta/recipes-extended/shadow/files/0001-Revert-lib-src-tests-Unname-unused-parameters-in-cal.patch
new file mode 100644
index 0000000000..fcea5d7448
--- /dev/null
+++ b/meta/recipes-extended/shadow/files/0001-Revert-lib-src-tests-Unname-unused-parameters-in-cal.patch
@@ -0,0 +1,278 @@
+From 76cce1b4979b1406ac76f0e201e3db0424d1132b Mon Sep 17 00:00:00 2001
+From: Chen Qi <Qi.Chen@windriver.com>
+Date: Wed, 11 Feb 2026 05:23:32 +0000
+Subject: [PATCH 1/3] Revert "lib/, src/ tests/: Unname unused parameters in
+ callbacks"
+
+This reverts commit 9e711e2240c72017dacf088d2931fb26dc6e8fed.
+
+We cannot just uname these unused parameters because gcc 10
+need them. There will be error like below with gcc 10:
+
+  lib/copydir.c:103:11: error: parameter name omitted
+
+Fixes: https://github.com/shadow-maint/shadow/issues/1530
+
+Upstream-Status: Submitted [https://github.com/shadow-maint/shadow/pull/1531]
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ lib/cleanup_user.c             |  1 +
+ lib/copydir.c                  |  3 +--
+ lib/loginprompt.c              |  3 +--
+ lib/pam_pass_non_interactive.c |  4 ++--
+ lib/semanage.c                 |  2 +-
+ src/expiry.c                   |  5 ++---
+ src/gpasswd.c                  | 25 ++++++++++---------------
+ src/login.c                    |  6 ++----
+ src/su.c                       |  5 ++---
+ src/sulogin.c                  |  3 +--
+ tests/unit/test_logind.c       |  4 ++--
+ 11 files changed, 25 insertions(+), 36 deletions(-)
+
+diff --git a/lib/cleanup_user.c b/lib/cleanup_user.c
+index 0af0c67f..00554d89 100644
+--- a/lib/cleanup_user.c
++++ b/lib/cleanup_user.c
+@@ -9,6 +9,7 @@
+ #include <assert.h>
+ #include <stdio.h>
+ 
++#include "attr.h"
+ #include "defines.h"
+ #include "pwio.h"
+ #include "shadowio.h"
+diff --git a/lib/copydir.c b/lib/copydir.c
+index 796015af..f42d5d6d 100644
+--- a/lib/copydir.c
++++ b/lib/copydir.c
+@@ -99,8 +99,7 @@ static int fchown_if_needed (int fdst, const struct stat *statp,
+  * error_acl - format the error messages for the ACL and EQ libraries.
+  */
+ format_attr(printf, 2, 3)
+-static void
+-error_acl(struct error_context *, const char *fmt, ...)
++static void error_acl (MAYBE_UNUSED struct error_context *ctx, const char *fmt, ...)
+ {
+ 	va_list ap;
+ 	FILE *shadow_logfd = log_get_logfd();
+diff --git a/lib/loginprompt.c b/lib/loginprompt.c
+index 18b899f5..4798d1c6 100644
+--- a/lib/loginprompt.c
++++ b/lib/loginprompt.c
+@@ -26,8 +26,7 @@
+ #include "string/strtok/stpsep.h"
+ 
+ 
+-static void
+-login_exit(int)
++static void login_exit (MAYBE_UNUSED int sig)
+ {
+ 	_exit (EXIT_FAILURE);
+ }
+diff --git a/lib/pam_pass_non_interactive.c b/lib/pam_pass_non_interactive.c
+index 054077f3..8a5910b8 100644
+--- a/lib/pam_pass_non_interactive.c
++++ b/lib/pam_pass_non_interactive.c
+@@ -27,7 +27,7 @@
+ static int ni_conv (int num_msg,
+                     const struct pam_message **msg,
+                     struct pam_response **resp,
+-                    void *);
++                    MAYBE_UNUSED void *appdata_ptr);
+ static const struct pam_conv non_interactive_pam_conv = {
+ 	ni_conv,
+ 	NULL
+@@ -38,7 +38,7 @@ static const struct pam_conv non_interactive_pam_conv = {
+ static int ni_conv (int num_msg,
+                     const struct pam_message **msg,
+                     struct pam_response **resp,
+-                    void *)
++                    MAYBE_UNUSED void *appdata_ptr)
+ {
+ 	struct pam_response *responses;
+ 	int count;
+diff --git a/lib/semanage.c b/lib/semanage.c
+index e20fea6e..c9742f0c 100644
+--- a/lib/semanage.c
++++ b/lib/semanage.c
+@@ -28,7 +28,7 @@
+ 
+ 
+ format_attr(printf, 3, 4)
+-static void semanage_error_callback (void *,
++static void semanage_error_callback (MAYBE_UNUSED void *varg,
+                                      semanage_handle_t *handle,
+                                      const char *fmt, ...)
+ {
+diff --git a/src/expiry.c b/src/expiry.c
+index 8da89bdf..412e54d6 100644
+--- a/src/expiry.c
++++ b/src/expiry.c
+@@ -29,15 +29,14 @@ static const char Prog[] = "expiry";
+ static bool cflg = false;
+ 
+ /* local function prototypes */
+-static void catch_signals(int);
++static void catch_signals (MAYBE_UNUSED int sig);
+ NORETURN static void usage (int status);
+ static void process_flags (int argc, char **argv);
+ 
+ /*
+  * catch_signals - signal catcher
+  */
+-static void
+-catch_signals(int)
++static void catch_signals (MAYBE_UNUSED int sig)
+ {
+ 	_exit (10);
+ }
+diff --git a/src/gpasswd.c b/src/gpasswd.c
+index 14c8f4f6..d6a14426 100644
+--- a/src/gpasswd.c
++++ b/src/gpasswd.c
+@@ -109,14 +109,14 @@ static void update_group (struct group *gr);
+ static void change_passwd (struct group *gr);
+ #endif
+ static void log_gpasswd_failure (const char *suffix);
+-static void log_gpasswd_failure_system (/*@null@*/void *);
+-static void log_gpasswd_failure_group (/*@null@*/void *);
++static void log_gpasswd_failure_system (/*@null@*/MAYBE_UNUSED void *arg);
++static void log_gpasswd_failure_group (/*@null@*/MAYBE_UNUSED void *arg);
+ #ifdef SHADOWGRP
+-static void log_gpasswd_failure_gshadow (/*@null@*/void *);
++static void log_gpasswd_failure_gshadow (/*@null@*/MAYBE_UNUSED void *arg);
+ #endif
+ static void log_gpasswd_success (const char *suffix);
+-static void log_gpasswd_success_system (/*@null@*/void *);
+-static void log_gpasswd_success_group(/*@null@*/void *);
++static void log_gpasswd_success_system (/*@null@*/MAYBE_UNUSED void *arg);
++static void log_gpasswd_success_group (/*@null@*/MAYBE_UNUSED void *arg);
+ 
+ /*
+  * usage - display usage message
+@@ -471,14 +471,12 @@ static void log_gpasswd_failure (const char *suffix)
+ 	}
+ }
+ 
+-static void
+-log_gpasswd_failure_system(void *)
++static void log_gpasswd_failure_system (MAYBE_UNUSED void *arg)
+ {
+ 	log_gpasswd_failure ("");
+ }
+ 
+-static void
+-log_gpasswd_failure_group(void *)
++static void log_gpasswd_failure_group (MAYBE_UNUSED void *arg)
+ {
+ 	char  buf[1024];
+ 
+@@ -487,8 +485,7 @@ log_gpasswd_failure_group(void *)
+ }
+ 
+ #ifdef SHADOWGRP
+-static void
+-log_gpasswd_failure_gshadow(void *)
++static void log_gpasswd_failure_gshadow (MAYBE_UNUSED void *arg)
+ {
+ 	char  buf[1024];
+ 
+@@ -585,14 +582,12 @@ static void log_gpasswd_success (const char *suffix)
+ 	}
+ }
+ 
+-static void
+-log_gpasswd_success_system(void *)
++static void log_gpasswd_success_system (MAYBE_UNUSED void *arg)
+ {
+ 	log_gpasswd_success ("");
+ }
+ 
+-static void
+-log_gpasswd_success_group(void *)
++static void log_gpasswd_success_group (MAYBE_UNUSED void *arg)
+ {
+ 	char  buf[1024];
+ 
+diff --git a/src/login.c b/src/login.c
+index 2af11b47..1332d36d 100644
+--- a/src/login.c
++++ b/src/login.c
+@@ -366,14 +366,12 @@ static void init_env (void)
+ #endif				/* !USE_PAM */
+ }
+ 
+-static void
+-exit_handler(int)
++static void exit_handler (MAYBE_UNUSED int sig)
+ {
+ 	_exit (0);
+ }
+ 
+-static void
+-alarm_handler(int)
++static void alarm_handler (MAYBE_UNUSED int sig)
+ {
+ 	write_full(STDERR_FILENO, tmsg, strlen(tmsg));
+ 	signal(SIGALRM, exit_handler);
+diff --git a/src/su.c b/src/su.c
+index 583979c2..5b7b9b77 100644
+--- a/src/su.c
++++ b/src/su.c
+@@ -115,7 +115,7 @@ static void execve_shell (const char *shellname,
+                           char *args[],
+                           char *const envp[]);
+ #ifdef USE_PAM
+-static void kill_child(int);
++static void kill_child (MAYBE_UNUSED int s);
+ static void prepare_pam_close_session (void);
+ #else				/* !USE_PAM */
+ static void die (int);
+@@ -169,8 +169,7 @@ static bool iswheel (const char *username)
+ 	return is_on_list (grp->gr_mem, username);
+ }
+ #else				/* USE_PAM */
+-static void
+-kill_child(int)
++static void kill_child (MAYBE_UNUSED int s)
+ {
+ 	if (0 != pid_child) {
+ 		(void) kill (-pid_child, SIGKILL);
+diff --git a/src/sulogin.c b/src/sulogin.c
+index 3089c02d..74d2ff37 100644
+--- a/src/sulogin.c
++++ b/src/sulogin.c
+@@ -49,8 +49,7 @@ static void catch_signals (int);
+ static int pw_entry(const char *name, struct passwd *pwent);
+ 
+ 
+-static void
+-catch_signals(int)
++static void catch_signals (MAYBE_UNUSED int sig)
+ {
+ 	_exit (1);
+ }
+diff --git a/tests/unit/test_logind.c b/tests/unit/test_logind.c
+index 6cfc6d91..4f5cf757 100644
+--- a/tests/unit/test_logind.c
++++ b/tests/unit/test_logind.c
+@@ -19,13 +19,13 @@
+  * WRAPPERS
+  **********************/
+ struct passwd *
+-__wrap_prefix_getpwnam(uid_t)
++__wrap_prefix_getpwnam(uid_t uid)
+ {
+     return (struct passwd*) mock();
+ }
+ 
+ int
+-__wrap_sd_uid_get_sessions(uid_t, int, char ***)
++__wrap_sd_uid_get_sessions(uid_t uid, int require_active, char ***sessions)
+ {
+     return mock();
+ }
+-- 
+2.43.0
+
diff --git a/meta/recipes-extended/shadow/files/0002-lib-sssd.h-avoid-parameter-name-ommitted-error.patch b/meta/recipes-extended/shadow/files/0002-lib-sssd.h-avoid-parameter-name-ommitted-error.patch
new file mode 100644
index 0000000000..536a32f08b
--- /dev/null
+++ b/meta/recipes-extended/shadow/files/0002-lib-sssd.h-avoid-parameter-name-ommitted-error.patch
@@ -0,0 +1,39 @@
+From 4f197ed9feb28aedff34b5f4332f1117adcb58a6 Mon Sep 17 00:00:00 2001
+From: Chen Qi <Qi.Chen@windriver.com>
+Date: Wed, 11 Feb 2026 05:19:18 +0000
+Subject: [PATCH 2/3] lib/sssd.h: avoid parameter name ommitted error
+
+Fixes: https://github.com/shadow-maint/shadow/issues/1530
+
+Upstream-Status: Submitted [https://github.com/shadow-maint/shadow/pull/1531]
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ lib/sssd.h | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/lib/sssd.h b/lib/sssd.h
+index 1f7ff3cc..dc6dfffb 100644
+--- a/lib/sssd.h
++++ b/lib/sssd.h
+@@ -1,6 +1,8 @@
+ #ifndef _SSSD_H_
+ #define _SSSD_H_
+ 
++#include "attr.h"
++
+ #define SSSD_DB_PASSWD	0x001
+ #define SSSD_DB_GROUP	0x002
+ 
+@@ -11,7 +13,7 @@
+ extern int sssd_flush_cache (int dbflags);
+ #else
+ static inline int
+-sssd_flush_cache(int)
++sssd_flush_cache(MAYBE_UNUSED int unused)
+ {
+ 	return 0;
+ }
+-- 
+2.43.0
+
diff --git a/meta/recipes-extended/shadow/files/0003-Revert-src-Unname-unused-parameter-of-main.patch b/meta/recipes-extended/shadow/files/0003-Revert-src-Unname-unused-parameter-of-main.patch
new file mode 100644
index 0000000000..63c80c4d95
--- /dev/null
+++ b/meta/recipes-extended/shadow/files/0003-Revert-src-Unname-unused-parameter-of-main.patch
@@ -0,0 +1,62 @@
+From abbb2a1ecec04e50dd2f81a8ea2fcc4e28013a64 Mon Sep 17 00:00:00 2001
+From: Chen Qi <Qi.Chen@windriver.com>
+Date: Wed, 11 Feb 2026 05:27:32 +0000
+Subject: [PATCH 3/3] Revert "src/: Unname unused parameter of main()"
+
+This reverts commit 0663ba20951909d6bd5f5af5f16c39cef1595583.
+
+Fixes: https://github.com/shadow-maint/shadow/issues/1530
+
+Upstream-Status: Submitted [https://github.com/shadow-maint/shadow/pull/1531]
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ src/grpconv.c   | 3 +--
+ src/grpunconv.c | 3 +--
+ src/logoutd.c   | 2 +-
+ 3 files changed, 3 insertions(+), 5 deletions(-)
+
+diff --git a/src/grpconv.c b/src/grpconv.c
+index 4a0c308d..426fcfce 100644
+--- a/src/grpconv.c
++++ b/src/grpconv.c
+@@ -276,8 +276,7 @@ int main (int argc, char **argv)
+ 	return 0;
+ }
+ #else				/* !SHADOWGRP */
+-int
+-main(int, char **argv)
++int main (MAYBE_UNUSED int argc, char **argv)
+ {
+ 	fprintf (stderr,
+ 		 "%s: not configured for shadow group support.\n", argv[0]);
+diff --git a/src/grpunconv.c b/src/grpunconv.c
+index 5e76ede0..b59ad13d 100644
+--- a/src/grpunconv.c
++++ b/src/grpunconv.c
+@@ -238,8 +238,7 @@ int main (int argc, char **argv)
+ 	return 0;
+ }
+ #else				/* !SHADOWGRP */
+-int
+-main(int, char **argv)
++int main (MAYBE_UNUSED int argc, char **argv)
+ {
+ 	fprintf (stderr,
+ 		 "%s: not configured for shadow group support.\n", argv[0]);
+diff --git a/src/logoutd.c b/src/logoutd.c
+index c87b75cb..05404bba 100644
+--- a/src/logoutd.c
++++ b/src/logoutd.c
+@@ -116,7 +116,7 @@ static void send_mesg_to_tty (int tty_fd)
+  *	off from the system.
+  */
+ int
+-main(int argc, char *[])
++main(int argc, char **argv)
+ {
+ 	pid_t  pid;
+ 
+-- 
+2.43.0
+
diff --git a/meta/recipes-extended/shadow/files/0004-src-chsh.c-avoid-parameter-name-omitted-error.patch b/meta/recipes-extended/shadow/files/0004-src-chsh.c-avoid-parameter-name-omitted-error.patch
new file mode 100644
index 0000000000..12d562a98a
--- /dev/null
+++ b/meta/recipes-extended/shadow/files/0004-src-chsh.c-avoid-parameter-name-omitted-error.patch
@@ -0,0 +1,28 @@
+From cff48beeff644f6df60d8413f14fbb0e94aec23f Mon Sep 17 00:00:00 2001
+From: Chen Qi <Qi.Chen@windriver.com>
+Date: Wed, 11 Feb 2026 05:51:36 +0000
+Subject: [PATCH 4/4] src/chsh.c: avoid parameter name omitted error
+
+Upstream-Status: Submitted [https://github.com/shadow-maint/shadow/pull/1531]
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ src/chsh.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/chsh.c b/src/chsh.c
+index 0cfe26ee..68ec4d48 100644
+--- a/src/chsh.c
++++ b/src/chsh.c
+@@ -198,7 +198,7 @@ static bool shell_is_listed (const char *sh, bool process_selinux)
+ 
+ #else /* without HAVE_VENDORDIR */
+ 
+-static bool shell_is_listed (const char *sh, bool)
++static bool shell_is_listed (const char *sh, MAYBE_UNUSED bool unused)
+ {
+ 	bool found = false;
+ 	char *cp;
+-- 
+2.43.0
+
diff --git a/meta/recipes-extended/shadow/shadow_4.18.0.bb b/meta/recipes-extended/shadow/shadow_4.19.3.bb
similarity index 95%
rename from meta/recipes-extended/shadow/shadow_4.18.0.bb
rename to meta/recipes-extended/shadow/shadow_4.19.3.bb
index d9a49d8ccf..7ebda315e6 100644
--- a/meta/recipes-extended/shadow/shadow_4.18.0.bb
+++ b/meta/recipes-extended/shadow/shadow_4.19.3.bb
@@ -24,8 +24,12 @@ SRC_URI:append:class-target = " \
 SRC_URI:append:class-native = " \
            file://commonio.c-fix-unexpected-open-failure-in-chroot-env.patch \
            file://disable_syslog.patch \
+           file://0001-Revert-lib-src-tests-Unname-unused-parameters-in-cal.patch \
+           file://0002-lib-sssd.h-avoid-parameter-name-ommitted-error.patch \
+           file://0003-Revert-src-Unname-unused-parameter-of-main.patch \
+           file://0004-src-chsh.c-avoid-parameter-name-omitted-error.patch \
            "
-SRC_URI[sha256sum] = "ae486ce4c0bce55c42d76d8478e428c41586f1da2f89fbf5228243fb4d849db4"
+SRC_URI[sha256sum] = "3bd304a2f3936a7bd31a29aa59e61a1873d15fd4f3e041b0175d2b91e0b25c5d"
 UPSTREAM_CHECK_REGEX = "releases/tag/v?(?P<pver>\d+(\.\d+)+)$"
 
 # Additional Policy files for PAM
-- 
2.43.0


