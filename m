Return-Path: <armccurdy@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id D914B771F0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Sep 2016 23:01:00 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id x24so8682672pfa.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Sep 2016 16:01:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=6+jKVesUkgJhrlE5+xsnriDkUBgozp4vyE9mdL5c0eE=;
	b=ZzTbOM71IqgU8hrrz+ChF09/9S+xk9NJZNhGCre+xcl0ktvZJ4uKW0zcF+YtKslrCl
	sSVq5DB0lQ0SRYSlSSiMS78XKwiJ6OGzZcJyaL27NVR59lat53mQhX7JYRu+rjIvFhNp
	WDfcJwrx7gkiJXVYQtqJ0VHoPQGV1u5QwJTOLOFkrT9ix/2rLkPHDrYU0ZzOGEj2dU4p
	VW77fI7qjhlqJrNX6c1n8a+q5/wQSymsLliptrNyXdBBX6gi7hV7Xg6wWGqj19Zes1g6
	yx3+IX+sUFFFbzauIUGmECqloGm9Hw9Qn8smtyVLgXKmcOtBqeZF4rPU5GUsUyEyeLis
	Nwkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=6+jKVesUkgJhrlE5+xsnriDkUBgozp4vyE9mdL5c0eE=;
	b=F0ANdDf1PrEEan4nqUJvx6RgLEY0W4cnDOw1vKBxhj+TgM/crBlAoCNxUQwu7RWWNg
	5tIZJrCiLQ/6gwVJGhoLnoVMkt2Zzj+ad+8dIGYJ3im9Dy5qSJTQDmaBnbzUOPAjcuaM
	XgwDMLe4npWNPR5rBcmlEJ5DRpFcMLrqDMoDwkFiFbX9LOJHZ5WqxU6ODUUDfo2rxq34
	MUv/yPFrSUF/ufc5MVfCu2rwseYlMIwafOe4eqvSgSjhEeYxNpDSaQcUoCq+rLRmzaVO
	rzi0vkp/v72bBPpSurKPX1LaRzt0YC1xzN5YS+C9Yi7RoIpZVbaCqG5WoTetFiqPmmaF
	T2eQ==
X-Gm-Message-State: AE9vXwMpSuIzHAxuXYeGuFNPrzdqWyX6KOv/cWUDh7feL/Tntuqj9wwuCMJjDarMO9KeZw==
X-Received: by 10.98.58.195 with SMTP id v64mr35421438pfj.97.1473721261434;
	Mon, 12 Sep 2016 16:01:01 -0700 (PDT)
Received: from e6520.adbgroup.pl
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	c64sm26791078pfa.51.2016.09.12.16.01.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 12 Sep 2016 16:01:00 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 12 Sep 2016 16:00:54 -0700
Message-Id: <1473721254-9610-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] rootfs.py: support absolute paths in IMAGE_DEVICE_TABLES
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
X-List-Received-Date: Mon, 12 Sep 2016 23:01:02 -0000

Paths relative to BBPATH are fine if device table files are always
static and contained somewhere within a meta layer. However if device
tables are created dynamically, they will be located somewhere within
${TMPDIR} and most conveniently referenced via an absolute path.

The legacy IMAGE_DEVICE_TABLE variable supported an absolute path,
therefore make IMAGE_DEVICE_TABLES support absolute paths too, to
avoid users who need dynamic device table files being dependent on
the legacy variable.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/lib/oe/rootfs.py | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
index a348b97..32cce64 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -352,8 +352,8 @@ class Rootfs(object, metaclass=ABCMeta):
     """
     Create devfs:
     * IMAGE_DEVICE_TABLE is the old name to an absolute path to a device table file
-    * IMAGE_DEVICE_TABLES is a new name for a file, or list of files, seached
-      for in the BBPATH
+    * IMAGE_DEVICE_TABLES is the new name for a file, or list of files, which may be
+      either absolute paths or paths relative to BBPATH.
     If neither are specified then the default name of files/device_table-minimal.txt
     is searched for in the BBPATH (same as the old version.)
     """
@@ -367,7 +367,10 @@ class Rootfs(object, metaclass=ABCMeta):
             if devtables is None:
                 devtables = 'files/device_table-minimal.txt'
             for devtable in devtables.split():
-                devtable_list.append("%s" % bb.utils.which(self.d.getVar('BBPATH', True), devtable))
+                if os.path.isabs(devtable):
+                    devtable_list.append(devtable)
+                else:
+                    devtable_list.append("%s" % bb.utils.which(self.d.getVar('BBPATH', True), devtable))
 
         for devtable in devtable_list:
             self._exec_shell_cmd(["makedevs", "-r",
-- 
1.9.1


