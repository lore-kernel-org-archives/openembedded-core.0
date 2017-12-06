Return-Path: <nathan@nathanrossi.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id 23C01786D9
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Dec 2017 09:43:31 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id k134so1973249pga.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Dec 2017 01:43:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=date:message-id:from:to:cc:subject:mime-version
	:content-transfer-encoding;
	bh=HizPG0ODRk8k61i8nXY5JY00pzDixq7lJkay95kPpkE=;
	b=JLzbo/kSTgmQFRFYSQD1uw+N2jAjGWXeQW/cw77Z0lTRWDBRZck5Btnx5JQpTlkRcL
	FtYaBeM6SPDbzEn+ksQbMM7PXkM6LG6UXKg3/d2b9jFijDazfeJ3rcGM4wx71P52avU2
	JxLFbx6aRxRQdd/zPkJWZtMV1AR25q7IQ8M3GGQcBnS34o+0CEGqShs/LTDCJMO0SiNf
	nRzEqQeFknyiVtRxIQK6CiGapLzdA9/20/menQIS5kEJQKMMA9poSo194mKpD+7sgEOS
	rKe4xTcV0T9+ApBAlnSElvJvmM32XM+RkrA7MsJIdubPMyvvN6/NtY8iQs3YZU5J+Afx
	LljQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:message-id:from:to:cc:subject:mime-version
	:content-transfer-encoding;
	bh=HizPG0ODRk8k61i8nXY5JY00pzDixq7lJkay95kPpkE=;
	b=QNheKmd1efHKRHNf+/4DGplPGuu0TU4zTjknGizVDYmdsBTfcwCF6Kvf/ETx88nn59
	RaP+wBvkoXzotEVn3EWOMS14s+vFGR73gg/ncwdmCzEAow8Aj4fYslQ2cPAvwFBTEuqm
	OVYWEdSfbUwVMEGurf9mAg8ZXM2+G3tbCeVgRnxN1p8O3lqEGz30ZZmZM0ZioR6A47WB
	+A/3FWEYFEd8zWoInSvCW8mREd/ujgW6Qx0iyCUYbdT2aEv4MaAMA9vl5j1LFhp19jcH
	fORPETBj6c0mVKFQCuhdxNRTQhOSHCwBoTrsBqD4lyPaPoDNjjGuQIuXWbczyGsMUlfn
	SpMw==
X-Gm-Message-State: AKGB3mKoqsAhLUDAmXmjxy04uGiU6g3M/ZA9TiIP0Tt14k482VITKgFm
	+0i1K85JSGiJPbhHERmDPDwBr7PJTSU=
X-Google-Smtp-Source: AGs4zMbiDPsg9etyK3wNYFUHGmk5Jy2OCyaxMMR2k4KD37b39T49gQPu47FEbiwbYdDGBmZd/byEew==
X-Received: by 10.98.38.66 with SMTP id m63mr2213904pfm.0.1512553413068;
	Wed, 06 Dec 2017 01:43:33 -0800 (PST)
Received: from [127.0.1.1] ([58.165.131.151]) by smtp.gmail.com with ESMTPSA id
	j62sm3222339pgc.35.2017.12.06.01.43.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 06 Dec 2017 01:43:32 -0800 (PST)
Date: Wed, 06 Dec 2017 19:43:28 +1000
Message-Id: <20171206094328.23072-1-nathan@nathanrossi.com>
From: Nathan Rossi <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
MIME-Version: 1.0
Subject: [PATCH] packagegroup-core-sdk: Disable SANITIZERS for MicroBlaze
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 06 Dec 2017 09:43:32 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

The libasan and libubsan sanitizers are not available for MicroBlaze.
Follow the overriding of the SANITIZERS variable as done for other
architectures to remove these from the packagegroup when targeting
MicroBlaze.

Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
---
 meta/recipes-core/packagegroups/packagegroup-core-sdk.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb b/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb
index af0ce2013e..393f0d3d13 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb
@@ -28,6 +28,7 @@ RDEPENDS_packagegroup-core-sdk = "\
 
 SANITIZERS = "libasan-dev libubsan-dev"
 SANITIZERS_aarch64 = ""
+SANITIZERS_microblaze = ""
 SANITIZERS_mipsarch = ""
 SANITIZERS_nios2 = ""
 SANITIZERS_powerpc64 = ""
-- 
2.15.0



