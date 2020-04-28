Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web11.208.1588040162020544831
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Apr 2020 19:16:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=eTMfbb5m;
 spf=pass (domain: gmail.com, ip: 209.85.215.179, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f179.google.com with SMTP id t11so9590702pgg.2
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Apr 2020 19:16:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=aGw3wQrLHf0qsyQtYeXWIfgd/Av8kCyIO89kKyjWfhk=;
        b=eTMfbb5mZji48gx5590xcsm5jBB2pAnwRyHucaijzY81wZbcynCkNb7VH2lHXzhG7F
         5l9mEXJZ1qCWes1gt9K85+HNbzKuPPvw4Kk6k/LbUhhKCtRAcjpGI5yRA3Jn2DoJQW9Z
         btXIGGmeuwVO+vX7vaGaUh2qjuOoxU/niJt933LI3JzInrYVF2jMGkNUmlJbKXF2JEnT
         yL+yJRhGrzVyPMaXh4fhVLWdJOIL2YF59trmecgMcHHx6J2Zsa8a4xCmyaE09J65Teco
         utJvwZo0VGO+Iz+Y1E1+9Wf23/egkQf502l1SbUwdCtAqcqMUpcbjuAPuWv8SCml7cBP
         AKEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=aGw3wQrLHf0qsyQtYeXWIfgd/Av8kCyIO89kKyjWfhk=;
        b=m+LKwBib8L0WOQFtpzPi7r0N4NyOXGCcLaxL8USGjhVLrRqEMNn2IGigsTjgfY6v3n
         BEhpASYUBLWWtBO9H3MTS+omd8vlNQq6CLFZsNwQAAWHaS3pbQD1aaJfbJ0AMhH4GYyF
         li04lNgjEF3sQHYg6SKrLHeLShU2azBbw5xnA8+fIubWuZhyrh3Bz01CQsRI6PKyrDk2
         9Hiw+58I29/y+Tv0Uudo+wQGa2Kn2aA+6gBAgh0nI2WQrMUq3HSuULZF0/JPDN7OfkVv
         zm9GI1e6/ciJxIN5/nvZzlhMGxUX0GI+rX2yAU7IL1NBslY6uTfUYU/TZ1rLj86LnQWA
         +zcA==
X-Gm-Message-State: AGi0PublVop4frbbcGTeXO0BLFqNFq3pm0420A3QEpuEeNa1pt/Dcuc4
	gCLu0Piwe/FeFYSHsIX/jf++Edub
X-Google-Smtp-Source: APiQypLucwsfZv5NbIz48pkbGG+JM7/7r5JJciDEPGRTAJnZS0aaLOUm6+d+2QhhqHPyuCvNPKhSKw==
X-Received: by 2002:a63:6c83:: with SMTP id h125mr27153453pgc.168.1588040161326;
        Mon, 27 Apr 2020 19:16:01 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:f1bf:759e:e8cd:49cd])
        by smtp.gmail.com with ESMTPSA id 6sm12328390pgz.0.2020.04.27.19.16.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2020 19:16:00 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [zeus 2/7] pseudo: Ensure we use our own libsqlite
Date: Mon, 27 Apr 2020 19:15:51 -0700
Message-Id: <2cbb3a663a3d3b2dcf8c12c26843d6087789ded0.1587931177.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1587931177.git.akuster808@gmail.com>
References: <cover.1587931177.git.akuster808@gmail.com>

From: Richard Purdie <richard.purdie@linuxfoundation.org>

pseudo-native is special in that bitbake ends up executing it from the
sysroot-components directory before we have any workdirs for the bitbake
fakeroot worker. Since we switched to dynamically linking sqlite, it
means sqlite from the host system may be found, we really want the version
in sysroot-components. Trying to run tasks to create some special environment
for pseudo is hard and error prone. The simplest fix is to add an RPATH to
the binary so that it can correctly find the sqlite we want.

Unfortunately passing $ORIGIN into make doesn't work so well with shell
quoting so we have to fix that during do_install.

[YOCTO #13814]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 3937ca9e2dfabb1ce9bce1d536b60b1e2a43739b)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-devtools/pseudo/pseudo.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/pseudo/pseudo.inc b/meta/recipes-devtools/pseudo/pseudo.inc
index 7ff8e449e9a..50e30064bde 100644
--- a/meta/recipes-devtools/pseudo/pseudo.inc
+++ b/meta/recipes-devtools/pseudo/pseudo.inc
@@ -16,6 +16,7 @@ INSANE_SKIP_${PN}-dbg += "libdir"
 PROVIDES += "virtual/fakeroot"
 
 MAKEOPTS = ""
+MAKEOPTS_class-native = "'RPATH=-Wl,--rpath=XORIGIN/../../../sqlite3-native/usr/lib/'"
 
 inherit siteinfo pkgconfig
 
@@ -115,6 +116,7 @@ do_install () {
 }
 
 do_install_append_class-native () {
+	chrpath ${D}${bindir}/pseudo -r `chrpath ${D}${bindir}/pseudo | cut -d = -f 2 | sed s/XORIGIN/\\$ORIGIN/`
 	install -d ${D}${sysconfdir}
 	# The fallback files should never be modified
 	install -m 444 ${WORKDIR}/fallback-passwd ${D}${sysconfdir}/passwd
-- 
2.17.1

