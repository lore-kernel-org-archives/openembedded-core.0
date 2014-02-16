Return-Path: <joaohf@gmail.com>
Received: from mail-yh0-f46.google.com (mail-yh0-f46.google.com
	[209.85.213.46])
	by mail.openembedded.org (Postfix) with ESMTP id 01CBA6F08F
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Feb 2014 21:41:29 +0000 (UTC)
Received: by mail-yh0-f46.google.com with SMTP id v1so13532344yhn.33
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Feb 2014 13:41:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=u93v5DxA2WjiJI+jwJwgIB1+lZe7hV0n9mLmvPCaJI0=;
	b=Zki/PAdkmWX4RvcEN2pQd8ZDkjee5bqDETYghgcZy+ZrqL8jQRIJPSjE09DCf/YYbv
	vxqanMaAXGXhvQHDZk/vhhGwtkOvbqF5t7WQlR1RM6D5KLGQes+wihMAgORrcEahTzRU
	D6C8vsDRqBvlw6oiTHM4e9aCnSLSYpcMxgSaC0g+M3IOqR+Lvz9lszadem+FN1dBXLYE
	GtFUUt0JwaCOHlQmJXSVF+2Rx2mJDvvaMntnhbTqXclNqGjulv0urrk/WYgBbBXSATy6
	z/ST/OSfuObXEKsFvFM8XSdgvayKqsMGADqV7XxOGtZ+ohanEbW8Rbu60yKnsTDjZOFB
	4ofw==
X-Received: by 10.236.130.138 with SMTP id k10mr18220072yhi.31.1392586891016; 
	Sun, 16 Feb 2014 13:41:31 -0800 (PST)
Received: from localhost.localdomain ([201.53.197.242])
	by mx.google.com with ESMTPSA id n6sm41989930yha.20.2014.02.16.13.41.29
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 16 Feb 2014 13:41:30 -0800 (PST)
From: =?UTF-8?q?Jo=C3=A3o=20Henrique=20Ferreira=20de=20Freitas?=
	<joaohf@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 16 Feb 2014 18:40:58 -0300
Message-Id: <1392586858-12205-3-git-send-email-joaohf@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <1392586858-12205-1-git-send-email-joaohf@gmail.com>
References: <1392586858-12205-1-git-send-email-joaohf@gmail.com>
MIME-Version: 1.0
Cc: dvhart@linux.intel.com
Subject: [PATCH v2 2/2] cml1.bbclass: Add diffconfig task to cml1
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
X-List-Received-Date: Sun, 16 Feb 2014 21:41:30 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

diffconfig() is a new task that makes a diff between the
old and new config files and writes to the fragment.cfg result file.
menuconfig() always copy the original config file, so the user
doesn't need to copy it.

Signed-off-by: João Henrique Ferreira de Freitas <joaohf@gmail.com>
---
 meta/classes/cml1.bbclass | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/meta/classes/cml1.bbclass b/meta/classes/cml1.bbclass
index e292ecb..34c0c4e 100644
--- a/meta/classes/cml1.bbclass
+++ b/meta/classes/cml1.bbclass
@@ -16,8 +16,11 @@ HOST_LOADLIBES = "-lncurses"
 TERMINFO = "${STAGING_DATADIR_NATIVE}/terminfo"
 
 python do_menuconfig() {
+    import shutil
+
     try:
         mtime = os.path.getmtime(".config")
+        shutil.copy(".config", ".config.orig")
     except OSError:
         mtime = 0
 
@@ -38,3 +41,33 @@ do_menuconfig[depends] += "ncurses-native:do_populate_sysroot"
 do_menuconfig[nostamp] = "1"
 addtask menuconfig after do_configure
 
+python do_diffconfig() {
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
+    except IOError as e:
+        bb.fatal("No config files found. Did you do menuconfig ?\n%s" % e)
+
+    if isdiff:
+        statement = 'diff -Nurp ' + configorig + ' ' + config + '| sed -n "s/^\+//p" >' + fragment
+        subprocess.call(statement, shell=True)
+
+        shutil.copy(configorig, config)
+
+        bb.plain("Config fragment has been dumped into:\n %s" % fragment)
+    else:
+        if os.path.exists(fragment):
+            os.unlink(fragment)
+}
+
+do_diffconfig[nostamp] = "1"
+addtask diffconfig
-- 
1.8.3.2


