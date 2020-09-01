Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web12.6243.1598936193420081031
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Aug 2020 21:56:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=m6qYjZDD;
 spf=pass (domain: gmail.com, ip: 209.85.210.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f182.google.com with SMTP id d22so113996pfn.5
        for <openembedded-core@lists.openembedded.org>; Mon, 31 Aug 2020 21:56:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DAIjFrPK10nNR6WQo3jiNvsQ9I09kPPD4+i+E3zBRkk=;
        b=m6qYjZDDSmIzj/bYBRyX7l+ybjzEG9kWfEiPVvhF3kWkOtmXB/8K/5p1aELBF+uVtD
         rPSb5Rsw4KlqO4joHRVGu833BLolAM3u8a+hHTh3kZJ63cDNdh1PURxpzJAwGV4ER2j0
         jD19RcvwiuBpwoYilFivheDUa9bn/2AtdimbYoDZaoj1uvp/50TyUtNO4hqGrs5Jodyv
         nejWC99RS7wtDRz6b11GcM8DqZ2zrpoENAsNFqFz9dcVL2Q6B6W5WhbtTYMIkIWwAppe
         zphavFzfWJvvzFIMG7+YuIEyOncBneBw9UwofwkfCsux4nPxlxqpuh2TX6qv49b3VPYm
         24Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DAIjFrPK10nNR6WQo3jiNvsQ9I09kPPD4+i+E3zBRkk=;
        b=bXLA0Q0yMW5c4BndnzgcYKqTyUBJ7XMtG5RPIBej1w7x9j+xV+QTLUDA3rQHgzMP1V
         gRFIiYBII0yJhBRia2Z/r90Zlo2TtM+GZzOzqnBsnZjZO8lc82yPm2GFKG6xtrH6yFcn
         QmEkM3bybwUEjA20QbMF3lRYgYzIvysaHuCOilp7Fo9H/IUMpecq1mzhqhNp3VHC7QHF
         Hhh10bnjbOC2lsMSLRxXMDUF0NEo5Q2uRe3uiW7AoQLykrAJC0FrjCAwLMMsFKjgxD+/
         BCGh66SUoxMDTdVfZdy3nTPT4iZIqhOyFT8SJZ3gaJoMemr1+JnF94z30p6nMvguMQT5
         PBLg==
X-Gm-Message-State: AOAM530rgDQ5EpY1DEmBE+EwPsnAiFLxF7ka/ravIEVuv4pZsL7sH9hP
	GFzEnDRzQjbYcoBB62RjueDoKuAsK8Q/9w==
X-Google-Smtp-Source: ABdhPJzQA5hMVxRxPk2iUarvlNIoBdeI9Ss0SDpnQjjWVnviFufsGSMuL+hJWLeBA4syAH4Dbyf/kg==
X-Received: by 2002:a65:4c08:: with SMTP id u8mr4102546pgq.340.1598936192639;
        Mon, 31 Aug 2020 21:56:32 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e89d])
        by smtp.gmail.com with ESMTPSA id w10sm206987pjq.46.2020.08.31.21.56.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2020 21:56:31 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 1/2] update-alternatives: Do not add dependency on virtual/update-alternatives for INHIBIT_DEFAULT_DEPS
Date: Mon, 31 Aug 2020 21:56:29 -0700
Message-Id: <20200901045630.1753967-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This allows special recipes e.g. glibc to use update-alternatives,
glibc-utils e.g. provides packages like iconv, getconf which are also
provided by other packages e.g. toybox, which uses update-alternatives
but since glibc-utils does not use it, images which contain glibc-utils
and toybox fail to build, glibc-utils is commonly pulled into ptest
related images. This patch therefore will allow glibc-utils or
musl-utils use u-a

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/update-alternatives.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/update-alternatives.bbclass b/meta/classes/update-alternatives.bbclass
index 8c2b66e7f1..ae393770f8 100644
--- a/meta/classes/update-alternatives.bbclass
+++ b/meta/classes/update-alternatives.bbclass
@@ -86,7 +86,7 @@ def gen_updatealternativesvardeps(d):
                 d.appendVar('%s_VARDEPS_%s' % (v,p), ' %s:%s' % (flag, d.getVarFlag('%s_%s' % (v,p), flag, False)))
 
 def ua_extend_depends(d):
-    if not 'virtual/update-alternatives' in d.getVar('PROVIDES'):
+    if not 'virtual/update-alternatives' in d.getVar('PROVIDES') and not d.getVar('INHIBIT_DEFAULT_DEPS'):
         d.appendVar('DEPENDS', ' virtual/${MLPREFIX}update-alternatives')
 
 def update_alternatives_enabled(d):
-- 
2.28.0

