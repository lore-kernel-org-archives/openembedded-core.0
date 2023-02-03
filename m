Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47B47C6379F
	for <webhook@archiver.kernel.org>; Fri,  3 Feb 2023 17:51:11 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web10.17907.1675446666894051681
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Feb 2023 09:51:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Y8F61WOL;
 spf=pass (domain: gmail.com, ip: 209.85.214.177, mailfrom: ticotimo@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id h9so5976286plf.9
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Feb 2023 09:51:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PK+w1jRDDAVID8NpIiUMSj4NCkxxDEfjo7jMlUubJ+o=;
        b=Y8F61WOLGS9W+L9AmJaFbkFBrgogiG2DNepQggd31mlLQnFiapub/bgBJoM2CVKL1D
         lSarkUfW8xBGVsCk34kZek1511K9wG2HBBX2DuzHn9rKDyayy9cBQAmRL3X+MHjHCTwZ
         3CYRLNzLRRzSnpSQ+IWomIFj+Gmcum76rgsUNqyC32g4bOo2vu/kyx/TEaY1Jb+P8Ph/
         Ihvogfhb/D5Q+ffsUdlwY6e51p/xHrZ/IiwJEi/bZcm6io23OUDofT8rOaiZ/YKJpS9f
         1VDs58BUEFr8apwcpcpPPnEkj33IUFHOoCOTtfStd7QmKxTSFNHfa8cVrxKrKk+P0FGW
         qxnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PK+w1jRDDAVID8NpIiUMSj4NCkxxDEfjo7jMlUubJ+o=;
        b=pj4iudveWIEPNSNQF/VhIQ8ur4Qo9X39otOWPdi+MDzGNL4TyO0llmowVKLJxgbRqS
         HgHTrku8hV0H4Ld2imnJmcq+hnrwcsBC3mhScVVu+QVaErBgo/oxhU3+iGHc3AZNSDXR
         4no4RMu7KP0+8fzcK3a3L6sXCPbCkY6D+EPGPftVv0b+o5+9vvfW1unj4jxohMJfaTbR
         WXbsALZjue99GHWPu302SP18DoCzmjAloS5zZ3sMgf1d2GQNqrcq57JRxiwFkIQB2WOW
         tdu/Oi+0zkL/8A2OYtdMQs1zCiIJswSoThvAegjeXzSYG2EtlNBulDGP8hiqh1d3OY/D
         9OIA==
X-Gm-Message-State: AO0yUKVg0jqVQSU87hD2Oyex3cu/bZJDopY7FxfdBZ+Sxe6fmLNJ7eOP
	Z6H3827ypkR3HRElsziUwylwVKDVccw=
X-Google-Smtp-Source: AK7set/u/b3UnxcS6bjjOXuKwqj4nVxjbQoAGZDmlso4ZYZvhcVzA6EW7SWjs/K1rlCUHV2XY7m1TQ==
X-Received: by 2002:a05:6a20:9b8c:b0:bf:58d1:ce98 with SMTP id mr12-20020a056a209b8c00b000bf58d1ce98mr4882397pzb.23.1675446665889;
        Fri, 03 Feb 2023 09:51:05 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net ([2601:1c0:ca00:cea0:46a4:f9f7:31dc:7e2c])
        by smtp.gmail.com with ESMTPSA id o11-20020a637e4b000000b0046ff3634a78sm1712880pgn.71.2023.02.03.09.51.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Feb 2023 09:51:05 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 08/14] python3-requests: upgrade 2.28.1 -> 2.28.2
Date: Fri,  3 Feb 2023 09:50:29 -0800
Message-Id: <e4179b23933ba6523547e1c56da7aef828545a99.1675446372.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1675446372.git.tim.orling@konsulko.com>
References: <cover.1675446372.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Feb 2023 17:51:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176742

https://requests.readthedocs.io/en/latest/community/updates/#release-history

2.28.2 (2023-01-12)

Dependencies
    Requests now supports charset_normalizer 3.x. (#6261)

Bugfixes
    Updated MissingSchema exception to suggest https scheme rather than
    http. (#6188)

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../{python3-requests_2.28.1.bb => python3-requests_2.28.2.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-requests_2.28.1.bb => python3-requests_2.28.2.bb} (87%)

diff --git a/meta/recipes-devtools/python/python3-requests_2.28.1.bb b/meta/recipes-devtools/python/python3-requests_2.28.2.bb
similarity index 87%
rename from meta/recipes-devtools/python/python3-requests_2.28.1.bb
rename to meta/recipes-devtools/python/python3-requests_2.28.2.bb
index 8de08d26200..2f397ddaadf 100644
--- a/meta/recipes-devtools/python/python3-requests_2.28.1.bb
+++ b/meta/recipes-devtools/python/python3-requests_2.28.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://python-requests.org"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=34400b68072d710fecd0a2940a0d1658"
 
-SRC_URI[sha256sum] = "7c5599b102feddaa661c826c56ab4fee28bfd17f5abca1ebbe3e7f19d7c97983"
+SRC_URI[sha256sum] = "98b1b2782e3c6c4904938b84c0eb932721069dfdb9134313beff7c83c2df24bf"
 
 inherit pypi setuptools3
 
-- 
2.30.2


