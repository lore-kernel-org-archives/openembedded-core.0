Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
 by mx.groups.io with SMTP id smtpd.web08.44776.1629231115488360354
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Aug 2021 13:11:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qtec.com header.s=google header.b=ENIX+PH0;
 spf=pass (domain: qtec.com, ip: 209.85.208.176, mailfrom: daniel@qtec.com)
Received: by mail-lj1-f176.google.com with SMTP id h11so715287ljo.12
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Aug 2021 13:11:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=qtec.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=V/MS3HTRRKl2klVty42G3bMZa6SYcaFhuM0TLL33GP0=;
        b=ENIX+PH0FgZ1gjWHahNfyoGkLYPjXZPyhHPthea1qvMe/3d7P8yaA1yom2MhNgN1AS
         7n9u+u3zWtEH7p5uYHTBYh7xU1IyYMIvPjuUxxDSsdHy2FRhiQxWQ5MKN2At5A9HYEk4
         oKpsWZuInm90AHAY5IPfV8qSyulsCWTJkU0DnS42dnNPJfB4IuQTTIKURwq7dpIlpmyT
         ZgpVjSXmZNvoPPxKBF/384mx7kpN+pwCG/mEBfXHcyzPNU4N8e75njxDVfOGC7Z+g9Wt
         ddJqh283O/6tEKIJBtZCUnSNv0VjKEna1iJeqJfOyiZlR07QOihgBzHWvq/qSIqJ5ZRQ
         w+nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=V/MS3HTRRKl2klVty42G3bMZa6SYcaFhuM0TLL33GP0=;
        b=T+qEGgBqCqn1j9zuDvaeOd8NXagr7hjpxlH/g4EGzEuMqs2XVuYRAuWUK5FeQZBgRr
         fdnQznYLDLIrgtZ4U23464gmNJoCVOBd8Epok0yB8zOgksFcXMrAz6qams9m9OBuJUEI
         kd2wioos/JA/o+WUxpTQQb7YavupaskbO/7RnytxswX8Elyj70ZxLCbkttCqYSKQuEMN
         gRlX1YmAVsKaFK3fszIbXD0UArLEbNO44d8VLgM4d7bUb616wAz1ZNQHt22Xvv2DDZfY
         v/O24YzOrJiGx6H3NtRO93HptbBK41NAgH74ceMT//EbiE6mrqzewqurfOo0Mlj/rNQ0
         HqlA==
X-Gm-Message-State: AOAM533usGXhRXI/bJCpwFJyAjMX3ugSPe/Uh7NaC8sgPi07n53STLyn
	t3djvcyS+1PL35OVRMj5yQYL2wPnHjbJx5tcayNuiOIBYSMClCL27/OfkseTNzzvfOaioNBrxQX
	nFdSOz5WZu/nGDgs0VX4PQ70g4RFS8hpa1a8VXpj3qolPhlwjaRUgYAv0VWK2nesf+2pMKHv2gb
	DiWWneswR0nrQA
X-Google-Smtp-Source: ABdhPJzb/eHo9liaanITlMT8msOv3snQlm3u+mE5MR0eqpWR5Q1WCJo6kY0UZX4xLr6SNpEFSffJCw==
X-Received: by 2002:a2e:9455:: with SMTP id o21mr4710974ljh.103.1629231113053;
        Tue, 17 Aug 2021 13:11:53 -0700 (PDT)
Return-Path: <daniel@qtec.com>
Received: from localhost (87-52-47-7-cable.dk.customer.tdc.net. [87.52.47.7])
        by smtp.gmail.com with ESMTPSA id 10sm335253lji.88.2021.08.17.13.11.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Aug 2021 13:11:52 -0700 (PDT)
From: "Daniel Gomez" <daniel@qtec.com>
To: openembedded-core@lists.openembedded.org
Cc: dagmcr@gmail.com,
	paul@pbarker.dev,
	richard.purdie@linuxfoundation.org,
	alexandre.belloni@bootlin.com,
	Daniel Gomez <daniel@qtec.com>
