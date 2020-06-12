Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com [209.85.215.193])
 by mx.groups.io with SMTP id smtpd.web10.23058.1591977320926152276
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Jun 2020 08:55:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=lDqVgYYF;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.193, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f193.google.com with SMTP id b5so3358363pgm.8
        for <openembedded-core@lists.openembedded.org>; Fri, 12 Jun 2020 08:55:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id;
        bh=mBheUxkDqooTv0jRfSqBzkmtcOubXwkLoswlFyFW4hQ=;
        b=lDqVgYYF4Ok1wpByf+tyLKVjuJF2YdoZRSyO6Eo1IH2pELf2b0H5yW5FJK8k+wGold
         EZUAv5mbx3vaKlz3+BgGPGDYZHOttH61EQL1O9MhZ4C6+BaAtH7wPC4oucFBYW5FwKZp
         Cwqw72e23RuTwdGEPmyaCqq2NBCVOCjBhIWoxsxMcwoP+PALoPhxBz+i0eE4WLtF5XMo
         sTTBfyCFBqfpoSfdKAVM9lyDnuN9S/JACfJNHYhHWH3xgKAuDRuKbFduM2jJNqz2iEIw
         HvneTPs9Cq9oigNpsxtF80pIoyjP69lDHdeJdjhK4SnJ/DKCFH8dp+tL8udeUZoKK5HG
         YbCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=mBheUxkDqooTv0jRfSqBzkmtcOubXwkLoswlFyFW4hQ=;
        b=AyOB5M0zeYUP8ZJQfGXQBToUH6etjoDzFNoRapnnUEbVhx0MW0n+RsS56gTKpDjHD/
         89RGhCvMf4Y9VGk9i9DeKu7yLhlLHjmghGrck171LL6TzoiC8OCwnLJ0BZledsb2bAoc
         huCkfkMHFoR1tuZFyXhaYI51z6pvX2KqdeZifZ9YP5chA8TqBbPaS2z80esmi2l5aTEd
         xazSQNf4zXa9+KyNEz0u1vqTjgvNF0sDssov1c7rSkiNdgfmXamP6KifCuzsbMB1NX0D
         kKLYmqlvVjX1Uqd44m0PD7bHYUN5AiA40Y6sxxumdR8RbNuXJ9BNgEMW3xsss9MOmMSj
         EL+w==
X-Gm-Message-State: AOAM531qzeJdeMfap5OyDCyjzwlnJrgcD0rHuB79ENy3R4MtM+yKlV42
	xcOgyLPJLNDNLk0ScYYmfoBnwYFLgRc=
X-Google-Smtp-Source: ABdhPJwohGPTFshwYHeH38CJMviWYOC50HJ9Ec6/CCWZ889sVLd22ZwKAPG4ysCpDmp00NqOevBGuA==
X-Received: by 2002:aa7:804a:: with SMTP id y10mr11929294pfm.186.1591977319663;
        Fri, 12 Jun 2020 08:55:19 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id n9sm5815936pjj.23.2020.06.12.08.55.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2020 08:55:18 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] buildtools-tarball: export OPENSSL_CONF in environment setup
Date: Fri, 12 Jun 2020 05:55:01 -1000
Message-Id: <20200612155501.17400-1-steve@sakoman.com>
X-Mailer: git-send-email 2.17.1

The autobuilder has been experiencing SSL: CERTIFICATE_VERIFY_FAILED
errors during error report uploads when using buildtools due to looking
for certs in /opt/poky

Signed-off-by: Steve Sakoman <steve@sakoman.com>

---
 meta/recipes-core/meta/buildtools-tarball.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/meta/buildtools-tarball.bb b/meta/recipes-core/meta/buildtools-tarball.bb
index c49802eef8..d0f8dd7d7c 100644
--- a/meta/recipes-core/meta/buildtools-tarball.bb
+++ b/meta/recipes-core/meta/buildtools-tarball.bb
@@ -74,6 +74,7 @@ create_sdk_files_append () {
 	toolchain_create_sdk_version ${SDK_OUTPUT}/${SDKPATH}/version-${SDK_SYS}
 
 	echo 'export GIT_SSL_CAINFO="${SDKPATHNATIVE}${sysconfdir}/ssl/certs/ca-certificates.crt"' >>$script
+	echo 'export SSL_CERT_FILE="${SDKPATHNATIVE}${sysconfdir}/ssl/certs/ca-certificates.crt"' >>$script
 	echo 'export OPENSSL_CONF="${SDKPATHNATIVE}${sysconfdir}/ssl/openssl.cnf"' >>$script
 
 	if [ "${SDKMACHINE}" = "i686" ]; then
-- 
2.17.1

