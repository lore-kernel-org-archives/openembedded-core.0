Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F29B3C77B7F
	for <webhook@archiver.kernel.org>; Tue, 24 Jun 2025 23:14:25 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web10.2785.1750806856850815808
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Jun 2025 16:14:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=I/a/NHqQ;
 spf=pass (domain: konsulko.com, ip: 209.85.216.50, mailfrom: tim.orling@konsulko.com)
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-313bb9b2f5bso1218810a91.3
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Jun 2025 16:14:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1750806856; x=1751411656; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tF8SdsUYFgAFQvHfbikMT2UYoZ/8nDlBxfyBYX6K+OQ=;
        b=I/a/NHqQ2c3BAo6mtbRK0Cr8smnVjwtD7MRE+Ca+HXnrZ3ryt7ne9L41wKOXsHCYhd
         PYDDbw+Wki43Qpx5wclrK8bjGilr87MTkE5JhVW6ALCwzOPCKx4q/u9brokgzruBaEOk
         hrzQTkuT8QqFOXhXvDGMPkzfmMtfyf+2Eo5FY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750806856; x=1751411656;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tF8SdsUYFgAFQvHfbikMT2UYoZ/8nDlBxfyBYX6K+OQ=;
        b=tqkKLcoRzScO59DYY76aDZa/RKoR0boTG+3gC3cPw+i0B2HeuNDmBmJiv8w+gpTLlL
         nUu5G+qwyeIYyg9KEsirmemgDCAHnKP65uR4+N3I/N65Oquj+r0gbCLsPrVMqUbJmzNN
         GTfaMwZHUKuSky3SyIgWR6k5fKhNFTtharR5Hp8lHGQeY7TIENjScg+AOLut9n/kJEDr
         ysHcDuA55PKUMsJ4IB3xescwzl7FUvlVTO/iveMbCuZv5y/YOzSaoI9BInuM3lIl+sGS
         Anips98lUF+c8tqb0LTsMvkBC9NGaQVtWqLCDZkgK78VJhM9Mkf6gRM+hyRXjF1hEVAj
         oorA==
X-Gm-Message-State: AOJu0YymprbpMbAb4YgexerMA5UWQJQDCzi5rVHOCKMvscH37lyzN8ya
	KHd2xXQcLJaSN59w503hxjsSuHytxTbaFR8TxYkSmkfd+bs+rhKcgzQbU0HjAH1Jbm+MnFEt+50
	RgFwuP/o=
X-Gm-Gg: ASbGncs2KR+haIjVic9PWVoM74/Mps2bvXYDuk1LVGDeJuQ4/TlXgpMFk/6vORQo0ND
	hVHH22uvfXuvlbYHma7CFphg/hgIX3vkxiW7K3N4zXyH7zkegKl9UL6+2XPpHlMuL/PSjt3iU1g
	nl6tDFKTOr15FJtHSgFltTfEo45i9vzsbHokW5MLPTfy+G2tZc6U1zKFh5Yp3/QoECyvnNzyer0
	1clDKqjhztCpn4dn7aquFnMUoTrmTlryEPLDoXDdI8c8YQswh1chKxDsB8L4ClLyJCt6bEcxhkv
	zZs0PPqTda7UwWBI5kbS7yFpzEC0uwluP0EzZu36oqMyuP7INg9W//XR3v+YKI41HTcVIVQVjiG
	LU6950oq8zNTP2vAamKqsjtk85Q==
X-Google-Smtp-Source: AGHT+IHQVIL9gyvMz6H9JdvvqnmSSKuH0oJAEOxrnKWEafSd9UwHp4HsoIyrZULK1XKuCIouvpnQCA==
X-Received: by 2002:a17:90b:278a:b0:313:176b:3d4b with SMTP id 98e67ed59e1d1-315f267140fmr936810a91.22.1750806855814;
        Tue, 24 Jun 2025 16:14:15 -0700 (PDT)
Received: from localhost (c-98-232-159-17.hsd1.or.comcast.net. [98.232.159.17])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-315f53d94b1sm171196a91.33.2025.06.24.16.14.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 16:14:15 -0700 (PDT)
From: tim.orling@konsulko.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 6/6] python3-pytest-subtests: upgrade 0.14.1 -> 0.14.2
Date: Tue, 24 Jun 2025 16:13:56 -0700
Message-ID: <7230cb10625c66e533763cd6d7fbcdc5d2c81be7.1750806216.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1750806216.git.tim.orling@konsulko.com>
References: <cover.1750806216.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Jun 2025 23:14:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219295

From: Tim Orling <tim.orling@konsulko.com>

Highlights from commit logs:
* Bump pypa/gh-action-pypi-publish from 1.12.2 to 1.12.3 (#177)
* Bump hynek/build-and-inspect-python-package from 2.10 to 2.11 (#178)
* Consistently use raw strings for line-matching regexes (#180)
* Ensure advertised pytest 7.4 compatibility (#182)
* Bump pypa/gh-action-pypi-publish from 1.12.3 to 1.12.4 (#185)
* Bump hynek/build-and-inspect-python-package from 2.11 to 2.12 (#186)
* Print output "dots" for successful unittest subtests (#164) (#190)
* Improve reporting in case of xfail (#194)

Comparing changes from 0.14.1 -> 0.14.2:
https://github.com/pytest-dev/pytest-subtests/compare/v0.14.1...v0.14.2

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 ...est-subtests_0.14.1.bb => python3-pytest-subtests_0.14.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pytest-subtests_0.14.1.bb => python3-pytest-subtests_0.14.2.bb} (88%)

diff --git a/meta/recipes-devtools/python/python3-pytest-subtests_0.14.1.bb b/meta/recipes-devtools/python/python3-pytest-subtests_0.14.2.bb
similarity index 88%
rename from meta/recipes-devtools/python/python3-pytest-subtests_0.14.1.bb
rename to meta/recipes-devtools/python/python3-pytest-subtests_0.14.2.bb
index 56cec25b868..58212bfb1cf 100644
--- a/meta/recipes-devtools/python/python3-pytest-subtests_0.14.1.bb
+++ b/meta/recipes-devtools/python/python3-pytest-subtests_0.14.2.bb
@@ -7,7 +7,7 @@ BUGTRACKER = "https://github.com/pytest-dev/pytest-subtests/issues"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=242b4e17fa287dcf7aef372f6bc3dcb1"
 
-SRC_URI[sha256sum] = "350c00adc36c3aff676a66135c81aed9e2182e15f6c3ec8721366918bbbf7580"
+SRC_URI[sha256sum] = "7154a8665fd528ee70a76d00216a44d139dc3c9c83521a0f779f7b0ad4f800de"
 
 PYPI_PACKAGE = "pytest_subtests"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
-- 
2.43.0


