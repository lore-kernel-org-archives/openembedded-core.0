Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32715C41513
	for <webhook@archiver.kernel.org>; Thu, 10 Aug 2023 16:05:37 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web11.21291.1691683527817437290
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Aug 2023 09:05:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=hk3N7y4R;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.182, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-686c06b806cso787246b3a.2
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Aug 2023 09:05:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1691683526; x=1692288326;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J+MWT9kPPQXlIOxmhtx79J6lPeZcRWHdzQkZmPZUF2s=;
        b=hk3N7y4RcEv2+wMTMpgwqkna+YzPUbXtGHP87Nx2/oIQ7cESNI8bfvN0vlJgRIBRVB
         le5IzC2gPHOOO1s53PJ7dlR/z7S8OYhhryWQaLZnPyDM9Q2+ALJpJtm02+2VWQLiWvW+
         3VwlhH+7Opt+eZScKW861wAGJIusjaBkrThPP/QtC2rpgiphnRIUqKeb1FzMb2X4Bic6
         1nY3gpcmhuCK4D7oQr/nmpbuir4TiLJbEvZpddCIhblJc2NSpWWBgnXpemjtOotMRZ9v
         yh/x9/h6hVtu3x6VoL6TDu8FW2m1h+Pyq+VKL6kOY5StfTv6Ze+BXLcj6oO2+m6v63zd
         hsDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691683526; x=1692288326;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J+MWT9kPPQXlIOxmhtx79J6lPeZcRWHdzQkZmPZUF2s=;
        b=RUmY5pWymtFyb+mpuToIOaGwidWmXcRvfsHrZ+Ro/Urm5PrMQ5TTL/GhvOw9MiqWYL
         56IgRk79PfI3usKv3HOQUZpjs2DdlCywOdLeI3SnrLn2PxAhxoKnasGESXxISUE7k5Pe
         nYd+l5a06JOswe2fxG6HbatoR/IdMB523ljlPmBAZA0FPsXkWXRKO+54pI0Ba8Wd6odA
         BrjPlRWxxWUO5WTh0+k/d+JjdjQPxmT4BhpoTplaDBxVx9+IhClAHbgU4G/d3ASwfr9+
         7iTTcLJaLZ1NSeHkLZ70yecd6wwOYAZyXZS8vAWrPyREtKR+bpHs1O0DoZ5UPGde6rfT
         AQ5A==
X-Gm-Message-State: AOJu0YzyLKPLbUxIJtE5HHdNk3tBoVDjDrosdf7UtWDg410IjIgrvC1g
	Im+AhUlWtn9wcwK2fUkBvc4dvJ1fE7Uysd81Grk=
X-Google-Smtp-Source: AGHT+IGgfm2/f28TcZJ4eVZLP6Frjl5Xd81FjTtszRtb6J/mNCva1w0+1zMyui0ApB70PbTk96IsKg==
X-Received: by 2002:a05:6a20:728e:b0:132:c07d:9dd2 with SMTP id o14-20020a056a20728e00b00132c07d9dd2mr3149523pzk.39.1691683526263;
        Thu, 10 Aug 2023 09:05:26 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id o29-20020a63731d000000b0054fe6bae952sm1715525pgc.4.2023.08.10.09.05.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Aug 2023 09:05:25 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 19/37] automake: fix buildtest patch
Date: Thu, 10 Aug 2023 06:04:18 -1000
Message-Id: <8a5630c113bd8509fcb62e8a32fcadfc2dc94181.1691683295.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1691683295.git.steve@sakoman.com>
References: <cover.1691683295.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Aug 2023 16:05:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185781

From: Julien Stephan <jstephan@baylibre.com>

Add check_PROGRAMS as a dependency of buildtest-TESTS target.
This is required because according to the official automake
documentation [1]:
* TESTS: contains all the tests files
* check_PROGRAMS: contains the programs used by the tests
* check_PROGRAMS is not automatically added to TESTS

So, by using only TESTS as a dependency for buildtest-TESTS we may end
up having runtime errors because of missing program required by the
tests.

[1]: https://www.gnu.org/software/automake/manual/html_node/Scripts_002dbased-Testsuites.html

Signed-off-by: Julien Stephan <jstephan@baylibre.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit ee3e2af4f8ed95b4fd0f7cec52ae4e169401b719)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/automake/automake/buildtest.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/automake/automake/buildtest.patch b/meta/recipes-devtools/automake/automake/buildtest.patch
index b88b9e8693..c43a4ac8f3 100644
--- a/meta/recipes-devtools/automake/automake/buildtest.patch
+++ b/meta/recipes-devtools/automake/automake/buildtest.patch
@@ -36,7 +36,7 @@ index e0db651..de137fa 100644
 -check-TESTS: $(TESTS)
 +AM_RECURSIVE_TARGETS += buildtest runtest
 +
-+buildtest-TESTS: $(TESTS)
++buildtest-TESTS: $(TESTS) $(check_PROGRAMS)
 +
 +check-TESTS: buildtest-TESTS
 +	$(MAKE) $(AM_MAKEFLAGS) runtest-TESTS
-- 
2.34.1


