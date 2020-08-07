Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web12.5044.1596831952466178380
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Aug 2020 13:25:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=frEip6az;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f41.google.com with SMTP id f7so2779888wrw.1
        for <openembedded-core@lists.openembedded.org>; Fri, 07 Aug 2020 13:25:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=T8EIoMOn7eCWpaLpd4nl4E6sh5AIB4JvcJRCVVafsBc=;
        b=frEip6azeUXQf3uPHJAbwlsESWcWg1hYUu7hIODWAfA4CPH+hvuD+cGLhf7PyI+MDu
         3JyIz+wA1ih4Xn5KsGxUVNh9PdWfMnbPIJu8MTSSkR2fpMOY82zHAMezilet1HkN/Z4k
         lZuBzbgqgvDnkCzQqfveYbn3RRa8cCTKR7zwg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=T8EIoMOn7eCWpaLpd4nl4E6sh5AIB4JvcJRCVVafsBc=;
        b=ZibjpzNm3+22ZwNdhtj1uX2Z1CeDOKLxthpsP96778TzOxerv12mITUbjER7elw/wH
         PvwChGKQ5+efueIF2uez0nnnVJOFDp/YY3keET5MzOn2od+/IZumzma4eQgprYq6SG92
         Du8ldeZTwHO8u75zTj3HdaAigcOEOX2GMrnspU9gyxhHbWxUf6+Np0ewYUsSymF07CBK
         K8CNzGRhdNwYEEaExC98W37bqa1nYn+44HpfBEpjtX9KahsBaAkuVd5yXDgAa5H2RFmM
         dcBXJjxWwKP/o6KBXCuHhdYYNUw+xlh3RB1uMrGHOMaiGhQO7NJwf2Nb9IryMmdKEWyM
         Q1uw==
X-Gm-Message-State: AOAM530mBa7s2uWsDYg7S/M+0kA8O+fXZ0yGL+XExLGgJUalqMJpI2bN
	WUr5TJhsUz/deCNFgUMRrmeclNMhX3Vb9g==
X-Google-Smtp-Source: ABdhPJwMB7zWYfLqOy98Q6QySzMlzT2wVye/c4Hpa6tvT/NC91fOMwgCp7NFq2IX6OLTfW8Sd17zEg==
X-Received: by 2002:adf:ea0f:: with SMTP id q15mr13162322wrm.113.1596831950836;
        Fri, 07 Aug 2020 13:25:50 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (9.a.b.2.3.a.a.7.c.e.f.b.f.8.9.f.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:f98f:bfec:7aa3:2ba9])
        by smtp.gmail.com with ESMTPSA id q4sm11827770wme.31.2020.08.07.13.25.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2020 13:25:50 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/3] buildtools: Handle generic environment setup injection
Date: Fri,  7 Aug 2020 21:25:47 +0100
Message-Id: <20200807202548.753073-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200807202548.753073-1-richard.purdie@linuxfoundation.org>
References: <20200807202548.753073-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently buildtools has its own hacked environment setup. We added
capability for generic script fragements but this code was never updated
to use it even if several components it contains needs it.

Remove a hardcoded variable in favour of the generic scripts to
avoid bugs in this area in future. The others should probably be
migrated to environment files in future too but there isn't such
a file for those at present.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/meta/buildtools-tarball.bb | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-core/meta/buildtools-tarball.bb b/meta/recipes-core/meta/buildtools-tarball.bb
index d0f8dd7d7cb..3785941c2cf 100644
--- a/meta/recipes-core/meta/buildtools-tarball.bb
+++ b/meta/recipes-core/meta/buildtools-tarball.bb
@@ -66,16 +66,19 @@ create_sdk_files_append () {
 	script=${1:-${SDK_OUTPUT}/${SDKPATH}/environment-setup-${SDK_SYS}}
 	touch $script
 	echo 'export PATH=${SDKPATHNATIVE}${bindir_nativesdk}:$PATH' >> $script
-	# In order for the self-extraction script to correctly extract and set up things,
-	# we need a 'OECORE_NATIVE_SYSROOT=xxx' line in environment setup script.
-	# However, buildtools-tarball is inherently a tool set instead of a fully functional SDK,
-	# so instead of exporting the variable, we use a comment here.
-	echo '#OECORE_NATIVE_SYSROOT="${SDKPATHNATIVE}"' >> $script
-	toolchain_create_sdk_version ${SDK_OUTPUT}/${SDKPATH}/version-${SDK_SYS}
-
+	echo 'export OECORE_NATIVE_SYSROOT="${SDKPATHNATIVE}"' >> $script
 	echo 'export GIT_SSL_CAINFO="${SDKPATHNATIVE}${sysconfdir}/ssl/certs/ca-certificates.crt"' >>$script
 	echo 'export SSL_CERT_FILE="${SDKPATHNATIVE}${sysconfdir}/ssl/certs/ca-certificates.crt"' >>$script
-	echo 'export OPENSSL_CONF="${SDKPATHNATIVE}${sysconfdir}/ssl/openssl.cnf"' >>$script
+
+	toolchain_create_sdk_version ${SDK_OUTPUT}/${SDKPATH}/version-${SDK_SYS}
+
+	cat >> $script <<EOF
+if [ -d "\$OECORE_NATIVE_SYSROOT/environment-setup.d" ]; then
+	for envfile in \$OECORE_NATIVE_SYSROOT/environment-setup.d/*.sh; do
+		. \$envfile
+	done
+fi
+EOF
 
 	if [ "${SDKMACHINE}" = "i686" ]; then
 		echo 'export NO32LIBS="0"' >>$script
-- 
2.25.1

