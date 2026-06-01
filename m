Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 535B1CD6E67
	for <webhook@archiver.kernel.org>; Mon,  1 Jun 2026 18:13:01 +0000 (UTC)
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5837.1780337580021067719
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jun 2026 11:13:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Ru9vFAiW;
 spf=pass (domain: gmail.com, ip: 209.85.161.43, mailfrom: jpewhacker@gmail.com)
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-69d8f70cb0cso6123451eaf.0
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2026 11:12:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780337579; x=1780942379; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p7eI2sFKO+Yv5rC+lPWsXyeqFVR4ZqNlVd2uN9l6RR4=;
        b=Ru9vFAiW6es+7zBCIzVyfTMgUTOArPQeBx7dnZpQSOJTQGJySmVP/v1d5bN87pGPl2
         kbYvLe3l/uENGlIVsfU56xa4cwr5LTAQvnySys+kezKbDVhPn7ktKbWUFjvmLbYVBxpU
         WZ8+k+uOXrfNToGoPYQJGODnDaAua3X81ddbFBDFXjl1afls4A2v9sxy1Cj8fQjv+FfT
         GGh1XyY80MFjvzlpMWbaFkSz95wPtBY8gkLK/yONPPa5R3oNDbUWma+9IDoPMkzRRUYh
         ak0KGVt1ZPsFFSSEVKGScZY7O/p/CuGq3vn2uMsO3c7p3M2+sM4C1M0wa3jJmZ0JnIbr
         pMvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780337579; x=1780942379;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=p7eI2sFKO+Yv5rC+lPWsXyeqFVR4ZqNlVd2uN9l6RR4=;
        b=rqYV0mQt8mdij99aVtZOv2kM8rJPvJHdP4hTmhC6Hk6vHhxLNzedfiqnDzRvXim5H9
         KLMeD7KS6rr5/wrYwQj6BULbyinA3IwaciRZS3IaEvSVg/DC53QIlO8asDsCJUxwTC9B
         EW6Py3CjFfhUVQh/73WqJ6BV991ZPeLw/0Ii46T/yMdnq3H5sZNz3rnINvx3w2vzQHO1
         z2mZaXhxwnp7sb3QM23VVkZVQ873ROvYIO6lWM/yMaGZ+ELayyrQ2zaEIZeVDgzQj3oS
         iMFW3DA14qGrwUD1V1DVp9QCPBy/HGOF3RmiuyQQXZ3jTTRMhQ/czagSLoFIsuNpXRn1
         IyyQ==
X-Gm-Message-State: AOJu0Yzb3n/kwaWu5Sf5c8LEHnznni4tGnV75igmSrAzgk12UbVocH+B
	JXYrfmEOB5EamGWcvDuEOhhQGkX84hFEiHQHVudDF6djKNj3tEe3zAcTyvlcCg==
X-Gm-Gg: Acq92OFSFNcTqAhpn0ApDQN2zR+UKjwwivNA0hj3vkQVNeTydGXzM9VieeAZP+gmz/Z
	5PBkLRCLT9/nvgDvWWei0JMZQIPqXz5gHoWMTFpsmKnQygol8yTDNElCbYCnPNenLtYU15syOt9
	rKVSZTSgiqj5lAzli/E6LE666JiwHjsI16tfQq3GelTa1kFTQJ9b64Uf0fOGCwpDPKlzSy9EfOc
	xiclceQBg6Cf3Noqu7Lwi1LIB8HeHFRyE+k0ATznR1wsmHf3mZPTMv2jehlPgHDgIoeBJZW3dnd
	6LOSajcXDQcbYZ+oHPT6A3+MPaM99t3oNlEyUJxGf0P9ZyJ7FMdzofx733/SFl078bSofl2GXa8
	6eQI0teukwxd/DG0a3nWhIWyY+utSWfW14E05NwWqWjlfEh780YcGsVFCSV92H1dztskXCWm73w
	/NVY/N+CRmxvPfMZ4YDAmUvEB/0PCHUU4=
X-Received: by 2002:a05:6820:a04:b0:69d:f7aa:31da with SMTP id 006d021491bc7-69e10436d9fmr6090963eaf.10.1780337579132;
        Mon, 01 Jun 2026 11:12:59 -0700 (PDT)
Received: from localhost.localdomain ([2601:283:4b02:22d0::399e])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-69e30afb3e6sm860649eaf.3.2026.06.01.11.12.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 11:12:58 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH 7/8] pixman: Change PD license to HPND-sell-variant
Date: Mon,  1 Jun 2026 12:11:42 -0600
Message-ID: <20260601181251.123019-8-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260601181251.123019-1-JPEWhacker@gmail.com>
References: <20260601181251.123019-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2026 18:13:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237982

The license listed matches the SPDX license HPND-sell-variant, so use
that identifier instead

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb b/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb
index 58c7bf3d03..468871f114 100644
--- a/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb
+++ b/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb
@@ -15,7 +15,7 @@ UPSTREAM_CHECK_REGEX = "pixman-(?P<pver>\d+\.(\d*[02468])+(\.\d+)+)"
 
 PE = "1"
 
-LICENSE = "MIT & PD"
+LICENSE = "MIT & HPND-sell-variant"
 LIC_FILES_CHKSUM = "file://COPYING;md5=14096c769ae0cbb5fcb94ec468be11b3 \
                     file://pixman/pixman-matrix.c;endline=21;md5=4a018dff3e4e25302724c88ff95c2456 \
                     file://pixman/pixman-arm-neon-asm.h;endline=24;md5=9a9cc1e51abbf1da58f4d9528ec9d49b \
-- 
2.54.0


