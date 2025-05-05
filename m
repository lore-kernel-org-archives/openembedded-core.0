Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C6D2C369C2
	for <webhook@archiver.kernel.org>; Mon,  5 May 2025 06:44:35 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web10.44403.1746427466611309634
 for <openembedded-core@lists.openembedded.org>;
 Sun, 04 May 2025 23:44:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=mVGBV+Iz;
 spf=pass (domain: linaro.org, ip: 209.85.167.49, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-54d6f93316dso2530045e87.2
        for <openembedded-core@lists.openembedded.org>; Sun, 04 May 2025 23:44:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746427465; x=1747032265; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0WdrSE5VFknw3UaORQNA0db+Uwb/M+NkT/75/tBpwM0=;
        b=mVGBV+IzDWtxxLVFTTrn7Ag/oUGcYG9wMyOQRFNLU/dtKwcCyoYgAaWe7MLnfA9iY5
         ci/rSolEYNma0zJIjIhXvTV1G1eA0GmxJQ4DcDW1IQBgSHX2yBFWT5O793HH7wtNAt0G
         Lnz1FzY1pDVEnMHY/acYnVkCViik32vQCkKv0maCTbkQOKrqnr6qAWz+Y8xoCXZUAPiM
         pMUrE+vfiBH0FIamGnzoSE64E/vLn+sNeFfPkSDtgbNeQndZaO0UTQUSXkeeLk8v4icL
         fYGO1R/u0UKdKHfUqUhpKLs65aBQLxz5obbVdOE7r8zMCfKlLzzqHE/iZKHUF0tMdV0G
         Z5Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746427465; x=1747032265;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0WdrSE5VFknw3UaORQNA0db+Uwb/M+NkT/75/tBpwM0=;
        b=jnLHIuHrp113EvqWKC4SxUsNxPx9D9sKBiJVbFVLuubse4vzNxF65mVGCh5k3PZG3x
         DILq7W1gaGDe0bd18i0CNHc1LvFlOoGYlEc9rDF1Bn1jVtVB1lLGYkRu1J3WYVsS7N+n
         SDFGU7eXURLzzl38GEoUuNHYWPYA6tfR4QWonD4zI0W0BBHYfHNHx5RP3dhpM7Dw9etZ
         PDgbqu+zb6Y7s/bdRcxa37RhcJEBiA3iV/AshTh9Ee9aDnHP37PJxnTLx6AgYrnZoNA5
         0vNRosCKBNS24WR7Vz6sc664w12++krfv2yKvReJxvJ9zf48EcEWpWEn42yAXpTiWYdJ
         qGIA==
X-Gm-Message-State: AOJu0YyeHggSi2aBiScgQoDQEGYrvzefRK9jx6vAEcLZ666Q5tYtejT5
	G+MMTvpYHCAg5xc5KA1FfOOCAXLwlguy6L9x1cadbutXyL8ACJKwMLf7QhsyehWQ+72aqTnfcce
	PpxQ=
X-Gm-Gg: ASbGnctwo04lTnp3uqp7LQGP7JUk563KbYKUSmhw8jAv5MoCsFSYlf7dqmZGcYu8Tg7
	uYQtk7z/nkPo8vvhSwF6UuCfZdLvcVRprVYsLBsP06ZDd88CMvpe6xJqVbkkH+3di0SHGmI9n05
	HWE1ZrEsf18IDeEnY8TjCbvi9UZ3WVqHAtqpwUIDkWK30zEbS+o4UBNV6gkh6AZuuHviSe2F8KP
	MlBHZg4YtqFq+y4fY5YLi3fH9BWqKtebki5/O3joXHeNNHBB4B4J8yJe9/ECe+2AnIQqjZ2rvU1
	Q3IFn2rIXyhxED1h03z5mSb0fnuoynxF8Rz9sLrUpMIxDA0Euf10ieFucWzx3F/DvN13Bu8IhZM
	YJgG30rcIaCtDKo0Rjg==
X-Google-Smtp-Source: AGHT+IHZxnUxCwA2gHrJYY+yQnFqVF6r7wnd+x11q4TYKjKig9R/wWilzlV2i1eRdI2aL20vIJ+B3Q==
X-Received: by 2002:ac2:51cd:0:b0:54a:cc11:9cc6 with SMTP id 2adb3069b0e04-54f9efbe82emr1805143e87.19.1746427464518;
        Sun, 04 May 2025 23:44:24 -0700 (PDT)
Received: from localhost.localdomain (87-100-218-141.bb.dnainternet.fi. [87.100.218.141])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ea94f69dasm1584588e87.241.2025.05.04.23.44.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 23:44:24 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH] bitbake.conf: pseudo to ignore vim and less config files
Date: Mon,  5 May 2025 09:44:10 +0300
Message-ID: <20250505064410.896233-1-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 May 2025 06:44:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215986

vim and less always write to these files in users home directory.
Using vim and less via pseudo in "bitbake -c devshell recipe" and
outside of pseudo triggers pseudo aborts which makes interactive
use of devshell difficult. Fixes vim and less crashes and related
pseudo log entries:

inode mismatch: '/home/builder/.viminfo' ino 33270730 in db, 33269736 in request.
inode mismatch: '/home/builder/.lesshst' ino 33270625 in db, 33270730 in request.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 meta/conf/bitbake.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index b1dae17267..9cb70ee999 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -748,6 +748,7 @@ PSEUDO_IGNORE_PATHS = "/usr/,/etc/,/lib,/dev/,/run/,${T},${WORKDIR}/recipe-sysro
 PSEUDO_IGNORE_PATHS .= ",${TMPDIR}/sstate-control,${TMPDIR}/buildstats,${TMPDIR}/sysroots-components,${TMPDIR}/pkgdata"
 PSEUDO_IGNORE_PATHS .= ",${WORKDIR}/deploy-,${WORKDIR}/sstate-build-package_,${WORKDIR}/sstate-install-package_,${WORKDIR}/pkgdata-sysroot"
 PSEUDO_IGNORE_PATHS .= ",${DEPLOY_DIR},${BUILDHISTORY_DIR},${TOPDIR}/cache,${COREBASE}/scripts,${CCACHE_DIR},${S},${B}"
+PSEUDO_IGNORE_PATHS .= ",${HOME}/.vim,${HOME}/.less"
 
 export PSEUDO_DISABLED = "1"
 #export PSEUDO_PREFIX = "${STAGING_DIR_NATIVE}${prefix_native}"
-- 
2.43.0


