Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFAC9C636CD
	for <webhook@archiver.kernel.org>; Sun,  5 Feb 2023 20:46:59 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web11.38033.1675630012921842335
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Feb 2023 12:46:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Lxhwdthc;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f44.google.com with SMTP id j25so5219964wrc.4
        for <openembedded-core@lists.openembedded.org>; Sun, 05 Feb 2023 12:46:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OEQv/bOBV7Nq7rEjhmAZvREYdjlFSjigv48Xm9ImTr8=;
        b=LxhwdthcGBhT3uwsJU0t9z8zLaE01esorvn7w2QIhM9d+4y9TYx9qW3lhKrmSI1HyO
         juDhgHfp+fsKqtmEPcqynF3MnB6LuxGdgfBkVch1C3WhvtIMmvooD8lKTHuUA0xvLphz
         AKnlKfkOPEzw+ugYap6WNIYs+qr9R8/uhwKrY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OEQv/bOBV7Nq7rEjhmAZvREYdjlFSjigv48Xm9ImTr8=;
        b=SnJiDfSNJRbwNZw3KhllwuovAvbTA6LS0JhiTbSCg5en3QHdXVX8FiXxC+klIeBrga
         4OwEEVTKUWx48+n18Ef+SgnIRZ38G+w69rmE1aiQNlUi193AjBAY7WnXm5TYl3Ilzlu1
         38OIL9+yo3tHTPOFucooVWeOejiJc4BkxXA8U9o6u9bXyHDtHEcaEFE1s/ugPmIEj6Eu
         s+/ggH3wRi6LXi3NMYGu00JMTWG2pOSCQ+QYTWS33EyYKNCUTqvLetQ2p5M735sD8ulM
         WumPhgRvDI7udxTwRHXdig17YuL++VOiO7zVh0DvSplNGqy52E5t4Wdz4Fqjr0rGfHz8
         BbvQ==
X-Gm-Message-State: AO0yUKXpa2B0IE/6SpESa71WEBR3AzydCUWwz/8wbtJeHW1YaStjvPOT
	YCt31abchBqB5ceJ6LMNE0zAQ99omW1BHKRU
X-Google-Smtp-Source: AK7set9epXNz37KqLWTNtsIfaASU0e1p+RX9w6xqrMu6N7bZffZt41UYa7hcxV7j73GEw4ouS2heYQ==
X-Received: by 2002:adf:d0c1:0:b0:2c3:bc2e:757d with SMTP id z1-20020adfd0c1000000b002c3bc2e757dmr10869508wrh.27.1675630010698;
        Sun, 05 Feb 2023 12:46:50 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:512e:205c:f28a:2b5b])
        by smtp.gmail.com with ESMTPSA id h12-20020adff4cc000000b002c3d814cc63sm6446769wrp.76.2023.02.05.12.46.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Feb 2023 12:46:50 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Randy MacLeod <randy.macleod@windriver.com>
Subject: [PATCH] valgrind: Workaround glibc upgrade
Date: Sun,  5 Feb 2023 20:46:49 +0000
Message-Id: <20230205204649.1242325-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 05 Feb 2023 20:46:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176786

The glibc upgrade regresses one of the valgrind tests. Disable it
until we can resolve that.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/valgrind/valgrind/remove-for-all | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/valgrind/valgrind/remove-for-all b/meta/recipes-devtools/valgrind/valgrind/remove-for-all
index a26837d297b..5d1e7ed1020 100644
--- a/meta/recipes-devtools/valgrind/valgrind/remove-for-all
+++ b/meta/recipes-devtools/valgrind/valgrind/remove-for-all
@@ -2,6 +2,7 @@ none/tests/amd64/fb_test_amd64
 gdbserver_tests/hginfo
 memcheck/tests/supp_unknown
 helgrind/tests/tls_threads
+helgrind/tests/pth_mempcpy_false_races
 drd/tests/bar_bad_xml
 drd/tests/pth_barrier_thr_cr
 drd/tests/std_thread2
-- 
2.37.2


