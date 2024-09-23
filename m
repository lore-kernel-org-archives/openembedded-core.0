Return-Path: <aleksandar.nikolic010@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BEAFCF9C72
	for <webhook@archiver.kernel.org>; Mon, 23 Sep 2024 09:42:22 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web10.32872.1727084534965614743
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Sep 2024 02:42:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BsankTL0;
 spf=pass (domain: gmail.com, ip: 209.85.167.52, mailfrom: aleksandar.nikolic010@gmail.com)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-536584f6c84so4908541e87.0
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Sep 2024 02:42:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727084533; x=1727689333; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=j0HvZYjSU43OO9xyBp7+51L6f+4pKjvda4RrKq/6aiA=;
        b=BsankTL0LCM8Nn8KsIYrEAA9y1Rjmm0C430TBFp/n37ViHO76V3SvrZPRkkO1x8TMf
         kjmA0E5CEkCyRjPThxb199RaUv2iYJfy+5rp0TafQnDWsyfs7pW/olK4ZAD8yiF2ryHI
         l3xraTC6UmsYWnl5UdA54oFaZn6mQpi0RasTq+T1fjBJvEtV9LP+XCnA264SG8UFhr9e
         m6fZrMm94xd8dkHB6WO/+CwajolCwx5O1nbqXCn1cccv6NpsMpqdfyGV95s5uj+aQy08
         hY12fC2lTYWICoaICWPTLq2nz8gx8PQDIqAADs7RWy2PJFYwmM3DP1ETNX61w1+Diy5s
         /pBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727084533; x=1727689333;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j0HvZYjSU43OO9xyBp7+51L6f+4pKjvda4RrKq/6aiA=;
        b=dD2xC6mRubzRhAds6CCe3IgyEvWF+bPu8coA0IbGQ11SAThqNJ6BWgmTsYW52fedHE
         dXvGXVRNW0ki3LJSDKFAIP0LctJrBFXIzETDL9twjL8UPupOLMGoZwrXtBftvVtysxou
         3D3EXrzXAzKbybjMeGU66/Kew672louR2AM+HeYW+NOumwqAwI3eaV0xIChF/AdP3u/b
         t2QtbVb4er3EIKQJ/QEMFxIwZATu8RswESAtDA4foWHo4QIbfCLQ0ZFpGh6XuwXCdW3V
         3kKYcHQFnzrP9lyvp+pm5K03wZK174ToWc08h9ISYnhs4is9rEEPjXHJW+jyiSJh1/Eh
         lXZA==
X-Gm-Message-State: AOJu0YxRLHdMIvBjqolz29imeSkML3R5S9z5Ao0WjnA6SVzLKdg8l80b
	0UFMqqyc1KUFi6ZTWD2JSAvx5grErPHg5EI0Wh8s4gSCUygw/H8AMEGf0/zyYA8=
X-Google-Smtp-Source: AGHT+IH70UreGnpVZ73yze1V9NSI3MZYkUjMZFeNoFPkw36KACxYqHVXJXFi3tcZhO0x2Ee2Mk8kGg==
X-Received: by 2002:a05:6512:39c9:b0:52e:9fe0:bee4 with SMTP id 2adb3069b0e04-536ac2d653cmr5337562e87.9.1727084533026;
        Mon, 23 Sep 2024 02:42:13 -0700 (PDT)
Received: from an.. ([2a02:810d:600:2744:e855:ba31:e4ab:c4bc])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a90612b3877sm1183903066b.112.2024.09.23.02.42.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Sep 2024 02:42:12 -0700 (PDT)
From: Aleksandar Nikolic <aleksandar.nikolic010@gmail.com>
X-Google-Original-From: Aleksandar Nikolic <an010@live.com>
To: openembedded-core@lists.openembedded.org
Cc: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [scarthgap][PATCH 1/4] install-buildtools: remove md5 checksum validation
Date: Mon, 23 Sep 2024 11:41:56 +0200
Message-Id: <20240923094159.51274-1-an010@live.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Sep 2024 09:42:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204801

From: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>

No need to validate with the md5 checksum, as the file is not even
uploaded to the Yocto release webpage (the download never failed due
to a wrong indentation of an else statement). For validation purposes,
use the sha256 checksum only.

Signed-off-by: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b740d2f9d40aef1e18c022d1e82b4fb2c5c1fc22)
Signed-off-by: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>
---
 scripts/install-buildtools | 27 ++++++++++-----------------
 1 file changed, 10 insertions(+), 17 deletions(-)

diff --git a/scripts/install-buildtools b/scripts/install-buildtools
index 2218f3ffac..a34474ea84 100755
--- a/scripts/install-buildtools
+++ b/scripts/install-buildtools
@@ -238,19 +238,15 @@ def main():
         # Verify checksum
         if args.check:
             logger.info("Fetching buildtools installer checksum")
-            checksum_type = ""
-            for checksum_type in ["md5sum", "sha256sum"]:
-                check_url = "{}.{}".format(buildtools_url, checksum_type)
-                checksum_filename = "{}.{}".format(filename, checksum_type)
-                tmpbuildtools_checksum = os.path.join(tmpsdk_dir, checksum_filename)
-                ret = subprocess.call("wget -q -O %s %s" %
-                                      (tmpbuildtools_checksum, check_url), shell=True)
-                if ret == 0:
-                    break
-            else:
-                if ret != 0:
-                    logger.error("Could not download file from %s" % check_url)
-                    return ret
+            checksum_type = "sha256sum"
+            check_url = "{}.{}".format(buildtools_url, checksum_type)
+            checksum_filename = "{}.{}".format(filename, checksum_type)
+            tmpbuildtools_checksum = os.path.join(tmpsdk_dir, checksum_filename)
+            ret = subprocess.call("wget -q -O %s %s" %
+                                    (tmpbuildtools_checksum, check_url), shell=True)
+            if ret != 0:
+                logger.error("Could not download file from %s" % check_url)
+                return ret
             regex = re.compile(r"^(?P<checksum>[0-9a-f]+)\s+(?P<path>.*/)?(?P<filename>.*)$")
             with open(tmpbuildtools_checksum, 'rb') as f:
                 original = f.read()
@@ -263,10 +259,7 @@ def main():
                     logger.error("Filename does not match name in checksum")
                     return 1
                 checksum = m.group('checksum')
-            if checksum_type == "md5sum":
-                checksum_value = md5_file(tmpbuildtools)
-            else:
-                checksum_value = sha256_file(tmpbuildtools)
+            checksum_value = sha256_file(tmpbuildtools)
             if checksum == checksum_value:
                     logger.info("Checksum success")
             else:
-- 
2.25.1


