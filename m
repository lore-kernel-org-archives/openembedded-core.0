Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA28FC5B572
	for <webhook@archiver.kernel.org>; Sun, 16 Aug 2026 20:49:28 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17323.1786913367621245660
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Aug 2026 13:49:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=LthX5UM5;
 spf=pass (domain: konsulko.com, ip: 209.85.210.179, mailfrom: tim.orling@konsulko.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-84e3007a2b7so2263657b3a.0
        for <openembedded-core@lists.openembedded.org>; Sun, 16 Aug 2026 13:49:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1786913367; x=1787518167; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HTlOgXyZ7/5MvQw/72ZwSUz6yV5a7Fk05fKLO0seIAY=;
        b=LthX5UM5L/v2UtkT2v8Ep/HPetsc7BOLiEBzx6XkeWq51MMGG/PCF1+zKLE1ZBga0d
         GlvMbPzEGv+QZ1COIK1BqR2KyvF6vNiC2yIxYLJNEDYvIuaHv37iA9k3MUG7ClGce6Ik
         8+Ml61QQAipx8H/H8ouYR/QFNDXWEqiH8Fm6o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786913367; x=1787518167;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HTlOgXyZ7/5MvQw/72ZwSUz6yV5a7Fk05fKLO0seIAY=;
        b=QXJVX2JiaIIc2dsg4Lmk5TMX/PkZAVm40pAYQaZJF8eDOSIJQbG+JRNYBnkBr0UFbU
         i0CdoQuKWkAlMGPS1JjdYthOCeDfYm4WO67CZYIvNv5LmGrWab2gAWyP+Pr3WgxZ6j/d
         HN7UcCJIP3Cd0v7v1A3g1UojNXVPhIVHODdUvnDYU3kl16eN1CBTBmDJawzuKxunZMjo
         1w8PwJ/7LbRUBdV4GaYsGZ5R6av5NP8D/2ZsLHvg0a9WNUCyT8VOC3fOg/v3ClXlBjue
         +NGMKfGqSJZ+n9J5bIGSqN+BrVybCRlOIJ1y24diM7UihSvnuCwHt/Eg0lCr0cdWp3SW
         tGoA==
X-Gm-Message-State: AOJu0YxcSPpBikcmSbumx+8bTjsi8+mpX/IwcKi9Z/EXh35TNRj/Jp4r
	Q/IShN++m4RVH293wDllxUC+pYSIaG+ke63iupivy9yWI2P0syo8b5qzYtuO9Xy1hpMLkq5vZhI
	bgQvd
X-Gm-Gg: AR+sD12AvKQofN0lhz9uSTE/Q/Sj7foOks2BL917pKqYJ6Cy8uMPiUO3bgyM4QDBunq
	kexgihaOR+wz5RAA2rdzJ86GS+CtqEB+0WAOsTQVPQMLCIcZUySXKcFWJ6CQZcM8HvxxvSpMQ1p
	KnAWbBWxc6PbpTn5fKabpVDZUHFyPO2fj+/KaJW40+TYgHZiIPEH1w6efhATLCxBRrfuQC0VrZN
	bxJVhzMq+U6hIrIUxRDBRpEYk8JJgP28LQCd1Fm64b2r9i0kVWSsTHYIjwDdLN1lmsAMDZLe063
	+MO8IbQ/NpELiQ0tZIdeSIE02YTWt6ovWqn6qwPgLk2evVAxQlJJ3+tCo2+K4hE/BFVk3B1MBD/
	0AClBlyB+hX/vq6+pX9kwfVKdxaKu17jsNKs8WSSkqUgbX5KpBS7rR/rA0U6l47WoIem4VMq7vT
	vvsV66j5f/LDpWai5/OeK9FEAbiJ7zYCx0UryATccxKDt8fm91BVJjXZikr7eNk/GjE2k27RFAi
	N/kUg==
X-Received: by 2002:a05:6a00:4b05:b0:84f:d7e4:3404 with SMTP id d2e1a72fcca58-84fde15e1f9mr18423385b3a.11.1786913366869;
        Sun, 16 Aug 2026 13:49:26 -0700 (PDT)
Received: from thetis.home.local ([2606:c800:6024:2000:9a1e:93e3:2a6f:adab])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8517ce562cfsm2048223b3a.0.2026.08.16.13.49.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2026 13:49:26 -0700 (PDT)
From: tim.orling@konsulko.com
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH 1/2] python3-pycryptodome: fix CVE_PRODUCT
Date: Sun, 16 Aug 2026 13:49:05 -0700
Message-ID: <20260816204904.1869248-3-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 16 Aug 2026 20:49:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243564

From: Tim Orling <tim.orling@konsulko.com>

With this change, 2 Patched CVEs are properly reported:
* CVE-2018-15560
* CVE-2023-52323

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 meta/recipes-devtools/python/python3-pycryptodome_3.23.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/python/python3-pycryptodome_3.23.0.bb b/meta/recipes-devtools/python/python3-pycryptodome_3.23.0.bb
index 2528162ff8..1b2a5edd38 100644
--- a/meta/recipes-devtools/python/python3-pycryptodome_3.23.0.bb
+++ b/meta/recipes-devtools/python/python3-pycryptodome_3.23.0.bb
@@ -3,3 +3,4 @@ inherit python_setuptools_build_meta
 
 SRC_URI[sha256sum] = "447700a657182d60338bab09fdb27518f8856aecd80ae4c6bdddb67ff5da44ef"
 
+CVE_PRODUCT = "pycryptodome:pycryptodome"
-- 
2.47.3


