Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22C4ECDB474
	for <webhook@archiver.kernel.org>; Fri, 20 Oct 2023 14:42:09 +0000 (UTC)
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50])
 by mx.groups.io with SMTP id smtpd.web10.56029.1697812925459619779
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Oct 2023 07:42:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=ukcAIOxh;
 spf=pass (domain: baylibre.com, ip: 209.85.222.50, mailfrom: tgamblin@baylibre.com)
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-7b6e1770519so333101241.2
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Oct 2023 07:42:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1697812924; x=1698417724; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=AGRw1aJASGmcvGMA//Is+5wzXF1FZetRiA8lsYjKgNU=;
        b=ukcAIOxhWoTA6cTL37lnhG1dSUd3J9W47SoeyOHkVN5+y9+oNQX7+0yAdy/GGQZc58
         1XrwAEwTRSL66dEdXSBjoibyskjnZogVpfMPlQpD1v6MvDVwUnpfGUM3vNnQNThE8xev
         +tt5D9nyfqdl5E2gmFcBt1/6iomAhrGBb+BzAcFCxFWVklo0RzgoA7xlB64FOK4QR/op
         9dv4d3fhb5oKD0ksV+gS7oihJkB9CDBiu2wWb529ac8hT34glcCAIyAbGwFpWMIdk8Iw
         5/fmkjItJtvgsk8IP111/wxiGEmdmfNQ+x7iIc9XacyqaT2op/SGrIzV8OHGdvyO8ZIY
         TdXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697812924; x=1698417724;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AGRw1aJASGmcvGMA//Is+5wzXF1FZetRiA8lsYjKgNU=;
        b=GXjlcrkFkEIuzJc43MXX7YSqxiFLgD9Zt6uXo7gHdoE0OmtbKuaQ9qh0NfSSs8Dvao
         h/cEutWBVp0az6Nu43PJRQDFJpYe6qq1uCNQmgkt2gETYpL13LyRga5ugotzjv3R4egP
         I12yOAJVpTkmrj3w0Fs/dhUF2wTqJ8wLPLTQ4pOLXpsMwptYk/KhVUhm5YfKYjlXsmVb
         A/wpQMqKSZaaPcKa9T9XRWsXtCciQmUxxvY+rF6HcJeSTK0SFOBu50xhifA2FkAup48V
         d12Apcjx4JuzY62m/9ewQBSxkJHc4Zdmv3Z3b/vIcwL8hlGVw0zbQmnrenoG04/oikBQ
         7oPw==
X-Gm-Message-State: AOJu0YygT880iGZ8y74g1hpx2SXC5yBoEwuaYXU0oMck5bW2TU1wItrF
	1+UDPh4vc0XlW3GktF/t4AW+NNmZ7hG16Cl7Xcpung==
X-Google-Smtp-Source: AGHT+IELiUllPX7YYBZILVfCPBEz5Xu6XMn8dlk2q8wGsIG6unW5lsyOJaFxQj2NjkEOejvKrXrlQg==
X-Received: by 2002:a1f:2906:0:b0:496:1f95:209a with SMTP id p6-20020a1f2906000000b004961f95209amr1680229vkp.15.1697812924275;
        Fri, 20 Oct 2023 07:42:04 -0700 (PDT)
Received: from megalith.cgocable.net ([2001:1970:5b1f:ab00:fc4e:ec42:7e5d:48dd])
        by smtp.gmail.com with ESMTPSA id fu8-20020a05622a5d8800b004181138e0c0sm642838qtb.31.2023.10.20.07.42.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Oct 2023 07:42:03 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] patchtest: fix lic_files_chksum test regex
Date: Fri, 20 Oct 2023 10:42:02 -0400
Message-ID: <20231020144202.9149-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Oct 2023 14:42:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189542

the test_lic_files_chksum_modified_not_mentioned test in patchtest
wasn't picking up on 'License-Update:' tags correctly. Use pyparsing's
AtLineStart class to simplify the regex setup and search.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 meta/lib/patchtest/tests/test_metadata_lic_files_chksum.py | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta/lib/patchtest/tests/test_metadata_lic_files_chksum.py b/meta/lib/patchtest/tests/test_metadata_lic_files_chksum.py
index cb3e7c9d341..fa4a28c7b22 100644
--- a/meta/lib/patchtest/tests/test_metadata_lic_files_chksum.py
+++ b/meta/lib/patchtest/tests/test_metadata_lic_files_chksum.py
@@ -12,8 +12,7 @@ class LicFilesChkSum(base.Metadata):
     metadata = 'LIC_FILES_CHKSUM'
     license  = 'LICENSE'
     closed   = 'CLOSED'
-    lictag   = 'License-Update'
-    lictag_re  = pyparsing.Regex("^%s:" % lictag)
+    lictag_re  = pyparsing.AtLineStart("License-Update:")
 
     def test_lic_files_chksum_presence(self):
         if not self.added:
@@ -71,5 +70,5 @@ class LicFilesChkSum(base.Metadata):
                     if self.lictag_re.search_string(commit.commit_message):
                        break
                 else:
-                    self.fail('LIC_FILES_CHKSUM changed on target %s but there is no "%s" tag in commit message. Include it with a brief description' % (pn, self.lictag),
+                    self.fail('LIC_FILES_CHKSUM changed on target %s but there is no "License-Update:" tag in commit message. Include it with a brief description' % pn,
                               data=[('Current checksum', pretest), ('New checksum', test)])
-- 
2.41.0


