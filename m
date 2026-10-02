Return-Path: <luciano.dittgen@ossystems.com.br>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC7A7CA5FE4
	for <webhook@archiver.kernel.org>; Fri,  2 Oct 2026 21:11:21 +0000 (UTC)
Received: from mail-dy2-f43.google.com (mail-dy2-f43.google.com [74.125.229.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4399.1790975480573478998
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Oct 2026 14:11:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems.com.br header.s=os header.b=sytuiQ9f;
 spf=pass (domain: ossystems.com.br, ip: 74.125.229.43, mailfrom: luciano.dittgen@ossystems.com.br)
Received: by mail-dy2-f43.google.com with SMTP id 5a478bee46e88-340f56c44b0so11671eec.1
        for <openembedded-core@lists.openembedded.org>; Fri, 02 Oct 2026 14:11:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems.com.br; s=os; t=1790975480; x=1791580280; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sssyibZG8L1YW0r6rItjn25+q+AvII76+Lojeb40mzw=;
        b=sytuiQ9fHRQebpBEWwUyPItp1RH7IvB64NptBIAeHMEkN05OkPG8QCZV5Ep0Z47+m2
         lK8YuSMHssTI4i/mU46VeOF6ljPo+1rzSO2AQY/Epxhs0DjihpXh0frgUYbidAu/qGrx
         zLqGdxgPm07P6tJ4bemN8Yd3FW9+2EJNri5DvdHMmSGMruxktEnEPEASVDB8nybJ8lcQ
         sSijbIdQ6G9rac235eGOjmYsI93Pg3kJSdN29YQy7DwawirAuA3VgEqRXSMaY+WaEI5W
         ODwHWezb+kSyZIqQjK5PfGmeS3OKbhP8FzqSy1VqA8nfOaKFy5zn/ajVumPRE2Mi/BQ/
         RJOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790975480; x=1791580280;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sssyibZG8L1YW0r6rItjn25+q+AvII76+Lojeb40mzw=;
        b=eQVM9O4qF3UVlw1u9NioY5aQTZXM5hkIcyxfefeo/qPwClItf0NAOkiESQr0SOpAvI
         FynQbopStTGZEPQU3n9rnzTRB/ya/Mu3N6YE62XCFRu652mZTC5tm6tLtXI62HpeLC2h
         yos5wWO2dz1QAZdu0liFe0r3V9+HnsoKObi0xvrKRTK4BUqXLlfLmLekly1DhuDh9LpA
         EcLR6xiKyxLsob+qPjX+Hyyiud3nqGXFHE+3rgxVCJLe31aNhxR0iFQWg+YgVo1ODvCu
         ofDKXz3zb5yovszXwucv1oUQt4gP5/7vZVVWhEZVq0wKpSKaeMxVTHX+axNwz5HDuvUZ
         /csw==
X-Gm-Message-State: AFq9FYLvFb8VUzXa+mhHToZXV4IYLdqSXS3/GBLOom6D515hTeFlcz0C
	Z59+u7o9gmYyTImxvHZ0IOxO8mF0MlQNZdbZeSk3tjO9Q0DCxr3d7Cm5/LmyLfPCCocsM4HH61X
	/C+GD
X-Gm-Gg: AYBFou2qvH8UfKVI5If+OM8YZX95a2Fz85RwYNE/pH0Z0P3tw+2wN0d2iRB6QupzTWK
	9dNb20ieGz3WDaTZ61SOOcojDX7By573U27hod2hF/0BDTR0TCoQUF8BIPGYkcApN5sWrxLthWQ
	Z40/Q1+uvsNcwHvX/mqYebiAua/XxbLS/L1ju/GLdqQUvTygW7x4BCAKKDUqRM0WoDDGo3UjFEE
	1RjWYMWr0VnR455uv667VAaVTMQGGN8GOWjNA3dctgrHCii/jBbmypyBJ+aCVQmoSp4kYTrMI9z
	1Kv9vg6aVH2dzYViECdDK1sv/P0xNMbeKU88Em54XIpS3a1nzs7CdslfksBRveTAJX35Y+Wv3PM
	WM6cv63RQQR+ZRiE25VNObFh1pGUstJWXTEwphjB1g3AxofSHJroMmcEYol+WAf3AeIYG8EZj9e
	+hYBkOB9k8dLGPqg9KSp/LhZkfePnb+RPfhNusZMfC0HpFcQMPIZPYutBBR2OKsHDwIG10fZA9k
	p3AjUnULTUAFQpO1DvBnWf+t/oBbg==
X-Received: by 2002:a05:693c:42c3:b0:351:aa6:93a7 with SMTP id 5a478bee46e88-3510aa69497mr2224345eec.38.1790975479649;
        Fri, 02 Oct 2026 14:11:19 -0700 (PDT)
Received: from centrium.lab.ossystems ([177.22.171.68])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3510850f86bsm5428890eec.11.2026.10.02.14.11.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 14:11:19 -0700 (PDT)
From: Luciano Dittgen <luciano.dittgen@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Luciano Dittgen <luciano.dittgen@ossystems.com.br>
Subject: [PATCH 0/2] Make PowerPC cross tools hash the same across tunes
Date: Fri,  2 Oct 2026 18:10:35 -0300
Message-ID: <20261002211037.745952-1-luciano.dittgen@ossystems.com.br>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Oct 2026 21:11:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247136

yocto-check-layer test_machine_signatures fails on meta-freescale when
PowerPC machines on different tunes share a cross tool: the host-side
*-cross-powerpc recipes get different signatures although they build the
same thing. In both cases the value is identical and only its expression
differs, so the fix is the vardepvalue idiom 39bfa0dd32 already applied
to gcc-, binutils- and gdb-cross for this same check.

Tested with `bitbake -S lockedsigs` on gcc/binutils/gdb/clang-cross for
p1020rdb (e500v2), p2041rdb (e500mc), t1024rdb (e5500), t4240rdb
(e6500), p5040ds-64b and t2080rdb-64b, on master: 74 conflicting tasks
before, 29 after. All 29 left are multilib-related:

- t4240rdb sets MULTILIBS, so RECIPE_SYSROOT's expression gains
  ${MLPREFIX}; meta-freescale's to fix, not core's.
- lib32-gcc-cross-powerpc still hashes lib32-linux-libc-headers, which
  is tuned per CPU: the gcc-cross-${TARGET_ARCH}->linux-libc-headers
  entry in SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS does not match the multilib
  pair, and TARGET_ARCH differs between the base and the lib32 variant.
  I don't see a clean way to express that exclusion; suggestions welcome.

Luciano Dittgen (2):
  clang-cross: Ignore how TARGET_ARCH is computed
  arch-powerpc: Hash ABIEXTENSION by its value

 meta/conf/machine/include/powerpc/arch-powerpc.inc | 3 +++
 meta/recipes-devtools/clang/clang-cross_git.bb     | 3 +++
 2 files changed, 6 insertions(+)

-- 
2.54.0


