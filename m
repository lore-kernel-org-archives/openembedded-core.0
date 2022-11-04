Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93DF8C4332F
	for <webhook@archiver.kernel.org>; Fri,  4 Nov 2022 03:02:27 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web12.7140.1667530938497442460
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Nov 2022 20:02:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=TpRzXaoV;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.49, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f49.google.com with SMTP id b11so3411499pjp.2
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Nov 2022 20:02:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v+ZzJl/nLBtkRuvpLOs5Vv+hL0fkEfFMhLJUOcxsC20=;
        b=TpRzXaoVYbR1rPdvNRqyHQFhObQDseBR+ssL+8Mp+XjgaO650GeYJIk42FeSKVwMeE
         iVeuiq+3/ampLq7VcX+zkxtaW67PkzivPDzjoesqOhZooYRwO+osiWgs2nuNT9rhsytL
         wUi9nMMs2ArdNXYmitbv5G9TdD1RO0VvEzHI4bSnRRrEWORfFgifrXMjakDJra1dGQ5p
         u2K0/138Mz5B4RyTwkO8s2Y4XJCm/PyFppZnG48aPeqFBLZMURMUJlIPus8BpMPOrPA/
         1bgLXC5sHxeaEqmYtA1OkKzo1vcPFLTypVWW7oR/lEEqKnDU9nvjp1NHGFnQmebpBAsl
         q9gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v+ZzJl/nLBtkRuvpLOs5Vv+hL0fkEfFMhLJUOcxsC20=;
        b=VFfBr9ksdc1Ph9e59+TfMRpdmL0aklBWDIPTuviy8bcX6+SE8URLLZx+NFkHBRj8+C
         /rnCb0+q3FEJKn9Btn5TzOBv7KgcHz/UXi3Phz4/bHzHy3G2fvamx2+dVOPXhqW0DKKV
         Pv5gnvlzCXTpuuP9LCAslBTEIQz6UrWRW69pzyLMfgWN+nYdNcXYWCKh+FSxD+EaFbtN
         Z/6lBgp3kOKLr7Ig+qsscIu0bqB9BYuUbz9oUIGW5yYXmaETp/m/5oj95eoKmMkcXmpZ
         /PhHYlWdqGhNligvEH8jVPHdQx/gT90xgeh8tuhRh0I9KxHZ+i2jdh78DLKEqQa0RdAz
         1Ctw==
X-Gm-Message-State: ACrzQf0KB/Yvmo5QBNKLJwswNBSqI87s68SriQbuA2WacS+I67LBFv2W
	JSHwvLtO1t/tFfT+JOds3+FBwf0i8vUYZlUC
X-Google-Smtp-Source: AMsMyM5QaFYEtui0z8R3/GFNZjKaKgEQ9HIPk9EJfUa4cFFFbD/E5fHdlVcE/Epx2U24VhoHm1YiRQ==
X-Received: by 2002:a17:902:ef43:b0:186:99be:2ee9 with SMTP id e3-20020a170902ef4300b0018699be2ee9mr33296319plx.148.1667530937516;
        Thu, 03 Nov 2022 20:02:17 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id r7-20020a17090a454700b0020b7de675a4sm667902pjm.41.2022.11.03.20.02.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Nov 2022 20:02:17 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 30/31] ltp: backport clock_gettime04 fix from upstream
Date: Thu,  3 Nov 2022 17:01:05 -1000
Message-Id: <f5d737a02a41ccfd040367228c85e438b59d63ab.1667530733.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1667530733.git.steve@sakoman.com>
References: <cover.1667530733.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Nov 2022 03:02:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172691

From: Xiangyu Chen <xiangyu.chen@windriver.com>

This is to get rid of the intermittent failures in clock_gettime04,
which are likely caused by different clock tick rates on platforms.
Here give two thresholds (in milliseconds) for comparison, one for
COARSE clock and one for the rest.

Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...set-threshold-based-on-the-clock-res.patch | 89 +++++++++++++++++++
 meta/recipes-extended/ltp/ltp_20220121.bb     |  1 +
 2 files changed, 90 insertions(+)
 create mode 100644 meta/recipes-extended/ltp/ltp/0001-clock_gettime04-set-threshold-based-on-the-clock-res.patch

