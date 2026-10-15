Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C585CC6B2E
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 05:03:50 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32822.1792040629738588429
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Oct 2026 22:03:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=LQBA1/J0;
 spf=pass (domain: smile.fr, ip: 209.85.128.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a16af2a232so37623705e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Oct 2026 22:03:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1792040628; x=1792645428; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=O/HwnYvZMxiEtViUbWb+WVHnIMCzrwDnvvkTVkze1yI=;
        b=LQBA1/J0LUO+l4GwLUh7zUlDD6L1HkIgx/u8vT72cDY7CfvU6EAc+vgtmeTtP1bPX0
         pbopc+AkMmo1WWiA1OhgFxyKR4s+LxGU/GgoYVP0YhUK88Nhd0aPmFtvirr0HCSuOoDA
         K5ZrioPDjRpgS75zE3Q0ggKpp5D7hgWgsMtqA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792040628; x=1792645428;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=O/HwnYvZMxiEtViUbWb+WVHnIMCzrwDnvvkTVkze1yI=;
        b=F12Yj8N74g3dHKB2F8R6ecokX8CVIWxAtUiNNVr3MFLRO2MALXXIt3fFRgW8BPpw1e
         PmzJMThccYjkgTW/nGIKltZtTbtPxoIPIiesy4ABhybiiaUkeu+LKJ75+wMjfvI6aYOb
         K0ZjCpRy0d3/YdxZzu92W2DGOJKuLqXvqUj7x2SJUKewmHcFER4r4brS3shGP7QNGESY
         oLuyMLwE5ZMXYHknjyIjKtss6Xfz9H5I0QFi8sqtkkqTHMEQ4LJl4uIRSvwjRe535KlD
         xmuZ6zIwNRFE4xeD5KokYEhjcOvOlsge82gCO4GFrwMO1Dh1iDOiXQ8nXidZFXXAtDcr
         5nWw==
X-Gm-Message-State: AFq9FYKi+nGWyD8ixnKiJVmX8YnodvfEGlf9Cm+YIot+hdO9drRmemL5
	BViaSftwO/pchMlqtyLm7ZEyhn1KfrZkT/FriXCrZfguagM2QhxbJpwwOlgLAArsUZujc/NM3uS
	d478qqsA=
X-Gm-Gg: AYBFou3fIsNHwrk3ccHO4XjPNPQzSd5+bR8qzztMOiVN6oaTueBGUO3b4mljCdcQOCc
	vLD7K+a9nxbMT7N+TlXkkUZnbXP5IEn2VFwmJfj5iHt7TfATi10sNOSJZvTtryJjdBG1asHzMrZ
	93ClRqFFMXTFy/ODnqI6zPHG5K30ac6KL+d/mHwYmbdrjRejlB8lKlUrTWmPW9p6nlZtoDLLNdg
	nOZt6xqle3J4lhYr26yWCdU1/nv8Wn3kww+83zwKwATq+pbF4SNmIolpXAbQIxBHGtBEzRw1Ahw
	XPegRCGdgUWDU5Bj1WImr9W1hb6lrEqDblJkC5jldmFC+V+QxwsAo4reI/6EOX4tJsPnOIdwFfP
	ZEl+DL5V2mIGKNp/iJYT6fauKMcXuq6TwbqVH4Wwz56Mkedrtv5KxFjEJ1Uxg+KXoDg5hDUZE6m
	RF+oTH2Aklsx1gNQkXSFZQX61JJviElS3vYuL1pNoIYWJZkkUzDvxNBe2sLKQcP22jEjHHwCmQm
	gNDw5MYYDF/axdoMazIMXXzTlz1G20imM9o3VXYQCNqYGAcxZt5i2iMatcZgv2tw+Sv3Fzu1g==
X-Received: by 2002:a05:600c:3f06:b0:49f:ce78:356f with SMTP id 5b1f17b1804b1-4a18e4ca2acmr350494215e9.32.1792040627778;
        Wed, 14 Oct 2026 22:03:47 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd972aebsm46376245e9.1.2026.10.14.22.03.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 22:03:47 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 15/55] libxml2: Fix CVE-2026-86138
Date: Thu, 15 Oct 2026 07:02:38 +0200
Message-ID: <1d57767b489ef6bc240020b40b834d2e1313ec44.1792020605.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1792020605.git.yoann.congal@smile.fr>
References: <cover.1792020605.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Oct 2026 05:03:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247813

