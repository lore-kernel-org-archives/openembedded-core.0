Return-Path: <eekmecic@snap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E84BEC001DF
	for <webhook@archiver.kernel.org>; Wed,  2 Aug 2023 13:04:48 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web11.14334.1690981484777511461
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Aug 2023 06:04:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@snap.com header.s=google header.b=TF2u4+RN;
 spf=pass (domain: snapchat.com, ip: 209.85.214.179, mailfrom: eekmecic@snapchat.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1bbff6b2679so25799585ad.1
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Aug 2023 06:04:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snap.com; s=google; t=1690981484; x=1691586284;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1tLi1iiKssKs9R4mdP/py2tArOe1uRPxhNIABKngCyM=;
        b=TF2u4+RNEC2zUzaroOmyqALkPGbOaPuJ0rLaIgrCDzfnAPEH7VTEFVzwtTskAsIHeJ
         1m4vWfatINkf1SuDI2rMTFdrIK6lcBQIBFJ6zmXapbNUE8eZg+236C3qgkeUa3xUOtw9
         wGT5PgLSuu0xmeaWQZmz3u6+FKBG1ecUHl4p0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690981484; x=1691586284;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1tLi1iiKssKs9R4mdP/py2tArOe1uRPxhNIABKngCyM=;
        b=Qx8BlEK2cODbGfJa/Ejw0vyLiwKrCarsllJnzRktbFyUAVTrfWnd6NciVJTCUTIG/g
         G41/8fx4a9RUXRB055Y5lSIZ7lv99U34PrKrw5fWL9PC4mi7k+MwscMxEGptChHYBJTk
         DVtPzO2TTFIslNSK+5DEqcKuPcMMnqk7JNR8vOM8MrPV43TdXXVOcEpdGTLES+dtbaru
         n5PI0V4/xBQtm7YQ7RdjXGZS9rFFBDvylTuIuNQ65NnFwzyT/bLXS0vmqvkzXUFXQzdB
         r3rMbNIan1wzakLQd6z6takd99dYzORpRbndPKCAMNjtvbIZxIQkpzogEjinoOfMqFX1
         5oHg==
X-Gm-Message-State: ABy/qLbrxz2Kepwjzrk9WjoHG/mNz9wL3AomLdOPd8n+CvZzXeMYp4ux
	lE9D0teSScT+9ciehxOgKcTe8PQz6SBB9rBRg/m5w0Kf
X-Google-Smtp-Source: APBJJlHmlmxMGFLJ03ln7VIteBV0Sp61vFxO2J28b4Je2tl08g1szP9NaRnjCnsikIXDhG10fFCNGQ==
X-Received: by 2002:a17:902:ab96:b0:1bb:9675:8c06 with SMTP id f22-20020a170902ab9600b001bb96758c06mr12435221plr.35.1690981483838;
        Wed, 02 Aug 2023 06:04:43 -0700 (PDT)
Received: from 4SK64Z2.sc-core.net ([144.232.179.190])
        by smtp.gmail.com with ESMTPSA id iw12-20020a170903044c00b001bbbc655ca1sm12391632plb.219.2023.08.02.06.04.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Aug 2023 06:04:43 -0700 (PDT)
From: eekmecic@snap.com
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Emil=20Ekme=C4=8Di=C4=87?= <eekmecic@snap.com>
Subject: [PATCH] Add GCP fetcher to list of supported protocols
Date: Wed,  2 Aug 2023 06:04:16 -0700
Message-Id: <20230802130415.805356-1-eekmecic@snap.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Aug 2023 13:04:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185390

From: Emil Ekmečić <eekmecic@snap.com>

If accepted, this patch should merge with the corresponding BitBake
patch titled "fetch2: add Google Cloud Platform (GCP) fetcher".

Signed-off-by: Emil Ekmečić <eekmecic@snap.com>
---
 meta/classes-global/sanity.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes-global/sanity.bbclass b/meta/classes-global/sanity.bbclass
index abb52fbe21..9b824915f2 100644
--- a/meta/classes-global/sanity.bbclass
+++ b/meta/classes-global/sanity.bbclass
@@ -871,7 +871,8 @@ def check_sanity_everybuild(status, d):
     mirror_vars = ['MIRRORS', 'PREMIRRORS', 'SSTATE_MIRRORS']
     protocols = ['http', 'ftp', 'file', 'https', \
                  'git', 'gitsm', 'hg', 'osc', 'p4', 'svn', \
-                 'bzr', 'cvs', 'npm', 'sftp', 'ssh', 's3', 'az', 'ftps', 'crate']
+                 'bzr', 'cvs', 'npm', 'sftp', 'ssh', 's3', \
+                 'az', 'ftps', 'crate', 'gs']
     for mirror_var in mirror_vars:
         mirrors = (d.getVar(mirror_var) or '').replace('\\n', ' ').split()
 
-- 
2.40.1


