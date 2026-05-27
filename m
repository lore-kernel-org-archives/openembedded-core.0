Return-Path: <saisneha196@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D6ABCD5BD5
	for <webhook@archiver.kernel.org>; Wed, 27 May 2026 11:18:25 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18209.1779880702985603469
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 May 2026 04:18:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=QTCnxGWJ;
 spf=pass (domain: gmail.com, ip: 209.85.216.49, mailfrom: saisneha196@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-367cbac9c37so6837118a91.2
        for <openembedded-core@lists.openembedded.org>; Wed, 27 May 2026 04:18:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779880702; x=1780485502; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+W5wPRFUQKM0fqKiJzjpoitUyxzJryXQI8/GwX5ipbk=;
        b=QTCnxGWJwtSVqK5RsGJX2ob6s7UxfQCTMCqOHGG1esMdM+kZ4jaJ8KicKMAbUYc9jY
         0YzvwEKV5HiXPYUFbalMmAYORPnXBHdlrEW1KqN6nhXOPR3VL/qeInO+R84p6Kmje7Cn
         6/shpsH0LSQeJ5cY6aoVoeY/66k1tDGx8OjRKiQfPcqmcvbAFGyR2/rZcpIHwZlDu/qs
         ZB4abkeENdlcnu2lEMJ1yic0Hi3tzpGpwCJ9dM+uh2GxVbOOgdbo/2utxxSi38v6eqNH
         PjV9+ulVQYqFSbB2zShHPwYclqRLEdOz4pKxTxXT2TS4qqBgCQvmnlDCtkM3L5FfhIrO
         9vkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779880702; x=1780485502;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+W5wPRFUQKM0fqKiJzjpoitUyxzJryXQI8/GwX5ipbk=;
        b=giPLm1UoH2mlI2y2qfJNRfJ2MvEBu4D31I/iQfXk7mbmGrcSrCrUXSWEZ72TnpLz95
         gKl+tXY7gLG8E53C+9/0nEA+v5anNFMot5Uhe7ktw1k73A1a2WPdd+5F/VCJkitv8ViB
         GoB76O8IEg26XgPVQZQstJDpHZIibDCPkYJ3eXG2yFnSk/354fhwH0x5Pg++TQ2vhoq1
         M5Nat2BpBRUBWh1DYG61W9ZGebcs4VUXweMgmNALmaAS2TPn3ZZrw44+55X4UzBifS8I
         YZXYFOZUUCk6iOyd8HW3Qe8NYIbM/smG838fmtqnRAYNECoeApuk/N56+S5sWvVGCB/4
         JkpA==
X-Gm-Message-State: AOJu0Yxii1y4fc3uMEcy05ND5FeARnMfYyNA0j5Wyq8EyzWY+1w4TwBG
	d2x1DrLHH+P2hHqEe58/PEMi/8ujCf7qf1Gvqyi0A0xEbvNH0xBUDVVjuF9fw4WB
X-Gm-Gg: Acq92OFC0NY0xqF/YCoQ1xa9SPKBSH30QP6hNvhgH+RVPPAC5tEdwDLxt0I+Qfj0MP5
	vI2flsl0zWQ0L2WRjZPVLSy6nHI24M78ak/PTyaxbHJRKsz1MlQzaaS341vb68iywtreZvpmQsh
	kW6HquNr2cqzktwaQrQYSBuiE210HmUHfxml398/vGYgB5WFeJ3mYcxn7U/xQ5Xusnj/lVTxjvU
	rRV92aUOmV+aghaDk9LCK5TkJoH2E4NfQzvgn4tPz8sJnOvwqMjX2TMJ/04/kmECCKRalkWLnxM
	nbBGPY+YbS1+gO+NzXAYuaR4fBz+rZGyq0wbEozxB/mISVkO2V4lOIE5CmNjKaFcx8bickmXnWS
	bEDfqMEmhpbR3GWTlPnMBCd/9cJf73d/HuiH94bN+0iDYMlOri3S7Q7W7cZgEeLUHpW6KUAW8O3
	U1XJEH0NG4U0BVT8uXlvaFLCntisF7sSbkFX7FnrBphsLKFUoEzl0sEB7lsuhA3SJI/QA=
X-Received: by 2002:a17:902:ebc2:b0:2ae:6259:5aff with SMTP id d9443c01a7336-2beb031adfdmr227369115ad.6.1779880702232;
        Wed, 27 May 2026 04:18:22 -0700 (PDT)
Received: from BLR1RLPT00004.localdomain ([152.57.21.184])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb56b9fabsm192079475ad.23.2026.05.27.04.18.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 04:18:21 -0700 (PDT)
From: Sai Sneha <saisneha196@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: yoann.congal@smile.fr,
	corentin.guillevic@smile.fr,
	martin@geanix.com,
	paul@pbarker.dev,
	Sai Sneha <saisneha196@gmail.com>
Subject: [PATCH v4 4/4] yocto-check-layer.bbclass: enforce missing SRCREV check during layer validation
Date: Wed, 27 May 2026 16:47:56 +0530
Message-Id: <20260527111756.1306022-5-saisneha196@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260527111756.1306022-1-saisneha196@gmail.com>
References: <20260527111756.1306022-1-saisneha196@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 May 2026 11:18:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237645

Add check_missing_srcrev() to yocto-check-layer.bbclass to enforce
the missing-srcrev check as an error during yocto-check-layer runs,
using the shared oe.qa.check_uri_srcrev() helper.

This ensures layer maintainers submitting layers to the Yocto
ecosystem must fix all missing SRCREVs before their layer passes
validation, even if their layer only gets WARN_QA during normal builds.

Note on design: missing-srcrev is not added to CHECKLAYER_REQUIRED_TESTS
because that would promote it to ERROR_QA for all layers globally during
normal builds, contradicting the layer-specific enforcement requested in
Bug 16051 Comment 3. This direct implementation in yocto-check-layer.bbclass
enforces it strictly during checklayer validation without affecting
normal builds.

This satisfies the requirement from Bug 16051 Comment 2:
'add a QA check outside of checklayer then add it to checklayer'

Reported-by: Yoann Congal <yoann.congal@smile.fr>
Fixes: https://bugzilla.yoctoproject.org/show_bug.cgi?id=16051
AI-Generated: Developed with assistance from Anthropic Claude
Signed-off-by: Sai Sneha <saisneha196@gmail.com>
---

Changes in v4:
- Refactored to use shared oe.qa.check_uri_srcrev() helper
- Eliminates duplicated URI parsing logic
- Added docstring

Changes in v3:
- Added AI-Generated disclosure and Reported-by tag

Changes in v2:
- Initial public submission
 meta/classes-global/yocto-check-layer.bbclass | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/meta/classes-global/yocto-check-layer.bbclass b/meta/classes-global/yocto-check-layer.bbclass
index ba93085325..11b7f5d2ee 100644
--- a/meta/classes-global/yocto-check-layer.bbclass
+++ b/meta/classes-global/yocto-check-layer.bbclass
@@ -56,7 +56,22 @@ def check_network_flag(d):
         if network and not is_allowed(bpn, task):
             bb.error(f"QA Issue: task {task} has network enabled")
 
+def check_missing_srcrev(d):
+    """
+    Enforce missing-srcrev check as error during yocto-check-layer runs.
+    Uses the shared oe.qa.check_uri_srcrev() helper.
+    """
+    import oe.qa
+    src_uri = (d.getVar('SRC_URI', False) or '').split()
+    pn = d.getVar('PN')
+    for uri in src_uri:
+        rev = oe.qa.check_uri_srcrev(pn, uri, d)
+        if rev is None:
+            bb.error("QA Issue: %s: SRCREV not set for SCM URI %s [missing-srcrev]" % (pn, uri))
+            d.setVar("QA_ERRORS_FOUND", "True")
+
 python () {
     check_insane_skip(d)
     check_network_flag(d)
+    check_missing_srcrev(d)
 }
-- 
2.34.1


