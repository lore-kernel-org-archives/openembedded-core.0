Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com [209.85.218.66])
 by mx.groups.io with SMTP id smtpd.web08.10145.1607002667303925991
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Dec 2020 05:37:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=RSX4QfVO;
 spf=pass (domain: gmail.com, ip: 209.85.218.66, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f66.google.com with SMTP id n26so3496834eju.6
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Dec 2020 05:37:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6OWObSLvR8pMOpZ/2dvZRqXba39h1hOh5HiOBG2T/R8=;
        b=RSX4QfVO5rOFPZhyeBtEZ0n91VJDndKbkyXx4pTfgdzxh9Z58WVPa96kyyPbIqXQih
         4cxfIn+cPqV+97DQ1PfXP7OKpDQK/RqJsSrdj9PSXL+KTL6LK10vzSlKlMK76UqsGFuG
         8nPucyRLUW1mhltnkA8z9QJ37i8yGqpCJlUTwBr7xa6OCbvkpHcFbd5dsSALsmtcZcEM
         Cgh84pmZDeg/WY0zxqnQE9RBYEwp6jHQalL3R6t7QH/J3+mn7oZyWW/68jG1osK1GTK9
         k62106qJs/l8vj4ZdD5NXZSxkw7frmwzXhbVXaXaY1UUBkFaKYe52/Jgs2bFIVCJ09ew
         OzEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6OWObSLvR8pMOpZ/2dvZRqXba39h1hOh5HiOBG2T/R8=;
        b=cf/Liys2Soe4yfZGmN+GB46dsuJ7lX2yLKt8x7ziMLPwGEhbqOQxgwDNmDC31yiVdB
         kqOiwPU8Kx3D2ysWO1I+szjO2CyhxIX76irbEH/mCf9PqqvUvpypVrDVeoRK4KuJXwUO
         d5yHyYPSQt/1lBcI0U8nkJSLo0vsA71zJai0fr1dlHzKpjnJPxeH7hwL653u6R8lpLEL
         Y1B4q1/0aFDHqbzu++VD7LTBbRxMkjlADEN+TktJpFg4RfI60WVppNwYEjDP/I/NjcXY
         7P36ChAeE9ce278m/Ti+P1mNttGmtMm/izFa4YEeTY+PcZFCao3z8z8/21UPFTGmu6Sd
         kJPA==
X-Gm-Message-State: AOAM533CzsCAPqsthmynd6NFllTleFi2sUJXYAIoBV2Y0w6r5u6/0xw1
	8PFQe7kYnh6PU6n9mtoWQa7Ok/22MkSSlg==
X-Google-Smtp-Source: ABdhPJwUHRIQXSHH6Y+FNtoRQ83W0xF1WFJ6HxIuhwPnuTkwv+L9zekPryqJvcZ2318NfhW6OPIjZA==
X-Received: by 2002:a17:906:ce23:: with SMTP id sd3mr2561941ejb.69.1607002665498;
        Thu, 03 Dec 2020 05:37:45 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.fritz.box ([2a02:2450:1011:4f7:596d:bf31:3950:5bda])
        by smtp.gmail.com with ESMTPSA id ng1sm77130ejb.112.2020.12.03.05.37.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Dec 2020 05:37:44 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 10/11] selftest/reproducible: enable world reproducibility test
Date: Thu,  3 Dec 2020 14:37:26 +0100
Message-Id: <20201203133727.12936-10-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201203133727.12936-1-alex.kanavin@gmail.com>
References: <20201203133727.12936-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add systemd and pam distro features, and commercial license flag
to include more recipes into the world set.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/lib/oeqa/selftest/cases/reproducible.py | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/reproducible.py b/meta/lib/oeqa/selftest/cases/reproducible.py
index a7ef336143..6faeedb544 100644
--- a/meta/lib/oeqa/selftest/cases/reproducible.py
+++ b/meta/lib/oeqa/selftest/cases/reproducible.py
@@ -105,7 +105,7 @@ class DiffoscopeTests(OESelftestTestCase):
 
 class ReproducibleTests(OESelftestTestCase):
     package_classes = ['deb', 'ipk']
-    images = ['core-image-minimal', 'core-image-sato', 'core-image-full-cmdline']
+    images = ['core-image-minimal', 'core-image-sato', 'core-image-full-cmdline', 'world']
     save_results = False
     if 'OEQA_DEBUGGING_SAVED_OUTPUT' in os.environ:
         save_results = os.environ['OEQA_DEBUGGING_SAVED_OUTPUT']
@@ -176,6 +176,8 @@ class ReproducibleTests(OESelftestTestCase):
             PACKAGE_CLASSES = "{package_classes}"
             INHIBIT_PACKAGE_STRIP = "1"
             TMPDIR = "{tmpdir}"
+            LICENSE_FLAGS_WHITELIST = "commercial"
+            DISTRO_FEATURES_append = ' systemd pam'
             ''').format(package_classes=' '.join('package_%s' % c for c in self.package_classes),
                         tmpdir=tmpdir)
 
-- 
2.29.2

