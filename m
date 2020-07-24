Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web11.302.1595568379262424750
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Jul 2020 22:26:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Wxdgk5zv;
 spf=pass (domain: gmail.com, ip: 209.85.218.50, mailfrom: rehsack@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id g7so423705ejw.12
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Jul 2020 22:26:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id;
        bh=P4v3zcUavpljo3jL6kJRgaEI1eSOx2NNzk0gM4eppJg=;
        b=Wxdgk5zvN5VKtHSGPwc/xsPC90h/SBAcKw9iikYI5VwGc9cUCSeRCa1kZLWpwhp/0X
         FTngPERFlwWCjxrLClgYAzpUDYWnW+yaOBC4FM/TTq5zPFeV538Ieyyz2jvlHrLVZWVR
         l+LJQXpuewJTL+5a+ZFfGUALF1aSMyrmpcklxc2hxdNht+QXU2N3L0KisymIzFvTBi86
         RRIgm+5l2A70Yf2DCtFdOVXrgHvZzLgSJreOvhvM3hXH+ZXueEjwMsRZ1cWMC341wSOn
         n8cEp/kmOUMDDt9A1PPgpvXev+BZxyV3getrvJVVd5xK0o7E95Ks6ripXOprbIV2gQPG
         WieA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
        bh=P4v3zcUavpljo3jL6kJRgaEI1eSOx2NNzk0gM4eppJg=;
        b=Ad0SxMFwHBcY1mbjMFTZLSbNiBQHw2wYTkVOV1OFQBj1fMAg/qxoN0uXDKntPKdtGZ
         cxfzdzI7SsZB7F+gO/1wDc2X+urA37RV07SsLkmPkZM8u2E7dLDp9oAVOqkVyHz9Tga8
         x/4eMQL0E4hJkbTKRWyLgU+M6yeg0BbYtY2FGFA1v8KPpOKaXoaWraVXNjAo3/Y7N4XR
         TmLbBla16Am51OSxOQ7IqdP3uexOYIqiiukSigJRVKILP6kcqrTS5aCDYZkY3MH9PMjP
         wLOd/w3Nw7Ph3nvaRoA6tzVHo8t8tcnBdclR3Z9j42OXg0fG/CkYzJDZbhm/VYt9cGKD
         67JA==
X-Gm-Message-State: AOAM532unvcvG4N+ritcB++CPFW8SyfKK20h9ZJ0PfaF7hKkfhLgfG1i
	0KLSdUhD1CYKzaDFLvMmhyP0yfpZ
X-Google-Smtp-Source: ABdhPJybDwI5yzzVqy792UgoqHLnDzaYQFKBlGIryo1CClZTzFDcosZFck1PeTweP6dvBUNv6ngnJQ==
X-Received: by 2002:a17:906:3b83:: with SMTP id u3mr7473260ejf.207.1595568377441;
        Thu, 23 Jul 2020 22:26:17 -0700 (PDT)
Return-Path: <rehsack@gmail.com>
Received: from beaker.muppets.liwing.de ([91.37.185.204])
        by smtp.gmail.com with ESMTPSA id d19sm3451397ejk.47.2020.07.23.22.26.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2020 22:26:16 -0700 (PDT)
Sender: Jens Rehsack <rehsack@gmail.com>
From: "Jens Rehsack" <rehsack@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jens Rehsack <sno@netbsd.org>
Subject: [OE-core][PATCH v2 1/2] toolchain-scripts.bbclass: also recognize ${SDK_SYS} env setups
Date: Fri, 24 Jul 2020 07:26:05 +0200
Message-Id: <20200724052606.6726-1-sno@netbsd.org>
X-Mailer: git-send-email 2.17.1

Instead of recognizing only environment-setup scripts in
${STAGING_DIR_TARGET} or ${STAGING_DIR_NATIVE}, respectively - lurk also into
${SDKPATH}/buildtools/sysroots/${SDK_SYS} where nativesdk-openssl installs
setup files.

Signed-off-by: Jens Rehsack <sno@netbsd.org>
---
 meta/classes/toolchain-scripts.bbclass | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/classes/toolchain-scripts.bbclass b/meta/classes/toolchain-scripts.bbclass
index db1d3215ef..e3959e21e8 100644
--- a/meta/classes/toolchain-scripts.bbclass
+++ b/meta/classes/toolchain-scripts.bbclass
@@ -119,6 +119,11 @@ if [ -d "\$OECORE_NATIVE_SYSROOT/environment-setup.d" ]; then
 	    . \$envfile
     done
 fi
+if [ -d "${SDKPATH}/buildtools/sysroots/${SDK_SYS}/environment-setup.d" ]; then
+    for envfile in ${SDKPATH}/buildtools/sysroots/${SDK_SYS}/environment-setup.d/*.sh; do
+	    . \$envfile
+    done
+fi
 EOF
 }
 
-- 
2.17.1

