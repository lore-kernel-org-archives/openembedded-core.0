Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A329D7877B
	for <webhook@archiver.kernel.org>; Thu, 21 Nov 2024 15:39:09 +0000 (UTC)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
 by mx.groups.io with SMTP id smtpd.web10.1265.1732203544610399751
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Nov 2024 07:39:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=GZecDLiN;
 spf=pass (domain: baylibre.com, ip: 209.85.219.48, mailfrom: tgamblin@baylibre.com)
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-6d43b396c9bso7411186d6.0
        for <openembedded-core@lists.openembedded.org>; Thu, 21 Nov 2024 07:39:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1732203543; x=1732808343; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZSgiHOMTwVVMmdag/+9r067avyUqsz9UVssABJsWH4A=;
        b=GZecDLiNw8I5zkVTmzlPKQhmZBv6dbgL0BD/6avBSBI+PNUrxnmVyrx/Tv06dTGupk
         a7SWGUZZNNSg6OcCkODLOmpNhBp7Nwr41dlt3iJqXpindc9LiMusV5Soa8EfcX19iUip
         DRKZqQgFe0eFizJoK2onAKTcEY7LbM5gp1f6mf5BSbyqU2LQCxjcQYGzNhUm/wx/72e9
         ni3y+05yxmb1blDaqB0nzYsP3r3kH76WfXIFtjSxNj+Z9Cf4S6gSr3Y2/drkSPb0CHL2
         w31Yr2rap5zlOKIyPQKxrr5Oi2dql+07KyrE5eOYJRMb7tXW1tXRAQT4E6NethgAM/m9
         fTzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732203543; x=1732808343;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZSgiHOMTwVVMmdag/+9r067avyUqsz9UVssABJsWH4A=;
        b=PotJda1k7YK6ZZEubt195Phf4u17z+0J1vkVm9UvmGYZZHVE1CCOm0Y5rGS1n8OwZw
         LazVFz+PB2k3kfqBZU/bqLAoWreN+6WDcTzxdEsYGBAlr0QaHQj6nAzifteK1cywEwhu
         LfFhWQFxANNDaZEggcKlDU2NoJVEA3Q/2AfvAao2nvgIYBNJ+tolyNZgaV9rTwrM84yb
         reUfg5rxBkC2wkxRgiCXlEqP79kokZd7+J3qV2As7ncqnydNUjmhlYpxt2z4FKMOJ2JE
         h94Em5+v+Pj0x/EcYJud1vcS4T6wO/Ooszcm+69RzKlgq+l4sPXMOqHaozKAdT5erkUC
         dCvw==
X-Gm-Message-State: AOJu0YyDs8NtKnUHQiuTNVhM4m9Crrfq12zX0cw1bYRgC06tQXMnkh5x
	o8taFH188GFiRgi7Pf4KpCdo3I4VkWThFXTVzVk99lL1CVtpNRvVkWuZKWR5C3m6wcnK1R3R5fg
	D
X-Gm-Gg: ASbGncumAqAREUMs3ZzZFTFq8KmRigycsZkpNweIH2JB4Dg+pvVgeI0MMvCIfJrg4Bx
	vHiNSaBShJmh2C0NK57gJI8jG66smDA10dlQ85D3XXrAsToSS+BpnvcL4X7xKkpv10AwWd+/WK4
	gosatdgIAbNRH0ctPPHqfj/s2zy3+mNCk4beFEaAQGKOXq9C5LMFcZHSrt2hK04lc6OeF8T7JNf
	Rky6t3xCeFsvwcbR+Vw2YhEmsYjSnKeT9NENZYrAa0fNNRVcReb6bpEBvwXQ4JrPM6iww85crxe
	ABCkL5w3ioEz0Jn14d/ZT12fztBGda0=
X-Google-Smtp-Source: AGHT+IGa5PP4tVL2jQdJ81O1fYt0TqzKYF1Px/mKPcPLcjORLDXLfsfvDPRN6Iqf1f3HgNMW99gKwQ==
X-Received: by 2002:a05:6214:f02:b0:6d4:1dc0:2623 with SMTP id 6a1803df08f44-6d43785a561mr82741416d6.32.1732203542862;
        Thu, 21 Nov 2024 07:39:02 -0800 (PST)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d43814e9bdsm24726786d6.126.2024.11.21.07.39.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Nov 2024 07:39:02 -0800 (PST)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: Trevor Gamblin <tgamblin@baylibre.com>
Subject: [OE-core][PATCH 1/2] python3-meson-python: upgrade 0.16.0 -> 0.17.1
Date: Thu, 21 Nov 2024 10:38:58 -0500
Message-Id: <20241121153859.2133751-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Nov 2024 15:39:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207542

Changelog (https://mesonbuild.com/meson-python/changelog.html):

0.17.1

    - Update tests to work with newly released pyproject-metadata 0.9.0.
      Fix tests to work when not executed in a git work tree.

Daniele Nicolodi — 23-10-2024.

0.17.0

    - Refuse to build wheels targeting the limited API and free-threaded
      CPython: the free-threaded CPython build does not support the
      limited API yet.
    - Always use UTF-8 encoding for writing Meson native and cross
      files. Always use UTF-8 encoding for reading read Meson
      introspection data and pyproject.toml.
    - Do not include uncommitted changes when creating source
      distributions. Previously, uncommitted changes to files under
      version control were included, but not untracked files. There was
      no strong use case for this behavior and it was too surprising to
      keep it.
    - Make source distribution reproducible: use the modification time
      of pyproject.toml for the generated files in the source
      distribution archives.
    - Disable the abi3 wheel tag for PyPy when building wheels targeting
      the limited API: PyPy supports the limited API but not the stable
      ABI.
    - Raise ImportError when the package rebuild fails when importing an
      editable install.
    - Fix the wheel platform tag for GraalPy.
    - Add .gitignore and .hgignore files to build directory if it is
      empty.
    - Allow install_subdir() of missing directories.

Christian Clauss, Daniele Nicolodi, Jonathan J. Helmus, Leo Singer, Loïc
Estève, Michael Simacek, Ralf Gommers, Simon McVittie — 19-10-2024.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 ...n3-meson-python_0.16.0.bb => python3-meson-python_0.17.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-meson-python_0.16.0.bb => python3-meson-python_0.17.1.bb} (85%)

diff --git a/meta/recipes-devtools/python/python3-meson-python_0.16.0.bb b/meta/recipes-devtools/python/python3-meson-python_0.17.1.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-meson-python_0.16.0.bb
rename to meta/recipes-devtools/python/python3-meson-python_0.17.1.bb
index 79a7ff05eff..04f0a1eff89 100644
--- a/meta/recipes-devtools/python/python3-meson-python_0.16.0.bb
+++ b/meta/recipes-devtools/python/python3-meson-python_0.17.1.bb
@@ -13,7 +13,7 @@ DEPENDS = " \
 PYPI_PACKAGE = "meson_python"
 
 inherit pypi python_mesonpy
-SRC_URI[sha256sum] = "9068c17e36c89d6c7ff709fffb2a8a9925e8cd0b02629728e5ceaf2ec505cb5f"
+SRC_URI[sha256sum] = "efb91f69f2e19eef7bc9a471ed2a4e730088cc6b39eacaf3e49fc4f930eb5f83"
 
 DEPENDS:remove:class-native = "python3-meson-python-native"
 
-- 
2.39.5


