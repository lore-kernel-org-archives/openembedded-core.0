Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAD5DC54798
	for <webhook@archiver.kernel.org>; Tue, 27 Feb 2024 18:44:47 +0000 (UTC)
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
 by mx.groups.io with SMTP id smtpd.web11.2059.1709059483047103739
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Feb 2024 10:44:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=FtUP5hNU;
 spf=pass (domain: baylibre.com, ip: 209.85.210.42, mailfrom: tgamblin@baylibre.com)
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-6e4a803c72aso848605a34.3
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Feb 2024 10:44:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1709059482; x=1709664282; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=K9CZ9RBkpqRSqWL4PiRwwfMARSQZoRDtfY2TxjiYyM4=;
        b=FtUP5hNUppusclk6spW3hXJpKI4pV/eh0ATqrDsNG/2cmtwu+qM3qvFWOVwZi2PRP9
         eh9bScY46G+/WYRKUpO6Tv/Jp/Tn2bhQbJh8Lu8DXbKoj7hcW+rv1eit1D0XpflcFzF0
         jfqSlJWwzrlwOa+nGJYfhlOV3NqGdNew00RpkgBhhB429g7CDR5Bk5VQB1Y8KfjLY4sM
         rIAeEOEkkxmOl6aIhQlancg9lySdSBjBRlcfa09xcnyDlkbGJWB58j+zBxQG9z51CN2H
         MUVPzo2Tr3ABZb+l+lBEWQRN5+CHZlerjoJ9aJDdIKFYz6w5KyjwxzzTK8fv0I3X6pQ1
         Ia4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709059482; x=1709664282;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K9CZ9RBkpqRSqWL4PiRwwfMARSQZoRDtfY2TxjiYyM4=;
        b=wT+l7WQgSbh0v448crl4n6DYmDm8x6MEpE8pf+ZuW5+RkM5fyiZunpBHthbDHREDv4
         dAjgnXVYlO0+QB2kzbxvrzh4gqQOAuiJeyolqE8p7LUQnnFiWWEpWNYn07NEaEBKvyzI
         xvzRF/wBnwVbM/FKejhx191WhWW/L5c16RQYPxPUOIFmtre7NGH6e5+fbl1vSn1c647q
         kgTiYjCj1T3g+Ikpk1ll//oTPYq4m4VsgZrvOFuuppATOG/0GNOS43M3lqArvli75Zdb
         Uhs2koFYg7I0hrnv+4B8z67HgK7n5pERBQGbq06hXdlJlVf5jWCfRjsJsXKsckRkxSsz
         N1kQ==
X-Gm-Message-State: AOJu0YzQCAlWVzn7Egbix9PM4jhntDpgs8W7H4QYgWg1e1BZehWmqedW
	FGywBl66Y5d7jMPkFM/LHK+/SnmTCgO9BjOO/0V1DMdChhltVbMWP+rmBY7NImT7j4lWo0gNv4s
	/
X-Google-Smtp-Source: AGHT+IHQMsumLHFPpFAWH3hqxtg1RWP4LlRS5k6x0XV4Dt+r6A1P+cEZuV5PHSBiFuvdstD6tVaJKg==
X-Received: by 2002:a05:6358:6495:b0:179:c8c:98db with SMTP id g21-20020a056358649500b001790c8c98dbmr13989632rwh.18.1709059482019;
        Tue, 27 Feb 2024 10:44:42 -0800 (PST)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id qh27-20020a0562144c1b00b0068fb940bc92sm4342991qvb.144.2024.02.27.10.44.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Feb 2024 10:44:41 -0800 (PST)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] python3-git: upgrade 3.1.41 -> 3.1.42
Date: Tue, 27 Feb 2024 13:44:40 -0500
Message-ID: <20240227184440.2929043-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.43.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Feb 2024 18:44:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196289

This release contains bugfixes, documentation updates, and changes to
metadata for build and CI.

Changelog: https://github.com/gitpython-developers/GitPython/releases/tag/3.1.42

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 .../python/{python3-git_3.1.41.bb => python3-git_3.1.42.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-git_3.1.41.bb => python3-git_3.1.42.bb} (92%)

diff --git a/meta/recipes-devtools/python/python3-git_3.1.41.bb b/meta/recipes-devtools/python/python3-git_3.1.42.bb
similarity index 92%
rename from meta/recipes-devtools/python/python3-git_3.1.41.bb
rename to meta/recipes-devtools/python/python3-git_3.1.42.bb
index dd0440fe59e..19885a58c74 100644
--- a/meta/recipes-devtools/python/python3-git_3.1.41.bb
+++ b/meta/recipes-devtools/python/python3-git_3.1.42.bb
@@ -12,7 +12,7 @@ PYPI_PACKAGE = "GitPython"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "ed66e624884f76df22c8e16066d567aaa5a37d5b5fa19db2c6df6f7156db9048"
+SRC_URI[sha256sum] = "2d99869e0fef71a73cbd242528105af1d6c1b108c60dfabd994bf292f76c3ceb"
 
 DEPENDS += " python3-gitdb"
 
-- 
2.43.2


