Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3140671AE4
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Feb 2017 06:30:53 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v186UrkB025486
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 7 Feb 2017 22:30:53 -0800
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.201) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.294.0; Tue, 7 Feb 2017 22:30:52 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 8 Feb 2017 14:30:51 +0800
Message-ID: <cce8e3957093a1a8170f5a0d2ec32caa5d7fe047.1486535388.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1486535388.git.Qi.Chen@windriver.com>
References: <cover.1486535388.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] console-tools: fix string formatting issue
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
X-List-Received-Date: Wed, 08 Feb 2017 06:30:54 -0000
Content-Type: text/plain

Fix string formatting issue in console-tools. Otherwise, when compiling with
'-Wformat -Wformat-security -Werror=format-security', we would have compilation
error.

[YOCTO #9540]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 ...001-Fix-format-security-compilation-error.patch | 57 ++++++++++++++++++++++
 .../console-tools/console-tools_0.3.2.bb           |  1 +
 2 files changed, 58 insertions(+)
 create mode 100644 meta/recipes-core/console-tools/console-tools-0.3.2/0001-Fix-format-security-compilation-error.patch

diff --git a/meta/recipes-core/console-tools/console-tools-0.3.2/0001-Fix-format-security-compilation-error.patch b/meta/recipes-core/console-tools/console-tools-0.3.2/0001-Fix-format-security-compilation-error.patch
new file mode 100644
index 0000000..a283302
--- /dev/null
+++ b/meta/recipes-core/console-tools/console-tools-0.3.2/0001-Fix-format-security-compilation-error.patch
@@ -0,0 +1,57 @@
+Subject: Fix 'format-security' compilation error.
+
+Upstream-Status: pending
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ kbdtools/kbd_mode.c    | 6 +++---
+ kbdtools/setmetamode.c | 2 +-
+ 2 files changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/kbdtools/kbd_mode.c b/kbdtools/kbd_mode.c
+index 02dca38..8dbcd39 100644
+--- a/kbdtools/kbd_mode.c
++++ b/kbdtools/kbd_mode.c
+@@ -120,7 +120,7 @@ int main(int argc, char *argv[])
+       /* report mode */
+       if (ioctl(fd, KDGKBMODE, &mode)) 
+ 	{
+-	  fprintf(stderr, progname);
++	  fprintf(stderr, "%s", progname);
+ 	  perror(_(": error reading keyboard mode\n"));
+ 	  exit(1);
+ 	}
+@@ -151,7 +151,7 @@ int main(int argc, char *argv[])
+     kbd_rep.period = rate;
+     if (ioctl(fd, KDKBDREP, &kbd_rep))
+       {
+-	fprintf(stderr, progname);
++	fprintf(stderr, "%s", progname);
+ 	perror(_(": error setting keyboard repeat mode\n"));
+ 	exit(1);
+       }
+@@ -160,7 +160,7 @@ int main(int argc, char *argv[])
+   
+   if (ioctl(fd, KDSKBMODE, mode))
+     {
+-      fprintf(stderr, progname);
++      fprintf(stderr, "%s", progname);
+       perror(_(": error setting keyboard mode\n"));
+       exit(1);
+     }
+diff --git a/kbdtools/setmetamode.c b/kbdtools/setmetamode.c
+index 5bed945..0ba7676 100644
+--- a/kbdtools/setmetamode.c
++++ b/kbdtools/setmetamode.c
+@@ -42,7 +42,7 @@ void report(int meta)
+     default:
+       s = N_("Strange mode for Meta key?\n");
+     }
+-  printf(_(s));
++  printf("%s", _(s));
+ }
+ 
+ struct meta 
+-- 
+2.8.3
+
diff --git a/meta/recipes-core/console-tools/console-tools_0.3.2.bb b/meta/recipes-core/console-tools/console-tools_0.3.2.bb
index 1db8414..286c2a4 100644
--- a/meta/recipes-core/console-tools/console-tools_0.3.2.bb
+++ b/meta/recipes-core/console-tools/console-tools_0.3.2.bb
@@ -16,6 +16,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/lct/console-tools-${PV}.tar.gz \
            file://no-dep-on-libfl.patch \
            file://0001-kbdtools-Include-sys-types.h-for-u_char-and-u_short-.patch \
            file://0001-Cover-the-else-with-__GLIBC__.patch \
+           file://0001-Fix-format-security-compilation-error.patch \
            file://lcmessage.m4 \
            file://Makevars"
 
-- 
1.9.1


