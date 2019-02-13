Return-Path: <jpewhacker@gmail.com>
Received: from mail-it1-f173.google.com (mail-it1-f173.google.com
	[209.85.166.173])
	by mail.openembedded.org (Postfix) with ESMTP id 8364A79E9B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Feb 2019 16:59:37 +0000 (UTC)
Received: by mail-it1-f173.google.com with SMTP id r11so7384846itc.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Feb 2019 08:59:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=+UDgboVaoU5Opc5gHx4dPMt5tubWo54Clvr2+NtTyTk=;
	b=oCRdCRHLTxSJH04TRqSQW63RCbOYYHHaRKwjYrrGYa44a7DYMbxZ4HK1ZYfT9+Hlp2
	bMAUR3vvMvXE3GByCTnqO882byd0by+RmuX/TVmbFzeWly55E+a80QLVwd6ejN0iZBRI
	HjZbZLaKSaYakUltaZryvuUAXcxdSZjuB9VwUvqX5A9DOTMusZ+0KV73IuLWcAuwD2hb
	Tov0yzqUJQob7uSsM38I9gc6H4TmAMO71NWhfMjuAhTPmqxK9toMEKxloarvkwWC4dST
	NEU8BFDqHvDc4+ixc02s7IqcsJ/3jkDcNKhBRqW5v3HpD6SvYCshAQimpQyhHC9iu4qy
	Tjlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=+UDgboVaoU5Opc5gHx4dPMt5tubWo54Clvr2+NtTyTk=;
	b=CVDzn6IlrxlImdhsFUwW4u2yLxVTBzUQkRQIMQSrAncfGuGcdqlQ1UzGbkO1DBOFrz
	g2ugHEkcMZfkFvYHBn/x3hR7zTyYqDh0xoiKZtOF4zhKZlQlkPXUHlq85EYmRGgzewHy
	/OzVZehpGbQ0+2JhN2h7Olxc+63gK/X+pmvDkd0JY2Zzhb8xASz1ADun/DCdh8gM4awU
	sXayioKbLlfK7hd1+2mpqk7Ye0Mx0l4N6s+7pv2H1rKltjWZXUKC1Njkkz9TZntYp4Oo
	2A8GIvJgTmZlL8+StOQNq/PUhDQqImwMhrCsX9CgaQiAPi3AG/MbTl0hU9/66ORUkz8b
	UTDA==
X-Gm-Message-State: AHQUAubpQIgZkBZVaPEFmdlgTaHEnRrudC53ZnGI/0Nddf1eVOZiIj4o
	J8hmHWmoZlf3ve4dKLKP/LNTG71W
X-Google-Smtp-Source: AHgI3Ia0MLNWOY2gRK5Jq3J9JIQg89UibMjxT6V6D/bo8oQA2mJLf7R5dSyTOpx/OPlfhNUtNqGb6g==
X-Received: by 2002:a24:db55:: with SMTP id c82mr673684itg.168.1550077178076; 
	Wed, 13 Feb 2019 08:59:38 -0800 (PST)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.gmail.com with ESMTPSA id
	c31sm3559126itd.25.2019.02.13.08.59.36
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 13 Feb 2019 08:59:37 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Feb 2019 10:58:36 -0600
Message-Id: <20190213165836.26872-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] classes/license_image.bbclass: Fix rootfs license file permissions
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
X-List-Received-Date: Wed, 13 Feb 2019 16:59:37 -0000
Content-Transfer-Encoding: 8bit

Fixes up the permissions on the license files when they are put on the
target file system so that they are readable by everyone. Previously,
they would have inherited whatever permissions the file had in the
recipe, which may not have been appropriate.

[YOCTO #13175]

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes/license_image.bbclass | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/meta/classes/license_image.bbclass b/meta/classes/license_image.bbclass
index 6515ee8278..ba95ced3e6 100644
--- a/meta/classes/license_image.bbclass
+++ b/meta/classes/license_image.bbclass
@@ -37,6 +37,7 @@ python license_create_manifest() {
 
 def write_license_files(d, license_manifest, pkg_dic, rootfs=True):
     import re
+    import stat
 
     bad_licenses = (d.getVar("INCOMPATIBLE_LICENSE") or "").split()
     bad_licenses = map(lambda l: canonical_license(d, l), bad_licenses)
@@ -146,12 +147,17 @@ def write_license_files(d, license_manifest, pkg_dic, rootfs=True):
                             continue
 
                         os.link(pkg_license, pkg_rootfs_license)
-            # Fixup file ownership
+            # Fixup file ownership and permissions
             for walkroot, dirs, files in os.walk(rootfs_license_dir):
                 for f in files:
-                    os.lchown(os.path.join(walkroot, f), 0, 0)
+                    p = os.path.join(walkroot, f)
+                    os.lchown(p, 0, 0)
+                    if not os.path.islink(p):
+                        os.chmod(p, stat.S_IRUSR | stat.S_IWUSR | stat.S_IRGRP | stat.S_IROTH)
                 for dir in dirs:
-                    os.lchown(os.path.join(walkroot, dir), 0, 0)
+                    p = os.path.join(walkroot, dir)
+                    os.lchown(p, 0, 0)
+                    os.chmod(p, stat.S_IRWXU | stat.S_IRGRP | stat.S_IXGRP | stat.S_IROTH | stat.S_IXOTH)
 
 
 
-- 
2.20.1


