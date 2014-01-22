Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D71E16E721
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jan 2014 02:39:41 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s0M2dgHR026082
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jan 2014 18:39:42 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.164) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Tue, 21 Jan 2014 18:39:42 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 22 Jan 2014 10:39:48 +0800
Message-ID: <1aaa9267168ec59579f3e4a362bfc29ed9de3ec8.1390358320.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1390358320.git.Qi.Chen@windriver.com>
References: <cover.1390358320.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/4] coreutils: move 'stat' to base_bindir_progs
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
X-List-Received-Date: Wed, 22 Jan 2014 02:39:42 -0000
Content-Type: text/plain

To correctly integrate with busybox in our system, we should add
'stat' to base_bindir_progs so that the 'stat' commands from busybox
and coreutils both register to /bin/stat.

Previously there was a patch in busybox to move 'stat' to /usr/bin.
But as we can easily solve this integration problem by modifying the
coreutils recipe, this patch has been removed. After all, maintaining
a patch that's not accepted by upsteam should not be our No.1 choice.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-core/coreutils/coreutils_6.9.bb  |    4 ++--
 meta/recipes-core/coreutils/coreutils_8.22.bb |    4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/coreutils/coreutils_6.9.bb b/meta/recipes-core/coreutils/coreutils_6.9.bb
index 6375041..5a16872 100644
--- a/meta/recipes-core/coreutils/coreutils_6.9.bb
+++ b/meta/recipes-core/coreutils/coreutils_6.9.bb
@@ -49,12 +49,12 @@ bindir_progs = "base64 basename cksum comm csplit cut dir dircolors dirname du \
                 env expand expr factor fmt fold groups head hostid id install \
                 join link logname md5sum mkfifo nice nl nohup od paste pathchk \
                 pinky pr printenv printf ptx readlink seq sha1sum sha224sum sha256sum \
-                sha384sum sha512sum shred shuf sort split stat sum tac tail tee test \
+                sha384sum sha512sum shred shuf sort split sum tac tail tee test \
                 tr tsort tty unexpand uniq unlink users vdir wc who whoami yes uptime"
 
 # hostname gets a special treatment and is not included in this
 base_bindir_progs = "cat chgrp chmod chown cp date dd echo false kill ln ls mkdir \
-                     mknod mv pwd rm rmdir sleep stty sync touch true uname hostname"
+                     mknod mv pwd rm rmdir sleep stty sync touch true uname hostname stat"
 
 sbindir_progs= "chroot"
 
diff --git a/meta/recipes-core/coreutils/coreutils_8.22.bb b/meta/recipes-core/coreutils/coreutils_8.22.bb
index 6b222b5..f88373f 100644
--- a/meta/recipes-core/coreutils/coreutils_8.22.bb
+++ b/meta/recipes-core/coreutils/coreutils_8.22.bb
@@ -38,12 +38,12 @@ bindir_progs = "arch basename chcon cksum comm csplit cut dir dircolors dirname
                 env expand expr factor fmt fold groups head hostid id install \
                 join link logname md5sum mkfifo nice nl nohup nproc od paste pathchk \
                 pinky pr printenv printf ptx readlink realpath runcon seq sha1sum sha224sum sha256sum \
-                sha384sum sha512sum shred shuf sort split stat stdbuf sum tac tail tee test timeout\
+                sha384sum sha512sum shred shuf sort split stdbuf sum tac tail tee test timeout\
                 tr truncate tsort tty unexpand uniq unlink uptime users vdir wc who whoami yes"
 
 # hostname gets a special treatment and is not included in this
 base_bindir_progs = "cat chgrp chmod chown cp date dd echo false kill ln ls mkdir \
-                     mknod mv pwd rm rmdir sleep stty sync touch true uname"
+                     mknod mv pwd rm rmdir sleep stty sync touch true uname stat"
 
 sbindir_progs= "chroot"
 
-- 
1.7.9.5


