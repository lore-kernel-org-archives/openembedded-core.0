Return-Path: <hiagofranco@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68272E6F080
	for <webhook@archiver.kernel.org>; Fri,  1 Nov 2024 18:42:34 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web11.1684.1730486550484898883
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Nov 2024 11:42:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=c44GxkGx;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: hiagofranco@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-20ce5e3b116so18964415ad.1
        for <openembedded-core@lists.openembedded.org>; Fri, 01 Nov 2024 11:42:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730486550; x=1731091350; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HWQmC+n5ZJ815sIjhD7POA8QX1Ri1d5kg4Z6RgfD7OQ=;
        b=c44GxkGxTHyqtTrnhYgZaMfH3K1H5DQkhAmcnlg+cKEK6AJg+NGJ6ApjhvkoH/8YvF
         4aCfCo2sIDaEATOerLbfcE+Gjiq+s8Ab1qXM9C5gNyjyYUe8/kJNWEYxeRzjevn8cCsp
         fDHcYO5IZd5q6mjRO/AW6Q0kZYu6v6awDFsa7hnHYa7RIsw5YXV7B9Iy3fhrmhl62twH
         Ko2BLodoL2kfyhfvQt+VfbmPcQvNgE5DnKrlqyuaGqwVDsBdnv1I4j370fOFIABKVuOl
         UBSIeQbkAPuxJyrSHawnqF5AjYB0nX/5+77OiPLUmDnmINZTCeHd6H2qWtfRWgqN7bmP
         1jag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730486550; x=1731091350;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HWQmC+n5ZJ815sIjhD7POA8QX1Ri1d5kg4Z6RgfD7OQ=;
        b=hR2KxqrhnYDFwVE7LedxfjWu+m4NNO8Gr9nuuy3mc+a2QXjDGmwf7G7N7jgoD/nYuz
         HRdn/g1BEdYMcWupFreTaECHMRnQjI4RzKzrdmbb8GWC4MLACRYuQZcjK8OFuxiMGCZL
         dTYHjRf4OWWC33WjJd7LmSMwi9mMhB6NUk1Zv27xA6N54BRmkvxVFMBqnsDlgVkMfBMo
         pBZViWlNub9MiyfGAvSvpn/nvaGaSCGUOB9FK2oQeIyluEZ76o8DyAguXNC5fsOs/JK5
         sPH6HsUWe2BVpyp3VahYXqwDVXNBRPstD4b075uEg/H+lMFA1MtuC298o4Z8QP910FB0
         JQxg==
X-Gm-Message-State: AOJu0YyCvc82lKzPx7oFrEetAnwYgx9h+QdO0hQ+A1wmhaZq4pSA3Lxq
	vX6Zm5mx51NNURVILbYtHWbd+/uep/tNgogrtQsKGwYN1xCM1DYu31m/Vv16
X-Google-Smtp-Source: AGHT+IHU77ruSm46NNF7g3t86aVYQqFRh9yR5kQOeTn49/0dTOIXCvFJdkVZsGFg0Arc7r2g+kEO8A==
X-Received: by 2002:a17:903:2447:b0:20b:b75d:e8c1 with SMTP id d9443c01a7336-2111af1ce90mr50930415ad.4.1730486549461;
        Fri, 01 Nov 2024 11:42:29 -0700 (PDT)
Received: from hiago-nb.corp.toradex.com ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211057e7a69sm24446775ad.290.2024.11.01.11.42.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Nov 2024 11:42:29 -0700 (PDT)
From: Hiago De Franco <hiagofranco@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Hiago De Franco <hiago.franco@toradex.com>
Subject: [oe-core][PATCH] drm-info: add recipe
Date: Fri,  1 Nov 2024 15:41:56 -0300
Message-Id: <20241101184156.2368109-1-hiagofranco@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Nov 2024 18:42:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206628

From: Hiago De Franco <hiago.franco@toradex.com>

This recipe provides information about DRM devices, useful for debugging
and checking information about DRM.

Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
---
 meta/conf/distro/include/maintainers.inc    |  1 +
 meta/recipes-graphics/drm/drm-info_2.7.0.bb | 13 +++++++++++++
 2 files changed, 14 insertions(+)
 create mode 100644 meta/recipes-graphics/drm/drm-info_2.7.0.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 7aafa7a2d146..2c2779f8cf83 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -156,6 +156,7 @@ RECIPE_MAINTAINER:pn-docbook-xsl-stylesheets = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER:pn-dos2unix = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-dosfstools = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER:pn-dpkg = "Unassigned <unassigned@yoctoproject.org>"
+RECIPE_MAINTAINER:pn-drm-info = "Hiago De Franco <hiago.franco@toradex.com>"
 RECIPE_MAINTAINER:pn-dropbear = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER:pn-dtc = "Wang Mingyu <wangmy@fujitsu.com>"
 RECIPE_MAINTAINER:pn-dwarfsrcfiles = "Alexander Kanavin <alex.kanavin@gmail.com>"
diff --git a/meta/recipes-graphics/drm/drm-info_2.7.0.bb b/meta/recipes-graphics/drm/drm-info_2.7.0.bb
new file mode 100644
index 000000000000..9f1cbb47fbfd
--- /dev/null
+++ b/meta/recipes-graphics/drm/drm-info_2.7.0.bb
@@ -0,0 +1,13 @@
+SUMMARY = "Small utility to dump info about DRM devices"
+HOMEPAGE = "https://gitlab.freedesktop.org/emersion/drm_info"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=32fd56d355bd6a61017655d8da26b67c"
+
+SRC_URI = "git://gitlab.freedesktop.org/emersion/drm_info.git;branch=master;protocol=https"
+SRCREV = "c1f5ca4cf750b26eb26c1d9d5c2ef057acbcfefc"
+
+S = "${WORKDIR}/git"
+
+inherit meson pkgconfig
+
+DEPENDS = "json-c libdrm"

