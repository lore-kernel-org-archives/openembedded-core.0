Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30D04C3DA49
	for <webhook@archiver.kernel.org>; Thu, 11 Jul 2024 16:08:28 +0000 (UTC)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
 by mx.groups.io with SMTP id smtpd.web10.68.1720714099147181756
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Jul 2024 09:08:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=h+R12fBl;
 spf=pass (domain: baylibre.com, ip: 209.85.219.50, mailfrom: tgamblin@baylibre.com)
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-6b2c95b6c5aso5646206d6.2
        for <openembedded-core@lists.openembedded.org>; Thu, 11 Jul 2024 09:08:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1720714098; x=1721318898; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xIodLLoTq3tbPCZNbp+hp8d3WtxpU3IRzrxdk4s7X1k=;
        b=h+R12fBlsZjjheBoE1czbJP7focfkrR0YcFrFD60UL37L+sEMBn3CJFSo8LRN+BEM9
         2q6+jChgGuiNUzokA/unnojY71jap3LGHQWgp7K54gxSrHFV4BeQufl2Rzeoqb/bIk9e
         1zqbeClvdjXZ4cYfcx9ycN/EH8XbqsaLYi65/+r7rQgtpAVuMrKCaEhXeGiNI7ujJYXi
         GMz6tbaFcF2CahLf+DAi6MhUOLeOQ1zDolaWATqJ+NZfj0FnVtyjA7ewGsu2tLzWkP0O
         GZYnLKV0aczxfogJuvZBzTYJqkI0bXWuFvdBjR7qg0+4fSTo/7ejQqegkso2KcnfyAyw
         zJuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720714098; x=1721318898;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xIodLLoTq3tbPCZNbp+hp8d3WtxpU3IRzrxdk4s7X1k=;
        b=FsNkkzr9Cmmdv8+dCrwKe+IzCXdEP2i0+OJbRbVbXqC5snsCMI2rgxXje1tUjVkWbS
         RLBuvcb6iAtM2OY9lzQZG/CiQu+/NA8ucfXX3tk4FZkpoY8WqTpwuFGdOmcnmK1Pvp+H
         91LDRBGTUAz3LjK2sGHtl1VxBhjorS+ECa9e+cmBYXlOob6fQBEMPL+6ML98G69As4x4
         bMeU5xGWOEKmyZeEj99y2FAi6FUZeR88bso542Q6hGqOAzrR9vngL30Dh8DDsVGsnKqy
         6zQg1cMLvF7wBHy+Dh8YY+b4Dq4NYA6lwI3mqMC7sXLRJEqCwEB2vtgo4G+Ijuivdvyy
         6jog==
X-Gm-Message-State: AOJu0YzhKFJjKFKWJyXpXNb9fZDfi4KERMTq01DDJMygfm4n5k6UvluW
	pIspaZgoUxkkMKmpmckF69/X6+YAgzMA2onr1XmfU40HfZUFyjsxWEAyIr7NnZHmUOsP3xo5g/H
	o
X-Google-Smtp-Source: AGHT+IHs3k9KyySdV8KU33/kzkXqv5SNm2gbBj5H3yVwDbkZgwH3+pi4fdxhqY5GpD8TxEWt5GJi8g==
X-Received: by 2002:ad4:5bc7:0:b0:6b4:e2e6:bd30 with SMTP id 6a1803df08f44-6b61c1fd4e4mr120738236d6.62.1720714098019;
        Thu, 11 Jul 2024 09:08:18 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6b61ba06d79sm26469706d6.66.2024.07.11.09.08.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jul 2024 09:08:17 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: tim.orling@konsulko.com
Subject: [OE-core][PATCH] python3-pytest-subtests: upgrade 0.12.1 -> 0.13.0
Date: Thu, 11 Jul 2024 12:08:16 -0400
Message-ID: <20240711160816.52522-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Jul 2024 16:08:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201783

Changelog (https://github.com/pytest-dev/pytest-subtests/blob/main/CHANGELOG.rst):

- Dropped support for EOL Python 3.7.
- Added support for -x/--exitfirst (#134).
- Hide the traceback inside the SubTests.test() method (#131).

The tarball changed to use an underscore instead of a dash, so use
PYPI_PACKAGE to account for it.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 ...t-subtests_0.12.1.bb => python3-pytest-subtests_0.13.0.bb} | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pytest-subtests_0.12.1.bb => python3-pytest-subtests_0.13.0.bb} (82%)

diff --git a/meta/recipes-devtools/python/python3-pytest-subtests_0.12.1.bb b/meta/recipes-devtools/python/python3-pytest-subtests_0.13.0.bb
similarity index 82%
rename from meta/recipes-devtools/python/python3-pytest-subtests_0.12.1.bb
rename to meta/recipes-devtools/python/python3-pytest-subtests_0.13.0.bb
index 0590be705f..7fe074425f 100644
--- a/meta/recipes-devtools/python/python3-pytest-subtests_0.12.1.bb
+++ b/meta/recipes-devtools/python/python3-pytest-subtests_0.13.0.bb
@@ -7,7 +7,9 @@ BUGTRACKER = "https://github.com/pytest-dev/pytest-subtests/issues"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=242b4e17fa287dcf7aef372f6bc3dcb1"
 
-SRC_URI[sha256sum] = "d6605dcb88647e0b7c1889d027f8ef1c17d7a2c60927ebfdc09c7b0d8120476d"
+SRC_URI[sha256sum] = "9e02b9d243c0379b02abf3e0887da122bcb2714b021c3608a37f17ce210adce5"
+
+PYPI_PACKAGE = "pytest_subtests"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.45.2


