Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9995EC07CA9
	for <webhook@archiver.kernel.org>; Thu, 30 Nov 2023 20:58:00 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web11.5137.1701377871869882745
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Nov 2023 12:57:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=ZiTfjYD1;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.175, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-6cb55001124so2006685b3a.0
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Nov 2023 12:57:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1701377871; x=1701982671; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nF0jdoayT9HI9N2Nsw+cCLmqowJwntAF/b4jWwamH3o=;
        b=ZiTfjYD1w5VMe5Qfn9M0ryC/KdooFhMqfe10G9993/5Rw0d/JdFXTqgh5osiH/qo7i
         hS8FHQeS+YhNJeKW4R/1Zl5a9PH2twMIrSbb92j5WFDhzVBnfnCyBxgFg72cNeQC3KEj
         yeeP3JaGqsGvJPk0YahVrLK9l2SfVFFXiBx6f3bK816OYKly+Hyl6MtUudu5TgRbGSHv
         urNWJGI0WSN2+WLcyZX4t56wI1y+M+Vt7MngGfcuiY2BItPPRW+hFJYX3swKGOOLy98w
         w1z6q5cqPiszAHUITxEagj+CTnBhXKtUIptIdP2cS8gRQfB4JIEUjox2QaYQteGQg82j
         o6SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701377871; x=1701982671;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nF0jdoayT9HI9N2Nsw+cCLmqowJwntAF/b4jWwamH3o=;
        b=Gia5pATcV+NN4g1TdhvmRSojhr6+24dRgcKSOBYGMSQ2NnQ9vsV9mjdefW9co40fY+
         gsZKSQWggkgmbNgHFADPbpJNo2lSQaFBN/QjtIMyEIKiOU7EwuEy8iEfaAjJKiynKF3x
         kz+O0cZ3nmmO8zIN3Lsj3e5BdN5LX4Z8zlDBB0nnqZDzPWI2GWK0b8lEQhj5gcUOMnRU
         RPCgxa3N2dZ5YYLuZqDcGsuf9iRBnF5UH8GCT7Ebzb/7QL0/ChBHxSUByPlTti6rgtK6
         F3WgnjFWS5rWgSRMC3uPxykVt+Hjsrj3EBzuCAAdId8RNXfhnm4WoDNoSoxtbragZz5T
         AUVw==
X-Gm-Message-State: AOJu0YxETKf6IyJTG4zzN9xwkJmyHn7t/BAlk/hXHTgWup/1EJTqqPbN
	izArI8ZFGT1lzclCJBXyQReSaqm/0Jb1d2DLDMHepQ==
X-Google-Smtp-Source: AGHT+IFlAxhT4+JMhIM8oK1hK+B/CQE0VHPswaEVv3Nr4iLJqfpFRONxiNKh4GF1Ys9M2SxMx0vh6g==
X-Received: by 2002:a05:6a20:3944:b0:18b:b858:17a5 with SMTP id r4-20020a056a20394400b0018bb85817a5mr30812109pzg.28.1701377871067;
        Thu, 30 Nov 2023 12:57:51 -0800 (PST)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id f18-20020aa79d92000000b006cbbc07a1c0sm1635418pfq.156.2023.11.30.12.57.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Nov 2023 12:57:50 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 06/25] python3-urllib3: Upgrade to 2.0.7
Date: Thu, 30 Nov 2023 10:57:14 -1000
Message-Id: <99885e0914365f9c4bbb5584e9ab3d244dc58499.1701377676.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1701377676.git.steve@sakoman.com>
References: <cover.1701377676.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Nov 2023 20:58:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191524

From: Khem Raj <raj.khem@gmail.com>

Addresses CVE-2023-45803 [1]

[1] https://github.com/urllib3/urllib3/commit/4e98d57809dacab1cbe625fddeec1a290c478ea9

( cherry-pick from commit befec4d3591bb0dce0e256cf338eb541b2a56b98 )

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../{python3-urllib3_2.0.6.bb => python3-urllib3_2.0.7.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-urllib3_2.0.6.bb => python3-urllib3_2.0.7.bb} (87%)

diff --git a/meta/recipes-devtools/python/python3-urllib3_2.0.6.bb b/meta/recipes-devtools/python/python3-urllib3_2.0.7.bb
similarity index 87%
rename from meta/recipes-devtools/python/python3-urllib3_2.0.6.bb
rename to meta/recipes-devtools/python/python3-urllib3_2.0.7.bb
index cd2a9dd4ef..c286838086 100644
--- a/meta/recipes-devtools/python/python3-urllib3_2.0.6.bb
+++ b/meta/recipes-devtools/python/python3-urllib3_2.0.7.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/shazow/urllib3"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=52d273a3054ced561275d4d15260ecda"
 
-SRC_URI[sha256sum] = "b19e1a85d206b56d7df1d5e683df4a7725252a964e3993648dd0fb5a1c157564"
+SRC_URI[sha256sum] = "c97dfde1f7bd43a71c8d2a58e369e9b2bf692d1334ea9f9cae55add7d0dd0f84"
 
 inherit pypi python_hatchling
 
-- 
2.34.1


