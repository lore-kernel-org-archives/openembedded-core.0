Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2552CDE005
	for <webhook@archiver.kernel.org>; Tue, 23 Jun 2026 13:14:47 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20450.1782220477538984815
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jun 2026 06:14:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=szrRbfA5;
 spf=pass (domain: smile.fr, ip: 209.85.221.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-4629051c9d1so3789142f8f.2
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2026 06:14:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1782220476; x=1782825276; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2O9T1NtPpGo9tEjHqNOh/jIePn3GjMVmOxL8ryjK/jI=;
        b=szrRbfA5iRMX0qbl5h4NpLxgClr/1mcFMWUPy6GcmE2h0qx/zkxtRkUUl/n4/PSsLK
         jTLjwT+kE6LM8TEv4xg09LZDAYUrWUrMsY0fydfl6pbmApIEPlK9Qs8NPpc8f6Z3jeJB
         ZNt63ZilaDdvk85V+2k0C0eGEDpKnjgYWf7HA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782220476; x=1782825276;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2O9T1NtPpGo9tEjHqNOh/jIePn3GjMVmOxL8ryjK/jI=;
        b=HwRE9nchj780SCo9Ma/4I+b5yFw3+bpvmej6EKx1Umcl54zhqsfJCwerl/ybrVEWKH
         Xh/B+2WOMmYwlggGaoa+0vWBqmIW7Shkgyx7ALCnDJtNclApt1wuvmw6BRgni+AU87uJ
         Nmb8LGfK1UKHECVTjTQiJsKIA0wqNnB5/LSMig9J/1ZYIw0nGmot+oGsWTGfWpE/UOma
         sN6YzbN4+SSeXg84bG5rWdt0spBgQTUvnG+Y8HmoZlMSe9k+/WEf3/qBN+0ve7ZnjW4o
         Ufr6YofAKvvAMnRth5BOcmf6PrM9iIK1na942AnS2ATZvzblMo5nfd17txkcCUQOnrly
         +fSA==
X-Gm-Message-State: AOJu0YyOG7F2+u/q9jLsBy5XyCBMB0fEoBwaSqKLBlnnCTSC9FPqc3TI
	Bz+o5W3bK1cRynD5u6pqiNUp8HaidSyXiulM2C1krV3BZFv5oUCvp3TdS2GJ3DT8rhx48Wl6OJ+
	eClHE
X-Gm-Gg: AfdE7cmTTfHHYII6dBfTOFY3IwO/IN8V7+lbM8aX6R0Vg628HhXeIe6Gg4SfNdtY+In
	+a6tsBaIrm3J/KZ0OcJRmMxFIu9E2wOS9+NyPR+4BSmwaTjTGfPnQJQ+AHEBEJBIP90EF9uvNRx
	b1LfOaenA+2vTSK3l+gIZo8aLoIKBcnAaJmYvWTnqlOZYxsDmQ6JQybA+cfUfgWpSMsKEMrCSkB
	bD2o3wCU0/i29zL4Y19CK37boEas33HPbipYgFHKIFUzdi4VEIvIqauH1EistLQY1Zz54yIPdRP
	cU2APLU2z/aS3FSiAzzepCj2PCkGaDKanr3trLUzSzSKqA926eJaPuw4dxEO+YfqFPdsLO3bznq
	3byDvUIzj2+Owm7JOzR2VQDeLZelpaxIlg+Oia9gx6S/ztxoJao3wt9zE2rKVrAk9mp0LaZ7kvi
	TuTZXcVLf/O0+I3YeBPlhmeatKmYJlrA7fiPqJSHNPjMmEYq4+rQGBClZG2/yAF+RObDU5sQRX5
	gLt/F8LHKIAXE5QCw==
X-Received: by 2002:a05:600c:2054:b0:492:3754:15f2 with SMTP id 5b1f17b1804b1-49240ea86b3mr222727125e9.32.1782220475518;
        Tue, 23 Jun 2026 06:14:35 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa008234f3c115adbb1a.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:8234:f3c1:15ad:bb1a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4925d013a69sm24334285e9.3.2026.06.23.06.14.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 06:14:34 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 13/26] dpkg: Fix CVE-2026-2219
Date: Tue, 23 Jun 2026 15:13:54 +0200
Message-ID: <66055d7f179d0d838c2139d9d2399a968c6f6529.1782220259.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1782220259.git.yoann.congal@smile.fr>
References: <cover.1782220259.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2026 13:14:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239379

