Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web08.59555.1622560682124791652
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Jun 2021 08:18:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=iyP/p+GE;
 spf=pass (domain: gmail.com, ip: 209.85.167.53, mailfrom: tomasz.dziendzielski@gmail.com)
Received: by mail-lf1-f53.google.com with SMTP id q1so22401577lfo.3
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Jun 2021 08:18:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BttLK9xpcdyNJxgoHKAmESmEAodkmRamriMyPTikQfI=;
        b=iyP/p+GEuIiuKMAyZYWDL6U4vHv2dzEsK4YWRGo9N5gaDTlBUHvEiLCXJUdh2jbFdn
         NgGFdw0OKPaTn/Nm/HI7mDmgVheS0Nc3xGYjSCZMAeN6t7CI/uwkuVgcdccbP008zGRz
         IRFEhjZ4qgeOZTuP4N4BhtBP9oORhTiyEqMgk2aqx2iVdoB69YNhvZAZa4Z1QECPzl8F
         z/wOLigupilzAV1HJwc6BFvKKAenatVB19jpqKFlaIQ0xGl4Zw1lR7ZKZZ/Zpn+4xS1W
         Q2gAttWqGb0EOGGPhdtdquKfkkSwynCeN/GWMFKKa9UV8trwNT6NzZjSt9P+lHwqIGZ1
         FUag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BttLK9xpcdyNJxgoHKAmESmEAodkmRamriMyPTikQfI=;
        b=G/k0UAy4rgaxaBri1qXzAPgKgq5SMIOhPnz3gQOhmmoL9Gpm7gCsTz55hG1XFbZEOq
         RzMhatZgN8utX9RV0RJk/z+XEQHAS2pbUUrAwDEhdZJIFkDPr4T68hma5NsJjiK/8HFj
         2Jo9UbaCeGiV1ISehZ1MPcZVt8qfENH1rkXRGK/Kc2+bMzSx3+ZsrcxQeYg7LeyxKcUB
         1/olnlaDB4/ennliQ2l7z8huNIIPn+R3/fQDk1lhx9IN97ViZ0X6PqIKjOF9iR79jAZX
         MBvSSKC3jQF0Hdb+pI4Xyabs8UGxOE2Y2rnkwA8iZPm8U3nqqdBg+fvUmW4n/MMgRLL+
         lkYQ==
X-Gm-Message-State: AOAM531bmRK80d2QDfi6aNu8q6kf/N0TZbldKPYkWWYvh+aBWBJ20Rz1
	dkUyrqSAQQ5fqyCdNimuds4cpj+l7eDs5u4i
X-Google-Smtp-Source: ABdhPJxwsMtpPI1tiU6S2NgG4igWXSP+XXlM/vvVpAAj6XwA+r25Z0T8DHX/FEVJYgo8Wd+KIebtVw==
X-Received: by 2002:a05:6512:2316:: with SMTP id o22mr20293584lfu.510.1622560679760;
        Tue, 01 Jun 2021 08:17:59 -0700 (PDT)
Return-Path: <tomasz.dziendzielski@gmail.com>
Received: from localhost.localdomain (h124200.man.tk-internet.pl. [93.175.124.200])
        by smtp.gmail.com with ESMTPSA id k1sm1875421lfg.140.2021.06.01.08.17.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jun 2021 08:17:59 -0700 (PDT)
From: "Tomasz Dziendzielski" <tomasz.dziendzielski@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>,
	Kamil Kwiek <kamil.kwiek@gmail.com>,
	Jan Brzezanski <jan.brzezanski@gmail.com>,
	Paulo Neves <ptsneves@gmail.com>
