Return-Path: <hfranco@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61E5BC88E50
	for <webhook@archiver.kernel.org>; Fri, 11 Sep 2026 13:24:30 +0000 (UTC)
Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com [74.125.227.12])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.39396.1789133060091735965
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Sep 2026 06:24:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre.com header.s=google header.b=fg67tprN;
 spf=pass (domain: baylibre.com, ip: 74.125.227.12, mailfrom: hfranco@baylibre.com)
Received: by mail-vs2-f12.google.com with SMTP id 71dfb90a1353d-5c7f4976d90so708446e0c.2
        for <openembedded-core@lists.openembedded.org>; Fri, 11 Sep 2026 06:24:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789133059; x=1789737859; darn=lists.openembedded.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=0yBpFuQX2x2VEv2/AJiXxA1/4QsfruTFHEagLGcY098=;
        b=fg67tprNQF+tFvGeVCIxG9BI67BjI15+hqJB27xJTJP0hLp2P4bPQ4qFk3bdWVqJRh
         EtTsDACxsSHWVv3fIdw+1hYiulspr3qLXNr+iR8mvlYUAgQV326Vy6jcJHjW/3WjhsNN
         R+BrHpIKhwLtgQN3GWXFpGLp8y9HBXCASO5d56mrX870E9xeFxFlUXlp6cYxO7+5kCwN
         ZAaH0dZB0VaBR3K4RCXFz85fwVRD/+EZq4QNA7IF4TlURKaZ6m/AeGYRH/4cMD7afP+M
         fjeOnnduEGOpRb/ZDKGxfato963nSkoqlrpyu+I0itevDK2WWEU5vNODOlRN6cG1/Ixv
         BqLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789133059; x=1789737859;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0yBpFuQX2x2VEv2/AJiXxA1/4QsfruTFHEagLGcY098=;
        b=lMqus633Jkb37BufeID5uD4+0xWQ/P9lJg5yk7ryaCmSZ+7dG6anefaKFhaVVDLyG+
         c4BqE3+UNUzLZ4sKY2GLEpZhjVqxAZc2YPtZ8wNGeUydjXI6w5jzFRmTToJMx3XvIMby
         EPt1Jvtip2/WOq8whqIna/M3UhW6p2EVQagqxK6tnFbtMi5ns7D8FfiRhCronq20Sjgq
         5Yhydqv4L83TCd6Lu11r6N2ExvRMcS8KtOeGWaf4n8hn4fdbd8OAUjxRxABDm9DXhx4R
         Hilb+GWDKOQHecm4y1Tz9TxXyfOjPv2jAT/nC33XYcmlwxZPlPe1dT04MbHfxvfZ2+Nd
         RCYw==
X-Gm-Message-State: AFuF++kGXsyNikogaKpKRYFu4hiHjrgkSP0uhyaw9bcUJ3eotG3XBHjS
	qumi7sdsO3BJK4Kg5sZ+Y2bJDLvKmGfxr1JguVPib9XWqkQIZbkcE9zEdRhx1f1IK0E=
X-Gm-Gg: AYBFou1MkSadd7sd6eKXyOkF+zeySrnAWuAPURuss1IXRYM2O2bMSqC9fEoCRvt55fw
	qLVW4EYJyCcf289vZvraC+5GZMhfYjpm+HJCPgDqUDR7s39OaDB0tdD1zCdZQbNBz9xSYHBj2Mu
	R/Sxj18d6dVTFcXjnttQ8H9kahiZ6+qx6RkrhPusegmbARGtBd3FMALoQ3MFSEyEZVsyeJzVYZc
	INqar6Mhr7PzjoFUXLOmBe6e8WKVJUFsOqYYeQ+aSNXPudsuywY2UU+p29HORvtOq5Xwk8+IYwM
	UWv57HYfVowQHTsGJZSDIYhdJll0PJknSEv5V6wb4F2lLuuIA2XXN2AgdCj8VzIIhO74dzF/Gdn
	Kcx/X3uOwmLRcDH2TokvQhjLHYTotVfQBIh+bPe7OIXF3W3eeG7HspVNcqAuak73oyNRPHf/kZR
	oCJ12y8tmff4WIv1RIsIwj5O09+YTVJNd1rWW3sNLC0T/0ySPpBN5lFGBuCGpXKBtjCNpnHBHI7
	fakgT2cX7Xj3NVIe+60FBn4Dc+weCQgfx2jhYU=
X-Received: by 2002:a05:6122:3787:b0:5c6:7f44:b001 with SMTP id 71dfb90a1353d-5c845d638e3mr3190720e0c.0.1789133059004;
        Fri, 11 Sep 2026 06:24:19 -0700 (PDT)
Received: from [127.0.1.1] ([2804:14c:4c5:9534::7f1c])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c8470add08sm2596621e0c.3.2026.09.11.06.24.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 06:24:18 -0700 (PDT)
From: Hiago De Franco <hfranco@baylibre.com>
Subject: [scarthgap][PATCH 0/2] improve_kernel_cve_report: backport fixes
 for entry details
Date: Fri, 11 Sep 2026 10:23:44 -0300
Message-Id: <20260911-fix-cve-scarth-cherry-v1-0-c9d04f8c9b08@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWMwQ6CQAwFf4X0bBO6GCP+CuGw1ie7HpC0SDSEf
 3eV4yQzs5LDMpwu1UqGJXt+jgXkUJGmOA7gfCtMoQ6nuhXhe36zLmDXaHNiTTD7cGi0PYoI0Jy
 ptJOhiP9v1+/sr+sDOv9m3R4Pcepp276SknrrhAAAAA==
X-Change-ID: 20260911-fix-cve-scarth-cherry-23c94111ee38
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245645

This series of two patches is a continuation of [0]. As requested,
instead of squashing two fixes, I am sending them as two separated
cherry-picks for better tracking and readability. 

[0] https://lore.kernel.org/all/20260901-fix-kernel-cve-scarthgap-v1-1-405f5d7a8957@baylibre.com/

Signed-off-by: Hiago De Franco <hfranco@baylibre.com>
---
Daniel Turull (1):
      improve_kernel_cve_report: validate that cve details field exists

Hiago De Franco (1):
      improve_kernel_cve_report: fix backported-patch check

 scripts/contrib/improve_kernel_cve_report.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
---
base-commit: 048f2f8e8864ae5861afe95ea52efc0354bfc18c
change-id: 20260911-fix-cve-scarth-cherry-23c94111ee38

Best regards,
--  
Hiago


