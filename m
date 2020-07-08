Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com [209.85.218.67])
 by mx.groups.io with SMTP id smtpd.web12.3303.1594238292539793175
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jul 2020 12:58:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=H+dz2N/s;
 spf=pass (domain: gmail.com, ip: 209.85.218.67, mailfrom: rehsack@gmail.com)
Received: by mail-ej1-f67.google.com with SMTP id a1so51790227ejg.12
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Jul 2020 12:58:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id;
        bh=AoL7/hoVi6JhAjRWn1tDbiU6w/dqOyw8wyh2vhm3t2I=;
        b=H+dz2N/sUUH+5BSSVc6qH7hv0KLkEyTc3uTivqyAOkQ8zn1y4XVy9QqH7aVI55AWsy
         tQSL2MWiuWOUX2oYzbZzYaZ/3Rk/nZfIN6FBwIKaH6ppNUiCcLwNDA6tIOBLTyB0v+4K
         x2J5okoRgtHn7NfFp5HEhG/N385Qf3css6+uWOYGHgNH/yQdywQ6A+DCEiibb9mNu2er
         7LpjSGgqTwHYFjHA/cYQwLSe153WqwZeQ+aVh1YJsVQyYSpgt7sZoStIWA5i22pNZTmk
         g7NM2kfj3Tsz0rDht+Td3r21+RK9MCEICpgBHuAUR+lRORH+QBFVHWrKynUHX7rai8dd
         J5mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
        bh=AoL7/hoVi6JhAjRWn1tDbiU6w/dqOyw8wyh2vhm3t2I=;
        b=qH/+QF6E8cfHs40DGNlZVjK7tvrCDxlCUJYjJN5b98Ft48isnvMmeYL/05qLoRItOl
         VwxUNHQzG9rvgyygk5p3wzpy++oOKEjH8fnWfVG9TlnCmf5qAijH/aMHqSqy+fJDpKg8
         fWIJRRvi0GhiPDcfIRgM/eQydH0uIRX6XG7fvR6di3U++08mPYTFYAGjz5qTLaFz05Z9
         aRFn42cc1mlVNPYPyb+rJmJ4h4oFeV1gwsovsaPwBluX1OgWLmUEFpyLiQ2ub4zBCTKW
         mfnM2gl5ebKNQfD+nkrELFfwQauOKfwf0lt69c2BPfI9jwSDDt3YU4Zhlz22QCANdS+G
         JcDg==
X-Gm-Message-State: AOAM5300kH72Gln/ubsZe0yfuWbLlIa105vmAHFUkGfZK9eb+qBk4G1o
	FazA+8S/f1pztA5HisYd9Bx0lx11
X-Google-Smtp-Source: ABdhPJyNOQHNHTp9fuop24kAcSgUuDdmHFYe9OhCmgJetjl3ZH5PO0W5sybcebVJUUwbJsFdS4G9og==
X-Received: by 2002:a17:906:d78f:: with SMTP id pj15mr56261211ejb.283.1594238290717;
        Wed, 08 Jul 2020 12:58:10 -0700 (PDT)
Return-Path: <rehsack@gmail.com>
Received: from beaker.muppets.liwing.de (p4fe931fc.dip0.t-ipconnect.de. [79.233.49.252])
        by smtp.gmail.com with ESMTPSA id u13sm329012ejx.3.2020.07.08.12.58.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2020 12:58:09 -0700 (PDT)
Sender: Jens Rehsack <rehsack@gmail.com>
From: "Jens Rehsack" <rehsack@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jens Rehsack <sno@netbsd.org>
Subject: [OE-core][PATCH] toolchain-scripts.bbclass: also recognize ${SDK_SYS} env setups
Date: Wed,  8 Jul 2020 21:57:56 +0200
Message-Id: <20200708195756.760-1-sno@netbsd.org>
X-Mailer: git-send-email 2.17.1

Instead of recognizing only environment-setup scripts in
${STAGING_DIR_TARGET} or ${STAGING_DIR_NATIVE}, respectively - lurk also into
${SDKPATH}/buildtools/sysroots/${SDK_SYS} where nativesdk-openssl installs
setup files.

Remove overwriting of OPENSSL_CONF from buildtools-tarball.bb to clarify
whether nativesdk-openssl installs wrong content or buildtools-tarball:
    (nativesdk-openssl) tmp/sysroots/x86_64/usr/lib/ssl-1.1/openssl.cnf
    (buildtools-tarball) buildtools/sysroots/x86_64-pokysdk-linux/etc/ssl/openssl.cnf

Signed-off-by: Jens Rehsack <sno@netbsd.org>
---
 meta/classes/toolchain-scripts.bbclass       | 5 +++++
 meta/recipes-core/meta/buildtools-tarball.bb | 1 -
 2 files changed, 5 insertions(+), 1 deletion(-)

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
 
diff --git a/meta/recipes-core/meta/buildtools-tarball.bb b/meta/recipes-core/meta/buildtools-tarball.bb
index d0f8dd7d7c..02e662b5cc 100644
--- a/meta/recipes-core/meta/buildtools-tarball.bb
+++ b/meta/recipes-core/meta/buildtools-tarball.bb
@@ -75,7 +75,6 @@ create_sdk_files_append () {
 
 	echo 'export GIT_SSL_CAINFO="${SDKPATHNATIVE}${sysconfdir}/ssl/certs/ca-certificates.crt"' >>$script
 	echo 'export SSL_CERT_FILE="${SDKPATHNATIVE}${sysconfdir}/ssl/certs/ca-certificates.crt"' >>$script
-	echo 'export OPENSSL_CONF="${SDKPATHNATIVE}${sysconfdir}/ssl/openssl.cnf"' >>$script
 
 	if [ "${SDKMACHINE}" = "i686" ]; then
 		echo 'export NO32LIBS="0"' >>$script
-- 
2.17.1

