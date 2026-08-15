Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C5A5C5AD5A
	for <webhook@archiver.kernel.org>; Sat, 15 Aug 2026 19:08:37 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14254.1786820913004701320
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Aug 2026 12:08:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=jxXv4hTv;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-256628-202608151908351d0103e08200020715-3drfnl@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 202608151908351d0103e08200020715
        for <openembedded-core@lists.openembedded.org>;
        Sat, 15 Aug 2026 21:08:35 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=LtQzwPx7KApi63xadVrrx9UASijl0/wdQp/YtUyE2Tg=;
 b=jxXv4hTvuHWk1SHs2Wby1VaKNKisGNhMvCn0lTUpTESzxpwgX6r4F8GVcma5Itm/qOv+rP
 ISAzU/bKVnpWKUjeyP/WErbYHsi0f8UKnJmjCgwA4bUjKFkgbffxr608g2lN355uLP2NNOTx
 tTw77WQivynLIxZO8D8iKhLgWceCNBdqvKrkvw7/+7A9DaQbw5I05rdtUnZ0rxJrijtFEm5Q
 k84LK/QBWwVNIHDfVIdMNBu6VaSD6U9dmTDC3Ds95eWQavw3fhi/F5ED2W99TSaGGSad/WiL
 F7MG2uLOqXEdb6Dc4zWBChTh58qxTGvzlrslP26VYFRAhXIulzs+CCcw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [scarthgap][PATCH 2/3] cpio: patch CVE-2026-66484
Date: Sat, 15 Aug 2026 21:08:23 +0200
Message-ID: <20260815190824.2980891-2-peter.marko@siemens.com>
In-Reply-To: <20260815190824.2980891-1-peter.marko@siemens.com>
References: <20260815190824.2980891-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Aug 2026 19:08:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243500

From: Peter Marko <peter.marko@siemens.com>

Pick patch mentioned in NVD CVE description.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(From OE-Core rev: a49025d54fe7723df999710e7a385aaeb42303a2)
Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-extended/cpio/cpio_2.15.bb       |  1 +
 .../cpio/files/CVE-2026-66484.patch           | 28 +++++++++++++++++++
 2 files changed, 29 insertions(+)
 create mode 100644 meta/recipes-extended/cpio/files/CVE-2026-66484.patch

diff --git a/meta/recipes-extended/cpio/cpio_2.15.bb b/meta/recipes-extended/cpio/cpio_2.15.bb
index f4b562fdc2c..62dcd444d5e 100644
--- a/meta/recipes-extended/cpio/cpio_2.15.bb
+++ b/meta/recipes-extended/cpio/cpio_2.15.bb
@@ -10,6 +10,7 @@ SRC_URI = "${GNU_MIRROR}/cpio/cpio-${PV}.tar.gz \
            file://run-ptest \
            file://test.sh \
            file://CVE-2026-66485.patch \
+           file://CVE-2026-66484.patch \
            "
 
 SRC_URI[sha256sum] = "efa50ef983137eefc0a02fdb51509d624b5e3295c980aa127ceee4183455499e"
diff --git a/meta/recipes-extended/cpio/files/CVE-2026-66484.patch b/meta/recipes-extended/cpio/files/CVE-2026-66484.patch
new file mode 100644
index 00000000000..97ce9a785cf
--- /dev/null
+++ b/meta/recipes-extended/cpio/files/CVE-2026-66484.patch
@@ -0,0 +1,28 @@
+From e2b9cbdd3354d2b1569b7390d1bc15c1930559ad Mon Sep 17 00:00:00 2001
+From: Sergey Poznyakoff <gray@gnu.org>
+Date: Thu, 23 Jul 2026 15:55:46 +0300
+Subject: [PATCH] The --no-absolute-filenames option affects hard link targets
+ too.
+
+* src/tar.c (stash_tar_linkname): Apply cpio_safer_name_suffix.
+
+CVE: CVE-2026-66485
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/cpio.git/commit/?id=e2b9cbdd3354d2b1569b7390d1bc15c1930559ad]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ src/tar.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/src/tar.c b/src/tar.c
+index 493f299..a1fc60a 100644
+--- a/src/tar.c
++++ b/src/tar.c
+@@ -37,6 +37,8 @@ stash_tar_linkname (char *linkname)
+ 
+   strncpy (hold_tar_linkname, linkname, TARLINKNAMESIZE);
+   hold_tar_linkname[TARLINKNAMESIZE] = '\0';
++  cpio_safer_name_suffix (hold_tar_linkname, true, !no_abs_paths_flag,
++  			  false);
+   return hold_tar_linkname;
+ }
+ 

