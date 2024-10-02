Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79DE4CF6D36
	for <webhook@archiver.kernel.org>; Wed,  2 Oct 2024 13:13:34 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web11.6946.1727874804768738142
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Oct 2024 06:13:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=lkrg3qng;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.172, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-719b17b2da1so4851543b3a.0
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Oct 2024 06:13:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1727874804; x=1728479604; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NE5nnkkGE3isPPL1AGYf2NeCspXqIOIVa7C39PmrRKk=;
        b=lkrg3qngaczGsOmgQnl7nXGA2RzCk3jeb1WTl84t3J1HtljAJRXkGhS+CbB7pWWsCV
         jgdOoJfTH1WmfCUBndKZvmKn3L+TgZi+ilRVqV0hugL/nbuLFZM3hbVcVJblx62/h0fD
         fRh/Q2WNavtZmNrUVQ8/doX4wuaLx8g4rhSRzYSufKehkhcRmWjjZd/9iqRgHJwhLsBL
         DS1xXiGizg/N3cx01vNUjv/Gk2uyHaraVffsmvQzMNzXvzXlTWdTjxYhdHE2Tfmdk1wf
         mSzsZ5MwkAim6QyAWllR5HwTnJYwG6NlbC6hw1AlqNpderlpbl5RinTtnSV6nfOpNxiD
         y1ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727874804; x=1728479604;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NE5nnkkGE3isPPL1AGYf2NeCspXqIOIVa7C39PmrRKk=;
        b=LDWU527ceRr3JRefztW4AFH93JU4uFbWOxwvH2H3OyRhKJwgAe2cKZ9C1sa33bkUbW
         DdnNjvDbQP2LlZ3YIOV8Wha8z+oCPlOb8FzZx/L3lRTo5yaz04GAH93zNekhDLrujurf
         heL/fEjNG1tYpcZ+hDX3HVKlTWyqS8/Ptu6B+0uoF24HNlFBzt/QCTSt15oJLiN442qT
         uSjpcSF3oEA1DfF4pXfENK4+NiUOwNicCECU0lbaivmO06Aze6O49qc509ObjFl1yw69
         dKAKED/BGKKTD+VN9kqi4TGLrqYwDyQgly6cwVQZiSwH3dQ2K3kha50rGlO2l808ONTs
         1rfA==
X-Gm-Message-State: AOJu0YzT33JiwITwAvkB8ynloevUV4QswbIyeSSMdNtFSQQsyBcViL7o
	bBGSYywv0yiJoLDJTk6Nn5I636O4drIUf5YYYtFakicxV9dall7v5N7S5KHt1vGDtmId3b/hTz7
	itSE=
X-Google-Smtp-Source: AGHT+IHSanS0yv5OcJElo+tRAa7ku7hmjJRH9Q/RErv5+X+An8u5DZZsR5NogAqJCCRFhxLZGM8jZA==
X-Received: by 2002:a05:6a00:1829:b0:714:1a7c:b727 with SMTP id d2e1a72fcca58-71dc5c772bbmr5140788b3a.8.1727874803917;
        Wed, 02 Oct 2024 06:13:23 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71b2649c775sm9773436b3a.29.2024.10.02.06.13.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2024 06:13:23 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 12/16] install-buildtools: remove md5 checksum validation
Date: Wed,  2 Oct 2024 06:12:52 -0700
Message-Id: <b331769084996ffeb74007fe6ca7e385edd7a577.1727874367.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1727874367.git.steve@sakoman.com>
References: <cover.1727874367.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Oct 2024 13:13:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205196

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


