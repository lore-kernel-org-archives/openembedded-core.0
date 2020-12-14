Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web08.35424.1607956687861900911
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Dec 2020 06:38:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=aBJLIerp;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.51, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f51.google.com with SMTP id b5so5162343pjk.2
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Dec 2020 06:38:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=0+hfVqE50aMR6XYhhRFBaytf6P8Azol0Zd3d/R+GtOk=;
        b=aBJLIerpPd453m6WHnah9UtOYws1LgQ8KJmvWQT+tYlCiaTJCedbqTmrjKxxT14UrT
         veD4ZvkkWDvig47sTCSJVfYQLaKE1KeH34QUdzjTDE0Plv/XdY2B5OpajflarKwqBqRh
         Ut8Cihi66VIMddJY1baBlCvgX/tyqwIB0QQz2oQEJC0G7jc5HUSwZbnUviwTKRAv7bPk
         hBp4q96LVOrGsZYdgxUIPDQw9Dcka3kS8EJTluHUVzLYCpRfdFpz08Ci41aijEWXFEoD
         d0XKX9uBc7rHaJtqjHbyKviBASMWDxBE9MN1MibXiHyLb+xGA79uJ9a9YhOS0DCH2D5C
         z8YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=0+hfVqE50aMR6XYhhRFBaytf6P8Azol0Zd3d/R+GtOk=;
        b=I14TN4VBnUba/f/UUdIztX7B1hxUclQxjxbOWsLVzLxSpvN7hg2IquZSvpBr+OuMdh
         fENvwInkiSHA6jGhDrbFLHW+m6k4faQZChpvBBC0ZTOE4eGsCvMSbgt4m7RdLbio6uWU
         Vo9uVIpTN1Fz6iqF+jQF3fCaDRXmBdwQrVpuTOAZQDdTPfkBEV2ugCHfNoKqpIYBOos8
         P8w4tt3YSE65Q6G7finwWBJrssK/OZwkc/orRiOknfCCVKWGtPbjwgR4rHRxTMh81081
         1gjV+0vBo4xmgPC00ayeuOYNReab0kcNHzotskISbATwumnzPuCi/y/RNqnF3KflQUP/
         fviQ==
X-Gm-Message-State: AOAM533ne2ZVWFEysg3SBQc7yQJXaaA9Rkl9A2S0RfiE+EhNHbeqbC8a
	bhn9u8rSvHKSkmS04zNPCvoM6XDGmbUbh9vp
X-Google-Smtp-Source: ABdhPJwS9y9RY96TWScliti3s3u5v2zbIoYSFQKTIkPGe+NyQq5y1GkhRxviwOpE8zjTPopV6Hm9bg==
X-Received: by 2002:a17:902:9f97:b029:da:357b:22b0 with SMTP id g23-20020a1709029f97b02900da357b22b0mr22913078plq.73.1607956686894;
        Mon, 14 Dec 2020 06:38:06 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id y2sm18859439pfe.10.2020.12.14.06.38.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Dec 2020 06:38:05 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 20/25] serf: do not install the static library
Date: Mon, 14 Dec 2020 04:36:49 -1000
Message-Id: <2d44aee1424d50949a8f38bc5b020d93804d5279.1607956164.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1607956164.git.steve@sakoman.com>
References: <cover.1607956164.git.steve@sakoman.com>

From: Alexander Kanavin <alex.kanavin@gmail.com>

scons is using host ar to create it, which may or may not
be built with reproducible option by default. Rather than
patch scons for the benefit of a single recipe, let's
just not install the .a, which is unused anyway.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 7e44275f4d286f005b2f19e3dcc9c6d390b98f30)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/serf/serf_1.3.9.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-support/serf/serf_1.3.9.bb b/meta/recipes-support/serf/serf_1.3.9.bb
index 6a27f12102..2fbf96f997 100644
--- a/meta/recipes-support/serf/serf_1.3.9.bb
+++ b/meta/recipes-support/serf/serf_1.3.9.bb
@@ -30,4 +30,9 @@ EXTRA_OESCONS = " \
                   OPENSSL="${STAGING_EXECPREFIXDIR}" \
                   "
 
+# scons creates non-reproducible archives
+do_install_append() {
+	rm ${D}/${libdir}/*.a
+}
+
 BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1

