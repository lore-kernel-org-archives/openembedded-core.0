Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 375CCCF649D
	for <webhook@archiver.kernel.org>; Mon, 30 Sep 2024 01:58:06 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web11.45596.1727661483325180490
 for <openembedded-core@lists.openembedded.org>;
 Sun, 29 Sep 2024 18:58:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=GMeHqcx3;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.51, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-2e06f5d4bc7so3328929a91.2
        for <openembedded-core@lists.openembedded.org>; Sun, 29 Sep 2024 18:58:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1727661483; x=1728266283; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LEZ5E0ehGS/bj56d2PXfExf9ESbTQ+lhmIebujTI8PE=;
        b=GMeHqcx3ooEXuYpezVza0+XqPcbIyl9SJ6ESgfk5kWkDXg+/Nn989HMkJfvuMwtLNk
         q47LO2v+YPs57F7Ow7pi7hy0iP6F4S4zIvEhUnSnhRoepB/0DUr3B8JUxxwSSEFVhlVS
         OzC7dSQxO9njQW3LloQkNLYgoApVlyP0C4esCshKcVBVHzCx3YlSv2Qjc1QEKRhJWZRl
         ijN38seR/0siMT8NoSXQJQvniZcPMphfdFWHgtG0pHa93dJGUMxDH/8QzZn/+fKcB9tf
         LzKdTPYJkLksgytHHYCtQY+QDNfnMRPx/5oSDH4mtLH/zdYZgxld7/cq38yLjQfkr136
         wP4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727661483; x=1728266283;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LEZ5E0ehGS/bj56d2PXfExf9ESbTQ+lhmIebujTI8PE=;
        b=uzqcqYdfaVexQnXe2fXcHivuyjah/0cMLKM2HGFijJy1XIAN3TuoqFtj8upsjYuN0j
         m9grJIjk1twTmXsZQruW7cXBwSU/Zb2kh7ZhX1uhQm91t7lInzaMo5dpKKBXHOfqAA+E
         WhwYolZpq0S0MPpMHc7MBHRTRuXLejQrzyRZD2UsbeAxgQMb2FZr7CKy/JPC7+FWjjEr
         LjprRUlmANNopvKG3GWCwpDzQFO4Vzpcvuet9sxxpK5IpWKswcxg10/LOBf4lEAXPN8i
         Zs9nyZsH5gH+4yueIpnaTFl1zMw+4ItvcubI7QlFJB7HdUq48n0+/3CXaptoh4ZaR/gU
         669w==
X-Gm-Message-State: AOJu0YzRMe1s/1laOui3SjYGrNns9JCT0hb7XRCe0SRtt7cozmwas2hc
	TK6jEtiZqkqqpNpHnlgbq2QW+rkDCcr7Ti2u5sC1Xcu5QqTM3DNS5+Se8Dw/H0qJH8iSh61INri
	G4U8=
X-Google-Smtp-Source: AGHT+IHaYOkDptNdxUjuXmDea+ZM9rSfJq0R/yZnIVSB7S0ghEwedtI/SPZR7AXcX1neM+y7SjNqbA==
X-Received: by 2002:a17:90a:8a8e:b0:2d3:ca3f:7f2a with SMTP id 98e67ed59e1d1-2e0b8b1dbb9mr12473351a91.22.1727661482579;
        Sun, 29 Sep 2024 18:58:02 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e0d4af744bsm5496070a91.23.2024.09.29.18.58.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Sep 2024 18:58:02 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 20/27] install-buildtools: update base-url, release and installer version
Date: Sun, 29 Sep 2024 18:57:15 -0700
Message-Id: <2c4b9af5e3f385b296e2ce0e1d8a0c43937a7334.1727661284.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1727661284.git.steve@sakoman.com>
References: <cover.1727661284.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Sep 2024 01:58:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205082

From: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>

Update the following default values:
- DEFAULT_BASE_URL (https instead of http)
- DEFAULT_RELEASE (5.0.1)
- DEFAULT_INSTALLER_VERSION (5.0.1)

Signed-off-by: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b2ebb965a5aa128b05ed7ddc9216171463777732)
Signed-off-by: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/install-buildtools | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/scripts/install-buildtools b/scripts/install-buildtools
index 4f85fe87d4..5b86c13077 100755
--- a/scripts/install-buildtools
+++ b/scripts/install-buildtools
@@ -56,9 +56,9 @@ PROGNAME = 'install-buildtools'
 logger = scriptutils.logger_create(PROGNAME, stream=sys.stdout)
 
 DEFAULT_INSTALL_DIR = os.path.join(os.path.split(scripts_path)[0],'buildtools')
-DEFAULT_BASE_URL = 'http://downloads.yoctoproject.org/releases/yocto'
-DEFAULT_RELEASE = 'yocto-4.1'
-DEFAULT_INSTALLER_VERSION = '4.1'
+DEFAULT_BASE_URL = 'https://downloads.yoctoproject.org/releases/yocto'
+DEFAULT_RELEASE = 'yocto-5.0.1'
+DEFAULT_INSTALLER_VERSION = '5.0.1'
 DEFAULT_BUILDDATE = '202110XX'
 
 # Python version sanity check
-- 
2.34.1


