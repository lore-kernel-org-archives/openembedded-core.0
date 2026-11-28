Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7047.1795874066249245927
 for <openembedded-core@lists.openembedded.org>;
 Sat, 28 Nov 2026 05:54:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=kb82ymNP;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-256628-202611281354221143664ee2000207d8-tvx6rf@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 202611281354221143664ee2000207d8
        for <openembedded-core@lists.openembedded.org>;
        Sat, 28 Nov 2026 14:54:22 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=464JYwaTrLzvI0rEJheDbj1xp4aJ6DEss0DFThI3c0c=;
 b=kb82ymNPigXwRbyz6H+zDx9YyBiE+gmCzX2AowQEVqckV3kE/1Mi7rot0DX7e65PSHQdQp
 cKpNn0csF/7M59fnEyNQTsuPO8EXbQvW1TiMQJDDpKe2xeKKOjmfB/9E+vLan7PX9Fjpg5tz
 sdIVBQnbJWkNNy0i8cgoruxVP8p8AWYyfam9RL4QPIPqDxFKmfHl399tY42rvz4Pf6J3Jxjz
 4q7SnP3vIR3GMER3FIN2OckZv4acRb0t3QqUFEbDXNbkosp2ugGXzZUHKnVtkau3KBYxFSBQ
 qPJEwRQeyv0jj81Rtef3b+ww4sD5alQOs7KWRdqCGBkikd/5oYX6Z4HQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [PATCH] m4: patch CVE-2026-107189
Date: Sat, 28 Nov 2026 14:52:13 +0100
Message-ID: <20261128135215.1818322-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sat, 28 Nov 2026 13:54:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251497
Content-Type: text/plain; charset="utf-8"

From: Peter Marko <peter.marko@siemens.com>

Pick patch mentioned in CVE description.

There are two adaptations to the original patch.
1. add hunk with include statement, it is part of large refactoring
   and not worth to backport just to add a trivial line
2. add single line change of converting xcharalloc to ximalloc from
   commit [1]. This makes the final hunk have identical output as
   the original CVE patch. It is not worth to try to backport large
   refactoring which anyway also does not cleanly apply to release.

[1] https://github.com/autotools-mirror/m4/commit/92641ac2ce8694e75f202f1bd2e3d8c99ee0df55

AI-Generated: Uses GitHub Copilot

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-devtools/m4/m4-1.4.21.inc        |  1 +
 .../m4/m4/CVE-2026-107189.patch               | 82 +++++++++++++++++++
 2 files changed, 83 insertions(+)
 create mode 100644 meta/recipes-devtools/m4/m4/CVE-2026-107189.patch

diff --git a/meta/recipes-devtools/m4/m4-1.4.21.inc b/meta/recipes-devtools/m4/m4-1.4.21.inc
index 41f8021d025..bae193e9e01 100644
--- a/meta/recipes-devtools/m4/m4-1.4.21.inc
+++ b/meta/recipes-devtools/m4/m4-1.4.21.inc
@@ -7,6 +7,7 @@ GNU M4 also has built-in functions for including files, running shell commands,
 inherit autotools texinfo ptest gettext
 
 SRC_URI = "${GNU_MIRROR}/m4/m4-${PV}.tar.gz \
+           file://CVE-2026-107189.patch \
            "
 SRC_URI:append:class-target = " file://run-ptest \
                                 file://0001-test-c32ispunct-Check-for-musl-along-with-glibc.patch \
diff --git a/meta/recipes-devtools/m4/m4/CVE-2026-107189.patch b/meta/recipes-devtools/m4/m4/CVE-2026-107189.patch
new file mode 100644
index 00000000000..0964748bacf
--- /dev/null
+++ b/meta/recipes-devtools/m4/m4/CVE-2026-107189.patch
@@ -0,0 +1,82 @@
+From 69aef802fb25ab600d37210f44e5128633cbc432 Mon Sep 17 00:00:00 2001
+From: Paul Eggert <eggert@cs.ucla.edu>
+Date: Tue, 7 Jul 2026 12:25:34 -0700
+Subject: [PATCH] m4: fix undefined behavior for frozen INT_MAX
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Problem reported by Michał Majchrowicz.
+* src/freeze.c (reload_frozen_state):
+Use idx_t, not int, to record allocation sizes.
+(GET_STRING): Avoid undefined behavior if a frozen-state file
+has a string of length INT_MAX.
+
+CVE: CVE-2026-107189
+Upstream-Status: Backport [https://cgit.git.savannah.gnu.org/cgit/m4.git/commit/?id=69aef802fb25ab600d37210f44e5128633cbc432]
+
+There are two adaptations to the original patch.
+1. add hunk with include statement, it is part of large refactoring
+   and not worth to backport just to add a trivial line
+2. add single line change of converting xcharalloc to ximalloc from
+   commit [1]. This makes the final hunk have identical output as
+   the original CVE patch. It is not worth to try to backport large
+   refactoring which anyway also does not cleanly apply to release.
+[1] https://github.com/autotools-mirror/m4/commit/92641ac2ce8694e75f202f1bd2e3d8c99ee0df55
+
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ THANKS       |  1 +
+ src/freeze.c | 11 +++++++----
+ 2 files changed, 8 insertions(+), 4 deletions(-)
+
+diff --git a/THANKS b/THANKS
+index 3802f8b9..75f160b4 100644
+--- a/THANKS
++++ b/THANKS
+@@ -90,6 +90,7 @@ Matthias Rabe                rabe@mathematik.uni-bielefeld.de
+ Michael Fetterman            mafetter@ichips.intel.com
+ Michael L. Welcome           welcome@bigbird.llnl.gov
+ Michael Witten               mfwitten@gmail.com
++Michał Majchrowicz           mmajchrowicz@afine.com
+ Mike Dupont                  jamesmikedupont@googlemail.com
+ Mike Frysinger               vapier@gentoo.org
+ Mike Lijewski                lijewski@theory.tc.cornell.edu
+diff --git a/src/freeze.c b/src/freeze.c
+index 34f0e057..1bae4c00 100644
+--- a/src/freeze.c
++++ b/src/freeze.c
+@@ -23,6 +23,8 @@
+ 
+ #include "m4.h"
+ 
++#include <stdckdint.h>
++
+ /*-------------------------------------------------------------------.
+ | Destructively reverse a symbol list and return the reversed list.  |
+ `-------------------------------------------------------------------*/
+@@ -183,7 +185,7 @@ reload_frozen_state (const char *name)
+   int character;
+   int operation;
+   char *string[2];
+-  int allocated[2];
++  idx_t allocated[2];
+   int number[2];
+   const builtin *bp;
+   bool advance_line = true;
+@@ -247,11 +249,12 @@ reload_frozen_state (const char *name)
+     {                                                                   \
+       void *tmp;                                                        \
+       char *p;                                                          \
+-      if (number[(i)] + 1 > allocated[(i)])                             \
++      if (allocated[(i)] <= number[(i)])                                \
+         {                                                               \
+           free (string[(i)]);                                           \
+-          allocated[(i)] = number[(i)] + 1;                             \
+-          string[(i)] = xcharalloc ((size_t) allocated[(i)]);           \
++          if (ckd_add (&allocated[(i)], number[(i)], 1))                \
++            xalloc_die ();                                              \
++          string[(i)] = ximalloc (allocated[(i)]);                      \
+         }                                                               \
+       if (number[(i)] > 0                                               \
+           && !fread (string[(i)], (size_t) number[(i)], 1, file))       \
