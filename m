Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE3B1C77B7F
	for <webhook@archiver.kernel.org>; Fri,  5 May 2023 15:21:24 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web11.30272.1683300077261325456
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 May 2023 08:21:17 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=SWjMhwds;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.169, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-51f597c975fso1722861a12.0
        for <openembedded-core@lists.openembedded.org>; Fri, 05 May 2023 08:21:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1683300076; x=1685892076;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7IapEz/BvMPYjbt0P8pMzUCMC5Dc61VpJ8ZqJmM1bFo=;
        b=SWjMhwds0VYgo1eacNgs8F3BhIKuOd6MC5qBwW0hOmwoE/Zgw1Sa4Mz41PJWHBKepK
         8trvD1NaSsvNCSQp2ne2Tgxgcw94DSCVDEImrgNpc+vjBn14Et93AOPAjIUGcF5dtk4Q
         cp1cMVpFlQnZ/lRHS90/PT/WXAMl2QC890ZfTOSsj+9PegHiX27no37aVZo0Pd+ZbPUr
         +GMEb9hQeV35X5PZaquNrO3ihOVAk2sj8xeGSDFaA9MH7CVerVTrvyQJ4fj/X9zl18oS
         J5S/GAjLu/2qR1GSeiWHyyTdOweXiC6CvJ7bDnF/DxJ5vUBVaz2MeCyqPc0wYhhbWG+V
         qq8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683300076; x=1685892076;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7IapEz/BvMPYjbt0P8pMzUCMC5Dc61VpJ8ZqJmM1bFo=;
        b=TUqyhP4zmGxPH875r9OgSByeNC3z1jwdvdqy03q995j9GkqPUb297egvy2mIVsZo6k
         9L9WpqWJIuwcKJ4U0HHnB7+tBqu1sKs14RFrwu+WfVu2cdiqxcDQRuep5znGfpBF5Gss
         aP66OlpDK/b69qeDE/NyxOPbo8DWaEUGRC6x3rmnoZ++MyilE4R3pnYmLEZsarg3yhre
         wecOYaTKy/tFNrQHBRkIbLOCcjipZrvg51sOEPTANWYwHdhloaaTFU9mp8H+AS27Oswq
         eKPs1WqvoASXOrQya0skad0tFkwJTD9Y6J/iuaj19paz4Pdv9GlRxXKdqkJem2QIyd7I
         Az3w==
X-Gm-Message-State: AC+VfDybaEgIRUOn25sW7BgTfrJaPQL6CW26PQjv7Hy+Rn4og48WuOvq
	C4RLW4009JTcqsyjmUAcAh47OWBuj01JFugw1Cg=
X-Google-Smtp-Source: ACHHUZ4VPT+tOYLY98tKBJDPWTE1uQgDfo8jgBQrqIKpPG91L29eDd66nujONoL4OlIACUVI4JkCqw==
X-Received: by 2002:a05:6a20:100c:b0:f3:d577:9b4f with SMTP id gs12-20020a056a20100c00b000f3d5779b4fmr1980478pzc.36.1683300076336;
        Fri, 05 May 2023 08:21:16 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id c11-20020aa78c0b000000b00643864d03dfsm1831591pfd.171.2023.05.05.08.21.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 May 2023 08:21:16 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 35/35] update-alternatives.bbclass: fix old override syntax
Date: Fri,  5 May 2023 05:19:46 -1000
Message-Id: <27b4fb60c7c66c245ba50607c8e178390fc41014.1683299764.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1683299764.git.steve@sakoman.com>
References: <cover.1683299764.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 May 2023 15:21:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180955

From: Peter Bergin <peter.bergin@windriver.com>

Function 'gen_updatealternativesvardeps' still used old override
syntax when fetching variable flags. Update to use ':' instead to match
recipe meta data. This was found by review and no real issue encountered
but it is a bug that affects variable dependencies and can affect rebuilds
as task hashes might not be accurate.

Signed-off-by: Peter Bergin <peter.bergin@windriver.com>
Signed-off-by: Peter Bergin <peter@berginkonsult.se>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 5691f554b2cd50f256a8cbb1d96781e9eb6b930e)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes-recipe/update-alternatives.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes-recipe/update-alternatives.bbclass b/meta/classes-recipe/update-alternatives.bbclass
index 36a7497fec..b153e1b297 100644
--- a/meta/classes-recipe/update-alternatives.bbclass
+++ b/meta/classes-recipe/update-alternatives.bbclass
@@ -86,10 +86,10 @@ def gen_updatealternativesvardeps(d):
 
     for p in pkgs:
         for v in vars:
-            for flag in sorted((d.getVarFlags("%s_%s" % (v,p)) or {}).keys()):
+            for flag in sorted((d.getVarFlags("%s:%s" % (v,p)) or {}).keys()):
                 if flag == "doc" or flag == "vardeps" or flag == "vardepsexp":
                     continue
-                d.appendVar('%s_VARDEPS_%s' % (v,p), ' %s:%s' % (flag, d.getVarFlag('%s_%s' % (v,p), flag, False)))
+                d.appendVar('%s_VARDEPS_%s' % (v,p), ' %s:%s' % (flag, d.getVarFlag('%s:%s' % (v,p), flag, False)))
 
 def ua_extend_depends(d):
     if not 'virtual/update-alternatives' in d.getVar('PROVIDES'):
-- 
2.34.1


