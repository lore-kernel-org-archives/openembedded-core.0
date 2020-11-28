Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com [209.85.215.193])
 by mx.groups.io with SMTP id smtpd.web08.28890.1606537507454454065
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Nov 2020 20:25:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=lkBemPCM;
 spf=pass (domain: gmail.com, ip: 209.85.215.193, mailfrom: ticotimo@gmail.com)
Received: by mail-pg1-f193.google.com with SMTP id 34so5764927pgp.10
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2020 20:25:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=WhJP2V4gFhTptp9neODuWUCSaAEEwGhuJ+Le8M8zU8E=;
        b=lkBemPCM7MuK0zx7X6A6ImXoX1Mhh3YGJEi5escyaoOUshDPNV093UuLEODSKLFrm+
         hDL6+Tr5Q6Jc3gqb4CYE1xMElaoe+fRPHYOX/AjSWcSRVUK5GMxT0ON6A/Xzx+PNyVWD
         uUuUbNYplMn3/Z9jF5Wjm47HbjtUUlx9QfhgF2rROgMwalhqiERaXeVV9THN9sqCnWhf
         xzcF3vQf1ZM3IrIH0OIGHM1hlF5Eq7OVtx2WD+nRVn8YfKlwNh7NE2tgc/DGjD/LJTpQ
         NlaJQoZr2GI0x36Yn2ug9+evy+DP+UKE19feODQGyQLi5X58262bwZMhTkCN4veLeYJx
         HJDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WhJP2V4gFhTptp9neODuWUCSaAEEwGhuJ+Le8M8zU8E=;
        b=DvxpE/Ueazhps6gJVoRgsNoveS62CH4APxXrZYLxKKf3Th9wPIgSREWsaNR3kycMzf
         lhYrnBxXamGUf37eguGANqX9P6/0CXFUnM/zJZ5SUt8R3Cy8opqcD1hx1LUk/P0Zyuv9
         dl/d6qjxmNp1XlkSVJ0LanYyflKixgiaxb7fN7WUq1FHUEEdG2dwymKiRqgCz0tMj6ss
         D3TfyBtndjA9qPqfk512ZGYju5s1et+oDswMq95H39jKHSq+Bym5lLRh7pvIxdm/+ecb
         4NY8n9jEuY7RVcwKm266Fm/haWOQdWGUW7DZD6TlayhViUTWqeY/pdA1LI+mkV5hFQHT
         sIJw==
X-Gm-Message-State: AOAM532fupg0OKgcTgcJBSDJslq+2HhDxYd5orkEz/IjLCqwEEryj3US
	34nX4/sJbhHUMBfwrbwf05qIMUhfpPtneA==
X-Google-Smtp-Source: ABdhPJwdP57MxBEJAejmFswUEMU6Fy/7durfgEvXdYvCv20nWKnVCnbOTCGQL3sbyxUzAf5GMoqHtg==
X-Received: by 2002:a65:6205:: with SMTP id d5mr9333557pgv.76.1606537506764;
        Fri, 27 Nov 2020 20:25:06 -0800 (PST)
Return-Path: <ticotimo@gmail.com>
Received: from thetis.local ([2601:1c0:6000:9640:74ec:3128:f635:34a1])
        by smtp.gmail.com with ESMTPSA id b5sm12625076pjg.28.2020.11.27.20.25.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2020 20:25:06 -0800 (PST)
From: "Tim Orling" <ticotimo@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 12/18] python3-importlib-metadata: move from meta-python
Date: Fri, 27 Nov 2020 20:24:25 -0800
Message-Id: <8c61a338dfed0b50bf133ddbf6f1e0246b01e8cc.1606536874.git.timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <cover.1606536874.git.timothy.t.orling@linux.intel.com>
References: <cover.1606536874.git.timothy.t.orling@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tim Orling <timothy.t.orling@linux.intel.com>

Read metadata from Python packages

* Part of the dependency chain for pytest

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
---
 .../python/python3-importlib-metadata_2.0.0.bb | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-importlib-metadata_2.0.0.bb

diff --git a/meta/recipes-devtools/python/python3-importlib-metadata_2.0.0.bb b/meta/recipes-devtools/python/python3-importlib-metadata_2.0.0.bb
new file mode 100644
index 00000000000..325a41c22e1
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-importlib-metadata_2.0.0.bb
@@ -0,0 +1,18 @@
+DESCRIPTION = "Read metadata from Python packages"
+HOMEPAGE = "https://pypi.org/project/importlib-metadata/"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=e88ae122f3925d8bde8319060f2ddb8e"
+
+inherit pypi setuptools3
+
+SRC_URI = "https://files.pythonhosted.org/packages/56/1f/74c3e29389d34feea2d62ba3de1169efea2566eb22e9546d379756860525/importlib_metadata-2.0.0.tar.gz"
+S = "${WORKDIR}/importlib_metadata-${PV}"
+SRC_URI[md5sum] = "3dd91821c930a3c3633e99a7025aa9c2"
+SRC_URI[sha256sum] = "77a540690e24b0305878c37ffd421785a6f7e53c8b5720d211b211de8d0e95da"
+
+DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
+RDEPENDS_${PN} += "${PYTHON_PN}-zipp ${PYTHON_PN}-pathlib2"
+RDEPENDS_${PN}_append_class-target = " python3-misc"
+RDEPENDS_${PN}_append_class-nativesdk = " python3-misc"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.25.0

