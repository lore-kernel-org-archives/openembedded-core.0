Return-Path: <aleksandar.nikolic010@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41E86CF9C73
	for <webhook@archiver.kernel.org>; Mon, 23 Sep 2024 09:00:22 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web11.32267.1727082015475884301
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Sep 2024 02:00:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bWJEYBj4;
 spf=pass (domain: gmail.com, ip: 209.85.208.51, mailfrom: aleksandar.nikolic010@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5c275491c61so5529087a12.0
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Sep 2024 02:00:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727082014; x=1727686814; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j0HvZYjSU43OO9xyBp7+51L6f+4pKjvda4RrKq/6aiA=;
        b=bWJEYBj4FZF2qArxkSpjj3rudQXyc9G3H6CQzgzFpXfVp6Qmx3dHuNpRI5pYVF2pLS
         bXKpKKSkrXhFuU55kGBrSmvnNrdha8348Pqz48R13xCqj+MchNuqIQAiN2HWyoWaDkN2
         TqeqT9uqtQUxx2Nl8NbL8OGQdaE067zY3tGawm5U5jG/A0PwhGgTxWTtZO7uysZLHPIZ
         eHd+kiFSk0eJxG2Zx/0LGMlfjy6D30CJrQv3EX9T1APx9AEEXDYtNv0XyxxAqj4DYXfS
         WkiGOabz4fRfJxC8k7Z62SqmDmceQVQHlWnCMgNJ3BeQZhKM2zyiyCZa89qW0exumvJD
         u87A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727082014; x=1727686814;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j0HvZYjSU43OO9xyBp7+51L6f+4pKjvda4RrKq/6aiA=;
        b=iEfVgX91mtspANAgegoF4vYhPY7hS/tEaH6Z5Y+hf4AUReNfyZ4dbhXWsUqsYvuXpi
         FuL9QvxZRG50xaTXe+XOa6j60t6j8TrJA4mhr+Rn5to6vBQHjMYnutyl+eYd1QXMNXpL
         tTO17K1be7EJl8vPe6X2qfVWOzsKebq+QamMhrd4TLDH0enr73sy9FvqzWgY0hHmUZBP
         VWyaLphAfXOH5cDH91pYHWIo8xWKmTLTvx2FcoF6pGrVmOx0ZVQ3CmVatOGUXFhIxTdm
         BlH0bRCyb65/t4Z3M6SLfLQ1zotSQVDDdUoywannHNVt1xCA45GzuiDUnvlDBZIUttvl
         gBVA==
X-Gm-Message-State: AOJu0YwJ/bWZtUXpK2utudaDy2hR9rI4JlsCw4yfDXmN8Fjs27JnOEUR
	lesjoQSG6W2vm0h5jGZJWjfXuav9Y5eODjpoH9kXTOkyIC1HLG0Uc2sRm1F2HeQ=
X-Google-Smtp-Source: AGHT+IFMDJH/mX9c90nGNWRRmMbc5Qk1wJ2+kdAVTfEtkWiYGqMF1gXcX778WKxKK9nTw7hYYaC9kg==
X-Received: by 2002:a05:6402:3481:b0:5c4:62b7:a2e3 with SMTP id 4fb4d7f45d1cf-5c464d76403mr11768557a12.0.1727082013594;
        Mon, 23 Sep 2024 02:00:13 -0700 (PDT)
Received: from an.. ([2a02:810d:600:2744:e855:ba31:e4ab:c4bc])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c42bb94a01sm9872262a12.91.2024.09.23.02.00.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Sep 2024 02:00:13 -0700 (PDT)
From: Aleksandar Nikolic <aleksandar.nikolic010@gmail.com>
X-Google-Original-From: Aleksandar Nikolic <an010@live.com>
To: openembedded-core@lists.openembedded.org
Cc: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [PATCH 2/4] install-buildtools: remove md5 checksum validation
Date: Mon, 23 Sep 2024 10:59:46 +0200
Message-Id: <20240923085948.49447-2-an010@live.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240923085948.49447-1-an010@live.com>
References: <20240923085948.49447-1-an010@live.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Sep 2024 09:00:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204797

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


