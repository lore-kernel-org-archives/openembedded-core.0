Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11268CA5FA9
	for <webhook@archiver.kernel.org>; Sun, 27 Sep 2026 07:43:56 +0000 (UTC)
Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.33587.1790495031464307360
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Sep 2026 00:43:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=CGcyZrp1;
 spf=pass (domain: smile.fr, ip: 74.125.225.140, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cd4ba9f68so24097625e9.1
        for <openembedded-core@lists.openembedded.org>; Sun, 27 Sep 2026 00:43:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1790495030; x=1791099830; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=9F8ehRXL7I39966yFoBsmuX7q8wuFbhoriGJX7Bp5Qc=;
        b=CGcyZrp15YtiACthkkqW5a5bG1HBmf9F1+TcPVAEv+Hthc0PM1SgDkCQHwaGY5bCVV
         vOdK6JcUibtFIPqvLw0lwQmiej+NGdXNjDRP/0cix/fNkPvC+DJ1bCbSge8oAEHYm5eN
         GdrkOhZg1D58GSTwJ5SlTV+DY2Bm3M3k3kGqY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790495030; x=1791099830;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=9F8ehRXL7I39966yFoBsmuX7q8wuFbhoriGJX7Bp5Qc=;
        b=1nxcMpvx10BT86tqyYenBL6zzkDJheuxpZqHqzc/dGezJK5BJjBWoAunM8HfEPPFjl
         IS9XaVPjU6Q/QADY3LufzTyVX+i5XN0YrNAz3XMfU0KXYK0kPkWoBu86ifLKgu1kOwb+
         qpE2TQJurP66+HUmuuAxARL5sr8feS9W4/KNTpJqw4+HwB7F5g4qw0y1xMUIxqko0/75
         WV6TO5M8I8fDIt31qqX1shbOim7KsKX24LrthjWfl5cKIuBMIQ7MfWZQN7YFPN+vOa5w
         CucVk/SOrqDFsGqHYwh5I4K4M/fFMxYQdFyYNbVTs34ABodUjNbtiooNd73e0SoBt+Ml
         jbpA==
X-Gm-Message-State: AFuF++n3em3DSM6qTQ48kF1/ZXGn6DGg5oISR9fSY3aYkNRxSyXj5grW
	RtNAoPdXcwpBv0yPnbYzV1iBOJxYQT101V/Qlcze35Prc2wls1aEySEFFJBagyw/XH5GkMjhalj
	qEr8e3OU=
X-Gm-Gg: AYBFou0LCBfAFxottBIrYH3HprqedB2neOP2JqutMW+l2Psdi/aLX7hL04wpnv41cVX
	y+axkaIPUDpyi0ACe4OdQ3nx9rLkonVVZ8uqqOh7QJAlbqTjF1E2IlEmwNVl6m3fAa2o81HGPjs
	g0t1n2E+VJnHKBqR+eRp+gDd4XPO4YOqXih7GXneKa6o1MkXEl96Yj3/5fz5+xj8YW0Z5rJOilQ
	MtUG5Y/oz6b/gv2bMDVV4DI0X5G7fOko3QYVxlsXRb1DwhGMqHOJf+D6mslC0/FFMTEEe1b5ntQ
	YDkTh38LvQm+Y4dtQkHe3Usyt08sqC8SHW5mshLcNJf2S/+f9Wf/RBd0J2ufcAKhJVKwjF3HhcH
	2xaELnI+P5JxGDsY0fF+EoeKimnB4pc1+DDkgcmQ1GRmKiEO9zN3PBCyYM1bzETCcz1lqEtJZn6
	hFoF36r2r8Y6p/MQtkFnra5bVEVpS4a9+SaSXzWjEtnYK1LAyhQZAJ1gntalonXZv2m8ok+X0lu
	ZssXPlCzrwYga0VvHOQJXxFmAtxz2UyvVDDsT9xZc6fuNkMWXY0re0uPknDG8bwOpKUX+iFv3c=
X-Received: by 2002:a05:600c:8484:b0:49c:fe46:7219 with SMTP id 5b1f17b1804b1-49fe66d8135mr171727855e9.20.1790495029693;
        Sun, 27 Sep 2026 00:43:49 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a30c43asm19821375f8f.3.2026.09.27.00.43.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 00:43:49 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 15/28] python3-sbom-cve-check: update to version 1.3.4
Date: Sun, 27 Sep 2026 09:43:06 +0200
Message-ID: <e783a4032e945dcf51c7358d4d7dd1b54b2b04fa.1790494949.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1790494949.git.yoann.congal@smile.fr>
References: <cover.1790494949.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Sep 2026 07:43:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246665

From: Benjamin Robin <benjamin.robin@bootlin.com>

For details on this new release, see:
https://github.com/bootlin/sbom-cve-check/releases/tag/v1.3.4

Signed-off-by: Benjamin Robin (Schneider Electric) <benjamin.robin@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(From OE-Core rev: 9fcb4b9b16594710b8be34b228042c426b48ee0e)
Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 ...-sbom-cve-check_1.3.3.bb => python3-sbom-cve-check_1.3.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/sbom-cve-check/{python3-sbom-cve-check_1.3.3.bb => python3-sbom-cve-check_1.3.4.bb} (82%)

diff --git a/meta/recipes-devtools/sbom-cve-check/python3-sbom-cve-check_1.3.3.bb b/meta/recipes-devtools/sbom-cve-check/python3-sbom-cve-check_1.3.4.bb
similarity index 82%
rename from meta/recipes-devtools/sbom-cve-check/python3-sbom-cve-check_1.3.3.bb
rename to meta/recipes-devtools/sbom-cve-check/python3-sbom-cve-check_1.3.4.bb
index 2aca1005694..c26ce6e6b30 100644
--- a/meta/recipes-devtools/sbom-cve-check/python3-sbom-cve-check_1.3.3.bb
+++ b/meta/recipes-devtools/sbom-cve-check/python3-sbom-cve-check_1.3.4.bb
@@ -5,7 +5,7 @@ LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=570a9b3749dd0463a1778803b12a6dce"
 
 PYPI_PACKAGE = "sbom_cve_check"
-SRC_URI[sha256sum] = "8b766be1ae92b4eceaa2f694dd4724e310886c6436f44267a6bbc6a7b81ab8b9"
+SRC_URI[sha256sum] = "aa2f4e183b600fdad7ce6eb67f7d642bd3e7c67293ae9ffda7d3a2fde433e02b"
 
 inherit pypi python_hatchling
 

