Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95C68C25B7C
	for <webhook@archiver.kernel.org>; Mon, 20 May 2024 13:34:06 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web11.61061.1716212041083107691
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 May 2024 06:34:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=u7tf0w8p;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.180, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1ee954e0aa6so42631955ad.3
        for <openembedded-core@lists.openembedded.org>; Mon, 20 May 2024 06:34:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1716212040; x=1716816840; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MNGaTG3nk1BYo16nsp/zbtrOZXBF3+o/hhMX5XVeBKM=;
        b=u7tf0w8p5zIUiG0i6L4thVCZmgpTL6jFo1/knYBg7bZXtGqGe3kmQkQc7mMkKbjrRE
         ivwfu+mRwG9BsHVi2obKv5o6nfseE5t0MNdi9fcPNnpD5YDH039l/5ancNsQGbDaLt9v
         7rfTXKlMVhhgxkiOuXcckijSRo00+nA26mU2AJP2pnFxZee9Vua0cRVjvwBig4KNMlHs
         No5YhHWCEoazbhc7bwGgbj1IO1biYgMGsaWMcKYD7UveV+m3P2nBJ6H78GArZx/WvWpX
         pnfgttf9Mnb33D8HXZOej+stsR7zdh0Dt8yH2XRfOSlne1Ft/o/YdvaEfFCuWPoCeWSH
         t5ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716212040; x=1716816840;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MNGaTG3nk1BYo16nsp/zbtrOZXBF3+o/hhMX5XVeBKM=;
        b=EyfPvtdNr0h3hFis94t0MH24Tdb3Yiz8oKOcNTNpqWsE7ik6BAM1hC9XsB1eShNVmu
         YpTu+eQxXNAdTIhk7t0Z8F2pMUwa0plwu6h+bKghS+Jm9EiLi271KShsswZhSMNpze5w
         gYgARWM+R8xXaGO6z7wiBNINRH2kTnC2RFsC88Pk3hLyWG6lxDHeI0Mc3P/pB9ponBnU
         WmCqTKIDTgz8QzF3QJe+Q6Vz0BUP7H6iTlz/nijLl2X8zx2NJ8eRlouewZ6clxLrjDde
         DL8kazWuQe3jc/kJJg4C/cyEojrAwQdgOBv2jf0SwedxQ3aYFLi9uXH93o4sXgHjUN8Z
         AjFw==
X-Gm-Message-State: AOJu0YykiZkP2D2zPLdQSFh0UK2Xl8gY/z0abRwECLZSHnh5pGxYg2z4
	7hU9iLBKeQaC+wQi0hN6PdjFcTJkSfE/Q/D7oecQTwS+i3pNXuuwCr0YPqh9WtT/uTGjq9xyJcQ
	b
X-Google-Smtp-Source: AGHT+IHIgbF2u9IfasVbnIndgsVevoQjFC63hJY48JXNesZ9GyQt8fdD97PZsb5mfLWfoRsKoiTbAA==
X-Received: by 2002:a05:6a21:9188:b0:1af:f89d:831d with SMTP id adf61e73a8af0-1aff89d8473mr21571039637.24.1716212040255;
        Mon, 20 May 2024 06:34:00 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f4d2a66621sm19671465b3a.13.2024.05.20.06.33.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 May 2024 06:33:59 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 15/21] patchtest: test_metadata: fix invalid escape sequences
Date: Mon, 20 May 2024 06:33:26 -0700
Message-Id: <b5406d3691341c050a62fc9a32dc5573fd0c484f.1716211838.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1716211838.git.steve@sakoman.com>
References: <cover.1716211838.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 May 2024 13:34:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199586

From: Trevor Gamblin <tgamblin@baylibre.com>

Clear up the following warnings seen during patchtest runs:

|/workspace/yocto/poky/meta/lib/patchtest/tests/test_metadata.py:21: SyntaxWarning: invalid escape sequence '\+'
|  add_mark = pyparsing.Regex('\+ ')
|/workspace/yocto/poky/meta/lib/patchtest/tests/test_metadata.py:26: SyntaxWarning: invalid escape sequence '\:'
|  git_regex = pyparsing.Regex('^git\:\/\/.*')

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 2d64317835a768898aac592b24fcbdfaf6c8357a)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/patchtest/tests/test_metadata.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/patchtest/tests/test_metadata.py b/meta/lib/patchtest/tests/test_metadata.py
index be609dbd04..f5dbcf01ed 100644
--- a/meta/lib/patchtest/tests/test_metadata.py
+++ b/meta/lib/patchtest/tests/test_metadata.py
@@ -18,12 +18,12 @@ class TestMetadata(base.Metadata):
     lictag_re  = pyparsing.AtLineStart("License-Update:")
     lic_chksum_added = pyparsing.AtLineStart("+" + metadata_chksum)
     lic_chksum_removed = pyparsing.AtLineStart("-" + metadata_chksum)
-    add_mark = pyparsing.Regex('\+ ')
+    add_mark = pyparsing.Regex('\\+ ')
     max_length = 200
     metadata_src_uri  = 'SRC_URI'
     md5sum    = 'md5sum'
     sha256sum = 'sha256sum'
-    git_regex = pyparsing.Regex('^git\:\/\/.*')
+    git_regex = pyparsing.Regex('^git\\:\\/\\/.*')
     metadata_summary = 'SUMMARY'
     cve_check_ignore_var = 'CVE_CHECK_IGNORE'
     cve_status_var = 'CVE_STATUS'
-- 
2.34.1


