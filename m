Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 0A2BE7FA29
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jan 2020 14:00:22 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id p17so13874064wmb.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jan 2020 06:00:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Ukb2YLdv0sKxiiagkW1doC4vQVqmeBq2nllO3mR2VSc=;
	b=F91qJbhBU7+zAVazR2toFZOkcRTV8lrYorEtUuHKyWkIUeKxI0PLFaO5ZuBfi8y0uB
	raNLinTfCX7n0paSJCzpZmw+xdkBAiRMr/g0pmEqqaMCCIV5cU5wxBQJQ+gFfgdURd5d
	246BPTGmMJNsDnBUX+vyA5or4/yTuXq7X2kp8Ei1MKXqHA3/D1AuljEK6qhMSLt1PyiF
	m6VCx1capr3dz1U2MrfacaJzC2JTx+cXvK+STW54btibHaJlEYS0Ho7t84SoK9jQK/rI
	34XcmEkorf5T/T3NIJFWp47nW/EsKHbv7gRcTVawAXYRlSdImtqdnzlq6P/rm09cBBte
	Xc2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Ukb2YLdv0sKxiiagkW1doC4vQVqmeBq2nllO3mR2VSc=;
	b=BR2PVc/jiKuGCUWnk7Ton0aGlvsaVEEIIX288rf8nJFYXkeUlUE2b7/KxWo8W23MZW
	LoeYMWx69mV79/5eINUjMiuncxVMtcyjCt0YaDoDFQePibKUTNw2UQsnxZ1iQxJxIFip
	Pmb0mwuN0CtxHzQXWPWbnhPyryqhCoAyxPitiKSSuDd6ZbToyKTZpuGloqT5WSvL+QUP
	fUTYfgr0L9RZVFqAKHCQbWOFGR5vh0HdxK8EmOkEMbJJrtjohQ1FJem33cVDq878U9hW
	mbzV8K+kTV7fIoy58bwNmLnX+ai6A+bsvV0cwr2Ix+yuiEp+dc+0mzFLF4M4Hil3WnUw
	LOGQ==
X-Gm-Message-State: APjAAAU3jdp6xUCINe8aSfLAJwRoa+9TqtmP/hoOhkZd8nYyVEFUg+Q5
	qanOk2WVMQ/niGe96c2sdhHYQRRk
X-Google-Smtp-Source: APXvYqwArYCCfiiqbaTb24m8MBPyCuN66xCT0HPdBaE88KYg2BGkdqExIWpYgwIfbYPT58A3ox66pw==
X-Received: by 2002:a05:600c:2150:: with SMTP id
	v16mr25266889wml.156.1579010423594; 
	Tue, 14 Jan 2020 06:00:23 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id
	r62sm20147333wma.32.2020.01.14.06.00.22
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 14 Jan 2020 06:00:23 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Jan 2020 14:59:59 +0100
Message-Id: <20200114140007.36622-12-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200114140007.36622-1-alex.kanavin@gmail.com>
References: <20200114140007.36622-1-alex.kanavin@gmail.com>
Subject: [PATCH 12/20] busybox: fix failing ptests
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 14 Jan 2020 14:00:23 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-core/busybox/busybox.inc     | 2 ++
 meta/recipes-core/busybox/files/run-ptest | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
index bf6ddae7d19..391e4fd1639 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -354,6 +354,8 @@ PTEST_BINDIR = "1"
 
 do_install_ptest () {
 	cp -r ${B}/testsuite ${D}${PTEST_PATH}/
+        # These access the internet which is not guaranteed to work on machines running the tests
+        rm -rf ${D}${PTEST_PATH}/testsuite/wget
 	cp ${B}/.config      ${D}${PTEST_PATH}/
 	ln -s /bin/busybox   ${D}${PTEST_PATH}/busybox
 }
diff --git a/meta/recipes-core/busybox/files/run-ptest b/meta/recipes-core/busybox/files/run-ptest
index b19e5b5343f..76873c9de20 100644
--- a/meta/recipes-core/busybox/files/run-ptest
+++ b/meta/recipes-core/busybox/files/run-ptest
@@ -6,4 +6,4 @@ export PATH=$bindir/bin:$PATH
 export SKIP_KNOWN_BUGS=1
 
 cd testsuite || exit 1
-./runtest -v | sed -r 's/^(SKIPPED|UNTESTED):/SKIP:/'
+LANG=C.UTF-8 ./runtest -v | sed -r 's/^(SKIPPED|UNTESTED):/SKIP:/'
-- 
2.17.1


