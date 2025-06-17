Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C38EC7115B
	for <webhook@archiver.kernel.org>; Tue, 17 Jun 2025 16:04:43 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web11.23244.1750176279545845375
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Jun 2025 09:04:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=RSq73mbt;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.174, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-23694cec0feso8124435ad.2
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Jun 2025 09:04:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1750176279; x=1750781079; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QktZRXwv0rQswqdvIxaywlQxKaZSrGVrTRBRF0Rc2no=;
        b=RSq73mbt6TxHrUu3ocNXnundn+yxqYNPZofgTET5Mg6Pb0ldCb+VlU1V969VPQNHej
         C2Q65qw8CFiUnOw8hSYqqA+ETyRpci4rym+fXF+mt/154gNmcb3KY2OLJjPIllr6gUgZ
         V22X/24FJbxLrq0ejFNmRvweqQ6RcWBsCQmyaj5cHOveWn3E5JSykJtvggZup09Ww62D
         caS6zBmVmuv3uHKh/F345sWCrwbpY+hUTV7Qrd3LfiIAMFcPmMn/j1oerPIrWolBPs1s
         FmI42Z+ZQ3ZWlwmWU/QIpDxBPzNxtfbWDgyQbH4rApXC+jBaHp1njAwwqHguiNSISHN6
         zM6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750176279; x=1750781079;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QktZRXwv0rQswqdvIxaywlQxKaZSrGVrTRBRF0Rc2no=;
        b=lZhj6KcFZ1ZRRMxulSIozAh0sLExTIdJ0gaiMJRL0NgMwP3r0mjmGSJabAChD1jvJ5
         VAj+8Q50tO5C2xFWbSdHZj+V9EH1KN72NsHF2CEUZoqqsehGNzmRfgenIZUXTBcJMYEK
         qeTSzRs+LL2t+tYufzH/nWG9pSfcu2L9855EeTmPyOEswOGXAgXD2nLNpw7J5d4f9km/
         iFW5ysNmV18f+aeN98jvwjKSraEDIsZQbvrHz0tXK1K6RGn4weH8Xr+ETRzgFXj7vXON
         bWgLVgaIa43K2ZHSwFoWwSXv5DcH+8Zy3UU5cpa1cbFLevbeJ5ZCHMddyXR53aoBHowO
         Wlbg==
X-Gm-Message-State: AOJu0YzGwpztvBMSKotnCKrJIywwG3YoPX59Y6kDq3Lq0UkNGwrp22mc
	Kv9q3GAXyjeOJPv8pLeOy4AJCKDbRfAJUj4WqlWQ0WISXd202n5EOKUFIgjp2vlPdaiD3MgiiOE
	l0ffq
X-Gm-Gg: ASbGncutw5oTHoTGJC/xWNwxm3onzKoNDAwXCoGLq5smsCJUn3A//tzz5hG8eejZoMF
	HYdi5RPuBpquBZg7QaUQvSQlcacJ8ZzBmBv6K1sBilpH8zzM4+aQZvwvSIE6UZxLfV7ALz/S3fW
	KjBQo8clOcoqD5EdngLf4qJEUClijETyhC4fgYfK8fXbkDmLA7cIMAoASlju9tmaq+o/lYL7DVl
	HY6Jrmy5NAncvT40NZxBVTTR/A4EfcZgWG+RpR4FafoafngciuJRzLKMR2+WY3AEtVprY63q8SW
	FEE4Ouil82P9Y1fRbJ5lxo3LR3W4Oj0CCFPXuXtd5gd3nddKDoFUsA==
X-Google-Smtp-Source: AGHT+IFRDGg0AHuld2+NAWp5OY4kOWdpvsSdAuNRjI5eNxTMImBx/dBU0oHrSSMP24ZRB7WvR+knwQ==
X-Received: by 2002:a17:902:cccd:b0:235:f298:cbbe with SMTP id d9443c01a7336-2366afe481cmr248308015ad.12.1750176278674;
        Tue, 17 Jun 2025 09:04:38 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:7ce4:2bd1:2434:c118])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365decaf71sm82043365ad.217.2025.06.17.09.04.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 09:04:38 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 3/8] python3-requests: upgrade 2.32.3 -> 2.32.4
Date: Tue, 17 Jun 2025 09:04:21 -0700
Message-ID: <0f0a06ccef45792f65b823ecc0ef10525d94084f.1750176125.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1750176125.git.steve@sakoman.com>
References: <cover.1750176125.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Jun 2025 16:04:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218904

From: Jiaying Song <jiaying.song.cn@windriver.com>

Changelog:
https://requests.readthedocs.io/en/latest/community/updates/#release-history

Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../{python3-requests_2.32.3.bb => python3-requests_2.32.4.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-requests_2.32.3.bb => python3-requests_2.32.4.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-requests_2.32.3.bb b/meta/recipes-devtools/python/python3-requests_2.32.4.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-requests_2.32.3.bb
rename to meta/recipes-devtools/python/python3-requests_2.32.4.bb
index 36ff75f87d..b86ecfba52 100644
--- a/meta/recipes-devtools/python/python3-requests_2.32.3.bb
+++ b/meta/recipes-devtools/python/python3-requests_2.32.4.bb
@@ -7,7 +7,7 @@ SRC_URI:append:class-nativesdk = " \
            file://environment.d-python3-requests.sh \
 "
 
-SRC_URI[sha256sum] = "55365417734eb18255590a9ff9eb97e9e1da868d4ccd6402399eaf68af20a760"
+SRC_URI[sha256sum] = "27d0316682c8a29834d3264820024b62a36942083d52caf2f14c0591336d3422"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.43.0


