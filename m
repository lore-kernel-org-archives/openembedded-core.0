Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7A33C433FE
	for <webhook@archiver.kernel.org>; Fri, 14 Oct 2022 06:57:26 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web08.4510.1665730640824642270
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Oct 2022 23:57:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=W9ybMTpE;
 spf=pass (domain: gmail.com, ip: 209.85.208.48, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id s2so5637116edd.2
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Oct 2022 23:57:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oj/yqK/Q9o3rB6/TRNce/HFe0kh7gGEf0lf77jnGmHs=;
        b=W9ybMTpEi/PUWNV9AJIsv0WFemDPhTJqAvUXmGHfzVFc5faXkbVtINmqodnlppYbJ2
         N/AK2epIW26uB/WXqx21mdeZRhiEyfVPCftZCbSrcg/yT+SQlVoaAa8V5aZpRRQ5KP+v
         FR8Okm29pivIBWTotd0/XHkQJYfirPdtCFoBIl1BdvJQjjoM1aOvSAxEYsMk2MGug9VG
         SB2Br/dsnNRtizFGJEbqjbzt6PBOYFSe3lFLu5d+sEDvuuMt7u1JGyBoeBPy+qBYU5gD
         wwmsxxdGq6frzTHvAPQX5S/Dko9ynrGYPWePpFOP9L8y9zJHDD40irAVn0EaA6soa3ly
         FH3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oj/yqK/Q9o3rB6/TRNce/HFe0kh7gGEf0lf77jnGmHs=;
        b=HdVsD54rP7PLXG4t9cOTodEOG5gNju0/ZokQD4Krr2t8LSdFvHtfg26fCDBtQK7ZRt
         E/MCwHVRgRwXjSD3gxRtxLlFuzVS7gVEcSEssLLYnHEsAqz/jDStQajc+plTaaPAiLuM
         ccUyKpw3YJQcE/f9puikKGZdsFGLskv29RYtdFnjmiBbpci3cLiyne05ER5IW5eJjKLz
         bErpM5WUr9HM+YLN1oDiHpmQIbmoKJy4zK5jI8xZ1HjiZQvnm4Fhq3ujIYbSAD58ZK3V
         8dPGWrglwAC6hKMeZQG3Z3bLYNiIfX1pMeAC2usazj2LrxIR4lH5SuxpPZr/lSTlcjqX
         2ssA==
X-Gm-Message-State: ACrzQf1mNGAZ+RQJ+jCEIOPDxjMre/0ZvmZLkC2fQnk3U4WlhEOpYMQV
	QZho8Vv35Ca5rbzIlPmd80cJHqcIEFY=
X-Google-Smtp-Source: AMsMyM50UxMyke98XXvEhe6Bl6MsOSvZvJTFZ8X3pywXh2xFBG+1caWy+OUm5BRMF0jBS6mn1TcURA==
X-Received: by 2002:aa7:d306:0:b0:459:6e9:6284 with SMTP id p6-20020aa7d306000000b0045906e96284mr3030288edq.70.1665730638792;
        Thu, 13 Oct 2022 23:57:18 -0700 (PDT)
Received: from md2ramxc.ad001.siemens.net ([62.32.0.33])
        by smtp.gmail.com with ESMTPSA id g6-20020a17090669c600b0072af4af2f46sm1037694ejs.74.2022.10.13.23.57.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Oct 2022 23:57:18 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [kirkstone][PATCH] own-mirrors: add crate
Date: Fri, 14 Oct 2022 08:57:16 +0200
Message-Id: <20221014065716.1827361-1-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Oct 2022 06:57:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171727

Support downloading crate files from a mirror at SOURCE_MIRROR_URL.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/classes/own-mirrors.bbclass | 1 +
 meta/classes/sanity.bbclass      | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/own-mirrors.bbclass b/meta/classes/own-mirrors.bbclass
index ef972740ce..30c7ccd8e7 100644
--- a/meta/classes/own-mirrors.bbclass
+++ b/meta/classes/own-mirrors.bbclass
@@ -11,4 +11,5 @@ https?://.*/.*  ${SOURCE_MIRROR_URL} \
 ftp://.*/.*     ${SOURCE_MIRROR_URL} \
 npm://.*/?.*    ${SOURCE_MIRROR_URL} \
 s3://.*/.*      ${SOURCE_MIRROR_URL} \
+crate://.*/.*   ${SOURCE_MIRROR_URL} \
 "
diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index a79e36b594..5c97effb96 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -859,7 +859,7 @@ def check_sanity_everybuild(status, d):
     mirror_vars = ['MIRRORS', 'PREMIRRORS', 'SSTATE_MIRRORS']
     protocols = ['http', 'ftp', 'file', 'https', \
                  'git', 'gitsm', 'hg', 'osc', 'p4', 'svn', \
-                 'bzr', 'cvs', 'npm', 'sftp', 'ssh', 's3', 'az', 'ftps']
+                 'bzr', 'cvs', 'npm', 'sftp', 'ssh', 's3', 'az', 'ftps', 'crate']
     for mirror_var in mirror_vars:
         mirrors = (d.getVar(mirror_var) or '').replace('\\n', ' ').split()
 
-- 
2.37.3


