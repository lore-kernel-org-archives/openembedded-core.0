Return-Path: <t.f.g.geelen@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1407D5B15D
	for <webhook@archiver.kernel.org>; Sat, 13 Dec 2025 16:58:31 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8945.1765645108445074971
 for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Dec 2025 08:58:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KdD3J2Js;
 spf=pass (domain: gmail.com, ip: 209.85.208.51, mailfrom: t.f.g.geelen@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-63c489f1e6cso4593256a12.1
        for <openembedded-core@lists.openembedded.org>; Sat, 13 Dec 2025 08:58:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765645106; x=1766249906; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XKVWpqYMhME5NZzClFh6TrNob0eTrxHS69YYfJp9Ajs=;
        b=KdD3J2Jszul4PIJBlTcvYCjwvq2fp/SRhYpy6IjJytHiqxT33bL5PDpqq+TaFjzjvY
         f00sWAi0gmwnNDFrTwgdE8Mz0cW8MARNtf5y2OpG2UnMgZXjAXJ00Q7ckejKtNTJD6Ix
         oHk70ELkGbQZXo5eVefiQkCkOr3LRfyy05GrcSO830xZ4KajEFxNIu3x1ML0om0obbKQ
         ABNv5jynYFdE2v8Eo4winnFevr1nTf92N1k4jYr7HdZG/eCwUzFlqP3tayqPlHDndN+H
         KLYe1G9Qvh7uTOU7PhBhnkEzDQfYi2GV/+Qi7YtzyxFU6RRBRbCctJnMZUsJeXuEHttN
         zwHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765645106; x=1766249906;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XKVWpqYMhME5NZzClFh6TrNob0eTrxHS69YYfJp9Ajs=;
        b=YwhmszFVSJGe6au1d5PuHg7TvqLuyNh3y0FqZX5O+zjmnzJjPX0DHGPdqF1NhsVbQo
         iUSvgIxMXRPAjb2mtfCaNYWHvwp259wHyMCmndLBYABzQI4y6RfoAdVdAWnuFhXkUUZf
         pdE37CFdJjUk+Zj7f7ibn6iIVtUq43U3zK0Nui+Nz/PfNkeoPDMDDUK/Vi6b0JX9VMmG
         ILlQCOMtlkBiqJDfkzWE/7Em0Le+unfNGUFm6fGcaaP3Aqwg4c/lSpnnuLU/3UCaYETN
         uUosgYKFqgIh+Dgyt2g2qfuqYEXGN7vSzACfDIFkBBGsVTkGIcPK1c5VEpW3GGMVs108
         EWoQ==
X-Gm-Message-State: AOJu0YwLrk07p6l+3uB1uIXyrGWGDpoqdd/Hcc/5LHaenLzjMxmHLNC1
	dm9vM0lUV6n/yPK8RpIMQEqSzkHLHeVcaxsuaHNh4gNlF2uoKrDog1lTJZk7OA==
X-Gm-Gg: AY/fxX56IlLAS17pQFoMT4rULDzjVS1YmWdLfhqBF9VC/i8qQXY4CpO+ZZun+q9GC4F
	SMp7tSW9E46OL2stOB6tYTwoE0MEajn5RGxZjYoD3K4EQd0EUSMQNhVbI4HggPt467q8ce78mPf
	ZyWvDg1sk+OXwAkEBiSp7T8ru+4nTVccTEoEHymsUSj7bQ3hy/zL1o6zkCCy19VO8GrABGkYWtU
	4pCydPOo6u7DF7iyH3uV+l3IZxlWadygpDAzSNpIprBue9t3lWN89NrPfDmLKJzedvBhR3qxQEi
	bBYHYU4U1dJQTYYhVSpcpOG7gem5S4fm3aSCa0Ug2ZtMhhGnsN7VFW0auOizVUIcNvLmAo6nkXr
	ZYaGoJ5Mbbx3Gxw9pOkJ4m8kECJgFC1TQdxP1JR/cTDHO8sLla7PoILyHA20zj8fKolskpAYvvh
	yUj76VB0nS6pE9rYBIKkMUX5tV2qvNApG54IWoSO0pKjG1LY+idZNwTA1siYEF8iUn
X-Google-Smtp-Source: AGHT+IHEI9WyiCPaS5Ff336iHhb3JXS/A9thMAJPfUei79aaVsra4sQtDiqEkurFH37KWUkj6Ze3QA==
X-Received: by 2002:a17:907:3d43:b0:b73:9222:6a64 with SMTP id a640c23a62f3a-b7d2166d010mr645715466b.3.1765645106109;
        Sat, 13 Dec 2025 08:58:26 -0800 (PST)
Received: from control-center.fritz.box (150-12-20-31.ftth.glasoperator.nl. [31.20.12.150])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7cfa56a7f9sm885897166b.51.2025.12.13.08.58.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Dec 2025 08:58:25 -0800 (PST)
From: Tom Geelen <t.f.g.geelen@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Tom Geelen <t.f.g.geelen@gmail.com>
Subject: [PATCH] python3-psutil: upgrade 7.0.0 -> 7.1.3
Date: Sat, 13 Dec 2025 17:58:09 +0100
Message-ID: <20251213165808.1616658-2-t.f.g.geelen@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 13 Dec 2025 16:58:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227689

Release notes:
https://github.com/giampaolo/psutil/blob/master/HISTORY.rst

Signed-off-by: Tom Geelen <t.f.g.geelen@gmail.com>
---
 .../python/{python3-psutil_7.0.0.bb => python3-psutil_7.1.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-psutil_7.0.0.bb => python3-psutil_7.1.3.bb} (90%)

diff --git a/meta/recipes-devtools/python/python3-psutil_7.0.0.bb b/meta/recipes-devtools/python/python3-psutil_7.1.3.bb
similarity index 90%
rename from meta/recipes-devtools/python/python3-psutil_7.0.0.bb
rename to meta/recipes-devtools/python/python3-psutil_7.1.3.bb
index a2af198083..67d2080f21 100644
--- a/meta/recipes-devtools/python/python3-psutil_7.0.0.bb
+++ b/meta/recipes-devtools/python/python3-psutil_7.1.3.bb
@@ -3,7 +3,7 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a9c72113a843d0d732a0ac1c200d81b1"
 HOMEPAGE = "https://pypi.org/project/psutil/"
 
-SRC_URI[sha256sum] = "7be9c3eba38beccb6495ea33afd982a44074b78f28c434a1f51cc07fd315c456"
+SRC_URI[sha256sum] = "6c86281738d77335af7aec228328e944b30930899ea760ecf33a4dba66be5e74"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.43.0


