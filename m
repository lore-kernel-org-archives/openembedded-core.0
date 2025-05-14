Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D6CEC3ABDD
	for <webhook@archiver.kernel.org>; Wed, 14 May 2025 15:58:21 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web10.105639.1747238292284296800
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 May 2025 08:58:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=QM4RskZC;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.178, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-afc857702d1so5885932a12.3
        for <openembedded-core@lists.openembedded.org>; Wed, 14 May 2025 08:58:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1747238291; x=1747843091; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+ZXLbJuWO8yH8IMbFDBZRxCRnEkeWZoPIwdPoZgqzmg=;
        b=QM4RskZChsJQml6tl91ToQ8saBF4MQ0OZC1xT0x1QfkB/9nxI4j63sKzbjEdFJvkJu
         S7IuTbiS22qvUetjIm/4WnHFG9EKO4nBuzt/w89sK2oZzkdMWhh4fr10eeRTbtPzOz2l
         PFTnBLtl5+qx4xsl6Nc0nHBA7GWuI0CyIvOoKKIY1IBsJIaBk68aOY7aIhg/3pmx+/gv
         7p5E+7E9EPgDS82RD+PIP2za6dQ4D3O8vGPCaIWdlR6+jpZLxEXuPpAzeZNCvAD+rXPt
         X9eXU/6nNWjsHtS9bFM111XIRCMqPnGa2Bi311Oarv6XunrlFbOFCulOgig9ULK1GXWD
         P8fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747238291; x=1747843091;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+ZXLbJuWO8yH8IMbFDBZRxCRnEkeWZoPIwdPoZgqzmg=;
        b=F5TIR3VX5uD/4z2dV0i8zyo66PIRjAm2tAjnLCbo+ECbm/m66MwXFbmHDAXgyiPYLZ
         d2FxQnm1Y+069YNRAVDMTAj3SN2Zd0mQnbLG4WKKv5HGZhMBX/UQjYQTzMhWvQ4gxrSC
         8qx/Pu9b1iZpL78UdGaJF7N7AXhci7LVVl9hEOPKqhPtY6zXcsYxD64k05jJVYoV8i0B
         2Hl4+B01e9V8KFbO3xL6OC2VfH9EP5oNOI4QoMHM12L3EcFyIAa3F6HBjqKpQyeNBN8F
         OZblbyEer7TkTo0zwiPb3HjNs+3FPZwhDuxG7dSLDINorr6BUhZAxu1HzsWXwWFfC3sn
         Ag9w==
X-Gm-Message-State: AOJu0YzyINf7miwLHfm6MaUys91bTupbTLZLTRVSIUJRWZHCDz3ZIlNW
	kwRAfNCO1lnLsiy+v5z97s4NVsPtrFVrnyC8085crPonT+dp7bZki/Zw91dNHB6pXPIETokRTaK
	X
X-Gm-Gg: ASbGncv7IhgrUsMBADJgyqWYSecSPbdr4LEfMsM8/byR/VlHAkAVinaDu/OsHs+y6lj
	7CJ5Khs2HNsoTdPjlU75U/ejukYL2dJHwbr+oqauMCkXmVM/HSgvGN1wNvVa6CMCXcGpR8UynxA
	ySuvnzgWX3uJ1Q3Bz564I/3UstjU7g9jUMqcAhnzuxSBjKB7OVVG8A4/s0VOQcST1SxWSHf63Pt
	uZZHvqiwK9JzA64hRSHQYUvbRP3oKiYVpYDOi6VamxDNcEgvpdWFupHVbxdrXEKQppgM6QA4/Df
	nZtoqcj4AJ3ocP/z9PqYwZzYVRtVCITaKY66PFYE
X-Google-Smtp-Source: AGHT+IGUwFbamoegqlYkIxoc6kH336iJYzKBkZUnKRBaJpJiX0iBTKhKXBWIgthr4fwOO4lKza5Rig==
X-Received: by 2002:a17:902:e5c5:b0:223:f408:c3dc with SMTP id d9443c01a7336-231980bbf7bmr51557875ad.9.1747238291580;
        Wed, 14 May 2025 08:58:11 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:671:bf16:d45b:ad8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc8271bcfsm101347385ad.125.2025.05.14.08.58.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 08:58:11 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 03/12] scripts/install-buildtools: Update to 5.2
Date: Wed, 14 May 2025 08:57:51 -0700
Message-ID: <23d9713bd16a042fdb4c15ff1dfaf7a0637da95e.1747238138.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1747238138.git.steve@sakoman.com>
References: <cover.1747238138.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 May 2025 15:58:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216507

From: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>

Update to the 5.2 release of the 5.2 series for buildtools

Signed-off-by: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/install-buildtools | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/install-buildtools b/scripts/install-buildtools
index 952da888ba..6750ffcbcc 100755
--- a/scripts/install-buildtools
+++ b/scripts/install-buildtools
@@ -57,8 +57,8 @@ logger = scriptutils.logger_create(PROGNAME, stream=sys.stdout)
 
 DEFAULT_INSTALL_DIR = os.path.join(os.path.split(scripts_path)[0],'buildtools')
 DEFAULT_BASE_URL = 'https://downloads.yoctoproject.org/releases/yocto'
-DEFAULT_RELEASE = 'yocto-5.1.2'
-DEFAULT_INSTALLER_VERSION = '5.1.2'
+DEFAULT_RELEASE = 'yocto-5.2'
+DEFAULT_INSTALLER_VERSION = '5.2'
 DEFAULT_BUILDDATE = '202110XX'
 
 # Python version sanity check
-- 
2.43.0


