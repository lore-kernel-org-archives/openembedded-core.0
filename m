Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D761AC54E58
	for <webhook@archiver.kernel.org>; Wed, 20 Mar 2024 16:44:33 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web11.50469.1710953072009776138
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Mar 2024 09:44:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=WMe0TfHV;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.175, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-5cddfe0cb64so15572a12.0
        for <openembedded-core@lists.openembedded.org>; Wed, 20 Mar 2024 09:44:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1710953071; x=1711557871; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Nr+O2YIgOlFtrXaw/ZAn1Psu8p113nEC3v0V67LqiIo=;
        b=WMe0TfHVkd118BoLyLNzM6zZAd3ehMv7gBtVMq/bt/Bx/iRWkNfWowr9nD5LAAP62D
         U3hd9d5ONARYgjnBQlMCipgAsqoH5bi+sfYR4+/EdPH+3m0dKy/Pmyr0xTPkfkC/IrUd
         wRzeOnvCeSIBEWpyW1lWY0y7TR4mpZTtHQRHMuKYDQnFulG5BGHYl4wq+9TwfWlOlAmj
         Hy4F8la+UUWb94dXw03PMPT+P9XDcOHK0jL0oE+xuE89MvfiD1RKB7a8VM7fG8yDjYIM
         NnKyEYWgEx2rRauecvFvNAGhhvulPl6/1KaOh1mo9W7MN+BigNb1G5Uvlgrpv6erZbt7
         xSWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710953071; x=1711557871;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nr+O2YIgOlFtrXaw/ZAn1Psu8p113nEC3v0V67LqiIo=;
        b=kpJNgjUOLg6ghYI8PCcrBsWcQuzRhZO+rKSSoFpG1hP5x46ZynNV0CZdxmYNgu1GI7
         1zo7COobR6PrfaXFn3uM+KYlJaECV+4ka1ojyC1tKzHdcIN3Sg5rr8sP3u+eU+86E78S
         FPrlskOFGQ1Cz6zIN9Nk2EBYkgiYwuFZMQUevXokrBH2qhUmfLzuUkmn0aXhBXPEC7hN
         dvUFOiqFL9x3tUk/sJ3q/Qq7WUb4i17sYevOYzg0aUYh9imkLhLnq2Ha3H0ELKRPlpp9
         loNpVEjyIFEM5BWjuh9+59P9Ex/wmCHEujn2KtQ2PlSinL6/xV4KDJkMMrz9FxcRJTyz
         L/BQ==
X-Gm-Message-State: AOJu0YyG7HHYd3fVNp4YEABCbaYutqz3KETR7DUvpY9neXleAOMjYmnj
	YLj5g1AArHCdFEXCQSIQ+NFmxt8SGy7J4hrjUGGLUjfnWPho19kvypRQ7vjVNRzlsTJIgpg+961
	Hsq4=
X-Google-Smtp-Source: AGHT+IHgnDS7sCOaxhEl1uSGZ6Bu66Mfct7mlrFmWXabqRXB6nldcVhTVrODZVBUXHZrHU+nx+BZjQ==
X-Received: by 2002:a05:6a20:1581:b0:1a3:5170:8eb9 with SMTP id h1-20020a056a20158100b001a351708eb9mr14837760pzj.39.1710953071269;
        Wed, 20 Mar 2024 09:44:31 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id a3-20020a62d403000000b006e6bfff6085sm12725437pfh.143.2024.03.20.09.44.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Mar 2024 09:44:31 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 07/12] cve-update-nvd2-native: Remove rejected CVE from database
Date: Wed, 20 Mar 2024 06:44:01 -1000
Message-Id: <4eb0074be76c9bd3d6d25cae4f1b9f398ff89bf5.1710952928.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1710952928.git.steve@sakoman.com>
References: <cover.1710952928.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Mar 2024 16:44:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197394

From: Yoann Congal <yoann.congal@smile.fr>

When a CVE is updated to be rejected, matching database entries must be
removed. Otherwise:
* an incremental update is not equivalent the to an initial download.
* rejected CVEs might still appear as Unpatched in cve-check.

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f276a980b8930b98e6c8f0e1a865d77dfcfe5085)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/meta/cve-update-nvd2-native.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-core/meta/cve-update-nvd2-native.bb b/meta/recipes-core/meta/cve-update-nvd2-native.bb
index 0044529b7d..1a3eeba6d0 100644
--- a/meta/recipes-core/meta/cve-update-nvd2-native.bb
+++ b/meta/recipes-core/meta/cve-update-nvd2-native.bb
@@ -323,6 +323,10 @@ def update_db(conn, elt):
     accessVector = None
     cveId = elt['cve']['id']
     if elt['cve']['vulnStatus'] ==  "Rejected":
+        c = conn.cursor()
+        c.execute("delete from PRODUCTS where ID = ?;", [cveId])
+        c.execute("delete from NVD where ID = ?;", [cveId])
+        c.close()
         return
     cveDesc = ""
     for desc in elt['cve']['descriptions']:
-- 
2.34.1