diff --git a/meta/recipes-extended/ltp/ltp/0001-clock_gettime04-set-threshold-based-on-the-clock-res.patch b/meta/recipes-extended/ltp/ltp/0001-clock_gettime04-set-threshold-based-on-the-clock-res.patch
new file mode 100644
index 0000000000..b4879221ad
--- /dev/null
+++ b/meta/recipes-extended/ltp/ltp/0001-clock_gettime04-set-threshold-based-on-the-clock-res.patch
@@ -0,0 +1,89 @@
+From 9851deb86ef257a98d7433280161d8ca685aa669 Mon Sep 17 00:00:00 2001
+From: Li Wang <liwang@redhat.com>
+Date: Tue, 29 Mar 2022 13:03:51 +0800
+Subject: [PATCH] clock_gettime04: set threshold based on the clock resolution
+
+This is to get rid of the intermittent failures in clock_gettime04,
+which are likely caused by different clock tick rates on platforms.
+Here give two thresholds (in milliseconds) for comparison, one for
+COARSE clock and one for the rest.
+
+Error log:
+  clock_gettime04.c:163: TFAIL: CLOCK_REALTIME_COARSE(syscall with old kernel spec):
+        Difference between successive readings greater than 5 ms (1): 10
+  clock_gettime04.c:163: TFAIL: CLOCK_MONOTONIC_COARSE(vDSO with old kernel spec):
+	Difference between successive readings greater than 5 ms (2): 10
+
+From Waiman Long:
+  That failure happens for CLOCK_REALTIME_COARSE which is a faster but less
+  precise version of CLOCK_REALTIME. The time resolution is actually a clock
+  tick. Since arm64 has a HZ rate of 100. That means each tick is 10ms. So a
+  CLOCK_REALTIME_COARSE threshold of 5ms is probably not enough. I would say
+  in the case of CLOCK_REALTIME_COARSE, we have to increase the threshold based
+  on the clock tick rate of the system. This is more a test failure than is
+  an inherent problem in the kernel.
+
+Fixes #898
+
+Upstream-Status: Backport
+[https://github.com/linux-test-project/ltp/commit/9851deb86ef257a98d7433280161d8ca685aa669]
+
+Reported-by: Eirik Fuller <efuller@redhat.com>
+Signed-off-by: Li Wang <liwang@redhat.com>
+Cc: Waiman Long <llong@redhat.com>
+Cc: Viresh Kumar <viresh.kumar@linaro.org>
+Reviewed-by: Cyril Hrubis <chrubis@suse.cz>
+Acked-by: Waiman Long <longman@redhat.com>
+Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
+---
+ .../syscalls/clock_gettime/clock_gettime04.c   | 18 ++++++++++++++++--
+ 1 file changed, 16 insertions(+), 2 deletions(-)
+
+diff --git a/testcases/kernel/syscalls/clock_gettime/clock_gettime04.c b/testcases/kernel/syscalls/clock_gettime/clock_gettime04.c
+index a8d2c5b38..c279da79e 100644
+--- a/testcases/kernel/syscalls/clock_gettime/clock_gettime04.c
++++ b/testcases/kernel/syscalls/clock_gettime/clock_gettime04.c
+@@ -35,7 +35,7 @@ clockid_t clks[] = {
+ };
+ 
+ static gettime_t ptr_vdso_gettime, ptr_vdso_gettime64;
+-static long long delta = 5;
++static long long delta, precise_delta, coarse_delta;
+ 
+ static inline int do_vdso_gettime(gettime_t vdso, clockid_t clk_id, void *ts)
+ {
+@@ -92,9 +92,18 @@ static struct time64_variants variants[] = {
+ 
+ static void setup(void)
+ {
++	struct timespec res;
++
++	clock_getres(CLOCK_REALTIME, &res);
++	precise_delta = 5 + res.tv_nsec / 1000000;
++
++	clock_getres(CLOCK_REALTIME_COARSE, &res);
++	coarse_delta = 5 + res.tv_nsec / 1000000;
++
+ 	if (tst_is_virt(VIRT_ANY)) {
+ 		tst_res(TINFO, "Running in a virtual machine, multiply the delta by 10.");
+-		delta *= 10;
++		precise_delta *= 10;
++		coarse_delta *= 10;
+ 	}
+ 
+ 	find_clock_gettime_vdso(&ptr_vdso_gettime, &ptr_vdso_gettime64);
+@@ -108,6 +117,11 @@ static void run(unsigned int i)
+ 	int count = 10000, ret;
+ 	unsigned int j;
+ 
++	if (clks[i] == CLOCK_REALTIME_COARSE || clks[i] == CLOCK_MONOTONIC_COARSE)
++		delta = coarse_delta;
++	else
++		delta = precise_delta;
++
+ 	do {
+ 		for (j = 0; j < ARRAY_SIZE(variants); j++) {
+ 			/* Refresh time in start */
+-- 
+2.34.1
+
diff --git a/meta/recipes-extended/ltp/ltp_20220121.bb b/meta/recipes-extended/ltp/ltp_20220121.bb
index 4ae54492f3..51e8db4f1e 100644
--- a/meta/recipes-extended/ltp/ltp_20220121.bb
+++ b/meta/recipes-extended/ltp/ltp_20220121.bb
@@ -29,6 +29,7 @@ SRC_URI = "git://github.com/linux-test-project/ltp.git;branch=master;protocol=ht
            file://0001-metadata-parse.sh-sort-filelist-for-reproducibility.patch \
            file://disable_hanging_tests.patch \
            file://0001-syscalls-pread02-extend-buffer-to-avoid-glibc-overflow-detection.patch \
+           file://0001-clock_gettime04-set-threshold-based-on-the-clock-res.patch \
            "
 
 S = "${WORKDIR}/git"
-- 
2.25.1


