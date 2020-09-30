Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web10.6606.1601504142383736158
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Sep 2020 15:15:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=1ZLK0lJK;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.177, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f177.google.com with SMTP id x123so2341546pfc.7
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2020 15:15:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=Ty1wJdCC0UjHLr+vR5PHcmeIvUgYAPYEznYDNmtkZik=;
        b=1ZLK0lJKV97+A54WVmcXRX/K/kX3MH5Ex1c+hfANhc179gmMHHm1degc8E75rG93gW
         W4Jp+0tQbBcPrIt/XGEBX8QXKFy+bu032oCyK9CIzGUIt4l7fWZAkhy0WYHaCGvWgwf4
         8wkOou9SfStTRiwPiyjA2Xzd5OKtRYhQM9zGvYWm0rA5y1MpCRYF9V+zc/r0l9UYznoe
         ohI/qj0Zwdf134t3Hif7AvY9np2DM/c4bhgFWN9SkBnJMsrxYDRceW9SHtgg5kSKVjVv
         iFWG407w2cOVEm++mEuCA/ustzROUwGzCmvbfIVzNsSPmgmFNNNJWlTOo9AXcd1cQvew
         hJrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=Ty1wJdCC0UjHLr+vR5PHcmeIvUgYAPYEznYDNmtkZik=;
        b=X4FntojdV2RfYIylKjwyxXjxLPa93PjiRtsY0f92xYP16ZmvEM72MhR0/7h1Ju/1w9
         7xWTP9cvXkwm1LDW+T481g8mumtWv48+32YTinWpPCAvNANHETYJHdwIjnEDpVefnjDR
         lWqOtyE2+8MAb3vKcGoS6nIFert5Y/Pzrr6w6lbWrKnJ6Z2/vlKm7i3f5jG6mgPGl6DM
         9bPe1u2pOwI6OaICHzWe90R3auyG9OiZ3ZWapc49+82HfSci+MSodBey2Bv6jbA3IgOy
         /h6gggb3VX9gRbYsql51wgxxLyBtD0hJogBSNH2CpjqpNdTTGhvzCZvuM3XjLW/aohgy
         fpxQ==
X-Gm-Message-State: AOAM531FgyuMu+cxtdymT/e+17twpkdPFP5XxKjaLODXO+FDnZmVjQ+c
	4qhSfofV0huzIGthLVSf270Yy/sTnLJoc65nUNo=
X-Google-Smtp-Source: ABdhPJyI9A5DkHRZ1mUhmUKY0xQ4Sc6gEE7ombUbVkAB/l5va8RTD3bKe8fpKTceLKlWZHR+q5uz1Q==
X-Received: by 2002:a17:902:c3d3:b029:d1:e5e7:c4da with SMTP id j19-20020a170902c3d3b02900d1e5e7c4damr4561267plj.46.1601504141453;
        Wed, 30 Sep 2020 15:15:41 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id k6sm3488799pfh.92.2020.09.30.15.15.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2020 15:15:40 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 39/41] wic: Fix --extra-space argument handling
Date: Wed, 30 Sep 2020 12:11:41 -1000
Message-Id: <62a7a10c31bcf133cbd99d4de928f15a30e45ab1.1601502610.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1601502610.git.steve@sakoman.com>
References: <cover.1601502610.git.steve@sakoman.com>

From: Joshua Watt <JPEWhacker@gmail.com>

467f84e12b ("wic: Add --offset argument for partitions") broke the
--extra-space argument handling in wic. Fix the option and add a unit
test for the argument.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 87722a92c18f94917c8f70afc8cd0763462a5c25)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/selftest/cases/wic.py | 15 +++++++++++++++
 scripts/lib/wic/ksparser.py         |  2 +-
 2 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest/cases/wic.py
index 6d4068a527..a166d3f614 100644
--- a/meta/lib/oeqa/selftest/cases/wic.py
+++ b/meta/lib/oeqa/selftest/cases/wic.py
@@ -757,6 +757,21 @@ class Wic2(WicTestCase):
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
index f32315c631..ac6f427564 100644
--- a/scripts/lib/wic/ksparser.py
+++ b/scripts/lib/wic/ksparser.py
@@ -144,7 +144,7 @@ class KickStart():
         part.add_argument('--offset', type=sizetype("K"))
         part.add_argument('--exclude-path', nargs='+')
         part.add_argument('--include-path', nargs='+')
-        part.add_argument("--extra-space", type=sizetype)
+        part.add_argument("--extra-space", type=sizetype("M"))
         part.add_argument('--fsoptions', dest='fsopts')
         part.add_argument('--fstype', default='vfat',
                           choices=('ext2', 'ext3', 'ext4', 'btrfs',
-- 
2.17.1

