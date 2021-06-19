Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web12.19666.1624096733533447953
 for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Jun 2021 02:58:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=egfnOv/u;
 spf=pass (domain: gmail.com, ip: 209.85.218.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id ho18so19974990ejc.8
        for <openembedded-core@lists.openembedded.org>; Sat, 19 Jun 2021 02:58:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QeKspcgWus+fMAQNpL4/iz0u/6m2aUGrEZ0uvhueiI8=;
        b=egfnOv/uLblJEaorsff8dXglrIIvtsxq4RTZNFpp7q8jwBfhKbT8I+AX8wkNseZ9OQ
         I9uzcgZ8/70Ync4PvEtjJnUG9bSrrzNOkcXpyho7xb3AImXffAoYuZSuNalauQljMLgO
         xOxycXfbBmZsJ1bNJnerxMlHZwFJMIBtesshTXAeewSvYQS8bFNVj7WlgJCfL6hw0TTu
         Qz75rjF7yo/Z50WReAtL2dkKaQmzGzQevDauLXZag3MtCuILAWR2/z/MJ2oJR9cvqqLA
         oOpvdXfisyf2/D8LZx/s/QUy6ljcTFQIxthy70JF+TV0AwH56P7CahoCX1RVi21EPwGf
         a92g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QeKspcgWus+fMAQNpL4/iz0u/6m2aUGrEZ0uvhueiI8=;
        b=qSB/le4iCU6XrAupjQtHCF1DdWNDsWByFseHiS7nZLD9SV/oKwNaEwO6lOJScq3G3C
         p2MtLppCfbQN8wR1Fw9uJLhUiuUgKJLba8sH/tatjIdgMsFmvJhUCDzU93P61TPezkfX
         0E5v8haggrNPLJkF0NdWQ7dEDWvkZHybXcYQFQciGeM615tVBw35LfM+vfj/Z58T7LcB
         01u7XHo7ePqVg6nOV+YaS2UInbelQ+YIRiJ4nACzachshSHPl5K0g8z4Zu/rvPgWlTYg
         aKhkaeleBFCZyd0Spkr2LefV5XWNTxEmQ/c3dsvlwnPyS336380dK65lBXCa/QHbxM1j
         lg4w==
X-Gm-Message-State: AOAM530LkOVLn56zLM1F617B/9o/T3DPGsSgB+vjFehVS9/+GBj8p/0/
	aKxWVqzkyp6gqZCDcjTWFCMASJ7CzcX6hw==
X-Google-Smtp-Source: ABdhPJzkyRXcDSX0HwLqpxwBj54X0WRgBt/Jd/QBRVhGM+l8QtSZAEAVcUOh1+6wc690WSBQP8YuXw==
X-Received: by 2002:a17:907:2d88:: with SMTP id gt8mr14848706ejc.449.1624096732188;
        Sat, 19 Jun 2021 02:58:52 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id l11sm7517542edb.3.2021.06.19.02.58.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Jun 2021 02:58:51 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 3/3] mesa: enable gallium intel drivers when building for x86
Date: Sat, 19 Jun 2021 11:58:45 +0200
Message-Id: <20210619095845.1853470-3-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210619095845.1853470-1-alex.kanavin@gmail.com>
References: <20210619095845.1853470-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Iris is the default, recommended option for Skylake and newer nowadays,
i915 gallium is favoured over classic i915, and soon classic i965 will
be replaced by crocus gallium driver for i965-to-Haswell GPUs.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-graphics/mesa/mesa.inc       | 3 +++
 meta/recipes-graphics/mesa/mesa_21.1.2.bb | 4 ++--
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 5700cc9673..b3c8c292ff 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -131,6 +131,9 @@ PACKAGECONFIG[v3d] = ""
 GALLIUMDRIVERS = "swrast"
 # gallium swrast was found to crash Xorg on startup in x32 qemu
 GALLIUMDRIVERS_x86-x32 = ""
+# Add crocus when 21.2 is out to the list below to support the full range of Intel GPUs
+GALLIUMDRIVERS_append_x86_class-target = ",i915,iris"
+GALLIUMDRIVERS_append_x86-64_class-target = ",i915,iris"
 
 GALLIUMDRIVERS_append ="${@bb.utils.contains('PACKAGECONFIG', 'etnaviv', ',etnaviv', '', d)}"
 GALLIUMDRIVERS_append ="${@bb.utils.contains('PACKAGECONFIG', 'freedreno', ',freedreno', '', d)}"
diff --git a/meta/recipes-graphics/mesa/mesa_21.1.2.bb b/meta/recipes-graphics/mesa/mesa_21.1.2.bb
index 1993d6cbd0..28abc91a87 100644
--- a/meta/recipes-graphics/mesa/mesa_21.1.2.bb
+++ b/meta/recipes-graphics/mesa/mesa_21.1.2.bb
@@ -1,5 +1,5 @@
 require ${BPN}.inc
 
-DRIDRIVERS_append_x86_class-target = ",r100,r200,nouveau,i965,i915"
-DRIDRIVERS_append_x86-64_class-target = ",r100,r200,nouveau,i965,i915"
+DRIDRIVERS_append_x86_class-target = ",r100,r200,nouveau,i965"
+DRIDRIVERS_append_x86-64_class-target = ",r100,r200,nouveau,i965"
 
-- 
2.31.1

