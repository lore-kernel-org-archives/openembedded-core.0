Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0778EC54722
	for <webhook@archiver.kernel.org>; Thu, 22 Aug 2024 09:35:41 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
 by mx.groups.io with SMTP id smtpd.web10.9515.1724319339734218930
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Aug 2024 02:35:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BLTQe6sz;
 spf=pass (domain: gmail.com, ip: 209.85.208.182, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2f3e2f07f41so5545111fa.3
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Aug 2024 02:35:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724319338; x=1724924138; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KwUKHu9ww9dXgoyjE0NOOXkv/PjDi7rrpKutbpF7QOE=;
        b=BLTQe6sz1kzmXvjgrsrAX9Sxmzb+vtl4fx9OvAwzg4JchMP+J4trrkh3iFyJCi8/d8
         wLiXcke8UTU/1ulwPeuXfmNqPZsW5tnIyicHq0wfMZb2Jc6hDXnQ3hIwsF1zGjR79HTV
         lR1NM0EiaLy4dOwMzZj3AhTKSBQhbGV6n8TnV+O11nxWOaSOO0XsMfvkSIPFwnzKtaad
         oX7h5jM8+p7CNr2fd7WWbIqvelOpxCiUBbAMtPkgXDwuYPGr0ca4IesNXpylxKTdEUI3
         kyBE/WHIh4jkVnahrOx2oYEyjACjZnfg9MKPfS38IA2vuxs6DO/YrFCgNNLrosI9Yzl1
         GNSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724319338; x=1724924138;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KwUKHu9ww9dXgoyjE0NOOXkv/PjDi7rrpKutbpF7QOE=;
        b=NFYUSnrClEnR/wL9WsdyvHhTlgAzh/qmGj8iLctVtLV4Ui/76Mbfyi53e9axfaITlY
         IQ85J5OJfEgxT8GE14pXIYohJxpEtjhBb91IFj+7CoIbd1Jv67wqKxCEukCLhi9TGJqf
         cQTW4o1RDoRdOgZ9VzLzoRZ8DDETROqutVxnCr27/WGfrOg8EdWWjtw5i2CqZGHo36F5
         O39z8ECWzEIg9mgXGAId8Dsq05UD2VlZ186GzzszDb4Hg7pvrc9eknDFPETXEQRrFIW5
         iA8I4j4fIFpNUMuNUb1Ty1iTK56UH0MNRQRAtwGZ4diLQ18rFenJeSRpGawQ4FBJzDVg
         uEoQ==
X-Gm-Message-State: AOJu0Yx/3/xNnA8Hj/NNYbZv1B3AED5qH+7bAv1ounhZQ9pSjtapZJyN
	k41EVWRXlni0vcRS//boHQSLdlWXKOTNvx99/8lGX40Cw/61J8RTp8FPbw==
X-Google-Smtp-Source: AGHT+IEK9z6jZt/puV0EQ8B5jTxsZbTh8Mhk8p5h31H0nUoCsr14s68u2tAdxzDnR59NqRl9Sd2LDg==
X-Received: by 2002:a2e:5109:0:b0:2ef:2c91:502a with SMTP id 38308e7fff4ca-2f3f882ffb5mr31316111fa.3.1724319337340;
        Thu, 22 Aug 2024 02:35:37 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c044ddbce5sm698502a12.4.2024.08.22.02.35.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Aug 2024 02:35:36 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 19/32] lua: upgrade 5.4.6 -> 5.4.7
Date: Thu, 22 Aug 2024 11:35:08 +0200
Message-Id: <20240822093521.36790-19-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240822093521.36790-1-alex.kanavin@gmail.com>
References: <20240822093521.36790-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Aug 2024 09:35:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203634

From: Alexander Kanavin <alex@linutronix.de>

License-Update: copyright years, formatting

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/lua/{lua_5.4.6.bb => lua_5.4.7.bb} | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/lua/{lua_5.4.6.bb => lua_5.4.7.bb} (87%)

diff --git a/meta/recipes-devtools/lua/lua_5.4.6.bb b/meta/recipes-devtools/lua/lua_5.4.7.bb
similarity index 87%
rename from meta/recipes-devtools/lua/lua_5.4.6.bb
rename to meta/recipes-devtools/lua/lua_5.4.7.bb
index 17dc8fb17df..6e414a08050 100644
--- a/meta/recipes-devtools/lua/lua_5.4.6.bb
+++ b/meta/recipes-devtools/lua/lua_5.4.7.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Lua is a powerful light-weight programming language designed \
 for extending applications."
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://doc/readme.html;beginline=303;endline=324;md5=e05449eb28c092473f854670c6e8375a"
+LIC_FILES_CHKSUM = "file://doc/readme.html;beginline=305;endline=326;md5=344ad98880a7ee9ff6e1498a519a7c76"
 HOMEPAGE = "http://www.lua.org/"
 
 SRC_URI = "http://www.lua.org/ftp/lua-${PV}.tar.gz;name=tarballsrc \
@@ -10,10 +10,10 @@ SRC_URI = "http://www.lua.org/ftp/lua-${PV}.tar.gz;name=tarballsrc \
            "
 
 # if no test suite matches PV release of Lua exactly, download the suite for the closest Lua release.
-PV_testsuites = "5.4.4"
+PV_testsuites = "${PV}"
 
-SRC_URI[tarballsrc.sha256sum] = "7d5ea1b9cb6aa0b59ca3dde1c6adcb57ef83a1ba8e5432c0ecd06bf439b3ad88"
-SRC_URI[tarballtest.sha256sum] = "04d28355cd67a2299dfe5708b55a0ff221ccb1a3907a3113cc103ccc05ac6aad"
+SRC_URI[tarballsrc.sha256sum] = "9fbf5e28ef86c69858f6d3d34eccc32e911c1a28b4120ff3e84aaa70cfbf1e30"
+SRC_URI[tarballtest.sha256sum] = "8a4898ffe4c7613c8009327a0722db7a41ef861d526c77c5b46114e59ebf811e"
 
 inherit pkgconfig binconfig ptest
 
-- 
2.39.2


