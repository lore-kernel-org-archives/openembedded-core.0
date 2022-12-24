Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75F48C4332F
	for <webhook@archiver.kernel.org>; Sat, 24 Dec 2022 08:30:44 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web11.92860.1671870636513461200
 for <openembedded-core@lists.openembedded.org>;
 Sat, 24 Dec 2022 00:30:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=eNtu+Smd;
 spf=pass (domain: gmail.com, ip: 209.85.218.42, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id kw15so16626402ejc.10
        for <openembedded-core@lists.openembedded.org>; Sat, 24 Dec 2022 00:30:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uLNgiAYoLZAWqMb9LclMJmP+owuXN5XA8B602Zb54q4=;
        b=eNtu+SmdXuSTWu3SGzH8UVPW4HXreu8SvzSo9PNhDqSxwnN8xLD0hgL0SeD0k1q3xY
         QWcA8IH6o77UO0XJ/YXWTizFKXMxWU7pPDeGB73x0+E/unwwUSWMM0lkG3rA6VwK6cUt
         hROUWDOhqLRAzlWLxoI+1GpePG7CMGtCNADJkVGZgsOqlE+8tYg56astAxj2mNYnASli
         DB1RnvWB/F2BNnLkTf235/dbeuCLTYqs5ackmFsOSsAtLwI5Of4qCSk/E9P4DnnID7sQ
         ur9erUxS+zNLcXuiB5r/f0F9GOFshe/NaoUmbTDRJBg3/Aj4XAt+ubbLUUt4wIx9SsHA
         bjuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uLNgiAYoLZAWqMb9LclMJmP+owuXN5XA8B602Zb54q4=;
        b=D6bdIe5F4vQMH8fZH/WY8X1sDsWVxE9ulEBcTt7IXTTczdCtNig6Yd9OWCpn8bGf7m
         6GVGhAoRQ+0+pLM+cUt212TsGCgX8AUcN5dHWjHr2IZ0ybbUdKYr09OUWdCHyAuN5t+j
         Ee99X+GoiNjskQbyg7i5Z4/IvgNtTTOWZ+FsFstk3v0V7Vcd1sRacHcNxByK6Ab+iQYh
         vDxwi2gr7hCff2IwPgF3FrDam/z4OgmL0nawoKEEWSRo2p94yFSNgUGvv3ixP4ucO7zz
         I6LlDnPtQAEv3esffDx3M3Gd/fMLnIQaqQ85EYJ3SLS31hKxx/9UA7tJT9+vsYlOlG72
         5jfg==
X-Gm-Message-State: AFqh2kpPdJmLbYPNtZXIPh2ujRuFMGAP0ZapLDXugaH52ujPrZmL2GCI
	D4xsUyv0vqVys9xA/jewteO3Ot29cpw=
X-Google-Smtp-Source: AMrXdXsutqdtk2/z/zI573nAY0rKc0gkpZ4Q3JBKsnXusj5NZgZcRtIfZIB1r5j7gDygv5dTqxSJOw==
X-Received: by 2002:a17:906:1c59:b0:7bb:af66:f38c with SMTP id l25-20020a1709061c5900b007bbaf66f38cmr10418803ejg.10.1671870635000;
        Sat, 24 Dec 2022 00:30:35 -0800 (PST)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id 16-20020a170906319000b0084c2065b388sm232066ejy.128.2022.12.24.00.30.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Dec 2022 00:30:34 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com,
	Martin Jansa <Martin.Jansa@gmail.com>
Subject: [PATCH][langdale][kirkstone] libxml2: fix test data checksums
Date: Sat, 24 Dec 2022 09:30:30 +0100
Message-Id: <20221224083030.1185986-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 24 Dec 2022 08:30:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174982

* switch from tar.gz to tar, because the tar.gz archives upstream are regular tar as well now
  https://www.w3.org/XML/Test/ still has 3 separate URLs for .zip, .tar
  and .tar.gz, but both tar links return the same file:

  xmlts20080827.tar:      POSIX tar archive (GNU)
  xmlts20080827.tar.gz:   POSIX tar archive (GNU)

  -rw-r--r--  1 martin martin 5.7M Sep  1  2008 xmlts20080827.tar
  -rw-r--r--  1 martin martin 5.7M Sep  1  2008 xmlts20080827.tar.gz

  9b2c865aba66c6429ca301a7ef048d7eca2cdb7a9106184416710853c7b37d0d  xmlts20080827.tar
  9b2c865aba66c6429ca301a7ef048d7eca2cdb7a9106184416710853c7b37d0d  xmlts20080827.tar.gz
  96151685cec997e1f9f3387e3626d61e6284d4d6e66e0e440c209286c03e9cc7  /OE/build/downloads/xmlts20080827.tar.gz

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-core/libxml/libxml2_2.9.14.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/libxml/libxml2_2.9.14.bb b/meta/recipes-core/libxml/libxml2_2.9.14.bb
index 519985bbae..fc4a1c3c68 100644
--- a/meta/recipes-core/libxml/libxml2_2.9.14.bb
+++ b/meta/recipes-core/libxml/libxml2_2.9.14.bb
@@ -13,7 +13,7 @@ DEPENDS = "zlib virtual/libiconv"
 
 inherit gnomebase
 
-SRC_URI += "http://www.w3.org/XML/Test/xmlts20080827.tar.gz;subdir=${BP};name=testtar \
+SRC_URI += "http://www.w3.org/XML/Test/xmlts20080827.tar;subdir=${BP};name=testtar \
            file://libxml-64bit.patch \
            file://runtest.patch \
            file://run-ptest \
@@ -26,7 +26,7 @@ SRC_URI += "http://www.w3.org/XML/Test/xmlts20080827.tar.gz;subdir=${BP};name=te
            "
 
 SRC_URI[archive.sha256sum] = "60d74a257d1ccec0475e749cba2f21559e48139efba6ff28224357c7c798dfee"
-SRC_URI[testtar.sha256sum] = "96151685cec997e1f9f3387e3626d61e6284d4d6e66e0e440c209286c03e9cc7"
+SRC_URI[testtar.sha256sum] = "9b2c865aba66c6429ca301a7ef048d7eca2cdb7a9106184416710853c7b37d0d"
 
 BINCONFIG = "${bindir}/xml2-config"
 
-- 
2.39.0


