Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FD45EE49A0
	for <webhook@archiver.kernel.org>; Wed, 23 Aug 2023 14:37:07 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web11.13090.1692801424706260287
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Aug 2023 07:37:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=Eq/+gJNG;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.171, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1bf0b24d925so37368765ad.3
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Aug 2023 07:37:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1692801424; x=1693406224;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h5Lt/aIGN0lUea1VQZEIJWVoZgtFWlby/ygCrm151ms=;
        b=Eq/+gJNGJ/SLyOyg0iZQUzp0h7aUsLqWvhst3tBYB5qx8wHNsRTkzbNu60d5nHDaKl
         gu2tRQ+4GgaVBFBntqTRAPLy8zjAri3Xj0iL68G1+6VFFSWqfpVhncLSOv2QCF2sjaFJ
         JXDdQEyIOJhIIaEUymFjfWjUPVijPDvMoBrhnO5f4uYvOPp8lOIykGkv4ZZ4ffoedDxL
         Lvp/B/4QlpZVqZ2v0Vr3t5cgdiKU3AdiokQGYJhdBe5ly/6Bbghc0RinGaeJuOwLWX34
         Ql6GuT0NO4QJf/gsNjoQTy4hRaT/uEikO69likzPda2ri+W5r45qPkzJAVlps9SsevqC
         3wmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692801424; x=1693406224;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h5Lt/aIGN0lUea1VQZEIJWVoZgtFWlby/ygCrm151ms=;
        b=TpdLNsJ5LYeJFhmMFPN7Y0089hciO/fx4hqN4xsac9ZTC9rO/QE8imul13L4H9Hiu5
         go0bHxJdOCDpB+FF1l3BkQT7+MHlKMrkZ9beuNTKwQ/05J9d8AH69wgw2SGjpfN3BhBi
         0UZporG8PweSVd/yEntepkCxtOy1pfn11al3bESq8BvUJVDFZUbm9aUf7gwvBUZ7oJ24
         NeqJypqgQUWon6ZKJl02syfTyRj7VAeLveKXwvYM86c5Vs/ojrxXCDkTuOu3UlF0cVry
         vd9ectqBVdsS02Dc8EF+K5VQd9MaIOvbj7ck3HBzmRFlPkxkR9NMGnQAN4qH3kLyGMeT
         zGbw==
X-Gm-Message-State: AOJu0Yxs4LtDMEQzPqqQsHukL8lrRbhbkGpzFE2P8P95c5syaLrNMJL9
	EFguNHPIMi03BLY1D3MCG4Sfsp5q68Itc21QR68=
X-Google-Smtp-Source: AGHT+IEC/zlyEroEZhms+IuB7qwQe9TtYTlg/xkWvR4DJDzgk2ZJp6VYdvUaL2GaoIedET3vIDFJxQ==
X-Received: by 2002:a17:902:e5cc:b0:1bd:ca21:c83 with SMTP id u12-20020a170902e5cc00b001bdca210c83mr11640541plf.68.1692801423802;
        Wed, 23 Aug 2023 07:37:03 -0700 (PDT)
Received: from xps13.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id 2-20020a170902e9c200b001bb750189desm11062478plk.255.2023.08.23.07.37.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Aug 2023 07:37:03 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 21/36] resulttool/resultutils: allow index generation despite corrupt json
Date: Wed, 23 Aug 2023 04:35:51 -1000
Message-Id: <9467528e89d44a016a4c1e509a3a7da56ea20f74.1692799745.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1692799745.git.steve@sakoman.com>
References: <cover.1692799745.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Aug 2023 14:37:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186602

From: Michael Halstead <mhalstead@linuxfoundation.org>

non-release indexes will continue to generate when test output is
corrupted.

Signed-off-by: Michael Halstead <mhalstead@linuxfoundation.org>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 1a9157684a6bff8406c9bb470cb2e16ee006bbe9)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/lib/resulttool/resultutils.py | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/resulttool/resultutils.py b/scripts/lib/resulttool/resultutils.py
index 7666331ba2..c5521d81bd 100644
--- a/scripts/lib/resulttool/resultutils.py
+++ b/scripts/lib/resulttool/resultutils.py
@@ -58,7 +58,11 @@ def append_resultsdata(results, f, configmap=store_map, configvars=extra_configv
             testseries = posixpath.basename(posixpath.dirname(url.path))
         else:
             with open(f, "r") as filedata:
-                data = json.load(filedata)
+                try:
+                    data = json.load(filedata)
+                except json.decoder.JSONDecodeError:
+                    print("Cannot decode {}. Possible corruption. Skipping.".format(f))
+                    data = ""
             testseries = os.path.basename(os.path.dirname(f))
     else:
         data = f
-- 
2.34.1


