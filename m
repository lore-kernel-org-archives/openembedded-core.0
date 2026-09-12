Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC029C88E59
	for <webhook@archiver.kernel.org>; Sat, 12 Sep 2026 11:44:52 +0000 (UTC)
Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5174.1789213486615213060
 for <openembedded-core@lists.openembedded.org>;
 Sat, 12 Sep 2026 04:44:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=YiQkAcik;
 spf=pass (domain: mvista.com, ip: 74.125.228.12, mailfrom: vanusuri@mvista.com)
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc1cea50db3so203618a12.1
        for <openembedded-core@lists.openembedded.org>; Sat, 12 Sep 2026 04:44:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1789213486; x=1789818286; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lYnDnCZgTrjirPOykrG8jMJXU67F+OsarBUeH5f6AG4=;
        b=YiQkAcikcQEfwaX7rYZHH6lBFuoDzltGfKSVINPIScaMadikdaBwFGU4q/DhdkwYEz
         /Yf2/AKkCVQUAuVtSkIlNHU3278Pqhnbn4E2+d1UllviAMK7z7ABpIHb0zEUkcbgIj8X
         FQ5n2RaSaXVyPoHhECGylJWlgeiBnyULPsD94=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789213486; x=1789818286;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lYnDnCZgTrjirPOykrG8jMJXU67F+OsarBUeH5f6AG4=;
        b=nllEC6IPcBw0i8bpLpYVt9ize1Po9PjSZNK4O1ewYPKfMwfygh5lxdienvDJypExTU
         ZmvhT8KenlzJFf9MPGLqcDuVK4LIdWo56OZosml6yonONlbNV9g3FRtcg6Bcb48BEw6o
         eOnV0Wp9CoY33Da07PfLHC8SyshvTu2rDcpqQ2AJ/BSX+fYOZtyioEtU3lrneWrzxNmO
         0yW9LmGFyYuIsKw95GL9Z5fL0z77d0CW1ZdPGvRn86rHbg9NBBnBRCZgMpKilSaIGQN1
         6MT3naZP6M2YfatFIVklg0csmjQkO0D2DCTBdj1c8el658YdZNjjaoQpK4ZavlQ45H3J
         ZzPw==
X-Gm-Message-State: AFuF++lFWabm4Y5AzuLc+zel5uAItx2LqGImiJqGOdvXicFMkx5Rwxzd
	q045y0oHG58K2X8klhLh+4O/Z22eyfLiJrvbH1o+/VQZwY2N/tgvWX5CWn07MMvTcjWfIZBVenh
	qS1AO
X-Gm-Gg: AYBFou2X444UeTxaOV1wPlRrooctjQqa9v08R+nvNpYY6sj4Z/jvrQ61fdqszWPpB+R
	9GgbFqq4W+hsuROMp2A/Nhv+va2R9N/EbwHM3nlk7oSJGTDYZdriOah50xAvguCgzyhBmxhFHLm
	wTPSsNcph90EubokjZxwQzgMHKqWywm6s2S8mJfcnu3DU1cTEA+MOFQu+OJGBuOZAJSdVMrIQyp
	WZQOBc9YFwzPiQalC4GZvkBwOenlIeLS+Lqq5gbiCOBCdViarNgkKcuWY2S9AWn147hDXVShj/D
	xW/ykwngdM4wngd8xCw5sT9IMJrpY6NxgIMOF7VCJJM7D6P7KfhUWfy+iekSHE6oeoAMwt1Xcim
	0IVL1/64qOvmQ+8cjiqlL5cbKkrVsSoNf0gN9QlxDMHlsNEENV5jM3VIzpbnnl4s+OnIF8BOqXw
	cEymRuWmm3yVpGhjlDmjbo7sSeo5O2+rcV+rOj8bxM1aM4E9FKjxjpwrbg6GFYaBg/s8ebbc5fV
	UiAp/gGO1et5FOg0Qpi8nKF
X-Received: by 2002:a05:6a21:6016:b0:3cc:9618:f51a with SMTP id adf61e73a8af0-3db0e0ea40amr4315283637.8.1789213485930;
        Sat, 12 Sep 2026 04:44:45 -0700 (PDT)
Received: from MVIN00352.mvista.com ([2401:4900:1cc4:2919:ff34:c674:1b5:9893])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4ed295esm15044987eec.15.2026.09.12.04.44.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 04:44:45 -0700 (PDT)
From: Vijay Anusuri <vanusuri@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][scarthgap][patch v2 1/4] libxfont: Drop obsolete md5sum checksum
Date: Sat, 12 Sep 2026 17:14:27 +0530
Message-ID: <20260912114431.357816-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 12 Sep 2026 11:44:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245696

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 meta/recipes-graphics/xorg-lib/libxfont_1.5.4.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-graphics/xorg-lib/libxfont_1.5.4.bb b/meta/recipes-graphics/xorg-lib/libxfont_1.5.4.bb
index fa6585d6dc..9ec7cc30f5 100644
--- a/meta/recipes-graphics/xorg-lib/libxfont_1.5.4.bb
+++ b/meta/recipes-graphics/xorg-lib/libxfont_1.5.4.bb
@@ -19,7 +19,6 @@ XORG_EXT = "tar.bz2"
 
 BBCLASSEXTEND = "native"
 
-SRC_URI[md5sum] = "16eaf156edd79b68038b6a7c44aa9e9b"
 SRC_URI[sha256sum] = "1a7f7490774c87f2052d146d1e0e64518d32e6848184a18654e8d0bb57883242"
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
-- 
2.43.0


