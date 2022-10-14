Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B95A1C4332F
	for <webhook@archiver.kernel.org>; Fri, 14 Oct 2022 06:53:36 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web10.4404.1665730407236589862
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Oct 2022 23:53:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=CRHd0ssT;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id fy4so8499743ejc.5
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Oct 2022 23:53:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=c4/KUsI/xeF6v8lJAr/mepAphkyJmXvN/982ZVgG6PU=;
        b=CRHd0ssTsKjm2KAShksjIu7/7seDb9u6bM+RA14staHdi/YN8D4jrnzQ3hv+AxZVDS
         zLXO8v4oosx00KcGzJ8Awa7wcoUr5SNjiqXWSOrdbaG+tDRUf+gttVAzadeSzYb2l+NF
         W5TFD+jqV6rsp72zHomi/IwUsZuORJjC8LMXCGPUY/4QVGZuE0j6App5xbJt94MFuiNb
         Ke2xtLZt285XN8BWQt1Bj9V1IAap2xrtF3Zc5+OBLTLOEmyVjED2vvgkICJsyuw/G4JE
         KjaXtqHhcLRp/qkdWOTMf+nBoV/YjjW48t26c+WDijhVoYQ6wRi7dk/Gsn6oB0j9yfBO
         9opA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c4/KUsI/xeF6v8lJAr/mepAphkyJmXvN/982ZVgG6PU=;
        b=aYSJIh1Hn9byt1iKPoTklqHUfgRlD6BqOPLkoHypxYsiMVmhzfenCmG3Bd8WclCqPe
         Gao5UAPMo7OvAqWdv5QGRDl/qBB2pWFFegWXUBK8sEHED8EM8bYMYbmdWpQxGWPWu+2z
         PpCE29bw/WuYbdExHtmmzE5lLtUi8/fithX5IbRXM5hrqBEYQVdeGDXpfP85o1KY3bzZ
         yneekRvwLf0QpIwaF/oFj6j6MVnz/lC7Q4ebtnJ8OZ4d/wazxQ1vY1lDighQ+m2gKLp9
         s+fzPyGLekc9QX7b24IL0KegIaE/yI9Cv5h2+9+QoZkkJx1uXHkhueEhJKCTPoPv5QM4
         gSgg==
X-Gm-Message-State: ACrzQf3JmHYBbX8cbXIe4ic53b1oZMjxTUBN1UJWbUnsl3maGm57huBX
	YpkfDHVv14Ucjr8bY3YOM5veTKB9264=
X-Google-Smtp-Source: AMsMyM4kSfSJYEBW5Q0TaEb5wU6S7Tn6BUZrvNtgooRGVOLxv7w6x3XZzeTICl/cGKGH4QVJN7cvKQ==
X-Received: by 2002:a17:907:d07:b0:72e:ec79:ad0f with SMTP id gn7-20020a1709070d0700b0072eec79ad0fmr2561425ejc.296.1665730405232;
        Thu, 13 Oct 2022 23:53:25 -0700 (PDT)
Received: from md2ramxc.ad001.siemens.net ([62.32.0.33])
        by smtp.gmail.com with ESMTPSA id 3-20020a170906318300b0078c213ad441sm1029889ejy.101.2022.10.13.23.53.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Oct 2022 23:53:24 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH] buildconf: compare abspath
Date: Fri, 14 Oct 2022 08:52:47 +0200
Message-Id: <20221014065247.1825762-1-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Oct 2022 06:53:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171725

We have something like ${TOPDIR}/../../poky/meta in the bblayers.conf
file. This does not work without normalizing the path for comparison.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/lib/bblayers/buildconf.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/bblayers/buildconf.py b/meta/lib/bblayers/buildconf.py
index e07fc534e1..ccab332adf 100644
--- a/meta/lib/bblayers/buildconf.py
+++ b/meta/lib/bblayers/buildconf.py
@@ -64,7 +64,7 @@ TEMPLATECONF={} . {}/oe-init-build-env build-try-{}"""
         oecore = None
 
         for l in layers:
-            if l[0] == os.path.abspath(args.layerpath):
+            if os.path.abspath(l[0]) == os.path.abspath(args.layerpath):
                 targetlayer = l[0]
             if l[1] == 'meta':
                 oecore = os.path.dirname(l[0])
-- 
2.37.3


