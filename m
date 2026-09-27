Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E801BCA5FAB
	for <webhook@archiver.kernel.org>; Sun, 27 Sep 2026 07:43:56 +0000 (UTC)
Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.33589.1790495032954765362
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Sep 2026 00:43:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=L6lqOjqA;
 spf=pass (domain: smile.fr, ip: 74.125.225.76, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843c3ee4cfso945459f8f.2
        for <openembedded-core@lists.openembedded.org>; Sun, 27 Sep 2026 00:43:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1790495031; x=1791099831; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=oK2nkp1tt6doPFQ8wvm/dlIVPe2xuc50dBC1MAIu4o4=;
        b=L6lqOjqABp8OebHqpOu3EHNS83PKWkPoevi95eDH3MS8a2Uz5b4iuWcuwLwoKn84Dm
         PuDnIIv89XNnpbUwMLo4ko/fOWwqa3U2kDnWIiBp2oumqCce0KZUYHOsEorvzxXqdQqs
         8woSTnwvlTTZohWvktTrKuZrYbVnPtiNJeAeI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790495031; x=1791099831;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=oK2nkp1tt6doPFQ8wvm/dlIVPe2xuc50dBC1MAIu4o4=;
        b=YoDibxW4F9DRlLM6VOvLRYBxlm9lpxahMYkmYitb1oX66vLFQswv8QMIPbz/ighGac
         cTIvP9kMHZE3tntgrXUX1fJ+LxIfiHVQWlIcU7ouc18bkHZPtGVLoidtn9nQtpZukFlb
         BWLJ3t9flosHon3a4vaBPDaMQGU/hFxY/d1Zk7/ZzO2q5VcvIEZFcqRX3ZF/IghsViwn
         yzYCN1JkCsPTVq1xwlebA0yhukEShHvB+yZgL9Vff8JjtT36nnXMveTXXgnovXBeWw6L
         1lKf0dArYpQ2eWihRlPIx/h9H21ot4r1FMzEy8IOQQjW9TNcSb9BgOg2/jy5hG7ZxWLk
         4X1A==
X-Gm-Message-State: AFq9FYIOM/yjefzvFgYBjEgOmAcpWkAKHBtDjSPn9dOed9ph2yRm1uGZ
	o/9oLdlNNiadncZ5P5XCx4KcqkaOpMPZ+wOE3RLUtIUJA/u+nuVwlaf2hs4MWNC7wwBrhZKvGsx
	K05wZCVM=
X-Gm-Gg: AYBFou0TFR9vI8hT1pMlETRgG9DHosHlPK7Ae16k5uv7ikRh/1Wy3HctsR8swkEq6Ne
	p0jHJMn2zksSm4oDW2BG5ISdGfQN2gklEj6G/4QzV9ieyu72vSVbnSefPXVJwVGNn31o1jenNGP
	AsSljMM6ZPdaupLCFyqAVtPfPh5S7Nwnf0eB8RLvlbnnc+cfCa56dHObkDCyu2COKeDUj1mYn0e
	AuzFXuumhDqxrk/6cqz50tYUIwxAXsE2bM5wUV9174edfIxqYzsMnfJaD6hggilFoFvylQgESx2
	PF8bX9Te+suWvxDpUrlcl/glZsWrJXqQhS1+muUIvnQpo3nyFFurOR3L5aD4Rnf+JtCaJ34Gm7J
	xFo88d3Eu9f7e0QqdkzGii7fntIJZMWI+sur2W+Ky6rdbNTaMtsEsUj51+W8ifONSyz9alFQVHd
	FCxuKeovwMNyLbmfNZhGKItJdKphLJNDbFhoWaLESrtxCSGtP+o0/qTBSRN30TEhMRmGO4q+s+k
	Ei1s3hUDRSBr//r+2iYUyHLkuqzWWackPrYR21RojimN6vGHgo4NXgFrDV3T7xfC9yE7yL+HQ==
X-Received: by 2002:a05:6000:288e:b0:488:80d4:754d with SMTP id ffacd0b85a97d-48880d47663mr12081943f8f.40.1790495031209;
        Sun, 27 Sep 2026 00:43:51 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a30c43asm19821375f8f.3.2026.09.27.00.43.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 00:43:50 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 17/28] python3-sbom-cve-check: update to version 1.3.5
Date: Sun, 27 Sep 2026 09:43:08 +0200
Message-ID: <c7f050793137ae539efc826e4050a2d0f08c33ac.1790494949.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1790494949.git.yoann.congal@smile.fr>
References: <cover.1790494949.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Sep 2026 07:43:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246667

From: Benjamin Robin <benjamin.robin@bootlin.com>

For details on this new release, see:
https://github.com/bootlin/sbom-cve-check/releases/tag/v1.3.5

Signed-off-by: Benjamin Robin (Schneider Electric) <benjamin.robin@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(From OE-Core rev: 65804d3f2eec44a3bdba68d8865619818886a4d1)
Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 ...-sbom-cve-check_1.3.4.bb => python3-sbom-cve-check_1.3.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/sbom-cve-check/{python3-sbom-cve-check_1.3.4.bb => python3-sbom-cve-check_1.3.5.bb} (82%)

diff --git a/meta/recipes-devtools/sbom-cve-check/python3-sbom-cve-check_1.3.4.bb b/meta/recipes-devtools/sbom-cve-check/python3-sbom-cve-check_1.3.5.bb
similarity index 82%
rename from meta/recipes-devtools/sbom-cve-check/python3-sbom-cve-check_1.3.4.bb
rename to meta/recipes-devtools/sbom-cve-check/python3-sbom-cve-check_1.3.5.bb
index c26ce6e6b30..83d420835da 100644
--- a/meta/recipes-devtools/sbom-cve-check/python3-sbom-cve-check_1.3.4.bb
+++ b/meta/recipes-devtools/sbom-cve-check/python3-sbom-cve-check_1.3.5.bb
@@ -5,7 +5,7 @@ LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=570a9b3749dd0463a1778803b12a6dce"
 
 PYPI_PACKAGE = "sbom_cve_check"
-SRC_URI[sha256sum] = "aa2f4e183b600fdad7ce6eb67f7d642bd3e7c67293ae9ffda7d3a2fde433e02b"
+SRC_URI[sha256sum] = "9ed8b0e9c46015444cd3e30332d9558e0be5f5fec97f6df47c6760166a314167"
 
 inherit pypi python_hatchling
 

