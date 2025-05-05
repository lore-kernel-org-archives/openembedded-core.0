Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 885EDC369C2
	for <webhook@archiver.kernel.org>; Mon,  5 May 2025 07:40:55 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web11.45192.1746430850467599299
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 May 2025 00:40:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=GV9cJPkV;
 spf=pass (domain: linaro.org, ip: 209.85.167.50, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5499d2134e8so4820192e87.0
        for <openembedded-core@lists.openembedded.org>; Mon, 05 May 2025 00:40:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746430848; x=1747035648; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ylERRG/UYvT/TsCz1una1RQ8ILs/0QHASXUVYy4Cv50=;
        b=GV9cJPkVu3u8Q2vrtcMlwkNOEWQEOiJF+fs4Fy7831p8ENbxCYdgOHbxjrug+0Z9SG
         ZzZfY4e5+3TC6qp5GLe4I8Otpvw5tB1sb5bzOVBc/j3xAS3zp/SmPXwrgQGjFPP2FRv7
         CYErypa4I0w7Y9f2wBmOcnTHJOctliXqQIEbOR5G9XG64TAR144/MusrfU3En6nZJ+hb
         BtIZSKpq0yzEOhQkBcvonFIObj+1ZwNDMa5OMPSHH8G0TqE9otDmbxjzXrPkVSgudnhj
         WQf8xXBDncchvK3GJavNOQ3jVApbJaWOl89VWQIcWKawXRxR+jC2PXCHjBe0qjNMpZpr
         3NUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746430848; x=1747035648;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ylERRG/UYvT/TsCz1una1RQ8ILs/0QHASXUVYy4Cv50=;
        b=s12zcApV7suZVgDzGhvbXczp2Owbh89yIGo/2fgJRn16r3VbBjNw1bL0gjZBfWoAbF
         LiHMOfCJ230TVJ96OTNRrnuoX72ogFqdkvuWOnWbYUve/dNVS7fTNiJcYXwsvV/Fp2M+
         8gUOKAL39POW2l+3ikYfShsSwXG2zcsFYlGRgP1io54CT7IIsxec4GM9rLC77ZgFLVno
         17syZnKxlr4SzBep9SaGH4KRkzvVUrTK1SiC/pveR5WTGP4ZUNERKuLs5o6AxA2sXWbC
         oYIcXAa75SNc3iTYuNHP01O7Ux97sfKMk4Wz94ALFpI/3o2VFJbo1MLqmr2GeMljQjRv
         atvQ==
X-Gm-Message-State: AOJu0YzmUDFkFMZSmYwGDWMT1mM2BMBWJdhyiXR5WsJ6Cue5Y9g/I97S
	/FvBEXW5fAy/JoAbd2hqnUS/SIMZzDUnrhn9KxnXR02vveLz0jxAxzrxDnXWadIMrRYZAt/uDFn
	YZFg=
X-Gm-Gg: ASbGncsDbtvxGRw2gJeJLRbxMpwmEvjSc24rCpkN2K+NPNKwdCmWF1Lxfmjr5dIS2ns
	HVof7tQlRTRzgFxkgmHLeViSgNHFioRtgBLJHMvA+1Z13h3ldMdRCKDYD6NTnJqcaYvNP38W8XM
	uKkRW84P5QcXdGujqRsMOf630eKVWcfhQDy2gKqYxae3+O37NAMDz2WtsaJo74yeZu+CF+QzNGM
	AwqGO7cg9n0VkPpDEVvkxklq2LvpTfh4SnWzGTIN5+E6QD5GywUkIyP0y/itfKfK9bbRhQNQ3bv
	pDBigjMRo7GyChYO7meCRWAy5A883h4H+ipmjN4MKsy+nOIlGn+SrEiBD0BDhiSyLMkar9nalbJ
	oEuDdkX4SFUgx6CmTUw==
X-Google-Smtp-Source: AGHT+IEOYh69aGH07+Mn0bL2gcTLI6HrdWD/KqHjJe5+zkbtu5KWeyHbCAY3a2tKBpsOsFxayXl2eA==
X-Received: by 2002:a05:6512:159b:b0:54c:a7c:cbca with SMTP id 2adb3069b0e04-54eb24670eamr1838934e87.43.1746430846091;
        Mon, 05 May 2025 00:40:46 -0700 (PDT)
Received: from localhost.localdomain (87-100-218-141.bb.dnainternet.fi. [87.100.218.141])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ea94f204esm1601646e87.186.2025.05.05.00.40.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 00:40:45 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH v2] bitbake.conf: ignore ${HOME}/. files in pseudo
Date: Mon,  5 May 2025 10:40:31 +0300
Message-ID: <20250505074031.920194-1-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 May 2025 07:40:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215991

vim and less always write to these files in users home directory.
Using vim and less via pseudo in "bitbake -c devshell recipe" and
outside of pseudo triggers pseudo aborts which makes interactive
use of devshell difficult. Fixes vim and less crashes and related
pseudo log entries:

inode mismatch: '/home/builder/.viminfo' ino 33270730 in db, 33269736 in request.
inode mismatch: '/home/builder/.lesshst' ino 33270625 in db, 33270730 in request.

Ignoring all files with ${HOME}/. in path since many tools
with e.g. GNU readline support will write files there.
Hopefully no-one compiles in such paths.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 meta/conf/bitbake.conf | 1 +
 1 file changed, 1 insertion(+)

v2: ignore all files from ${HOME}/. instead of just ${HOME}/.vim and ${HOME}/.less

v1: https://lists.openembedded.org/g/openembedded-core/message/215986

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index b1dae17267..8d71c8f50c 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -748,6 +748,7 @@ PSEUDO_IGNORE_PATHS = "/usr/,/etc/,/lib,/dev/,/run/,${T},${WORKDIR}/recipe-sysro
 PSEUDO_IGNORE_PATHS .= ",${TMPDIR}/sstate-control,${TMPDIR}/buildstats,${TMPDIR}/sysroots-components,${TMPDIR}/pkgdata"
 PSEUDO_IGNORE_PATHS .= ",${WORKDIR}/deploy-,${WORKDIR}/sstate-build-package_,${WORKDIR}/sstate-install-package_,${WORKDIR}/pkgdata-sysroot"
 PSEUDO_IGNORE_PATHS .= ",${DEPLOY_DIR},${BUILDHISTORY_DIR},${TOPDIR}/cache,${COREBASE}/scripts,${CCACHE_DIR},${S},${B}"
+PSEUDO_IGNORE_PATHS .= ",${HOME}/."
 
 export PSEUDO_DISABLED = "1"
 #export PSEUDO_PREFIX = "${STAGING_DIR_NATIVE}${prefix_native}"
-- 
2.43.0


