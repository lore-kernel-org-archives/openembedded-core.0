Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B98C4C25B76
	for <webhook@archiver.kernel.org>; Tue, 11 Jun 2024 13:07:46 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web11.9073.1718111266034094820
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jun 2024 06:07:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=UzF/PDMa;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.179, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-704261a1f67so1140973b3a.3
        for <openembedded-core@lists.openembedded.org>; Tue, 11 Jun 2024 06:07:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1718111265; x=1718716065; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FXcNPy4Z3bRdClAh+Cn6+AgXKGNd1kmXE2qAcsyLScE=;
        b=UzF/PDMagbVv7uvp8hGMmX2zUq0tjuHQZUGnaAPmId/mTsp19W2o5XyvLJe1qZ1fdi
         NTVPesniT2uS/Vp/LxyRkavx4gLelqCi4irEIk/cJZOfaUanW+99yYEKReAi6ncVGwaf
         eBbig+ogttmWCtjoYekfyIAekl6OECVL3QmDWBQDktt7PS9I+tbUneL/YyaFjO4jodXI
         6rze/5fzrCpmcm3/7P1iHGzTnPvw8YB/l1uzysMI863s9eIO35/Yh0MzVDAFFCQ/jh+9
         DqKhLlnrKX2V0YdZr0xbO+T7j7aaJGO04TxvzFfFf5rNnRVptXR27fkgOMTbSNs+Vt9n
         0OPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718111265; x=1718716065;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FXcNPy4Z3bRdClAh+Cn6+AgXKGNd1kmXE2qAcsyLScE=;
        b=iRPRzjv22B8r8UbKs5ZILD5ZtJRsrmclrOLPLx7lhe3tPUS9WxbEnBa9cfGW9q5+ZM
         0ZQQx9VyKzOl0HZOAa6t4A8xi8FGjImzC9KznZj92A39IQkNH8fXzSgUstE49eAFjFgi
         Gx5jap4Es6MjFzcqH4Cp+DzUXlaocHMDaIlS7NJ3eS3lWf2IgKFXyRFpMcBeXg3R4MDH
         KTfnMGdleLRKvXkXtlme90Sqi2bmnssmSrwDZIviIHaHEQtfXOKaR0ZQe5X/7RQ1zGnt
         oY2Qx9kjvsJTMj8D/Bk2ev1wDARMRIeZgpAO6E7Ysv0Z+vrx9Qq0imCFsEcKjWJO8Y0k
         nwLQ==
X-Gm-Message-State: AOJu0YzGGCRi9k77ixCsxiiDrTn/UV7y8j7yWzkzL9TCgw1jhomN5K6G
	avC8GtEOrFyt9vE6nbISX7Y+kMR2dHcVspXU/yw6ikahYgft1B+AqY0e2e85c6JdSFFEo5E+m4i
	A
X-Google-Smtp-Source: AGHT+IHEQ6NVtei6mQRcubtj2uNazRH/ltQdg1TChAXoejYqCKSWGN25n6qlRRx0hIYwRwYcfUuxAQ==
X-Received: by 2002:a05:6a20:9147:b0:1b7:ffb9:fb30 with SMTP id adf61e73a8af0-1b7ffba0ae9mr5240217637.42.1718111265247;
        Tue, 11 Jun 2024 06:07:45 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c3076dcf04sm4380915a91.48.2024.06.11.06.07.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jun 2024 06:07:45 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 06/10] git: upgrade 2.44.0 -> 2.44.1
Date: Tue, 11 Jun 2024 06:07:21 -0700
Message-Id: <3a7ef46ebaf8d4b470ef5b6803dc3b76c22a97c2.1718111104.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1718111104.git.steve@sakoman.com>
References: <cover.1718111104.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Jun 2024 13:07:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200515

From: Soumya Sambu <soumya.sambu@windriver.com>

Addresses the security issues - CVE-2024-32002, CVE-2024-32004,
CVE-2024-32020,CVE-2024-32021 and CVE-2024-32465

Changelog:
==========
https://raw.githubusercontent.com/git/git/master/Documentation/RelNotes/2.44.1.txt

Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 767f9515013790c9a6b945fae9de03c9e5b89b80)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/git/{git_2.44.0.bb => git_2.44.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/git/{git_2.44.0.bb => git_2.44.1.bb} (98%)

diff --git a/meta/recipes-devtools/git/git_2.44.0.bb b/meta/recipes-devtools/git/git_2.44.1.bb
similarity index 98%
rename from meta/recipes-devtools/git/git_2.44.0.bb
rename to meta/recipes-devtools/git/git_2.44.1.bb
index 78b00dd19f..53d67eb40a 100644
--- a/meta/recipes-devtools/git/git_2.44.0.bb
+++ b/meta/recipes-devtools/git/git_2.44.1.bb
@@ -164,4 +164,4 @@ EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no \
                  "
 EXTRA_OEMAKE += "NO_GETTEXT=1"
 
-SRC_URI[tarball.sha256sum] = "f9e36f085458fe9688fbbe7846b8c4770b13d161fcd8953655f36b2b85f06b76"
+SRC_URI[tarball.sha256sum] = "118214bb8d7ba971a62741416e757562b8f5451cefc087a407e91857897c92cc"
-- 
2.34.1


