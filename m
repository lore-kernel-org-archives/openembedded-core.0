Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com [209.85.222.196])
 by mx.groups.io with SMTP id smtpd.web12.1391.1592340465134716038
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Jun 2020 13:47:45 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.222.196, mailfrom: otavio.salvador@gmail.com)
Received: by mail-qk1-f196.google.com with SMTP id c185so20631154qke.7
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Jun 2020 13:47:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:organization:content-transfer-encoding;
        bh=C0jINEUtPVYnj4C/FxQIYWc/KLpfSgI2zNn8AUIQgXI=;
        b=ouLnjn2e4bhpk41+DOC/f7OFRXWPAJNuGFuHMt01/UrgXdNPmcoSLC4wFOcWCGWz5T
         muB4zvjKnJ3TWr7rYVGrOTsMCkWpVv5GL+YiQnA1WVyuS0s8luFSF+F4l9xFZdvAO+jc
         qBYk9wBhF2Q3oCOAlTS5tI6RbCVxZZ89tF4Harz+9axiqHVO3gir7O9lQxOvfbWLu80B
         zEkYQriN9P9kpOyuvaeQ+OjT42UDOC+Ot1FsVra7LdCk/TSnBBn+DJVXcqCeVqIs4iH9
         hnbH8zwH0oaZsjFLdMOTsRFAzJHl7AH1FE+5VBxDHoM/RW3rxstB810Fe6CruEXLXLkx
         p8Yw==
X-Gm-Message-State: AOAM533w9La1HFVO6NYMxBJK07zZ3g49uBXIMOzeXKOJsC3p3n2erILl
	FoR1ouQbf5NZEzD0zNsaa1iU/xSXnE0=
X-Google-Smtp-Source: ABdhPJy6f5pddT484Mm7ddlUKJA1goci7MZDxi5nVMpxMU98CDGH3miCmAV0xBR4EpV/QaB5818byQ==
X-Received: by 2002:a05:620a:14b8:: with SMTP id x24mr1674131qkj.284.1592340464096;
        Tue, 16 Jun 2020 13:47:44 -0700 (PDT)
Return-Path: <otavio.salvador@gmail.com>
Received: from localhost ([181.220.84.90])
        by smtp.gmail.com with ESMTPSA id k34sm15129115qtf.35.2020.06.16.13.47.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2020 13:47:43 -0700 (PDT)
From: "Otavio Salvador" <otavio.salvador@gmail.com>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Cc: Steve Sakoman <steve@sakoman.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Otavio Salvador <otavio@ossystems.com.br>
Subject: [dunfell-backport PATCH 3/3] buildtools-tarball: export OPENSSL_CONF in environment setup
Date: Tue, 16 Jun 2020 17:47:25 -0300
Message-Id: <20200616204726.2332101-3-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200616204726.2332101-1-otavio@ossystems.com.br>
References: <20200616204726.2332101-1-otavio@ossystems.com.br>
MIME-Version: 1.0
Organization: O.S. Systems Software LTDA.
Content-Transfer-Encoding: 8bit

From: Steve Sakoman <steve@sakoman.com>

The autobuilder has been experiencing SSL: CERTIFICATE_VERIFY_FAILED
errors during error report uploads when using buildtools due to looking
for certs in /opt/poky

Signed-off-by: Steve Sakoman <steve@sakoman.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 197f1d5d14b8e57295f5a81c03c86abba5328614)
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 meta/recipes-core/meta/buildtools-tarball.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/meta/buildtools-tarball.bb b/meta/recipes-core/meta/buildtools-tarball.bb
index 977b6a5e1d..edf67ce2ad 100644
--- a/meta/recipes-core/meta/buildtools-tarball.bb
+++ b/meta/recipes-core/meta/buildtools-tarball.bb
@@ -74,6 +74,7 @@ create_sdk_files_append () {
 	toolchain_create_sdk_version ${SDK_OUTPUT}/${SDKPATH}/version-${SDK_SYS}
 
 	echo 'export GIT_SSL_CAINFO="${SDKPATHNATIVE}${sysconfdir}/ssl/certs/ca-certificates.crt"' >>$script
+	echo 'export SSL_CERT_FILE="${SDKPATHNATIVE}${sysconfdir}/ssl/certs/ca-certificates.crt"' >>$script
 	echo 'export OPENSSL_CONF="${SDKPATHNATIVE}${sysconfdir}/ssl/openssl.cnf"' >>$script
 
 	mkdir -p ${SDK_OUTPUT}/${SDKPATHNATIVE}${sysconfdir}/
-- 
2.27.0

