Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id AE0F47302A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Feb 2017 18:12:04 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id r90so5805809qki.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Feb 2017 10:12:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:organization;
	bh=eNbeE/dH6s1brCykiM5eQLLYBhGVrBTwGu8x2GppeSE=;
	b=LsZRkOrTrfSjDyXxvK9AJsM6o9kNJ/k7lvu23sv8Rk0P8nTbNkMLenyVWFuGEXwEDh
	jYxco/YxRPnl+Ua5pkHdTrPjTKFNLYrCYH+oG6DWqMC3JUXU1kcPv2LmgEbNeXi5a2NS
	FHm6jnWkezz4kgk4vbxGK++tq4ojhfMCVZk+sbTC8T8p0+Eal4rler5Botz+xaAKsdLe
	8PvuG5wIraWTlkJFEASKHFtaxNbrLHeUotL6UuBonNE6cafpQ0wr8ImlH4JeqDcsMB5u
	KBjq3XKqMqryi991i5A/z/dATLP8Kh/6q+s14eQ1wZta1O71Jkfl4aGILUoaaKf/0pvt
	XwFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=eNbeE/dH6s1brCykiM5eQLLYBhGVrBTwGu8x2GppeSE=;
	b=TBEe0jf/YsV2k8iywTNZSOyv7UhWZaRPIfX2N0XyE7ERFH7kFte8UitQIJjGmzuYDx
	iVzn+ETTMHECF329nzMiy1pWXdiqT9e72bxQohLo/9K9pL8t5/iFTGDZWe5k+CXMRHlJ
	aUY0fbYTXB3hXCm0XF698zpIYmXMfldSr/vZeQ2VSG8ZAsCYV4vGYL4ih5sht3eQk678
	Tmq2pAWkPmQZ6TxZ4N5/6N4/JGZlEKzV8pliSPBoltBF/gyt/ZQms6fvMoIaokkzA+60
	LcNKYQoXDE02PisaZz3TjbaW1U7w3AvwYfN9INhfgL6VWmv7LLq0YcFH5NXWQlPOMSOn
	ksPg==
X-Gm-Message-State: AMke39miF/vY9WC6MWOJ1RvWcLRxXPdDrDImqDIkTyZ6uSn4tOelERcHzLmsDUzSyzMK/A==
X-Received: by 10.55.123.129 with SMTP id w123mr36542906qkc.20.1487873525567; 
	Thu, 23 Feb 2017 10:12:05 -0800 (PST)
Received: from centrium.lab.ossystems.com.br ([189.114.111.135])
	by smtp.gmail.com with ESMTPSA id
	c141sm3157753qkb.10.2017.02.23.10.12.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 23 Feb 2017 10:12:04 -0800 (PST)
From: Fabio Berton <fabio.berton@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Feb 2017 15:13:09 -0300
Message-Id: <20170223181309.13899-1-fabio.berton@ossystems.com.br>
X-Mailer: git-send-email 2.11.0
Organization: O.S. Systems Software LTDA.
Subject: [PATCH] wic: Prevent duplicate entries on fstab
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
X-List-Received-Date: Thu, 23 Feb 2017 18:12:06 -0000

Add function to read fstab and return all mount points. This function
is useful to _update_fstab doesn't duplicate entries in /etc/fstab.

Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
---
 scripts/lib/wic/plugins/imager/direct.py | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/wic/plugins/imager/direct.py b/scripts/lib/wic/plugins/imager/direct.py
index 481d24d5ba..570dbbbf79 100644
--- a/scripts/lib/wic/plugins/imager/direct.py
+++ b/scripts/lib/wic/plugins/imager/direct.py
@@ -97,6 +97,25 @@ class DirectPlugin(ImagerPlugin):
         finally:
             self.cleanup()
 
+    def _get_fstab_mountpoints(self):
+        """ Read file /etc/fstab and returns all mountpoints."""
+        image_rootfs = self.rootfs_dir.get("ROOTFS_DIR")
+        if not image_rootfs:
+            return
+
+        fstab_path = image_rootfs + "/etc/fstab"
+        if not os.path.isfile(fstab_path):
+            return
+
+        with open(fstab_path) as fp:
+            mp = []
+            for l in fp:
+                if not l.startswith("#"):
+                    valid_mp = l.replace("\t", " ").split()
+                    if len(valid_mp) >= 2:
+                        mp.append(valid_mp[1])
+            return mp
+
     def _write_fstab(self, image_rootfs):
         """overriden to generate fstab (temporarily) in rootfs. This is called
         from _create, make sure it doesn't get called from
@@ -125,7 +144,7 @@ class DirectPlugin(ImagerPlugin):
         updated = False
         for part in parts:
             if not part.realnum or not part.mountpoint \
-               or part.mountpoint in ("/", "/boot"):
+               or part.mountpoint in self._get_fstab_mountpoints():
                 continue
 
             # mmc device partitions are named mmcblk0p1, mmcblk0p2..
-- 
2.11.0


