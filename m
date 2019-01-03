Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
	[209.85.215.194])
	by mail.openembedded.org (Postfix) with ESMTP id CFD766011C
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Jan 2019 07:40:59 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id n2so15660699pgm.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Jan 2019 23:41:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=aqSEJxiqt0zozoFHZLY4lp6H698xgs3t71b7vT2x4Js=;
	b=NlCppZ6td2IUUibnKmuNN52/FLjk/UoOXTaL38qOdp/zcHTKrrs0ezEiFclZj0AUeq
	WSmLHfhKmxtmvE/xHw8dDXIhI50p4EFKegTFyIawI5HwK5Bq3+sazOe5lLwB4B5HR1Kt
	KwnnPvrtf3/Ttmao0ZMDvvXPkaWGHqIR+l/HEyxFtrqrPDZu2qcMmQwBprs5GCL4y6ML
	u2j46UzhdUUHOXUpJi6qYiWo/POLfuUfAf2jDYI5gy1l651Sj1jD6tDbCUqo2LU4GEfp
	e5b2JJjPZB0zFILAPsHygVeKmoYMsrfWYyuslrU3zujq5pJMW1TO8F6JqwCfkFepSpZ9
	RKnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=aqSEJxiqt0zozoFHZLY4lp6H698xgs3t71b7vT2x4Js=;
	b=s/75PNGNAr/Mva718pvpBsYEnPACgcY1VmKuECoC14OairjZWVktd5JhgTPSsxlSoY
	40NvjmQ9IXdSAsVYF9Gd28ekvDUG93CnzsNB0F/POEBwP2tNPoNk4au04hWEDirhaGWD
	oaocsKI1CVMwHcGEhrpvmvcrmVlSp7YWLQoITh2Qbl4kMahV4NrynQjKrWCtvi9FCf69
	aIdxgz/CNAfPGZ+IwRlxdFVs/pCsxvIkXbfu4Mln1fPhRqEF6rWFzqz5FmCz9VGnGhwd
	UtJhGFQDqKhfq+f3h2nqVh/I75x98UzpHj+vHEULz91Xem8SUeXhrWUaI0tYQ1IxeCvp
	OTeQ==
X-Gm-Message-State: AJcUukcpwwtNpaxL/Srapg+lj6PzLQEGa2bbwcGBWxA7TC5PdnmXq17j
	xyaLaMWsAYD5+E3R8PYjRtvJelizYmY=
X-Google-Smtp-Source: ALg8bN4WbXtRCUDvBgGYWSMPjUc6Qc6BbsFxd/ZsxKO2RS+FDHabJtSae1HJ+sXfQHgOTfxfrhcmzA==
X-Received: by 2002:a63:2a4a:: with SMTP id q71mr44107737pgq.374.1546501260479;
	Wed, 02 Jan 2019 23:41:00 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:877f:9499::6ee7])
	by smtp.gmail.com with ESMTPSA id
	t67sm102071255pfd.90.2019.01.02.23.40.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 02 Jan 2019 23:40:59 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  2 Jan 2019 23:40:42 -0800
Message-Id: <20190103074042.10307-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH V2] arch-armv4.inc, arch-armv5.inc: Do not tie generating thumb ISA to -march
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
X-List-Received-Date: Thu, 03 Jan 2019 07:41:00 -0000
Content-Transfer-Encoding: 8bit

-march=armv5't'e means that CPU can execute thumb ISA, we do not need to
tie this to exclusively generating thumb ISA, this change means that
when we have thumb in tune features then it can use 't' in -march
options irrespective of ISA being thumb or arm.

This fixes derivative of armv5 tunes and paves way for gcc9 where e.g.
armv5e is dropped and minimum arch supported is armv5te

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/machine/include/arm/arch-armv4.inc | 2 +-
 meta/conf/machine/include/arm/arch-armv5.inc | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/conf/machine/include/arm/arch-armv4.inc b/meta/conf/machine/include/arm/arch-armv4.inc
index 813ed159dc..47a7ad2830 100644
--- a/meta/conf/machine/include/arm/arch-armv4.inc
+++ b/meta/conf/machine/include/arm/arch-armv4.inc
@@ -2,7 +2,7 @@ DEFAULTTUNE ?= "armv4"
 
 TUNEVALID[arm] = "Enable ARM instruction set"
 TUNEVALID[armv4] = "Enable instructions for ARMv4"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'armv4', ' -march=armv4${ARMPKGSFX_THUMB}', '', d)}"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'armv4', ' -march=armv4t', '', d)}"
 # enable --fix-v4bx when we have armv4 in TUNE_FEATURES, but then disable it when we have also armv5 or thumb
 # maybe we should extend bb.utils.contains to support check for any checkvalues in value, now it does 
 # checkvalues.issubset(val) which cannot be used for negative test of foo neither bar in value
diff --git a/meta/conf/machine/include/arm/arch-armv5.inc b/meta/conf/machine/include/arm/arch-armv5.inc
index 46f631c819..f9068af9de 100644
--- a/meta/conf/machine/include/arm/arch-armv5.inc
+++ b/meta/conf/machine/include/arm/arch-armv5.inc
@@ -2,7 +2,7 @@ DEFAULTTUNE ?= "armv5"
 
 TUNEVALID[armv5] = "Enable instructions for ARMv5"
 TUNECONFLICTS[armv5] = "armv4"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'armv5', ' -march=armv5${ARMPKGSFX_THUMB}${ARMPKGSFX_DSP}', '', d)}"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'armv5', ' -march=armv5t${ARMPKGSFX_DSP}', '', d)}"
 MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'armv5', 'armv5:', '' ,d)}"
 
 require conf/machine/include/arm/arch-armv4.inc
-- 
2.20.1


