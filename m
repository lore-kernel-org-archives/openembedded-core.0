Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D549C982E1
	for <webhook@archiver.kernel.org>; Thu, 17 Sep 2026 22:08:05 +0000 (UTC)
Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1575.1789682883361266857
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Sep 2026 15:08:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=ceVUdxHt;
 spf=pass (domain: smile.fr, ip: 74.125.225.140, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912e2406so557385e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 15:08:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1789682882; x=1790287682; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=B2TpUqkD2mDSrK/nsQLWiVHbmbWQyLRorNHmLTBNucQ=;
        b=ceVUdxHtGe0CVguu6lPuz+E0oNfW/P3jXeM+BWSluqvauXZTBHf2nMiEcgkk16XT3D
         yUJnFKIjl0BwHDP4Fou0XFQM3TXQl+1tafw+GKdWhFO526hUV/3/m+a0WTbPtbtPiydD
         max0iPP6kI2nLIBYA94xWOVMdR7GDcx4P7PAw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789682882; x=1790287682;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=B2TpUqkD2mDSrK/nsQLWiVHbmbWQyLRorNHmLTBNucQ=;
        b=TPsB9LH/sxMWavmbMYBgR+m3Kg9JgeeA7wUNsjMWL2QPB3buAemYva1gNxwIpluCm2
         NiYZO9oe/+cQluUWeIqmtDQJS4UpRGppN6Z7lJuSMrHyZgohYaf/sYF7WLRxnVc/CClv
         L5lGNBnc5eujwViVcYf57RQXkMcKq9QiXGbS1ET6Sh4kglGLxz40PGevfIB01cB02ZCb
         cSxPv/xKQOYT9vqf4vU475DotFJFdr3czNLqf7n/8AeiCtDeMp9KOl93IdsgfAPhCfw+
         3zFogJl+i0OByldV/lHCgQlUJAwliOrNsbyg6OZgY3Gchh2EXG6q/M4imrFflvWT7Pfw
         NN6g==
X-Gm-Message-State: AFuF++kEjKF1hm89vzd29QsAikOXrq6/vP8KACoH2wjXPVLpVB7xQQHb
	scyXWagfPUCH1Fw0E0g4n1v/vvbN1m/agURgtSRzt2VxpqgCK9r1Z/ld5Q+yEc5XNFRdyq1FX0+
	aE4Mu3AE=
X-Gm-Gg: AYBFou3NQSzb6nlKaK+f8b1HEftNZDcxVdxavOb/V6PQtZC0c8SN47fhKlTHWDnYxsg
	wKj9qi/GCWwj6Vd+ZGqgS5YUQ/N34ic3o/I1JMcEIVPUOkX8JTOrFSQD6rIa5WVUKVmphurVrGS
	vGCNVHYTfz2/fYedYPbLu78DWmgbiOdlRHvtS2/5yL6bcUu/bG0JdlzPgfdlEQ27Te72Tmw/W6i
	m3Pv9wPuyxPvU6dpgT6peC1R8fnj0YCW+k3q/rF0sGX4jlb8cMrN0v+NEGWx28x0cf9DN1zmgHJ
	1gfjZop5aAf9PTWR3G2IDNJlbRzzAObg0MVBrxRB2WR8iYrxfawqvtDC3piRggujzGNaUVHaHbH
	X7GxI0XG00YKKWgukQq8Gi9n28gKXBggY3pEEGVm+aKjQNGVqiyg4El3GSeOfY95nI3uVWoJnnh
	c8xfyEFxk8rc81TlI7nBFNLZ+vymX6rsBxraqgXLML37gILWbkLMwPz6fv0hY+UZT9BETthT8Bn
	n1WE11M1OIHjEh6aDkOHeHBD/14UGKcBOZi2fs6gyFhTdl+sufu8YUTmFTRzSpUK1GZoAgWBMe2
X-Received: by 2002:a05:600c:3510:b0:49e:6836:5386 with SMTP id 5b1f17b1804b1-49fc4eef2dfmr5700375e9.0.1789682881610;
        Thu, 17 Sep 2026 15:08:01 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc471b9a2sm8984075e9.0.2026.09.17.15.08.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 15:08:01 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 24/79] sbom-cve-check-update-nvd-native: update to version 2026.08.03-000011
Date: Fri, 18 Sep 2026 00:06:09 +0200
Message-ID: <bd9bc2e799f2624f07a89a876d6156dbf09570b7.1789681419.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1789681419.git.yoann.congal@smile.fr>
References: <cover.1789681419.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 22:08:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246119

From: Benjamin Robin <benjamin.robin@bootlin.com>

Update fkie-cad/nvd-json-data-feeds to the CVE database from 2026.08.03.

Signed-off-by: Benjamin Robin (Schneider Electric) <benjamin.robin@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(From OE-Core rev: 5928cf1985d65b5dc7a909df596d7ff91533fccd)
Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 ...bb => sbom-cve-check-update-nvd-native_2026.08.03-000011.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/sbom-cve-check/{sbom-cve-check-update-nvd-native_2026.07.23-000007.bb => sbom-cve-check-update-nvd-native_2026.08.03-000011.bb} (89%)

diff --git a/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-nvd-native_2026.07.23-000007.bb b/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-nvd-native_2026.08.03-000011.bb
similarity index 89%
rename from meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-nvd-native_2026.07.23-000007.bb
rename to meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-nvd-native_2026.08.03-000011.bb
index cf35b169235..720b5ded0ac 100644
--- a/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-nvd-native_2026.07.23-000007.bb
+++ b/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-nvd-native_2026.08.03-000011.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/fkie-cad/nvd-json-data-feeds"
 SRC_URI = "git://github.com/fkie-cad/nvd-json-data-feeds.git;branch=main;protocol=https;destsuffix="
 SBOM_CVE_CHECK_DB_NAME = "nvd-fkie"
 
-SRCREV = "64a0cea215628d780438fba8bfe0f3300db1b702"
+SRCREV = "b9f52bb052695dac5cabbd58e049eaac73697161"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>.+)"
 
 require sbom-cve-check-update-db.inc

