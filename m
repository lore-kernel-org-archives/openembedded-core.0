Return-Path: <sdoshi@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D0E4C79FBB
	for <webhook@archiver.kernel.org>; Thu, 10 Sep 2026 20:05:59 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24036.1789070752655672286
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Sep 2026 13:05:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=EOqOYzGk;
 spf=pass (domain: mvista.com, ip: 209.85.216.51, mailfrom: sdoshi@mvista.com)
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-381b831d535so259981a91.0
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Sep 2026 13:05:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1789070752; x=1789675552; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I2xbkRFJ+t4cH3nqfYPROH/fI0loMSAqyPMFqmJ/oxI=;
        b=EOqOYzGkftYjshuH/2VGYvGIGPFGKmNs1PQs/fCAIGnoz/50EbXkPV7E7r51H7yfgT
         b/JJ5pOoVZQ6uK1J7GuM1irf3IY+opsiYj2oCXexBh24ygs48+TA+IGOYOa7fnkPtlUm
         eBVwt7d9VDy6Mtg7W2KwRz3uakqz9oI4Hn3J8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789070752; x=1789675552;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=I2xbkRFJ+t4cH3nqfYPROH/fI0loMSAqyPMFqmJ/oxI=;
        b=R88Rqc9MuVZPSCihkcldBdbkf1MTXUXAawUvyjuZe22bdnWU+eRXyp7Dw/0+JrSNwJ
         Dsp6hSRo6oUYaurEvv+FAMuIZ38vmzQUS+isbIaY30PRnhNXN2ScHz1/mOUz2gSHBGDB
         xc0gOcbiA6tdb0hXTPPU6TWZH9I+h4AaQCcb/EePc6d/XcY+PcVV+TgsobI7O9zIv1AX
         DQ6Q6YLJVufE+JkRJhQGmF04zFaPXXsyDI01GYLHJwfhDWjmn5gl5DU3feFvR95kTBBA
         DAqpm2zbn+T4+jmira0+ewB+tk4aa8t7PhOUPZEy2jccJWELvJtnprwDpew3E4Gcaooy
         5tAg==
X-Gm-Message-State: AFuF++krNhc/JlCYio9tCKSk0Uup72UI+5ftMXCymhwB0EYL7z47H0FL
	DfAW0dDGdX+CBK4nvXtiE5P7iC7WHKWgoUH+SJiocrPkJEg5EAjUETGa4RgWkZbmbXK7rVowvLM
	D0Xqp
X-Gm-Gg: AYBFou2oBn1ncpBMWwrz9zMz55wJsRGezYVHffl3LK5J+Q2yW+MWitz4ONeoa67vv3C
	MDEqKPXAj7ONh71J5mL95KlTK12DY/aCFxoLpMJXDOv2xZjDRP2CUy6FHqFJ0HWQ1T1trVOIqPf
	zjZLXjUcetG3b0dNRBojgGs8wWDOl5e2QZdShvUDpF7nG4EwAxmoDhRY/BZxGgMbnm1KG6nlLlG
	L973Zc5obsFUywztHXxubBvCvhtr2lOk4vkjUFRMPebEPly3HOm/8rv73aI8eMT+H2iDfe6Vmu7
	lQBRNviFeccF8kAmn5xe67G8waQNyX4CTR/6Tt/J2CiNVfWgc5UsUshoorN37JKQQAFQFx2VUA1
	tiegfO5Mc52dOKHhuCnng+HRbAli6PCmQLfhZDXLchS9nwui/4l3roqkUJOkHoOfk2VhAuBZodE
	386/9Vh9IW1qCKfrS9BwieAT6NLZYmbGzL/bJYHUQ95rzTzyKBVTTiRZLYbMfP7jckkau5FzJUN
	x5GF6t7DA==
X-Received: by 2002:a17:90a:38c4:b0:399:ecd:d68d with SMTP id 98e67ed59e1d1-39d9c342654mr364991a91.22.1789070751973;
        Thu, 10 Sep 2026 13:05:51 -0700 (PDT)
Received: from MVIN00030.mvista.com ([157.32.46.196])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4cf72dbsm527974eec.3.2026.09.10.13.05.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 13:05:51 -0700 (PDT)
From: Siddharth <sdoshi@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Siddharth Doshi <sdoshi@mvista.com>
Subject: [OE-core][scarthgap][PATCH 2/6] libxml2: Security Fix for CVE-2026-86138
Date: Fri, 11 Sep 2026 01:33:25 +0530
Message-Id: <20260910200329.842463-2-sdoshi@mvista.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260910200329.842463-1-sdoshi@mvista.com>
References: <20260910200329.842463-1-sdoshi@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Sep 2026 20:05:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245594

From: Siddharth Doshi <sdoshi@mvista.com>

Picking patch as per [1], and same patch is mentioned in [2]

References:
[1] https://nvd.nist.gov/vuln/detail/CVE-2026-86138
[2] https://security-tracker.debian.org/tracker/CVE-2026-86138

Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
---
 .../libxml/libxml2/CVE-2026-86138.patch       | 53 +++++++++++++++++++
 meta/recipes-core/libxml/libxml2_2.12.10.bb   |  1 +
 2 files changed, 54 insertions(+)
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2026-86138.patch

diff --git a/meta/recipes-core/libxml/libxml2/CVE-2026-86138.patch b/meta/recipes-core/libxml/libxml2/CVE-2026-86138.patch
new file mode 100644
index 0000000000..14ddff8215
--- /dev/null
+++ b/meta/recipes-core/libxml/libxml2/CVE-2026-86138.patch
@@ -0,0 +1,53 @@
+From 6261b1ca983717c71a9c0409ff045ee9c81ff3b6 Mon Sep 17 00:00:00 2001
+From: mohammadmseet-hue <mohammadmseet@gmail.com>
+Date: Thu, 16 Apr 2026 02:54:24 +0200
+Subject: [PATCH 2/6] fix: add overflow checks to xmlDictAddQString in dict.c
+
+xmlDictAddString has overflow guards for pool size calculations, but its
+sibling xmlDictAddQString lacks these entirely. The namelen + plen + 1
+addition can overflow unsigned int, and 4 * (overflowed_value) produces
+a small allocation, leading to heap buffer overflow when memcpy writes
+the prefix and name.
+
+Add the same SIZE_MAX-based overflow guards and safe size_t cast.
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libxml2/-/commit/a4cba4b5b5a8c42e155ed42d2d2a44955465a2e4]
+CVE: CVE-2026-86138
+Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
+---
+ dict.c | 19 +++++++++++++++----
+ 1 file changed, 15 insertions(+), 4 deletions(-)
+
+diff --git a/dict.c b/dict.c
+index d7156ed..ae0210e 100644
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
+-- 
+2.34.1
+
diff --git a/meta/recipes-core/libxml/libxml2_2.12.10.bb b/meta/recipes-core/libxml/libxml2_2.12.10.bb
index e4db345af4..28ae601118 100644
--- a/meta/recipes-core/libxml/libxml2_2.12.10.bb
+++ b/meta/recipes-core/libxml/libxml2_2.12.10.bb
@@ -33,6 +33,7 @@ SRC_URI += "http://www.w3.org/XML/Test/xmlts20130923.tar;subdir=${BP};name=testt
            file://CVE-2026-1757.patch \
            file://CVE-2026-11979.patch \
            file://CVE-2026-86137.patch \
+           file://CVE-2026-86138.patch \
            "
 
 SRC_URI[archive.sha256sum] = "c3d8c0c34aa39098f66576fe51969db12a5100b956233dc56506f7a8679be995"
-- 
2.34.1


