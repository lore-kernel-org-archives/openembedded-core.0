Return-Path: <aleksandar.nikolic010@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D466BCCD182
	for <webhook@archiver.kernel.org>; Sun,  5 Oct 2025 20:05:32 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web11.17775.1759694724009671793
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Oct 2025 13:05:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WsNa0o9J;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: aleksandar.nikolic010@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-46e326e4e99so26556485e9.1
        for <openembedded-core@lists.openembedded.org>; Sun, 05 Oct 2025 13:05:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759694722; x=1760299522; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VaN6YlYGOE02T/G8KpOmcA2TQyxSmPR+VoKslvOcKH4=;
        b=WsNa0o9JAvgAg+VgAMzDtmErWcRW8LU4oJ7NNMfPGVYXqUazOkCyCSnPYIj73gH4Ie
         3JC8J6WVvrUEn0mP3Cf2PQJ5dJ4u0EP72BbLaw8Xg2Io/7Ul2ghiG+7EQxQ3mhGdBgMj
         sUiR/Pl7OGnIpj+gZmi54jPg/5AO1m6pzs2SsbD/FuUIaRhJrIebmQg7MhOza3E3bcim
         eJEIZk/lE89B+1X3CqMafzIg6Kp+9uJY6fX/VHzxcfXL60VgP2P6I8AcK5CgJlWIuLgD
         r+WJ3k7ZAvsMXBmTEn8i05IJzbgK9fySfm2oCm+V8+wmzaAduukBPzOPxagY99fhKnRn
         uSbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759694722; x=1760299522;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VaN6YlYGOE02T/G8KpOmcA2TQyxSmPR+VoKslvOcKH4=;
        b=BS2sKDOuOvHb+zBJMIMjykLVPGfzAnP5qXYuQmRNZjkDByPIS7ifbLQ6EN3ftSHgvV
         +zfI9Mbxve9SiOV3mgLreCUcM9+Zv3TOYKtxtdr9vsnaUG3TLfZGw3Lzi4Ezxa6IhLGY
         fSg8uBdTZiLr6mRd+QkagBT1dk+zRn/Q3RhLg87xWci9mWjrI2MLdvRlwC1hcTQGmdIk
         mfhHhO6qFw1xH68tZ5PQgzS2GnabeT8Nio/TKjXoiXnZPw8GAHF/N2kPc7jhgidsN+RN
         1L2BLyCrC2qx6DEriMOa1k8ox6L5XlQaTILuOuX0ZKNlCiR/7pPGV5F094PYPkrMgu7r
         9qqg==
X-Gm-Message-State: AOJu0YylM76kGAJJ4zc6V0EupTwsugWrnbGLqOQUchopqWeFes7NmH/J
	07djLvlCBCzdEhBC3alViLuKicwXoF0HT4i7bQsS2LLie2aXGGo1ulJ4y1flK3mHNQI=
X-Gm-Gg: ASbGnct2WcrX32meyHK08kfTc9YnXy+KMVE1i1Oq1AsznCCcSexiFog400MSi4ew4v9
	WwzNeFBBq4lkA1SaXVozxce471URwUGldv4h3W7LlLy/9rb+3+QIP4+tbmsn3nwG5kv6PGDkgBb
	/BfN4ppADfU/SglTYSffYN2FMwn35HMd4PlXIV/BtoahEfLA4zioUslMBOMGoswu6iSZPeXY37Z
	wlF+SA8+z2wixgucqbaPAprDAU8SP8xgCJo8mzmq6QP/yaqW9R+9OoAjRlYoOcM7mh9isT+WbCF
	nnRguyZn0mTpZYa9xla9lm//Q3xWuqoPwSxReUwlbtXPnarQzFvB0CyYxQDunFbgj788+tIYhP7
	YXS8K52UbIvQ6B7WTmzJuDXys0Wx7+Mb5HYaRan9ynUS6
X-Google-Smtp-Source: AGHT+IHeLD+tika3f+4hsGm/to0CJ0u/g2oVaZSL2W/firj3iUodEjaGg11SxoGh7adkDbbUmPszcw==
X-Received: by 2002:a05:600c:a11c:b0:46e:711c:efe9 with SMTP id 5b1f17b1804b1-46e711cf1bamr58790495e9.13.1759694722188;
        Sun, 05 Oct 2025 13:05:22 -0700 (PDT)
Received: from acert-swift3.. ([194.126.177.131])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4255d8ab8fdsm17487090f8f.15.2025.10.05.13.05.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Oct 2025 13:05:21 -0700 (PDT)
From: Aleksandar Nikolic <aleksandar.nikolic010@gmail.com>
X-Google-Original-From: Aleksandar Nikolic <an010@live.com>
To: openembedded-core@lists.openembedded.org
Cc: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>
Subject: [scarthgap][PATCH] scripts/install-buildtools: Update to 5.0.12
Date: Sun,  5 Oct 2025 22:05:15 +0200
Message-ID: <20251005200517.32697-2-an010@live.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251005200517.32697-1-an010@live.com>
References: <20251005200517.32697-1-an010@live.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 05 Oct 2025 20:05:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224443

From: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>

Update to the 5.0.12 release of the 5.0 series for buildtools

Signed-off-by: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>
---
 scripts/install-buildtools | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/install-buildtools b/scripts/install-buildtools
index 0dd23fe0e4..a449e45cff 100755
--- a/scripts/install-buildtools
+++ b/scripts/install-buildtools
@@ -57,8 +57,8 @@ logger = scriptutils.logger_create(PROGNAME, stream=sys.stdout)
 
 DEFAULT_INSTALL_DIR = os.path.join(os.path.split(scripts_path)[0],'buildtools')
 DEFAULT_BASE_URL = 'https://downloads.yoctoproject.org/releases/yocto'
-DEFAULT_RELEASE = 'yocto-5.0.11'
-DEFAULT_INSTALLER_VERSION = '5.0.11'
+DEFAULT_RELEASE = 'yocto-5.0.12'
+DEFAULT_INSTALLER_VERSION = '5.0.12'
 DEFAULT_BUILDDATE = '202110XX'
 
 # Python version sanity check
-- 
2.25.1