Subject: [OE-core][PATCH v3 2/2] oeqa: wic: Add tests for --no-fstab-update
Date: Tue, 17 Aug 2021 22:11:15 +0200
Message-Id: <20210817201115.89609-2-daniel@qtec.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210817201115.89609-1-daniel@qtec.com>
References: <20210817201115.89609-1-daniel@qtec.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add tests for the --no-fstab-update wic part command.

Signed-off-by: Daniel Gomez <daniel@qtec.com>
---
 meta/lib/oeqa/selftest/cases/wic.py | 58 +++++++++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest/cases/wic.py
index 2efbe514c1..3b4143414f 100644
--- a/meta/lib/oeqa/selftest/cases/wic.py
+++ b/meta/lib/oeqa/selftest/cases/wic.py
@@ -11,6 +11,7 @@
 import os
 import sys
 import unittest
+import hashlib
 
 from glob import glob
 from shutil import rmtree, copy
@@ -686,6 +687,63 @@ part /etc --source rootfs --fstype=ext4 --change-directory=etc
                                       % (wks_file, self.resultdir), ignore_status=True).status)
         os.remove(wks_file)
 
+    def test_no_fstab_update(self):
+        """Test --no-fstab-update wks option."""
+
+        oldpath = os.environ['PATH']
+        os.environ['PATH'] = get_bb_var("PATH", "wic-tools")
+
+        # Get stock fstab from base-files recipe
+        self.assertEqual(0, bitbake('base-files -c do_install').status)
+        bf_fstab = os.path.join(get_bb_var('D', 'base-files'), 'etc/fstab')
+        self.assertEqual(True, os.path.exists(bf_fstab))
+        bf_fstab_md5sum = runCmd('md5sum %s 2>/dev/null' % bf_fstab).output.split(" ")[0]
+
+        try:
+            no_fstab_update_path = os.path.join(self.resultdir, 'test-no-fstab-update')
+            os.makedirs(no_fstab_update_path)
+            wks_file = os.path.join(no_fstab_update_path, 'temp.wks')
+            with open(wks_file, 'w') as wks:
+                wks.writelines(['part / --source rootfs --fstype=ext4 --label rootfs\n',
+                                'part /mnt/p2 --source rootfs --rootfs-dir=core-image-minimal ',
+                                '--fstype=ext4 --label p2 --no-fstab-update\n'])
+            runCmd("wic create %s -e core-image-minimal -o %s" \
+                                       % (wks_file, self.resultdir))
+
+            part_fstab_md5sum = []
+            for i in range(1, 3):
+                part = glob(os.path.join(self.resultdir, 'temp-*.direct.p') + str(i))[0]
+                part_fstab = runCmd("debugfs -R 'cat etc/fstab' %s 2>/dev/null" % (part))
+                part_fstab_md5sum.append(hashlib.md5((part_fstab.output + "\n\n").encode('utf-8')).hexdigest())
+
+            # '/etc/fstab' in partition 2 should contain the same stock fstab file
+            # as the one installed by the base-file recipe.
+            self.assertEqual(bf_fstab_md5sum, part_fstab_md5sum[1])
+
+            # '/etc/fstab' in partition 1 should contain an updated fstab file.
+            self.assertNotEqual(bf_fstab_md5sum, part_fstab_md5sum[0])
+
+        finally:
+            os.environ['PATH'] = oldpath
+
+    def test_no_fstab_update_errors(self):
+        """Test --no-fstab-update wks option error handling."""
+        wks_file = 'temp.wks'
+
+        # Absolute argument.
+        with open(wks_file, 'w') as wks:
+            wks.write("part / --source rootfs --fstype=ext4 --no-fstab-update /etc")
+        self.assertNotEqual(0, runCmd("wic create %s -e core-image-minimal -o %s" \
+                                      % (wks_file, self.resultdir), ignore_status=True).status)
+        os.remove(wks_file)
+
+        # Argument pointing to parent directory.
+        with open(wks_file, 'w') as wks:
+            wks.write("part / --source rootfs --fstype=ext4 --no-fstab-update ././..")
+        self.assertNotEqual(0, runCmd("wic create %s -e core-image-minimal -o %s" \
+                                      % (wks_file, self.resultdir), ignore_status=True).status)
+        os.remove(wks_file)
+
 class Wic2(WicTestCase):
 
     def test_bmap_short(self):
-- 
2.30.2

