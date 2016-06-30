Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f67.google.com (mail-pa0-f67.google.com
	[209.85.220.67])
	by mail.openembedded.org (Postfix) with ESMTP id 63C5A601B8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jun 2016 06:26:19 +0000 (UTC)
Received: by mail-pa0-f67.google.com with SMTP id av7so6339926pac.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jun 2016 23:26:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=SzrPbZ/BZiLZ3lQeO6Nk7DfbcrgnzReAEYTk/vshLgU=;
	b=sHiu2qnMWKfTsH/71V+WmdQnk98scbITtNB6JXhDQG9klfJPE4W8yIgFe6Lco0NVWp
	5jZzgP6LLSsr7iKvsF9mocWlyjUznxbUrD0V1YKSpXSmQ/VxWIDM7alIWPGaBZ/Fgj87
	vZj4U77LVvYlitZmgNlmjgYLN29p9FCKRxRR+Zm+RCo1U5rElgHT6KUHT+af6WAehYlX
	L8cqQCZx8chRmAailbE2KZ9P0dOJ8ZciJJml16jfYDwhuIPngjaDkr8swSwJYNCJy9s8
	Nx7n88q4I2M0Ejb6yqvmuGDieM0t21gDzGZpAj+YeqT4w1xhDTFeG/DB5qX0n7VlWJDU
	FxSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=SzrPbZ/BZiLZ3lQeO6Nk7DfbcrgnzReAEYTk/vshLgU=;
	b=huDhGw/Z+W8tUTWaICK+C4RTwlBR7Orv00dqfqDUe8sKQj4mdEGcXHpYL9KRn4d+9P
	jo9zgkQgkj6n2AtRFtlqJkwTBv9Cn8pKFPE/HLu78jufTs/HgCUYyiLODtcFwZQEGR1y
	jocPI2rI+u7wgFuD6yvFcQ8p0d7lvC2WBe26xDUcW40QfgMGChpQ4wLkRYuz0jrQnvoR
	93DBJqoPFZCFAb+0YjhC4AeJt5KuzaMSojFBohpPDo/Luv1MMPF2/vM/AwJOKc50Otks
	Z2VrNuHGjsHXLdbbIu7lULJag1+rYNb9nJ+chowOlg/TGElB6T/TBwceqUFwNjIIWa2e
	1i3g==
X-Gm-Message-State: ALyK8tIrnWuBiK6vNs2G2kNx2sIXHEIaHMZLCil5K+rxcTIFmvgiqc15zJ63ItLtqSzp9Q==
X-Received: by 10.66.150.67 with SMTP id ug3mr18602187pab.41.1467267980479;
	Wed, 29 Jun 2016 23:26:20 -0700 (PDT)
Received: from localhost.localdomain ([76.126.209.57])
	by smtp.gmail.com with ESMTPSA id u4sm2383094pfi.53.2016.06.29.23.26.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 29 Jun 2016 23:26:18 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 29 Jun 2016 23:26:11 -0700
Message-Id: <1467267971-15500-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [krogoth][PATCH] feature-arm-vfp.inc: fix overzealous ARMPKGSFX_FPU modification
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
X-List-Received-Date: Thu, 30 Jun 2016 06:26:22 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <git@andred.net>

Since commit 972b4fc (feature-arm-neon.inc: restore vfpv3-d16 support)
we're replacing _all_ dashes (-) in ARMPKGSFX_FPU, which is causing
problems for all legitimate uses of the dash as TUNE_PKGARCH doesn't
have the right value anymore:

E.g. on raspberrypi2:

ERROR:  OE-core's config sanity checker detected a potential misconfiguration.
    Either fix the cause of this error or at your own risk disable the checker (see sanity.conf).
    Following is the list of potential problems / advisories:

    Error, the PACKAGE_ARCHS variable (all any noarch armv5hf-vfp armv5thf-vfp
armv5ehf-vfp armv5tehf-vfp armv6hf-vfp armv6thf-vfp armv7ahf-vfp
armv7at2hf-vfp armv7vehf-vfp armv7vet2hf-vfp armv7vehf-neon armv7vet2hf-neon
armv7vehf-neon-vfpv4 armv7vet2hf-neon-vfpv4 cortexa7hf-vfp cortexa7hf-neon
cortexa7hf-neon-vfpv4 cortexa7t2hf-vfp cortexa7t2hf-neon
cortexa7t2hf-neon-vfpv4 raspberrypi3) for DEFAULTTUNE (cortexa7thf-neon-vfpv4)
does not contain TUNE_PKGARCH (cortexa7hf-neonvfpv4).

Fix this by being more explicit about what we're modifying.

Reported-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: André Draszik <git@andred.net>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/machine/include/arm/feature-arm-vfp.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/machine/include/arm/feature-arm-vfp.inc b/meta/conf/machine/include/arm/feature-arm-vfp.inc
index bd366a1..9ef31e7 100644
--- a/meta/conf/machine/include/arm/feature-arm-vfp.inc
+++ b/meta/conf/machine/include/arm/feature-arm-vfp.inc
@@ -6,7 +6,7 @@ TUNEVALID[vfp] = "Enable Vector Floating Point (vfp) unit."
 TUNE_CCARGS_MFPU .= "${@bb.utils.contains('TUNE_FEATURES', 'vfp', ' vfp', '', d)}"
 
 TUNE_CCARGS  .= "${@ (' -mfpu=%s ' % d.getVar('TUNE_CCARGS_MFPU', True).split()[-1]) if (d.getVar('TUNE_CCARGS_MFPU', True) != '') else ''}"
-ARMPKGSFX_FPU = "${@ ('-%s'        % d.getVar('TUNE_CCARGS_MFPU', True).split()[-1].replace('-', '')) if (d.getVar('TUNE_CCARGS_MFPU', True) != '') else ''}"
+ARMPKGSFX_FPU = "${@ ('-%s'        % d.getVar('TUNE_CCARGS_MFPU', True).split()[-1].replace('vfpv3-d16', 'vfpv3d16')) if (d.getVar('TUNE_CCARGS_MFPU', True) != '') else ''}"
 
 TUNEVALID[callconvention-hard] = "Enable EABI hard float call convention, requires VFP."
 TUNE_CCARGS_MFLOAT = "${@ bb.utils.contains('TUNE_FEATURES', 'callconvention-hard', 'hard', 'softfp', d) if (d.getVar('TUNE_CCARGS_MFPU', True) != '') else '' }"
-- 
2.7.4


