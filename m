Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CD37CA9ED1
	for <webhook@archiver.kernel.org>; Sun, 11 Oct 2026 08:41:29 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.23449.1791708086039193086
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Oct 2026 01:41:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Cfx5ip2Z;
 spf=pass (domain: smile.fr, ip: 209.85.221.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48af4d4e61fso514852f8f.2
        for <openembedded-core@lists.openembedded.org>; Sun, 11 Oct 2026 01:41:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1791708084; x=1792312884; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=35gcTE7SF3CSIusWkdcrVmGatku2cCZ3zyW64XHW84k=;
        b=Cfx5ip2ZDRLo5XcsRgHNVbv9hbjwDKOF5Cn4vTL+yxNa6UOfuulOoNJm1w9EmazLGh
         I9UXU2FGOJzZrkX3sbCYwMjj6MQdXWZjc6qQGXlSoD9c6FsXpGMVKipPWU1BCHw3CEgI
         hILDycyzXC1AqJx82CEcaJLtWZotXBGU87kbw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791708084; x=1792312884;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=35gcTE7SF3CSIusWkdcrVmGatku2cCZ3zyW64XHW84k=;
        b=y1hF1tndR64pjTnEyqyxaTXnpEcTPUsJ8FghrC8yI+SLNtWdJ1lC8JlbspiwIolF+E
         CBWdCfGveHv5ok/f2VCG78RPFME7clreoTjfKWpzVw3am1oWc05xd3K2J3UF0JVPhvz6
         oWBzTrj7XuK5tmd4glkZuhvwrZA/+IaEjsg7BpADQ2WIXH6UEt6QncB0XZrY/xW8EQku
         HBshR7KldwH5h57WZcDKE8RBR8iwBaCuPvAj/asgxaKqqPUXKLb12xhLe4FWK2dJIRLC
         U3CeILcZGvGCtrgRfEzJ0vg+jS+rDa4r6lua0yYeq/IS+GQlFUaa8oBagt1E6kbE0LzP
         SwfQ==
X-Gm-Message-State: AFq9FYKnm083rL54DcSpMBAGt8vTJFVA3HeYqYcSgVcsHR7Fd0vZqgPB
	nrbeVCNLLe036qZNXfiMUR9ClEg/3Uby/pWYAQR7+sVxKJs6R++dLJeOACtyI5XieiuslROHLgs
	y0aXO4MI=
X-Gm-Gg: AYBFou31x158l83DLT3m4pJxKnJQc8q8MCrgwJFNtr5KcGWDVw1ZgKnSN/aIFQdw14H
	h/R6bnuSnSd4nwkwCvhWsSL8UG3kewZz1TRlbff/2Bdz7yrUP7CSvuDpLrBICtis4Pkawj7nkTh
	FDjm4wjj+cy6Fjo938RWiNWwDR8Pw+Z0NY4XlgSL8aLfydVXpiBjHRbY2YtwRcRd2Q0G/I3LwGh
	fV4R5FyrBG8XWdbqduDmssS/PTWXem/10DZPieqYzB44Me6185cPmNbmPcB8rIOhjhu+u+q1eyu
	FQxGXrnRLNjySZRJcTRK8AGSWUNUl090hq5ukyfJEwWurepZLvTLI/w+JbaZGQzo/Hjnm89YZf4
	TKmFOJH+cWOg34e4cU20k+GcdRUrgr9F4t9Y4ix5ILnf9jSMABW5Xclnf9fV1qho8rnQr63dJoM
	j9KoAJs58raS6dWCxs2Azp91BT9Vqhj0fjpvrqIVmZy6QOv/mpTrR9ZVtU8xsQENKG+ezxbthoo
	ijO1Aazb3vN5rVSdIYDoZjZNCdHBzHoumT9AMuIWSd/0oehlvOLkPNnmYrfavK0Ey7I8z5WKw==
X-Received: by 2002:a05:6000:4312:b0:487:27f6:a4e4 with SMTP id ffacd0b85a97d-48dbad489d1mr10965625f8f.52.1791708084211;
        Sun, 11 Oct 2026 01:41:24 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9acfa28sm13481734f8f.51.2026.10.11.01.41.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 01:41:23 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 36/60] libpng: upgrade 1.6.58 -> 1.6.59
Date: Sun, 11 Oct 2026 10:40:09 +0200
Message-ID: <e72c2ec7e05c7d441a96a2508a933a34603e9bcf.1791707817.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1791707817.git.yoann.congal@smile.fr>
References: <cover.1791707817.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 11 Oct 2026 08:41:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247544

From: Peter Marko <peter.marko@siemens.com>

Release notes [1]:

Version 1.6.59 [September 28, 2026]
  Fixed CVE-2026-46675 (medium severity):
    Use-after-free of zlib input in `png_read_end` after incomplete zTXt, iTXt
    or iCCP decompression.
    (Reported independently by Ze Sheng and
    <JasonHonKL@users.noreply.github.com>.)
  Fixed a regression introduced in version 1.6.47 that caused libpng to reject
    hIST chunks in their correct position, after PLTE.
    (Contributed by Yuki Sekiguchi.)
  Prevented a double free of `png_struct` members after an allocation failure.
    (Contributed by Anthony Hurtado.)
  Applied fixes and updates to the CMake build.
  Adopted the REUSE Specification for licensing the CI files.

Note: cmake is not used in Yocto build of libpng.

[1] https://github.com/pnggroup/libpng/blob/v1.6.59/CHANGES#L6388

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 907c6fa2d0c4f8a8f765cde004c55fb2dd2c402d)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../libpng/{libpng_1.6.58.bb => libpng_1.6.59.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/libpng/{libpng_1.6.58.bb => libpng_1.6.59.bb} (97%)

diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.58.bb b/meta/recipes-multimedia/libpng/libpng_1.6.59.bb
similarity index 97%
rename from meta/recipes-multimedia/libpng/libpng_1.6.58.bb
rename to meta/recipes-multimedia/libpng/libpng_1.6.59.bb
index 6e4e5e9f387..21f3a8ff3b6 100644
--- a/meta/recipes-multimedia/libpng/libpng_1.6.58.bb
+++ b/meta/recipes-multimedia/libpng/libpng_1.6.59.bb
@@ -14,7 +14,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}${LIBV}/${BP}.tar.xz \
            file://run-ptest \
 "
 
-SRC_URI[sha256sum] = "28eb403f51f0f7405249132cecfe82ea5c0ef97f1b32c5a65828814ae0d34775"
+SRC_URI[sha256sum] = "d80dd2a38a37f803cb9b6ac7b14bd6e74ddc3b654780a8380bdf93523fdb4389"
 
 MIRRORS += "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}${LIBV}/ ${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}${LIBV}/older-releases/"
 

