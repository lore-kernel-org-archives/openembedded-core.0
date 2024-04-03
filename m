Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F9F1CD1296
	for <webhook@archiver.kernel.org>; Wed,  3 Apr 2024 03:47:24 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web11.3081.1712116040624482129
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Apr 2024 20:47:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=HVoe1ycT;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.181, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-5cddc5455aeso3740081a12.1
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Apr 2024 20:47:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1712116040; x=1712720840; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YWkt7m7/bKYlSSCLvgPJ9WuroZYBIJeBzoeLfhN7HYY=;
        b=HVoe1ycTEzhsY9sj5VTcP9Ys6gzEb4xtVDb8ILexcPj6DqdECf/e3YbGsOzbOT2PLJ
         LOhPG/sLF/ZWFNoDRe04srJFjDeS/DtwC/A5vTC4Y9DHWFV5eoaHo+sdGOI/yEwIVvmi
         r9dVJ51eUudL8Y1PYt0mBmFjXjwjIKchzdOT5oxQH6HzdxUZmXBWtHtgzVJT5LWzpaSJ
         s+5ePrps04iIxuPbG6ckwNM7djW2R9rVfUqKg2y9DwlfYHHjdTVE3gqdQxnzu51Kry/s
         OMIbVVL/AToro/QmYZFLGBBklXVdIpLnhBmfgpPqiwA0fgzLSE24Gj8slS7cq4LKuB+N
         tCqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712116040; x=1712720840;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YWkt7m7/bKYlSSCLvgPJ9WuroZYBIJeBzoeLfhN7HYY=;
        b=I/WpqZxPFgfE5sqzxTpHExEhVa+AIxWitT3oPSjR237sHPZt0g1zFNgXm79btB///W
         HvIfwnZb8m47mHfO4FsUzjxBt+3OSdj2dxG80VopdeGFW7Ow6Q0IzfchbVPKRC3l4VRU
         zot5dssSgYyAnde3wseAjDYUCApX6MPQcncMtOYoON8WZufTNQCfodsEwpH622f881zf
         w8Fyj1+ZNe6S46e/+cRHnn7hrKQJLW8NeiERPMP3i4upHnNl2Qrax9kP5EXc6GkI5jb4
         rE+QBet6eiXXRTO1txysqRZhCI+u6IMJ9wkhIvb0/n7uSsOr4MmuIaBtvzT7NdCzfOTM
         wCMg==
X-Gm-Message-State: AOJu0Yx3Z5f7D2AWANMQ4jADNWOnrnhEsC520HpQaCYMQSJn/RYOdjYu
	Fwuoijk2ktFvNpLrHIbPHv3gJYDG0wx6S++qDhX33f3xKZgJhjHJwW/i576GCQ2SjznYr99VBFy
	jG6A=
X-Google-Smtp-Source: AGHT+IH2ODI9ox904aP0ZAZW7AqqkwKDn3ZmwuzqjaAKjrKJoCS2qxmMQM0ihYlkq3J3W0TDQFNIWQ==
X-Received: by 2002:a05:6a20:4393:b0:1a3:579f:2c5c with SMTP id i19-20020a056a20439300b001a3579f2c5cmr14315165pzl.53.1712116040035;
        Tue, 02 Apr 2024 20:47:20 -0700 (PDT)
Received: from xps13.. (067-053-223-136.biz.spectrum.com. [67.53.223.136])
        by smtp.gmail.com with ESMTPSA id m11-20020a170902c44b00b001e278fb17c5sm2326128plm.150.2024.04.02.20.47.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Apr 2024 20:47:19 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 7/9] python3-urllib3: update to v1.26.18
Date: Tue,  2 Apr 2024 17:47:00 -1000
Message-Id: <c473f32184ea0ab41f6eb4c8dcc1d7bb5fd7b16f.1712115855.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1712115855.git.steve@sakoman.com>
References: <cover.1712115855.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Apr 2024 03:47:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197900

From: Tan Wen Yan <wen.yan.tan@intel.com>

https://github.com/urllib3/urllib3/releases/tag/1.26.18

Major changes in python3-urllib3 1.26.18:
- Made body stripped from HTTP requests changing the request method to GET after HTTP 303 "See Other" redirect responses. (CVE-2023-45803)

(cherry picked from OE-Core rev: 74da05b63634c248910594456dae286947f33da5)

Signed-off-by: Tan Wen Yan <wen.yan.tan@intel.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../{python3-urllib3_1.26.17.bb => python3-urllib3_1.26.18.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-urllib3_1.26.17.bb => python3-urllib3_1.26.18.bb} (86%)

diff --git a/meta/recipes-devtools/python/python3-urllib3_1.26.17.bb b/meta/recipes-devtools/python/python3-urllib3_1.26.18.bb
similarity index 86%
rename from meta/recipes-devtools/python/python3-urllib3_1.26.17.bb
rename to meta/recipes-devtools/python/python3-urllib3_1.26.18.bb
index 57b166870a..d384b5eb2f 100644
--- a/meta/recipes-devtools/python/python3-urllib3_1.26.17.bb
+++ b/meta/recipes-devtools/python/python3-urllib3_1.26.18.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/shazow/urllib3"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=c2823cb995439c984fd62a973d79815c"
 
-SRC_URI[sha256sum] = "24d6a242c28d29af46c3fae832c36db3bbebcc533dd1bb549172cd739c82df21"
+SRC_URI[sha256sum] = "f8ecc1bba5667413457c529ab955bf8c67b45db799d159066261719e328580a0"
 
 inherit pypi setuptools3
 
-- 
2.34.1


