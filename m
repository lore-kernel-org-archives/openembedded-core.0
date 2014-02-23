Return-Path: <net147@gmail.com>
Received: from mail-pd0-f172.google.com (mail-pd0-f172.google.com
	[209.85.192.172])
	by mail.openembedded.org (Postfix) with ESMTP id 4BED16E85F
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Feb 2014 07:31:46 +0000 (UTC)
Received: by mail-pd0-f172.google.com with SMTP id p10so580444pdj.3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Feb 2014 23:31:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=hBQ/JpaQOhCxnEzPjGw/ovdr0CcuxeIwM1WOcsHJmX0=;
	b=nDNCrPFwicRA6b7RTIlLDJ0dSVFLuRIiceaRRllnZdDHQHXpldvggFN6fZ6C/amfnK
	bHAD7F0pigvXOyYGx05XmocKVHUOZ917xuyJbGwy3WAZJ+XTJFtmr+qZLNUDR7z2H7It
	XSuebBikwag0H2CT/ZbbHvI8likUFJNlgdl8NJUUjBX4qwAYPbUtxUDoep5UfS5p1dwg
	T9yLtAH/rfWwkU29YiO3fEyC6ndgmpgGPjgoSo7O83HXu2kT2eAZ2WIvO4X9TAW8YAjj
	iIbX7qUW8TkMb2Xxm9cknTPXB4L8yB951H/avzPsM8xEwcn+2Jbj+r6szkScp634sV9g
	47Xw==
X-Received: by 10.68.171.193 with SMTP id aw1mr18049111pbc.117.1393140707172; 
	Sat, 22 Feb 2014 23:31:47 -0800 (PST)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id tu3sm90086704pab.1.2014.02.22.23.31.45
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 22 Feb 2014 23:31:46 -0800 (PST)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 23 Feb 2014 18:35:59 +1100
Message-Id: <1393140959-30350-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 1.9.0
Subject: [PATCH] package_manager.py: correctly handle empty opkg-query-helper.py output
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
X-List-Received-Date: Sun, 23 Feb 2014 07:31:49 -0000

If the output from opkg-query-helper.py is empty, output.split('\n')
would result in a list containing one element which is an empty string
while iterating over each line in the output. An exception is then
thrown by the line:

    pkg, pkg_file, pkg_arch = line.split()

with the message:

    Exception: ValueError: need more than 0 values to unpack

To avoid this, we add a condition to only split the output if it isn't
empty.

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 meta/lib/oe/package_manager.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index b430ee3..d29adac 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -1141,7 +1141,7 @@ class OpkgPM(PackageManager):
             bb.fatal("Cannot get the installed packages list. Command '%s' "
                      "returned %d:\n%s" % (cmd, e.returncode, e.output))
 
-        if format == "file":
+        if output and format == "file":
             tmp_output = ""
             for line in output.split('\n'):
                 pkg, pkg_file, pkg_arch = line.split()
-- 
1.9.0