Subject: [PATCH] Fix corrupted magic number in ipk on populate_sdk task
Date: Tue,  1 Jun 2021 17:21:14 +0200
Message-Id: <20210601152114.495307-1-tomasz.dziendzielski@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If any do_package_write_ipk runs parallel with populate_sdk task it can
happen that opkg script arfile.py tries to get magic number of all
packages in DEPLOY_DIR_IPK while some package is being copied there at
the same time. This results with:
| AssertionError: Old ipk format (non-deb) is unsupported, file:
| build/tmp/deploy/ipk/foo/bar_1.0-r0_foo.ipk, magic: b'', expected
| !<arch>
which isn't really the case here.

To fix this I added lockfile in package_write_ipk task and in
OpkgIndexer class. Even though package_write_ipk is writing to a
common deploy directory we can use shared lock, because we are sure we
don't write to same files. On the other hand in OpkgIndex to read magic
number I added not-shared lock, because unfortunately we don't have a
mechanism to share lockfiles only with specific group of tasks. That's
not a problem though, since indexer runs fast and usually there are not
many recipes using populate_sdk class.

Signed-off-by: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>
Signed-off-by: Kamil Kwiek <kamil.kwiek@gmail.com>
Signed-off-by: Jan Brzezanski <jan.brzezanski@gmail.com>
Signed-off-by: Paulo Neves <ptsneves@gmail.com>
---
 meta/classes/package_ipk.bbclass            | 10 ++++++++++
 meta/lib/oe/package_manager/ipk/__init__.py |  3 +++
 2 files changed, 13 insertions(+)

diff --git a/meta/classes/package_ipk.bbclass b/meta/classes/package_ipk.bbclass
index 600b3ac90c..16d4ae2032 100644
--- a/meta/classes/package_ipk.bbclass
+++ b/meta/classes/package_ipk.bbclass
@@ -256,7 +256,12 @@ python do_package_write_ipk_setscene () {
     if os.access(os.path.join(tmpdir, "stamps", "IPK_PACKAGE_INDEX_CLEAN"), os.R_OK):
         os.unlink(os.path.join(tmpdir, "stamps", "IPK_PACKAGE_INDEX_CLEAN"))
 
+    ipk_index_lock = os.path.join(d.getVar("DEPLOY_DIR_IPK"), 'ipk.lock')
+    lf = bb.utils.lockfile(ipk_index_lock, shared=True)
+
     sstate_setscene(d)
+
+    bb.utils.unlockfile(lf)
 }
 addtask do_package_write_ipk_setscene
 
@@ -268,8 +273,13 @@ python () {
 }
 
 python do_package_write_ipk () {
+    ipk_index_lock = os.path.join(d.getVar("DEPLOY_DIR_IPK"), 'ipk.lock')
+    lf = bb.utils.lockfile(ipk_index_lock, shared=True)
+
     bb.build.exec_func("read_subpackage_metadata", d)
     bb.build.exec_func("do_package_ipk", d)
+
+    bb.utils.unlockfile(lf)
 }
 do_package_write_ipk[dirs] = "${PKGWRITEDIRIPK}"
 do_package_write_ipk[cleandirs] = "${PKGWRITEDIRIPK}"
diff --git a/meta/lib/oe/package_manager/ipk/__init__.py b/meta/lib/oe/package_manager/ipk/__init__.py
index 4cd3963111..c40dd3890d 100644
--- a/meta/lib/oe/package_manager/ipk/__init__.py
+++ b/meta/lib/oe/package_manager/ipk/__init__.py
@@ -48,7 +48,10 @@ class OpkgIndexer(Indexer):
             bb.note("There are no packages in %s!" % self.deploy_dir)
             return
 
+        ipk_index_lock = os.path.join(self.d.getVar("DEPLOY_DIR_IPK"), 'ipk.lock')
+        lf = bb.utils.lockfile(ipk_index_lock, shared=False)
         oe.utils.multiprocess_launch(create_index, index_cmds, self.d)
+        bb.utils.unlockfile(lf)
 
         if signer:
             feed_sig_type = self.d.getVar('PACKAGE_FEED_GPG_SIGNATURE_TYPE')
-- 
2.31.1

