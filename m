Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com [209.85.160.194])
 by mx.groups.io with SMTP id smtpd.web11.19427.1597251829632203426
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Aug 2020 10:03:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=iu3HNh01;
 spf=pass (domain: gmail.com, ip: 209.85.160.194, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f194.google.com with SMTP id t23so2039309qto.3
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Aug 2020 10:03:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=slIYj4/73SLaXRGRuypyAqh5Taze+eU0p4wMaS47MmU=;
        b=iu3HNh01yRLQIU/bPIXOvbimz+N8vPscBDKpshLz36O4O7sGqa/NLUpBbqkYCSJkZF
         ROfKMbEcvjqgIjD1Gnt0YphgOwrhUxzeH/Iyq7t4zdmrnZi0Vw5NIU9R0lidmgFPZaq6
         8gc+TcdzFIwIk+t8sBpjv+CO+TPXvsZTU2VDuNYhBQ582UcwtqHPiID7n7mQkmTIR7oL
         lNVMH9JF7ihiZ9retbqPFjqkQRXuOsr6IzsGGJHFe9SLbsGsniotapOqU6eh6kgk0jY/
         +8sOWXux875Yes+N/9v3eKxc7i3OdeT22blNiJXIzJpWcBJoB0ziMXmVbxNVBWcsU03l
         NGlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=slIYj4/73SLaXRGRuypyAqh5Taze+eU0p4wMaS47MmU=;
        b=Bsm/TH7aZDOP9564jFIF/5wh5y+STtEPd36kIrozxmG4QbaNUsHq+q5LLXQopNqE+I
         LU8KtiiPQNn6e7hB2YzeRlC30JMkc46jbBReJG9ugzr2B2clQzT2EqnHnC0B2p21MoT1
         AP+atRJMN/tK1ckpU2SFQPi8gbL0LbcQKdIH+pWwVEMFwvhwkw/T0m0+g5IIsKaxJ54K
         edEmM76Me5nR7Ix0ZsVpZ3CWUuiofHR4XhwCbkHZXYlpFqIxRImlpIDd/7crxOTI1iYM
         05yauqYiXYsOftonwIcqDGlRk1SlNT41YY0dyUd2Tan8+0ilV55UBuKoOfhwYEVkwMsV
         o1PA==
X-Gm-Message-State: AOAM53387dBm0CBpWzPbPhD/BpwkMSFAitATANx7CI4yl/+Jqlqo3bgT
	MEir4lJuKiqTx0ndgu5U7ik=
X-Google-Smtp-Source: ABdhPJyRt2jLfGftAwY67xRy7cuZiCT8HArHhWS4zYWFUw1tozgXaC9jc48Qg3e6mMaN7PHlSaAnqg==
X-Received: by 2002:aed:2a82:: with SMTP id t2mr637785qtd.280.1597251828581;
        Wed, 12 Aug 2020 10:03:48 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from localhost.localdomain (CPE04d4c4975b80-CM64777d5e8820.cpe.net.cable.rogers.com. [174.112.240.214])
        by smtp.gmail.com with ESMTPSA id k24sm3249977qtb.26.2020.08.12.10.03.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2020 10:03:47 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 10/10] kernel-devsrc: 5.8 + gcc10 require gcc-plugins + libmpc-dev
Date: Wed, 12 Aug 2020 13:03:31 -0400
Message-Id: <90f850e5a8544a140da3b2a8dec7023913856884.1597203921.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1597203921.git.bruce.ashfield@gmail.com>
References: <cover.1597203921.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

In order to execute 'make scripts prepare' on target with the
5.8 kernel and gcc 10, we need to have the gcc-plugins and
libmpc-dev on target.

Although not strictly required for all kernel versions, they
don't do any harm when included.

We add them to the RDEPENDS of devsrc to avoid the errors:

   scripts/gcc-plugins/gcc-common.h:5:10: fatal error: bversion.h: No such
   file or directory
   | #include "bversion.h"

and

   /usr/lib/gcc/arm-poky-linux-gnueabi/10.1.0/plugin/include/builtins.h:23:10:
     fatal error: mpc.h: No such file or directory

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/kernel-devsrc.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb b/meta/recipes-kernel/linux/kernel-devsrc.bb
index 34b947b599..a9c7be0f81 100644
--- a/meta/recipes-kernel/linux/kernel-devsrc.bb
+++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
@@ -290,3 +290,5 @@ RDEPENDS_${PN} = "bc python3 flex bison ${TCLIBC}-utils"
 RDEPENDS_${PN} += "openssl-dev util-linux"
 # and x86 needs a bit more for 4.15+
 RDEPENDS_${PN} += "${@bb.utils.contains('ARCH', 'x86', 'elfutils', '', d)}"
+# 5.8+ needs gcc-plugins libmpc-dev
+RDEPENDS_${PN} += "gcc-plugins libmpc-dev"
-- 
2.19.1

