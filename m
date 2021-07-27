Received: from sender4-op-o13.zoho.com (sender4-op-o13.zoho.com [136.143.188.13])
 by mx.groups.io with SMTP id smtpd.web09.9195.1627380718298489657
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Jul 2021 03:11:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=dwrobel@ertelnet.rybnik.pl header.s=ertelnet header.b=IIwLVS13;
 spf=pass (domain: ertelnet.rybnik.pl, ip: 136.143.188.13, mailfrom: dwrobel@ertelnet.rybnik.pl)
ARC-Seal: i=1; a=rsa-sha256; t=1627380717; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=PA2aFGio9S3RqCSkrSlVaZxzFxwUCnK9817NRfjwQDYGQ3KNSUoZUqpdKHcBkVP40XznaQiv6oue6IfccSPyEO2CvZy+SwA2NQnqqu9/e1FyLUR4X8mMOkrVEf1SfGhWxUN8r6/RDt8cz//a2Lh5FczPyxZpA43bN4/yjbVCGBE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1627380717; h=Content-Transfer-Encoding:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=UFwR4jHUatvEsY90HvfSKz+kNogU7twduuGoN3etjJw=; 
	b=W3pKGGj7qUqvYLV6Zjfmdci/sWMIaX1LEdHnbI2udNsmUbDrh80Z55XygGVexjPM3mPq8XEXWS70HU23cvgu7PsylLVsAObFbgmZgbdl/5OxTJokjLoFS2VvGfFU1k8xtcqDizQ431Rzs4RK09RKjmp0uZ0a5M/1Q8FiRY62xOA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ertelnet.rybnik.pl;
	spf=pass  smtp.mailfrom=dwrobel@ertelnet.rybnik.pl;
	dmarc=pass header.from=<dwrobel@ertelnet.rybnik.pl>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1627380717;
	s=ertelnet; d=ertelnet.rybnik.pl; i=dwrobel@ertelnet.rybnik.pl;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=UFwR4jHUatvEsY90HvfSKz+kNogU7twduuGoN3etjJw=;
	b=IIwLVS13cwHgxfay0vj6ig+Uw2K5qOb5fd0TunNQzg7/rqfZwsB0ZMHdUps6nF9a
	dWVfPsUFZ4mTCDfaq99KdjqtHoUALscp3NQ/LdsAtCu4dFCP3vt0JNLvXhkCyzxOwsI
	kJZt+o14wr9//P+j6FLwC+0RmYn2nffRPKkz48zA=
Received: from localhost.localdomain.pl (91.230.58.69 [91.230.58.69]) by mx.zohomail.com
	with SMTPS id 1627380714786931.4125955827544; Tue, 27 Jul 2021 03:11:54 -0700 (PDT)
From: "Damian Wrobel" <dwrobel@ertelnet.rybnik.pl>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v3] rootfs: remove ldconfig auxiliary cache where appropriate
Date: Tue, 27 Jul 2021 12:11:46 +0200
Message-Id: <20210727101146.185652-1-dwrobel@ertelnet.rybnik.pl>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <YPnzFOuJhmDW/kb4@piout.net>
References: <YPnzFOuJhmDW/kb4@piout.net>
MIME-Version: 1.0
X-ZohoMailClient: External
Content-Transfer-Encoding: 8bit

Removes the /var/cache/ldconfig auxiliary cache directory from
the rootfs when:
 - read-only-rootfs is in IMAGE_FEATURES,
 - ldconfig is not in DISTRO_FEATURES.

In both cases the /var/cache/ldconfig/aux-cache is useless.

Signed-off-by: Damian Wrobel <dwrobel@ertelnet.rybnik.pl>
---
 meta/lib/oe/rootfs.py | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
index ad9fd77c8b..4ea5adb9f4 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -302,6 +302,16 @@ class Rootfs(object, metaclass=ABCMeta):
             self._exec_shell_cmd(['ldconfig', '-r', self.image_rootfs, '-c',
                                   'new', '-v', '-X'])
 
+        image_rorfs = bb.utils.contains("IMAGE_FEATURES", "read-only-rootfs",
+                                        True, False, self.d)
+        ldconfig_in_features = bb.utils.contains("DISTRO_FEATURES", "ldconfig",
+                                                 True, False, self.d)
+        if image_rorfs or not ldconfig_in_features:
+            ldconfig_cache_dir = os.path.join(self.image_rootfs, "var/cache/ldconfig")
+            if os.path.exists(ldconfig_cache_dir):
+                bb.note("Removing ldconfig auxiliary cache...")
+                shutil.rmtree(ldconfig_cache_dir)
+
     def _check_for_kernel_modules(self, modules_dir):
         for root, dirs, files in os.walk(modules_dir, topdown=True):
             for name in files:
-- 
2.31.1

