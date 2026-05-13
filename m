Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15495CD37AC
	for <webhook@archiver.kernel.org>; Wed, 13 May 2026 23:10:31 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.650.1778713828519154680
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 May 2026 16:10:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=KXqI3iss;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-48a7fe4f40bso83488565e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 13 May 2026 16:10:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1778713827; x=1779318627; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=hYvBLVr4HMmiWaVjesCiJE86Eyd+tqm6fql88NXLM+E=;
        b=KXqI3iss8LWd8yEX1egO5EwfPqaP6X9PuzTOPMMNhxl0N9qdG/IUxyMWVnyFKRdkSz
         CPCVboZICHSTwm4gjzCF0QXHQfXU7KE6ak6ZwO7WiyTMSmLSnybZRBS1VSfYxohYg5vu
         WYhxk9J5ycKKmkmntCy4FeFwpvGq+vXm9D6lE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778713827; x=1779318627;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hYvBLVr4HMmiWaVjesCiJE86Eyd+tqm6fql88NXLM+E=;
        b=WA12NlE2r6t6wgq9BfvTTFLmD0CE/pIvrDXPa+6uVkYB2uHaeKtoELUoiRImrtBqIJ
         eZRU7AJgRlMnlMBa81w9tRgo0zl1OQMPifeUsadpQJRuAa4p6B2a9zMNRxMJDiMNuULn
         wDn2s3Lk+SIYuaqQrG3vZm/VDKXNhwIPz8lWWEAtMi6QJPWaedhosPWLKdLWlrIh/07p
         kQ5SUy0A5ePOXO4LL+VoSwEMulManzzNg8uFgVv1Y9oXLmDrzoxfkbunIv8EryA3nRk0
         p/+f1nCLU47jlkk6w3rsVyTpabK1o1nYSPWkYWZKluts9mBnL5wB9aIzsoimE7FUs8/X
         gC6g==
X-Gm-Message-State: AOJu0YyuCApfAEos+tk/n6i4NVESmlqk4CYM90oI5pwkoXF9Xv/M432A
	RHVz64NUgwEJg4z1I5kQ/1uJEYYFdlgYx795qwqfWCwumfgjgj89OHudcVH2anCrAF+DRmMD/tv
	SIszC
X-Gm-Gg: Acq92OFAPlEG2ikOsM9O0rwykQDV+wDubC31sjSODlx5PUHLYWsPl4IcSDRXhJyte6n
	50Yd0Rjsj8ZwsT0o/osqBYu4yqOPb2rbWJ6ddQrM/HO7G0Kzz+GEloyTDwN6ei4atk+E9Ypm7cW
	+FCNS+9dZiNuZKqHytp7eGBRasPnlpILa3GeZLcKgpf7BW3HyLoSntdk5eIFhQpcDvfP+VQ2SFK
	UJXhNnCN+8Q3tlOH4mV5w1yS/WAO5A/rZvjTdkpL0Au/p2M6rdgkFBvcjksb2bKCG5v0cflLQMB
	dygesxapRY3lueOlxzqdxmEWLYjLQfOodVj2BVludDEFNyWrFTL+QKMjb3AjbMWDevDeG/bAPaF
	58tPOvc+mn6xUukeNVC4ZrODmMPe4HmiiSGHZsgveW0C8OtPce/NwzQfHd2Sy7/1hIQv+ybYm1J
	6CW4TwpfhNsVnXLNdMmptc28o5Zy0quehFFGSEwpjtm7okVQkbGIFB
X-Received: by 2002:a05:600c:8b47:b0:48f:d612:3c59 with SMTP id 5b1f17b1804b1-48fd6123d95mr28131395e9.9.1778713826766;
        Wed, 13 May 2026 16:10:26 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:fd29:d27b:c65f:5d27])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fdb2716eesm5438975e9.5.2026.05.13.16.10.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 16:10:25 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] glib-2.0-native: Remove problematic path reference
Date: Thu, 14 May 2026 00:10:23 +0100
Message-ID: <20260513231023.1600274-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 May 2026 23:10:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237011

The gdb helper scripts are installed to a path that matches the installed
binary path. Whilst technically correct, we relocate native tools and this
path isn't relocated correctly.

The paths mean the build directory leaks into sstate objects and native
sstate objects can have differing path contents as a result, which causes
problems.

Whilst we could relocate it, gdb would not be searching in these paths for
helpers anyway so the tools aren't needed and we can simply remove them in
the native case.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/glib-2.0/glib.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index 349c33bd33c..7fcfd2bf38e 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -124,6 +124,8 @@ do_install:append () {
 do_install:append:class-native () {
 	# Link gio-querymodules into ${bindir} as otherwise tools like meson won't find it
         ln -rs ${D}${libexecdir}/gio-querymodules ${D}${bindir}
+	# Remove gdb plugins as we'd never use them for native and they encode system build paths into their location
+	rm ${D}${datadir}/gdb -rf
 }
 
 do_install:append:class-target () {

