Received: from mail-qv1-f66.google.com (mail-qv1-f66.google.com [209.85.219.66])
 by mx.groups.io with SMTP id smtpd.web10.19407.1597251820702156391
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Aug 2020 10:03:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Sa2jVxY1;
 spf=pass (domain: gmail.com, ip: 209.85.219.66, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f66.google.com with SMTP id x6so1337474qvr.8
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Aug 2020 10:03:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DhWDQTXL7uQ/eGTmkCwfvu/4YRrU7xcGiqfOi/8wMfc=;
        b=Sa2jVxY1w0j9keKK9ZfFqcHSwnDDwml9ENnO+tM92Yygis5yGhqBWd7GTsbz1iNy9Z
         ejdnv/FsfKirG47lPxO+dspIjNjtrApkkpCPv4zCUcl4g2pTZ2nZJMQudQakEbcQhCWm
         rGV63CSJWIt//KM0vNGt9Dan2ZiVegkoG6oKuqfFRvc2W9gnqyh98rxPy5BiY3YzdeBi
         vBh4fhHQBJ6HqHHC8ovYflJWOQuFHpNctss20vt4w80vgFq5VkswGKyxjsOVbP/y7K4B
         nXiQivDFsKlBW722C7y2aawe1GNB76vBtLdjnhV9CdbF5hH/a405toaNTkKkZG32CU/v
         lC5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DhWDQTXL7uQ/eGTmkCwfvu/4YRrU7xcGiqfOi/8wMfc=;
        b=qe5FIPGmZhUYx/71ki4ml/e1nixCNSKLbAL6hI0v6oGExSjFijQxVmkHaD2ah4bztY
         y9dODga7bPpjNPCyzaLcf05ZTFDBrWyaE4Bf14Cn91BAh8jU0WjeA3MBC8nB/2cUjbO0
         sWc3qPNVEeklWtHkBAf9EYTdA397BgyPXjUfvPZ1UVPYPrbfTxq28xFxxeszxRgnrt1t
         +jtMQwSci1Cx7lx8Redi3B1QoY+C81hE8cUKP1W59ytutDaz4jsHMr4zR6bjQc0totMH
         vfeDf385PXJsMz+ik5um37IS+9t5S+DB3897Hbdv5bYBvvkGG50yevcvHIEjLLasSVWx
         Fd5w==
X-Gm-Message-State: AOAM530uLbMvBE1jKfwJn8fkFdbSEXKjyoRmE5WQkFJd7h8z6e452sE/
	aF7aHTa72uOwSBrwzou8cnP2hHsSXAvlHw==
X-Google-Smtp-Source: ABdhPJzUD2A9Q5dZ8H2999p2/5w3B1/FN+LqNggbd3akXZTC1Ep0G+X3rGld3tmKPT54ejDZA+wg2Q==
X-Received: by 2002:a0c:fa92:: with SMTP id o18mr570043qvn.182.1597251819836;
        Wed, 12 Aug 2020 10:03:39 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from localhost.localdomain (CPE04d4c4975b80-CM64777d5e8820.cpe.net.cable.rogers.com. [174.112.240.214])
        by smtp.gmail.com with ESMTPSA id k24sm3249977qtb.26.2020.08.12.10.03.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2020 10:03:39 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 04/10] kernel.bbclass: Configuration for environment with HOSTCXX
Date: Wed, 12 Aug 2020 13:03:25 -0400
Message-Id: <77ac5962e28b2fceb066b37f412e9a7d293f5774.1597203921.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1597203921.git.bruce.ashfield@gmail.com>
References: <cover.1597203921.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Zhang Qiang <qiang.zhang@windriver.com>

When compiling xilinx-zynq board linux-kernel-dev(v5.8) if
"GCC_PLUGINS=y", The following error will appear:

"HOSTCXX -fPIC scripts/gcc-plugins/arm_ssp_per_task_plugin.o
fatal error: gmp.h: No such file or directory"

the GCC_PLUGINS depend on return result of gcc-plugin.sh execution
however in gcc-plugin.sh use HOSTCC to detect the feature of GNU
extension of gcc, this will result that HOSTCC can compile the file
successfully, but HOSTCXX is used in the actual compilation process.

Signed-off-by: Zhang Qiang <qiang.zhang@windriver.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/classes/kernel.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index cf43a5d604..e2ceb6a333 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -212,6 +212,8 @@ UBOOT_LOADADDRESS ?= "${UBOOT_ENTRYPOINT}"
 KERNEL_EXTRA_ARGS ?= ""
 
 EXTRA_OEMAKE = " HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" HOSTCPP="${BUILD_CPP}""
+EXTRA_OEMAKE += " HOSTCXX="${BUILD_CXX} ${BUILD_CXXFLAGS} ${BUILD_LDFLAGS}""
+
 KERNEL_ALT_IMAGETYPE ??= ""
 
 copy_initramfs() {
-- 
2.19.1

