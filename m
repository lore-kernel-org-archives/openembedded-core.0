Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEBEACCF9E0
	for <webhook@archiver.kernel.org>; Tue, 28 Oct 2025 13:46:28 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web10.12193.1761659187290607105
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Oct 2025 06:46:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=vNJkH+LA;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.170, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-290ac2ef203so57135595ad.1
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Oct 2025 06:46:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1761659186; x=1762263986; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2V+OXtUW2gznBBneNeixHhgmVFE3FCebIDyy5p0pkPA=;
        b=vNJkH+LAa4yF2zUQsnAILO7d0JiJ97Sup75zZrp8tCRC5DnvJAJ4fHhg0EqQ7AvhZv
         91zkbSWynRMI1oR2EPlS01WmgRqvmudA9I5IhQ/0e1C2C4CyaArwF+KGPOv10brIuhsZ
         SndCDjG2uvYco6jeIaO0fcd6PaCunoGfkE73ZspylJqnHRVC/Mpf55fA0hT+r2QJkjpz
         bgUjdKSGevsWjKQQg71kPJLWJDc/tIJKVogrDCnOK5EavG/8rhE1fhq1ggpA3JDnwjgU
         naPzJ1O77vXDAzyelk+Co4PuTQHENUSmKcO9sdIcjBR1/PWBfILE0kaspEITlAVWA7EJ
         7urQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761659186; x=1762263986;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2V+OXtUW2gznBBneNeixHhgmVFE3FCebIDyy5p0pkPA=;
        b=Uy1tB87WXpG9cPx7Hpi3n5REvF6Ujf7qvoiZLdW9JwsZPxEVHC/sHo69dRhadKQDEI
         U9DDEg4XXGnAUQOwu8hlSCZ8/p462BE7KLXTF6QcBtzS6MZH4XYNUBLlzSPlC8NJikYc
         aFm0aUikJN9dLrmNLZP4VhyJ38APeoYMsB8ilYG4eiA7sPsmh+k2WFGaGlKu27OIXUBQ
         /HminAdUR1N4kvw2BKb/mSodIcZ+8i2r8kFPfXL1QL4kAmeYUNWzG3Q9w05pKE1v4uSY
         DmG+MlBfbKPGkrTtz5nQAAhnpQfpwkpMYWJreXgET/IMUB4xkvGa/sJ49a90k69vDrAa
         GmVQ==
X-Gm-Message-State: AOJu0Yz56ofP0FLybmxuUZP8Rwv9IKCL8ZdDGDP4TTlzKIxhrVTFXiN2
	VKsMeojQT7+3eOV7w8OS7HsqbPlmGJUxVhOSINh5n4mbGcWB0g2hYsiq+kS85vGDsKn84bUm0HU
	4zLjevBM=
X-Gm-Gg: ASbGncvhKBLJ3OVKpOvOK0B/3c4E9AtseyE8wft/OX3D59ANvIgsDzJQ78HDAMwyo/q
	k/E+mspR0HKobBglM3r4KFgTWSgMnnkQWfXyMCBkqwKW3PAgKAaS/Zdsgu8guzVirO/Ji6PTg9i
	tRkmr8UGk0K6+Bo+1awUZKqzKOWuZwxHp3SUVFzuxdo8reKMDleav1gzMoXNfpaRBPIPtJ23pBw
	CZf9VvLNQbF4gYFroSujpyknRMphyA8ZwJejCSpnZut3XqPUeaKz0Ozl81TDwUXRbrw9hKyX/h7
	c4vD4Fc0WXEflpccftN/SZkgtIjruGdExqMd6sCe7nSIvtWDhpqwicIgSUndA2TkBSaTtc7xmiv
	jc80kn1jiBKDeKALe4RNL6bfdSTroPCYHVTW2Stt1JsRjMIpecY0IbGJGVWfVghVMvgqCFro0de
	qW+g==
X-Google-Smtp-Source: AGHT+IEzO+i6wnkR1s8mHMLzAL56ZM70hAa4qdBaTKEvcWop8d/5zUxr4TFR+vA5QYZfgKZqR11TpA==
X-Received: by 2002:a17:902:d4d2:b0:267:87be:505e with SMTP id d9443c01a7336-294cb3d8384mr41592625ad.23.1761659186526;
        Tue, 28 Oct 2025 06:46:26 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:2bae:51f5:3bdc:4c68])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498d40a7esm119894605ad.70.2025.10.28.06.46.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 06:46:26 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 1/8] libpam: mark CVE-2025-6018 as not applicable
Date: Tue, 28 Oct 2025 06:46:11 -0700
Message-ID: <3f2a9ad03326dc87681cf47ed5f73712ebaa624c.1761596406.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1761596406.git.steve@sakoman.com>
References: <cover.1761596406.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Oct 2025 13:46:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225401

From: Anders Heimer <anders.heimer@est.tech>

CVE-2025-6018 is a local privilege escalation in PAM that requires
`user_readenv=1` to be enabled in the PAM configuration. The default
configuration does not enable reading user environment files (user_readenv
is 0 by default). Hence this vulnerability cannot be exploited using the
default configuration.

Signed-off-by: Anders Heimer <anders.heimer@est.tech>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/pam/libpam_1.5.3.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-extended/pam/libpam_1.5.3.bb b/meta/recipes-extended/pam/libpam_1.5.3.bb
index 4c27767ab1..79a0e9f694 100644
--- a/meta/recipes-extended/pam/libpam_1.5.3.bb
+++ b/meta/recipes-extended/pam/libpam_1.5.3.bb
@@ -39,6 +39,8 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/Linux-PAM-${PV}.tar.xz \
 
 SRC_URI[sha256sum] = "7ac4b50feee004a9fa88f1dfd2d2fa738a82896763050cd773b3c54b0a818283"
 
+CVE_STATUS[CVE-2025-6018] = "not-applicable-config: Default PAM config does not use user_readenv=1"
+
 DEPENDS = "bison-native flex-native libxml2-native virtual/crypt"
 
 EXTRA_OECONF = "--includedir=${includedir}/security \
-- 
2.43.0