From: Hetvi Thakar <hthakar@cisco.com>

This patch applies the upstream fix as referenced in [2],
using the commit shown in [1].

[1] https://github.com/GNOME/libxml2/commit/a4cba4b5b5a8c42e155ed42d2d2a44955465a2e4
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-86138

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../libxml/libxml2/CVE-2026-86138.patch       | 52 +++++++++++++++++++
 meta/recipes-core/libxml/libxml2_2.12.10.bb   |  1 +
 2 files changed, 53 insertions(+)
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2026-86138.patch

diff --git a/meta/recipes-core/libxml/libxml2/CVE-2026-86138.patch b/meta/recipes-core/libxml/libxml2/CVE-2026-86138.patch
new file mode 100644
index 00000000000..9b918f75708
--- /dev/null
+++ b/meta/recipes-core/libxml/libxml2/CVE-2026-86138.patch
@@ -0,0 +1,52 @@
+From d2e3efc8502313a1099ccc4aac19e8e03734e8c9 Mon Sep 17 00:00:00 2001
+From: mohammadmseet-hue <mohammadmseet@gmail.com>
+Date: Thu, 16 Apr 2026 02:54:24 +0200
+Subject: [PATCH] fix: add overflow checks to xmlDictAddQString in dict.c
+
+xmlDictAddString has overflow guards for pool size calculations, but its
+sibling xmlDictAddQString lacks these entirely. The namelen + plen + 1
+addition can overflow unsigned int, and 4 * (overflowed_value) produces
+a small allocation, leading to heap buffer overflow when memcpy writes
+the prefix and name.
+
+Add the same SIZE_MAX-based overflow guards and safe size_t cast.
+
+CVE: CVE-2026-86138
+Upstream-Status: Backport [https://github.com/GNOME/libxml2/commit/a4cba4b5b5a8c42e155ed42d2d2a44955465a2e4]
+
+(cherry picked from commit a4cba4b5b5a8c42e155ed42d2d2a44955465a2e4)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ dict.c | 19 +++++++++++++++----
+ 1 file changed, 15 insertions(+), 4 deletions(-)
+
+diff --git a/dict.c b/dict.c
+index d7156ed3..ae0210ea 100644
+--- a/dict.c
++++ b/dict.c
+@@ -225,10 +225,21 @@ xmlDictAddQString(xmlDictPtr dict, const xmlChar *prefix, unsigned int plen,
+             return(NULL);
+         }
+ 
+-        if (size == 0) size = 1000;
+-	else size *= 4; /* exponential growth */
+-        if (size < 4 * (namelen + plen + 1))
+-	    size = 4 * (namelen + plen + 1); /* just in case ! */
++        if (size == 0) {
++            size = 1000;
++        } else {
++            if (size < (SIZE_MAX - sizeof(xmlDictStrings)) / 4)
++                size *= 4; /* exponential growth */
++            else
++                size = SIZE_MAX - sizeof(xmlDictStrings);
++        }
++        if (size / 4 < namelen + plen + 1) {
++            if ((size_t) namelen + plen + 1 <
++                    (SIZE_MAX - sizeof(xmlDictStrings)) / 4)
++                size = 4 * ((size_t) namelen + plen + 1); /* just in case ! */
++            else
++                return(NULL);
++        }
+ 	pool = (xmlDictStringsPtr) xmlMalloc(sizeof(xmlDictStrings) + size);
+ 	if (pool == NULL)
+ 	    return(NULL);
diff --git a/meta/recipes-core/libxml/libxml2_2.12.10.bb b/meta/recipes-core/libxml/libxml2_2.12.10.bb
index e4db345af42..28ae601118d 100644
--- a/meta/recipes-core/libxml/libxml2_2.12.10.bb
+++ b/meta/recipes-core/libxml/libxml2_2.12.10.bb
@@ -33,6 +33,7 @@ SRC_URI += "http://www.w3.org/XML/Test/xmlts20130923.tar;subdir=${BP};name=testt
            file://CVE-2026-1757.patch \
            file://CVE-2026-11979.patch \
            file://CVE-2026-86137.patch \
+           file://CVE-2026-86138.patch \
            "
 
 SRC_URI[archive.sha256sum] = "c3d8c0c34aa39098f66576fe51969db12a5100b956233dc56506f7a8679be995"

