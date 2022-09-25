Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29893C04A95
	for <webhook@archiver.kernel.org>; Sun, 25 Sep 2022 19:19:02 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web11.20284.1664133536775104685
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Sep 2022 12:18:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=Mpg2DtZn;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.42,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f42.google.com with SMTP id
 q15-20020a17090a304f00b002002ac83485so4927097pjl.0
        for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Sep 2022 12:18:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date;
        bh=kqER5/hRPTvewV3x4Y4F0lKbp6HBF9w1EtIV3Dtc+hk=;
        b=Mpg2DtZnDOHrvKtpjLiCGcxIYPFa7FRqBsvgx4o8sjM7iOKKvVB+7VFQrL8OC3svDh
         QbKXI2rtQYuYl2she65KP4svGwiwhy9FxkdWIUa1dI19OuugCTjXKQcmAe078VMH4ng+
         c1Roxdr2ncpLGN3ZY3H3KZgWWfnnJp8iYr+AjcgAZ3MOhZq8CziniLHDLsISiMluqwQS
         YygxGeMbEF0xH/KT6aMgYaj6BWzYjFBVMHmnJhrcsliZaiYNfbyjsIb3ge0RvxMkL/A8
         LHwBBtWcHjBbOHDR+z6Ht1ptA6bItUbj2QYEvipsKQHA0e/7hWDTS5rnKGLZHmaLE1vW
         uVWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=kqER5/hRPTvewV3x4Y4F0lKbp6HBF9w1EtIV3Dtc+hk=;
        b=YYYoxTNEcCnwopOvMVG54dhqtpRXuLkEX1gC1TcQ/TPa3MsiqbNUYFBnTe4e2yLON9
         Mb7UGP3e/5g/TTD9aoYzYniXw0XvtSiXEVT0iTE9pQE9tmfgjBUkSIa4rHbFJgR3qu+k
         pzvMQYdQKW7tHBx9n0tI/QZLbwpylunwY66fuUdFiNRmXYK/3Zia596IuniiHAwYYM/m
         nRNq7FSYohaTGuETsM7PZiRCvZqUidSATBGQp6+VEbmCbJXEBwV1tawzVj09fkPf/n+n
         x1O1n12XH+E9sRobSbCeHVzV4KYpdCSaDopeln+HCQxP0zTQ+ufk4I3UAphJXNgiKMUp
         aKAQ==
X-Gm-Message-State: ACrzQf3PQ+bJQ/BAcsfBDN+kvamnynWyJbeZ1Q4fa4SwnsGiJVW6O8Kh
	nIkBLu9uVo5fSX64WhP3RlbGTnUF7VFwHGo7
X-Google-Smtp-Source: 
 AMsMyM7exK9FhwowsihBgdpZfDl283/D9rp/PVqVbyh55B/SS5ahMLovtKyNX8xnV7zmO2GlE+i6eQ==
X-Received: by 2002:a17:90b:3010:b0:202:d36b:73db with SMTP id
 hg16-20020a17090b301000b00202d36b73dbmr21761092pjb.24.1664133535794;
        Sun, 25 Sep 2022 12:18:55 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 f126-20020a625184000000b0053651308a1csm10311257pfb.195.2022.09.25.12.18.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Sep 2022 12:18:55 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 29/33] ltp: Fix pread02 case trigger the glibc
 overflow detection
Date: Sun, 25 Sep 2022 09:17:40 -1000
Message-Id: 
 <2d32385490344db529de7eca33bb0ab9a14e0555.1664133309.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1664133308.git.steve@sakoman.com>
References: <cover.1664133308.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 25 Sep 2022 19:19:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171043

From: Xiangyu Chen <xiangyu.chen@windriver.com>

Backport a patch to fix the pread02 case trigger the glibc overflow
detection.

Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...er-to-avoid-glibc-overflow-detection.patch | 58 +++++++++++++++++++
 meta/recipes-extended/ltp/ltp_20220121.bb     |  1 +
 2 files changed, 59 insertions(+)
 create mode 100644 meta/recipes-extended/ltp/ltp/0001-syscalls-pread02-extend-buffer-to-avoid-glibc-overflow-detection.patch

