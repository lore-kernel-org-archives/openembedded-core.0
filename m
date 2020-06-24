Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
 by mx.groups.io with SMTP id smtpd.web10.15499.1593010785033947025
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Jun 2020 07:59:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=JNcGmoIY;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.67, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f67.google.com with SMTP id o2so2837262wmh.2
        for <openembedded-core@lists.openembedded.org>; Wed, 24 Jun 2020 07:59:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sCf4f3insGgp+fvCpfqhxf1ofcSncd7Ukiia8PBQS0w=;
        b=JNcGmoIYrrxhYCGaQ0z4NU7er+m6xJ5R9aYWhMi2ziL+88K4dO+Cg8+rjwLpbgR9HN
         dS2pt+x9bSGnTu1dpfotN2WdMvVqexwdl0LsSE7YrkZ/4b9W3NW3WTMT4xQn4uitNIoB
         jYE1K2rQNoK9TXXB8LNz/C2+A68FgpcXX9zuQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sCf4f3insGgp+fvCpfqhxf1ofcSncd7Ukiia8PBQS0w=;
        b=rs6AgenelbWVej7SQgppmzItKDL5tkxpBk3uyR0ye23GiGiYL+LhHbQahfkJFIYm4f
         ZP3ytSjftmDmHPHn4pclWMzt78USRhUg3upNmDllvlpUV+b65Y1MGwiSMicDyMGEgdeS
         Ebgp8BIUyUbuTWl/foLqEcLx411+61WMjm8GJwShhcMZEPDKbSGrs8wyNIRVg3K/tV8v
         Apba+STcbBc0L2UZebKJ/UqQ6WiCFNnqSLvkA9UrB9444Mv/D0UajHCpBL9QZI9TKrng
         TR2+4qu8MjTygFi47GPuqawGaWO4oCXU0G8n0g46r2e/6KjHZ51gudAaCcb9LvfA59pv
         1cfA==
X-Gm-Message-State: AOAM5327woeeFdCb7o1UEPxvLy64FeU0WPuCVpnHAml3HBCstlnPu7hq
	Q4yxWLS6Qn9/r3lsPVLLY90OLP7B00jQpA==
X-Google-Smtp-Source: ABdhPJwTJ0YX+tpV6n3H5QXAoqfbB8DJBzmuAkqMnIYC/Qxdeb3lXJNRR1QPnQ/Dr/ixINqqTzvtww==
X-Received: by 2002:a1c:5ad6:: with SMTP id o205mr10059788wmb.54.1593010783072;
        Wed, 24 Jun 2020 07:59:43 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id e4sm1179555wrt.97.2020.06.24.07.59.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2020 07:59:42 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] scripts/install-buildtools: Update to 3.2 M1 buildtools
Date: Wed, 24 Jun 2020 15:59:39 +0100
Message-Id: <20200624145940.626352-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This fixes issues with openssl certs not working properly which meant error
reporting to an error report server was failing.

Also, all our downloads are now standarised on "sha256sum" so adjust for that.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 scripts/install-buildtools | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/scripts/install-buildtools b/scripts/install-buildtools
index 69ce9a1f054..5538ff70472 100755
--- a/scripts/install-buildtools
+++ b/scripts/install-buildtools
@@ -57,9 +57,9 @@ logger = scriptutils.logger_create(PROGNAME, stream=sys.stdout)
 
 DEFAULT_INSTALL_DIR = os.path.join(os.path.split(scripts_path)[0],'buildtools')
 DEFAULT_BASE_URL = 'http://downloads.yoctoproject.org/releases/yocto'
-DEFAULT_RELEASE = 'yocto-3.1'
-DEFAULT_INSTALLER_VERSION = '3.1'
-DEFAULT_BUILDDATE = ''
+DEFAULT_RELEASE = 'yocto-3.2_M1'
+DEFAULT_INSTALLER_VERSION = '3.1+snapshot'
+DEFAULT_BUILDDATE = '20200617'
 
 # Python version sanity check
 if not (sys.version_info.major == 3 and sys.version_info.minor >= 4):
@@ -229,7 +229,7 @@ def main():
         if args.check:
             logger.info("Fetching buildtools installer checksum")
             checksum_type = ""
-            for checksum_type in ["md5sum", "sha256"]:
+            for checksum_type in ["md5sum", "sha256sum"]:
                 check_url = "{}.{}".format(buildtools_url, checksum_type)
                 checksum_filename = "{}.{}".format(filename, checksum_type)
                 tmpbuildtools_checksum = os.path.join(tmpsdk_dir, checksum_filename)
-- 
2.25.1

