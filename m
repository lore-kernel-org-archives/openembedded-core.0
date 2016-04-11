Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f52.google.com (mail-wm0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id 30F606E682
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Apr 2016 20:43:37 +0000 (UTC)
Received: by mail-wm0-f52.google.com with SMTP id u206so1755958wme.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Apr 2016 13:43:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=fEcNB+qqaAKIEZ8OCp7mhP+35xXvmVdoG2N+ozDbVWU=;
	b=qJHE3X0KPuLl00KVdirAfo0cPGINphXKnQ7w5YKme3zQ4O9uYZDg5KzyypVlx2k0+E
	dvSzL4CQlTaKC67t56JpgRiKwGu2IbUNFmkcoHqGVUabbDlSCgvb3f/0fmvao24FS+Kz
	j4OP+iAUrOj+B6mditc57UvFYRRzLniHdpEnTYIAqr1YB+ng9g9bA6P4SAh1tgliHWnF
	TkPxjZl8fSqq2PE804tiLEa0noij8UbrqFLsH4zHiiIauzOelTlf2IsKi6N9x/NpPbtT
	fXdWnSxkJW3FKEiwTvTrvPxdcZDy0DVtlpCJNOJKqo0YOL2yNh6mGSRWVuNe7vgXt+dR
	errA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=fEcNB+qqaAKIEZ8OCp7mhP+35xXvmVdoG2N+ozDbVWU=;
	b=dNw3MYEeB5kpLJWdm7FikrIt4gSYbr0fxvsd3w9R5TsbAO6sLOk5rMaNg8hUls885z
	Spkkl/gAFGsVuT9QM049sthJx3jQ8W9R7doZ1L4eMmYeTszwSjqzB/IqQ2Xjwg8vHgac
	cVtoJek/pNfTdIUX7+OEAv45iVvrANqYuVetmmRMUnbucvSdpg7tiH9Wgn/ZFVulLUvW
	E5EQPBvOCd5erduGHrOeasn/8TgHph6XQDPldZyKe7V93PFLzWJzR+NASDquUARxpTx8
	/JHpMs37BXzVxrYlIDPlWLrb8YLPqk0zGtUwbzP50XfqcQw4Ad9Sj0N1HOq5QIyqEQP6
	jnZg==
X-Gm-Message-State: AOPr4FXNGmioNJWvyz/yn67INlIGFaOX5XWTTUNJD1+rKtGgXIpWxovar0OpnvZizheBjxSo
X-Received: by 10.28.93.85 with SMTP id r82mr22933wmb.77.1460407417960;
	Mon, 11 Apr 2016 13:43:37 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	cb2sm29733530wjc.16.2016.04.11.13.43.36
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 11 Apr 2016 13:43:37 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Apr 2016 21:43:34 +0100
Message-Id: <1460407414-16548-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.0.rc3
Subject: [PATCH] util-linux: take ownership of hwclock if installed
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
X-List-Received-Date: Mon, 11 Apr 2016 20:43:38 -0000

Previously util-linux had a lower priority for hwclock than busybox but the
reasoning was lost in the mists of time, with just this enigmatic comment
remaining:

    There seems to be problem, atleast on nslu2, with these, until they are
    fixed the busybox ones have higher priority.

Chasing the comment back through history it first appeared in the following
oe-classic commit:

    commit 5e01906b8433bc6a8c03be2e31758589641124c9
    Author: David Karlstrom <daka@thg.se>
    Date:   Sat Jul 23 13:36:38 2005 +0000

        Updated to use update-alternatives and fix some FHS bugs

Which doesn't really give a lot away.

Let's assume that in the past eleven years both hwclock and hardware have
improved, and restore util-linux's hwclock to it's intended priority.

[ YOCTO #9103 ]

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/util-linux/util-linux.inc | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index c2a91e1..a1614c2 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -132,7 +132,7 @@ SYSTEMD_AUTO_ENABLE_${PN}-fstrim = "disable"
 
 do_compile () {
 	set -e
-	oe_runmake ARCH=${TARGET_ARCH} CPU= CPUOPT= 'OPT=${CFLAGS}' 
+	oe_runmake ARCH=${TARGET_ARCH} CPU= CPUOPT= 'OPT=${CFLAGS}'
 }
 
 do_install () {
@@ -220,9 +220,6 @@ ALTERNATIVE_LINK_NAME[fsck.8] = "${mandir}/man8/fsck.8"
 ALTERNATIVE_LINK_NAME[uuid.3] = "${mandir}/man3/uuid.3"
 
 ALTERNATIVE_util-linux-hwclock = "hwclock"
-# There seems to be problem, atleast on nslu2, with these, untill they are
-# fixed the busybox ones have higher priority
-ALTERNATIVE_PRIORITY[hwclock] = "10"
 ALTERNATIVE_LINK_NAME[hwclock] = "${base_sbindir}/hwclock"
 
 ALTERNATIVE_util-linux-fdisk = "fdisk"
-- 
2.8.0.rc3


