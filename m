Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0151C77B7A
	for <webhook@archiver.kernel.org>; Wed, 24 May 2023 18:50:23 +0000 (UTC)
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com [209.85.166.42])
 by mx.groups.io with SMTP id smtpd.web10.2309.1684954218633549348
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 May 2023 11:50:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=mXkakX5C;
 spf=pass (domain: baylibre.com, ip: 209.85.166.42, mailfrom: tgamblin@baylibre.com)
Received: by mail-io1-f42.google.com with SMTP id ca18e2360f4ac-76c5c806fc5so36477339f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 24 May 2023 11:50:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1684954217; x=1687546217;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=VHtftcdY2O4W0Mjj62MaPRlFIxhYMx0SndNirrgsYOY=;
        b=mXkakX5CkQnOPG68+Nilfww6s5LX0axGtgmCWioFnOf5hpDdUTuTPVSMucq1Xc6UgF
         qJUhUc1urglcUC7rxIdn7Mxl18odOH4PV/KMUu+bFjKS703n/4HQNFQQnMkINgquWPvK
         g+4WYaIi1ntM+pQZ+XMuVeBK7smzXfXUeyAIEhswk7pofjRoctLcDtzpeNdle2Vk3Jyz
         i7Tnq27D4VPz6+yZgZPfwk6+TjnYAJhr/EF17FNvbTzChp46W/KK1rGFa9XIh+2G7KPA
         HsfhrU1fqE8yFR3fSkd26J3BHrbma0GE8sspv+J8mOWVdF6uaGD077x7wTF3r9ib+sq+
         gGYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684954217; x=1687546217;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VHtftcdY2O4W0Mjj62MaPRlFIxhYMx0SndNirrgsYOY=;
        b=BZAqb5tJSeYxzV0fjbCFjFdJMInKFaa2V4veCqHT/Ixt64ZiZU4Pt2XzoQWoxuw114
         WCEQ2pV2S5/CKKlUpbNVzKTWaRt2yroW7ziKsrQopX8JZc0rH46ecA9DmlOr9tyk5IC2
         vy19F3j1B5Ljr10sueuhGWB7Hjj88w2+0tZPjOdobFOyd9SWT+zs5ZC/6kDQf3erb/e5
         RQsKGk17yweo8Y/hM7lE9ZL8WhrbcTWxjIfo/pdTODToC3S2xSYiM9GVgg2qGlthRoZm
         zdnpBGmZqrUuc/SN7KNJbzjpMgN9SStNBrFiPogJgkadk48EeVW+VBQAX4Qy+6cCyyFf
         RKJw==
X-Gm-Message-State: AC+VfDzUQIqyrXXgs8FZ2NejwqJfuCu5pwQ2AOvFbujsmD3lLy60LlhQ
	OPYV8IDVBwUQ1cpvPMowQ2KDoQ1txr4S5tA0BW4=
X-Google-Smtp-Source: ACHHUZ5tTbuQtJwEPNze2oSeNwI+JjjDSIE0Q6nxAjCKY9P7S5QfEEwxb8Yj9P9vLRuIntUfin4JCA==
X-Received: by 2002:a5e:dd4c:0:b0:76c:79f9:9b29 with SMTP id u12-20020a5edd4c000000b0076c79f99b29mr11103416iop.3.1684954217479;
        Wed, 24 May 2023 11:50:17 -0700 (PDT)
Received: from megalith.cgocable.net ([2001:1970:5b1f:ab00:4839:d997:f6ce:5f02])
        by smtp.gmail.com with ESMTPSA id l7-20020a5ed807000000b00768d47b2a59sm3521896iok.23.2023.05.24.11.50.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 May 2023 11:50:17 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] pciutils: upgrade 3.9.0 -> 3.10.0
Date: Wed, 24 May 2023 14:50:15 -0400
Message-Id: <20230524185015.3114448-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 May 2023 18:50:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181691

Changelog (see https://github.com/pciutils/pciutils/blob/master/ChangeLog):

* Fixed bug in definition of versioned symbol aliases in shared libpci,
which made compiling with link-time optimization fail.
* Filters now accept "0x..." syntax for backward compatibility.
* Windows: The cfgmgr32 back-end which provides the list of devices
can be combined with another back-end which provides access to
configuration space.
* ECAM (Enhanced Configuration Access Mechanism), which is defined by
the PCIe standard, is now supported. It requires root privileges,
access to physical memory, and also manual configuration on some
systems.
* lspci: Tree view now works on multi-domain systems. It now respects
filters properly.
* Last but not least, pci.ids were updated to the current snapshot of
the database. This includes overall cleanup of entries with non-ASCII
characters in their names -- such characters are allowed, but only if
they convey interesting information (e.g., umlauts in German company
names, but not the "registered trade mark" sign).

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 .../pciutils/{pciutils_3.9.0.bb => pciutils_3.10.0.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-bsp/pciutils/{pciutils_3.9.0.bb => pciutils_3.10.0.bb} (95%)

diff --git a/meta/recipes-bsp/pciutils/pciutils_3.9.0.bb b/meta/recipes-bsp/pciutils/pciutils_3.10.0.bb
similarity index 95%
rename from meta/recipes-bsp/pciutils/pciutils_3.9.0.bb
rename to meta/recipes-bsp/pciutils/pciutils_3.10.0.bb
index f9fe7aa76a..e27cfd4ced 100644
--- a/meta/recipes-bsp/pciutils/pciutils_3.9.0.bb
+++ b/meta/recipes-bsp/pciutils/pciutils_3.10.0.bb
@@ -14,7 +14,7 @@ DEPENDS = "zlib kmod make-native"
 SRC_URI = "${KERNELORG_MIRROR}/software/utils/pciutils/pciutils-${PV}.tar.xz \
            file://configure.patch"
 
-SRC_URI[sha256sum] = "cdea7ae97239dee23249a09c68a19a287a3f109fbeb2c232ebb616cb38599012"
+SRC_URI[sha256sum] = "238a2e27166730e53a17fe07bfad229e07fa39b618117e5944b6d7eda9fbb0e9"
 
 inherit multilib_header pkgconfig update-alternatives
 
-- 
2.40.1


