Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9522BC4332F
	for <webhook@archiver.kernel.org>; Tue, 31 Oct 2023 21:19:14 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web10.7342.1698787145791836816
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 Oct 2023 14:19:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WGeMQO1/;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: ticotimo@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-2809b4d648bso901491a91.2
        for <openembedded-core@lists.openembedded.org>; Tue, 31 Oct 2023 14:19:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698787145; x=1699391945; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rOn2wWn9YlPBiggo5H7XXNdhpbDg07fQh07Q/djq+lc=;
        b=WGeMQO1/5WRIFHluPM4xvdi46st6cl/aZ9s6/JWlCrZ54Mgl7jKgXkWlpv0BfE7rEu
         55pKIKeGy/tW3jSb5X4ALFgjpzkW3fqWib5L6nlr64XRZdCLBDEtaqSPDfcErnGft7tA
         nkqjfZaJ+o+XM+5WgmvQXCp7wAKzhgAD3PpqYpV4XgQYftyg66WZoQNclasYXm60+oEn
         IsykWvd0BXEZz4LKJbdy/CPaMRPpzdE+c3SFRSgpajIUbkBjShcBP+Vq89XtgCub9epR
         foQ7QnaExn4G0VWep2w+ri9nuYUCvyR0vQH3GElv5cJS8FzR57+RyZOwcGW1kTTo7MbZ
         royw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698787145; x=1699391945;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rOn2wWn9YlPBiggo5H7XXNdhpbDg07fQh07Q/djq+lc=;
        b=J9XjgvS4FFadLKF6k0xvvqoLdAfkQ8yIYtGSTEWjND/kQhdIi25IT7Trno6sZzANf2
         YLiwzAVZUoBc1yh2UV+WFf+xFBPm9ntTAOkFAtxpPU6/TpkJRPBH7jgNlWcpnWR/6H1s
         LmgRhRQqSQj8xeCDBYivXa0zCEX+7S48Qer8dMVGEFdxMU+rSWjVK2zEVYazUmUVSSHU
         ZQEUY+ZKDyuFzSnkLlBV91JmVAqt0LCZjFXUM7WWhJQPjW029EEoXxHa+BUj+Njhtgtb
         WMIblgp/i3+QUthB2vYeZiDOQKsf9ybdXr47kWIV42wekU+ToiZoem6bpCMixXkWBI5x
         8+8g==
X-Gm-Message-State: AOJu0Ywxh45GPFJwn7itOGRbm5hdOThjkPgP0rlk3v4uzAxtQ4ACbqng
	zcdWvU447yVB021gP3utX3ePTdVoLEHxGw==
X-Google-Smtp-Source: AGHT+IHyA+xI5kO6mx3wXVGTJUxtmTe7+HuV3q2dyHGjLMwZGw5fAdv2QrMTdjDqSZuL06NFb+CQLA==
X-Received: by 2002:a17:90a:1997:b0:280:6d53:f5d2 with SMTP id 23-20020a17090a199700b002806d53f5d2mr5398827pji.11.1698787144750;
        Tue, 31 Oct 2023 14:19:04 -0700 (PDT)
Received: from chiron.hsd1.or.comcast.net ([2601:1c0:ca00:cea0:438f:a4f8:9154:7176])
        by smtp.gmail.com with ESMTPSA id m2-20020a17090a34c200b002800e0b4852sm1631282pjf.22.2023.10.31.14.19.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Oct 2023 14:19:04 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [master][kirkstone][PATCH] lsb-release: use https for UPSTREAM_CHECK_URI
Date: Tue, 31 Oct 2023 14:17:57 -0700
Message-Id: <20231031211756.3337606-1-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 31 Oct 2023 21:19:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189869

http:// results in 301 Moved Permanently and redirects to https://

Also drop SRC_URI[md5sum].

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
Steve,

Really this applies to any stable release... this is after all 2001 code.

 meta/recipes-extended/lsb/lsb-release_1.4.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-extended/lsb/lsb-release_1.4.bb b/meta/recipes-extended/lsb/lsb-release_1.4.bb
index ad16554e985..00d8183a4f1 100644
--- a/meta/recipes-extended/lsb/lsb-release_1.4.bb
+++ b/meta/recipes-extended/lsb/lsb-release_1.4.bb
@@ -14,10 +14,9 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/project/lsb/lsb_release/1.4/lsb-release-1.4.tar
            file://help2man-reproducibility.patch \
            "
 
-SRC_URI[md5sum] = "30537ef5a01e0ca94b7b8eb6a36bb1e4"
 SRC_URI[sha256sum] = "99321288f8d62e7a1d485b7c6bdccf06766fb8ca603c6195806e4457fdf17172"
 
-UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/lsb/files/lsb_release/"
+UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/lsb/files/lsb_release/"
 UPSTREAM_CHECK_REGEX = "/lsb_release/(?P<pver>(\d+[\.\-_]*)+)/"
 
 CLEANBROKEN = "1"
-- 
2.34.1


