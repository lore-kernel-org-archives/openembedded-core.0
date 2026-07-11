Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB226C44508
	for <webhook@archiver.kernel.org>; Sat, 11 Jul 2026 05:24:53 +0000 (UTC)
Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1285.1783747484615676833
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jul 2026 22:24:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@underview.tech header.s=google header.b=QkVLTDed;
 spf=pass (domain: underview.tech, ip: 74.125.224.43, mailfrom: vince@underview.tech)
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-664db84f074so2205393d50.0
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Jul 2026 22:24:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=underview.tech; s=google; t=1783747484; x=1784352284; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6LUeOFqrUf7RbkWJq/zCsyi2bW34WycRL7mAANfyrSM=;
        b=QkVLTDedMDTUhC168d5nE2jdZP2PO3bZPLuoFXZ7CWRGCr26OH10/uL3POxbKxRiFG
         k6HUN3WDgIqctC9oJFm8KRLBz+1wOSYkAxrx++r4s1UXLcKiTAHx0QzHU1YDjJ4xy+VY
         kBJwdFWqf8Sne+XmxSjCgE/nuzEZ79O2M2IDb768vpl+YS9BNZrGMksrQDbpMYbV39p7
         13bqQOk+Lnhf8+u8zSgLBInIWdYDdrnXyu7EXslNJ91qWjcOtTDEHCpRPEmxidWqir24
         CgF1bnLk3IJGBRw18bQITT4nfxk5ukkqvrLc+TjT4WgKaBZrJpI0Lxl7gDKNu2YygKMG
         X2TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783747484; x=1784352284;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6LUeOFqrUf7RbkWJq/zCsyi2bW34WycRL7mAANfyrSM=;
        b=RkMiAY1uEHVAx0BFH/0tqkTGtKr5TphNxDtav3xXg3dmQ97UH7KQHCd7YTw+d92U+H
         l2NB5oE3MqleuNptkDfD+T88td44JGAR/L6kXvYL198o3n/t5DwTcEeDWWocWaZK01FG
         4sTCHUXbbkMKpOfnCU+wq8HkgaacLPqdcXRDt6hjnH9KJIaS73bwJY7zTIqw8qaPUVj3
         RvKjhC2tQBS1dKfGTHDZX00eRIMeEQbQkl93rxvr2gQBxiIXuuzWwClXcOyCo0zSHmed
         Eg6DgTECafK9ELLjU4BKyIuIbZ3KpBb6HYrYT6e0aXtEfxxi2TSlae1NBpuvyzJKW4Rr
         q2vQ==
X-Gm-Message-State: AOJu0Ywahga9jDtAGAy7wXFzX/mgK3fGJpFMAYum3zXm5fOZDlUcRfCo
	dWMunrPsDHZQ3Lyhrf6C8YWD898kRDH/NWW4Jov958pYtWXSZovJhnl9kZQ6JnomPmK14JwsSCy
	za1EPAiw=
X-Gm-Gg: AfdE7cnDyb02NgIlJ0Rr31bWjvEPvT22+9uG1X04apXjiqjELNvU1Yh7tCzp6y6Qe1Y
	2EIfDws3QF9XwTPuc3Rs/1juO4zlu5nuIXItBVIelSO8nXCQOM1SugqLZRRAweFzjCwFDi72sfe
	g2xpUbkIuFMlagNu0pyPUeKsAlzAFv+3a7/cV3RlxbEjypK2BWBEWlmXPI1KdjnVWaZNrwV0McV
	+C6Gh8TIk8i8N3eQhfqlmynUmX8WbUIW26h+SJhWzWecfzZZedWnYxa2bYPbAlzPpmmbMVksbr8
	EG0wtINZTIDMyOusBOCbFKz6897gk+TG0un1XBjvNOkcow5WAikHy6eMKdQzYDVy/4J2xxRGt2F
	0pqwD73uhXNEAy+4DxOyiqAtat/xylo70BRY587ia6POp+IlJdHDY+Y90wrgZIlN7XoacjP5yBE
	nOF1HoPppahGtC4w==
X-Received: by 2002:a53:d3ce:0:b0:667:b314:aead with SMTP id 956f58d0204a3-667d7b04d3cmr1152553d50.6.1783747483721;
        Fri, 10 Jul 2026 22:24:43 -0700 (PDT)
Received: from vince-server.attlocal.net ([2600:1700:b540:3af0::42])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66787a49befsm8643784d50.16.2026.07.10.22.24.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 22:24:43 -0700 (PDT)
From: Vincent Davis Jr <vince@underview.tech>
To: openembedded-core@lists.openembedded.org
Cc: Vincent Davis Jr <vince@underview.tech>
Subject: [PATCH 12/19] util-linux: rename kernel prefix
Date: Sat, 11 Jul 2026 01:23:56 -0400
Message-ID: <20260711052403.1292286-12-vince@underview.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260711052403.1292286-1-vince@underview.tech>
References: <20260711052403.1292286-1-vince@underview.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 11 Jul 2026 05:24:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240693

Utilize preset variable KERNEL_PACKAGE_NAME
to ensure uninformative with builds if
KERNEL_PACKAGE_NAME variable were to change.

Signed-off-by: Vincent Davis Jr <vince@underview.tech>
---
 meta/recipes-core/util-linux/util-linux_2.42.2.bb | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/util-linux/util-linux_2.42.2.bb b/meta/recipes-core/util-linux/util-linux_2.42.2.bb
index 4943d5c7ab..4eaea73f59 100644
--- a/meta/recipes-core/util-linux/util-linux_2.42.2.bb
+++ b/meta/recipes-core/util-linux/util-linux_2.42.2.bb
@@ -52,7 +52,7 @@ LIC_FILES_CHKSUM = "file://README.licensing;md5=55e895a80bdd4ffc65e167a76d2e7569
                     file://libsmartcols/COPYING;md5=693bcbbe16d3a4a4b37bc906bc01cc04 \
                     "
 
-inherit autotools gettext manpages pkgconfig systemd update-alternatives python3-dir bash-completion ptest gtk-doc
+inherit autotools gettext manpages pkgconfig systemd update-alternatives python3-dir bash-completion ptest gtk-doc kernel-vars
 DEPENDS = "libcap-ng ncurses virtual/crypt zlib util-linux-libuuid"
 
 PACKAGES =+ "${PN}-swaponoff"
@@ -207,7 +207,12 @@ RPROVIDES:${PN}-dev = "${PN}-libblkid-dev ${PN}-libmount-dev"
 
 RDEPENDS:${PN}-bash-completion += "${PN}-lsblk ${PN}-findmnt"
 RDEPENDS:${PN}-ptest += "bash bc btrfs-tools coreutils e2fsprogs findutils grep iproute2 kmod procps sed socat xz diffutils"
-RRECOMMENDS:${PN}-ptest += "kernel-module-scsi-debug kernel-module-sd-mod kernel-module-loop kernel-module-algif-hash"
+RRECOMMENDS:${PN}-ptest += "\
+    ${KERNEL_PACKAGE_NAME}-module-scsi-debug \
+    ${KERNEL_PACKAGE_NAME}-module-sd-mod \
+    ${KERNEL_PACKAGE_NAME}-module-loop \
+    ${KERNEL_PACKAGE_NAME}-module-algif-hash \
+    "
 RDEPENDS:${PN}-swaponoff = "${PN}-swapon ${PN}-swapoff"
 ALLOW_EMPTY:${PN}-swaponoff = "1"
 
-- 
2.43.0


