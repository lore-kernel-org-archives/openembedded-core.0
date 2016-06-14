Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id 325DA6010D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jun 2016 07:59:50 +0000 (UTC)
Received: by mail-wm0-f49.google.com with SMTP id k204so110459537wmk.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jun 2016 00:59:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=9q0A7M+so4A4FxrF8omPQJmPplysyWQsLBB/47VlCj0=;
	b=n7zGgGCST3ihhjHtgQHxopfbvgvlZ+/p9KCKkfYWBjwHxrcUuzfJkuNiWC33oWUqSb
	lIG6AmpnGn0WQ0Lu7vjnL70oaKi11VfoRGqD0KVbJ+TAwRG4izp9eSKO7rk7ehi/4byU
	eSGrxkeJHwIdowPO/kvBw8LkxUnaRLJjNqm1Qj6G6kouEH/Ynes6xvj0x8yC1CeKb0X3
	k3hR9ry0ODhOuv6tHdLUENpBJB0AJJnAp0i4F/XDzTSO1ugKvKNN1+CguL4kEzwvfvtr
	RkmR5RJbSqpQhDopOY2+ToZx/QsTTqQioJsyTktOO3tpmSAg4xie/2eyy/ZdK5AUSzGi
	Xduw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=9q0A7M+so4A4FxrF8omPQJmPplysyWQsLBB/47VlCj0=;
	b=YRtgotbGgMR62XHveGVw/O1C7AtDLX8DdPmiei3Hd8cziJIOKDjzPtjIhEmUNw8/06
	AfUMKJEGo+z5D/JxgJv3MXJEKitKMzz5xJwKPwmKFUoKT/MYmS6rVS3QDriA45hSNa3+
	cU+0srTnbBLfLHfMw56ysuuONuPo4aIIpMXfBwQ38VYRUEbQOV8ZVNWCUoXp8rsuGNJd
	UTVK9DDr/zzPxNm8R6eCZms9jqQ/XI7dEwAgzqzXyZZM1nkj5nBUgKKts65w1MXV2Mnw
	lXmpzEWZCTC8dill/dyS5h8DMR5AowphIxb70xXdqHuiPltmgSPwbgeKWp5BzUG1+wMq
	A7Nw==
X-Gm-Message-State: ALyK8tJAhV+tidykTdawKmg7qkHqBXmZ0yVbM3RzHRr/boUuGlkWQL5XteXKPMd4+sdWfdGN
X-Received: by 10.194.94.165 with SMTP id dd5mr4742368wjb.31.1465891190655;
	Tue, 14 Jun 2016 00:59:50 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	e133sm2730425wma.6.2016.06.14.00.59.49
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 14 Jun 2016 00:59:50 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Jun 2016 08:59:38 +0100
Message-Id: <1465891179-20779-3-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.0.rc3
In-Reply-To: <1465891179-20779-1-git-send-email-ross.burton@intel.com>
References: <1465891179-20779-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 3/4] classes/kernel: remove path assumptions in compile_kernelmodules
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
X-List-Received-Date: Tue, 14 Jun 2016 07:59:50 -0000

do_compile_kernelmodules was assuming that the current directory was ${B} but
didn't make that explicit, so use an absolute path to ensure this always works.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/kernel.bbclass | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index dcf8bae..59bbbe8 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -291,7 +291,7 @@ do_compile_kernelmodules() {
 		# external kernel modules has a dependency on
 		# other kernel modules and will look at this
 		# file to do symbol lookups
-		cp Module.symvers ${STAGING_KERNEL_BUILDDIR}/
+		cp ${B}/Module.symvers ${STAGING_KERNEL_BUILDDIR}/
 	else
 		bbnote "no modules to compile"
 	fi
@@ -598,4 +598,3 @@ do_deploy[prefuncs] += "package_get_auto_pr"
 addtask deploy after do_populate_sysroot
 
 EXPORT_FUNCTIONS do_deploy
-
-- 
2.8.0.rc3


