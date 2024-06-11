Return-Path: <aleksandar.nikolic010@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87AB6C27C65
	for <webhook@archiver.kernel.org>; Tue, 11 Jun 2024 09:26:25 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web10.5215.1718097975952478763
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jun 2024 02:26:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aW41s/XY;
 spf=pass (domain: gmail.com, ip: 209.85.218.53, mailfrom: aleksandar.nikolic010@gmail.com)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a6ef46d25efso421235466b.0
        for <openembedded-core@lists.openembedded.org>; Tue, 11 Jun 2024 02:26:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718097974; x=1718702774; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4qKHPr/6pcE0tRSzLUMIMF7kj0beWPvpDOfVwGlC4ys=;
        b=aW41s/XYKhoS8Yhampl5Xrp3Na2Y7lWKYmKkfvdyXw0Fdg0YyZse2R/MIqzKE7sqiP
         nmlV6f4ezTNxvbKpQ+GxCJWu3TtOewNc3xrAEnk+1bCYe2U29ABB+27R3birA0mUb0Dy
         TbPAUpOKHia5sPIGxcpxxqh9VDzFSR7h1U2FbSXGajXYnNK1l14kSOTart9acwWFhnbk
         ROpSJUJSuoEGhA0sMkefGtxYX5R2pq1xx51NcJJu9QGwCAaF0NgBY2uUh7KU8Bk74AOg
         mraZnA18bqZDLXkaGXo1FEFXZPNhlVCERvLmrl777ysw0XvrihbsW3vLIOQNTpBWfjMH
         ShIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718097974; x=1718702774;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4qKHPr/6pcE0tRSzLUMIMF7kj0beWPvpDOfVwGlC4ys=;
        b=pESDzcpgUoNwa5pzMFDBovhK4AMf8CfCUdkgVx9Odo4UCk+6PBzFzLkR3wDXT7GU29
         lXGjAQuiKzR+3ZctaRQYc3Cgaf4yPfysdPq+5IFA8iWCFZBhJfgxYgSoT7xWxgiDT+Gk
         4vA3dOHP4aheG0pdTzXevGf9T48wQy7e1YvWWrfMVDb6831axaXJXypt3ft3solgM9Xz
         06Mr4R1zoFcJXy0J6H8tAFIOslOFgJLmLmRfpR/RW3P29kzy/PKjP1rQJdj/JtxDNq1w
         cclcaShjJMqYXhDJQpxxyZPiRYYyO7h13jR9fJEp5ZsWFbtKYeBnq5krtHyKFPLwDOz7
         2Hrw==
X-Gm-Message-State: AOJu0YwR2lvdACx5cxxAUbNg030sHkarM9MYTLBuoJBND89XelIKiBXq
	a+/Vdwr2FjVQs8bqzAdN9n+oP71STd0IDMCY+A5Dj2z6+6ldpIFi+J1VeHJMiK8=
X-Google-Smtp-Source: AGHT+IHOTQkTc9Z9yBdSu3/IstJBZCXdaay8gJph/iY+2wdn4pSzsriqx6z0HcvuVsqLkKXoU08A9g==
X-Received: by 2002:a17:907:9862:b0:a6e:fa35:8d44 with SMTP id a640c23a62f3a-a6efa358effmr538423166b.75.1718097974073;
        Tue, 11 Jun 2024 02:26:14 -0700 (PDT)
Received: from an.. ([2a02:810d:640:170::d5f])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6e23c9f22asm570173966b.171.2024.06.11.02.26.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jun 2024 02:26:13 -0700 (PDT)
From: Aleksandar Nikolic <aleksandar.nikolic010@gmail.com>
X-Google-Original-From: Aleksandar Nikolic <an010@live.com>
To: openembedded-core@lists.openembedded.org
Cc: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>
Subject: [PATCH 1/3] install-buildtools: remove md5 checksum validation
Date: Tue, 11 Jun 2024 11:25:56 +0200
Message-Id: <20240611092558.513238-2-an010@live.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240611092558.513238-1-an010@live.com>
References: <20240611092558.513238-1-an010@live.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Jun 2024 09:26:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200498

From: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>

No need to validate with the md5 checksum, as the file is not even
uploaded to the Yocto release webpage (the download never failed due
to a wrong indentation of an else statement). For validation purposes,
use the sha256 checksum only.

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


