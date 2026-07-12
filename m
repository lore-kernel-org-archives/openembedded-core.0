Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62EE2C4450E
	for <webhook@archiver.kernel.org>; Sun, 12 Jul 2026 18:43:38 +0000 (UTC)
Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.887.1783881808926230558
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Jul 2026 11:43:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@underview.tech header.s=google header.b=R+bYnQ4h;
 spf=pass (domain: underview.tech, ip: 74.125.224.54, mailfrom: vince@underview.tech)
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-6649ffb1d01so3302653d50.1
        for <openembedded-core@lists.openembedded.org>; Sun, 12 Jul 2026 11:43:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=underview.tech; s=google; t=1783881808; x=1784486608; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gtORirhu8WMo5JEeSHe9Cg+10FDL9Pk5F/e13RwIwqw=;
        b=R+bYnQ4hS0B55fBbKHzTB/YOUYpAxPGVgRa03mlmZTWrIICB0toRV3jzWbhwXYmHtd
         aa/EsSEG0YOj126bYAFZHscrf8ALohpJjSaCIhbmIzXXsLnwiYG+J+QWoY2L/PZdgMtL
         r4wB0G3cVE+eDIE3tKr619mWbymnp6UD6GkjHmPTvZDSMgxLx96YYdKEtBn6Dvxkg6ml
         mf1vaJ7yAlC1KAjDeF8vxU3rV41ql8Z1zEvc5Vl2KvLS5/HyPR2TYnqSHD31vFtIvow1
         VwElRyOBDkqnNY01vTPZindJGqL6b64B9Fh5xUlW3aEBYytPseTPPI1+YRVrmRJEYfmv
         7Rqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783881808; x=1784486608;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gtORirhu8WMo5JEeSHe9Cg+10FDL9Pk5F/e13RwIwqw=;
        b=h0AnRIWlqvi1SzySj5YDHVx48PMEbiLsc3pD/fXumSxhiW1DHX0Qw+arcss+SXqe7v
         /aTTW+UtibrvyXjtRgfIfsR1VSSLIR3FeVyTXxqNDp0GHWtmqHqHXZwVDvOQQ1XZp06c
         ZQhaNd5sSiTduwkXFac65JijIhQUwm8Z0G6nUzlbu01DsVs9XWpcluvIn53ooSgpwvIj
         rOdCF8JrIXS/KcQBQ8ow2CRl3z6flUswqp5zvBgI44mrvJldBfG9Q6MZfZmpLxwU6BZ/
         J4JHj3rhrrF8BG6VeiqMHfXhFMjbMWtdDC254Q430Jc063nVjWuuT7ljQM2JOqKlHjZC
         RSPw==
X-Gm-Message-State: AOJu0YwznqOS2rhByVwMrXGF+RnIsmo9G0iZyVRqvXJbWnLZ57M2+Y4x
	N3pxws7nSOZmzeYQ+G7kCRHfkZST/sw0i4s+TxZbLxOZiDFa8hMWl77kY93VPB1A1vsZh5ooVLv
	yIIr0Oh0=
X-Gm-Gg: AfdE7cmMKq9rgYa8zm32J0WyL4Dciu9vmdp9S6ZpwoWFq+CztOuE43luMgCQZJNk5+X
	C3NZk2/TJewB/qZ/O1Gpty9hb9wPqFS79V2t3yvhRdKX5GI2e72uiyJsLLcxXMU0fnuk2mDbNVz
	TxrBAeIiRORSsWPE316MRu9VM938B1CNCY8MY8ics56gCs8Whpr0BYMKNmzjT69o7aiQHC4F27t
	Abx+Wu9ibuj+si70lymUU0Z5/2mrlEQ5xwPKev7fFQMkKRTrarVjcGYHREcS+CJVg4lW4DuEUtV
	nhJ7nr1PY7wZ/MDhUZd2p1T3m/9SVu6thEm2Il9o/e0zj5o0O3D5HLjEBFMQZPEkqMwsSMIQKXK
	/mJer59CUwa1CAYPGUNex5u7Zx2X0WBaMQhp8O/7SGprEBLyU8zurc3rLOH4IKJ5dDKkus5ilXD
	EFdz/YkplhVW+2BA==
X-Received: by 2002:a05:690e:4146:b0:667:d82d:d4d1 with SMTP id 956f58d0204a3-667d82dd95emr4565711d50.5.1783881807983;
        Sun, 12 Jul 2026 11:43:27 -0700 (PDT)
Received: from vince-server.attlocal.net ([2600:1700:b540:3af0::42])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66787b23b35sm11768236d50.21.2026.07.12.11.43.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 11:43:27 -0700 (PDT)
From: Vincent Davis Jr <vince@underview.tech>
To: openembedded-core@lists.openembedded.org
Cc: Vincent Davis Jr <vince@underview.tech>
Subject: [PATCH v4 12/27] nfs-utils: rename kernel prefix
Date: Sun, 12 Jul 2026 14:42:52 -0400
Message-ID: <20260712184307.3259642-12-vince@underview.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260712184307.3259642-1-vince@underview.tech>
References: <20260712184307.3259642-1-vince@underview.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Jul 2026 18:43:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240802

Utilize preset variable KERNEL_PACKAGE_NAME
to ensure uniformity with builds if
KERNEL_PACKAGE_NAME variable were to
change.

Signed-off-by: Vincent Davis Jr <vince@underview.tech>
---
 meta/recipes-connectivity/nfs-utils/nfs-utils_2.9.1.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.9.1.bb b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.9.1.bb
index 6f00bee0d8..76002d2d3c 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.9.1.bb
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.9.1.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=95f3a93a5c3c7888de623b46ea085a84"
 # util-linux for libblkid
 DEPENDS = "libcap libevent util-linux sqlite3 libtirpc libxml2 libnl"
 RDEPENDS:${PN} = "netbase ${PN}-client"
-RRECOMMENDS:${PN} = "kernel-module-nfsd"
+RRECOMMENDS:${PN} = "${KERNEL_PACKAGE_NAME}-module-nfsd"
 
 inherit useradd
 
@@ -28,7 +28,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/nfs-utils/${PV}/nfs-utils-${PV}.tar.x
 
 SRC_URI[sha256sum] = "302846343bf509f8f884c23bdbd0fe853b7f7cbb6572060a9082279d13b21a2c"
 
-# Only kernel-module-nfsd is required here (but can be built-in)  - the nfsd module will
+# Only ${KERNEL_PACKAGE_NAME}-module-nfsd is required here (but can be built-in)  - the nfsd module will
 # pull in the remainder of the dependencies.
 
 INITSCRIPT_PACKAGES = "${PN} ${PN}-client"
-- 
2.43.0


