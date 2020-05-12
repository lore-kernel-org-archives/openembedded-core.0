Received: from mail-il1-f194.google.com (mail-il1-f194.google.com [209.85.166.194])
 by mx.groups.io with SMTP id smtpd.web12.1492.1589318370888238306
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 May 2020 14:19:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=BG1FGTSv;
 spf=pass (domain: gmail.com, ip: 209.85.166.194, mailfrom: jpewhacker@gmail.com)
Received: by mail-il1-f194.google.com with SMTP id j2so3135773ilr.5
        for <openembedded-core@lists.openembedded.org>; Tue, 12 May 2020 14:19:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=0dxKPPuI31b3f/WhTnJUrK1OQxNXy0BKno1ZxGeX3wE=;
        b=BG1FGTSv+e8mxqOm1cRXlWgLcw5LX76PASQS5x1I36x5sMsTkIz2fG9nePsBP37EJ2
         DJpVuAqNcj8b9Z7vmR30pb/FnJu0PEpScXufcX2tZmtWKpFLxVAwpIKOyutEYHhoNZda
         du/9yPE/Gci6WDlMSwMNQodXZ5CyRMb8zfAkUlAVFisMA7+ov56EobCvzlmstwNazzDd
         XYhq9RffkKGmjv3AOG0rRNLfusNDd4CKMmYYp8c35AzPz+h7bASq+BGWBWvY1BadOtJX
         H+RYmMSKvIk6anJTwQvZl1ZH0/2/vkU4IIAVZAkbHRYQJFFKxCPj3HFPaVs6BCL2n+ID
         D/lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=0dxKPPuI31b3f/WhTnJUrK1OQxNXy0BKno1ZxGeX3wE=;
        b=iTJ2C/JhXOXUH05pxIxAUgd7cjUg0ZIPCtBbNpqGK+ueWGSEXR9r7KzcaZRq//VxS6
         YnT8P9AEhpPodaO0vezjcqnrQlCkJS17cCo1//6JLkh/St5R9bcaf7ccO10TyNR1XwGM
         F/IcQhkkSYmunmxm95nst31OTX6AcK+8yjmxQVhyIHCCOkraEopybjjxBFhtqLfvPSHs
         6S5eubmZVVSlcl/SDmByNrzH8EpQsmf8v7ZAME6AmCepmJIHLEIBITHekBqAioUZWsVL
         F4WpTBTMAMkPvNwkG6I9UkOVpdBqkdyAdH2ayYTtnW3YzDAmcb/weg8XE7ixG7sNZcnf
         48HA==
X-Gm-Message-State: AGi0PuaEbaTVoTmqkxCJy1i+VLmEZjyi43TQqAe9T4n7aFQJbGmAKL6H
	SMpw9xSGQJlKPpb35DR544bMOTfbHjA=
X-Google-Smtp-Source: APiQypIEpkOERxpTo1YbU4psnAyI2LrCBO46L17Efo2dZODqLtfvFK3Y/fV7s4qd5Rm0RVbecLcWiw==
X-Received: by 2002:a92:d744:: with SMTP id e4mr23598610ilq.174.1589318370131;
        Tue, 12 May 2020 14:19:30 -0700 (PDT)
Return-Path: <jpewhacker@gmail.com>
Received: from OLA-8C37N23.garmin.com ([2605:a601:ac3d:c100:48c7:8e3e:3527:79a])
        by smtp.gmail.com with ESMTPSA id r25sm2168177ioj.51.2020.05.12.14.19.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2020 14:19:29 -0700 (PDT)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v2] classes/kernel: Generate reproducible kernel module tarball
Date: Tue, 12 May 2020 16:19:24 -0500
Message-Id: <20200512211924.15062-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200512134013.25080-1-JPEWhacker@gmail.com>
References: <20200512134013.25080-1-JPEWhacker@gmail.com>

If reproducible binaries are requested, generate the kernel modules
tarball in a reproducible way. Namely, sort the tarball contents, clamp
the mtime to the source date epoch, compress the archive with a
consistent compression level (9), and don't include the name and
timestamp in the compressed file.

[YOCTO #12719]

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes/kernel.bbclass | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index a724645466..6846d6040d 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -691,7 +691,13 @@ kernel_do_deploy() {
 
 	if [ ${MODULE_TARBALL_DEPLOY} = "1" ] && (grep -q -i -e '^CONFIG_MODULES=y$' .config); then
 		mkdir -p ${D}${root_prefix}/lib
-		tar -cvzf $deployDir/modules-${MODULE_TARBALL_NAME}.tgz -C ${D}${root_prefix} lib
+		if [ -n "${SOURCE_DATE_EPOCH}" ]; then
+			TAR_ARGS="--sort=name --clamp-mtime --mtime=@${SOURCE_DATE_EPOCH}"
+		else
+			TAR_ARGS=""
+		fi
+		tar $TAR_ARGS -cv -C ${D}${root_prefix} lib | gzip -9n > $deployDir/modules-${MODULE_TARBALL_NAME}.tgz
+
 		ln -sf modules-${MODULE_TARBALL_NAME}.tgz $deployDir/modules-${MODULE_TARBALL_LINK_NAME}.tgz
 	fi
 
-- 
2.17.1

