Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38A10C98313
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 13:59:50 +0000 (UTC)
Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7738.1790171989541015246
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Sep 2026 06:59:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=TxBmDVGq;
 spf=pass (domain: linuxfoundation.org, ip: 74.125.225.140, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49e66390995so5989745e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2026 06:59:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1790171988; x=1790776788; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=/td2mHX+FkC7LDC8iKTht6+YkSLfoXnrjQHdg5b7/8Q=;
        b=TxBmDVGqZ015dqXufyCAy7ZmlQOEacHb04cfvkvixwB8L4t76rkRwlKx5cNALWStQh
         k5t31fejRrOTkA5TIQ40Yan6bhM9VZ2caZglCuRFGQUkPVWGyL2Q0Y6YUmd6CK8ElAls
         hvn9Za/uDlrP/33JNtKqPk2N/teGxZzv8kx6I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790171988; x=1790776788;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=/td2mHX+FkC7LDC8iKTht6+YkSLfoXnrjQHdg5b7/8Q=;
        b=EF9jBWkeUk/iC52eIiWjClUfnkdQy6XASY3ZMIw2w2jTVPLToU4wssSvPN49YouEKE
         sPGx3knLGSH/AJ1OhPVGSSH9AG/sYpvdBVYOJcpvwhrIM9XQXEEOTGCZmtyNIFkmWJM8
         M2DDKVeKcx4U9ZNIC1LweJ7vSePJnhtZ2FCH4h/G2k+LfzjFHwG0EXy10mSD+feaOTng
         Yi5V+JZ8wxwOuCt/4ui/tXk8nn/FOEJvvAyrHfoWxxLa1aMObnG925QghgWukmcZ4MdZ
         VqiMPOe0Srry0KbVeDZdofK3PamzuKj3iVH9uwu9f+tX4kakPPNRx98EdY1bV5wChPJH
         USHQ==
X-Gm-Message-State: AFuF++kW3CHKY4ADmbN7vXXgUJ57OocjNzfx4xC//FsX9GpVDedhfsls
	VFb/2Dpa4t66DhMbMQGFm1nB4n3s3B7NK5l5wKR0TKySGKmdC8I8p3FKHR01f+0vIFdgioj+VjO
	Poq+bwKo=
X-Gm-Gg: AYBFou2L4A77RMkMH6oJ7exefYi7gzUigN5iZtZPhcS2h/DZTiuXFQNJ5vhPjyjXWhQ
	21AC6a19dpYUQB2TTglTsGV4o530O2H0QR2POu1yJrrGXc31uukWbJvoQUVZOU/hfudi/VUBw0C
	hu8E0N4gqqHx3AkhIn9fbEB4mvFeN4kD6P7Ajud3IaMUij63XRP2QnDCNb62IcuFBbzSpDJ3z0q
	IPwsd4EwZMcMta/E2MYnJiER+6NBI1vCEmC8RpVyOB1s2JhuUt1xMg1cTi/DPhBaj4g3z+lHW4G
	s0AO3JlBVVeewkkj7AHKrguPiRdnO7asqF1Gc9CgMDiPrpsDCczC6g8Ewo6B28z7OgLUneIOHub
	sJKEhlEeFZUICd5zPQiOVLDjFZ61rPhFAfGA1oqiUKE+qEKbMsmtqhDnvKvfFGuTX6Nc2Z2aS/U
	T6m1L63EmqmjqZN/Eat2bcPcQi4zNxniKp2Vt2iSu+KyPNAq154oFXZerp9Qu25VBf+OUMCSTah
	TRmjOxFP6vBy3rXxRhJuMxaLuyCi+cKfSc0qA==
X-Received: by 2002:a05:600c:4743:b0:49f:bd0d:59f5 with SMTP id 5b1f17b1804b1-49fdf13542cmr38769505e9.18.1790171987776;
        Wed, 23 Sep 2026 06:59:47 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:36fd:f492:2703:247a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe43fc27csm8027945e9.2.2026.09.23.06.59.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 06:59:46 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 6/6] python3-pdm-backend: upgrade 2.4.9 -> 2.4.10
Date: Wed, 23 Sep 2026 14:59:39 +0100
Message-ID: <20260923135939.3797785-6-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260923135939.3797785-1-richard.purdie@linuxfoundation.org>
References: <20260923135939.3797785-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2026 13:59:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246519

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...thon3-pdm-backend_2.4.9.bb => python3-pdm-backend_2.4.10.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pdm-backend_2.4.9.bb => python3-pdm-backend_2.4.10.bb} (79%)

diff --git a/meta/recipes-devtools/python/python3-pdm-backend_2.4.9.bb b/meta/recipes-devtools/python/python3-pdm-backend_2.4.10.bb
similarity index 79%
rename from meta/recipes-devtools/python/python3-pdm-backend_2.4.9.bb
rename to meta/recipes-devtools/python/python3-pdm-backend_2.4.10.bb
index cdeadbaf1cb..1458f514b49 100644
--- a/meta/recipes-devtools/python/python3-pdm-backend_2.4.9.bb
+++ b/meta/recipes-devtools/python/python3-pdm-backend_2.4.10.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 SECTION = "devel/python"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=4a564297b3c5b629a528b92fd8ff61ea"
 
-SRC_URI[sha256sum] = "c41a852ccbf4b567b033db9b2ae78660d7a4ea49307719959ab88a01f0aabb2e"
+SRC_URI[sha256sum] = "551b049379d4f270cba18f5bf73031cc229a4f883e085265465d326d4a636861"
 
 inherit pypi python_pep517
 

