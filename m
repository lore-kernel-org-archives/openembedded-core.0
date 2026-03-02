Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BFE6E9B37C
	for <webhook@archiver.kernel.org>; Mon,  2 Mar 2026 12:52:25 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.159511.1772455940655108510
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Mar 2026 04:52:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=ZhcOIQOZ;
 spf=pass (domain: smile.fr, ip: 209.85.128.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-480706554beso51061955e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Mar 2026 04:52:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1772455939; x=1773060739; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=heR2ytKlUl3ERM7kFRNvQLtqD89Ni1UUaYr+SoXiBkE=;
        b=ZhcOIQOZ5AWMplRQvaIz4CprQ1seiZfHFCyX/ebQ6GS7hw2jkbdbm6F4g1jqsCqcCA
         Rvl/ScPylgVZrvReHT+tmU0WdSUTn/rGaPVlklrFdk4zVSBRzzxscOIdp1De2bs0iAfM
         ikdeNuVF1zq0E+l1gV+EYHGFslfm3EOKjOtUI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772455939; x=1773060739;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=heR2ytKlUl3ERM7kFRNvQLtqD89Ni1UUaYr+SoXiBkE=;
        b=JEuK1gSS1OFqDqqK1oKyQ7iGKsEK2DDeezkqA4BlCX5KggkpYDPP+n3ZGK5v7p4ykQ
         bVY5xzUjp4n6UAolQ+X5mQn8ZovAAz4h0P7QRayPmmk0l+05uXIbbD1mpbws1xjV13/d
         yCl15JBn4lN621Ipvg/Ub0b/NT7y+HRc3U+KJcSQpR1Z9PzFKMCLa8jerg4IxFr46Ngi
         Y/WX09o1F4vUNiQ4Mdi8CuBmATIKrGTu5ZCFurBS3wJxxiCimcM31gFQ1JwYaka49XeM
         CPiuRtrSq/2xgiKLzm0ISFn+neNV7qzL6pd3hyk4vq/wJfK4y3OAf9TJO4udJvgyUP4V
         nXcQ==
X-Gm-Message-State: AOJu0YzKSieJOU1wefbjOkw3+clnBG8/CFkRHO6d45qQp2H/4nwaGBt8
	PQ8czXHBwgKZ/ES0XvRwdN8adyG8ZTSd4Px1kyWTLIwl9vH55jTdzPU9OlzyTZSnR1gFI21DKEg
	0FEM+
X-Gm-Gg: ATEYQzz0wo2OnIXCsBfyCNOZuXPmn4HP1FvyPPieVkdp7hiZUKeykKzCQu90I8v+z2H
	VP9Xbn8ypQA3erND6Fq6Ei7WKziAgciyrlV7/mrPAaRDegsNAgYOolL5d2oVFR8/OdX9dd2s+Gv
	AOJT986UxsfT1b3vube6W+EKz7tVSUDO+N4NjgXDVmHw1JRRrybdlyHAQYYDOcCyw+O1H+hvRoI
	VeeR1zoegSHUeWu00J0wEirDf2Tj+ubPmxQX7y4IDNIVo4NAmmP9wPe/HENiTohYwTWvjY/K2kb
	YSB1m9MOyXUY0wLdlTbmvohVTp4niaV+m5LXIMsupq0H8VQyC855vlWITlAJekHtb4NuiGuhcT9
	sWXG2Qbx33PYRhFduDDR4tmBfALcNkGCrCK5uWWvJlKHasPOoa4FHF9WZfqi8jeV7izaopEJ8AU
	CDPYD6t1U1CiiqoTIa/+Eg/f740jYPPONA+gLO7S2n0Z64aas=
X-Received: by 2002:a05:600c:548a:b0:483:aa2:6bce with SMTP id 5b1f17b1804b1-483c9bdb0c2mr198316725e9.30.1772455938809;
        Mon, 02 Mar 2026 04:52:18 -0800 (PST)
Received: from FRSMI25-LASER.lan ([2001:861:8010:5750:5fc1:b679:8afc:8f97])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bfcbf016sm207550495e9.5.2026.03.02.04.52.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 04:52:18 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: OE-Core ML <openembedded-core@lists.openembedded.org>,
	Yocto Security ML <yocto-security@lists.yoctoproject.org>
Subject: OE-core CVE metrics for master on Mon Mar  2 09:21:55 2026
Date: Mon,  2 Mar 2026 13:51:44 +0100
Message-ID: <20260302125144.325417-4-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260302125144.325417-1-yoann.congal@smile.fr>
References: <20260302125144.325417-1-yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Mar 2026 12:52:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232200

Branch: master

New this week: 2 CVEs
CVE-2024-10041 (CVSS3: N/A): libpam https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-10041 *
CVE-2025-12343 (CVSS3: N/A): ffmpeg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-12343 *

Removed this week: 5 CVEs
CVE-2022-38096 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-38096 *
CVE-2023-39176 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-39176 *
CVE-2023-39179 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-39179 *
CVE-2023-39180 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-39180 *
CVE-2023-6535 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6535 *

Full list:  Found 19 unpatched CVEs
CVE-2019-14899 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-14899 *
CVE-2021-3714 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3714 *
CVE-2021-3864 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3864 *
CVE-2022-0400 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0400 *
CVE-2022-1247 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1247 *
CVE-2022-4543 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4543 *
CVE-2023-3397 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3397 *
CVE-2023-3640 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3640 *
CVE-2023-4010 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4010 *
CVE-2023-6238 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6238 *
CVE-2023-6240 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6240 *
CVE-2024-10041 (CVSS3: N/A): libpam https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-10041 *
CVE-2024-50613 (CVSS3: N/A): libsndfile1 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-50613 *
CVE-2024-6519 (CVSS3: N/A): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-6519 *
CVE-2025-12343 (CVSS3: N/A): ffmpeg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-12343 *
CVE-2025-52194 (CVSS3: N/A): libsndfile1 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-52194 *
CVE-2025-59529 (CVSS3: N/A): avahi https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-59529 *
CVE-2025-60876 (CVSS3: N/A): busybox https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-60876 *
CVE-2026-26269 (CVSS3: N/A): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-26269 *

Summary of CVE counts by recipe:
  linux-yocto: 11
  libsndfile1: 2
  avahi: 1
  busybox: 1
  ffmpeg: 1
  libpam: 1
  qemu:qemu-native:qemu-system-native: 1
  vim: 1

For further information see: https://valkyrie.yocto.io/pub/non-release/patchmetrics/

