Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
	[209.85.210.193])
	by mail.openembedded.org (Postfix) with ESMTP id 268E560125
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Jan 2019 07:10:22 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id g62so16268058pfd.12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Jan 2019 23:10:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=oTB6RDRTMLZLDVXdvctRzNC1Nb1otm2TVnTC5JkCSKg=;
	b=GR7sKSGgnEd3XAiYMPJ9HWeDzLuAKnhPzZ/0qMHkuoyd5G3LJLpHs4KBqXhxQKYRGp
	t7pKiFo/auDNzFSDiTQPQO1pjRZeqGDNjKmDRQeyFYrVSRYNTj2R31NKSKRW0ejitPbU
	Bw36tX2vzKAyGW9pcE7WRjJS4Cuh8dvITJAmi0QmkjIZdRsdlawF7TWQmPmopMfmNZDX
	dybcac21rskwFCIe0cr7w30epY1PAkVHfzg4u3ufqoRgjJWMgWy3FndGWaOiddPybR2W
	hncSLj8wLGlArfjcI+c1hf+pdPc/qhNnt8gl9ctcJgYWEL8bXssBUDQnLNah8cw3FSLg
	L3Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=oTB6RDRTMLZLDVXdvctRzNC1Nb1otm2TVnTC5JkCSKg=;
	b=R6P109JFjGsI5ePfPT/y5cFKzrI0E63FWLPVcBCfNSfBDjkIV9vhSeOfsJfipBGrlt
	EOb3qSbu8I7oiplvnnMZbeS7hDSRy/TdNSBfltUfTfcH4GPn26/TeOnnMHd7BvXuI0Wg
	ywn23ZB8/g0p5kWTJEf3wXHzoXISfjUMt60qHwfZ6m+EEgy8vN35LDRaMHiWpAngTdZ3
	swrP/sR2qOnyvTYcC5n0WAN7SztqE7fQmeRVcA5UnVWZ0/AKr2l5TmOcsD9w1elhlIrH
	5789nFXUyxvtgxeFGsnyBACNvKJZZ+nOkB9DrxfGtUeHl8MFexNI0wpFb1tl+3oRSVfR
	6GkQ==
X-Gm-Message-State: AA+aEWZpS33oz6xCjMEt6zATDPS3cT3rA5qVTmBURaaIbqKpw7HFhfZ9
	rQVNYeAVLdeJ6nJLkv14sf6OqiKAY0I=
X-Google-Smtp-Source: AFSGD/UzXvpZUSUTQ4SUGCFPU+kmAt667OTuKA5Ogg3TJmDIxWyhEzN3Ip6mkHA2+j2A2tIHo8aPNQ==
X-Received: by 2002:a62:2606:: with SMTP id m6mr46264212pfm.133.1546499423471; 
	Wed, 02 Jan 2019 23:10:23 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:877f:9499::6ee7])
	by smtp.gmail.com with ESMTPSA id
	m67sm107071487pfb.25.2019.01.02.23.10.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 02 Jan 2019 23:10:22 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  2 Jan 2019 23:10:08 -0800
Message-Id: <20190103071008.5065-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] feature-arm-thumb.inc: Do not tie generating thumb ISA to -march
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
X-List-Received-Date: Thu, 03 Jan 2019 07:10:23 -0000
Content-Transfer-Encoding: 8bit

-march=armv5't'e means that CPU can execute thumb ISA, we do not need to
tie this to exclusively generating thumb ISA, this change means that
when we have thumb in tune features then it can use 't' in -march
options irrespective of ISA being thumb or arm.

This fixes derivative of armv5 tunes and paves way for gcc9 where e.g.
armv5e is dropped and minimum arch supported is armv5te

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/machine/include/arm/feature-arm-thumb.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/machine/include/arm/feature-arm-thumb.inc b/meta/conf/machine/include/arm/feature-arm-thumb.inc
index 0b47ccad02..36bda6c67a 100644
--- a/meta/conf/machine/include/arm/feature-arm-thumb.inc
+++ b/meta/conf/machine/include/arm/feature-arm-thumb.inc
@@ -24,7 +24,7 @@ python () {
 TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'thumb', ' -m${ARM_M_OPT}', '', d)}"
 
 # Add suffix from ARM_THUMB_SUFFIX only if after all this we still set ARM_M_OPT to thumb
-ARMPKGSFX_THUMB .= "${@bb.utils.contains('TUNE_FEATURES', 'thumb', '${ARM_THUMB_SUFFIX}', '', d) if d.getVar('ARM_M_OPT') == 'thumb' else ''}"
+ARMPKGSFX_THUMB .= "${@bb.utils.contains('TUNE_FEATURES', 'thumb', '${ARM_THUMB_SUFFIX}', '', d)}"
 
 # what about armv7m devices which don't support -marm (e.g. Cortex-M3)?
 TARGET_CC_KERNEL_ARCH += "${@bb.utils.contains('TUNE_FEATURES', 'thumb', '-mno-thumb-interwork -marm', '', d)}"
-- 
2.20.1


