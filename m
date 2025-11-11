Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FC72CCFA1E
	for <webhook@archiver.kernel.org>; Tue, 11 Nov 2025 14:59:19 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19454.1762873151399694396
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Nov 2025 06:59:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=TwafW1x7;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.51, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-343514c7854so959998a91.1
        for <openembedded-core@lists.openembedded.org>; Tue, 11 Nov 2025 06:59:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1762873151; x=1763477951; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XLQAo2ohzlc2vlEzyyb6Rmi7iUywz98niE6EVPbE2xY=;
        b=TwafW1x7BmyVZZgULJ5Fz1LD0dYq6LNSRe7xOB5hSKeCHJfNCNztTfB9tyrI+m8iaM
         rBAzfNRKsHWHfPsq+XVaR5FltPm4lm92u+QT96rJSQbknEmWuJNzRTeCXwXAiRDDEzVF
         ZtimAK3GHNGFZSjOzrYMsmtEo2kNr7CI+tOwGjyD1PgXsrUyojcuf3PjwzbirKQUH4xX
         h986NSavMCsPanBNU8PFoYz1nO8A0f3zdnbD10CgiOoClARtsgm08AVjBBiYq64/4l+w
         WLvcOxJ+jjADJ2KU/wRoQe+++/tsWRXvf24xdUifWxxbKZHXO8SeXsNFcH3AqQ7GqRNM
         tOEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762873151; x=1763477951;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XLQAo2ohzlc2vlEzyyb6Rmi7iUywz98niE6EVPbE2xY=;
        b=IiczznLGFWUpaqH4HY2vmBRUaxcpqTBB+OlE6sBssEf/AaAXH2Nn/3Wxp8vPxhRpgn
         tN2ETKW69p3GCf2OWKYIsueSVgixy71IEyg7KCWhy+wVYq5B1BSps22K0lQnSeugQZJ/
         akYOPhq/G9TarmcJgIx6uExC7DjVgp67BRnIQzrvmFjnbpiX0CK3u9ZyV1MLyy5TJVAT
         dbsLn/iWqcGU1u9os3Co82FoL2VjWaga0uNqYRpX+KiBubin//ijs1QeBf0yXICnfWqX
         2vvttEOTESIo6UtK8EbeRCgMl5ryZkKh9253Uf9OaBrG4aP2a/KwVeYToC+gACcN2Sa3
         dSZg==
X-Gm-Message-State: AOJu0YxntD0oLrajLvezc/uYaqVdRhrbfiz55I2sItZQOMbWWM4bAYno
	fxFKVK3czdPu4g30Z0uYP8gKqB2PAMyh0c3R146JwgwpRrdO/NIHJ0zy4dciAyuWLj4cO6YLJny
	xPFtCBmQ=
X-Gm-Gg: ASbGncu/38Oh7zZhm/FJqji58IJPUc/H84JBTh2q/lLqn+aOqwIPmWr2nHRNXVkHyrD
	zKA8/wZXAk3r9Q8WDoJevNnfksz1rpoSiGK7rxr74GMvsSTx1ioIuoCzUgaE+RI1DxRYTCHOATD
	kqTJeRCHQGOcKj5EZS887p80bzduMBuwzQxmv+QaG8ZjmnrD0/Y0kiGALzsdpMNJcacxNQAxgIZ
	/bt6+Rblo+7BPgi2MpjXLtvlHsP9eUy8HKkALWeCHwkxD2NBy7AnbkKiLuombaKumauv8GL1TGE
	BrXzLq3bNPLKuvPzD+zBZ3Q1ndkQoAtTrxJribix41Ifd20fRal1qOPpSTBXGdTrseDo7lHjnF9
	4j5afYMx/RstGV2K8RI312w75iDVAed3peZ6GCPdE2vEj9C1Xau4aXR3yiho6h0SaAmU2JnVhw0
	vTAw==
X-Google-Smtp-Source: AGHT+IFflO0uEpP1NKfkPPuhBdzBSSTfQLFrYZYMttlF6StfZUYO8x33PRPXEHE9llVl4r0Ca//0NQ==
X-Received: by 2002:a17:90b:164b:b0:32e:4716:d551 with SMTP id 98e67ed59e1d1-343bf0dd604mr4505929a91.6.1762873150668;
        Tue, 11 Nov 2025 06:59:10 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:db6b:ed5a:7890:6b41])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-343685301f8sm11662588a91.5.2025.11.11.06.59.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 06:59:10 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 18/19] oeqa/selftest/devtool: Update after upstream repo changes
Date: Tue, 11 Nov 2025 06:58:26 -0800
Message-ID: <1e0a64a1890a62e130595f46d93c8d08af9170f5.1762872962.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1762872962.git.steve@sakoman.com>
References: <cover.1762872962.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Nov 2025 14:59:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226183

From: Richard Purdie <richard.purdie@linuxfoundation.org>

The upstream changed the branch name, moving to archive/ so we need to
update too. Take the opportunity to match the new location too to avoid
the redirect.

We could use a different branch but upstream would probably eventually
rename that too so this may last longer.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 478a645bad150f04dee1b0085c4542c2eefe7007)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/selftest/cases/devtool.py | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index ee75687f01..55048830bf 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -476,8 +476,8 @@ class DevtoolAddTests(DevtoolBase):
         version = 'v3.1.0'
         pn = 'mbedtls'
         # this will trigger reformat_git_uri with branch parameter in url
-        git_url = "'git://git@github.com/ARMmbed/mbedtls.git;branch=mbedtls-2.28;protocol=https'"
-        resulting_src_uri = "git://git@github.com/ARMmbed/mbedtls.git;branch=mbedtls-2.28;protocol=https"
+        git_url = "'git://git@github.com/Mbed-TLS/mbedtls.git;branch=archive/mbedtls-2.28;protocol=https'"
+        resulting_src_uri = "git://git@github.com/Mbed-TLS/mbedtls.git;branch=archive/mbedtls-2.28;protocol=https"
         self._test_devtool_add_git_url(git_url, version, pn, resulting_src_uri)
 
     def test_devtool_add_git_style2(self):
@@ -485,8 +485,8 @@ class DevtoolAddTests(DevtoolBase):
         srcrev = 'v3.1.0'
         pn = 'mbedtls'
         # this will trigger reformat_git_uri with branch parameter in url
-        git_url = "'git://git@github.com/ARMmbed/mbedtls.git;protocol=https'"
-        resulting_src_uri = "git://git@github.com/ARMmbed/mbedtls.git;protocol=https;branch=master"
+        git_url = "'git://git@github.com/Mbed-TLS/mbedtls.git;protocol=https'"
+        resulting_src_uri = "git://git@github.com/Mbed-TLS/mbedtls.git;protocol=https;branch=master"
         self._test_devtool_add_git_url(git_url, version, pn, resulting_src_uri, srcrev)
 
     def test_devtool_add_library(self):
-- 
2.43.0


