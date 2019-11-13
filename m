Return-Path: <jpewhacker@gmail.com>
Received: from mail-il1-f195.google.com (mail-il1-f195.google.com
	[209.85.166.195])
	by mail.openembedded.org (Postfix) with ESMTP id D3A336069C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2019 21:24:05 +0000 (UTC)
Received: by mail-il1-f195.google.com with SMTP id s75so3200693ilc.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2019 13:24:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=dw2qz0AxHiwQjWdTx5M1vc7V5Lx9t8az1kpeMKs5n64=;
	b=g6+sQ9GoQ32fQx6jnGSxmdgHNLweNUIGF3N0GOUArgIkSacvD/5DHiB66NyNTvn3WF
	cz2nLlHGS/1tsHaE1HzM6QAQRe7Kimsdpfgzf3I14hokSRIBNzk5D217UAdj7Yt/npU7
	qqarvDE4eoMGmMVyChJSlSiCRXZcEPDMSHcXsXAwSgyw55CGJmGmzt8+ks2FK0j7rswY
	OOWEc4+MdcLumwPMQeCyzj06Szj4S68o4GRko25RO1fyZOa3uddrwkCi9sOOGUpr1VYF
	BqBOccKkaicFNOr7D28fLJJouPC1jUlOtFnP2xwqqsbskEaTcKvVq1VLV3P+HwMofTtB
	NHGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=dw2qz0AxHiwQjWdTx5M1vc7V5Lx9t8az1kpeMKs5n64=;
	b=aFmpqPVY/JISeI589pvxnk9kOYt5WEnq3e/1AEjDIIJPsf8Gk31g5uGWuYnKeKzimd
	ke5DlE7E3paxNZuJnjIpd6w11YuF2g48od6T6+Gfi090BxZjfBttUSEcN2p7LDyGRnOG
	zU0u70/8BHW+bzxefhrVj3LVfMleWjQMs64I4eHlXpZ77elkmN0EWtO/V+VTDH0Is5Is
	oFgI4Fd4sS6g3OX0HK/DWeFNt3mtjBEarJpiVMsdLBUcDqmvBrQep46aiGwjIeRKI6Yk
	SW45nv5bDFBl/QuaB6DunwCli0W/puktGtSuuY3RxoMr7t3YQf+0aHSwXIJsnPEDw5pC
	sCGg==
X-Gm-Message-State: APjAAAXynQW5c46oQ9gEqEa3sibf1Ss6l7Dmb6p4SsjVhwoUn9Y5YcPG
	spBLKVWWb1BtAGUAOrei80ZJYzA1Ky0=
X-Google-Smtp-Source: APXvYqyYJut1W+jYccW4lJK5SwhVmNXpQU+V3SXLgpxAlfIS4pFPAGUI4Mre2ygV3nyBWHSomwnIGw==
X-Received: by 2002:a92:6609:: with SMTP id a9mr6570627ilc.131.1573680245020; 
	Wed, 13 Nov 2019 13:24:05 -0800 (PST)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.gmail.com with ESMTPSA id w9sm444401ilo.68.2019.11.13.13.24.04
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 13 Nov 2019 13:24:04 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Nov 2019 15:24:00 -0600
Message-Id: <20191113212400.898834-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [PATCH] icecc-create-env: Use OE patchelf in SDK
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
X-List-Received-Date: Wed, 13 Nov 2019 21:24:06 -0000
Content-Transfer-Encoding: 8bit

The Icecream environment creation script runs when the SDK is installed
and uses patchelf to fix up executables. Rather than rely on the host
system to provided patchelf (which often can be older versions that
produce buggy executables), mark the OE version of patchelf as a
dependency of icecc-create-env when included in the SDK.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/recipes-devtools/icecc-create-env/icecc-create-env_0.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/icecc-create-env/icecc-create-env_0.1.bb b/meta/recipes-devtools/icecc-create-env/icecc-create-env_0.1.bb
index 053945ebbc..231c1c20ec 100644
--- a/meta/recipes-devtools/icecc-create-env/icecc-create-env_0.1.bb
+++ b/meta/recipes-devtools/icecc-create-env/icecc-create-env_0.1.bb
@@ -34,3 +34,5 @@ do_install() {
 }
 
 BBCLASSEXTEND = "native nativesdk"
+
+RDEPENDS_${PN}_class-nativesdk = "patchelf"
-- 
2.23.0


