Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f54.google.com (mail-it0-f54.google.com
	[209.85.214.54])
	by mail.openembedded.org (Postfix) with ESMTP id 114ED71ADE
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Feb 2017 12:04:45 +0000 (UTC)
Received: by mail-it0-f54.google.com with SMTP id c7so139877132itd.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Feb 2017 04:04:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=EDrif8G5VLp8SInchh8qVQzFJclcSC679RlhxNb2y4c=;
	b=OXNhPv5wKY5fkr6BPn4TGNibc3soekTsUDJZdhDjEHEgdUL+G+a4+jm8xcyPzuDO8t
	7MMvy1cwp3yW/3fMSdE9qSmOnGNlr9xxR/YsV5gS+nQTwb22krm5/Olt+4yieuOIdE0k
	HGOy8daOlLRJk0nOgnvyS84Vbip5MwbmmMlW30oZVdzIvzoqCkkbVYly2I2gjv6G6nTc
	ODcKtzIVAKo9SMxsWHdH+PR1EiLEgwVDo40JhG4n8FAjWcjyC+WGCqiPPhkxvudtH7fe
	6OkA9QynVbokPTIezJSncFqCezuog+tAkkl7kiU1UzIqHtOa+oIvhshYJRsdL2MEONFu
	QAXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=EDrif8G5VLp8SInchh8qVQzFJclcSC679RlhxNb2y4c=;
	b=ZAWTRS8tP355ulElpq5IwabbuY9Dj7s7rKREY2AFgxC8ik12x2XPL4+sukiLOJ0zB5
	dpwegUbsT58WqhymH3oI+f+jtoNSmsfN9Jc75NxonKDhHZewLCZ8oTPPki1VLQp6hMHT
	5OnqEa9Doz0g3ioyJiEh+bwKOgjkcYEwlx8wL+xCwncQr048jmvPpIDQWIT24e/LHNnX
	Qui/v9m9tuch4xAW112xx9dCWgGqT/mZYbfYK1SY59cQoV8kE2XabBVHwofgDsbyAFaw
	qbpTkIrB6ZxDLeNbpNs14OSR4sUI6E1N/UbWKtEXFOgz+D/f/Ya5+X1SrmU6JgI7uMke
	DHgg==
X-Gm-Message-State: AMke39lMMrLTL9TyLRa3n6GrBfo1Iaa6Gvg0Pm+TNHgUXOt9Hgfz+h4lYqFGdk4Km6rDmjMo
X-Received: by 10.36.6.199 with SMTP id 190mr7837051itv.79.1486728285993;
	Fri, 10 Feb 2017 04:04:45 -0800 (PST)
Received: from pohly-desktop.fritz.box (p5DE8DBB4.dip0.t-ipconnect.de.
	[93.232.219.180])
	by smtp.gmail.com with ESMTPSA id q65sm945818ioe.16.2017.02.10.04.04.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 10 Feb 2017 04:04:44 -0800 (PST)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 Feb 2017 13:04:38 +0100
Message-Id: <00b9ba28a88cee46ef434de15d6780fc6c50a5cc.1486728255.git-series.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] rootfspostcommands: remove shadow backup files instead of trying to sort
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
X-List-Received-Date: Fri, 10 Feb 2017 12:04:46 -0000

Backup are files sometimes are inconsistent and then cannot be
sorted (YOCTO #11043), and more importantly, are not needed in
the initial rootfs, so they get deleted.

Fixes: [YOCTO #11007]

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 meta/lib/rootfspostcommands.py | 28 ++++++++++++++++++++--------
 1 file changed, 20 insertions(+), 8 deletions(-)

diff --git a/meta/lib/rootfspostcommands.py b/meta/lib/rootfspostcommands.py
index 6a9b8b4..4742e06 100644
--- a/meta/lib/rootfspostcommands.py
+++ b/meta/lib/rootfspostcommands.py
@@ -29,16 +29,28 @@ def sort_file(filename, mapping):
         f.write(b''.join(lines))
     return new_mapping
 
+def remove_backup(filename):
+    """
+    Removes the backup file for files like /etc/passwd.
+    """
+    backup_filename = filename + '-'
+    if os.path.exists(backup_filename):
+        os.unlink(backup_filename)
+
 def sort_passwd(sysconfdir):
     """
     Sorts passwd and group files in a rootfs /etc directory by ID.
+    Backup files are sometimes are inconsistent and then cannot be
+    sorted (YOCTO #11043), and more importantly, are not needed in
+    the initial rootfs, so they get deleted.
     """
-    for suffix in '', '-':
-        for main, shadow in (('passwd', 'shadow'),
-                             ('group', 'gshadow')):
-            filename = os.path.join(sysconfdir, main + suffix)
+    for main, shadow in (('passwd', 'shadow'),
+                         ('group', 'gshadow')):
+        filename = os.path.join(sysconfdir, main)
+        remove_backup(filename)
+        if os.path.exists(filename):
+            mapping = sort_file(filename, None)
+            filename = os.path.join(sysconfdir, shadow)
+            remove_backup(filename)
             if os.path.exists(filename):
-                mapping = sort_file(filename, None)
-                filename = os.path.join(sysconfdir, shadow + suffix)
-                if os.path.exists(filename):
-                    sort_file(filename, mapping)
+                 sort_file(filename, mapping)

base-commit: 652f7245ac95fd11c72f4ad62e0b99234a7e59c5
-- 
git-series 0.9.1

