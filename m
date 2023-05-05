Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2CC1C7EE2C
	for <webhook@archiver.kernel.org>; Fri,  5 May 2023 15:20:14 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web11.30229.1683300010391010575
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 May 2023 08:20:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=xJzt1B+a;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.176, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-643846c006fso2138585b3a.0
        for <openembedded-core@lists.openembedded.org>; Fri, 05 May 2023 08:20:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1683300009; x=1685892009;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9zE7/k6UOpzU7Prh6v5VTlEkrPU7F9FVM/PA67J5gdI=;
        b=xJzt1B+aCyZj0NbJG/MmCiFYL+6AviDx6VT82hxlgw3suEkfirL9YssaCW+UmjSClq
         ODYkP+vtyNXbJnYJE3I/hSp+C09/Wyt+3n008PSxF/tXszC3JgrWBNnojNJJqU3e1UiS
         sa5fwZnVH5z05fIc9yrZM5Gmxgv9Zum6RDOVn1rcc0zM/OCvpHJQW6qKYlf2j61Nmkx0
         bN+u6KNAqaHDDaaD0+n3aKUHfjMHDrO4BwasIvwk1veD30cF5YIYsc7dpE7VUoRMeO+y
         wQ7NziY9QR6041fuFxcxwk836xc44hZoznJSYdmKnzt/RHoP11KCfD2t6w6YgzIYuMWf
         7ZIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683300009; x=1685892009;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9zE7/k6UOpzU7Prh6v5VTlEkrPU7F9FVM/PA67J5gdI=;
        b=e0uTRsWybuPPVMA+ZxLiblHBBsA5g8GwiLJJVt/Q7UkmCxIi+Uo0879i/o08cYQ9CY
         jH2sulWghhjuhOiMCIu5Umt0kXwRFCtA8uV2XDQuXDNhFnUGLjLW32YY5C1HCS9+TObh
         +qAKthoCQWR1KGS0fGn0Wm5WtRqIOWvvtgGsVjqIdiBiejVBQ2zp7T9Sdh70TFhB53Ti
         I43tg5Euc8RAQSi36tsThLe4kfe7lp66SIi1Mk/9WwlFPcQwtW4BfyRlUKsHtTectEQ2
         eEWSG+6xEd/1vXBVnKj6BeYOEtrx0n3mutKA84seDMGTum/DEtBUH6Onc0KUS2Jd65W5
         nydg==
X-Gm-Message-State: AC+VfDyGciqqxmGjCXQw/AZ9l8xD1jV9wwshy13Yi+vvchB6syTCbONa
	MZGyOH1lyTGGX7E0sMRDpOzwbeUXJmcS7+/pAnw=
X-Google-Smtp-Source: ACHHUZ6OxqW/k+MGIIxfgbzF1ZDYfVRAQwHnNDTgmjhmu+402jfrRLbGkwILKrSYgxcRu7v7KcgqnQ==
X-Received: by 2002:a05:6a00:23c4:b0:63d:254a:3901 with SMTP id g4-20020a056a0023c400b0063d254a3901mr2516991pfc.25.1683300009504;
        Fri, 05 May 2023 08:20:09 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id c11-20020aa78c0b000000b00643864d03dfsm1831591pfd.171.2023.05.05.08.20.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 May 2023 08:20:09 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 04/35] cve-update-nvd2-native: added the missing http import
Date: Fri,  5 May 2023 05:19:15 -1000
Message-Id: <02ce3cc9d4b197c3df57b727aa5f7eff59091e37.1683299764.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1683299764.git.steve@sakoman.com>
References: <cover.1683299764.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 May 2023 15:20:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180924

From: Jan Vermaete <jan.vermaete@gmail.com>

Signed-off-by: Jan Vermaete <jan.vermaete@gmail.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
(cherry picked from commit 39d2cde7eb922cb0a2cf9402cd8b3ae3b4cc2f62)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/meta/cve-update-nvd2-native.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/meta/cve-update-nvd2-native.bb b/meta/recipes-core/meta/cve-update-nvd2-native.bb
index 1c14481c21..2b585983ac 100644
--- a/meta/recipes-core/meta/cve-update-nvd2-native.bb
+++ b/meta/recipes-core/meta/cve-update-nvd2-native.bb
@@ -118,6 +118,7 @@ def nvd_request_next(url, api_key, args):
     import urllib.request
     import urllib.parse
     import gzip
+    import http
 
     headers = {}
     if api_key:
-- 
2.34.1


