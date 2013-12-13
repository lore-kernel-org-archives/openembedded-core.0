Return-Path: <mian.muhammad.tauqir.ahmad@gmail.com>
Received: from mail-pd0-f180.google.com (mail-pd0-f180.google.com
	[209.85.192.180])
	by mail.openembedded.org (Postfix) with ESMTP id 3A7916DDFD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Dec 2013 19:26:53 +0000 (UTC)
Received: by mail-pd0-f180.google.com with SMTP id q10so2863855pdj.25
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Dec 2013 11:26:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=jF+Yf6ziOMn9EZdM+753sBy+ztJy90VoseDIb6KZHZA=;
	b=biVswK0JNgKib4I0AWJ50GSLlvh7xVnP2FKqlxYLll16WSzgREeCzshiGQ/dSys9Du
	bXoH0AcGCtlyrGxrk02SBCNsOc9CsEVKIYMuVShKEQpE0BblbglPwyyF+SiujSR8Hq1l
	pVDle2pPWf36EI3ZWSteYpy/T0Q45Yp08TrvuQMBbO0DuQzlWGMdnf9d5+vbrLnRUtKP
	0cHAjnyH4FtPRWCMyYsRXULNq56PIEVyIHZ05a1HsrklsJWYvt012hXcN8DdREbkIgO5
	M4D7ZNjrUpqpOAhS1pIRwNKFR5BPpsL189mlYe3KK5Vln43u20GR1Ot+DI5Brr9tm0p2
	xPCQ==
X-Received: by 10.66.66.42 with SMTP id c10mr5222794pat.98.1386962812625;
	Fri, 13 Dec 2013 11:26:52 -0800 (PST)
Received: from high-fructose-corn-syrup.csclub.uwaterloo.ca
	(high-fructose-corn-syrup.csclub.uwaterloo.ca. [129.97.134.129])
	by mx.google.com with ESMTPSA id ug2sm9023989pac.21.2013.12.13.11.26.51
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 13 Dec 2013 11:26:51 -0800 (PST)
From: Muhammad Tauqir Ahmad <mian.muhammad.tauqir.ahmad@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 Dec 2013 14:25:57 -0500
Message-Id: <1386962757-54872-1-git-send-email-mian.muhammad.tauqir.ahmad@gmail.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] busybox: get rid of nested functions in find
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
X-List-Received-Date: Fri, 13 Dec 2013 19:26:54 -0000

This allows us to compile busybox using clang. Nested functions is
a gcc extension not supported by clang.
---
 .../busybox/find-get-rid-of-nested-functions.patch |  117 ++++++++++++++++++++
 meta/recipes-core/busybox/busybox_1.21.1.bb        |    1 +
 2 files changed, 118 insertions(+)
 create mode 100644 meta/recipes-core/busybox/busybox/find-get-rid-of-nested-functions.patch

