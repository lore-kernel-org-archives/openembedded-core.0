Return-Path: <aleksandar.nikolic010@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A6FCCF9C71
	for <webhook@archiver.kernel.org>; Tue, 24 Sep 2024 23:05:41 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web10.2800.1727219133318278600
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Sep 2024 16:05:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OgTLBP8u;
 spf=pass (domain: gmail.com, ip: 209.85.208.52, mailfrom: aleksandar.nikolic010@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5c275491c61so8016826a12.0
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Sep 2024 16:05:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727219132; x=1727823932; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j0HvZYjSU43OO9xyBp7+51L6f+4pKjvda4RrKq/6aiA=;
        b=OgTLBP8uqMTQZMSHiju9G7RgrAw3YGzVRTQ42piOQ4t/eADbG1SHoEV2tOO4gyi4vP
         kRKAnBLVlsEUhM9WyuAzdsoS+e6LJ2KZiHhfv+W6zfQxibLoxZY7FJKrmCrhhQZ/BhwW
         LR47QGqpyE4fNUYXa0+unroE0uxKzFE9C6rFf5ipPDFkQgigbbDQHhIRQ8gGF/KB7Kfn
         JyJZmczsrOm9ICo/y3abxKMPy5PHCWyY1RerSc7ML1ZjT986xb7EMruI3F0IbkI4yclx
         4ExQ7cICpzRyYTbDxZR949acVpN09BJUx9lTQvVOSpsLqd9MjA46EBwGJBOe9ZPm6uAJ
         wV0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727219132; x=1727823932;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j0HvZYjSU43OO9xyBp7+51L6f+4pKjvda4RrKq/6aiA=;
        b=kN25rbMT/j/dxp00RCj1+vGFxPCMn0i4YNWrTRq8crmMvpH/nKdM0O4u3WZLs9L9xH
         1/bMGtwKD+VotYkyU1rZbGhH+uz03c53Ap51oBXdvuOYnYDXRNiFSz9wt+TfYEsxK5dW
         TL/3vBKEBCqfH6VjuMFTBU84G+UUmOHCnyTjUjLvFqyMtXDUf1G5ywitJ+JHTdkkb9nR
         IrER4peXFcrsECJoFT48nb59sefqonVa0HKcp5yjm3BLKxbIRjiMnUPs7H1mm6p9yS40
         mGs5TuHSQk0+2EWqQgxhONHg2RIMzVaMuJ8psehww6Y2ybtvdBmW4wOKT5t4F0IpK3sg
         vW0w==
X-Gm-Message-State: AOJu0Ywg52QWwOQA21CpvJ3fucRQFx5mXwlly5mF0QiAPoMLrhVyepCm
	qTeWFJiP43xghFeke/+JihgWzv7NK50UG9gKuX3tIK9sjazmdEs0K3ia70rA
X-Google-Smtp-Source: AGHT+IE/kpClCuDZmoopD0VQQtvOTz5R6LleXkWCisL37hDzkI4EPNuLnbm/Xm6LA0M+NTfIt439FQ==
X-Received: by 2002:a05:6402:1ecf:b0:5c4:2ca6:5499 with SMTP id 4fb4d7f45d1cf-5c720629c5emr568549a12.20.1727219131517;
        Tue, 24 Sep 2024 16:05:31 -0700 (PDT)
Received: from acert-swift3.. ([2a02:810d:600:2744:7bc8:c715:17d:4d03])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c5cf4d75cdsm1291721a12.81.2024.09.24.16.05.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Sep 2024 16:05:31 -0700 (PDT)
From: Aleksandar Nikolic <aleksandar.nikolic010@gmail.com>
X-Google-Original-From: Aleksandar Nikolic <an010@live.com>
To: openembedded-core@lists.openembedded.org
Cc: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [kirkstone][PATCH 2/4] install-buildtools: remove md5 checksum validation
Date: Wed, 25 Sep 2024 01:05:15 +0200
Message-ID: <20240924230517.19994-2-an010@live.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240924230517.19994-1-an010@live.com>
References: <20240924230517.19994-1-an010@live.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Sep 2024 23:05:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204885

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


