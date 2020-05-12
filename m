Received: from mail-io1-f65.google.com (mail-io1-f65.google.com [209.85.166.65])
 by mx.groups.io with SMTP id smtpd.web12.5935.1589290819648558254
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 May 2020 06:40:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=j+gBaF1y;
 spf=pass (domain: gmail.com, ip: 209.85.166.65, mailfrom: jpewhacker@gmail.com)
Received: by mail-io1-f65.google.com with SMTP id u11so13946416iow.4
        for <openembedded-core@lists.openembedded.org>; Tue, 12 May 2020 06:40:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=SwVm4Hr2WxtnymtjKn2li4PBeIcKgz9WFW0tYw4/ykk=;
        b=j+gBaF1yqX355kVH57j1HkTj9L6eH0obwTpdKXdfn3ug+K2MnsrNOwGVkTtppuy/wg
         IhRnW2z9OfE2z8k99xCUG0amcaJ3MaYYObusGJP5w8ffc3EGLhQGAJbvDIQShCsYi/zF
         loO2cSnadlluiajINkp/7NxU9M/BaFX4KYUGykucHFU/DHzLQpYXA76908CX5r4eWPe4
         82P9CHim2R3PUx60PlzZFL9D3LzZHMnS19RvYgvh7TuDowVi72agbFtjGUlizoG2ySdh
         8o22hSbA2xGK91GjgjWoqLYaO0s+B1psFRGoJiUeBaMEYAvHMNif+YZPWoNzIYnn4uYh
         bUbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=SwVm4Hr2WxtnymtjKn2li4PBeIcKgz9WFW0tYw4/ykk=;
        b=XAf4PXx+wY7usrDXSi5cZJ7MjFAGbUStElac4BD0463sS/yn9WVHbUBXpZOGpfkjSG
         C2webYwksDEXMomjsyeyT1kVH2pyL+dGdIiw8vXQTez28Q8BVhOM7GQIcufUwlLziw3R
         fe2oSVOOb7zggAHj7E10JXWv4H0jcdh3gUA93Um7dfaA7Qi78hA1SDaFZFSLSShW3NYk
         bpEqgA3+9mCndrk4rtLLi6Zo1quewOQKsB5WuH4nxN0inG7jr+HRObsdEbw+TjIR0reo
         5jDaTuw2/81bvkPBCXJbPzyIz13ODdnuC5zAVuOi/UfG0efQs9k3MeJvOHKOco0TVr4D
         zM+g==
X-Gm-Message-State: AGi0PuYKncDRvqw6xlPtJdkv8lpqKI757Dh0sqrMAbri+pEXoFnGrHhU
	Qq1oUgh7Szxer/cJvqxtnqv1iCFO2Ig=
X-Google-Smtp-Source: APiQypJJaI1FVyXD/MN5iCrTr0sKj1U0vEdBH+2iIwCVZTRRtTGx1Z+qXsRrG3irs4LtStS6hTImDg==
X-Received: by 2002:a02:b10d:: with SMTP id r13mr9097409jah.27.1589290818807;
        Tue, 12 May 2020 06:40:18 -0700 (PDT)
Return-Path: <jpewhacker@gmail.com>
Received: from OLA-8C37N23.garmin.com ([2605:a601:ac3d:c100:48c7:8e3e:3527:79a])
        by smtp.gmail.com with ESMTPSA id q8sm5696170iob.13.2020.05.12.06.40.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2020 06:40:18 -0700 (PDT)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH] classes/kernel: Generate reproducible kernel module tarball
Date: Tue, 12 May 2020 08:40:13 -0500
Message-Id: <20200512134013.25080-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.17.1

If reproducible binaries are requested, generate the kernel modules
tarball in a reproducible way. Namely, sort the tarball contents, clamp
the mtime to the source date epoch, compress the archive with a
consistent compression level (9), and don't include the name and
timestamp in the compressed file.

[YOCTO #12719]

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes/kernel.bbclass | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index a724645466..c124645643 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -691,7 +691,15 @@ kernel_do_deploy() {
 
 	if [ ${MODULE_TARBALL_DEPLOY} = "1" ] && (grep -q -i -e '^CONFIG_MODULES=y$' .config); then
 		mkdir -p ${D}${root_prefix}/lib
-		tar -cvzf $deployDir/modules-${MODULE_TARBALL_NAME}.tgz -C ${D}${root_prefix} lib
+		if [ "${BUILD_REPRODUCIBLE_BINARIES}" = "1" ]; then
+			TAR_ARGS="--sort=name --clamp-mtime --mtime=@${SOURCE_DATE_EPOCH}"
+			GZIP_ARGS="-9n"
+		else
+			TAR_ARGS=""
+			GZIP_ARGS=""
+		fi
+		tar $TAR_ARGS -cv -C ${D}${root_prefix} lib | gzip $GZIP_ARGS > $deployDir/modules-${MODULE_TARBALL_NAME}.tgz
+
 		ln -sf modules-${MODULE_TARBALL_NAME}.tgz $deployDir/modules-${MODULE_TARBALL_LINK_NAME}.tgz
 	fi
 
-- 
2.17.1

