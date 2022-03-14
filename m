Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C162C433FE
	for <webhook@archiver.kernel.org>; Mon, 14 Mar 2022 22:49:08 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web11.3257.1647298147139595440
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Mar 2022 15:49:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=SlYqRzpn;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id k24so26311006wrd.7
        for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Mar 2022 15:49:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UNtsE29kInBehrtQxO5SM9wtZ76gnkejBZoU+k2mWtI=;
        b=SlYqRzpnsS0cy4oQ7IlXiJgKNMxzQpsKxVgeRj9YuH8SmxCqcDhF4MruTK/C3Tmyyy
         4dc+JJkiqL1yqWSPXXfOKSkpf+f0vu6Tn/6IugxiOkq+jnSWZF6L3CiI53iXx3KXQKgh
         48rAc2cWqjizWFAx2i1bpY6q09Aa2BgUocO8w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UNtsE29kInBehrtQxO5SM9wtZ76gnkejBZoU+k2mWtI=;
        b=BNh/BoYtbHbpScJY/Ljasrcwp8FnNFywsi8Xx1b17qQiZdLD9CDiFt4vusXN/F6+Bb
         wdN5gG3R1Gacltmz+eS/HT9eGYqBLjXcHg5cEdlZaahSlToU03qql2SHuYlqXgRd7R6S
         JhgzuDj/ccE6eYVQQdIXYcSW+b6NI7bHp+0HH/XkeKmo1TTDs9Evah/mocap9g3QiKeN
         JyYrS5a4fHqh0JhQHskL5U6zcKEIXkD7FiU/yWKPYeSlGsh4o1xwT282WjDVU6R1uKRR
         OoPbrs57aXVfuFaaUTt2Q2NuvX49ylo7qTMGZIiz3g6niIiUC0DW0Eah5GKISdSJJSkP
         nyjQ==
X-Gm-Message-State: AOAM5327LaSE+V2lki5zjHMZNv3+vUq9VTszllk2OW7hUlWUJG/yjLW4
	HMuJOoYw5UCnoON4hHErvEieKz8RwaquI/sh
X-Google-Smtp-Source: 
 ABdhPJxemqcMDTrVCEo7GEY64O0TGmRc+y/B4Ev2cRjKxksfvMdsDDbD6D3Ux3RmPG8AStKcU2Av2Q==
X-Received: by 2002:a5d:62cd:0:b0:1f0:23d2:b38c with SMTP id
 o13-20020a5d62cd000000b001f023d2b38cmr18752457wrv.82.1647298145381;
        Mon, 14 Mar 2022 15:49:05 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:9098:b3d5:8fee:ea58])
        by smtp.gmail.com with ESMTPSA id
 bg18-20020a05600c3c9200b0037c2ef07493sm788599wmb.3.2022.03.14.15.49.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Mar 2022 15:49:04 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Ross Burton <ross@burtonini.com>,
	Ross Burton <ross.burton@arm.com>
Subject: [PATCH 26/33] poetry_core: update for renamed class pip_install_wheel
 to python_pep517
Date: Mon, 14 Mar 2022 22:48:30 +0000
Message-Id: <20220314224837.834776-26-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220314224837.834776-1-richard.purdie@linuxfoundation.org>
References: <20220314224837.834776-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Mar 2022 22:49:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163192

From: Ross Burton <ross@burtonini.com>

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/python_poetry_core.bbclass | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/classes/python_poetry_core.bbclass b/meta/classes/python_poetry_core.bbclass
index a2086b11b6c..47b2fe46d5f 100644
--- a/meta/classes/python_poetry_core.bbclass
+++ b/meta/classes/python_poetry_core.bbclass
@@ -1,4 +1,4 @@
-inherit pip_install_wheel python3native setuptools3-base
+inherit python_pep517 python3native setuptools3-base
 
 DEPENDS += "python3-poetry-core-native"
 
@@ -8,8 +8,8 @@ python_poetry_core_do_configure () {
 
 # TODO: ideally this uses pypa/build
 python_poetry_core_do_compile () {
-    nativepython3 -c "from poetry.core.masonry import api; api.build_wheel('${PIP_INSTALL_DIST_PATH}')"
+    nativepython3 -c "from poetry.core.masonry import api; api.build_wheel('${PEP517_WHEEL_PATH}')"
 }
-do_compile[cleandirs] += "${PIP_INSTALL_DIST_PATH}"
+do_compile[cleandirs] += "${PEP517_WHEEL_PATH}"
 
 EXPORT_FUNCTIONS do_configure do_compile
-- 
2.32.0


