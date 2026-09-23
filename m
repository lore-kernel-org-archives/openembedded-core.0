Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79B09C98311
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 20:52:17 +0000 (UTC)
Received: from mta-65-228.siemens.flowmailer.net (mta-65-228.siemens.flowmailer.net [185.136.65.228])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5434.1790196731681920878
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Sep 2026 13:52:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm1 header.b=IzQ0dzVB;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.228, mailfrom: fm-1329275-20260923205208b65689104300020756-tl6glk@rts-flowmailer.siemens.com)
Received: by mta-65-228.siemens.flowmailer.net with ESMTPSA id 20260923205208b65689104300020756
        for <openembedded-core@lists.openembedded.org>;
        Wed, 23 Sep 2026 22:52:09 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=MJoJnSdfrz84eoixY8D4JTmGgBWYopZF8s4s/5PYHDo=;
 b=IzQ0dzVBAmitjjXpMkBg0cfVsb2wGI0jBJo+jvJ/YvufpuI33vChg7E4IcLWCcB8duPf+o
 WKihiPXqrr+3ulxEsXCyHh+WDSbx0d/oM5fE8ESQlOKrFoeSyQUy9HrcyXOwQ0TKGhG3Q4lz
 8dxg+HTD1FRkzNadc9WC2zOrUgQd2f5xDnIRxlmSKAlGHVA7n5OkuMbdfbiY9A69FFIqzAu0
 aOZyhvFvLx6FXJ1H5aolOgNEK5zw1b9mk3sEUqJ6shD8Htlu5EBahv5wfPxgAgBjDRqTPkMe
 KBM9b3oi7pmfRvYuJ9ckfaUMhMgZLZxoSKxPT+886fGVSR+WcBKz7Bvg==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v2 2/3] core-image.bbclass: do not pull the kernel -src package in via complementary packages
Date: Wed, 23 Sep 2026 22:51:54 +0200
Message-ID: <20260923205206.1102615-3-adrian.freihofer@siemens.com>
In-Reply-To: <20260923205206.1102615-1-adrian.freihofer@siemens.com>
References: <20260923205206.1102615-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2026 20:52:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246556

From: Adrian Freihofer <adrian.freihofer@siemens.com>

IMAGE_INSTALL_COMPLEMENTARY matches complementary packages such as *-src
and *-dbg against PN, but the kernel recipe names its packages after
KERNEL_PACKAGE_NAME rather than PN. That mismatch means kernel-dbg is
never actually installed by the complementary mechanism, while -src
still got pulled in, since it is matched by the generic *-src glob rather
than one keyed off KERNEL_PACKAGE_NAME. So a debug image ended up with
the kernel's -src package in rootfs-dbg, most likely unintentionally,
without the -dbg package it would normally come with.

Add ${PREFERRED_PROVIDER_virtual/kernel}-src to
PACKAGE_EXCLUDE_COMPLEMENTARY so the kernel -src package is no longer
installed automatically like this. Getting kernel debug symbols onto an
image most likely needs a different approach than pulling them into
rootfs or rootfs-dbg via IMAGE_INSTALL_COMPLEMENTARY, which is left for
follow-up work.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/classes-recipe/core-image.bbclass | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/core-image.bbclass b/meta/classes-recipe/core-image.bbclass
index 167fa97fd9..a3afca5ebb 100644
--- a/meta/classes-recipe/core-image.bbclass
+++ b/meta/classes-recipe/core-image.bbclass
@@ -74,7 +74,9 @@ IMAGE_FEATURES_REPLACES_ssh-server-openssh = "ssh-server-dropbear"
 # Do not install openssh complementary packages if either packagegroup-core-ssh-dropbear or dropbear
 # is installed # to avoid openssh-dropbear conflict
 # see [Yocto #14858] for more information
-PACKAGE_EXCLUDE_COMPLEMENTARY:append = "${@bb.utils.contains_any('PACKAGE_INSTALL', 'packagegroup-core-ssh-dropbear dropbear', ' openssh', '' , d)}"
+# Do not automatically install e.g. linux-yocto-src but not kernel-dbg
+PACKAGE_EXCLUDE_COMPLEMENTARY:append = "${@bb.utils.contains_any('PACKAGE_INSTALL', 'packagegroup-core-ssh-dropbear dropbear', ' openssh', '' , d)}\
+    ${PREFERRED_PROVIDER_virtual/kernel}-src"
 
 # IMAGE_FEATURES_CONFLICTS_foo = 'bar1 bar2'
 # An error exception would be raised if both image features foo and bar1(or bar2) are included
-- 
2.55.0


