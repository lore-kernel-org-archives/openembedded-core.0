Return-Path: <andrei@gherzan.ro>
Received: from mail-ea0-f180.google.com (mail-ea0-f180.google.com
	[209.85.215.180])
	by mail.openembedded.org (Postfix) with ESMTP id 54BE4602DA
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Jan 2014 15:08:33 +0000 (UTC)
Received: by mail-ea0-f180.google.com with SMTP id f15so2527991eak.25
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Jan 2014 07:08:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=xq99E6V66Nv8QubtUBiyI+Mj8TYWMAUQsuSZlInCZhw=;
	b=RnWfGwypmZdSRp+mGpTm/58A8VMaszj3zpCNWfsmTf/TR2de5LMUtbU819VQm9LNBB
	WzQes6e6V62pVCkyrF3WjKgD9NsBpiXHTPxSyiyMXthBH1g9WODnzQT2d9StwwUR+yQd
	ls6xGm4hQmzBS49lsTmlUVpblFmsudyPU4jaybCKhAYdn4LIgAcCJdDxZ+QTRhD8ZWAi
	VDK9vpXztv2aOAKvhRJP8MR6/1wA9o2iqXzlRDlljtbGJqZ2Q6eRFXc7qu9nR5mnC+v8
	1m/N3mGyaiP+XkDr28eBtZWvExvopAnyBmaKC1nYLG9dS2bIIuzfkU39qMedz8fRwtom
	JEOA==
X-Gm-Message-State: ALoCoQlRuMXzsL1HgZhwqJZbPHEKtbbaN6bxgQRHSBAJXjcVwcPYf8+RbwVqiypX/slwER++0NEE
X-Received: by 10.14.107.3 with SMTP id n3mr16368344eeg.67.1389452914051;
	Sat, 11 Jan 2014 07:08:34 -0800 (PST)
Received: from localhost.localdomain (5-13-221-193.residential.rdsnet.ro.
	[5.13.221.193])
	by mx.google.com with ESMTPSA id v7sm23505814eel.2.2014.01.11.07.08.33
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 11 Jan 2014 07:08:33 -0800 (PST)
From: Andrei Gherzan <andrei@gherzan.ro>
To: openembedded-core@lists.openembedded.org
Date: Sat, 11 Jan 2014 17:08:18 +0200
Message-Id: <1389452899-633-2-git-send-email-andrei@gherzan.ro>
X-Mailer: git-send-email 1.8.1.4
In-Reply-To: <1389452899-633-1-git-send-email-andrei@gherzan.ro>
References: <1389452899-633-1-git-send-email-andrei@gherzan.ro>
Subject: [PATCH 1/2] feature-arm-thumb.inc: Use thumb instruction by default if TUNE_FEATURES thumb
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
X-List-Received-Date: Sat, 11 Jan 2014 15:08:33 -0000

Avoid a confusion when including thumb in TUNE_FATURES. In the curent behavior,
if I include thumb in TUNE_FATURES, ARM_THUMB_M_OPT will be "-marm" which makes
no sense for me as a default behavior. Obviously I can change this by using
ARM_INSTRUCTION_SET = thumb. But this seems strange and confusing. So let's do
it the other way around: have thumb instructions as default when TUNE_FATURES
contains "thumb" and switch to "arm" instructions when ARM_INSTRUCTION_SET is
"arm".

Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
---
 meta/conf/machine/include/arm/feature-arm-thumb.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/machine/include/arm/feature-arm-thumb.inc b/meta/conf/machine/include/arm/feature-arm-thumb.inc
index bd754be..259f7fe 100644
--- a/meta/conf/machine/include/arm/feature-arm-thumb.inc
+++ b/meta/conf/machine/include/arm/feature-arm-thumb.inc
@@ -5,7 +5,7 @@
 # but requires more instructions (140% for 70% smaller code) so may be
 # slower.
 TUNEVALID[thumb] = "Use thumb instructions instead of ARM"
-ARM_THUMB_M_OPT = "${@['-marm', '-mthumb'][d.getVar('ARM_INSTRUCTION_SET', True) == 'thumb']}"
+ARM_THUMB_M_OPT = "${@['-mthumb', '-marm'][d.getVar('ARM_INSTRUCTION_SET', True) == 'arm']}"
 TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "thumb", " ${ARM_THUMB_M_OPT}", "", d)}"
 OVERRIDES .= "${@bb.utils.contains("TUNE_FEATURES", "thumb", ":thumb", "", d)}"
 
-- 
1.8.1.4


