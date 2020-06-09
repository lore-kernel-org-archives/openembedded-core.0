Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web12.3737.1591722998435556544
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Jun 2020 10:16:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=helf2ogw;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: jpewhacker@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id d6so1684462pjs.3
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Jun 2020 10:16:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=f/ts2nlc18DV3XpqdHi7RCkChD564m75jHzPQhUE8CM=;
        b=helf2ogwfVBsYnwVi6iOaqCSfJkO56eSwjkgS2ms+Jm9PKU6nTW7xrMPJs4Pe4Dtza
         hSWGvVbUgcK+Omd2qZi+8+1a7u3e8wIZYqzAidqzoFbW8VYkjRhmAiqm0pZ/09KkiIvw
         fD9KaDDoc+opFnJ/fcp0UFF4sjySvOfvk6D1rf2AxG6utXO4gWKmgY/wSWJASxGo5iS2
         YOlGAYA/rEjd+0OkMOVR56E66RgkCCVMAfE7nbZWJJ11nLzExlZKbYGhd54qbaSSOgMu
         Bav7i17RzO8bEAFR71EveyLZ7VnMCJio53FrsvSfNlWhjmf9ICRxlq+CeUXPuoMF4EDP
         0r1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=f/ts2nlc18DV3XpqdHi7RCkChD564m75jHzPQhUE8CM=;
        b=NZYA1if+vdPFxQrgg5qn2o+tXHMd99cn9F0HdxTAcNZD/Dr7CelVRn/TlxlB7bNdt5
         F6NkHVlSFMkn+hmZRfpBDAXXqT9dP25yGi5zQ+8FNxYvRGcU3BEUOf3pYtVrNzhE3Fjl
         DsTtkcGQmX6EWLfpYjfILWZz0KHSfR+MFvtQ3Ob56undf0Y+CJGpE55L9cRypzE70dO6
         YIXc8eYcwHWDmdJ2mhnL8Ue1demBKFQ/5Jy6hOUYuW4Fl7MWZLXdonY/4H01eFDxzgoP
         MifkWg0XJLmgavZhziJBYPMNKZf/sXZI4y2rXoCIUK81yhQxPpHBNAuJ4EGZYSx7Ly08
         F4Lg==
X-Gm-Message-State: AOAM531o3EOch9WI2KDfZA5QW3egSRTeI/Az6FcvE5cTMJBjpjPBhTDC
	vaujTySN+TStRpWwYS+dq34Hyz36Vbk=
X-Google-Smtp-Source: ABdhPJw0jhLca/AG6igTMoRAqFxLphi3uovwwJBd0gH4S888/OEpGP5fw4OYJqFQlMF4w6kLoRZHgQ==
X-Received: by 2002:a17:90a:bf92:: with SMTP id d18mr5975985pjs.120.1591722997364;
        Tue, 09 Jun 2020 10:16:37 -0700 (PDT)
Return-Path: <jpewhacker@gmail.com>
Received: from localhost.localdomain ([2605:a601:ac3d:c100:6cec:510:bc9:611])
        by smtp.gmail.com with ESMTPSA id t25sm9031513pgo.7.2020.06.09.10.16.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2020 10:16:36 -0700 (PDT)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: denis@denix.org,
	Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH] wic: Fix --extra-space argument handling
Date: Tue,  9 Jun 2020 12:16:31 -0500
Message-Id: <20200609171631.21796-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

467f84e12b ("wic: Add --offset argument for partitions") broke the
--extra-space argument handling in wic. Fix the option and add a unit
test for the argument.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/lib/oeqa/selftest/cases/wic.py | 15 +++++++++++++++
 scripts/lib/wic/ksparser.py         |  2 +-
 2 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest/cases/wic.py
index 9e7be6168e..8b58285c32 100644
--- a/meta/lib/oeqa/selftest/cases/wic.py
+++ b/meta/lib/oeqa/selftest/cases/wic.py
@@ -908,6 +908,21 @@ class Wic2(WicTestCase):
             p, _ = self._get_wic_partitions(tempf.name, ignore_status=True)
             self.assertNotEqual(p.status, 0, "wic exited successfully when an error was expected:\n%s" % p.output)
 
+    def test_extra_space(self):
+        native_sysroot = get_bb_var("RECIPE_SYSROOT_NATIVE", "wic-tools")
+
+        with NamedTemporaryFile("w", suffix=".wks") as tempf:
+            tempf.write("bootloader --ptable gpt\n" \
+                        "part /     --source rootfs --ondisk hda --extra-space 200M --fstype=ext4\n")
+            tempf.flush()
+
+            _, partlns = self._get_wic_partitions(tempf.name, native_sysroot)
+            self.assertEqual(len(partlns), 1)
+            size = partlns[0].split(':')[3]
+            self.assertRegex(size, r'^[0-9]+kiB$')
+            size = int(size[:-3])
+            self.assertGreaterEqual(size, 204800)
+
     @only_for_arch(['i586', 'i686', 'x86_64'])
     def test_rawcopy_plugin_qemu(self):
         """Test rawcopy plugin in qemu"""
diff --git a/scripts/lib/wic/ksparser.py b/scripts/lib/wic/ksparser.py
index 05ae292ef5..3453d9cb9d 100644
--- a/scripts/lib/wic/ksparser.py
+++ b/scripts/lib/wic/ksparser.py
@@ -145,7 +145,7 @@ class KickStart():
         part.add_argument('--exclude-path', nargs='+')
         part.add_argument('--include-path', nargs='+', action='append')
         part.add_argument('--change-directory')
-        part.add_argument("--extra-space", type=sizetype)
+        part.add_argument("--extra-space", type=sizetype("M"))
         part.add_argument('--fsoptions', dest='fsopts')
         part.add_argument('--fstype', default='vfat',
                           choices=('ext2', 'ext3', 'ext4', 'btrfs',
-- 
2.26.2

