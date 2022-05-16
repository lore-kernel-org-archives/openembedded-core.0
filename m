Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBFAEC433F5
	for <webhook@archiver.kernel.org>; Mon, 16 May 2022 11:28:59 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web10.27390.1652700532836552093
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 May 2022 04:28:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=UPlGi9w5;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.51,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f51.google.com with SMTP id h14so418191wrc.6
        for <openembedded-core@lists.openembedded.org>;
 Mon, 16 May 2022 04:28:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/+pHH53lIw7MSriioi1b1BIG5VlIQqjCJOW4HoM2pGE=;
        b=UPlGi9w549PmiStmftxqrMSJIf7B83HMBG3hg/nAa+BvKLco+ZTHTPR7mGQmOzlMhA
         NhvJkWRzeOeE0ne6JAdyk83PBrjbi71m6CTKMg6dljX/E9nJAvoRBVrjUEXlONzuZ0lV
         Q3PxaDln1MXENJrfe0KrHdrsRCgYkQkFTHrEY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/+pHH53lIw7MSriioi1b1BIG5VlIQqjCJOW4HoM2pGE=;
        b=H/xtqa8WPCj1EVDVC8uUNnkVR3ZFO+WMSryqCEeMd72jzePoSV0vC5gx7FSw1fLTMX
         S+c0hbVQWuUxLrQYn/+ynAsysqWLjc3gYCYw9VQdYRw937tAwniWkq6HX8JwLEhgbz5d
         Ce14AFkevtkgw1ZRVDb4rKSixb4FGda2CmE0H7E5IFafgPmSCpWKmkkk0EoMjF5FFUCJ
         rKdhxwlxx9FjedzK9fQOGnpyMo7GwefyTTfr3W6N2tzTrHr3nEUJImQMdb/6TKmvowlU
         6txlww16mzJQeXYJaQRfxBp1QS7gSo8hsSjzlCEVPAaj51px2ZvXsPH5mNa/D+lm8bxo
         56Xw==
X-Gm-Message-State: AOAM5311b4LYt4dihSgukV1M+wwESOhQYmotiDOg1brZfvWkCHwE1+44
	D2+iSl673n5jO4yJO2vOGWx+4kmnbqaC94hu
X-Google-Smtp-Source: 
 ABdhPJy/cxq/m3VvflHEq5rnSgdQpD5GRgjboIc3jRwftNFqwbTWZMhx/cv26cJABMN9Bx/XOGfI6w==
X-Received: by 2002:a05:6000:1562:b0:20c:64fc:34f with SMTP id
 2-20020a056000156200b0020c64fc034fmr14065204wrz.132.1652700530789;
        Mon, 16 May 2022 04:28:50 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:907b:5576:ab63:2b17])
        by smtp.gmail.com with ESMTPSA id
 j15-20020adfa54f000000b0020d072f7f99sm3725492wrb.76.2022.05.16.04.28.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 May 2022 04:28:50 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] selftest/imagefeatures/overlayfs: Always append to
 DISTRO_FEATURES
Date: Mon, 16 May 2022 12:28:49 +0100
Message-Id: <20220516112849.448882-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 May 2022 11:28:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165676

Using += unintentionally removes all over entries from DISTRO_FEATURES and
this reduces sstate reusage on the autobuilder. Fix this to speed up builds.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/cases/imagefeatures.py |  2 +-
 meta/lib/oeqa/selftest/cases/overlayfs.py     | 16 ++++++++--------
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/imagefeatures.py b/meta/lib/oeqa/selftest/cases/imagefeatures.py
index 6b94ace4eba0..6d010b3e3a7e 100644
--- a/meta/lib/oeqa/selftest/cases/imagefeatures.py
+++ b/meta/lib/oeqa/selftest/cases/imagefeatures.py
@@ -235,7 +235,7 @@ USERADD_GID_TABLES += "files/static-group"
 DISTRO_FEATURES:append = " pam opengl wayland"
 
 # Switch to systemd
-DISTRO_FEATURES += "systemd"
+DISTRO_FEATURES:append = " systemd"
 VIRTUAL-RUNTIME_init_manager = "systemd"
 VIRTUAL-RUNTIME_initscripts = ""
 VIRTUAL-RUNTIME_syslog = ""
diff --git a/meta/lib/oeqa/selftest/cases/overlayfs.py b/meta/lib/oeqa/selftest/cases/overlayfs.py
index ce1d2f1ec37c..96beb8b869bc 100644
--- a/meta/lib/oeqa/selftest/cases/overlayfs.py
+++ b/meta/lib/oeqa/selftest/cases/overlayfs.py
@@ -55,7 +55,7 @@ inherit overlayfs
 
         config = """
 IMAGE_INSTALL:append = " overlayfs-user"
-DISTRO_FEATURES += "systemd overlayfs"
+DISTRO_FEATURES:append = " systemd overlayfs"
 """
 
         self.write_config(config)
@@ -94,7 +94,7 @@ OVERLAYFS_QA_SKIP[mnt-overlay] = "mount-configured"
 
         config = """
 IMAGE_INSTALL:append = " overlayfs-user"
-DISTRO_FEATURES += "systemd overlayfs"
+DISTRO_FEATURES:append = " systemd overlayfs"
 """
 
         self.write_config(config)
@@ -112,7 +112,7 @@ DISTRO_FEATURES += "systemd overlayfs"
 
         config = """
 IMAGE_INSTALL:append = " overlayfs-user"
-DISTRO_FEATURES += "systemd overlayfs"
+DISTRO_FEATURES:append = " systemd overlayfs"
 """
 
         wrong_machine_config = """
@@ -136,7 +136,7 @@ OVERLAYFS_MOUNT_POINT[usr-share-overlay] = "/usr/share/overlay"
 
         config = """
 IMAGE_INSTALL:append = " overlayfs-user systemd-machine-units"
-DISTRO_FEATURES += "systemd overlayfs"
+DISTRO_FEATURES:append = " systemd overlayfs"
 
 # Use systemd as init manager
 VIRTUAL-RUNTIME_init_manager = "systemd"
@@ -271,7 +271,7 @@ class OverlayFSEtcRunTimeTests(OESelftestTestCase):
         """
 
         configBase = """
-DISTRO_FEATURES += "systemd"
+DISTRO_FEATURES:append = " systemd"
 
 # Use systemd as init manager
 VIRTUAL-RUNTIME_init_manager = "systemd"
@@ -313,7 +313,7 @@ OVERLAYFS_ETC_DEVICE = "/dev/mmcblk0p1"
         """
 
         config = """
-DISTRO_FEATURES += "systemd"
+DISTRO_FEATURES:append = " systemd"
 
 # Use systemd as init manager
 VIRTUAL-RUNTIME_init_manager = "systemd"
@@ -349,7 +349,7 @@ INHERIT += "overlayfs-etc"
         """
 
         config = f"""
-DISTRO_FEATURES += "systemd"
+DISTRO_FEATURES:append = " systemd"
 
 # Use systemd as init manager
 VIRTUAL-RUNTIME_init_manager = "systemd"
@@ -391,7 +391,7 @@ OVERLAYFS_ETC_DEVICE = "/dev/sda3"
         """
 
         config = """
-DISTRO_FEATURES += "systemd"
+DISTRO_FEATURES:append = " systemd"
 
 # Use systemd as init manager
 VIRTUAL-RUNTIME_init_manager = "systemd"
-- 
2.34.1


