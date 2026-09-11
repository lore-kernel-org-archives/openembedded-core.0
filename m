Return-Path: <hfranco@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7293DC88E4D
	for <webhook@archiver.kernel.org>; Fri, 11 Sep 2026 13:24:30 +0000 (UTC)
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.39253.1789133062712546618
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Sep 2026 06:24:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre.com header.s=google header.b=NO4sUXQ9;
 spf=pass (domain: baylibre.com, ip: 209.85.221.176, mailfrom: hfranco@baylibre.com)
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-5c65093556aso922774e0c.2
        for <openembedded-core@lists.openembedded.org>; Fri, 11 Sep 2026 06:24:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789133061; x=1789737861; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Rkr2wdK68veaiTa9+G8bM43l463U2aLyvAqtO4M5ciw=;
        b=NO4sUXQ9bscqFBwpyeHCnEkeY323ysBzS2GiD4GgeYmnwVuqwX8RQ/c2uRRn4NkmhN
         OEfGRtSp+xUVM4bbDglh1XwLLsogb/NL7gTH0u54jq1SQrLObqkFtisViDuohnGyinI+
         baaTXNJqcdY7xlLhBV+jxASYCnMTKxQn6jC2lhKizcNaEE18vOZJtOp6gzUcGzi+D7jE
         X34YGBeSczUz+Yefc0/X9bwJljlfs2la0e72jfE5BW4JSmYgCHQcsMVafDbTBjYAnrkV
         AgKUmGQxNKcit45vU+1pIrcI3q/u0vc/26ipoc2f8bWWe0Gvui1LiCFCUz4CzUgIL9zj
         lSwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789133061; x=1789737861;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Rkr2wdK68veaiTa9+G8bM43l463U2aLyvAqtO4M5ciw=;
        b=ZzoGWm5ovCUvbOgXpQj5MnROxIzvgcIHyH4y8CTJVEgYiuMa+g02nAKu526VxJudSv
         EEIkKSkNu++Y00UFvveMTh0MbESrmy4Fh74l3rCPzqENZyG1ANt2cu8ncfiLs+I/cZ+n
         YRwJYJ1lUVfhDzpUIUb0Dke3/q0JZ5f9u1wmFUDmrJqwtYHSQhPHX+jnLW4vxLIDcAWU
         vCCTqr2kIr0eKGzH7z7v5JIInjmbDzDSxMIyoQtMcFBEKti1WM2XE9WolngE+tI7Q2Nw
         LkB9l+rMTAo9JMMfu16qpJDUwLPLI9oCYYd02LVIUTcuXY9fmDA79QhbizfdsJPsb/RZ
         2YwQ==
X-Gm-Message-State: AFuF++kgBrn6Hy/dKN2ZnuoDXQzl61VUW4CXpMPDv6q3rXTMycfFBKP9
	w7ww6rXpSSP11YhQR3GgEgSVLufasfq/Dw/iGU05RLeXtw71F5Gr0q4FNk9WYf9COjc=
X-Gm-Gg: AYBFou2BWrgJLsoKr8pcnW9zbXsfgTGCeVn339COPhyxg1NPl320CPvt51ur27im13S
	Rhteq6FwNwqlPqIkOY3w+UtbdGqfye6/azDLpPt5WqJoZPlQ/Y4BJRMFQtETXbz5H2UOe1FWQt8
	Tgpa/4Zn60yG2vVSJaxrHqFK9wuPzgdtPB62dx1sVhdw4l9dejFfZU8LbpbxeK03cWw50sJtumv
	t/9H/K/QXE5NYMebFKiukY/OfHdIhFNUr74m6Pmz3eJ2PFjNb6KLhFrJx73zXi2vd/ROlI78wSa
	JW6VaCPOxYBUZKbf8M/YTvRidnKPZOKF1K1bdvKCWQe26ZDHhnPBb+mtl7Agt0W8a6fTwKG9aX9
	ki2BdtDHsgXauCsPRozOLgmDdSTv3TyVohzl4yVF1jSm6qP/FPtlO25LQTxOm3ERNDmvqdwz12V
	Yn+rSxoTmj7k9LItEhvCxa5hm4B4ygJnB1ZJnc3PCCg2NxzM12vhxYk3wR+AjGCMUgEKCRKqp1M
	YaNOSdnfSuco8UDyQeXRa2YqM3STdv08EnX4nQgVOdAsu2fcw==
X-Received: by 2002:a05:6122:21a4:b0:5c8:3a2f:a497 with SMTP id 71dfb90a1353d-5c845d7d798mr5436125e0c.0.1789133061664;
        Fri, 11 Sep 2026 06:24:21 -0700 (PDT)
Received: from [127.0.1.1] ([2804:14c:4c5:9534::7f1c])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c8470add08sm2596621e0c.3.2026.09.11.06.24.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 06:24:21 -0700 (PDT)
From: Hiago De Franco <hfranco@baylibre.com>
Date: Fri, 11 Sep 2026 10:23:45 -0300
Subject: [scarthgap][PATCH 1/2] improve_kernel_cve_report: validate that
 cve details field exists
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-fix-cve-scarth-cherry-v1-1-c9d04f8c9b08@baylibre.com>
References: <20260911-fix-cve-scarth-cherry-v1-0-c9d04f8c9b08@baylibre.com>
In-Reply-To: <20260911-fix-cve-scarth-cherry-v1-0-c9d04f8c9b08@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>, 
 Daniel Turull <daniel.turull@ericsson.com>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, 
 Richard Purdie <richard.purdie@linuxfoundation.org>
X-Mailer: b4 0.15.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Sep 2026 13:24:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245646

From: Daniel Turull <daniel.turull@ericsson.com>

Check if the cve information has the details field to avoid crashing

Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 80ff4903ea1b839f9cd9393b314c3adfbb80b765)
---
 scripts/contrib/improve_kernel_cve_report.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/contrib/improve_kernel_cve_report.py b/scripts/contrib/improve_kernel_cve_report.py
index 3a15b1ed26..dc961d5938 100755
--- a/scripts/contrib/improve_kernel_cve_report.py
+++ b/scripts/contrib/improve_kernel_cve_report.py
@@ -362,7 +362,7 @@ def cve_update(cve_data, cve, entry):
     if entry['status'] == "Unpatched" and cve_data[cve]['status'] == "Patched":
         # Backported-patch (e.g. vendor kernel repo with cherry-picked CVE patch)
         # has priority over unpatch from CNA
-        if cve_data[cve]['detail'] == "backported-patch":
+        if "detail" in cve_data and cve_data[cve]['detail'] == "backported-patch":
             return
         logging.warning("CVE entry %s update from Patched to Unpatched from the scan result", cve)
         cve_data[cve] = copy_data(cve_data[cve], entry)

-- 
2.53.0