diff --git a/meta/recipes-core/busybox/busybox/find-get-rid-of-nested-functions.patch b/meta/recipes-core/busybox/busybox/find-get-rid-of-nested-functions.patch
new file mode 100644
index 0000000..d66ef79
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox/find-get-rid-of-nested-functions.patch
@@ -0,0 +1,117 @@
+Upstream-Status: Accepted
+
+commit 6db5f679a21342249e6a6eb06ec70a337bf0d0b0
+Author: Denys Vlasenko <vda.linux@googlemail.com>
+Date:   Thu May 16 18:36:42 2013 +0200
+
+find:: get rid of nested function (it's a gcc-ism)
+
+function                                             old     new   delta
+alloc_action                                           -      80     +80
+parse_params                                        1459    1445     -14
+static.alloc_action                                   98       -     -98
+
+(add/remove: 1/1 grow/shrink: 0/1 up/down: 80/-112)           Total: -32 bytes
+
+Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
+
+diff --git a/findutils/find.c b/findutils/find.c
+index d4b7c8e..af913cc 100644
+--- a/findutils/find.c
++++ b/findutils/find.c
+@@ -815,6 +815,31 @@ static const char* plus_minus_num(const char* str)
+ }
+ #endif
+ 
++/* Say no to GCCism */
++#define USE_NESTED_FUNCTION 0
++
++#if !USE_NESTED_FUNCTION
++struct pp_locals {
++	action*** appp;
++	unsigned cur_group;
++	unsigned cur_action;
++	IF_FEATURE_FIND_NOT( bool invert_flag; )
++};
++static action* alloc_action(struct pp_locals *ppl, int sizeof_struct, action_fp f)
++{
++	action *ap = xzalloc(sizeof_struct);
++	action **app;
++	action ***group = &ppl->appp[ppl->cur_group];
++	*group = app = xrealloc(*group, (ppl->cur_action+2) * sizeof(ppl->appp[0][0]));
++	app[ppl->cur_action++] = ap;
++	app[ppl->cur_action] = NULL;
++	ap->f = f;
++	IF_FEATURE_FIND_NOT( ap->invert = ppl->invert_flag; )
++	IF_FEATURE_FIND_NOT( ppl->invert_flag = 0; )
++	return ap;
++}
++#endif
++
+ static action*** parse_params(char **argv)
+ {
+ 	enum {
+@@ -901,10 +926,18 @@ static action*** parse_params(char **argv)
+ 	IF_FEATURE_FIND_MAXDEPTH("-mindepth\0""-maxdepth\0")
+ 	;
+ 
++#if !USE_NESTED_FUNCTION
++	struct pp_locals ppl;
++#define appp        (ppl.appp       )
++#define cur_group   (ppl.cur_group  )
++#define cur_action  (ppl.cur_action )
++#define invert_flag (ppl.invert_flag)
++#define ALLOC_ACTION(name) (action_##name*)alloc_action(&ppl, sizeof(action_##name), (action_fp) func_##name)
++#else
+ 	action*** appp;
+-	unsigned cur_group = 0;
+-	unsigned cur_action = 0;
+-	IF_FEATURE_FIND_NOT( bool invert_flag = 0; )
++	unsigned cur_group;
++	unsigned cur_action;
++	IF_FEATURE_FIND_NOT( bool invert_flag; )
+ 
+ 	/* This is the only place in busybox where we use nested function.
+ 	 * So far more standard alternatives were bigger. */
+@@ -913,7 +946,7 @@ static action*** parse_params(char **argv)
+ 	action* alloc_action(int sizeof_struct, action_fp f)
+ 	{
+ 		action *ap;
+-		appp[cur_group] = xrealloc(appp[cur_group], (cur_action+2) * sizeof(*appp));
++		appp[cur_group] = xrealloc(appp[cur_group], (cur_action+2) * sizeof(appp[0][0]));
+ 		appp[cur_group][cur_action++] = ap = xzalloc(sizeof_struct);
+ 		appp[cur_group][cur_action] = NULL;
+ 		ap->f = f;
+@@ -921,9 +954,12 @@ static action*** parse_params(char **argv)
+ 		IF_FEATURE_FIND_NOT( invert_flag = 0; )
+ 		return ap;
+ 	}
+-
+ #define ALLOC_ACTION(name) (action_##name*)alloc_action(sizeof(action_##name), (action_fp) func_##name)
++#endif
+ 
++	cur_group = 0;
++	cur_action = 0;
++	IF_FEATURE_FIND_NOT( invert_flag = 0; )
+ 	appp = xzalloc(2 * sizeof(appp[0])); /* appp[0],[1] == NULL */
+ 
+ 	while (*argv) {
+@@ -988,7 +1024,7 @@ static action*** parse_params(char **argv)
+ 			dbg("%d", __LINE__);
+ 			/* start new OR group */
+ 			cur_group++;
+-			appp = xrealloc(appp, (cur_group+2) * sizeof(*appp));
++			appp = xrealloc(appp, (cur_group+2) * sizeof(appp[0]));
+ 			/*appp[cur_group] = NULL; - already NULL */
+ 			appp[cur_group+1] = NULL;
+ 			cur_action = 0;
+@@ -1246,6 +1282,9 @@ static action*** parse_params(char **argv)
+ 	dbg("exiting %s", __func__);
+ 	return appp;
+ #undef ALLOC_ACTION
++#undef appp
++#undef cur_action
++#undef invert_flag
+ }
+ 
+ int find_main(int argc, char **argv) MAIN_EXTERNALLY_VISIBLE;
diff --git a/meta/recipes-core/busybox/busybox_1.21.1.bb b/meta/recipes-core/busybox/busybox_1.21.1.bb
index 8b91e63..267604a 100644
--- a/meta/recipes-core/busybox/busybox_1.21.1.bb
+++ b/meta/recipes-core/busybox/busybox_1.21.1.bb
@@ -34,6 +34,7 @@ SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://login-utilities.cfg \
            file://busybox-list-suid-and-non-suid-app-configs.patch \
            file://busybox-sed-fix-sed-clusternewline-testcase.patch \
+           file://find-get-rid-of-nested-functions.patch \
 "
 
 SRC_URI[tarball.md5sum] = "795394f83903b5eec6567d51eebb417e"
-- 
1.7.10.4


