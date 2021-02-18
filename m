Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
 by mx.groups.io with SMTP id smtpd.web08.20.1613607093892950132
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Feb 2021 16:11:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Hq5oSgKI;
 spf=pass (domain: gmail.com, ip: 209.85.219.41, mailfrom: jatedev@gmail.com)
Received: by mail-qv1-f41.google.com with SMTP id g3so163726qvl.2
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Feb 2021 16:11:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yNikUINst/t5eHMoDeQh9TGoLZL1SFYs6dz0dUfDDTM=;
        b=Hq5oSgKI5tSsG+tZihUnkKD0wBTFaEan3AIfoWw3yQdGu37RaHAU4xt1qCecI8REK/
         Kmo6NJHMHrqy3oLN/F104mJnpP4LhU66yWO+Kt3K1heYPzdSMi8p6SLCQ8NocjVB4kMy
         11+k8TXgsB150vHmSZLIAEiebleNjyFbFkZW6TN17tSEDraV2EfsNdHqwxRjhUiT6WdI
         ftD6M4AdhKRuVdelu27z86krYruCm+AoUMWYYaZ9HVp1gjOFKKeJx9lsNrBQ4G9jpVa8
         1ImomppIlf/d0wg2JGxX2opWzIP8GEuKVbfL9lHBxBTZ6woMa5O6xP6mBsw1rgIPlWmh
         A6vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yNikUINst/t5eHMoDeQh9TGoLZL1SFYs6dz0dUfDDTM=;
        b=BcLJq85aWgs8CMIGfzsvf2c6NsiwGmEiYM+IvhcZd6JEQtOWkjxQE79/al6duoDV2v
         nBJp1iQ9+TiKg0OhIuuqxSvX+Do8aqZfud30/SB5bNmUMJ9CKdmlqO6cMrAhHZoyiUhF
         azBYPIQ8tUNoh6Cik2YoKLHP2hPIs3HTiEK7zC+ytZJGawz6YbVcLCjDMle2eUNHhZ24
         jjq+jvZOW3xuWVvX5SziPh93O4i320GFkZLLya/lfQ4L4aZM581pXIerNJzXA0WJggZn
         p4sAvAsSVFUxwTAm+Hg2P/uq9auvU+507vZDJgJfSznzUE2zLh60hzO5BRhKHXvzSrtI
         HXFw==
X-Gm-Message-State: AOAM533HFsr9GwonE7icjCC7tc/Fg8xRzC/6dPDjNSgFWgPbbBJ/XgPP
	jzdVMiH969pqrbB5zKs3x8xo9gVdAzQ=
X-Google-Smtp-Source: ABdhPJxTpcdtYp9F2nV/nbBBUiQoE3Xa96qTHUfBT2elu3v6Sw4Vziwv8X5bBigmp0OFytGOnzAgEw==
X-Received: by 2002:a05:6214:52:: with SMTP id c18mr1682499qvr.54.1613607092867;
        Wed, 17 Feb 2021 16:11:32 -0800 (PST)
Return-Path: <jatedev@gmail.com>
Received: from localhost.localdomain ([63.148.217.19])
        by smtp.gmail.com with ESMTPSA id v7sm2803836qkc.105.2021.02.17.16.11.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Feb 2021 16:11:32 -0800 (PST)
From: "Jate Sujjavanich" <jatedev@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jate Sujjavanich <jatedev@gmail.com>
Subject: [PATCH] iputils: Use STAGING_DIR_NATIVE for setcap detection
Date: Thu, 18 Feb 2021 00:11:26 +0000
Message-Id: <20210218001126.39215-1-jatedev@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Search for setcap in STAGING_DIR_NATIVE to avoid host contamination. Add
DEPENDS for libcap-native to supply this if we select libcap for
PACKAGECONFIG.

The previous setting of NO_SETCAP_OR_SUID broke setuid or setcap of
/bin/ping

Signed-off-by: Jate Sujjavanich <jatedev@gmail.com>
---
 meta/recipes-extended/iputils/iputils_s20200821.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/iputils/iputils_s20200821.bb b/meta/recipes-extended/iputils/iputils_s20200821.bb
index 8b63a23c61..feb97d5086 100644
--- a/meta/recipes-extended/iputils/iputils_s20200821.bb
+++ b/meta/recipes-extended/iputils/iputils_s20200821.bb
@@ -12,6 +12,7 @@ DEPENDS = "gnutls"
 
 SRC_URI = "git://github.com/iputils/iputils \
            file://0001-rarpd-rdisc-Drop-PrivateUsers.patch \
+           file://0001-Add-support-for-setcap-in-STAGING_DIR_NATIVE.patch \
            "
 SRCREV = "23c3782ae0c7f9c6ae59dbed8ad9204f8758542b"
 
@@ -26,7 +27,7 @@ CVE_CHECK_WHITELIST += "CVE-2000-1213 CVE-2000-1214"
 PACKAGECONFIG ??= "libcap rarpd \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', 'ninfod traceroute6', '', d)} \
                    ${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
-PACKAGECONFIG[libcap] = "-DUSE_CAP=true, -DUSE_CAP=false, libcap"
+PACKAGECONFIG[libcap] = "-DUSE_CAP=true, -DUSE_CAP=false, libcap libcap-native"
 PACKAGECONFIG[libidn] = "-DUSE_IDN=true, -DUSE_IDN=false, libidn2"
 PACKAGECONFIG[gettext] = "-DUSE_GETTEXT=true, -DUSE_GETTEXT=false, gettext"
 PACKAGECONFIG[ninfod] = "-DBUILD_NINFOD=true,-DBUILD_NINFOD=false,"
@@ -38,7 +39,7 @@ PACKAGECONFIG[docs] = "-DBUILD_HTML_MANS=true -DBUILD_MANS=true,-DBUILD_HTML_MAN
 
 inherit meson systemd update-alternatives
 
-EXTRA_OEMESON += "--prefix=${root_prefix}/"
+EXTRA_OEMESON += "--prefix=${root_prefix}/ -Dstagingdirnative=${STAGING_DIR_NATIVE}"
 
 ALTERNATIVE_PRIORITY = "100"
 
-- 
2.25.1