diff --git a/meta/recipes-extended/ltp/ltp/0001-syscalls-pread02-extend-buffer-to-avoid-glibc-overflow-detection.patch b/meta/recipes-extended/ltp/ltp/0001-syscalls-pread02-extend-buffer-to-avoid-glibc-overflow-detection.patch
new file mode 100644
index 0000000000..94dd418f36
--- /dev/null
+++ b/meta/recipes-extended/ltp/ltp/0001-syscalls-pread02-extend-buffer-to-avoid-glibc-overflow-detection.patch
@@ -0,0 +1,58 @@
+From de988c9b5605a711b306c4203545b8d761875177 Mon Sep 17 00:00:00 2001
+From: Jan Stancek <jstancek@redhat.com>
+Date: Mon, 31 Jan 2022 12:00:46 +0100
+Subject: [PATCH] syscalls/pread02: extend buffer to avoid glibc overflow
+ detection
+
+Test started failing with recent glibc (glibc-2.34.9000-38.fc36),
+which detects that buffer in pread is potentially too small:
+  tst_test.c:1431: TINFO: Timeout per run is 0h 05m 00s
+  *** buffer overflow detected ***: terminated
+  tst_test.c:1484: TBROK: Test killed by SIGIOT/SIGABRT!
+
+(gdb) bt
+  #0  __pthread_kill_implementation at pthread_kill.c:44
+  #1  0x00007ffff7e46f73 in __pthread_kill_internal at pthread_kill.c:78
+  #2  0x00007ffff7df6a36 in __GI_raise at ../sysdeps/posix/raise.c:26
+  #3  0x00007ffff7de082f in __GI_abort () at abort.c:79
+  #4  0x00007ffff7e3b01e in __libc_message at ../sysdeps/posix/libc_fatal.c:155
+  #5  0x00007ffff7ed945a in __GI___fortify_fail at fortify_fail.c:26
+  #6  0x00007ffff7ed7dc6 in __GI___chk_fail () at chk_fail.c:28
+  #7  0x00007ffff7ed8214 in __pread_chk at pread_chk.c:26
+  #8  0x0000000000404d1a in pread at /usr/include/bits/unistd.h:74
+  #9  verify_pread (n=<optimized out>) at pread02.c:44
+  #10 0x000000000040dc19 in run_tests () at tst_test.c:1246
+  #11 testrun () at tst_test.c:1331
+  #12 fork_testrun () at tst_test.c:1462
+  #13 0x000000000040e9a1 in tst_run_tcases
+  #14 0x0000000000404bde in main
+
+Extend it to number of bytes we are trying to read from fd.
+
+Upstream-Status: Backport
+[https://github.com/linux-test-project/ltp/commit/de988c9b5605a711b306c4203545b8d761875177]
+
+Signed-off-by: Jan Stancek <jstancek@redhat.com>
+Acked-by: Petr Vorel <pvorel@suse.cz>
+Reviewed-by: Cyril Hrubis <chrubis@suse.cz>
+Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
+---
+ testcases/kernel/syscalls/pread/pread02.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/testcases/kernel/syscalls/pread/pread02.c b/testcases/kernel/syscalls/pread/pread02.c
+index de2a81fff..fda5fd190 100644
+--- a/testcases/kernel/syscalls/pread/pread02.c
++++ b/testcases/kernel/syscalls/pread/pread02.c
+@@ -39,7 +39,7 @@ struct test_case_t {
+ static void verify_pread(unsigned int n)
+ {
+ 	struct test_case_t *tc = &tcases[n];
+-	char buf;
++	char buf[K1];
+ 
+ 	TST_EXP_FAIL2(pread(*tc->fd, &buf, tc->nb, tc->offst), tc->exp_errno,
+ 		"pread(%d, %zu, %ld) %s", *tc->fd, tc->nb, tc->offst, tc->desc);
+-- 
+2.34.1
+
diff --git a/meta/recipes-extended/ltp/ltp_20220121.bb b/meta/recipes-extended/ltp/ltp_20220121.bb
index 8a13dcf9d0..4ae54492f3 100644
--- a/meta/recipes-extended/ltp/ltp_20220121.bb
+++ b/meta/recipes-extended/ltp/ltp_20220121.bb
@@ -28,6 +28,7 @@ SRC_URI = "git://github.com/linux-test-project/ltp.git;branch=master;protocol=ht
            file://0001-Remove-OOM-tests-from-runtest-mm.patch \
            file://0001-metadata-parse.sh-sort-filelist-for-reproducibility.patch \
            file://disable_hanging_tests.patch \
+           file://0001-syscalls-pread02-extend-buffer-to-avoid-glibc-overflow-detection.patch \
            "
 
 S = "${WORKDIR}/git"
-- 
2.25.1


