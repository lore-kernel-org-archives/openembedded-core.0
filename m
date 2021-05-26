Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web12.3128.1622061641251678832
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 May 2021 13:40:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=hgWlJtpj;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id ss26so4287926ejb.5
        for <openembedded-core@lists.openembedded.org>; Wed, 26 May 2021 13:40:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NrVO2IKcKlGwYIWDQomxfmKWlJd1/5+sqJLOJ7X1XjE=;
        b=hgWlJtpj+vC8qsZhEqxqLdCG+OnmZk/OX+Sd7bU1UUq8YL7fZ8E+2k8099+nO0oGIe
         sICyqkPOEVpJHjIiL7BsWC99CllLAMjTWiF9k63kmVL/VU2PfEHGnfysWQX0pdHYuHyc
         jysXIgG+RI+UcqYSag2EdfEGPWl7J+JKkg6vKJ4bq1lLYBCwXpNSD1Sf8Kh7JR8Oahbt
         kftDT0Qu2f/rbfuvBRSGyGsNC46WB5sCGaAZaS1/gTfa8efZFq5VacwiWtNBD4gAfvWI
         kV/L8kliQ4dSwaLcsM7KbEJYvOELIMIFo3c09FE9bbdNQDI5yIBMtlJ01G7yWwlVI67P
         zNLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NrVO2IKcKlGwYIWDQomxfmKWlJd1/5+sqJLOJ7X1XjE=;
        b=NqEUBTXQDwO158QE2qvREsmrE1D3JJO2MyYjBrUMvaqq7IPdv4T6fQh96u/jRdTuFL
         +ktmSRPzfmLmBtAc0SqX58n9XG7r7+2USAHhs3/l/YCf1vI3YhS6w5whLdKcE3YicQac
         gUtuBLfoADu1UeZ/Gk5dG7oFeY+WTKSBhQb6x6U7YioSKC8NquwY2WYicCgTB/zhMye6
         dRuD7AZyEU78EFapzqukH2qtNLpohfdavjwsKidJ5MvMtrmJvh1lOcPPAiVygWbvfOZf
         oo8MQXlsUP/IuVYAjc1jHK/C4ak/IU1ZjuK544prDRxF2Ia8LuPAXjUh2a9/Iqszu/PU
         R1/w==
X-Gm-Message-State: AOAM531Flk6i12zEVdWZWxW8O/Vcxfw8LttLjE5oFFSqX0w09A0BVbwo
	1jzXD0Nr87tf9dYafky+ECOtMd0B+iA=
X-Google-Smtp-Source: ABdhPJxpL9/M0E7mJIlQTBzpjYOPsmZbSWy1GtB/ok2hIs/33VnZGI6PhuefuuBMWu72BXeJMpaaVA==
X-Received: by 2002:a17:906:a96:: with SMTP id y22mr153997ejf.21.1622061639743;
        Wed, 26 May 2021 13:40:39 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id hb14sm70184ejb.118.2021.05.26.13.40.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 May 2021 13:40:39 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 3/4] images: add ptest images based on core-image-minimal
Date: Wed, 26 May 2021 22:40:17 +0200
Message-Id: <20210526204018.496352-3-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210526204018.496352-1-alex.kanavin@gmail.com>
References: <20210526204018.496352-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This greatly reduces build times needed for those images, as
they no longer need anything graphical, or -dev packages for
everything.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../images/core-image-minimal-ptest-all.bb    | 25 +++++++++++++++++++
 .../images/core-image-minimal-ptest-fast.bb   | 24 ++++++++++++++++++
 2 files changed, 49 insertions(+)
 create mode 100644 meta/recipes-core/images/core-image-minimal-ptest-all.bb
 create mode 100644 meta/recipes-core/images/core-image-minimal-ptest-fast.bb

diff --git a/meta/recipes-core/images/core-image-minimal-ptest-all.bb b/meta/recipes-core/images/core-image-minimal-ptest-all.bb
new file mode 100644
index 0000000000..c1d6aa28a9
--- /dev/null
+++ b/meta/recipes-core/images/core-image-minimal-ptest-all.bb
@@ -0,0 +1,25 @@
+inherit features_check
+REQUIRED_DISTRO_FEATURES = "ptest"
+
+require core-image-minimal.bb
+require conf/distro/include/ptest-packagelists.inc
+
+DESCRIPTION += "Also includes ptest packages."
+HOMEPAGE = "https://www.yoctoproject.org/"
+
+# Include the full set of ptests
+IMAGE_INSTALL += "${PTESTS_FAST} ${PTESTS_SLOW}"
+
+# This image is sufficiently large (~1.8GB) that we need to be careful that it fits in a live
+# image (which has a 4GB limit), so nullify the overhead factor (1.3x out of the
+# box) and explicitly add just 1100MB.
+# strace-ptest in particular needs more than 500MB
+IMAGE_OVERHEAD_FACTOR = "1.0"
+IMAGE_ROOTFS_EXTRA_SPACE = "1124288"
+
+# ptests need more memory than standard to avoid the OOM killer
+# also lttng-tools needs /tmp that has at least 1G
+QB_MEM = "-m 2048"
+
+# Sadly at the moment the full set of ptests is not robust enough and sporadically fails in random places
+PTEST_EXPECT_FAILURE = "1"
diff --git a/meta/recipes-core/images/core-image-minimal-ptest-fast.bb b/meta/recipes-core/images/core-image-minimal-ptest-fast.bb
new file mode 100644
index 0000000000..40df274c4c
--- /dev/null
+++ b/meta/recipes-core/images/core-image-minimal-ptest-fast.bb
@@ -0,0 +1,24 @@
+inherit features_check
+REQUIRED_DISTRO_FEATURES = "ptest"
+
+require core-image-minimal.bb
+require conf/distro/include/ptest-packagelists.inc
+
+# Include only fast (< 30 sec) ptests
+IMAGE_INSTALL += "${PTESTS_FAST}"
+
+DESCRIPTION += "Also includes ptest packages with fast execution times to allow for more automated QA."
+HOMEPAGE = "https://www.yoctoproject.org/"
+
+# This image is sufficiently large (~1.8GB) that it can't actually fit in a live
+# image (which has a 4GB limit), so nullify the overhead factor (1.3x out of the
+# box) and explicitly add just 1500MB.
+# strace-ptest in particular needs more than 500MB
+IMAGE_OVERHEAD_FACTOR = "1.0"
+IMAGE_ROOTFS_EXTRA_SPACE = "1524288"
+
+# ptests need more memory than standard to avoid the OOM killer
+QB_MEM = "-m 1024"
+
+# Sadly at the moment the fast set of ptests is not robust enough and sporadically fails in a couple of places
+PTEST_EXPECT_FAILURE = "1"
-- 
2.31.1

