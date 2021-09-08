Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web12.15614.1631124095924155830
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Sep 2021 11:01:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=H0PIMDBC;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id n7-20020a05600c3b8700b002f8ca941d89so2190338wms.2
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Sep 2021 11:01:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wBFm0DXa3Iu0nIvz4kocTdlz0oBdLVrkFii6TGXuxc8=;
        b=H0PIMDBCNgMJTj3F6D5G6V+AB89rvlgCDMZHHneJ1x48CWxpLeCU67agoE159jWkrD
         RyHLKxFS+EAOGm6kEPW9uLNWrzOx9czt0mRwO1OYUV7r3Q4SlqtizFsRGAaaplEqHUg/
         uOMMv+E9K1TwSUqW3tFpxKqi9vGJfB6oC+MV6grEG3wTXUwHOj7BqIyY/RUyHhIc2STY
         mStu9QsolRxHNPs95onGBhYppU1wsbB4pF4zCXnJN5LEpojG8V0HbussAa+mGbsGQVsN
         G6195jwG6VlyVpdH2brDmnBJpKYNrTS0ozr4Pe9d69sSSaYcNCupzXIfF+JnCsL06Jip
         qQjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wBFm0DXa3Iu0nIvz4kocTdlz0oBdLVrkFii6TGXuxc8=;
        b=atnleZzEpdVS0VeLRC4OOYR08Xi/itYmobMXt0pqtfRU5uzmdioi5EMnEAho3vBUuh
         NM4xsVI/8rwYUGuiTjbXhmdMTHFFfYKzO86zS9fvY8of+kGOFQ6tRDPg0QuugETE04IM
         NDfdG7cDFSLgSQ91LBOUSc1rhkpo7lT5BLirAiZLrr7LHVtfmoaLROlJwUZRqAtFKEjP
         aVm2Jh2Kgb5Gwdx2M6H4CdNAR0aRwMxdVMGHffmdK1vg7hDkh3dtSKo5RRa0o5/ffIMn
         38zO1if9wjAp1+48D6REDzvInBJBxcgQGNB2HLIoYg8jAEq9TJWx9HvzwIyF1xViz2WE
         SD6w==
X-Gm-Message-State: AOAM530F12ayGlumjyPwXTNk8jl5y4EUlIJoF0UiyWrkyhyamPQ+irq9
	N2hgsPvz9S6AFMl0k3/g4xB5YLigiA8=
X-Google-Smtp-Source: ABdhPJxThusNSAOXTGvafQp38hyqkgiYJCHdMY9eIOBdejCVQoQCtcqcfKRPqGdUaHfSNjN+nY7cJg==
X-Received: by 2002:a05:600c:230c:: with SMTP id 12mr4907877wmo.41.1631124094497;
        Wed, 08 Sep 2021 11:01:34 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:29b:3b00:d35d:e3cf:58b5:748b])
        by smtp.gmail.com with ESMTPSA id s14sm2539648wmc.25.2021.09.08.11.01.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Sep 2021 11:01:34 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 08/26] perl: do not build berkeley db module by default
Date: Wed,  8 Sep 2021 20:01:07 +0200
Message-Id: <20210908180125.103473-8-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210908180125.103473-1-alex.kanavin@gmail.com>
References: <20210908180125.103473-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Bdb is unmaintained and altogether obsolete, the less dependencies
we have on it, the better.

This leaves only apt (specifically, apt-ftparchive) in core as a bdb consumer,
sadly it has a hard dependency that isn't easy to patch out. Maybe apt
upstream will get to it at some point.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/perl/perl_5.34.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/perl/perl_5.34.0.bb b/meta/recipes-devtools/perl/perl_5.34.0.bb
index ab19a8d0be..a12a0be2f2 100644
--- a/meta/recipes-devtools/perl/perl_5.34.0.bb
+++ b/meta/recipes-devtools/perl/perl_5.34.0.bb
@@ -35,7 +35,7 @@ DEPENDS += "perlcross-native zlib virtual/crypt"
 
 PERL_LIB_VER = "${@'.'.join(d.getVar('PV').split('.')[0:2])}.0"
 
-PACKAGECONFIG ??= "bdb gdbm"
+PACKAGECONFIG ??= "gdbm"
 PACKAGECONFIG[bdb] = ",-Ui_db,db"
 PACKAGECONFIG[gdbm] = ",-Ui_gdbm,gdbm"
 
-- 
2.31.1

