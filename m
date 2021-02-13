Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web09.993.1613177966965995567
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Feb 2021 16:59:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=mv2ouzAA;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id u14so1473909wri.3
        for <openembedded-core@lists.openembedded.org>; Fri, 12 Feb 2021 16:59:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7NN6EgaiCYYJCAUgVDTOZr0V7DKOKJkPW+X3mqF2w3Y=;
        b=mv2ouzAACq5h7Ne1dqfED8mbKFZP8SI2w8yMPlyxLKg9Q8RPKBWdmcVDiV0vdxKSlM
         1OVOR/Po8bPkECm3/OrWYshwJwj6xVGL2sgc14JtEe0rY/O789z2RRyqXk/HeqTrIIn1
         rU6wF54wZ62NfsJD+WVUKTUpNCFQkgf+Z2yRAE1A/vzVGMNozrbrqUctc2+tZ+FOARLl
         wG8KBgnb6ePNesDuTZwNNGCOxU37ZSZvFZRnsacQKagYN4UureC7s8GEjWNkrZ+3Tw3S
         q1BLis9OpbvFEv3ttj0jb0d+ZDzALYxgac9Hp48g2F7fXJVBHjVC1p4uMpgr32BftFDG
         q0jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7NN6EgaiCYYJCAUgVDTOZr0V7DKOKJkPW+X3mqF2w3Y=;
        b=HS+ALDPkixneTamEoHs3lpgMZjqgIpAkHj5LWYIG5MQbc+EY8Sv34WmqvGdZm1KDY9
         CNNZJT/XipjrD4E3AOcH2MUWweqZb5nGGLeH/b4ThVFE3p7cJxxi4zICEoAPv7JD82kL
         FoplX31eRtjTSxBqdaA0aBRW0SD+IpO3UjXNRB+Z+C7J8M6IgCB3HwAsh+fF/Zw43VBe
         clPMakOaFVsJVF7q2YO6PK2RnZSJFtZ/SiY9fPuIClekVy8XyMi9DSkb3+o9Ir7lqThq
         rAxipmxZ2joGJ/oYuf673hZZjtDMLntEYtuApxTqqBWcfBpv8iaolA23/+4pKuKNdqgo
         KhTg==
X-Gm-Message-State: AOAM533Kv2Z5N7lH6+vpHs6yVs2PiY1QYi0UEVtq6HOV78h9MclNGYgr
	p0IKz0AC+hDlemRXjQqTSO8OO6qOfO2Ocg==
X-Google-Smtp-Source: ABdhPJyWhwLU7EgO+1ILjc/Z/Sq1frKdFUz65IIGCiQUYfa+YTufoyC+Nab5a2K7XozY8jrtBtS/cA==
X-Received: by 2002:adf:e708:: with SMTP id c8mr1502260wrm.152.1613177965515;
        Fri, 12 Feb 2021 16:59:25 -0800 (PST)
Return-Path: <quaresma.jose@gmail.com>
Received: from dragon.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id b15sm12259195wrr.47.2021.02.12.16.59.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Feb 2021 16:59:25 -0800 (PST)
From: "Jose Quaresma" <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH 2/5] spirv-tools: build all libaries as shared
Date: Sat, 13 Feb 2021 00:59:19 +0000
Message-Id: <20210213005922.180552-2-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210213005922.180552-1-quaresma.jose@gmail.com>
References: <20210213005922.180552-1-quaresma.jose@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 meta/recipes-graphics/spir/spirv-tools_2020.6.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/spir/spirv-tools_2020.6.bb b/meta/recipes-graphics/spir/spirv-tools_2020.6.bb
index a2cbaf426f..4f45c68bbe 100644
--- a/meta/recipes-graphics/spir/spirv-tools_2020.6.bb
+++ b/meta/recipes-graphics/spir/spirv-tools_2020.6.bb
@@ -17,6 +17,8 @@ DEPENDS = "spirv-headers"
 
 EXTRA_OECMAKE += "\
     -DSPIRV-Headers_SOURCE_DIR=${STAGING_EXECPREFIXDIR} \
+    -DSPIRV_TOOLS_BUILD_STATIC=OFF \
+    -DBUILD_SHARED_LIBS=ON \
     -DSPIRV_SKIP_TESTS=ON \
 "
 
@@ -26,8 +28,9 @@ do_install_append_class-target() {
         -e 's:${STAGING_DIR_HOST}::g'
 }
 
+# all the libraries are unversioned, so don't pack it on PN-dev
+SOLIBS = ".so"
 FILES_SOLIBSDEV = ""
-FILES_${PN} += "${libdir}/*.so"
 
 PACKAGES =+ "${PN}-lesspipe"
 FILES_${PN}-lesspipe = "${base_bindir}/spirv-lesspipe.sh"
-- 
2.30.1

