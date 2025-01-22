Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D7ADC0218E
	for <webhook@archiver.kernel.org>; Wed, 22 Jan 2025 03:03:47 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web11.34196.1737515022105981546
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jan 2025 19:03:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=e7JV4r0o;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.173, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-21649a7bcdcso108011555ad.1
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Jan 2025 19:03:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1737515021; x=1738119821; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=edVDBTplyvZhND1Zffk5FaNM2n2nHRZzfvqSsvtCTUk=;
        b=e7JV4r0oEpakZ8rFMgspKf2m+bP5B4zDjeAZMuOOEwQfM6H6FKDP89QHGV58xEHjTh
         K+kkefA0lJVH6vPdEvFaHGdkunoNGeZg7fnfe1ert5dQDfOPWOwnQ47nBNuclCVnccoW
         TeALgW5PX9r5UHF3ngnXahveM53pg4dy+oKxN+Oeh4z+uPszt9pikcWAlpQjHqiZy6Hw
         +bo0wssTdhfTrL5zuXs+tvBRgtIfhHeXow5bIKD1uGY6pfw79/JR4eA4UkNW+FsmVKCR
         KZrOZHXIyQymwtYtpFL3QILGbisjAi/vz7dQXiFfS9cAWfXJFyf4//TNi0BcxaLubsOq
         MPlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737515021; x=1738119821;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=edVDBTplyvZhND1Zffk5FaNM2n2nHRZzfvqSsvtCTUk=;
        b=DSGvp14cA6YdkTF3Qj4rq8z2Os5/vSaU1nHchKzSRLHI1c3mIHBFDbyPvbMb0cGDLe
         G1pHZAjogWuFBjaxfgIXNFs5YJjZU/JnH/CVaRw9I6LPRfZUQJlVUCQ8itIp7/qpvI4o
         L1DnRf19ZQ+DLAnXIK5uaA2Bhln9rjJK5yBtbCr4PXbWYc6T62p94H6psJ2x7H5AiJJJ
         swI2OqbQsvPuejPqPAJ7l19iXoDtsRM0XXjUHSKVsqcfyistYN0EFL0qi8e4elnpFURn
         HzHLf2vJpa/IN7/98p9ZfF5Y0/PhLScc8CnJNeigo1A3ToJrwPQbYrwm/PQYNjtm5NKZ
         tNhg==
X-Gm-Message-State: AOJu0YyfQnKplJZw0SBTj57c8YVXlWSn+OK6g4lRLJzaf4GP4UwlmFmr
	LYGNwoKzpkWZNYPDS4LaGIzHe9bXiquFdhgkB0uFWGGKo0DLA1cLBXcVqulOlqWaoxPkEyOohJk
	20+o=
X-Gm-Gg: ASbGncsGiqcT7JYFR5kQvPPsuAYvaFK5/S2mLkYNu4isNfBUOeTVRd/PThaJrZpCOZj
	U6i9ak1kSUMsBfOkShuBcpbdsqHFJmpopkMceE3bsgp3Uy1vUQKXAUUAR3xqcUuLvvfPaiOETy+
	TnSE6df+sdgAqO5guQTXJX7rAoz0k49I0xl9gfIywFMwL9x8Jtlv+CtN2jyg6k6T/rYQ9H7Nwkd
	WoP8s+/PWd2kmnNL4riRt76rD1LSpu+mFHxS+pP2WXiOM/xbzd8rebqI5k=
X-Google-Smtp-Source: AGHT+IGrj6Rr9+hYLn3pmMUVvoOA3VKm0I0o8Xr3cQdAXOuqMnWiTKp7nD3M+sz8770P6ITUr8ehdg==
X-Received: by 2002:a05:6a20:394a:b0:1db:de38:294b with SMTP id adf61e73a8af0-1eb215fb30fmr32246160637.38.1737515021313;
        Tue, 21 Jan 2025 19:03:41 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72dab8112c1sm9800337b3a.37.2025.01.21.19.03.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jan 2025 19:03:40 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 08/14] scripts/install-buildtools: Update to 5.0.6
Date: Tue, 21 Jan 2025 19:03:04 -0800
Message-ID: <6c0372a67b410b8f7ba9b43ffd17efd2f3b439aa.1737514842.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1737514842.git.steve@sakoman.com>
References: <cover.1737514842.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jan 2025 03:03:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210122

From: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>

Update to the 5.0.6 release of the 5.0 series for buildtools.

Signed-off-by: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/install-buildtools | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/install-buildtools b/scripts/install-buildtools
index ee6bfb89eb..972671d50f 100755
--- a/scripts/install-buildtools
+++ b/scripts/install-buildtools
@@ -57,8 +57,8 @@ logger = scriptutils.logger_create(PROGNAME, stream=sys.stdout)
 
 DEFAULT_INSTALL_DIR = os.path.join(os.path.split(scripts_path)[0],'buildtools')
 DEFAULT_BASE_URL = 'https://downloads.yoctoproject.org/releases/yocto'
-DEFAULT_RELEASE = 'yocto-5.0.5'
-DEFAULT_INSTALLER_VERSION = '5.0.5'
+DEFAULT_RELEASE = 'yocto-5.0.6'
+DEFAULT_INSTALLER_VERSION = '5.0.6'
 DEFAULT_BUILDDATE = '202110XX'
 
 # Python version sanity check
-- 
2.43.0


