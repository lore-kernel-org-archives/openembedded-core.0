Received: from sender4-op-o14.zoho.com (sender4-op-o14.zoho.com [136.143.188.14])
 by mx.groups.io with SMTP id smtpd.web11.5722.1626947325156681049
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Jul 2021 02:48:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=dwrobel@ertelnet.rybnik.pl header.s=ertelnet header.b=MYJoiVmP;
 spf=pass (domain: ertelnet.rybnik.pl, ip: 136.143.188.14, mailfrom: dwrobel@ertelnet.rybnik.pl)
ARC-Seal: i=1; a=rsa-sha256; t=1626947323; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=PznSeWco/HML3TB+UUOwe/zLlYNcxc4y5Kh8whG1mS9Xiho6H0aPvxZmNGFUqHyAOoyFEX2BIWTyphPmMX/ZIh/nRb+oWfP3K0S5U4l5/QAbDMRlOlbgAUpj5NylxQ9CyMpqWhjqcm59u9NruDz1gxbyCO/VYrI/1HlSC1xWT8Y=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1626947323; h=Content-Transfer-Encoding:Date:From:MIME-Version:Message-ID:Subject:To; 
	bh=EvMtBeKj1JdAY6vXdP+sBNw0sWoSiAB0gfmDfWqql4c=; 
	b=OW4niSV0TSzELuEz/t5FBqVrhe2RfQekpnz1kn3B345pn7xxYNHd5hOAtBS+El+bja+60YAI6nOhENegwb5w9dV2GUVXymNY8ybUjIG877gfH0d6b/OSe6i73ovP5/tXYACaMCsjZSzIumPh73IndLDxNyvSLRoNj6QYbftH+Bo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ertelnet.rybnik.pl;
	spf=pass  smtp.mailfrom=dwrobel@ertelnet.rybnik.pl;
	dmarc=pass header.from=<dwrobel@ertelnet.rybnik.pl>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1626947323;
	s=ertelnet; d=ertelnet.rybnik.pl; i=dwrobel@ertelnet.rybnik.pl;
	h=From:To:Subject:Date:Message-Id:MIME-Version:Content-Transfer-Encoding;
	bh=EvMtBeKj1JdAY6vXdP+sBNw0sWoSiAB0gfmDfWqql4c=;
	b=MYJoiVmPbMCNC2xMfwP1/JsYQxIBDuaLvhqPpzp+/Izhq4o/kofNxz0RCW4uSA+l
	V2k7jrGb4RKB8Uk7wk8S3AkW32YDwT2PN0ye0O+Z6vac8Qdsrk/Gm4wVbnkWprylZnq
	TLydSAMlbpfeJQykca16KY8Zxl7HwRiYTPSK2lE0=
Received: from localhost.localdomain.pl (91.230.58.69 [91.230.58.69]) by mx.zohomail.com
	with SMTPS id 1626947318966891.0954819446272; Thu, 22 Jul 2021 02:48:38 -0700 (PDT)
From: "Damian Wrobel" <dwrobel@ertelnet.rybnik.pl>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] rootfs: remove ldconfig auxiliary cache where appropriate
Date: Thu, 22 Jul 2021 11:48:22 +0200
Message-Id: <20210722094822.1102062-1-dwrobel@ertelnet.rybnik.pl>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-ZohoMailClient: External
Content-Transfer-Encoding: 8bit

Removes the /var/cache/ldconfig auxiliary cache directory from
the rootfs when:
 - read-only-rootfs is in DISTRO_FEATURES,
 - ldconfig is not in DISTRO_FEATURES.

In both cases the /var/cache/ldconfig/aux-cache is useless.

Signed-off-by: Damian Wrobel <dwrobel@ertelnet.rybnik.pl>
---
 meta/lib/oe/rootfs.py | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
index ad9fd77c8b..80673fab3f 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -302,6 +302,15 @@ class Rootfs(object, metaclass=ABCMeta):
             self._exec_shell_cmd(['ldconfig', '-r', self.image_rootfs, '-c',
                                   'new', '-v', '-X'])
 
+        image_rorfs = bb.utils.contains("IMAGE_FEATURES", "read-only-rootfs",
+                                        True, False, self.d)
+        ldconfig_in_features = bb.utils.contains("IMAGE_FEATURES", "ldconfig",
+                                                 True, False, self.d)
+        if image_rorfs or not ldconfig_in_features:
+            ldconfig_cache_dir = os.path.join(self.image_rootfs, "var/cache/ldconfig")
+            bb.note("Removing ldconfig auxiliary cache...")
+            shutil.rmtree(ldconfig_cache_dir)
+
     def _check_for_kernel_modules(self, modules_dir):
         for root, dirs, files in os.walk(modules_dir, topdown=True):
             for name in files:
-- 
2.31.1

