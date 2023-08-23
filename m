Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6352CEE49B2
	for <webhook@archiver.kernel.org>; Wed, 23 Aug 2023 14:37:07 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web10.13088.1692801426666900549
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Aug 2023 07:37:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=UzGFQ0Kw;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.169, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1bf1935f6c2so38786925ad.1
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Aug 2023 07:37:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1692801426; x=1693406226;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J+MWT9kPPQXlIOxmhtx79J6lPeZcRWHdzQkZmPZUF2s=;
        b=UzGFQ0KwBZHCJOzqkSsVAOKq3vUzgWxL5AcBYjJ9Z1WJ1EG2Ano2Sv+1moCrfUjwmy
         L6ZAQjfSynGmcwF/QGN7VXgIpgnfIMqElubnmsHRNkg1l8boH2IZlVwpL9QAeEDIQraV
         heriJeLUG9yTW7phKiicJsGtU451g7OZKxGL/9kQFr581qxHfiYHHXkDFIfnbQ2r6HZX
         8+dAJozV9hNbFzSmBgUa1XtaCXzuv7NUfotNMzFaggEWb1ok9JQisd1BPMtLiX2b1tml
         6R43Z/1IEX/NkwuL5kzHFttMQ84lJE8U14aBitwEGrPyg3ZGFl0sTqsVua0nA7dXb7su
         yPZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692801426; x=1693406226;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J+MWT9kPPQXlIOxmhtx79J6lPeZcRWHdzQkZmPZUF2s=;
        b=KNRXLR4H4VCLQLe9+5r9t91zFSJbxdmJhPYf5r1Kz8pFKlSoK9N3tNZTSGkPtl9FVY
         Wg1G9YSSEpwzLooQOtB997ZuPnR1QwJDVjiRgs8/bAr6NBs3LYoBZSm5gZ+Uf3kdlMBi
         R7wFcH3XQiF4AJaX2yYI5n3jeTvqLo+KAafxIzRVE7hP7POFtOqMFhC2ZaMHIEXy/VZo
         VwgCnhWITedIrXibYPJ3IB66vEELLOG5LqauT5jshCgsdMGlp3zLgZSlbmor7FoFoY+J
         qbgXj17nIaglRHPnLIJ7H1etra7g7lD0bozFqLgAZa8CaLRg6PqXCf4sDbRZ4oWbY2v1
         JZbQ==
X-Gm-Message-State: AOJu0Yx2V4VxF/eXsRhzCpYFwtic6iTddkL9RqyUe7E8UUQOXuZS8rV3
	Oym0OCK6p7yiZmpfMs7uUpAKSfFNt3As9wPd4bI=
X-Google-Smtp-Source: AGHT+IE2IduRs3khELX/jNPwmoKG9DPgPDApaVcxdtVeL/ReM+Jf1T8SavsuCJS790kcLdXLUFitUQ==
X-Received: by 2002:a17:902:a404:b0:1b8:af5e:853c with SMTP id p4-20020a170902a40400b001b8af5e853cmr17134042plq.26.1692801425797;
        Wed, 23 Aug 2023 07:37:05 -0700 (PDT)
Received: from xps13.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id 2-20020a170902e9c200b001bb750189desm11062478plk.255.2023.08.23.07.37.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Aug 2023 07:37:05 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 22/36] automake: fix buildtest patch
Date: Wed, 23 Aug 2023 04:35:52 -1000
Message-Id: <5859a4143a1495198af323cedf06248c9b363060.1692799745.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1692799745.git.steve@sakoman.com>
References: <cover.1692799745.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Aug 2023 14:37:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186603

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


