Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3447EE8FDB0
	for <webhook@archiver.kernel.org>; Tue,  3 Oct 2023 19:37:21 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web10.120.1696361834468766450
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Oct 2023 12:37:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Bj2q11va;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.169, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-565e54cb93aso755741a12.3
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Oct 2023 12:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1696361833; x=1696966633; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UK9GHMMen82bPz79s45qVu+Vh87cU9xvPbNiiHf7nak=;
        b=Bj2q11vapB+qLB5v1tx6cJ72DjCr2YC14KBLRH9AGhhGb013SGYyB+xjNVIQyK+6Vd
         3S5qksOrnmtqXYlMdr8iAYL2kLfPau+OQGHdqHtQHcI14R2eIemlmY76wWwIwRAjD+uz
         20SsqIlSqjBgzQL05usD9+19Zyf8Gf2z7Rho7GgPhaE2VvBTi9SQfe9N3tB3w3w7HUGO
         b9OeghGfRWYb22B6wadEE8qp8LvnPtskZDBSohPJya3FuOPheayM6cVCA2IJj27lYx1G
         bPwe+1LKspBOLxobwGXJjri9JsAPBAxU6DiIRde7fM4mof+QgW7O/2S6lYHQUpDOrpHN
         q8eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696361833; x=1696966633;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UK9GHMMen82bPz79s45qVu+Vh87cU9xvPbNiiHf7nak=;
        b=Er9zgtk8WkAQgrp+Q8pMND49p+PI3/wgL/xtWiGJbZwc9ILs4Wc6eDNcFb7lJBBna1
         P7o8BatcCz3o9SZlrx5QwHVxGXGfJ3yb8AscKjKL9iVlYuNaETF9YvlaB2gtU+0ksum2
         4yzO0D3E9w0C8QfxhryRb0WrL2oRZqaYCjGyWgmrZktWpQzYI1XDytJfCieDMX/jcWuU
         4uB+KCat7BTSNn/uHgS4uzsM5egz+KXLAGT0X2UOgdqIrGi3DimI0c20C7IMwVwBjggk
         VMLeBluMRUoQl+z+X2UiDY06NJLjHQn1RvLNhq2bN2mYQ+fte/e6kDIvJlxT79JIx/R7
         cxHA==
X-Gm-Message-State: AOJu0YzZmqWLIHurXuYxs8/ugI7U/Rj9dOuhz9aGGElm+m9HmKop/a8Y
	ZgiUmnvMjKQ89LfeGW4Dil+3UPhyac+91oKQv98=
X-Google-Smtp-Source: AGHT+IHZVkjh+UcItT0L9DE+T6/DzaI80ArsyjCyhMkb/jHhu+7Xy0r+TVafyUETJySlPLgsli3dMw==
X-Received: by 2002:a17:90a:f990:b0:273:dffd:664a with SMTP id cq16-20020a17090af99000b00273dffd664amr304515pjb.20.1696361833552;
        Tue, 03 Oct 2023 12:37:13 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id 23-20020a17090a031700b0025dc5749b4csm9333642pje.21.2023.10.03.12.37.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Oct 2023 12:37:13 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 09/10] python3-jinja2: fix for the ptest result format
Date: Tue,  3 Oct 2023 09:36:49 -1000
Message-Id: <edfed23716e6240a65f53630bbaf8b7319f0d1ce.1696361593.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1696361593.git.steve@sakoman.com>
References: <cover.1696361593.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Oct 2023 19:37:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188659

From: Narpat Mali <narpat.mali@windriver.com>

The output of python3-jinja2 ptest should follow a unified format as below
result: testname

Reference:
https://wiki.yoctoproject.org/wiki/Ptest

Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/python/python3-jinja2/run-ptest | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-jinja2/run-ptest b/meta/recipes-devtools/python/python3-jinja2/run-ptest
index 5cec711696..3004024619 100644
--- a/meta/recipes-devtools/python/python3-jinja2/run-ptest
+++ b/meta/recipes-devtools/python/python3-jinja2/run-ptest
@@ -1,3 +1,3 @@
 #!/bin/sh
 
-pytest
+pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'| sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s : %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'
-- 
2.34.1


