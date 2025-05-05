Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 825B3C3ABB0
	for <webhook@archiver.kernel.org>; Mon,  5 May 2025 13:08:47 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web10.49650.1746450526251565116
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 May 2025 06:08:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=xFeX2WAr;
 spf=pass (domain: linaro.org, ip: 209.85.167.48, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5499c5d9691so5168796e87.2
        for <openembedded-core@lists.openembedded.org>; Mon, 05 May 2025 06:08:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746450524; x=1747055324; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ho/z7X4qIok9OC3mJPM6RA2ebYUB5w8WN4lsm76GuZw=;
        b=xFeX2WAr5dbqSSpOPRu1QllCp2KpaLCmcP/M0Q9xhqZBCObgVUQLskupRnJB1MOeKw
         /ytFjdEZ/igr1Xhr0N0jHMhIMVGiMobORsb5HUw5m57fM+cElvoa/cZ+DVouhzHvPjbC
         pF0QW3OiC10som9RzluVTwzhA3oyAlwa+ZiBPCupQi3rJQ+8OsaGLXzX3SjE9W04AEd7
         SMhVzKrNSenPKzPn5l6+kxR2KkjP8jOzpCfFh2KuzHddKAEEDoffTKSAApgY/yGZAFUZ
         /lOkUm7kGa92tNbKDT7TRWQWaLrbiR3b4VlZMwlL73LuVEd606FTb6lTkT6RCo/iAA4J
         Sz+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746450524; x=1747055324;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ho/z7X4qIok9OC3mJPM6RA2ebYUB5w8WN4lsm76GuZw=;
        b=dudrghPz6xCb9SBBnb9yXuIevW3W7sXq/DIme6pUZbuJYfqe/Z2TyIPckuBteAk5rj
         PTcY85s0tPgUWElguYZU5NF4DBSUFTBoVEVG+ja6qESspIhQOQXdq6Elb9XMmXHJXEfR
         cHe0WvQ01SQlqcCZ5G25u0aSLxvMl9HZacc9UesJdc8XdD+k91ChFVv8djGKaEQ3IsKW
         Gm1L6BazrVfESBOwlhTM73K7CUMyRgoRfg+vBVmBRjUs3EXLk2ssKHx68/6SI8iwwXy7
         3SfkmVtC7veQNysYI3GxWd8cWt7vUVY9+uGEMr5yzCTXr6lTI3hiZLMrrmJDkbzCp5/Y
         qesQ==
X-Gm-Message-State: AOJu0YwT+t8joWvwxEX+QXcyI53n1pvygtAObXWRoKfoK8tazEabSYZl
	5LpoWaTaz6SaReGIlTviFXqHARzhgpEssOngJ9k1omBDt436x4r7wu9GDsYBlhBqBzXEcurHyMQ
	cMbo=
X-Gm-Gg: ASbGncvDEAek5NddligaGf8qd8HlRYg0HjnM08TwCjX2vb586FE/T8dRuX8z4QjNjrA
	QePnydbOQXsc/bwL2/4tR/AYj1ic+DnHsyAOzYQEI9ZjkuY40vL9mXYqD3AiLi1kYUN/RPYpgHZ
	2wQyIBk2iz0Or0PxhN27x8vwvrR5Psys6FubrIlqtZaXcYhm4HoxvlZ376ScXKWk2gfOqiZVXEy
	vJEvmXZElCQbQQ+02B5tax+auhxN5DCMKaZ/Eo2ro0txAxGKdsv2CofYkEQC1sPCO9Fr17aCDnl
	hGCkEOK0PHMZsdg8Bj6FPzbxshY6REb+hBjFKr5PFPceEsFlibj/94FiUriKXmHO6dQLrdG6Zdz
	SLRSEqW3RhGkPITwNeg==
X-Google-Smtp-Source: AGHT+IGLssdIulcw8iSX9fVSI9qw7LjQWCNXL5VrS4lQJ0GvftWfBNxWI5CmQPC52WQxJqjCWKxdXA==
X-Received: by 2002:a05:6512:234d:b0:54a:cbfb:b62e with SMTP id 2adb3069b0e04-54fa4f90485mr1659643e87.35.1746450523990;
        Mon, 05 May 2025 06:08:43 -0700 (PDT)
Received: from localhost.localdomain (87-100-218-141.bb.dnainternet.fi. [87.100.218.141])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ea94f69e5sm1698448e87.232.2025.05.05.06.08.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 06:08:43 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH v3] bitbake.conf: pseudo to ignore vim and less config files
Date: Mon,  5 May 2025 16:08:30 +0300
Message-ID: <20250505130830.995042-1-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 May 2025 13:08:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216011

vim and less always write to these files in users home directory.
Using vim and less via pseudo in "bitbake -c devshell recipe" and
outside of pseudo triggers pseudo aborts which makes interactive
use of devshell difficult. Fixes vim and less crashes and related
pseudo log entries:

inode mismatch: '/home/builder/.viminfo' ino 33270730 in db, 33269736 in request.
inode mismatch: '/home/builder/.lesshst' ino 33270625 in db, 33270730 in request.

Ignoring all files with ${HOME}/. in path fails since tools seem
to be using these paths, e.g. trusted-firmware-a from meta-arm.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 meta/conf/bitbake.conf | 2 ++
 1 file changed, 2 insertions(+)

v3: back to .less and .vim paths due to failures from trusted-firmware-a in meta-arm,
    added comment

v2: ignore all files from ${HOME}/. instead of just ${HOME}/.vim and ${HOME}/.less
    https://lists.openembedded.org/g/openembedded-core/message/215991

v1: https://lists.openembedded.org/g/openembedded-core/message/215986


diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index b1dae17267..1de22ea868 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -748,6 +748,8 @@ PSEUDO_IGNORE_PATHS = "/usr/,/etc/,/lib,/dev/,/run/,${T},${WORKDIR}/recipe-sysro
 PSEUDO_IGNORE_PATHS .= ",${TMPDIR}/sstate-control,${TMPDIR}/buildstats,${TMPDIR}/sysroots-components,${TMPDIR}/pkgdata"
 PSEUDO_IGNORE_PATHS .= ",${WORKDIR}/deploy-,${WORKDIR}/sstate-build-package_,${WORKDIR}/sstate-install-package_,${WORKDIR}/pkgdata-sysroot"
 PSEUDO_IGNORE_PATHS .= ",${DEPLOY_DIR},${BUILDHISTORY_DIR},${TOPDIR}/cache,${COREBASE}/scripts,${CCACHE_DIR},${S},${B}"
+# Ignore all files and directories with path starting with .vim/.less in HOME
+PSEUDO_IGNORE_PATHS .= ",${HOME}/.vim,${HOME}/.less"
 
 export PSEUDO_DISABLED = "1"
 #export PSEUDO_PREFIX = "${STAGING_DIR_NATIVE}${prefix_native}"
-- 
2.43.0


