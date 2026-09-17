Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E36F1C982DF
	for <webhook@archiver.kernel.org>; Thu, 17 Sep 2026 22:08:04 +0000 (UTC)
Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1569.1789682879838982372
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Sep 2026 15:08:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=oHz4PL9a;
 spf=pass (domain: smile.fr, ip: 74.125.225.140, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49e69b9e16aso1211785e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 15:07:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1789682878; x=1790287678; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=jhBwWjuPbSjfgIx76vb3JkbFKFcGtHy7eYN8LtXDVrI=;
        b=oHz4PL9a4dGRLf1vGs2m2PYLL9puU4cLAQ6z2qewNghSatC5jTsPNFX+pPJeD+28Po
         9VnINsvWlI24wquh2NgtduYI7nVzkMuxZS8Gdai1sHHuWVZGPGpxS2VaR8UhXOln+B+8
         fk7JbNM4qu+GWZWbDvZFAXhIULGTSV5FpJbyI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789682878; x=1790287678;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=jhBwWjuPbSjfgIx76vb3JkbFKFcGtHy7eYN8LtXDVrI=;
        b=urqhfbJ+Jrt5AQs2dDta6BZOD1Fr1+ZDqtHNM5l8gcpKlx5e5PZKlzldRFpJ64M3W+
         /DeqAK/jWD4h1dP6wXe2MVDasq5Yj+000qIK+KhNl029pU8Z6KmS4Dr/98ubJLkxXJv+
         MFcJk5C9Q8qsvr+vRyx8yQ2aHUqAUgpCvZDLduKatETouXFQLtnuIgMfJsBBJ8CGYTTQ
         /iLd6bUwPshegAVYJaGTbnCjKLUgBpoDJN+kaj1PHtiYBmnAFOF5MeuLFAo6w9x5fJMP
         xu665c10lpBikJp9BB73sJjfHwmdDVXgwD48EwHErbbYawxGGcnGU7IPhNV48HUm4L1M
         wTzg==
X-Gm-Message-State: AFuF++keAofFZe9L6LHM3PBBBflsRP7MBDSkJU1bb0T7vKGxin/vzW3e
	2OdXGPEE65loZEJz0pI7r5C0oJmCa6rRmTRbYQI2haZiiZ/BF0nUXE8vl/hnzW9msR3uIliW8Ay
	pcVjab3Y=
X-Gm-Gg: AYBFou0zTdEcgzO0K0jlwS5uEPkDFAh6zhfaLFnlkW0AbNvuaaoefvGMgIiDnNPlx9z
	Tgo4l5wFaqyO1zdze2A5wDs4LWikWfpXqewN30iAugromst+e2TKrLaEGpdefEZT1uVX+zKj4Jc
	KKKrWuI+lHb31huA3CLqbHkzIa4R0OVG5PlJIVZL+TLY8SW+Mb+Xijlkjf4G+9jL+eLgFnfjh9c
	dEHG8abhBwQoh75cfLG23BbEfrG/Rdlr41vXF8HSTZS2B0x6PYpC+EegPrYUI9ixTXbEw4Rat/f
	830lPeK7w5Kc88wwjLQ8tzyvC7eUKKgwdOqddaKpINx0ZHWbyRg/BFOSYPg25Kt8dH2ZbkhbrP5
	lVh3g6XFFZMVj8cz7hzZv/Q3Tnzibmk4iZVu9XBO4dDtdDP06lDxDWOUuHFvZLivuPv4w7uNf8t
	M3ILQQXRU9mbxgxAeB4mrFyQkoj0z0oNVAnzpfE2Fz58xrTb2pXerSnR3EkO5TALtI9LuYfP3K/
	5/B4BLOS56bCq3kau1g64uwunqtviQWB97gUSK2CaayZCfRZhe4NH5iB3DiI8rt/uYGRpMJ4n8=
X-Received: by 2002:a05:600c:1f87:b0:49d:99:1d98 with SMTP id 5b1f17b1804b1-49fc56ae924mr3932485e9.9.1789682878136;
        Thu, 17 Sep 2026 15:07:58 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc471b9a2sm8984075e9.0.2026.09.17.15.07.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 15:07:57 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 17/79] python3-sbom-cve-check: update to version 1.3.2
Date: Fri, 18 Sep 2026 00:06:02 +0200
Message-ID: <16ac8d4ccc2cf6b6a476b657fc90b1ed4a9ab48d.1789681419.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1789681419.git.yoann.congal@smile.fr>
References: <cover.1789681419.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 22:08:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246112

From: Benjamin Robin (Schneider Electric) <benjamin.robin@bootlin.com>

For details on this new release, see:
https://github.com/bootlin/sbom-cve-check/releases/tag/v1.3.2

Signed-off-by: Benjamin Robin (Schneider Electric) <benjamin.robin@bootlin.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(From OE-Core rev: cd6313d94ac221dc37c30ffec8c83b6c8d1deeff)
Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 ...-sbom-cve-check_1.3.1.bb => python3-sbom-cve-check_1.3.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/sbom-cve-check/{python3-sbom-cve-check_1.3.1.bb => python3-sbom-cve-check_1.3.2.bb} (82%)

diff --git a/meta/recipes-devtools/sbom-cve-check/python3-sbom-cve-check_1.3.1.bb b/meta/recipes-devtools/sbom-cve-check/python3-sbom-cve-check_1.3.2.bb
similarity index 82%
rename from meta/recipes-devtools/sbom-cve-check/python3-sbom-cve-check_1.3.1.bb
rename to meta/recipes-devtools/sbom-cve-check/python3-sbom-cve-check_1.3.2.bb
index 8120848a667..f14901e3008 100644
--- a/meta/recipes-devtools/sbom-cve-check/python3-sbom-cve-check_1.3.1.bb
+++ b/meta/recipes-devtools/sbom-cve-check/python3-sbom-cve-check_1.3.2.bb
@@ -5,7 +5,7 @@ LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=570a9b3749dd0463a1778803b12a6dce"
 
 PYPI_PACKAGE = "sbom_cve_check"
-SRC_URI[sha256sum] = "675828b2f02f11620b7a229853a24d09264bf41161be5fbb80a92456f46a14e0"
+SRC_URI[sha256sum] = "0a7f07a0c6ce45d40adc6d311ddc25c4466f59bafcbce149b6fb3663791a5d89"
 
 inherit pypi python_hatchling
 

