Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web10.43291.1600697792919840700
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Sep 2020 07:16:33 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@blade-group.com header.s=google header.b=r1yd7BhZ;
 spf=pass (domain: blade-group.com, ip: 209.85.221.41, mailfrom: yann.dirson@blade-group.com)
Received: by mail-wr1-f41.google.com with SMTP id z1so12965355wrt.3
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Sep 2020 07:16:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blade-group.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=aKegGgEdjye5LQN9BjIHjJIcGdGxpg76TlWYeZ8wgew=;
        b=r1yd7BhZwGw2Ib28zt04+S44s0Jlp6RRtu8gdzXFJOSb0T6wtwnzcP1ucQ/BDjXSfb
         1Jgas0z5FIcdPbLyWxQBZjKHWNIEzVYpXugUzYAetecF77Y6AV69HeII2JGQaOwVVcmW
         gjoaSd+esdl8eYo+DRLHz6fKAmRgpjXC4HPefZp4MSSFxhePZhdf7WCSi+l+4mMYd5DA
         F46QVlsNLvtAVzXqksFRw+3Q38OWu6rmWEL94L1PAfOUg625pWbaJ5YCYacI9fEjV1OT
         s8xTmElwKGYwmGVKqiH9+1qRDPiYqMHyldEmvK/CQp8xasVgU1X0rLdDoIQ8Kl4ykL/Z
         8gSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aKegGgEdjye5LQN9BjIHjJIcGdGxpg76TlWYeZ8wgew=;
        b=sKA9MFYUzFysIs4cSnxJtF0ijapFilH5Kv2PmECZT59qjFmzwStRx7gPZMWprj3qLd
         R9qSJs0DaKHoK+99n9VD7GPMZYMLU5fzRYleqMlsaiFm7kV+4yXu2d2BS1E2dcP4kKhR
         kdYrigzGwrDX7NV2ygFNltzoKYPqd/vg8eZsrvXcdpASs0GE4X8dVRtOMfS1zAeia8w9
         5jnNCKM8Qhwj+kuDlJ5HJurjph1e5mo7qQ0SL17xCuOcFdPoXRAnVt3bU6mXTPcmoTeS
         ytf4GTonI1Pzm/tr37rEJUYxHJ9uNtvoWFsV75kIMi6tX12UTU8ODVVE+jyGNZKtJFFD
         PGLQ==
X-Gm-Message-State: AOAM531qiQrT4YUtayKrIblpUWMoR82G4sOQqJIe/ZjJEdqKGi++hWsL
	sIQZEnZT5liyal8XEbR1Qm0SlYzyNjYNR/3r
X-Google-Smtp-Source: ABdhPJxapwexlhu72ha6KizrAqXo2b149IUDRa7P15AWedsssBq2n1mQMySA4RSPElLM55H6LmcoKg==
X-Received: by 2002:a5d:4448:: with SMTP id x8mr56077853wrr.207.1600697791068;
        Mon, 21 Sep 2020 07:16:31 -0700 (PDT)
Return-Path: <yann.dirson@blade-group.com>
Received: from blanquette.lan ([88.120.44.86])
        by smtp.gmail.com with ESMTPSA id f14sm22524804wrt.53.2020.09.21.07.16.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2020 07:16:30 -0700 (PDT)
From: "Yann Dirson" <yann.dirson@blade-group.com>
X-Google-Original-From: yann@blade-group.com
To: openembedded-core@lists.openembedded.org
Cc: Yann Dirson <yann@blade-group.com>
Subject: [PATCH 4/8] systemtap: fix install when python3-probes is disabled in PACKAGECONFIG
Date: Mon, 21 Sep 2020 16:15:40 +0200
Message-Id: <20200921141544.3145189-5-yann@blade-group.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200921141544.3145189-1-yann@blade-group.com>
References: <20200921141544.3145189-1-yann@blade-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yann Dirson <yann@blade-group.com>

---
 meta/recipes-kernel/systemtap/systemtap_git.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/systemtap/systemtap_git.bb b/meta/recipes-kernel/systemtap/systemtap_git.bb
index 89f550c859..74bf7cb35c 100644
--- a/meta/recipes-kernel/systemtap/systemtap_git.bb
+++ b/meta/recipes-kernel/systemtap/systemtap_git.bb
@@ -66,7 +66,7 @@ do_install_append () {
       rm ${D}${libexecdir}/${PN}/stap-env
    fi
 
-   if [ ${D}${prefix}/lib != `dirname ${D}${systemd_unitdir}` ]; then
+   if [ -d ${D}${prefix}/lib/systemd -a ${D}${prefix}/lib != `dirname ${D}${systemd_unitdir}` ]; then
       # Fix makefile hardcoded path assumptions for systemd (assumes $prefix)
       # without usrmerge distro feature enabled
       install -d `dirname ${D}${systemd_unitdir}`
@@ -75,7 +75,9 @@ do_install_append () {
    fi
 
    # Ensure correct ownership for files copied in
-   chown root:root ${D}${sysconfdir}/stap-exporter/* -R
+   if [ -d ${D}${sysconfdir}/stap-exporter ]; then
+       chown root:root ${D}${sysconfdir}/stap-exporter/* -R
+   fi
 }
 
 BBCLASSEXTEND = "nativesdk"
-- 
2.28.0

