Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
 by mx.groups.io with SMTP id smtpd.web11.16636.1616987441777554074
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Mar 2021 20:10:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=H3es1uOR;
 spf=pass (domain: gmail.com, ip: 209.85.222.182, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f182.google.com with SMTP id y5so11208724qkl.9
        for <openembedded-core@lists.openembedded.org>; Sun, 28 Mar 2021 20:10:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wFB5V0qfFpc1wEBrvyzNG2912Hp0843Mn6Ta4PkIb6c=;
        b=H3es1uORIg9kfif4ipyzKYpTXnUmkU1MtwC4DTldSEhHkSkVLjka0A9aN0/iOIfvNo
         mYU/OvvgROdQJ5BhQhGHCoRNlrr/d/8QrUGMHGUCoFDkPruIkmgBYOgzMsiTAnfc6eLd
         wdAzm0jNG3g8qRe+mfgaA16tokHcwiMEkrP7PTDYT/wcWkfqNnKI69sa/fQLDNOjYsVA
         DauJthqSsvN4cbqV/XA0VD8H8lB/wsb0OTVGUBjnyb2oJHEllvL+6vvbo6uVLS07Xh1+
         fFdz/pWSE0lp3LwPmCUx0XhKW/pVho4TasuNC/s0wv+58VEQiwmRY93Cn8zZ/fNx5tKC
         qgsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wFB5V0qfFpc1wEBrvyzNG2912Hp0843Mn6Ta4PkIb6c=;
        b=j1CwayrHCLuG2V4n7Oga4wMGzodOZZBg/o8iCtAm/e0pjWZqtahCBV0FUt+VjID/Ys
         OrB6qFMeeAqgNFNJVFt04Yn7jvwVxIlF2A/WIiXyD4wSaY4Q/KfV0Y9A/A0Z7ZRj4pik
         LNcHjKT0qS23Fz3CC/2wE0zgZLw33iq0eBn8Kpp5SM+b1NeWTX8ULMEV/vuPE05zed61
         saA42nUXWobBXRrgNajOSma+6PqJwoRSzqmfSgwICO56pWI+9bCBmZ4pMJwkASFz4fph
         pzucLAjGMfloOQHNQiZQU2SAKvjoQIOsxz9kJ6YEsFBc5/qxrLcMgXAMJChscrhuE79P
         c08Q==
X-Gm-Message-State: AOAM531HGvRHLG92zljBC3mbAdXoA7pPmOnULapy2f2Jwre7fBr652/z
	Quxeyb/HyBNqo09Osfthl8M=
X-Google-Smtp-Source: ABdhPJwr94zqRPJa0XiTSij8ynP7AJuSqi5ChSVc9dpIrFnfe0m0ZFqlqYkDunip+9jk/vUp3Lhw3Q==
X-Received: by 2002:a37:9d57:: with SMTP id g84mr22153507qke.71.1616987440923;
        Sun, 28 Mar 2021 20:10:40 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from build.lan (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.159.151])
        by smtp.gmail.com with ESMTPSA id h16sm10307020qto.45.2021.03.28.20.10.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Mar 2021 20:10:40 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH v2] perf-tests: add bash into RDEPENDS (v5.12-rc5+)
Date: Sun, 28 Mar 2021 23:10:39 -0400
Message-Id: <20210329031039.13906-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Upstream commit:

   commit 1dc481c0b0cf18d3952d93a73c4ece90dec277f0
   Author: Leo Yan <leo.yan@linaro.org>
   Date:   Sat Mar 20 18:45:54 2021 +0800

       perf test: Change to use bash for daemon test

       When executing the daemon test on Arm64 and x86 with Debian (Buster)
       distro, both skip the test case with the log:

Changes tools/perf/tests/shell/daemon.sh to be explicitly bash
(it was already required, but was just skipped on various
distros).

We add it into our RDEPENDS for perf-tests to fixup 5.12+
builds.

We already have relatively heavy RDEPENDS for perf tests (python3), so
adding bash into the RDEPENDS isn't signifcant even for older perf
builds that use the same recipe.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---

v2: fixup typo'd RDEPENDS in first version

 meta/recipes-kernel/perf/perf.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index edb1335154..e5e5a0d267 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -324,7 +324,7 @@ RDEPENDS_${PN} += "elfutils bash"
 RDEPENDS_${PN}-archive =+ "bash"
 RDEPENDS_${PN}-python =+ "bash python3 python3-modules ${@bb.utils.contains('PACKAGECONFIG', 'audit', 'audit-python3', '', d)}"
 RDEPENDS_${PN}-perl =+ "bash perl perl-modules"
-RDEPENDS_${PN}-tests =+ "python3"
+RDEPENDS_${PN}-tests =+ "python3 bash"
 
 RSUGGESTS_SCRIPTING = "${@bb.utils.contains('PACKAGECONFIG', 'scripting', '${PN}-perl ${PN}-python', '',d)}"
 RSUGGESTS_${PN} += "${PN}-archive ${PN}-tests ${RSUGGESTS_SCRIPTING}"
-- 
2.19.1

