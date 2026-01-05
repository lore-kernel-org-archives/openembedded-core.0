Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4810C79FAE
	for <webhook@archiver.kernel.org>; Mon,  5 Jan 2026 17:18:42 +0000 (UTC)
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.69405.1767633515303103454
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Jan 2026 09:18:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=wvlUCEFT;
 spf=pass (domain: baylibre.com, ip: 209.85.160.170, mailfrom: tgamblin@baylibre.com)
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-4edb6e678ddso1545481cf.2
        for <openembedded-core@lists.openembedded.org>; Mon, 05 Jan 2026 09:18:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1767633514; x=1768238314; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=etCFzFrqLkHr6TcB5mCQgLpd4LEPcNObocQ4e+ezt0Q=;
        b=wvlUCEFTGT0Fw14gWSLJ4CFjC2vfFYU+gteLgvqXnq07EJZRi8cwtx6GW+7ZngKG0F
         Ig4+MC+Sl9fs6HLk3PRaujR9aaxqKsxs7tjHdOzXcTF9KRTDrKviFt9+iJ1WVK7TmpL7
         Ya3lHpnpYX/WJzIx68FbqrO3Gm4lV8hWb4m8Jl7504XakHbKJW1YrOpilYWXjLUmzfp1
         LJ0GYgg3MlHEpyMXAM92LCZHfEFC1Ua79qMbZ/TbFL/vICF8EIL9awXKNZvUTGeKBWNL
         cR27frM4fQWNWtNDayD+ULQpXTb2XwAsuL/Kn7VFJ/E5MDRJBZsJdfmG3p814PEA9MA+
         DtaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767633514; x=1768238314;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=etCFzFrqLkHr6TcB5mCQgLpd4LEPcNObocQ4e+ezt0Q=;
        b=ObbDyqjHhOgFScU5nXvAXYC3lH24bnTCvSZD7N9Q5RTwCMNGAwvJzPQSKGT3hiOMM7
         +6OUtbG1wp9fx5j2PqdeonrM3uLwQjNhjqlviA1Prw+8UsnavOjzoF6xa+LmEdjKf5xG
         z8vCSrqXhZ4XeLNlCHlT9BcmMq0IhIoqzk48DLo9kzWBDEpL0LpPIvw40fADjrXbm+3e
         bJNcTypYwRtAOd2+LpND7Sq7H+EvpsMUYp2ycjAKMXaDo8KT3NdOxOTDj0gEdoSsdqTY
         sUbbYYYMgqjo9A/M4npra3gLh07KxJppJV4GB5FGQ57sIhW7UQDQr5Pc8tKzVAeahyFi
         cMNw==
X-Gm-Message-State: AOJu0YzFRu9k3EVO+x8AocHlDlHu5yAUxdN78S3evN1u7zbU+8QIiRRs
	twsMkU9WtbCOnlZtjQcMrNCHf/q0H7kbJskWmts66JKA4vCzfzH5tpTtoQp1YTOzHVFLGpiwrAr
	Fy6rSUyg=
X-Gm-Gg: AY/fxX41NR7BeDsSYrbex4NKcrX2StlSj92trTCXaKn/YfiyityEzE0jrV5gF2a+hrK
	W2bU70apKfK4zliF9AkeEjFytfd5i1qlyUe30otiTu+wKeKv3AXkcJEYdhEizhn+6N3adLSOJXC
	TsoWPFslxI0gOTf3/EzGJ09NNmV47NLeypwrAxDe5Rh6x93kVwpL3UeNYu/S+DmRmIjWaLAN9mx
	vL5dQ1ho1sqyFiY1M+gz+p7VJ+dRSlqvY4k+wU26o9qER6z88N3EmXr7VcPEbb0ZnnIP+DnTFIi
	qsbwbiB2nwWZI3eu6SPeh05dsEnJE+H+RulWfUxV07oWXfXMrOiNL4hY2Un51TUXJv4+n285VTF
	+LvMtENm578I6vCK1i0BH8lOmUhMtS20mkaTDHZMppNlHhe+dcBwb1TBH4KAXwXWMa1nHyigy10
	lMCUfbqbVi3WZq/Qw=
