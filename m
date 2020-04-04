Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com [209.85.216.67])
 by mx.groups.io with SMTP id smtpd.web10.3780.1586026306887412939
 for <openembedded-core@lists.openembedded.org>;
 Sat, 04 Apr 2020 11:51:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=VbInJYXu;
 spf=pass (domain: gmail.com, ip: 209.85.216.67, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f67.google.com with SMTP id cp9so1828098pjb.0
        for <openembedded-core@lists.openembedded.org>; Sat, 04 Apr 2020 11:51:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nIp6uiOgdNr589lSQjbtskeD/BMgmRYNpUfHD9h5FIU=;
        b=VbInJYXuy229N74NYUMTYMQnSQJAeVnOdZhweKTCqPr6DnhyGDyItjoNtDISXjvO1C
         uXw8wop18YtBSoAhuTJ/xrSC09kiIxFN0fwBwlh7Aee3ybNpc2QiFWCI1z2JHZcacnzz
         ejVaGtAO6Ap7vs+WTuYhPp3p65wb//LptmYnVCajH5V456ssXmDazthWQuk+xzM2tV6y
         A8pFiPHLqM6zHKmfPxO1QGHw5WkmPaioUheqzfqTORp0uvcapyQAr2r+CkTaSV0yOtOe
         cLKozpG6zYP477kcs1TPn5SCbdyFKh4ifrMJnodwF72PZSTl13tWkQjXfanE/ZEwogbz
         Px/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nIp6uiOgdNr589lSQjbtskeD/BMgmRYNpUfHD9h5FIU=;
        b=OEK75Owmce8gw2HIwLBbZ75l2Wuya0ZX75UXhF55X+4N4x2qafpQsj8QI0AxWUIRTM
         XqcvXb1Ku24ChlMHnGeglcVDV9Il8NyegJBSjfVNlydgWJ56Hds3Tbq5qjy0EDEvChgy
         n7EG6zBxvyfu0DP+5A963+9BPOi0zNU05fD9U7e3tzqEcmrEwHcGyjRq+2R1uy9HHXoA
         8BhH4zyWXcqmdt66qCuCe21JsohrvbWh/V+0NDfEtGT8z5JA4y/T0dXhOSIc/wQyNZqp
         Vso0d9FDPmB4qEy78/4KEg02PA+VTaSfOO2uwlHu3X/gkqlTAnxwk8XN6OzLgbK7giNR
         MEYw==
X-Gm-Message-State: AGi0PuZaZjkANRtjobSY+0QFYy9+PeKqvNuRlJgN9YTpbfjQoyAUnN+U
	AYiEvou4AVv9uf1GjlfwH5t1DiFcGXs=
X-Google-Smtp-Source: APiQypJfqt65DC2hF6R3Y1oLwEWr6ZOQhLh9z9FPUPY2UB+nhLRA8rppbLza4NS52vjclnMwebw8Ag==
X-Received: by 2002:a17:90a:af8c:: with SMTP id w12mr16667584pjq.37.1586026305928;
        Sat, 04 Apr 2020 11:51:45 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::3e84])
        by smtp.gmail.com with ESMTPSA id x15sm8100141pfq.107.2020.04.04.11.51.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2020 11:51:45 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] icu: Mark strtod_l unavailable on musl
Date: Sat,  4 Apr 2020 11:51:59 -0700
Message-Id: <20200404185159.3073750-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Musl version is just a wrapper to strtod and not an exposed API

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-support/icu/icu_66.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/icu/icu_66.1.bb b/meta/recipes-support/icu/icu_66.1.bb
index 736bec4605..93d7fdbd3b 100644
--- a/meta/recipes-support/icu/icu_66.1.bb
+++ b/meta/recipes-support/icu/icu_66.1.bb
@@ -37,6 +37,8 @@ SRC_URI[data.sha256sum] = "8be647f738891d2beb79d48f99077b3499948430eae6f1be11255
 UPSTREAM_CHECK_REGEX = "icu4c-(?P<pver>\d+(_\d+)+)-src"
 UPSTREAM_CHECK_URI = "https://github.com/unicode-org/icu/releases"
 
+EXTRA_OECONF_append_libc-musl = " ac_cv_func_strtod_l=no"
+
 do_make_icudata_class-target () {
     rm -rf ${S}/data
     cp -a ${WORKDIR}/data ${S}
-- 
2.26.0

