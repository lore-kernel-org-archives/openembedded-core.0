Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web11.61426.1594051892817088413
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jul 2020 09:11:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=QjFK1hF/;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.42, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f42.google.com with SMTP id ch3so2047930pjb.5
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2020 09:11:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=sPDjUvy4T9fPTDs6eSOe0DuS7xkubAozr7+loMNxM/A=;
        b=QjFK1hF/+0CTe1RTpbxlCdR9FJWzjZzgZoCyn06jkb8oIMKZvZAcY3+WrPAXQJmmUG
         V03Gu1uTPN/B+/KE/UjGl5Ph6+oWtwj6AFwU1wilwZDEV1ApHb0MrRTNqf4Uz8ZFy3aA
         EXAm4MTDL2P+0aKj9eQlZjoBuMHxUgsByDfsaiMCSrNGFe8NDNEHCukFGMVwvq3A+0Cc
         QMwRu7rF4dMpNiaBNDDAh2A6c4SiUBc/N1+Uumf7CVfDfHs0kbocKtIPtk9AWW9mUEfY
         +MFYryI1ya4fRnTFy7taKJQbmzg8zGvSJ6BfoqeXf4Z6X34/CIhmpWch1mTgKEI5PY2U
         HvBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=sPDjUvy4T9fPTDs6eSOe0DuS7xkubAozr7+loMNxM/A=;
        b=sVXD45+5jUGvIqC/6YGZSkNJt7jCtgo1qBvVravTWF3FVhw2EVmPWUuz6kBYzt+i4l
         IcGfvF+Z+iG5bNeuaJN8tjbZ49ROB9xyvlvsGneSL3nSV4keZucwyWsU+y0I8zG+2frC
         o/SqueoWaMFPbpIxrKvmhhY/OYfSqBBjFngJ+xaEH9cdCfAACEYDbnS6DzcUfpYUUFA2
         +WDwBN3kPEcli3H1cqP5gx+fqxbpR98p8inh9pmXHmHi3G+n4SSD3pinFeJpf1+4p3p2
         TPxJYXKGZsxAP3tcB1aJPpp33Ia2OuXI9D4jA8j/FOs/aj21s/TJYOJN8P6KQnfbPh13
         7Bbw==
X-Gm-Message-State: AOAM532j4OkdbxAq8oFBXPgC5mvPcxQI2+lbmbH2yausdWso2b2x2ErK
	rcRfKkM0szdTb9GFOkF9XJw1d668KSIOGg==
X-Google-Smtp-Source: ABdhPJwmDK+g7bNRtcl81Eba+2eC3PTtqas+BQPswvJdjhNalPLkgh9iZmvKrLravwLtBnZzmz4kxw==
X-Received: by 2002:a17:90b:11c9:: with SMTP id gv9mr36094962pjb.177.1594051891942;
        Mon, 06 Jul 2020 09:11:31 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id i67sm18225811pfg.13.2020.07.06.09.11.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2020 09:11:31 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 11/25] initscripts: update postinst
Date: Mon,  6 Jul 2020 06:10:13 -1000
Message-Id: <b48ea868f0f972861d6144201468388d197e2965.1594050175.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1594050175.git.steve@sakoman.com>
References: <cover.1594050175.git.steve@sakoman.com>

From: Changqing Li <changqing.li@windriver.com>

in container image, it don't have init system,
install package initscripts will report error:
systemctl: command not found

fix by use same way as systemd.bbclass to decide if systemctl
mask will run

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 790276bde066ecc9876120c3097dcd57a9936f00)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/initscripts/initscripts_1.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/initscripts/initscripts_1.0.bb b/meta/recipes-core/initscripts/initscripts_1.0.bb
index 1a59b82fbf..f98e42eb2e 100644
--- a/meta/recipes-core/initscripts/initscripts_1.0.bb
+++ b/meta/recipes-core/initscripts/initscripts_1.0.bb
@@ -169,7 +169,7 @@ MASKED_SCRIPTS = " \
   urandom"
 
 pkg_postinst_${PN} () {
-	if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
+	if type systemctl >/dev/null 2>/dev/null; then
 		if [ -n "$D" ]; then
 			OPTS="--root=$D"
 		fi
-- 
2.17.1

