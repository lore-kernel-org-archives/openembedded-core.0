Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B553BCF9C6B
	for <webhook@archiver.kernel.org>; Tue, 24 Sep 2024 15:00:14 +0000 (UTC)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
 by mx.groups.io with SMTP id smtpd.web11.16377.1727190004862966444
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Sep 2024 08:00:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=OYKvo0Mb;
 spf=pass (domain: baylibre.com, ip: 209.85.222.175, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-7a9b049251eso105167885a.2
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Sep 2024 08:00:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1727190004; x=1727794804; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C81KsCTyMI9tTtS9VNbw5AAOSJti/p2rMprYv6mc1/g=;
        b=OYKvo0MbOk7v33TkJswWL2N7j13pd732Bpb5iryRZ+/hX8Wed0HYRV5cMKo+n2Ax9U
         S7Ur0uqjtF3gVmkI4JtO0rXg3Io9T3zmtwKHrexL6OKQAZaFgOZ49ZWTVLqCgDFwZvPG
         tQyppLPz85Pd/elTEz72ptUDAwFrO+Dke7j40iwraJqd2rRQY4UElhGm7vsUL4J6k12R
         ReeRpGoGSq2X6pLUYzZXf8LOvZbobRGFepERYfzvFgQujg2S641mTsfDzSzwpd3QNyqE
         8O83Yd3j3TbUenoM0DrzcIuT+5BGZ3TO8E4PwvJeNOHQfe5EZ+60q0Y2Y2vce1BtptEn
         Po0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727190004; x=1727794804;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C81KsCTyMI9tTtS9VNbw5AAOSJti/p2rMprYv6mc1/g=;
        b=ToCjaSfGfXJ0ZT50V8cSdgcZtkuud6mepApa01Hcknmy3nSpxRq9M4nERDoKXb7cf8
         OlFrU+cQy1J5SmYNdGaClnGpMW7ttEATaL5qKl3H+U83CeV9uF43xWC3JL6GEdmp6MaR
         FZ6pTHqwZDTqnyy5f1O4I9dYTw7Eciw1bjbNg3TuD44T7jzs7YROpYIPeyvj6rxT6iH8
         rmhdQlxJFoBZiKtlfV7NgcCSqE5ivYkNLIG0yFlsI8p4SjZJgXbv3c4gvfTwaAnERTFo
         GCqTn8tXRbz+Te9uEdDDilLau8oTk0K3h0x5ALc6JJPqs2jRt5WP9w4bB1IV7oblaj5r
         /qmw==
X-Gm-Message-State: AOJu0YwlKn4RWcHwZCwzr5cs5Fl+8NPkWuzR7VAHKdxpxwdNgI3Ei1U2
	0AGHJwV4snq6zLsdW3gF7kLsEsDIaMDS0ZzGSCL9g/AyEKY0CFQGEykEMkkzWasYGPEeIu40OuS
	P5qc=
X-Google-Smtp-Source: AGHT+IEkn+2BQqTT8EAlSK1+WKWqW5a0OTVTh9utFZ+n5fYaV7CG/1XWWwM0I7sRjU/dX3Nr9eFlvQ==
X-Received: by 2002:a05:6214:3a05:b0:6c4:4d34:237f with SMTP id 6a1803df08f44-6c7bc7bdc83mr183029496d6.41.1727190003339;
        Tue, 24 Sep 2024 08:00:03 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cb0f772f27sm7205716d6.121.2024.09.24.08.00.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Sep 2024 08:00:03 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 2/4 v2] python3-pytest: upgrade 8.3.2 -> 8.3.3
Date: Tue, 24 Sep 2024 10:59:59 -0400
Message-Id: <20240924150001.2586819-2-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20240924150001.2586819-1-tgamblin@baylibre.com>
References: <20240924150001.2586819-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Sep 2024 15:00:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204874

Changelog (https://docs.pytest.org/en/stable/changelog.html):

Bug fixes
    #12446: Avoid calling @property (and other instance descriptors) during fixture discovery – by @asottile
    #12659: Fixed the issue of not displaying assertion failure differences when using the parameter --import-mode=importlib in pytest>=8.1.
    #12667: Fixed a regression where type change in ExceptionInfo.errisinstance caused mypy to fail.
    #12744: Fixed typing compatibility with Python 3.9 or less – replaced typing.Self with typing_extensions.Self – by @Avasam
    #12745: Fixed an issue with backslashes being incorrectly converted in nodeid paths on Windows, ensuring consistent path handling across environments.
    #6682: Fixed bug where the verbosity levels where not being respected when printing the “msg” part of failed assertion (as in assert condition, msg).
    #9422: Fix bug where disabling the terminal plugin via -p no:terminal would cause crashes related to missing the verbose option.
    – by @GTowers1

Improved documentation
    #12663: Clarify that the pytest_deselected hook should be called from pytest_collection_modifyitems hook implementations when items are deselected.
    #12678: Remove erroneous quotes from tmp_path_retention_policy example in docs.

Miscellaneous internal changes
    #12769: Fix typos discovered by codespell and add codespell to pre-commit hooks.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
v2 adds the missing signoff.

 .../python/{python3-pytest_8.3.2.bb => python3-pytest_8.3.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pytest_8.3.2.bb => python3-pytest_8.3.3.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-pytest_8.3.2.bb b/meta/recipes-devtools/python/python3-pytest_8.3.3.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-pytest_8.3.2.bb
rename to meta/recipes-devtools/python/python3-pytest_8.3.3.bb
index 459d91f1beb..dbd984208d6 100644
--- a/meta/recipes-devtools/python/python3-pytest_8.3.2.bb
+++ b/meta/recipes-devtools/python/python3-pytest_8.3.3.bb
@@ -5,7 +5,7 @@ DESCRIPTION = "The pytest framework makes it easy to write small tests, yet scal
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=bd27e41b6550fe0fc45356d1d81ee37c"
 
-SRC_URI[sha256sum] = "c132345d12ce551242c87269de812483f5bcc87cdbb4722e48487ba194f9fdce"
+SRC_URI[sha256sum] = "70b98107bd648308a7952b06e6ca9a50bc660be218d53c257cc1fc94fda10181"
 
 DEPENDS += "python3-setuptools-scm-native"
 
-- 
2.39.5


