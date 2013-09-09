Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 37F17615C4
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Sep 2013 10:10:45 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r89AAkpO017800
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 9 Sep 2013 03:10:47 -0700 (PDT)
Received: from pek-cc-pb05l.wrs.com (128.224.157.65) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Mon, 9 Sep 2013 03:10:46 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 9 Sep 2013 18:10:44 +0800
Message-ID: <1378721444-22545-1-git-send-email-jackie.huang@windriver.com>
X-Mailer: git-send-email 1.7.4.1
MIME-Version: 1.0
Subject: [PATCH] pulseaudio: avoid gcc ICE by omitting code TEMPORARILY
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
X-List-Received-Date: Mon, 09 Sep 2013 10:10:45 -0000
Content-Type: text/plain

From: Randy MacLeod <Randy.MacLeod@windriver.com>

It's a FYI patch for anyone who might be having the same problem.

pulseaudio-4.0 causes an internal compiler error. Temporarily
avoid the build error be omitting the code that makes the
compiler fail until the compiler ICE is addressed.

The error is:
pulsecore/sink.c: In function 'pa_sink_process_msg':
pulsecore/sink.c:3822:1: internal compiler error: in fold_binary_loc, at fold-const.c:9871
 }
  ^

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
---
 ...void-gcc-ICE-drop-useful-code-TEMPORARILY.patch |   55 ++++++++++++++++++++
 .../pulseaudio/pulseaudio_4.0.bb                   |    4 +-
 2 files changed, 58 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio/0001-Avoid-gcc-ICE-drop-useful-code-TEMPORARILY.patch

diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio/0001-Avoid-gcc-ICE-drop-useful-code-TEMPORARILY.patch b/meta/recipes-multimedia/pulseaudio/pulseaudio/0001-Avoid-gcc-ICE-drop-useful-code-TEMPORARILY.patch
new file mode 100644
index 0000000..d104da7
--- /dev/null
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio/0001-Avoid-gcc-ICE-drop-useful-code-TEMPORARILY.patch
@@ -0,0 +1,55 @@
+From 4eb3f53619a0c8542ab53dc7ba1d930c025e3046 Mon Sep 17 00:00:00 2001
+From: Randy MacLeod <Randy.MacLeod@windriver.com>
+Date: Sun, 8 Sep 2013 19:36:41 -0400
+Subject: [PATCH] Avoid gcc ICE: drop useful code - TEMPORARILY
+
+---
+ src/pulsecore/sink.c   | 7 ++++++-
+ src/pulsecore/source.c | 9 +++++++--
+ 2 files changed, 13 insertions(+), 3 deletions(-)
+
+diff --git a/src/pulsecore/sink.c b/src/pulsecore/sink.c
+index 9b4b066..233f69f 100644
+--- a/src/pulsecore/sink.c
++++ b/src/pulsecore/sink.c
+@@ -2768,7 +2768,12 @@ int pa_sink_process_msg(pa_msgobject *o, int code, void *userdata, int64_t offse
+         case PA_SINK_MESSAGE_SET_STATE: {
+ 
+             pa_bool_t suspend_change =
+-                (s->thread_info.state == PA_SINK_SUSPENDED && PA_SINK_IS_OPENED(PA_PTR_TO_UINT(userdata))) ||
++
++                (s->thread_info.state == PA_SINK_SUSPENDED 
++#if 0
++		&& PA_SINK_IS_OPENED(PA_PTR_TO_UINT(userdata))
++#endif
++		) ||
+                 (PA_SINK_IS_OPENED(s->thread_info.state) && PA_PTR_TO_UINT(userdata) == PA_SINK_SUSPENDED);
+ 
+             s->thread_info.state = PA_PTR_TO_UINT(userdata);
+diff --git a/src/pulsecore/source.c b/src/pulsecore/source.c
+index c6aa5e3..a6e684d 100644
+--- a/src/pulsecore/source.c
++++ b/src/pulsecore/source.c
+@@ -2100,8 +2100,12 @@ int pa_source_process_msg(pa_msgobject *object, int code, void *userdata, int64_
+         case PA_SOURCE_MESSAGE_SET_STATE: {
+ 
+             pa_bool_t suspend_change =
+-                (s->thread_info.state == PA_SOURCE_SUSPENDED && PA_SOURCE_IS_OPENED(PA_PTR_TO_UINT(userdata))) ||
+-                (PA_SOURCE_IS_OPENED(s->thread_info.state) && PA_PTR_TO_UINT(userdata) == PA_SOURCE_SUSPENDED);
++                ( s->thread_info.state == PA_SOURCE_SUSPENDED 
++#if 0
++		  && 
++		  PA_SOURCE_IS_OPENED(PA_PTR_TO_UINT(userdata))
++#endif
++		 ) || (PA_SOURCE_IS_OPENED(s->thread_info.state) && PA_PTR_TO_UINT(userdata) == PA_SOURCE_SUSPENDED);
+ 
+             s->thread_info.state = PA_PTR_TO_UINT(userdata);
+ 
+@@ -2857,3 +2861,4 @@ done:
+ 
+     return out_formats;
+ }
++
+-- 
+1.8.1
+
diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio_4.0.bb b/meta/recipes-multimedia/pulseaudio/pulseaudio_4.0.bb
index b419c54..156af02 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio_4.0.bb
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio_4.0.bb
@@ -1,7 +1,9 @@
 require pulseaudio.inc
 
 SRC_URI = "http://freedesktop.org/software/pulseaudio/releases/pulseaudio-${PV}.tar.xz \
-           file://volatiles.04_pulse"
+           file://volatiles.04_pulse \
+	   file://0001-Avoid-gcc-ICE-drop-useful-code-TEMPORARILY.patch \
+	   "
 
 SRC_URI[md5sum] = "591f211db2790a7e4d222f2dc6858db3"
 SRC_URI[sha256sum] = "35ceb36bb1822fe54f0b5e4863b4f486769fdfb8ff2111f01fd8778928f9cdae"
-- 
1.7.4.1


