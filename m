Return-Path: <freseenzo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19AFEC88E77
	for <webhook@archiver.kernel.org>; Tue, 15 Sep 2026 22:17:55 +0000 (UTC)
Received: from mail-vs2-f20.google.com (mail-vs2-f20.google.com [74.125.227.20])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2130.1789510668918335476
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Sep 2026 15:17:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=XFe450YE;
 spf=pass (domain: gmail.com, ip: 74.125.227.20, mailfrom: freseenzo@gmail.com)
Received: by mail-vs2-f20.google.com with SMTP id 71dfb90a1353d-5c67e4fff62so99145e0c.2
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Sep 2026 15:17:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789510668; x=1790115468; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=A3EOU9VoEfbR22zjm9/uVn0mS5Eh01RsK7lXX3YvTtc=;
        b=XFe450YEvDpiPvNLG24VmZ76pTGI0gN3spFeOZXfPQtxC/u0kl/m0uoFxpjQHxKpOR
         MD8eoIiTxu/ib6kDN2n3KgTAA1uSnSqnodmfhhi7TwV7KulkRfA4AcLod6R2TKUDhKUv
         FcnIuWjfLp+FWIUQE6E8R39nN+8a5ywg/9AbGMsYUFUCOV6BQiWtVZwBK2LFXSp301dc
         Y7a3/LcBYBup5JWQ1q1snp6Hx1QVsbMXyYsPGSTJKKzE+y2ujNA0b9jWibxiCgC6oGD6
         FHAlSnnJJKI9sZNHVR5dbWtDc3ziCJiZfjI2Ol5RGOvVo+Z6lyVJQl0XgSECDIbWJD+N
         N4LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789510668; x=1790115468;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A3EOU9VoEfbR22zjm9/uVn0mS5Eh01RsK7lXX3YvTtc=;
        b=zO7/P6q03Vzw8S9LLLC7zXVSF3hhzlnLQ5xWXqsN4QX/7Mh80ZoyFr2d7Giue8Iqp8
         qtVhziXzjBsYghtkh9yy8IGsjY51Ysor1o+m900nQn69gtWA1dTT691HITg5dBc6FY1v
         5bCbBancoSHR+CpyjUjibTuXeKZvmHlREd0aSvl8QAT454p3b3a1T1c+oQgeLL/hkzem
         cmoLc/SJ61YI/YxW6A3+p9AJToX1ZNOfMNv3M9DLAB0yioB5wLE99pxJlPkGK0BxpNlh
         IyiKa1OoyFHYE7QfPicRUgsUcyeiNGhhbUGOUVrI4i5cBFkuj5pNmFnhlLaTmDwZksPj
         q/fg==
X-Gm-Message-State: AFuF++lqn0d7RsCN3T+hIBI5QI0QlJN4qfRJQ8w4EjDiZ6hRu4fjt8wn
	yHuxHCEDAqoT7PkqzLgCqR12SXiDqGoRgMFMu8owhYfqY8hMUI4cHdyQ3MtL7FtVtWLwBw==
X-Gm-Gg: AYBFou0FXGCVwZDT45ojokr8WyicrMvaZlkrXxwcE/OJ4z9SsciIe+M4OdOu9Io6le1
	IfbiUZ2YtldDXq51LU/VoNVh0S4imIemEylT3M2jRiXgHEbJLpoUug1kkAIV+46L2sMAlaTCV1O
	21fRFZgfn6Vd1FWzb0OpgaXTvSvL3pUA9sj0levzGPITVd9xIcja4wPHZfjJ3UsnH3MYMcCdEK3
	VnDeNDju8psrI3xlQv+vMvnHc0PeEGygbw4Zr668kTa5qu0OMnF2xpZ0+nFz+aTQBmGYb1MJOiY
	OD9HWvCie2/4zfsPprJrWDVH1o+xM0WBKJLXKN2N4Xvmmm1MwRsiMDqYQdeQAmTcgQP9p26lTPq
	HouaY0lSHuirGqg8sDT7EdJhezQtd1Hwr64Qj0VQxwEQeJXXvHo4AAjZRPxEpRtyqtFuzKaHanE
	NJqPm5DG5Zy+y2zhm0OTpcvptOfInsVAawgiG2i8nYB1nel0P3WKFPOIQtfo0t0G+R
X-Received: by 2002:a05:6102:c8d:b0:77a:d089:3dd8 with SMTP id ada2fe7eead31-7a02a00d1acmr572609137.12.1789510667634;
        Tue, 15 Sep 2026 15:17:47 -0700 (PDT)
Received: from frese.. ([189.60.169.129])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c9989fc476sm958741e0c.3.2026.09.15.15.17.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 15:17:47 -0700 (PDT)
From: Enzo Frese <freseenzo@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Enzo Frese <freseenzo@gmail.com>
Subject: [OE-core][PATCH] tar: skip sparse05 ptest which needs ~10 GiB of disk
Date: Tue, 15 Sep 2026 19:17:38 -0300
Message-ID: <20260915221738.2889201-1-freseenzo@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Sep 2026 22:17:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245909

The "listing sparse files bigger than 2^33 B" test (sparse05) generates
a file with 1000 data fragments of 10 MiB each, i.e. about 10 GiB of
real data, which cannot fit in the ptest image (1.4 GB rootfs).

Normally genfile fails with ENOSPC and the test is reported as skipped,
but the filesystem stays full until the test directory is cleaned up.
When the autotest bookkeeping (status files, mkdir for the next test
group) hits that window, the test is reported as FAIL and the next test
cannot even start, matching the intermittent autobuilder failure.

Skip sparse05 explicitly and print the available disk space at the
start of the run to make similar failures easier to diagnose.

Tested on qemux86-64 with musl: 200 tests passed, 46 skipped, 0 failed,
no ENOSPC errors.

[YOCTO #16419]

Signed-off-by: Enzo Frese <freseenzo@gmail.com>
---
 meta/recipes-extended/tar/tar/run-ptest | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/tar/tar/run-ptest b/meta/recipes-extended/tar/tar/run-ptest
index b4ccbbcb46..b5aa80ddab 100644
--- a/meta/recipes-extended/tar/tar/run-ptest
+++ b/meta/recipes-extended/tar/tar/run-ptest
@@ -5,4 +5,14 @@ cd @PTEST_PATH@/tests/
 # Clear old data
 rm -rf testsuite.dir testsuite.log
 
-./testsuite --am-fmt
+# Report free space: the sparse tests create multi-GB files and the
+# ptest image is small, so this helps diagnose ENOSPC failures.
+df -h .
+
+# sparse05 (listing sparse files bigger than 2^33 B) writes ~10 GiB of
+# real data (1000 fragments of 10 MiB each), which cannot fit in the
+# ptest image. When genfile hits ENOSPC the test is normally reported
+# as skipped, but the filesystem is left full for a moment and the
+# autotest bookkeeping (status files, mkdir of the next test group)
+# intermittently fails instead, taking the next test down with it.
+./testsuite --am-fmt -k '!sparse05'
-- 
2.43.0


