Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47E48C0218D
	for <webhook@archiver.kernel.org>; Mon, 20 Jan 2025 17:51:35 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web10.42256.1737395489986043084
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jan 2025 09:51:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=wOKflXYs;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.181, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2165448243fso102750315ad.1
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Jan 2025 09:51:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1737395489; x=1738000289; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KKSYajtgORApz/ZIaAd+NvoyPUvcm3sCNJ071flUq40=;
        b=wOKflXYszJhK3+5+YmYPKhSEyQ4nUK27btBqExFjqC/nLKe2CcnJtEAGCMqjMnJq2v
         acc2Dtai3XwIoL/ETmnmv3W07+N6akYOR8RFB9LdIDcqPloAnLOcq0zNXzGfALtdpplF
         1nERRlhlF5IDGewRz6/r4zftt3dbLGDBQJNi3yKKTQI6e1YrR76NnYtBkHXPheZ9aNp6
         K8nW15JhXlrhzkuheoQeJSCzjlv1YXTlqFS8xPtLtPEDZEw6ExcE+++1TGaGxgY6r5iW
         F+Abkbp8lIjNTxUyxz07VetK1k+3e1Aj9pCziQt+p3RvuaV0+63BdgA+Wfc+VEPqENZO
         Q/Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737395489; x=1738000289;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KKSYajtgORApz/ZIaAd+NvoyPUvcm3sCNJ071flUq40=;
        b=TVYflQ9LW21TSvWoyZHu82ZgWNovi9TeMQU2BYAIlZ4LKxO4CwB3k0k08MVY354dy8
         wW4SBSr2vkgVQc9ft2YR0+x/u7lhvHCOzptkS+FAwGWil2mLd95XHVS8QLoirOZf4LeN
         KLkaAFHFS0PUjd2jx+pH+KVhxQlgWrthoxVr+8AxuSYqiCrtyDle8S/jY60xD6baipdS
         nDaO4nbc1X6GYEteitZnGzjSUzpeFir6B4jOPfevCQWwMQCRPBGihtCFevvhoF2rM91X
         I2HQ67CZ/fXNpemfy3IdjUtGYa8bsjRrrhYVHs3FXMn62bsIGcta/kYx1NqvjbWMj8+j
         H1Bg==
X-Gm-Message-State: AOJu0Yzv/1H0zozuxFslRl3wWlDwo3ILwMEA0CyTCiWNIwzSHcqZlCgf
	/4v+2dF5nNu8Y8OrFWPirmCp8ft2kVXR3EFMEbRZo0u+pXGLKhsjY0lGm7CksTDirgfFBboCjqw
	ZG3w=
X-Gm-Gg: ASbGncvFAD5NvfesBsTeemwyDgwxoenX2RI5skkSpvV4WUaPSSurMxi4IBAawnxwSJc
	rZket8wyhXHRXH3zzLpD6lLR9gQEm6sqWqtcQA5wPgO3YIEvwScGg5TnQrcwhyT5nHXOqME2CO+
	J32qcYBUjzTDXEHfPzDiTpN6H/WhHYEL/+4GLMKbLmqbe6fPdFmUv9wgRQZiu8cENxBqJldjB+d
	K9kvB8wsxGq8wEzyAYyWbQK7xei2Tr/VtIn1GUha6U2iziGmuyoMLK6eOQ=
X-Google-Smtp-Source: AGHT+IGYzwBEffZX+VjMEr9g7PZhNPRFnDDnua9PN/fWd9jYAV6SEfxak+d1HulBwqUL7p/YaMDA+g==
X-Received: by 2002:a17:902:f548:b0:20c:9936:f0ab with SMTP id d9443c01a7336-21c35637a1cmr168386515ad.47.1737395489283;
        Mon, 20 Jan 2025 09:51:29 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-a9bcdcf643esm6155565a12.38.2025.01.20.09.51.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2025 09:51:29 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 14/16] scripts/install-buildtools: Update to 4.0.23
Date: Mon, 20 Jan 2025 09:50:58 -0800
Message-ID: <2effc054b1484dd3c87652267bf590c17d2d6f76.1737395091.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1737395091.git.steve@sakoman.com>
References: <cover.1737395091.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jan 2025 17:51:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210058

From: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>

Update to the 4.0.23 release of the 4.0 series for buildtools.

Signed-off-by: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/install-buildtools | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/install-buildtools b/scripts/install-buildtools
index 616330dfdc..01253e5f95 100755
--- a/scripts/install-buildtools
+++ b/scripts/install-buildtools
@@ -57,8 +57,8 @@ logger = scriptutils.logger_create(PROGNAME, stream=sys.stdout)
 
 DEFAULT_INSTALL_DIR = os.path.join(os.path.split(scripts_path)[0],'buildtools')
 DEFAULT_BASE_URL = 'https://downloads.yoctoproject.org/releases/yocto'
-DEFAULT_RELEASE = 'yocto-4.0.22'
-DEFAULT_INSTALLER_VERSION = '4.0.22'
+DEFAULT_RELEASE = 'yocto-4.0.23'
+DEFAULT_INSTALLER_VERSION = '4.0.23'
 DEFAULT_BUILDDATE = '202110XX'
 
 # Python version sanity check
-- 
2.43.0


