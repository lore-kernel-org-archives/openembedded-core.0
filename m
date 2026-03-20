Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D34341088E60
	for <webhook@archiver.kernel.org>; Fri, 20 Mar 2026 00:28:37 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2623.1773966512493324760
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Mar 2026 17:28:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=u9bnkdTK;
 spf=pass (domain: smile.fr, ip: 209.85.128.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-485392de558so10379515e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 17:28:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1773966511; x=1774571311; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CajgZvDDrD7gwU8NfOJ5Ci2MwM8WQHrjZS0+rueWj+w=;
        b=u9bnkdTKkujnuaDlKMRyvpFTNf2n/qd9/PBXksTXYZ9BT5vTbtGHfqDLcLJTzC0zi9
         5fDKDo7QGGr1WJ1kYQs2f4sWSBeuYchgamKsMXUrrgQRZcxqAaVWapeN/PNnnhqP22SH
         6NZJubuICGFXF/3V2vkln9FhIiBWL3nppvipM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773966511; x=1774571311;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CajgZvDDrD7gwU8NfOJ5Ci2MwM8WQHrjZS0+rueWj+w=;
        b=epYpvhdRiLHoA5/Q8j2TujSeOHJ4erV9F1/hLwmTD3PAanJHFSm+/6ejrgvuFY8FPe
         G1e9vT1C+s4cc5dfLDCwkoAKXbZ3HA0837c/8D0CBj6k3WUDycg1yBJTHoQy2ecPJtHG
         kSYaF1VvT5Pn6Rr7TN4l8e5hHBTfqw1txEyk83oLqAs0LBYVnU8GfpkI+4nw749og1Tv
         n+7MuH9yb7345Zg0jb4ptVj7LCXSda3eohvD0NW9CRyqJD17Dba6rRcAAog7TFwh+7tK
         ogN/Ri2Kz1CWKRDIzlV2xn1R3J88QhJD06sPwwSwqP7iflbw06sLo9nYVT/aQ5aZa3Oq
         id5A==
X-Gm-Message-State: AOJu0YwpWsORhCMVsDeT3F/VwiFR9jTpWDLeUIcWdBKJTLJISz/PPgOS
	mzZtiRpS+ATvZWk/ec0RBDgeZrgEnvj7tBmPjJ7IRi0RmiszM0mhyxQuidIgvMDnQiSQMwx79Zr
	s2yN8
X-Gm-Gg: ATEYQzxPQXEY98QtOK+6XEaHtGuid6Jxd3A/tj//1OLwnv1Uv8xIXPW6NRU4BicUCRq
	/3jOrTCcEsPYQrCgAA6nZEX4uOb175AKVzjDUmRqElmGzqm9JrdvdcjUbIejeDCZlIYOXlq8VA+
	nhLeeofEe3PORRSinM2K1QjkGsC0w/iNN9ZtMqqV0sPrC3VsR5VRbagFOKneGZZYDZOwpNZzezi
	ijf9yev2GIwrjW0PmOSM44cyvyevIObKD12HKGOTbdFgpGm2CyMJs+gXe4hkVlIgPTW2/CToKER
	gKeTlEfSFhRnpjDZ/YTHnq9lbV3gjp1HQdkfGdm263qUnaPG8N6Vpbam8Bl5s9Bo+gbqMzOofHj
	W4p8L5JOMMbF2HXMrg6IHcCpttPeN24NCMT0691+EX7/LXWOF7/z9RsiksN+wPUladiKtI8RZxa
	tbnqSsUoGY3AugY78lHhduijI0DvFHX1kxxsgzsR33klZ+Trz5LebLT5yBnk8Gg5/aJmX56kUXc
	Q1yJJHfHYN7ZBhdIeCSeXWmGw4=
X-Received: by 2002:a05:600c:3549:b0:485:3fe6:21f5 with SMTP id 5b1f17b1804b1-486fedb5928mr14695235e9.10.1773966510621;
        Thu, 19 Mar 2026 17:28:30 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486fe8359acsm23850655e9.12.2026.03.19.17.28.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 17:28:30 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 05/15] improve_kernel_cve_report: do not override backported-patch
Date: Fri, 20 Mar 2026 01:28:12 +0100
Message-ID: <1ff16651f97bfa7d369ad982c3d46f0f9cd8fa1c.1773966414.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1773966414.git.yoann.congal@smile.fr>
References: <cover.1773966414.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Mar 2026 00:28:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233566

From: Daniel Turull <daniel.turull@ericsson.com>

If the user has a CVE_STATUS for their own backported patch,
the backport takes priority over upstream vulnerable versions.

Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 0beef05be119ea465ba06553a42edea03dfc9fd3)
Signed-off-by: Himanshu Jadon <hjadon@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 scripts/contrib/improve_kernel_cve_report.py | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/scripts/contrib/improve_kernel_cve_report.py b/scripts/contrib/improve_kernel_cve_report.py
index 829cc4cd30e..a81aa0ff943 100755
--- a/scripts/contrib/improve_kernel_cve_report.py
+++ b/scripts/contrib/improve_kernel_cve_report.py
@@ -340,6 +340,10 @@ def cve_update(cve_data, cve, entry):
     if cve_data[cve]['status'] == entry['status']:
         return
     if entry['status'] == "Unpatched" and cve_data[cve]['status'] == "Patched":
+        # Backported-patch (e.g. vendor kernel repo with cherry-picked CVE patch)
+        # has priority over unpatch from CNA
+        if cve_data[cve]['detail'] == "backported-patch":
+            return
         logging.warning("CVE entry %s update from Patched to Unpatched from the scan result", cve)
         cve_data[cve] = copy_data(cve_data[cve], entry)
         return

