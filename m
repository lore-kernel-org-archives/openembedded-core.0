Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3220ECA0EED
	for <webhook@archiver.kernel.org>; Fri, 22 Aug 2025 14:37:25 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web11.11608.1755873436894266292
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Aug 2025 07:37:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=hzfLDV50;
 spf=pass (domain: konsulko.com, ip: 209.85.210.178, mailfrom: tim.orling@konsulko.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-76e2eb4a171so2780031b3a.3
        for <openembedded-core@lists.openembedded.org>; Fri, 22 Aug 2025 07:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1755873436; x=1756478236; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HEIygs7E8/low7sbSySNSqqUtCts/SF8qJjXqEVwOU8=;
        b=hzfLDV50ZLt+oD10SeU0FnFTcOKIgX1MHxgxjKcz6HXtIcFybfUWtEAkd3B5XrBOGW
         rgWuME7J3jqJkDyDSwSFYIuF6NthIsLnAVQq38jxuhm1NWpVNrWZQ4o2CvZaEx7mMe7e
         2gATEgI4dZtp1ugO9iiwZawvtHlk5dtZ5YtlY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755873436; x=1756478236;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HEIygs7E8/low7sbSySNSqqUtCts/SF8qJjXqEVwOU8=;
        b=c5Io7TSl97T0rifuTuZtKXuKiRwBS7v/FhbjlyEGOTI3ukuMhtmxEuBiGDn/dZoTFS
         FZbtTLut2ObhuzQm06P+UCY9lKpKQlQKbXxyp+Hshq2J/PbKZBinJ19d3EvXjeDU1Lc8
         22hyhlfXFF76mnjyeNAYWxrdv4z2fJEwZubyvLNg+FPxC9c2e9+0CrqjFbrvimvNo0dg
         49BFEOjhHOCTGRSVQbRD1qmCyjTXligvd7xYrkfwW1Sc29iyXa+hMJxvaYjIzusoqqYW
         xSPyEREKJuksxYuSuaYZoFGDnJFqSZoKUbrPqJcBrf5oLv6f3Wgda5QDGc+jp79JzTWE
         9ucQ==
X-Gm-Message-State: AOJu0YwNBQ505nJsfhpt7eaMgQ0+IM/f9rxSYmayqribuIPIbdBbczzl
	rCKzvx0VLDKy3iTBs7ZzECsd+hH9tZOmdHKpeXLHJEriNwM2iJIaDCCCGcI/+VEDYMCepj67m2L
	nycq9l+0=
X-Gm-Gg: ASbGncvN++Sips/zpieqCCXvb/mb232uhaHqBvnikXNxEwn62Yy7x7Ta3h3YkKTLybj
	6idKfEyqv2QkHRjEwbocer7O6Og2btgb0dK/RLUJdf3gfnEIxKjMnkhB4UGTe1Q15AgX7/cvnr2
	n6CzHFtuyR/NNm2OnQpPVv/+/pOq1VhwAoljR0R0k3Ai5ax2meu+1ktycyWlSvHfu5Y9iGCbsx9
	iOWjJ4f7dDTH92ibUFIO7/gBLtwyxlVyyBmmZDfoccGHCVrvzGXgjcQc2nnQQs3O4/WzucSRhs4
	WE5zgbRSiQDOqHkyNw8gXR/civER/NVMUIPQRuvO7BgNDjlIKkMU10KpZVgySNtfJH4zTJLHvoV
	tAL9n4pGcy83oLjPq/poFniz4fh/HGtsNc2ALLjdBAa7NK5WTe39wL3DlemyYfA==
X-Google-Smtp-Source: AGHT+IEOvzlK3UxhKzxutPmFaag/DFFaTvpeqZdmLXDPABgHVjObZlFUMeJmf2fUkUQ/XgPKFzyEsg==
X-Received: by 2002:a05:6a00:3e09:b0:76b:ca98:faae with SMTP id d2e1a72fcca58-7702fa38890mr4927443b3a.8.1755873435824;
        Fri, 22 Aug 2025 07:37:15 -0700 (PDT)
Received: from localhost (c-98-232-159-17.hsd1.or.comcast.net. [98.232.159.17])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77040214db5sm102998b3a.85.2025.08.22.07.37.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 07:37:15 -0700 (PDT)
From: tim.orling@konsulko.com
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH] at-spi2-core: upgrade 2.56.3 -> 2.56.4
Date: Fri, 22 Aug 2025 07:37:09 -0700
Message-ID: <20250822143709.3485909-1-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Aug 2025 14:37:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222333

From: Tim Orling <tim.orling@konsulko.com>

What's new in at-spi2-core 2.56.4:

* Fix key grabs when num lock or caps lock are on under Wayland.

    atk-bridge: Don't crash when requesting a plug if not activated

* Add sanity checks for child indices received via DBus.

https://gitlab.gnome.org/GNOME/at-spi2-core/-/blob/2.56.4/NEWS?ref_type=tags

Comparing changes:
https://github.com/GNOME/at-spi2-core/compare/2.56.3...2.56.4

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../atk/{at-spi2-core_2.56.3.bb => at-spi2-core_2.56.4.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/atk/{at-spi2-core_2.56.3.bb => at-spi2-core_2.56.4.bb} (95%)

diff --git a/meta/recipes-support/atk/at-spi2-core_2.56.3.bb b/meta/recipes-support/atk/at-spi2-core_2.56.4.bb
similarity index 95%
rename from meta/recipes-support/atk/at-spi2-core_2.56.3.bb
rename to meta/recipes-support/atk/at-spi2-core_2.56.4.bb
index dd4929c3496..90df8924619 100644
--- a/meta/recipes-support/atk/at-spi2-core_2.56.3.bb
+++ b/meta/recipes-support/atk/at-spi2-core_2.56.4.bb
@@ -13,7 +13,7 @@ MAJ_VER = "${@oe.utils.trim_version("${PV}", 2)}"
 
 SRC_URI = "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "0e41e1fc6a1961b38b4f9c0bea64bad30efff75949b7cdb988d2f2fdab72267a"
+SRC_URI[sha256sum] = "dbe35b951499e1d6f1fb552c2e0a09cea7cba2adf6c2eba0b2c85b6c094a3a02"
 
 DEPENDS = " \
 	dbus \
-- 
2.43.0


