Received: from mail-pa0-f53.google.com ([209.85.220.53])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@bigsur.com>) id 1Tsi5M-0004lA-5e
	for openembedded-core@lists.openembedded.org;
	Tue, 08 Jan 2013 23:55:57 +0100
Received: by mail-pa0-f53.google.com with SMTP id hz1so609824pad.26
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Jan 2013 14:40:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bigsur.com; s=bigsur.com;
	h=x-received:sender:from:to:subject:date:message-id:x-mailer;
	bh=/Ecr3RK9Rw+6mIahOFq3NPzmKHVwPiE8a5SQ6zx5SXY=;
	b=czssezzjcYF1oqJnE0xxPB+a2br4GprAAozHnwFG/R1j7lqcaOddBZPNRVDGt4k2qi
	aF8GBt4FxF6ZU+T2xn8kG10lqHjGtQgY5+UUz1ksJxVNbPXkv6F9p87EUFyfJw2GBvTj
	wyCt58rq+HDwJcd6AYXLEkXwV8gs6D7hodcu8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:sender:from:to:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=/Ecr3RK9Rw+6mIahOFq3NPzmKHVwPiE8a5SQ6zx5SXY=;
	b=jpEG3R2sjs4Y7yPG1Q3K6Lzit/TRm3cS5KdmIKxX+/93F9sZm5P3UFOcUZmUOB/XqH
	oFKj057LHjFFo7f9o49zsJOmii4MNO0vo0yUFkaq+ISRrwD1qYSKkpKVFZM0NK4qMBbJ
	sM7oBVz0/Ez8tiSvQt2zSyA5yZgtgSHBKrUQFU9vURdFBcoKdKBE2orvsoZ3RE0fqSvC
	iKgqvgDRm97rsAl03Li1UvuyJagkUSYXucEPIyUzOa9YPgW8lM/jkDHdVP8fg27Ewriv
	fQ83tPRVrSfrVbHf/LIulN5+UhoYw8ZbbdCFElh0fnjzoXtQ2z8c9yHyvwkA+u7YbF1h
	p2Iw==
X-Received: by 10.68.242.41 with SMTP id wn9mr58655115pbc.142.1357684844353;
	Tue, 08 Jan 2013 14:40:44 -0800 (PST)
Received: from localhost (c-71-193-189-117.hsd1.wa.comcast.net.
	[71.193.189.117]) by mx.google.com with ESMTPS id
	mt15sm40331047pbc.49.2013.01.08.14.40.42
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 08 Jan 2013 14:40:42 -0800 (PST)
Sender: Saul Wold <sgw@bigsur.com>
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Jan 2013 14:39:50 -0800
Message-Id: <1357684790-1477-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
X-Gm-Message-State: ALoCoQl4NY/9HoxnCqjyHSv69CIn7zqBVgdIrTNzI6Spt7gSWP87wBGg+NZbY6IHzlY07MrgmJjd
Subject: [PATCH] bash: fix mkbuiltins build failure
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 08 Jan 2013 22:56:01 -0000

Same patch for non-gplv3 version:

http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=1fd9a16d2a4594a4e9179dc7353ac51ce32eb712

[YOCTO #3646]

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../bash-3.2.48/mkbuiltins_have_stringize.patch    |   29 ++++++++++++++++++++
 meta/recipes-extended/bash/bash_3.2.48.bb          |    4 ++-
 2 files changed, 32 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/bash/bash-3.2.48/mkbuiltins_have_stringize.patch

diff --git a/meta/recipes-extended/bash/bash-3.2.48/mkbuiltins_have_stringize.patch b/meta/recipes-extended/bash/bash-3.2.48/mkbuiltins_have_stringize.patch
new file mode 100644
index 0000000..c4229a7
--- /dev/null
+++ b/meta/recipes-extended/bash/bash-3.2.48/mkbuiltins_have_stringize.patch
@@ -0,0 +1,29 @@
+On hosts with FORTIFY_SOURCES, stringize support is required, as it's used by
+the macros to wrap functions (e.g. read and open in unistd.h). Those wrappers
+use the STRING() macro from unistd.h. A header in the bash sources overrides
+the unistd.h macro to 'x' when HAVE_STRINGIZE is not defined, causing the
+wrappers to generate calls to 'xread' and 'xopen', which do not exist,
+resulting in a failure to link.
+
+Assume we have stringize support when cross-compiling, which works around the
+issue.
+
+It may be best for upstream to either give up on supporting compilers without
+stringize support, or to not define STRING() at all when FORTIFY_SOURCES is
+defined, letting the unistd.h one be used, instead.
+
+Upstream-Status: Pending
+
+Signed-off-by: Christopher Larson <chris_larson@mentor.com>
+Signed-off-by: Saul Wold <sgw@linux.intel.com>
+
+--- bash-4.2.orig/builtins/mkbuiltins.c
++++ bash-4.2/builtins/mkbuiltins.c
+@@ -28,6 +28,7 @@
+ #  define HAVE_STDLIB_H
+
+ #  define HAVE_RENAME
++#  define HAVE_STRINGIZE
+ #endif /* CROSS_COMPILING */
+
+ #if defined (HAVE_UNISTD_H)
diff --git a/meta/recipes-extended/bash/bash_3.2.48.bb b/meta/recipes-extended/bash/bash_3.2.48.bb
index 828d629..4e6f0f3 100644
--- a/meta/recipes-extended/bash/bash_3.2.48.bb
+++ b/meta/recipes-extended/bash/bash_3.2.48.bb
@@ -8,7 +8,9 @@ PR = "r11"
 SRC_URI = "${GNU_MIRROR}/bash/bash-${PV}.tar.gz;name=tarball \
            ${GNU_MIRROR}/bash/bash-3.2-patches/bash32-049;apply=yes;striplevel=0;name=patch001 \
            ${GNU_MIRROR}/bash/bash-3.2-patches/bash32-050;apply=yes;striplevel=0;name=patch002 \
-           ${GNU_MIRROR}/bash/bash-3.2-patches/bash32-051;apply=yes;striplevel=0;name=patch003"
+           ${GNU_MIRROR}/bash/bash-3.2-patches/bash32-051;apply=yes;striplevel=0;name=patch003 \
+           file://mkbuiltins_have_stringize.patch \
+          "
 
 SRC_URI[tarball.md5sum] = "338dcf975a93640bb3eaa843ca42e3f8"
 SRC_URI[tarball.sha256sum] = "128d281bd5682ba5f6953122915da71976357d7a76490d266c9173b1d0426348"
-- 
1.7.9.5



