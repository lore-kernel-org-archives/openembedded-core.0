Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0F92C61DA4
	for <webhook@archiver.kernel.org>; Sat,  4 Feb 2023 11:41:40 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web10.4018.1675510896501888335
 for <openembedded-core@lists.openembedded.org>;
 Sat, 04 Feb 2023 03:41:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=P4f2/Ea+;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f47.google.com with SMTP id j25so3146992wrc.4
        for <openembedded-core@lists.openembedded.org>; Sat, 04 Feb 2023 03:41:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=PzcLJcFLhXsDOHBJK0ZutqRf56FVjkQ2KFx5Qqzge4Y=;
        b=P4f2/Ea+Uy2bHCgnwHT7ja+Cp+bdPNEvP8abY1sAhddrqBqhli32IkpqWU0Hu4jK00
         vxfN8YwhTDksuDkePrmxLPhiL4y0Qh/9+qBTL/Nw2vdd6iQCQkEn3qn3ZjRUGbQ6iBOv
         2FJwosoMFDD6MZCpbnYyeb0TmhG9E0Pib9PJA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PzcLJcFLhXsDOHBJK0ZutqRf56FVjkQ2KFx5Qqzge4Y=;
        b=Sd4/gjxFhWEGdOvuMpz5cKyjTQIXCBlQBjQTAffNhPqMxPKrNIBJvHe5tYyIeKLmw0
         NZAD+aGE3pcHn3DGKjlQ00XfuMom8cGih92yhpwYk4lD79dq/BQKMpVPdSAjAwtJ1uX7
         Ydf8MJXHoyK1UwUDGaQwwpoMRY0JXz9Q9xs0NJgjH0z2cUrmf77mSPA6QgMpxol7NRSj
         Jn7ZHRvX18XdTB5Mp64KcK9AA61KR8K8gU8b3F57i2gapX1borbZ/OFHcQ06fz7laWa+
         A6W0L/WhxAD0nnC8Gf4X2POet52VcYuj+FsQDGTkQerrj3vy3a/YAxNA++v14KQBXFU/
         i3bA==
X-Gm-Message-State: AO0yUKVjaaQIXzkggob2LPAcsz1zh1CY6Th8k5c+ydOvI5W/FYFhsYwg
	TZZXqk96btLUIMadStu2d9oEyHuOfu8spv5P
X-Google-Smtp-Source: AK7set9wrs/rYJYjvcW2W8dcjDiCoshiXJqEryJUu31Y7nAd3jbqHBoeW5LNZ3b4wHdg+Cfv20hqdQ==
X-Received: by 2002:a05:6000:2ce:b0:2bf:f805:5220 with SMTP id o14-20020a05600002ce00b002bff8055220mr15378099wry.43.1675510894259;
        Sat, 04 Feb 2023 03:41:34 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:b45c:7b35:1c6a:a06d])
        by smtp.gmail.com with ESMTPSA id y6-20020a5d4ac6000000b002c3e18119f2sm721970wrs.29.2023.02.04.03.41.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Feb 2023 03:41:33 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/3 v2] perf: Enable debug/source packaging
Date: Sat,  4 Feb 2023 11:41:31 +0000
Message-Id: <20230204114133.1178502-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 04 Feb 2023 11:41:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176759

This was disabled in 2014[1] due to an error message which as far
as I can tell, no longer occurs.

Having debug information and source files present will make debugging
reproducibility issues much easier so remove this line as it appears
no longer needed.

Fix up a few files which have buildpaths in them to avoid QA warnings
and reproducubility issues.

[1] OE-Core revision c1b5a262c0201faf2c6bf545d6acb32dfe383ba3

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-kernel/perf/perf.bb | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index 1dff39a17e4..2f28d16fba1 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -360,6 +360,16 @@ FILES:${PN}-python = " \
                        "
 FILES:${PN}-perl = "${libexecdir}/perf-core/scripts/perl"
 
-
-INHIBIT_PACKAGE_DEBUG_SPLIT="1"
 DEBUG_OPTIMIZATION:append = " -Wno-error=maybe-uninitialized"
+
+PACKAGESPLITFUNCS =+ "perf_fix_sources"
+
+perf_fix_sources () {
+	for f in util/parse-events-flex.h util/parse-events-flex.c util/pmu-flex.c \
+			util/expr-flex.h util/expr-flex.c; do
+		f=${PKGD}/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}/$f
+		if [ -e $f ]; then
+			sed -i -e 's#${S}/##g' $f
+		fi
+	done
+}
-- 
2.37.2


