Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web09.5895.1609856771909966284
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Jan 2021 06:26:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=HFmTOu+0;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.180, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f180.google.com with SMTP id s15so16433347plr.9
        for <openembedded-core@lists.openembedded.org>; Tue, 05 Jan 2021 06:26:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=yGJvbOoQeZhF2X3HnvRELbUJJnGMQ11fg2MYwgWfErQ=;
        b=HFmTOu+0I8+KVipqiOsoVg6tgwc8vDd64TMqlT6kg+DwDcz9jieJb5lZ/msSMK1ck7
         BM6eMGzKlYf+789CgY/QwXyekV01/I8QkBsLW4b3mgZhqioZdF+kaROtczqh2yxkvpjG
         f55EyIE+5Alz49JMg8k6gKgcl4JNS89uqHDvRRCWkoSB5lM0pl1kdimxzOaYxSLJAlK5
         x4D5VGnVLgdaf/7J8dxCKy1hSNNSIuFIHMDggUO0xmYGQ9xSfR9qzqSRMIBMCwRn/th0
         Aqh4ZbSUOvkpDNre/I3U0JIvMnG5jbsYr4Vtrv58SeuSPlLT57eEu3HiQKEEHtZ+9H+z
         Tbug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=yGJvbOoQeZhF2X3HnvRELbUJJnGMQ11fg2MYwgWfErQ=;
        b=rC+o9NxuJ2+Zb/vWmKFZSo5pz10xDslTLJekxMlbycTv0bDfsZqIIAkdjWoFfGoLIA
         +6s3kvvJWR7aoO94rT0UEt7sOPI5T0R/BAllSli+Ofp+ASYuNTSn8yfBq/LfyYsERdZ/
         uaoj1u/5/1aZoMootWxlnJ/WlV0HHK6HEAtjFqKTPQfoh+/Q2B4Wl5q5w5joGdfkWBO0
         urv8CbolJADVPdwzCpKuw6r97HmQhSfERupiS6l1gEiU4I0LRY+BtwDvGPZCMwkBZqJj
         WhfTCiPZNOTec1nBEqhf5Rd7bKWvMEaRfTRHY3kd4xMAS1edRjamNF4EpTfjE++J99an
         rUSA==
X-Gm-Message-State: AOAM533ApDGA0bxC1oIbGXnaSiVWG+cFhMBmc6WIif9+Hda2e+p2mWPt
	WwpLJLhc/CPK+e5YK2sM/bhDODyHOkQfV26y5xE=
X-Google-Smtp-Source: ABdhPJw7SQRkKbhMb4lzc/ZHmNasGE8rOFg4Td3YHZCbyfd5X1wKjqSe7HnZoOgeaiCT39/tJAWqcg==
X-Received: by 2002:a17:90b:68b:: with SMTP id m11mr4315775pjz.208.1609856771059;
        Tue, 05 Jan 2021 06:26:11 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id i130sm57552465pfe.94.2021.01.05.06.26.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jan 2021 06:26:10 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 22/30] populate_sdk_base: Fix condition syntax if SDK_RELOCATE_AFTER_INSTALL is disabled
Date: Tue,  5 Jan 2021 04:23:47 -1000
Message-Id: <5bbafa99ec76a197e433ae3fb1ee44da7be398a5.1609856435.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1609856435.git.steve@sakoman.com>
References: <cover.1609856435.git.steve@sakoman.com>

From: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>

If variable is set to empty string the comparison is "if [ -eq 1 ]"
which fails with "[: -eq: unary operator expected".

Signed-off-by: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 36a2dc83fd0e1d6e2b8441e24a4cbc48a6c4fc19)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/populate_sdk_base.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
index 3e5b1359d6..39a7cadaf8 100644
--- a/meta/classes/populate_sdk_base.bbclass
+++ b/meta/classes/populate_sdk_base.bbclass
@@ -256,7 +256,7 @@ fakeroot create_shar() {
 
 	rm -f ${T}/pre_install_command ${T}/post_install_command
 
-	if [ ${SDK_RELOCATE_AFTER_INSTALL} -eq 1 ] ; then
+	if [ "${SDK_RELOCATE_AFTER_INSTALL}" = "1" ] ; then
 		cp ${TOOLCHAIN_SHAR_REL_TMPL} ${T}/post_install_command
 	fi
 	cat << "EOF" >> ${T}/pre_install_command
-- 
2.17.1

