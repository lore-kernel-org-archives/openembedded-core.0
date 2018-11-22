Return-Path: <alexey.brodkin@synopsys.com>
Received: from smtprelay.synopsys.com (smtprelay4.synopsys.com [198.182.47.9])
	by mail.openembedded.org (Postfix) with ESMTP id 2E30A6C019
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Nov 2018 12:06:03 +0000 (UTC)
Received: from mailhost.synopsys.com (mailhost2.synopsys.com [10.13.184.66])
	by smtprelay.synopsys.com (Postfix) with ESMTP id 3495824E13A9;
	Thu, 22 Nov 2018 04:06:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1542888365; bh=uLVde2z2digV8FENoqLTMTExWAUG6Lbwb91RGEvOn3E=;
	h=From:To:Cc:Subject:Date:From;
	b=AJfCvnhAUU+hp37iESMfJXSh4a/A4MAWje8kkcvrhSUIHU+RKSGDTjUupsqDEHqXz
	3kWOI83LQojp6NHCvh3PB6DcZvtrfm23UZQRa0/ymqdWb5E72Fin2Ho2n7f/fizfbd
	YvQ6zXomnp4Kk554dfaB2TmsMFP8c8oK3zW2IrCkDl8a5pGs/wjUFDBrQu8n7bURrG
	DYy0Yt4TTJK0B8Qa1tXHWy8605j/wJk+w7SfAp+Z4ssvivWp77IivcPOFoWBHIgHGP
	4i/x2ibT7w6QxnPqxtd+N5y3RcQQJyLCD8eS4HiDryOw/AmGvEo9iMOsj92pfua0q6
	MPizU6ptHJlsA==
Received: from ru20arcgnu1.internal.synopsys.com
	(ru20arcgnu1.internal.synopsys.com [10.121.9.48])
	by mailhost.synopsys.com (Postfix) with ESMTP id D00FE3984;
	Thu, 22 Nov 2018 04:06:03 -0800 (PST)
From: Alexey Brodkin <alexey.brodkin@synopsys.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Nov 2018 15:06:00 +0300
Message-Id: <20181122120600.10061-1-abrodkin@synopsys.com>
X-Mailer: git-send-email 2.16.2
Cc: linux-snps-arc@lists.infradead.org,
	Alexey Brodkin <alexey.brodkin@synopsys.com>
Subject: [PATCH] gcc: Select proper ARC CPU when build for target
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
X-List-Received-Date: Thu, 22 Nov 2018 12:06:04 -0000

By default GCC for ARC is configured with ARC700 CPU.
This means when we don't pass "-mcpu=xxx":
 a) Code will be compiled for ARC700
 b) Libs will used for ARC700

And if we happen to run on ARCv2 core like ARC HSxx we
won't be able to use target gcc w/o "-mcpu=xxx" which
is not very convenient as we want to build "target" toolchain
but not canadian-cross.

Note the trick here is we set TUNE_PKGARCH in just 2 values,
it is either "arc700" for all ARCompact cores (ARC750 & ARC770)
and "archs" for all ARCv2 cores (ARC HS38 & HS48), see [1].
This gives us usable defaults.

For cross-compilation we use TUNE_CCARGS for fine-tuning depending
on which HW features we have on the current target so that
we may have HW feature A & B or B & C or A & B & C, see [2].

[1] https://github.com/foss-for-synopsys-dwc-arc-processors/meta-synopsys/blob/master/conf/machine/include/tune-arcv2.inc#L4
[2] https://github.com/foss-for-synopsys-dwc-arc-processors/meta-synopsys/blob/master/conf/machine/include/tune-arcv2.inc#L34

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
---
 meta/recipes-devtools/gcc/gcc-target.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/gcc/gcc-target.inc b/meta/recipes-devtools/gcc/gcc-target.inc
index bc2236fed0..6270059644 100644
--- a/meta/recipes-devtools/gcc/gcc-target.inc
+++ b/meta/recipes-devtools/gcc/gcc-target.inc
@@ -20,6 +20,7 @@ ARMFPARCHEXT ?= ""
 EXTRA_OECONF_append_armv6 = " --with-arch=armv6${ARMFPARCHEXT}"
 EXTRA_OECONF_append_armv7a = " --with-arch=armv7-a${ARMFPARCHEXT}"
 EXTRA_OECONF_append_armv7ve = " --with-arch=armv7ve${ARMFPARCHEXT}"
+EXTRA_OECONF_append_arc = " --with-cpu=${TUNE_PKGARCH}"
 
 # libcc1 requres gcc_cv_objdump when cross build, but gcc_cv_objdump is
 # set in subdir gcc, so subdir libcc1 can't use it, export it here to
-- 
2.16.2


