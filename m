Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web10.6868.1612621665052529772
 for <openembedded-core@lists.openembedded.org>;
 Sat, 06 Feb 2021 06:27:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=PWlio1nD;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id r7so1523219wrq.9
        for <openembedded-core@lists.openembedded.org>; Sat, 06 Feb 2021 06:27:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gg+d7mWsT/azwIIg4YyfHQol3HM936lqot3hHsXvrys=;
        b=PWlio1nDGfsi7fxKafXhT4qmCYQp/h0RFvenpM+JiETm+LfzBkgUdQZoZKEbXIRc69
         sHrdhDraGGyZUMtAf73MGqCxiQtIbB8wjpNOmHPoK3QfEWeQ4j/X7t+aSerib3rh6uEd
         Hbb7vPyzbdDGld5LCR6hp4BjnxKIqCI7k8b1Dl7Bk7llFB/kc6jxXxTDXgfiHvQ/iE8S
         QHtpg4hcch+ltNZMiqgSg4oUbpPme6aKm1qeMjPimNQmzSdhM5Hf9iWrauKowOta1Frt
         3Zf38GGB/5J+ku1C8ZyeCjIVbuyKix7m8Tjz4VXF8zLfjpuTFQaIj+J/PBPLXFMpo3Kf
         P9JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gg+d7mWsT/azwIIg4YyfHQol3HM936lqot3hHsXvrys=;
        b=XI1SMqf96h1mnokpXRErt1DuLpsw5fgrYio+cLB1YMlM9nX/JoE7kNt/sIDuyi/AFp
         tg/8AfC2Oq16l415fYf2mrzfyfQH8f7LCCV7rmkIsLBjjvkhw5eWiZUEfO8NtaTLn669
         hzZgcVnfCzmb+oEyPH2wui0WUEf9eQN+BIZbA84Fdpt26vV0GZNyFWlbBad1D/QJt1EE
         FMiTOLVioW8ULKrm0gmkNvjUVnBfl8F6SZpDdsMzUFpeQOfwV2B+/h/Ob07fPw3rrQik
         r4VTKWiho1N+i4vhEkw9Y83C9c+jh9CW+eAfSZ/ShXWDZ0i7XSH2uP6u2LJ/4H46vOJV
         NEfg==
X-Gm-Message-State: AOAM533yjWxHse0jyZIXjNWQqTpZWW96crFl8lX8Yhx1Jv4f71VKQNgI
	tSsE84g/f9SS2OcgBHJi25xObDmcLH6JVQ==
X-Google-Smtp-Source: ABdhPJxhnyTZFJMwqLVWI2wgApqSJfG4gY7swaCIkF8t0d3qoW/lZNgTVfdKOUfd6eP5iXpMjWxysg==
X-Received: by 2002:adf:f6c4:: with SMTP id y4mr10343144wrp.127.1612621663464;
        Sat, 06 Feb 2021 06:27:43 -0800 (PST)
Return-Path: <quaresma.jose@gmail.com>
Received: from dragon.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id b13sm15730012wrt.31.2021.02.06.06.27.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Feb 2021 06:27:42 -0800 (PST)
From: "Jose Quaresma" <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH 1/2] spirv-tools: fix reproducible
Date: Sat,  6 Feb 2021 14:27:10 +0000
Message-Id: <20210206142711.1058717-1-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

- remove build host path in cmake dev file to fix spirv-tools-dev reproducible
  https://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20210125-8161_obd/packages/diff-html/

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 meta/recipes-graphics/spir/spirv-tools_2020.6.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-graphics/spir/spirv-tools_2020.6.bb b/meta/recipes-graphics/spir/spirv-tools_2020.6.bb
index 2c855d8d8e..142065fd07 100644
--- a/meta/recipes-graphics/spir/spirv-tools_2020.6.bb
+++ b/meta/recipes-graphics/spir/spirv-tools_2020.6.bb
@@ -17,6 +17,12 @@ DEPENDS = "spirv-headers"
 
 EXTRA_OECMAKE += "-DSPIRV-Headers_SOURCE_DIR=${STAGING_EXECPREFIXDIR}"
 
+do_install_append_class-target() {
+    # reproducibility: remove build host path
+    sed -i ${D}${libdir}/cmake/SPIRV-Tools/SPIRV-ToolsTarget.cmake \
+        -e 's:${STAGING_DIR_HOST}::g'
+}
+
 FILES_SOLIBSDEV = ""
 FILES_${PN} += "${libdir}/*.so"
 
-- 
2.30.0

