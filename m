Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0D97C48286
	for <webhook@archiver.kernel.org>; Thu,  1 Feb 2024 19:37:52 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web10.4994.1706816272066126837
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Feb 2024 11:37:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=g33+Sr4/;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.172, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-5d8b887bb0cso1266970a12.2
        for <openembedded-core@lists.openembedded.org>; Thu, 01 Feb 2024 11:37:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1706816271; x=1707421071; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CCgeSMo2GrdKd9NM2kE6AqcH1XztEURMksl8Rv2UWbg=;
        b=g33+Sr4/061b44cSDI9wZdXQPGJ1ZEnQv56BvOTW2+1569ugRB3I+9MFmGgVugUyAb
         wGbfrOr4iphVBlzGCJjO5Ryx1xK1Ef/IxFl3rsWl/8A0aoz7cyi94F9CpELVnCeCyR7q
         OVV3tDrgdFt2mVg9y2L+HAxQ69UXeL4x5d2OtIfLW7AvxNbtP5REMp+MPgRRx20F6tdv
         6hJO41N+6ikdnz8L6is2YqtRgSv+REtyDwvv4GCqqCmgvJwXJ2Nsq9srDR81LpFSE0OV
         BW6J/gMIHSqvUqOSYTayrMFjujxw6WURcZOg41yN2Gaw+tmMOij6VUQGc7AJmK2MXgew
         M3ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706816271; x=1707421071;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CCgeSMo2GrdKd9NM2kE6AqcH1XztEURMksl8Rv2UWbg=;
        b=utuyLd8NyuyFgg7w1YOnzUkyfTBsu8/PSNobzaC2WOxJdNsSpqIDTBL5DrXoo38hwB
         KDZFYpGGyquEJxc9H4H8FB8Z5cO0K34MiXedtu3ZP3Kj5kIqodfek3b2tCx7VbRe5vDP
         Ca2xXVWq2BGb0ENeatWMcZNda7vqLv7t0MsrrDGcLW8Ph/8oXwAjtd4DgnmdBQsT/Nad
         EV1z1jUULgYCttaus6YLAId+j41Mu6JNf3S+SkduuEWE0eNyWeYgeyWJrqYXIAFfcsp5
         B081djttcOa7IPD7SR+6O5VpwOVlwLs1NjNKdXJKafA+esHCavaHtWzsuaS0Tdwg7OO8
         V8XA==
X-Gm-Message-State: AOJu0YxIihBN2OvqUjVtt8zdyVPDGqcDVPYI9nFe5WDlCz56NX/9n972
	vB3uyACPyPZmYZar/FO1SH4sJhUvo7a2SOyJdAmK05H8oJxs4bVkf70oZGxlP3KMtyo8mMsSDMK
	iQG0=
X-Google-Smtp-Source: AGHT+IFgD9mc/5U8H9pXiRuElePj76wf/YBI9LhPuPG8iYi1KO9eBv7tiU+SAt8Ri2a8PespjwlzuQ==
X-Received: by 2002:a05:6a20:47ce:b0:19c:9219:f3eb with SMTP id ey14-20020a056a2047ce00b0019c9219f3ebmr5820591pzb.37.1706816271085;
        Thu, 01 Feb 2024 11:37:51 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id e10-20020a056a001a8a00b006dbdbe7f71csm109717pfv.98.2024.02.01.11.37.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Feb 2024 11:37:50 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 3/4] python3-jinja2: upgrade 3.1.2 -> 3.1.3
Date: Thu,  1 Feb 2024 09:37:41 -1000
Message-Id: <0f0dcf520505d809599a63961ecb5b1e74053b24.1706815725.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1706815725.git.steve@sakoman.com>
References: <cover.1706815725.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Feb 2024 19:37:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194737

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
-Fix compiler error when checking if required blocks in parent templates are empty.
-xmlattr filter does not allow keys with spaces.
-Make error messages stemming from invalid nesting of {% trans %} blocks more helpful

(cherry picked from OE-Core rev: 8a0524464583d69df7746253f5020c2c125a8e1f)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../python/{python3-jinja2_3.1.2.bb => python3-jinja2_3.1.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-jinja2_3.1.2.bb => python3-jinja2_3.1.3.bb} (92%)

diff --git a/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb b/meta/recipes-devtools/python/python3-jinja2_3.1.3.bb
similarity index 92%
rename from meta/recipes-devtools/python/python3-jinja2_3.1.2.bb
rename to meta/recipes-devtools/python/python3-jinja2_3.1.3.bb
index 80e0b85670..068e21bf5f 100644
--- a/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb
+++ b/meta/recipes-devtools/python/python3-jinja2_3.1.3.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://pypi.org/project/Jinja2/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=5dc88300786f1c214c1e9827a5229462"
 
-SRC_URI[sha256sum] = "31351a702a408a9e7595a8fc6150fc3f43bb6bf7e319770cbc0db9df9437e852"
+SRC_URI[sha256sum] = "ac8bd6544d4bb2c9792bf3a159e80bba8fda7f07e81bc3aed565432d5925ba90"
 
 PYPI_PACKAGE = "Jinja2"
 
-- 
2.34.1


