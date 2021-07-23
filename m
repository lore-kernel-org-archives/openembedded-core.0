Received: from sender4-op-o13.zoho.com (sender4-op-o13.zoho.com [136.143.188.13])
 by mx.groups.io with SMTP id smtpd.web08.6036.1627032122764956487
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Jul 2021 02:22:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=dwrobel@ertelnet.rybnik.pl header.s=ertelnet header.b=FffMezRk;
 spf=pass (domain: ertelnet.rybnik.pl, ip: 136.143.188.13, mailfrom: dwrobel@ertelnet.rybnik.pl)
ARC-Seal: i=1; a=rsa-sha256; t=1627032120; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ex52QDf1K6G4oXseoLfshkUJjlb/1zqE6IgBT/iZYLfTYiEt41orGy2ZE3PBkSFcsJZs90mBi5zJh7ZYwZuq0z3gubYDcmPa6n0vx1KTXnZW+ikq+o51DmxykOnjgRuH1jiiBh0A5274DdIbJIXJkFrsBXa8gOQAeqOE6dCAjOQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1627032120; h=Content-Transfer-Encoding:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=Qsuvn69Afl5Ifjcec05LqozQajdovywbKU3JZY/Qnm4=; 
	b=CLMHMJQ/Sg9D0iT7jwPQU4w1k84FOGcdqVjIJQYLR0zMy2G9y7C49jkeH2L4W6NMTs46QmLy6B3bKGlZfJL5eVqYoNDGBIqfGvOEEIm96ph/I0f70EysKzkXVW90IWqGNqE9ArqBUgkDMmO0KGRDqa9YaEbAuLwUt00yEB6/4hM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ertelnet.rybnik.pl;
	spf=pass  smtp.mailfrom=dwrobel@ertelnet.rybnik.pl;
	dmarc=pass header.from=<dwrobel@ertelnet.rybnik.pl>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1627032120;
	s=ertelnet; d=ertelnet.rybnik.pl; i=dwrobel@ertelnet.rybnik.pl;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=Qsuvn69Afl5Ifjcec05LqozQajdovywbKU3JZY/Qnm4=;
	b=FffMezRklkyLR7HZgtKzseUgH3JJgL+1SvJTpmJL58or29Vr77UYtemisnEcgj0J
	2befWwPiSFSVZJtfPm+zh85mjBgnUe9pjMMzGgiorcjJ6pbRaTmfSJtCTpxIZoSjkyS
	lWkwvqAfKPH8+5nv8Txc3yS6v9KgIyLNERhVzmfo=
Received: from dell.wrobel.ignorelist.com (178.217.216.129 [178.217.216.129]) by mx.zohomail.com
	with SMTPS id 1627032117222892.8796839761451; Fri, 23 Jul 2021 02:21:57 -0700 (PDT)
From: "Damian Wrobel" <dwrobel@ertelnet.rybnik.pl>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2] rootfs: remove ldconfig auxiliary cache where appropriate
Date: Fri, 23 Jul 2021 11:21:41 +0200
Message-Id: <20210723092141.366318-1-dwrobel@ertelnet.rybnik.pl>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <YPnzFOuJhmDW/kb4@piout.net>
References: <YPnzFOuJhmDW/kb4@piout.net>
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
 meta/lib/oe/rootfs.py | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
index ad9fd77c8b..8e63ebac9b 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -302,6 +302,16 @@ class Rootfs(object, metaclass=ABCMeta):
             self._exec_shell_cmd(['ldconfig', '-r', self.image_rootfs, '-c',
                                   'new', '-v', '-X'])
 
+        image_rorfs = bb.utils.contains("IMAGE_FEATURES", "read-only-rootfs",
+                                        True, False, self.d)
+        ldconfig_in_features = bb.utils.contains("IMAGE_FEATURES", "ldconfig",
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

