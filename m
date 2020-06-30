Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web10.7657.1593486298245365497
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jun 2020 20:04:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=iilq9OFH;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.169, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f169.google.com with SMTP id j4so7891723plk.3
        for <openembedded-core@lists.openembedded.org>; Mon, 29 Jun 2020 20:04:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=ICarQQyFmHAOnUdv0tM04uLICHPGTO9DhFqX+OxQrBU=;
        b=iilq9OFHWjagODGy3h9C+lgUXwiyuqwZ7Nq9s3Mwi9XWsGhvEDQSIu2F6RPe/ezlts
         WzMzT3fdjdacl23b1MjXdRvIl3RRB7FaClThezSaZ7ytVrqRK1ERBZD2i4VNASNGlh0m
         0Kez/LT90w2MvFljMeOfta02Uk0AwI6W5u9c8pyN/kBOTdqm8/l41QCY2wJ9ABEYgab7
         d7HsXgkDIPexuuNKcMNvOq5iQA9KGnOAWYJvqpzkE9gdnN/5HCAjZ8JNcUxu5iBaYJaI
         rr0IyLpSgv9x4oHac7s8RQd4kGr4d/5VmUblltsP6UZqu6Im9+xEpZrockDCF0cmN+br
         W+Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=ICarQQyFmHAOnUdv0tM04uLICHPGTO9DhFqX+OxQrBU=;
        b=t+m2GtFKHivW488kgKlP6crnCYIe7izlVuh+g6uaUjMesLzR6Z6qVFLlDYTF9TvqbM
         BxAQ6K9JQJu/2iZQvZgfTEbYJfkhgXlWVgRUEH30OmBFU3Ag8Yic7uOnSyjBPtv4vjoe
         Js9lDH/fBvDrI0Mnse8A7EnQgV0UMdcG7adOiR5kAv/psK+L3s2bPE5EM1cZFKJ11Fs8
         38UmUPUbFste2lKtDSl+jiWT87dcSx7b54JLEd8bCVrDy9mhn5HZ9U8OVecr46I6/jOa
         zmZxtG+ZyKS8Zj1ZdRIgh9D0MC2HFJz5w+ocRCG+nazLWZCxxawOGt5sSZPDb1GGtltC
         aQpQ==
X-Gm-Message-State: AOAM532CgWt2X0PGQAQ/RQ7fHkkgYAIWg0kifXVMZAvemhbp6BeeYycU
	hiZEZHcJIImI2InVDeu0CrGY5gyIlF/zXA==
X-Google-Smtp-Source: ABdhPJz1+xShKgRvHPSs3nIDe8kMFEthicKVc0SBR4E9XnoP7YVxWrKN6qekWL4+JFZXMD+sowVQIw==
X-Received: by 2002:a17:90b:11ca:: with SMTP id gv10mr21381436pjb.19.1593486297322;
        Mon, 29 Jun 2020 20:04:57 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com ([99.197.43.113])
        by smtp.gmail.com with ESMTPSA id 6sm875627pfi.170.2020.06.29.20.04.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2020 20:04:56 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 14/22] scripts/install-buildtools: Update to 3.2 M1 buildtools
Date: Mon, 29 Jun 2020 17:03:12 -1000
Message-Id: <bef009c91e8acfc7c1ba3cfd3183f000a02e002b.1593485896.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1593485896.git.steve@sakoman.com>
References: <cover.1593485896.git.steve@sakoman.com>

From: Richard Purdie <richard.purdie@linuxfoundation.org>

This fixes issues with openssl certs not working properly which meant error
reporting to an error report server was failing.

Also, all our downloads are now standarised on "sha256sum" so adjust for that.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit bc8b44e19a05f499f5cef049eedbed1fede2e765)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/install-buildtools | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/scripts/install-buildtools b/scripts/install-buildtools
index a9173fa096..1a458a2cc7 100755
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
@@ -227,7 +227,7 @@ def main():
         if args.check:
             logger.info("Fetching buildtools installer checksum")
             checksum_type = ""
-            for checksum_type in ["md5sum", "sha256"]:
+            for checksum_type in ["md5sum", "sha256sum"]:
                 check_url = "{}.{}".format(buildtools_url, checksum_type)
                 checksum_filename = "{}.{}".format(filename, checksum_type)
                 tmpbuildtools_checksum = os.path.join(tmpsdk_dir, checksum_filename)
-- 
2.17.1

