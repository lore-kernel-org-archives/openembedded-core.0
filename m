Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42A36ECAAD5
	for <webhook@archiver.kernel.org>; Sat, 27 Aug 2022 21:30:55 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web11.53163.1661635848124255530
 for <openembedded-core@lists.openembedded.org>;
 Sat, 27 Aug 2022 14:30:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=MEh14fhD;
 spf=pass (domain: gmail.com, ip: 209.85.221.48,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id m16so5690907wru.9
        for <openembedded-core@lists.openembedded.org>;
 Sat, 27 Aug 2022 14:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=aCfN+01A1GAEPeLvo+v+lKDT24CcTK8ssBznLi8zgZs=;
        b=MEh14fhDkxN+x1j9Vzu44EfVXH8Quie4+fjlQgkNWYsDGZM+RFrqJio3HJUkXOb/M1
         Y078osgl+2y4rc+MLIRk+qURt1dkKpW4lRpGKJRDJCl0QXsFL9RZSbiftN0Piqre/Bid
         7W+KbwdtpKANV/71puQ02bl9L47MfiAXDeEXh7rXw8uZfq+YlxvBcNlha2v/J6cYeXRv
         nRbVcx7fPHHiMbfLJgrZl3jHIV8+nwbNvLjUvzs8hfWk+OZ2KrpXxzHyPtjAHZ22m/IU
         t9JEgVTQ6kwqmNuAZVE82i4Ti1HgiMW7teQxqdPu/1NAfpevyCNO5bFq04IbnU4WZia0
         q+5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=aCfN+01A1GAEPeLvo+v+lKDT24CcTK8ssBznLi8zgZs=;
        b=dQUhAhiy3yqAUp/qK/Nwqw67sr5kGhwLKFt6hxyDyPJNj3dOEpVV15BnlzkfGUMvvY
         qbPOUHYtybdcWVY9976FzgDg1wbs9jXSON5TBRfudUZpuN2wR6EYy/fHsreeJ0V1RYzG
         IO7C2rfIIFWmB5BADYnVn25aYLFNpZh5/kII7B8ADpc/T1bE3GAZgm2iX/l3QsaZglQj
         PSRJzlJ1eun+05CYYmp0nHKrJlPTs/9MxZPnU2/5ui+dif8lAq95WdO4VazsvIOYtSPI
         HY82KZUxQImh06dHm+38yhiDa1KlvxCHalY7RwuEXTRMxlSicF9hZTbq1uMxk2Y3somG
         1taw==
X-Gm-Message-State: ACgBeo34i04mrqEW596U6OEpQxwi5/JyEtRFtnHwh20ysF9z55jtfyXg
	fI/bqRI0mXIPoarJtY8Msi7+Gg451Ho=
X-Google-Smtp-Source: 
 AA6agR49VK0JsVDiUD6b9U/4gGYt/o5Du8SSONs8IXTxjyXNmbB8tM4uyCTyrJPVXfwwUvjmosYLug==
X-Received: by 2002:a5d:4201:0:b0:21d:7b63:1b43 with SMTP id
 n1-20020a5d4201000000b0021d7b631b43mr2701058wrq.225.1661635846243;
        Sat, 27 Aug 2022 14:30:46 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 r8-20020a5d6948000000b00226a5187528sm3073528wrw.48.2022.08.27.14.30.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Aug 2022 14:30:45 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH] scripts/oe-setup-builddir: add a check that TEMPLATECONF is
 valid
Date: Sat, 27 Aug 2022 23:30:06 +0200
Message-Id: <20220827213006.4059469-1-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 27 Aug 2022 21:30:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169972

specifically that ../../layer.conf exists, and that second-from-last
component in the path is 'templates'.

This requires tweaking template.conf creation in eSDK bbclass, as
we need to ensure that the path in it is valid, and exists
(which may not be the case if the SDK is poky-based).

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/classes-recipe/populate_sdk_ext.bbclass | 3 ++-
 scripts/oe-setup-builddir                    | 5 +++++
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/populate_sdk_ext.bbclass b/meta/classes-recipe/populate_sdk_ext.bbclass
index 56e24c4eed..925cb313fc 100644
--- a/meta/classes-recipe/populate_sdk_ext.bbclass
+++ b/meta/classes-recipe/populate_sdk_ext.bbclass
@@ -438,7 +438,8 @@ python copy_buildsystem () {
     else:
         # Write a templateconf.cfg
         with open(baseoutpath + '/conf/templateconf.cfg', 'w') as f:
-            f.write('meta/conf\n')
+            f.write('meta/conf/templates/default\n')
+        os.makedirs(os.path.join(baseoutpath, core_meta_subdir, 'conf/templates/default'), exist_ok=True)
 
     # Ensure any variables set from the external environment (by way of
     # BB_ENV_PASSTHROUGH_ADDITIONS) are set in the SDK's configuration
diff --git a/scripts/oe-setup-builddir b/scripts/oe-setup-builddir
index 5d644168cb..bf832ee0ca 100755
--- a/scripts/oe-setup-builddir
+++ b/scripts/oe-setup-builddir
@@ -61,6 +61,11 @@ if [ -n "$TEMPLATECONF" ]; then
             echo >&2 "Error: TEMPLATECONF value points to nonexistent directory '$TEMPLATECONF'"
             exit 1
         fi
+        templatesdir=$(python3 -c "import sys; print(sys.argv[1].strip('/').split('/')[-2])" $TEMPLATECONF)
+        if [ ! -f "$TEMPLATECONF/../../layer.conf" -o $templatesdir != "templates" ]; then
+            echo >&2 "Error: TEMPLATECONF value (which is $TEMPLATECONF) must point to meta-some-layer/conf/templates/template-name"
+            exit 1
+        fi
     fi
     OECORELAYERCONF="$TEMPLATECONF/bblayers.conf.sample"
     OECORELOCALCONF="$TEMPLATECONF/local.conf.sample"
-- 
2.30.2


