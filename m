Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
 by mx.groups.io with SMTP id smtpd.web10.76.1614386438087740144
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Feb 2021 16:40:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Z88bE6if;
 spf=pass (domain: gmail.com, ip: 209.85.222.169, mailfrom: jatedev@gmail.com)
Received: by mail-qk1-f169.google.com with SMTP id x124so11067050qkc.1
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Feb 2021 16:40:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=q9Q4cg9ctxRSWs1dnBJmXiotmYpGzumjIKnp3QE3mzs=;
        b=Z88bE6ifFvhhAmkli81tpc4nBJWXdCvliXCqMxGFiLGYPBkh0vYANz7ienIMPwCB/A
         aGDjR4cYIaz2TmlcCM2RIv99pTlrEsMY78A64gQdwcClhrwco2pHeVT3a+Bq15Ly6dzQ
         BARdCrPWrdN/79E/XMhxZ/IgJ3OHCulBJbDclgnIWxo2kwOgEFWa61l3BIZ+EQ0awdZj
         LxDJOrj4YDm2RG5XK8fF/Rm4CWFh59zUSWejDjHOjGOnef5Is0YpxXr/hdgPTSuVBQL/
         WKufquneh6ExZdqLn1QyMli0k3Ysz+G2PslQ88PEi7l8pruDh1iNzWA+98wo77ta11cE
         pUPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=q9Q4cg9ctxRSWs1dnBJmXiotmYpGzumjIKnp3QE3mzs=;
        b=K61clQi6y/033XiKD8rwgZQlrxfwby4dE7iJheWyrTg9HwLwFPMqZSm+vsb+RKMMpP
         nB0TCsFsD8yTJCEthnmJs6FBVWaUW06/rGgajOBgmXIZS2OehOsCzyQd/zBqUPmFbpLU
         sA9p/Jg9a28naAmfAmxty3Tq9BS0p7pBJlJ4Jb7a9J5RuwlFacsriV54nDbmqMbfYw6J
         21qLG766M4BjPi8oKb6u7w8tHdTjmIAMFHA5XPTQUxO5vK98A4vy9FdCxE2H+3PwqFzA
         LJVAOIm9gPpKk6Q1MuVnao3+9N49rQZVek5zP+r9Uf22BBA7AiE7aWpvT8AEcFzdvUU7
         /hOA==
X-Gm-Message-State: AOAM530MdRdO7C122q9LmwKXICYBwcgtnAPnmBw/D+qC8RpFnE4s5nRb
	dRMg2HBX0ljHwpdZBSCd3l85wTFYE9M=
X-Google-Smtp-Source: ABdhPJzK/TMK4hFP0EopYNsartEBwQA9njpaWobpM4CE3k3+L6BXJ0dHv0EBzTSHU/konOdfeYcfrA==
X-Received: by 2002:a37:9f91:: with SMTP id i139mr5461240qke.72.1614386436979;
        Fri, 26 Feb 2021 16:40:36 -0800 (PST)
Return-Path: <jatedev@gmail.com>
Received: from localhost.localdomain ([63.148.217.19])
        by smtp.gmail.com with ESMTPSA id u35sm1471188qtb.18.2021.02.26.16.40.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Feb 2021 16:40:36 -0800 (PST)
From: "Jate Sujjavanich" <jatedev@gmail.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org,
	alex.kanavin@gmail.com,
	quaresma.jose@gmail.com
Cc: Jate Sujjavanich <jatedev@gmail.com>
Subject: [PATCH v4] iputils: Fix cap_net_raw for installed binaries
Date: Sat, 27 Feb 2021 00:40:10 +0000
Message-Id: <20210227004010.14179-1-jatedev@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add libcap-native to libcap PACKAGECONFIG  making native setcap available
during the build. This assures its availability during install and prevents
meson from searching absolute paths and the resulting possible host
contamination.

Move -DNO_SETCAP_OR_SUID=true to the libcap PACKAGECONFIG negative case
This will prevent possible non-determinism for the setuid case.

Signed-off-by: Jate Sujjavanich <jatedev@gmail.com>
---
 meta/recipes-extended/iputils/iputils_s20200821.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/iputils/iputils_s20200821.bb b/meta/recipes-extended/iputils/iputils_s20200821.bb
index 28dd194a12..b7bb7ec84f 100644
--- a/meta/recipes-extended/iputils/iputils_s20200821.bb
+++ b/meta/recipes-extended/iputils/iputils_s20200821.bb
@@ -13,6 +13,7 @@ DEPENDS = "gnutls"
 SRC_URI = "git://github.com/iputils/iputils \
            file://0001-rarpd-rdisc-Drop-PrivateUsers.patch \
            "
+
 SRCREV = "23c3782ae0c7f9c6ae59dbed8ad9204f8758542b"
 
 S = "${WORKDIR}/git"
@@ -26,7 +27,7 @@ CVE_CHECK_WHITELIST += "CVE-2000-1213 CVE-2000-1214"
 PACKAGECONFIG ??= "libcap rarpd \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', 'ninfod traceroute6', '', d)} \
                    ${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
-PACKAGECONFIG[libcap] = "-DUSE_CAP=true, -DUSE_CAP=false, libcap"
+PACKAGECONFIG[libcap] = "-DUSE_CAP=true, -DUSE_CAP=false -DNO_SETCAP_OR_SUID=true, libcap libcap-native"
 PACKAGECONFIG[libidn] = "-DUSE_IDN=true, -DUSE_IDN=false, libidn2"
 PACKAGECONFIG[gettext] = "-DUSE_GETTEXT=true, -DUSE_GETTEXT=false, gettext"
 PACKAGECONFIG[ninfod] = "-DBUILD_NINFOD=true,-DBUILD_NINFOD=false,"
@@ -38,8 +39,7 @@ PACKAGECONFIG[docs] = "-DBUILD_HTML_MANS=true -DBUILD_MANS=true,-DBUILD_HTML_MAN
 
 inherit meson systemd update-alternatives
 
-# Have to disable setcap/suid as its not deterministic
-EXTRA_OEMESON += "--prefix=${root_prefix}/ -DNO_SETCAP_OR_SUID=true"
+EXTRA_OEMESON += "--prefix=${root_prefix}/"
 
 ALTERNATIVE_PRIORITY = "100"
 
-- 
2.25.1

