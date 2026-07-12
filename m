Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2ADE0C44507
	for <webhook@archiver.kernel.org>; Sun, 12 Jul 2026 05:51:37 +0000 (UTC)
Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9499.1783835493232584852
 for <openembedded-core@lists.openembedded.org>;
 Sat, 11 Jul 2026 22:51:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@underview.tech header.s=google header.b=FPQZgr2e;
 spf=pass (domain: underview.tech, ip: 74.125.224.49, mailfrom: vince@underview.tech)
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-6679d88abdcso3351080d50.2
        for <openembedded-core@lists.openembedded.org>; Sat, 11 Jul 2026 22:51:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=underview.tech; s=google; t=1783835492; x=1784440292; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ylsWSCR3M8HZw3y0Qd9EzvpFU7XBpR/p9T6uh8EiZ00=;
        b=FPQZgr2eIRtHiw+djeGQVuXPV5RarN3/Br/UqaeIFbXMSBD+qBNKNOV/CZ/1IeHq19
         oD56xyzu90HuQsrwqmYQ2S8zPJ2rfgRy/++R06SdntHUD1hLG8SQOQ+PXTi2UqihLcWg
         LYSOVP0uMgarTl1vP2S7eJ9RQbXnxA4JmUd5LBwlbcuMITba1BSD9YGf+tNv0rdYdZcq
         KapWyHXy7SB3QJNlgAF5IOENqQ0ARX+/TUuN2ZyiDYNZVD+vv4Q83Jp3GSDddXyHvqvM
         EgkPcTDMcy5dUjzEdgQkSvMPvYR+MaIyo5SlyTSAotY3WJxsuxGaG4VzrAEDSH8Jt0vg
         imvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783835492; x=1784440292;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ylsWSCR3M8HZw3y0Qd9EzvpFU7XBpR/p9T6uh8EiZ00=;
        b=lRBiMI3i7ze8iNYT0H+hRi/A6Sk/+l1cgKIXkynlGxP4o6kcBkPqV0Px/qb8Vu/5sG
         iiEYwcIXjANz0r7oL6c7gr4+Kf80yqQAqcCZ1SuqBeXeRcvbVjP72tGSupoDLQcY/Hz/
         +tWSECt77DtNtK+pLYyZ6g3jrsSnTr7FCsEFvT3gNtUy+8V2caE0a6LxkZiMQhi/9QvI
         gtS7urSW9rmxh74BKmWZSSWH/aeBDKXRyC+UF4UjZveWc8kHGZKJIrV+Qy0sKrCS+RWx
         13M0oJHyMTHN3CJpHXOwBdWfc4oNj0vmaoNNGGcj647UMhWJWvXLoh/pouxtTncDPSZo
         9nZg==
X-Gm-Message-State: AOJu0Yy3KFHmeDuMJgmoI7Bkmlh6+64r4G3EE4giEi4OJVmM61HHHzZm
	QzGyIVvKqE5Lc7Jzj4D4cn51lLgyRZLQY0ge/kYqucD/sR4NLGwim2O5iYUyJwucRg7ozvsGdt8
	eaMeTnBQ=
X-Gm-Gg: AfdE7cmJBNaDTm3sh4xGAZJTIM5Tpl79gF/peHTeucvojH2fjxuKTEEsKLDUlsWvIBx
	/GV52BJf8HfVzteRucFoDJa6nPksu7+63LYVny0nBD+ESwfIBqcy4my2VHv/ftI5WBfGok3tQ9v
	yYCzZ6wH+awoyegTYv/i2SLdMZkewmAUzUWO0CcTLJiPlaXpkbGV3yMIAq69aav/rLbckudDuT7
	9NSn9dm1VMQKM/G97c8OLfJDmom7ZciCjpyt9RYZH4rlwUPY/kjQPTbv9VrzX0ZlxNu2f4GaKbx
	Xcu2qxBLQmHL373b+8Ezi8exRwNuSZEWPErvQNblg33eW56uhVj8isUKfpnZ8JHHU8t7sVkJpTx
	XK1VSBWRRoTEoMoLTHKc9J8woQrxUusowQ0UUZVkEbAk+JDEFSfbecbCuU797OsrYnsgurlEDkY
	iDpTCTvo1LVTRMhkyUlKkZS7VqQyBJ+15GGR8=
X-Received: by 2002:a53:d506:0:b0:667:9980:6d7d with SMTP id 956f58d0204a3-667d7cba52dmr2867202d50.101.1783835492300;
        Sat, 11 Jul 2026 22:51:32 -0700 (PDT)
Received: from vince-server.attlocal.net ([2600:1700:b540:3af0::42])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6678779e37fsm10764901d50.5.2026.07.11.22.51.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2026 22:51:31 -0700 (PDT)
From: Vincent Davis Jr <vince@underview.tech>
To: openembedded-core@lists.openembedded.org
Cc: Vincent Davis Jr <vince@underview.tech>
Subject: [PATCH v2 06/26] packagegroup-self-hosted: rename kernel prefix
Date: Sun, 12 Jul 2026 01:49:34 -0400
Message-ID: <20260712054954.4063745-6-vince@underview.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260712054954.4063745-1-vince@underview.tech>
References: <20260712054954.4063745-1-vince@underview.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Jul 2026 05:51:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240731

Utilize preset variable KERNEL_PACKAGE_NAME
to ensure uniformity with builds if
KERNEL_PACKAGE_NAME variable were to
change.

Signed-off-by: Vincent Davis Jr <vince@underview.tech>
---
 .../packagegroups/packagegroup-self-hosted.bb      | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb b/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
index c386267781..16835e60df 100644
--- a/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
@@ -7,7 +7,7 @@ DESCRIPTION = "Packages required to run the build system"
 
 PACKAGE_ARCH = "${TUNE_PKGARCH}"
 
-inherit packagegroup  features_check
+inherit packagegroup features_check
 # rdepends on libx11-dev
 REQUIRED_DISTRO_FEATURES = "x11"
 
@@ -51,12 +51,12 @@ PSEUDO = "pseudo"
 PSEUDO:libc-musl = ""
 
 RRECOMMENDS:packagegroup-self-hosted-host-tools = "\
-    kernel-module-tun \
-    kernel-module-iptable-raw \
-    kernel-module-iptable-nat \
-    kernel-module-iptable-mangle \
-    kernel-module-iptable-filter \
-	"
+    ${KERNEL_PACKAGE_NAME}-module-tun \
+    ${KERNEL_PACKAGE_NAME}-module-iptable-raw \
+    ${KERNEL_PACKAGE_NAME}-module-iptable-nat \
+    ${KERNEL_PACKAGE_NAME}-module-iptable-mangle \
+    ${KERNEL_PACKAGE_NAME}-module-iptable-filter \
+    "
 
 RDEPENDS:packagegroup-self-hosted-sdk = "\
     autoconf \
-- 
2.43.0


