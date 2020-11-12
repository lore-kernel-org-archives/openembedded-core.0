Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.7881.1605202104447842659
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Nov 2020 09:28:24 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@blade-group.com header.s=google header.b=F56iIj51;
 spf=pass (domain: blade-group.com, ip: 209.85.128.47, mailfrom: yann.dirson@blade-group.com)
Received: by mail-wm1-f47.google.com with SMTP id 10so5976313wml.2
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Nov 2020 09:28:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blade-group.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=aKegGgEdjye5LQN9BjIHjJIcGdGxpg76TlWYeZ8wgew=;
        b=F56iIj51j+lpXj50PYWs6gJir0TIRKikF0HFWmVf+6lIpzyLsMIN4GLH2VKnPV8ONe
         9fIlktgAO9wTVjJvFymc2ET2cskUHRvsuzuLL9Ml4izJ1HQREnxX4sTTphnRZotGX9Ow
         M17x6/Eh3mFm0WNQvSAtSVUZL5Jorc/fpNOADXErccX//logu7AYJJVTKC2hX7s1Iim7
         CJRtRqUigsoCT6hNneX3eMEl8THhCak4yUttDs+a+6AS1/FloT8UP6Cck7UrljGxZPtq
         cL3+r2pDl6qJqfvpsWuyQ4B5mpGX84t6BcdMDN0RqMnWjS61Oiye43cUacLnxIUi6/2e
         idcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aKegGgEdjye5LQN9BjIHjJIcGdGxpg76TlWYeZ8wgew=;
        b=XmISLxvl4VQA4S8LkGDL4/a/sNBXUE3R4FHC3MLQHR1gfjtgUqSvPZjP5eXkKKq3Ky
         7rmjqav56G02t6ujJK4qTRs+d9tA2rEKZn1h6VnkY03dviMOgbnquCpNhWJ5Ujf7r37E
         ei2Hfcp0jcmRd1y26v3npj6yG7p9ZoFWWQgrGg/CXBSY+FeNMFnx9ITFomieIvgnHDPH
         hVWh3BQ22rSophoEK3EyzJFAoiaag58uzhA4gmT3TxuAqq7xpCpbOkdza5bTV0Qk4l+n
         45pyDlu8mDJb8TWDstivITW6AJovg76x9JT5Ml1FcJYqXNZVqdE5LnYLo3ouNeKaPqk4
         6vSw==
X-Gm-Message-State: AOAM533WeDS0AChYcXqjXpJPfuiGgLAKGGcF6dWj/98GLuBO351nGBkC
	Ik4Tx4yl9dQnIsg4tdMQkVBqtZUvMqQPOQ==
X-Google-Smtp-Source: ABdhPJxcB/DexrbHd97Dxh7V8owPGZqxbY1Dxnb5jVsDyOGlzyMcVuEYZCNZMw1kVkDkRozkMfkeFA==
X-Received: by 2002:a05:600c:210a:: with SMTP id u10mr726841wml.98.1605202099661;
        Thu, 12 Nov 2020 09:28:19 -0800 (PST)
Return-Path: <yann.dirson@blade-group.com>
Received: from blanquette.lan ([88.120.44.86])
        by smtp.gmail.com with ESMTPSA id j15sm8198906wrm.62.2020.11.12.09.28.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2020 09:28:18 -0800 (PST)
From: "Yann Dirson" <yann.dirson@blade-group.com>
X-Google-Original-From: yann@blade-group.com
To: openembedded-core@lists.openembedded.org
Cc: Yann Dirson <yann@blade-group.com>
Subject: [PATCH v2 4/5] systemtap: fix install when python3-probes is disabled in PACKAGECONFIG
Date: Thu, 12 Nov 2020 18:26:15 +0100
Message-Id: <20201112172616.784945-5-yann@blade-group.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201112172616.784945-1-yann@blade-group.com>
References: <20201112172616.784945-1-yann@blade-group.com>
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