From: Shubham Pushpkar <spushpka@cisco.com>

This patch applies the upstream fix as referenced in [2], using the
commit shown in [1].

[1] https://git.dpkg.org/cgit/dpkg/dpkg.git/commit/?id=6610297a62c0780dd0e80b0e302ef64fdcc9d313
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-2219

Signed-off-by: Shubham Pushpkar <spushpka@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../dpkg/dpkg/CVE-2026-2219.patch             | 47 +++++++++++++++++++
 meta/recipes-devtools/dpkg/dpkg_1.22.0.bb     |  1 +
 2 files changed, 48 insertions(+)
 create mode 100644 meta/recipes-devtools/dpkg/dpkg/CVE-2026-2219.patch

diff --git a/meta/recipes-devtools/dpkg/dpkg/CVE-2026-2219.patch b/meta/recipes-devtools/dpkg/dpkg/CVE-2026-2219.patch
new file mode 100644
index 00000000000..779ab924de6
--- /dev/null
+++ b/meta/recipes-devtools/dpkg/dpkg/CVE-2026-2219.patch
@@ -0,0 +1,47 @@
+From 6610297a62c0780dd0e80b0e302ef64fdcc9d313 Mon Sep 17 00:00:00 2001
+From: Guillem Jover <guillem@debian.org>
+Date: Sat, 7 Feb 2026 00:57:55 +0100
+Subject: [PATCH] libdpkg: Terminate zstd decompression when we have no more
+ data
+
+We should be checking whether the input buffer is zero-sized, and then
+mark the stream as finished. Otherwise the zstd implementation does not
+detect that as an end of stream situation and we get stuck in an
+infinite loop spinning the CPU. This means the decompression process
+in dpkg-deb does not terminate, so no EPIPE gets generated and the
+other processes that are part of the unpacking do not stop either.
+
+Reported-by: Yashashree Gund <yash_gund@live.com>
+Fixes: commit 2c2f7066bd8c3209762762fa6905fa567b08ca5a
+Fixes: CVE-2026-2219
+Closes: #1129722
+Stable-Candidate: 1.21.x 1.22.x
+
+CVE: CVE-2026-2219
+Upstream-Status: Backport [https://git.dpkg.org/cgit/dpkg/dpkg.git/commit/?id=6610297a62c0780dd0e80b0e302ef64fdcc9d313]
+
+(cherry picked from commit 6610297a62c0780dd0e80b0e302ef64fdcc9d313)
+Signed-off-by: Shubham Pushpkar <spushpka@cisco.com>
+---
+ lib/dpkg/compress.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/lib/dpkg/compress.c b/lib/dpkg/compress.c
+index adf26ea7..bf73affe 100644
+--- a/lib/dpkg/compress.c
++++ b/lib/dpkg/compress.c
+@@ -1070,6 +1070,11 @@ filter_unzstd_code(struct io_zstd *io, struct io_zstd_stream *s)
+ 	ZSTD_outBuffer buf_out = { s->next_out, s->avail_out, 0 };
+ 	size_t ret;
+ 
++	if (buf_in.size == 0) {
++		s->status = DPKG_STREAM_END;
++		return;
++	}
++
+ 	ret = ZSTD_decompressStream(s->ctx.d, &buf_out, &buf_in);
+ 	if (ZSTD_isError(ret))
+ 		filter_zstd_error(io, ret);
+-- 
+2.35.6
+
diff --git a/meta/recipes-devtools/dpkg/dpkg_1.22.0.bb b/meta/recipes-devtools/dpkg/dpkg_1.22.0.bb
index 41f51235085..16162ca926f 100644
--- a/meta/recipes-devtools/dpkg/dpkg_1.22.0.bb
+++ b/meta/recipes-devtools/dpkg/dpkg_1.22.0.bb
@@ -15,6 +15,7 @@ SRC_URI = "git://salsa.debian.org/dpkg-team/dpkg.git;protocol=https;branch=main
            file://pager.patch \
            file://0001-Add-support-for-riscv32-CPU.patch \
            file://CVE-2025-6297.patch \
+           file://CVE-2026-2219.patch \
            "
 
 SRC_URI:append:class-native = " file://0001-build.c-ignore-return-of-1-from-tar-cf.patch"

