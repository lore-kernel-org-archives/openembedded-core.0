Return-Path: <oo.hehir@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03DB4CCF2C1
	for <webhook@archiver.kernel.org>; Sat, 17 Oct 2026 11:24:12 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4551.1792236247667242852
 for <openembedded-core@lists.openembedded.org>;
 Sat, 17 Oct 2026 04:24:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=fqp6hS07;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: oo.hehir@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48bbb06e746so259294f8f.3
        for <openembedded-core@lists.openembedded.org>; Sat, 17 Oct 2026 04:24:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792236246; x=1792841046; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/BF+9YdgVuVGGQmqK7xBNjT7eWZ5bieUhL4IvN73BLw=;
        b=fqp6hS07lWRAfYOus5/35WfcmMe/FuVFIwEV3543qcE/AN0ceYHiwjcH6xDOsSHaOh
         SBydsrZYBDF+cWXlKinSJz7SYfk5NUzs9GkP9JlRLz6qkWkbkWjRQhatM2S17UPPAQy/
         IObAV7LLYJVydyHLCJPSiUmBRcCzyz0C2l6zrv+rLVrfNSZb1vKeR6YfAhAyRzSugT/5
         qfF2qkngIRVf3FjXnGEJLkNuOE6gnXZ7XOXqwmo9SNboWSHSKcCvpXsYNWoye42IstCv
         x2ESslgEYuFFdSBLIWL64kYW4AUxdD5m+QFPbMNiaNhkI381O2cYjKipp8rKp/HUIuBe
         Vj0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792236246; x=1792841046;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/BF+9YdgVuVGGQmqK7xBNjT7eWZ5bieUhL4IvN73BLw=;
        b=pm4apWRo7dWXj+ULqALmHxH62oZV5fXHEZqWHZWK+EddBgD3az4//VEehm/zqkv7to
         pjzsRp9SrzC/Lz3q6By271z5qfBankwCF0SHf//Y2Yq2fYlwSeil2VQTvFSJvbibS6bc
         Q0ApCKMUHP0zJnCr3064MmA2p7paVlhyyBjgCVfMKSSLxMVH+7DNkxi+mHYhfu0SmyCG
         pTcrdK5T1hmfZapv6jCZMlfYBOIsubhsAd5Vu7FPgypKVH7NW5yNL3tUUQMBv4wWIHi2
         ddcnTv8oK96QUoKfC9B9KrVSbc5sOAoMrCPvUJ7pdq0+VDTx0Xt5lybajwt2zOx8Md0a
         7txA==
X-Gm-Message-State: AFq9FYKw4sY/aDJj3A18P2gxHxE9XQNYGFrZH5N3MRU29Oqar+fsmMxk
	OAREBLyKjNnKxl+I0i8EMPPcoDAgw0RZ6rTAOvmimvrbLg9gZVq5BNPPbR7oVZLi
X-Gm-Gg: AYBFou14ky3rgpxU6Z4L4oLBYOOU68SPJinJz7Bj7zPodsact9txYA5I7f5Ri4pTa/2
	Hk34+7g0s9yPEsryRAqYTLbH2GqBA8mAJZNIrTei4sZaRg45S6TkV0UWI5fZEE5YHYTCfZuCthY
	HHeSTdsDN26M3SA6WuwoQhB0i5IDBUDG5db3puRIVnZWyicVl0Kil4ksLizy04oPpuY2MiLmyCB
	D/EdiY2dW3/eAZ+xCSVdPP2rKSvJg8Yt2Ab2fs5x0E4g/9aF58Pt0XR7hs70LPfNATUFKNaEo58
	6jU7N8+n/yVs3tuyRnEzc3+c0gk1b85uUA8ptTWI3nEQsgkPdq+10f0qoV5ipV/D+vEPsT5qRKD
	Ak85GwLdNBCMBuMEE7bMJlW5ifKKqoqvsVnl6D0jpIKK+AkO4Dhcqg9ef3Vk0TLLoNe83qnp9ll
	ba3edNUH5z1sET8cAiMMlazM5whgML/coe66mvra8vCgyp4hlwjgfcbMAPtdpgFYOEdHF0WjVrU
	lV1
X-Received: by 2002:a05:6000:4029:b0:48a:f404:695e with SMTP id ffacd0b85a97d-48e07fa1eb9mr3788604f8f.50.1792236245723;
        Sat, 17 Oct 2026 04:24:05 -0700 (PDT)
Received: from hp-z640.fritz.box ([109.77.135.214])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd471877sm9140287f8f.1.2026.10.17.04.24.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 04:24:04 -0700 (PDT)
From: OOHehir <oo.hehir@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: raj.khem@gmail.com,
	tgamblin@baylibre.com,
	mathieu.dubois-briand@bootlin.com,
	OOHehir <oo.hehir@gmail.com>
Subject: [PATCH v2 1/8] strace: skip qual_fault-syscall.test on riscv64
Date: Sat, 17 Oct 2026 12:23:50 +0100
Message-ID: <20261017112358.77434-2-oo.hehir@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261017112358.77434-1-oo.hehir@gmail.com>
References: <20261016204547.2328847-1-oo.hehir@gmail.com>
 <20261017112358.77434-1-oo.hehir@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 17 Oct 2026 11:24:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248080

On qemuriscv64, the strace ptest goes 283 s without output while
qual_fault-syscall.test finishes. That is 63% of the 450 s ptest-runner
limit, leaving little margin on a loaded autobuilder, so skip it there
before strace is re-enabled for riscv64.

The longest gaps between outputs in core-image-ptest-strace on
qemuriscv64 (make -j4, every output line timestamped), with the test
that ended each:

- qual_fault-syscall.test (283 s)
- filtering_syscall-syntax.test (139 s)
- trace_creds.gen.test (90 s)
- strace--tips-full.test (65 s)

The rest are under 50 s.

strace is not machine-specific, so the skip is keyed on riscv64, as the
gnutls skips in cc848c403a are. It therefore also applies to riscv64
hardware, where the test passes (VisionFive 2).

Signed-off-by: OOHehir <oo.hehir@gmail.com>
---
 meta/recipes-devtools/strace/strace_7.2.bb | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/meta/recipes-devtools/strace/strace_7.2.bb b/meta/recipes-devtools/strace/strace_7.2.bb
index 451ffa6f88..3f7aaab3e6 100644
--- a/meta/recipes-devtools/strace/strace_7.2.bb
+++ b/meta/recipes-devtools/strace/strace_7.2.bb
@@ -57,6 +57,18 @@ do_install_ptest() {
 	    -i ${D}/${PTEST_PATH}/${TESTDIR}/Makefile
 }
 
+# Too long without output for ptest-runner on qemuriscv64. Keyed on riscv64, as
+# strace is not machine-specific, so also skipped on riscv64 hardware.
+STRACE_PTEST_SKIP ?= ""
+STRACE_PTEST_SKIP:riscv64 = "qual_fault-syscall"
+
+do_install_ptest:append() {
+	for t in ${STRACE_PTEST_SKIP}; do
+		sed -i -e '1a . "${srcdir=.}/init.sh"\nskip_ "Too slow under QEMU on riscv64"' \
+		    ${D}${PTEST_PATH}/${TESTDIR}/$t.test
+	done
+}
+
 RDEPENDS:${PN}-ptest += "make coreutils grep gawk sed locale-base-en-us"
 
 BBCLASSEXTEND = "native"
-- 
2.43.0


