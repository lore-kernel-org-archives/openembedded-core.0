Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qc0-f181.google.com (mail-qc0-f181.google.com
	[209.85.216.181])
	by mail.openembedded.org (Postfix) with ESMTP id 332A660EEA
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Sep 2013 01:38:06 +0000 (UTC)
Received: by mail-qc0-f181.google.com with SMTP id q4so2374176qcx.12
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Sep 2013 18:38:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:organization;
	bh=hv9daj4tZa5ncZdk2glECqhezGhgyLTZhLwXAMyGm34=;
	b=tnZKVruKec/zeXesEDfMgiEZpCB724i2elAGtE6tPzcy6fjvX8aanQCUJcXjH8Zpj4
	XW02Tw3Cqn19SWSJaO+QvJP4uLnV2DCzmb1YDsoxMLaxFaw7/TJ55aLh3CGDh2vQSBXR
	pebKkB7nv+a9c+BY2gyGHD1x9x8wM9wzOBilraSxoDFKQNJcQ5/M6ZMKCmcOFALvP7OO
	QMMSoXKOtF9L3tc9deoczKlQbKbYWvC/jMKHTexZ6mKiNCaKgQ2LuMeXXt0HjWHDqtkD
	fQ2XbVCe+KPRx433KjicSevOGsvLrYQ4Bke+eivuZ6adzgvEEmaSTQog52xaaWxsvC/o
	u2Ug==
X-Received: by 10.224.8.7 with SMTP id f7mr11786864qaf.17.1379295487935;
	Sun, 15 Sep 2013 18:38:07 -0700 (PDT)
Received: from nano.lab.ossystems.com.br ([177.194.209.11])
	by mx.google.com with ESMTPSA id e7sm18373158qag.7.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 15 Sep 2013 18:38:07 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Sun, 15 Sep 2013 22:37:50 -0300
Message-Id: <1379295470-3444-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.8.4.rc3
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH] perf: Remove CFLAGS and LDFLAGS override
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
X-List-Received-Date: Mon, 16 Sep 2013 01:38:06 -0000

The kernel build system does the right thing here and we should stop
overriding it. This code has been added based on a change from
'meta-metro' layer, revision 9d698004137c1a888d40d6a4808d94afa22387e7,
without any information about what problem it fixes so I am reverting
it.

Using the CFLAGS makes it impossible for kernel build system to append
to it, thus making the build fail in various ways as:

|     CC /.../perf/1.0-r8/perf-1.0/perf.o
| In file included from builtin.h:4:0,
|                  from perf.c:9:
| util/util.h:74:24: fatal error: lk/debugfs.h: No such file or directory
|  #include <lk/debugfs.h>
|                         ^
| compilation terminated.

Cc: Christopher Larson <kergoth@gmail.com>
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/recipes-kernel/perf/perf.bb | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index d2c1048..8d35fc6 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -72,13 +72,7 @@ EXTRA_OEMAKE = \
 		NO_GTK2=1 ${TUI_DEFINES} NO_DWARF=1 ${SCRIPTING_DEFINES} \
 		'
 
-# We already pass the correct arguments to our compiler for the CFLAGS (if we
-# don't override it, it'll add -m32/-m64 itself). For LDFLAGS, it was failing
-# to find bfd symbols.
 EXTRA_OEMAKE += "\
-	'CFLAGS=${CFLAGS} -fPIC' \
-	'LDFLAGS=${LDFLAGS} -lpthread -lrt -lelf -lm -lbfd' \
-	\
 	'prefix=${prefix}' \
 	'bindir=${bindir}' \
 	'sharedir=${datadir}' \
-- 
1.8.4.rc3


