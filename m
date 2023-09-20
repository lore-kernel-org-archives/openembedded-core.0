Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA17CCD4929
	for <webhook@archiver.kernel.org>; Wed, 20 Sep 2023 22:31:23 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web10.3142.1695249078933224637
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Sep 2023 15:31:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Vhi5cSBP;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.178, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-690bf8fdd1aso255102b3a.2
        for <openembedded-core@lists.openembedded.org>; Wed, 20 Sep 2023 15:31:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1695249078; x=1695853878; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L41TuZ7o3nzCpD7sP+XfQDRSK68DXwDBksUA20+Aths=;
        b=Vhi5cSBPkG12r84CJs7z/9zDrotSml2tMbfBPibrF7b7Jqlr930oqw3+mCqQXNVID/
         TuQeYioRzITTekHrx6T9sx0YyCwI3JHtfXqDdnuwHV2QuZn7tZdlEGxxvShMHLLksyIX
         E9S0S9loR6Wty+NG314YK5/lj6392SK0J8H4UWRlbiwXH/HiFKu+SaRXdhIc/Njynt+b
         jiT6PTWRbf0Nw0nR5fbkdgh6RY8MZwSKHuA3gVR9vfkD6K8cbAp4L8qquPuSDjt5B+Zo
         Wdu5fX4LK+c7WWo0eNqbVuoRQnGrKVazFr6nH0rahB4rSJ+v6AORNZyZZs4GDZvFv+8A
         5abw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695249078; x=1695853878;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L41TuZ7o3nzCpD7sP+XfQDRSK68DXwDBksUA20+Aths=;
        b=SQNrg93wFs+zKB1ObYCHBzebYSv1Hlhg1Hg44U7fBPFdmrqjU5aWFiyTyzRnT9lvq/
         w7w/SfeSNJIk6VqZm8K44H3uYVEHcdXgRqI0U1Wyu8oR1ZkeP4BivkUzc/Kkp+Uh/d5P
         vZSbZTLJHqoBbcPWweccCHD9zFdbNHuDfg0YDGBoXRYPYGhb/Iw9FasdOZ9kUUqMY7dV
         h9KP+KdsU1eFqFKlgw0DaC7F15zHbUR2flCx6qtxVOQkpMdZSVUWfy8veam67PnNOuEb
         VavxObwBGpI0EY4RlrzkOdRsM+1zz3kITo2k3AXMANFe/tcLujRkWn1P8UynH7jhFRKN
         I84A==
X-Gm-Message-State: AOJu0Yyclzrx4YnOZ3gZq75ioznf23IWgI/EdNFWSvtAJEg8F3zMAWwJ
	wbEafq98KgEoyWQRKLcRS5ezzQ6utm3bl45u87c=
X-Google-Smtp-Source: AGHT+IHzqk5YoOSNhCKVgXGjyJ+sqHdnltP6XVzzSzA4JF160/+c6mCybdKD1LtCMhaMi55x1gM8GA==
X-Received: by 2002:a05:6a20:7f93:b0:14d:5796:bccd with SMTP id d19-20020a056a207f9300b0014d5796bccdmr5223361pzj.24.1695249078075;
        Wed, 20 Sep 2023 15:31:18 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id a13-20020a63704d000000b00578f1a71a91sm11535pgn.79.2023.09.20.15.31.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Sep 2023 15:31:17 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 09/20] vim: upgrade 9.0.1592 -> 9.0.1664
Date: Wed, 20 Sep 2023 12:30:46 -1000
Message-Id: <d5ba3546053cff49ee1ea66a97fe4b4a0aa76308.1695248921.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1695248921.git.steve@sakoman.com>
References: <cover.1695248921.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Sep 2023 22:31:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187957

From: Archana Polampalli <archana.polampalli@windriver.com>

Fixes:
https://nvd.nist.gov/vuln/detail/CVE-2023-3896
8154e642a (tag: v9.0.1664) patch 9.0.1664: divide by zero when scrolling with 'smoothscroll' set

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 4a1ab744142c9229f03a359b45e5e89a1fbae0d3)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/vim/vim.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 83ab9ea5de..8a399cd802 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -19,8 +19,8 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://no-path-adjust.patch \
            "
 
-PV .= ".1592"
-SRCREV = "29b4c513b11deb37f0e0538df53d195f602fa42c"
+PV .= ".1664"
+SRCREV = "8154e642aa476e1a5d3de66c34e8289845b2b797"
 
 # Do not consider .z in x.y.z, as that is updated with every commit
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.\d+)\.0"
-- 
2.34.1


