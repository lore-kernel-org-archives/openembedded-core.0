Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47D54CF649E
	for <webhook@archiver.kernel.org>; Mon, 30 Sep 2024 01:58:06 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web10.45291.1727661480681544748
 for <openembedded-core@lists.openembedded.org>;
 Sun, 29 Sep 2024 18:58:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=f/SfEsQ/;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.51, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-2e091682cfbso2828366a91.0
        for <openembedded-core@lists.openembedded.org>; Sun, 29 Sep 2024 18:58:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1727661480; x=1728266280; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NE5nnkkGE3isPPL1AGYf2NeCspXqIOIVa7C39PmrRKk=;
        b=f/SfEsQ/qAD2Oj5Oajba49MTfW4L0blvGmdyQ85QS6N+kEIteHDPCyrXPW1KtmhEl7
         rjOihsdoLjr78x77oAINinzYfBbvggodFj7yK5Qd1msjP7ztqED9SOpq8Sv2B8WFMJm0
         gRiUxJEzuIk3m+F4KlQBsl5ELhbsVErGosWIbNiDajlGz6rOimKCMcDA0oTaM3ceutRO
         7Wyb5QfA7BZ3b25xmw8J2gIwkmd69BdIV4jCdxYYEJdwfaOd9RLF9Yq3DdHNnuG5Ik/v
         VxCsO8y+seIWyO75rC0QlJgUEZXU121RbRfAcu0dsWXxGDG7Krz8NXOn2kCHeRBos2OQ
         VTDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727661480; x=1728266280;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NE5nnkkGE3isPPL1AGYf2NeCspXqIOIVa7C39PmrRKk=;
        b=FCLfCkPPYvsxKEy/UGYXVp1ystzgEsNB7sImgzXK2QfkB/kAsGRdPr5AfCyUCaXB38
         9XTkISFQw9gO70gKvo7GJw1e02Qx+gK3O51yDqFq590PwUd5uQIb1D5qg0Iaf+XI+vhe
         jC/qCGO6QWDWeyu/y/orU9F7JVfmOfCjKDdzcm9Brle+WnePo/TzzN4e8ulSr93B+eZx
         7qoIFdlyTYHd3Q4QMEeg8yAJ4Kf3FN928OM4tz+uUjcPXFJDD+2FCM/PQ1dzKhVDBZp5
         Xg0cKP5ZE+HsTh26Nle4YG539SUO+2Gb+NUHSG9GrNz9lISl4q/ZeFmU4B3jmJ097rDN
         1JTg==
X-Gm-Message-State: AOJu0Yz0JRiDHHGPF8KcwqK3JKZ62TAYjcMWRsVq1nnW1JkrZwqj6L1y
	63fl4SlNq+niHGpRDoAO6Uqeydcb/5r6BOdp02Zd7ugeAhen6mNrvVTjpOiKS35fTj0RImqKEF/
	cVLg=
X-Google-Smtp-Source: AGHT+IHhjX4JcsBSy4XBFZ76Y3GG0QZB+pEhtHUi1GsflVlDQjVkeerCAu1FJ/jOER0TMmdYbpIVBg==
X-Received: by 2002:a17:90a:be07:b0:2e0:7e80:2013 with SMTP id 98e67ed59e1d1-2e0b8ec7252mr11950197a91.38.1727661479897;
        Sun, 29 Sep 2024 18:57:59 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e0d4af744bsm5496070a91.23.2024.09.29.18.57.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Sep 2024 18:57:59 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 18/27] install-buildtools: remove md5 checksum validation
Date: Sun, 29 Sep 2024 18:57:13 -0700
Message-Id: <081ac6c177860c1bd7e2d4f4b873f3a760864d21.1727661284.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1727661284.git.steve@sakoman.com>
References: <cover.1727661284.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Sep 2024 01:58:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205080

From: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>

No need to validate with the md5 checksum, as the file is not even
uploaded to the Yocto release webpage (the download never failed due
to a wrong indentation of an else statement). For validation purposes,
use the sha256 checksum only.

Signed-off-by: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b740d2f9d40aef1e18c022d1e82b4fb2c5c1fc22)
Signed-off-by: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.34.1


