Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web09.179.1628626286713632903
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Aug 2021 13:11:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qtec.com header.s=google header.b=RkZUQtLG;
 spf=pass (domain: qtec.com, ip: 209.85.167.53, mailfrom: daniel@qtec.com)
Received: by mail-lf1-f53.google.com with SMTP id g13so256850lfj.12
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Aug 2021 13:11:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=qtec.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SupPFIDdCWJSpGrOfBWQ006+9KghbJ7rZFGg7Hl1bpw=;
        b=RkZUQtLGkyGn4/b4tBqx43K1K4fqOrMnQq8FvjYj58oBvuYHQ1jwHznfyy53YvINf+
         F9099SJCQ7jIhQjUGUHHTiFJ2qhd4n3RKHJSOPp1AUPDZQvoUSMWv+H4uzPVNOY9xTpK
         JlLJiIk6jN09G8nI6y3f4A7kx/ssBpL2SzMrJC6DejByLNmnx4n+9fgR3UNX9CSGGcHv
         DB/oH2eJFQCrSsNFuUN5PfeAZ7LTR4jawLTKW8pZJ5WVkRbusvL6xpHnKq7DQwuSSl6E
         UNwX9L/uS/9QlUPPJZkdsaNpeQElM7minNVbeOdllEaESo8u3RXGVAstYRcUvuOVNATQ
         ve3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SupPFIDdCWJSpGrOfBWQ006+9KghbJ7rZFGg7Hl1bpw=;
        b=ejXgXSo78iy7JL7733n2LlTRKi6d+X/wBqba+hfueaj27/pWyDGCezg6lS82Wg7HQk
         Ytqq7GxN96cuUjaRVOuwo8BXyRfKQ2xHOXg3CXUnOKS9LuBvvqX7APMdd4YAg7FZecX+
         0IHYLr9HMT0ENwnGHuhNDhcAPLlUcHu2VJdSOh7cQS5gvjCZhku7au59KwlizqeJl5GN
         z8EWVwovhPDp/GOIUfOrUxxHAQZnZB13IGJN5nGCcNLyWDUuXM/hNmCHfj+d33Ka6msT
         9RwsdP6NsKWf0ibMgmPvzx0jRE1WOP0sQldl5cSTkZoezOhTaI4m3L/Y3HLNdV68CJMk
         ND/Q==
X-Gm-Message-State: AOAM5335vMFnuJru+Vx9pqHyV1nAQq523vNTGe0TuWzglJOlPmPFzPrB
	5MlyIsHYfYEfW6g/b3kecKJDRtaf5ZUQ+KvAa5ssqsKyzuaJsh6+g+52VkCVjslxGI37EHFqEW4
	Xl7KDCzlEynhwYUKRL7TTVdp7pmF1mWjCPiPVVdfoyBnFnoerv0LFmZhTIWdjUvSDRshsKZQDpZ
	w1x2nn2/DIyvTvbgM=
X-Google-Smtp-Source: ABdhPJx/mkhqANPgICa0oWkQuqDHdsn78W4mARuBiwLh5o3Zozix+Qgs9+PO8jRK18thFaCxWWgprg==
X-Received: by 2002:a19:740c:: with SMTP id v12mr22192508lfe.519.1628626284873;
        Tue, 10 Aug 2021 13:11:24 -0700 (PDT)
Return-Path: <daniel@qtec.com>
Received: from localhost (87-52-47-7-cable.dk.customer.tdc.net. [87.52.47.7])
        by smtp.gmail.com with ESMTPSA id h20sm1973410ljh.138.2021.08.10.13.11.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Aug 2021 13:11:24 -0700 (PDT)
From: "Daniel Gomez" <daniel@qtec.com>
To: openembedded-core@lists.openembedded.org
Cc: dagmcr@gmail.com,
	paul@pbarker.dev,
	richard.purdie@linuxfoundation.org,
	Daniel Gomez <daniel@qtec.com>
Subject: [OE-core][PATCH v2 2/2] oeqa: wic: Add tests for --no-fstab-update
Date: Tue, 10 Aug 2021 22:11:01 +0200
Message-Id: <20210810201101.261132-2-daniel@qtec.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210810201101.261132-1-daniel@qtec.com>
References: <20210810201101.261132-1-daniel@qtec.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add tests for the --no-fstab-update wic part command.

Signed-off-by: Daniel Gomez <daniel@qtec.com>
---
 meta/lib/oeqa/selftest/cases/wic.py | 56 +++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest/cases/wic.py
index 2efbe514c1..a58360851a 100644
--- a/meta/lib/oeqa/selftest/cases/wic.py
+++ b/meta/lib/oeqa/selftest/cases/wic.py
@@ -11,6 +11,7 @@
 import os
 import sys
 import unittest
+import hashlib
 
 from glob import glob
 from shutil import rmtree, copy
@@ -686,6 +687,61 @@ part /etc --source rootfs --fstype=ext4 --change-directory=etc
                                       % (wks_file, self.resultdir), ignore_status=True).status)
         os.remove(wks_file)
 
+    def test_no_fstab_update(self):
+        """Test --no-fstab-update wks option."""
+
+        oldpath = os.environ['PATH']
+        os.environ['PATH'] = get_bb_var("PATH", "wic-tools")
+
+        # Get stock fstab from base-files recipe
+        bitbake('base-files')
+        bf_fstab = os.path.join(get_bb_var('WORKDIR', 'base-files'),'image/etc/fstab')
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
+            # '/etc/fstab' in partition 2 should contain the same stock fstab file at base-file recipe.
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