X-Google-Smtp-Source: AGHT+IEXOyO28nRTEANww08XsuFpD8drOTqPkvF88qqbNCOZsdpk9NhXGMesJ8Oow8s4pRXbXi+6pg==
X-Received: by 2002:a05:622a:1b87:b0:4ed:d76f:a350 with SMTP id d75a77b69052e-4ffa7833e91mr2770201cf.75.1767633513603;
        Mon, 05 Jan 2026 09:18:33 -0800 (PST)
Received: from localhost ([2001:1970:3847:e000:8598:5636:16ad:2a8f])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4ffa7056f18sm2471861cf.1.2026.01.05.09.18.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 09:18:32 -0800 (PST)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] python3-numpy: upgrade 2.3.5 -> 2.4.0
Date: Mon,  5 Jan 2026 12:18:30 -0500
Message-ID: <20260105171830.3762638-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Jan 2026 17:18:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228872

Changelog: https://github.com/numpy/numpy/releases/tag/v2.4.0

ptests look OK:

|============================================================================
|Testsuite summary
|# TOTAL: 48248
|# PASS: 46447
|# SKIP: 1767
|# XFAIL: 32
|# FAIL: 0
|# XPASS: 2
|# ERROR: 0
|DURATION: 327
|END: /usr/lib/python3-numpy/ptest
|2026-01-05T16:24
|STOP: ptest-runner
|TOTAL: 1 FAIL: 0
|root@qemux86-64:~#

and reproducibility:

|2026-01-05 12:08:19,641 - oe-selftest - INFO - Ran 1 test in 1449.498s
|2026-01-05 12:08:19,642 - oe-selftest - INFO - OK
|2026-01-05 12:08:23,069 - oe-selftest - INFO - RESULTS:
|2026-01-05 12:08:23,069 - oe-selftest - INFO - RESULTS - reproducible.ReproducibleTests.test_reproducible_builds: PASSED (1402.66s)
|2026-01-05 12:08:23,069 - oe-selftest - INFO - SUMMARY:
|2026-01-05 12:08:23,070 - oe-selftest - INFO - oe-selftest () - Ran 1 test in 1449.498s
|2026-01-05 12:08:23,070 - oe-selftest - INFO - oe-selftest - OK - All required tests passed (successes=1, skipped=0, failures=0, errors=0)

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 .../python/{python3-numpy_2.3.5.bb => python3-numpy_2.4.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-numpy_2.3.5.bb => python3-numpy_2.4.0.bb} (97%)

diff --git a/meta/recipes-devtools/python/python3-numpy_2.3.5.bb b/meta/recipes-devtools/python/python3-numpy_2.4.0.bb
similarity index 97%
rename from meta/recipes-devtools/python/python3-numpy_2.3.5.bb
rename to meta/recipes-devtools/python/python3-numpy_2.4.0.bb
index 55b8091ff8..cd6664ee18 100644
--- a/meta/recipes-devtools/python/python3-numpy_2.3.5.bb
+++ b/meta/recipes-devtools/python/python3-numpy_2.4.0.bb
@@ -12,7 +12,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${SRCNAME}-${PV}.tar.gz \
            file://fix_reproducibility.patch \
            file://run-ptest \
            "
-SRC_URI[sha256sum] = "784db1dcdab56bf0517743e746dfb0f885fc68d948aba86eeec2cba234bdf1c0"
+SRC_URI[sha256sum] = "6e504f7b16118198f138ef31ba24d985b124c2c469fe8467007cf30fd992f934"
 
 GITHUB_BASE_URI = "https://github.com/numpy/numpy/releases"
 UPSTREAM_CHECK_REGEX = "releases/tag/v?(?P<pver>\d+(\.\d+)+)$"
-- 
2.52.0


