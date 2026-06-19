Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEFAACDB46F
	for <webhook@archiver.kernel.org>; Fri, 19 Jun 2026 08:33:22 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.38260.1781857998932136597
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Jun 2026 01:33:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=JWhGyUWF;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-490a76757e5so11590865e9.2
        for <openembedded-core@lists.openembedded.org>; Fri, 19 Jun 2026 01:33:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781857997; x=1782462797; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/I+CjyDKY1lX3/Ba99n21x0cucTjg6MpM5AH8LqMfQg=;
        b=JWhGyUWFUnHbOzXghOQLHapQQV4nHNK82wXsiV9yq5fQ1yBRV/yLtkoSnqYxsEob8r
         7NgFypr/s8rC54G6Fo32aSvrO1EPQxrCUoFy5V/dCU+Z4aNMotpNYSLJJ7/JukJWx4hV
         1USNJ5u5Dvwtf1tjT2wua92MOqoFWMJS8vGPUTEM+QogZycPdAQfIYIj4oPSmVke4AU7
         dSebwk2/D9nuR1uE0jqdER8to0x8K34/V8CnS2S5do6p+63lj0z9tbrsOX0oVF3ncDJ7
         Ac0dEGwltxSankuBN8a34SfBxUv60nom3NDuefea1xQKh6DMmRSIkOjPZeu32OwDIRyV
         /sKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781857997; x=1782462797;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/I+CjyDKY1lX3/Ba99n21x0cucTjg6MpM5AH8LqMfQg=;
        b=HdSKdLwMFs0OW/i7UPB13a3Fgkqij/c6NiHcpAhdbqQ+Y2ixc2McQon/Jlt4+DuuaE
         mEwtsOjju9Ddhs3ZxTjTVROGsRMUmSdmrLW6KyvmSx38jJ4k+1zczZ/Vm5F9xSBvEVJB
         9AYVxw1Qoo8e0f+e0m+pxchLfsPmpwxNzKCcOtqRahqGRt+39xLyGHnr4nCgHzIokJ4g
         tdL4W2kKw9hvPQuH3KZazhvuKTHE6zJF4JcZXD8w1qjWFXkLcmv8NBa2oTiYvxEKuiFF
         RY+FMD3Z1nC93NJr3O1Hv8z/GnVl/ew+rlBFLEBxE4sEGDi6m1zVYUTx/XF6ltRAGkyP
         OGaA==
X-Gm-Message-State: AOJu0YzCuQOTjR7nHWnQyrC9i4YW1LgCAtx5aKq6vQ8xfaRwLowCXnrR
	02UlMrifLgd5cohlyoTvYHRxs5Fm3fJeftM9X7a7hrmz8yvOx2Rbn5F5BB91d0IN
X-Gm-Gg: AfdE7clkplHckhLxJ7ljOafdtIIWzDihNi6nCcctSHLEQ3cUEc9+X86pvE8Kc1E8IPJ
	Ln1eat/ULNocZIdQLZB/EdoicP7NKJO9y1seVed0pRVu2Qtq8Bk+JW0CCUwufFqNq8JfZvTYDxF
	DlJwzniaB5g1vSwWqM66l5bGLyTI67CPn1obnl7X53ZszUvEXa2HuJlh4tItQBeuoczt9tj1/JQ
	E6/eFz9Pgy6sRzxRfEuriJbecQRIuXN8lVV9WLGH0eq20TAw2tTpSXTGiSOVcDPuNLoceekdUlh
	rUeGaVlsvGPTCniKD90iqspGVGcC5tIFoG3MIWawxuSL5ScyzOAktuNJYXuQY1GFvI9mxgN0KcT
	lprbQefCn6/jso7EIpSaoO1MwEtNKXGorlWfjF3RwF8J822Yq/FUSHP5sN7H+uai0OuZbsm99fx
	DJHu4fk04qxHSSqGmOewJ0HaEMA5wZcqoaz8m2MOUIh1I8650GGIqu3BDH2nE=
X-Received: by 2002:a05:600c:1796:b0:490:e170:b7ee with SMTP id 5b1f17b1804b1-4923f572919mr32347015e9.17.1781857997039;
        Fri, 19 Jun 2026 01:33:17 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4650bc429a1sm5878368f8f.30.2026.06.19.01.33.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2026 01:33:16 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 11/15] man-pages: upgrade 6.17 -> 6.18
Date: Fri, 19 Jun 2026 10:32:53 +0200
Message-ID: <20260619083305.3505156-11-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260619083305.3505156-1-alex.kanavin@gmail.com>
References: <20260619083305.3505156-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Jun 2026 08:33:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239146

From: Alexander Kanavin <alex@linutronix.de>

License-Update: formatting

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../man-pages/{man-pages_6.17.bb => man-pages_6.18.bb}        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/man-pages/{man-pages_6.17.bb => man-pages_6.18.bb} (92%)

diff --git a/meta/recipes-extended/man-pages/man-pages_6.17.bb b/meta/recipes-extended/man-pages/man-pages_6.18.bb
similarity index 92%
rename from meta/recipes-extended/man-pages/man-pages_6.17.bb
rename to meta/recipes-extended/man-pages/man-pages_6.18.bb
index bf4cbca932..3e2eb66156 100644
--- a/meta/recipes-extended/man-pages/man-pages_6.17.bb
+++ b/meta/recipes-extended/man-pages/man-pages_6.18.bb
@@ -4,7 +4,7 @@ SECTION = "console/utils"
 HOMEPAGE = "http://www.kernel.org/pub/linux/docs/man-pages"
 LICENSE = "GPL-2.0-or-later & GPL-2.0-only & GPL-1.0-or-later & BSD-2-Clause & BSD-3-Clause & BSD-4-Clause-UC & MIT"
 
-LIC_FILES_CHKSUM = "file://README;md5=c2d6fa1a74bdd79c25de6f4db7332294 \
+LIC_FILES_CHKSUM = "file://README;md5=e4d3c4124726a2b7763489612768c03c \
                     file://LICENSES/BSD-2-Clause.txt;md5=9e16594a228301089d759b4f178db91f \
                     file://LICENSES/BSD-3-Clause.txt;md5=407426fcc1a243b7b2eff6e35c56aca9 \
                     file://LICENSES/BSD-4-Clause-UC.txt;md5=1da3cf8ad50cd8d5d1de3cfc53196d01 \
@@ -20,7 +20,7 @@ LIC_FILES_CHKSUM = "file://README;md5=c2d6fa1a74bdd79c25de6f4db7332294 \
 SRC_URI = "${KERNELORG_MIRROR}/linux/docs/${BPN}/${BP}.tar.gz \
            "
 
-SRC_URI[sha256sum] = "ca29e4d1f1edce2e27719967e9c4c2506c5501d0567d55bb723e10ec57a6ed14"
+SRC_URI[sha256sum] = "09f975373336a7b44fc1770176f3d2238a111c34e24812ad3b63ec3328795c01"
 
 inherit manpages lib_package
 
-- 
2.47.3


