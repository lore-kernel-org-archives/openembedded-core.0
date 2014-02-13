Return-Path: <joaohf@gmail.com>
Received: from mail-yh0-f52.google.com (mail-yh0-f52.google.com
	[209.85.213.52])
	by mail.openembedded.org (Postfix) with ESMTP id F3BEE6EA4B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Feb 2014 00:21:00 +0000 (UTC)
Received: by mail-yh0-f52.google.com with SMTP id a41so9308382yho.39
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Feb 2014 16:21:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=2297guEPeehkgkZl/HeRv5pwCxffCc/DPCorqrMOL6g=;
	b=H6k7HHUWE5zIx4+ZryCQon3VzEz6iV5DSDSDcb7oG+YbYfd0QFESHW0rP0XfskVKdu
	ZRczcldRdjcO5+zEAEk8QGTPs3bOfFZSGA/rYZpVotvDSUTnLzxuVsm4sGrVqb0x4+WR
	dmNSW47E55ECdqxprIBXHIh0taZQ1g04Nn/w/v9jT0w52NS0ByLgvAP0hqx45vskWCqb
	Ilk5IXYXnbJBNEjzZzLgCz4RDAqrOrE8XkjEAPJaWCEV/Cgpzwjb+7T1Xh0TFyYxII/P
	kH25EixW0v0HH8KhQqo1eCjrPMncFZ+dwV+pdRKAQWhJcqMM0n/i2LQ66KK4MXc2jFEr
	3oHg==
X-Received: by 10.236.128.111 with SMTP id e75mr4943965yhi.70.1392250861847;
	Wed, 12 Feb 2014 16:21:01 -0800 (PST)
Received: from localhost.localdomain ([201.53.197.242])
	by mx.google.com with ESMTPSA id a67sm162469yhj.10.2014.02.12.16.20.59
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 12 Feb 2014 16:21:01 -0800 (PST)
From: =?UTF-8?q?Jo=C3=A3o=20Henrique=20Ferreira=20de=20Freitas?=
	<joaohf@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 12 Feb 2014 22:20:19 -0200
Message-Id: <1392250819-10123-3-git-send-email-joaohf@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <1392250819-10123-1-git-send-email-joaohf@gmail.com>
References: <1392250819-10123-1-git-send-email-joaohf@gmail.com>
MIME-Version: 1.0
Cc: dvhart@linux.intel.com
Subject: [PATCH 2/2] cml1.bbclass: Add fragmentconfig task to cml1
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
X-List-Received-Date: Thu, 13 Feb 2014 00:21:01 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

fragmentconfig() is a new task that makes a diff between the
old and new config files and writes to the fragment.cfg result file.
menuconfig() always copy the original config file, so the user
doesn't need to copy it.

Signed-off-by: João Henrique Ferreira de Freitas <joaohf@gmail.com>
---
 meta/classes/cml1.bbclass | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/meta/classes/cml1.bbclass b/meta/classes/cml1.bbclass
index e292ecb..2053361 100644
--- a/meta/classes/cml1.bbclass
+++ b/meta/classes/cml1.bbclass
@@ -16,8 +16,12 @@ HOST_LOADLIBES = "-lncurses"
 TERMINFO = "${STAGING_DATADIR_NATIVE}/terminfo"
 
 python do_menuconfig() {
+    import os
+    import shutil
+
     try:
         mtime = os.path.getmtime(".config")
+        shutil.copy(".config", ".config.orig")
     except OSError:
         mtime = 0
 
@@ -38,3 +42,34 @@ do_menuconfig[depends] += "ncurses-native:do_populate_sysroot"
 do_menuconfig[nostamp] = "1"
 addtask menuconfig after do_configure
 
+python do_fragmentconfig() {
+    import shutil
+    import subprocess
+
+    workdir = d.getVar('WORKDIR', True)
+    fragment = workdir + '/fragment.cfg'
+    configorig = '.config.orig'
+    config = '.config'
+
+    try:
+        md5newconfig = bb.utils.md5_file(configorig)
+        md5config = bb.utils.md5_file(config)
+        isdiff = md5newconfig != md5config
+    except OSError:
+        isdiff = 0
+
+    if isdiff:
+        bb.note("Dumping config fragment into: '%s'." % fragment)
+        bb.note("new '%s' old '%s'" % (md5newconfig,md5config))
+
+        statement = 'diff -Nurp ' + configorig + ' ' + config + '| sed -n "s/^\+//p" >' + fragment
+        subprocess.call(statement, shell=True)
+
+        shutil.copy(configorig, config)
+    else:
+        if os.path.exists(fragment):
+            os.unlink(fragment)
+}
+
+do_fragmentconfig[nostamp] = "1"
+addtask fragmentconfig
-- 
1.8.3.2


