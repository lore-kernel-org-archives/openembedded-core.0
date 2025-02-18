Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7147EC021AA
	for <webhook@archiver.kernel.org>; Tue, 18 Feb 2025 21:15:38 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web10.7511.1739913335497911239
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Feb 2025 13:15:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=yU2VULUd;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.41, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-2fbfa8c73a6so11120481a91.2
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 13:15:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1739913335; x=1740518135; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UgkwGBuc+6zeBCYAlgEWZccrljlNra4lbnIdRVBll+w=;
        b=yU2VULUdVyLVeazfcLDeGphLLh6xko6iXnIb9/dpdPCkdwwZg536sHyLBWA1zzA2Nl
         qhYrPvLh1h+MLfsBlbmHR0KIL1wETr0TXhvkRwpcdqF11oGdEfHjahZPYofZC7Jt++gu
         LidQcVq52WSMIoJpxCHLvZ0iA/wfpUMfyUsc6vojN2sEhjnQnlzucahic/Np3H/8Wuef
         2W2iU8laRs9/hR5RhuHUJGim+5ZJyoupjzJtooH0oEI5ggbWeSfG/rBNdLrQ9KplOwKF
         dKYodW3dJUY9nfJaEAHK+J60/PDrfPFqtM3QspkRHaA96mjQN1O4VemeZEzl9Lk3gSK5
         YI5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739913335; x=1740518135;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UgkwGBuc+6zeBCYAlgEWZccrljlNra4lbnIdRVBll+w=;
        b=lnLIS+zJ4/sGBhRAnkjpsbRMMO38kLdvGllxRwk6318Os8xapY16VIojU5N3XRNuqz
         21SqqQsJkhxl3u0L5dPpYh0fS3POHPixFvcwqYlzQeS/EDYxGvL/Yl/RlLXxwcqaHCq7
         AGMi74qC/XSsPe7JIlIPFH22L/vriFsnNaPNLH9AF5tfWlQPctKcIEORpmM+/WPaGdXL
         bXTdqXv7BYgUXJU/glAZ9HgR1XDIwCIiaJfIpfNimLV/BGbXMb8WaSydhzJyGP7pMZZg
         C1SW3laYlvO49o9pW65VelKA+rrZ0OPKi+BtFUxLNrqRwXde1HQdY119wNM5cCQRQ1EQ
         T3TA==
X-Gm-Message-State: AOJu0YxekcO1SgoxkIQPDqI50scWSJOll1Y/+7yrXsVJIh4RbdgbUbjx
	4+pnJiFtx0006KTsVoCalF+76pDzbk3TuRCoYlFZiSogmRR6S3zvttEz3ia78g7G7pcvB75zdGE
	3
X-Gm-Gg: ASbGncthr7nuQqi/JOOY0QlRHNy6WU36v5g1i1yvno31tDoDmRubX4YKgA6RTBh7hwE
	kIx99sSwOZ/zp5SXPxNAxq13V6zN8z4l3AOjkiPwofsLPT0+FwbAXPbwuE5/mcGj00x8C3WAUGp
	h7shW6/lMCsBLGWUtDchvVw0INWYxe2XBmAIOMZK2ouKdFcam2ETiNojKEc6wB/2AqYGulfYTSq
	4nZyv6PEKshPoCeMj2JbH6xbNKYCrS3FER5T+1b7AEor+BCnrU+7y1cykgRJGTnw8YDkIGjkeQo
	f/iTFqo=
X-Google-Smtp-Source: AGHT+IGENnL68Nl97jSLf5Tjrje71wKCLq0uoyfqeLPgQq/2RGzXH77oFnRW+BCXAAgLIFdkwLe2Hg==
X-Received: by 2002:a17:90b:3b46:b0:2ee:b0b0:8e02 with SMTP id 98e67ed59e1d1-2fc410404a5mr22797560a91.28.1739913334740;
        Tue, 18 Feb 2025 13:15:34 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:83c7:94a9:a555:bf05])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220d5349056sm93720055ad.22.2025.02.18.13.15.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 13:15:34 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 1/7] subversion: ignore CVE-2024-45720
Date: Tue, 18 Feb 2025 13:15:19 -0800
Message-ID: <a1b322d5dde27461a6b972b051a120ef3c96d204.1739913090.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1739913090.git.steve@sakoman.com>
References: <cover.1739913090.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 21:15:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211653

From: Peter Marko <peter.marko@siemens.com>

Reference: https://nvd.nist.gov/vuln/detail/CVE-2024-45720

This CVE is relevant only for subversion running on Windows.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/subversion/subversion_1.14.3.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/subversion/subversion_1.14.3.bb b/meta/recipes-devtools/subversion/subversion_1.14.3.bb
index 1ef3d498a5..679228cbb8 100644
--- a/meta/recipes-devtools/subversion/subversion_1.14.3.bb
+++ b/meta/recipes-devtools/subversion/subversion_1.14.3.bb
@@ -19,6 +19,8 @@ inherit autotools pkgconfig gettext python3native
 
 CVE_PRODUCT = "apache:subversion"
 
+CVE_STATUS[CVE-2024-45720] = "not-applicable-platform: Issue only applies on Windows"
+
 PACKAGECONFIG ?= ""
 
 PACKAGECONFIG[boost] = "--with-boost=${RECIPE_SYSROOT}${exec_prefix},--without-boost,boost"
-- 
2.43.0


