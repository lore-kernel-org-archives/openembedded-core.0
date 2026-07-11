Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 114BBC44501
	for <webhook@archiver.kernel.org>; Sat, 11 Jul 2026 05:24:43 +0000 (UTC)
Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1282.1783747480166275503
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jul 2026 22:24:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@underview.tech header.s=google header.b=hTSkvpOf;
 spf=pass (domain: underview.tech, ip: 74.125.224.54, mailfrom: vince@underview.tech)
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-664b05d408bso1473476d50.1
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Jul 2026 22:24:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=underview.tech; s=google; t=1783747479; x=1784352279; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+gYUKM4A411Cw+1b6cQExC8JibtqcJLiwc3YKPTie/4=;
        b=hTSkvpOfW0DGqYsbfzwXyp9/Q8cDPvSblmvmhThVgbNd/PeY0hN1XTB21MaYKP53Y2
         VCUHRlw49mdskUHQXQGwmXkomfwZ7MkmRefMG8UcVewxd3HUhe4Jj0w/l8irTyy9+Yhq
         5o4NlC4xUB+92IHC9vjkNGiZpqF8gATMa6qrB69LSeXdt+lCkznLvEQutgW7Kb8YWWKf
         Tonnd7ZLANDWbEgWKJ8d7EcoJA14NTf/FNUICv7l9kzwlUOCkPBlxZrmt0dt+s5cmuzc
         jtAjR5ZNtr0wDouhMx5Rcoc0yPOf4Xr/DW2TXiXBXAQ/IXPXL3a74Uhd9ElOImFglFQo
         vy+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783747479; x=1784352279;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+gYUKM4A411Cw+1b6cQExC8JibtqcJLiwc3YKPTie/4=;
        b=Ywh6tdpkqVtk9HnQ8GSmZB32JvfIW6RA6JfDbDk3S8uN10ysHjepywLISdjWaL0A/3
         oZYv+kEmpnqafLK6PiHB4AlT9EsvRMF7FaPhNVLQBgxdbC1GhIuuuRwnCu3Z6zhS184k
         KcQimWzG21bfGMP6PneaBkjF0vwJvLwRJeQYGsTKx0f3gRI1D8tvBRMWOCwTCpcVVxeI
         gZ8x7wnmnv+Bu9UEUf8YtAkTqzZb+FxUV27Q5uQ/FbvgfJhuns/STvfsfEBTrlTLI6hA
         c2LbZqVlLj4CrAYK3G4HX0c+2fp78SZF06tTK74F0kicKFgELwDW5+xBLQmmKmtJecCk
         Vr1w==
X-Gm-Message-State: AOJu0Yz+3AYpMqgubwlcRQWUbaccLF1WLlyJp0QnX3VubP+aWieWSUW0
	J3ubsAPB2JjGwMofI4oBlsvBILQGgY6svKm2QNfMc9i8pgdBPpR5qGIk20IvDeBpKN7iuwWNTPT
	tXtDS7tE=
X-Gm-Gg: AfdE7clMnSc43/krPMscSg/AoKlHoscCCYGGoRt88Jy6dghlXAjISebk9Xxnc9ypGkv
	TEZe+uMgvDDdaQbOBYMvghXj9AfiL4uVkmLLt9kv25rY3zEU0CfZSirCf/2PD1g2YIIzMu7bT3/
	mfliKC0nf7nMlqE9/xY7acISpGV2pmlzyIMFX9ztJhuslqW/lO786hxhKbFIA2peZ5vSTSz2n0m
	lEHRy4uwpXRiGonLrHfcXrKKRDWy9q35L1Q6ECEo2ktDM5Idz8zFmL1Tcu146Yanrs7DqOrj2zL
	1ZwfNS1yQQYNk0YMDmO8qKlOrCvp+hD7GfC/JXEYGXfOqqc66vWSiCLktGmYomrZr4hLiYyF3v+
	jQ6sX7smb6k/zGNONGroPJxuBctYIHf1J0b1pcs2w9IByreId9FngBF9Q3QX0w0us4jSGUWXka0
	OKTe5kbH3jZ2Sat/DAXfdFuWl7
X-Received: by 2002:a05:690e:b81:b0:664:d899:e3a9 with SMTP id 956f58d0204a3-667d7a93438mr1300084d50.20.1783747479174;
        Fri, 10 Jul 2026 22:24:39 -0700 (PDT)
Received: from vince-server.attlocal.net ([2600:1700:b540:3af0::42])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66787a49befsm8643784d50.16.2026.07.10.22.24.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 22:24:37 -0700 (PDT)
From: Vincent Davis Jr <vince@underview.tech>
To: openembedded-core@lists.openembedded.org
Cc: Vincent Davis Jr <vince@underview.tech>
Subject: [PATCH 09/19] nfs-utils: rename kernel prefix
Date: Sat, 11 Jul 2026 01:23:53 -0400
Message-ID: <20260711052403.1292286-9-vince@underview.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260711052403.1292286-1-vince@underview.tech>
References: <20260711052403.1292286-1-vince@underview.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 11 Jul 2026 05:24:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240689

Utilize preset variable KERNEL_PACKAGE_NAME
to ensure uninformative with builds if
KERNEL_PACKAGE_NAME variable were to change.

Signed-off-by: Vincent Davis Jr <vince@underview.tech>
---
 meta/recipes-connectivity/nfs-utils/nfs-utils_2.9.1.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.9.1.bb b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.9.1.bb
index 6f00bee0d8..5aa6ff01cc 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.9.1.bb
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.9.1.bb
@@ -10,9 +10,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=95f3a93a5c3c7888de623b46ea085a84"
 # util-linux for libblkid
 DEPENDS = "libcap libevent util-linux sqlite3 libtirpc libxml2 libnl"
 RDEPENDS:${PN} = "netbase ${PN}-client"
-RRECOMMENDS:${PN} = "kernel-module-nfsd"
+RRECOMMENDS:${PN} = "${KERNEL_PACKAGE_NAME}-module-nfsd"
 
-inherit useradd
+inherit useradd kernel-vars
 
 USERADD_PACKAGES = "${PN}-client"
 USERADD_PARAM:${PN}-client = "--system  --home-dir /var/lib/nfs \
@@ -28,7 +28,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/nfs-utils/${PV}/nfs-utils-${PV}.tar.x
 
 SRC_URI[sha256sum] = "302846343bf509f8f884c23bdbd0fe853b7f7cbb6572060a9082279d13b21a2c"
 
-# Only kernel-module-nfsd is required here (but can be built-in)  - the nfsd module will
+# Only ${KERNEL_PACKAGE_NAME}-module-nfsd is required here (but can be built-in)  - the nfsd module will
 # pull in the remainder of the dependencies.
 
 INITSCRIPT_PACKAGES = "${PN} ${PN}-client"
-- 
2.43.0


