Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDA87C433EF
	for <webhook@archiver.kernel.org>; Tue, 22 Feb 2022 13:27:10 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
 [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web09.12682.1645536429940789171
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Feb 2022 05:27:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=SdHR8inK;
 spf=pass (domain: gmail.com, ip: 209.85.218.41,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id qx21so42820889ejb.13
        for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Feb 2022 05:27:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=f4SIUvLDR9G07y5q3gGRfnXq4nI/e6Gv+BzF2yHmMhQ=;
        b=SdHR8inKrOhzDolY6byGzQo0TUke6GfOcFU6D8yAPfep7k2XSDVrUJXyTzWZeaAaE7
         LJLQ9pMbaieCwA6+Vloqg14/rbPSc37tMuEQZ53NHwQTAo9xCO8ETVuvw/OvhTV+gMYh
         MiofepNnWEN8Eip8XroKeMCWZXS6qb7nq4Jy2P/ABsjNPB0v9i0GMucjFJotLkklGiJ+
         Nuf0Rp5ORxJbXvHmY40hRaYBHhbcax0suKdVYcj8eHKSNNULy+r01QyIuEhAtWwxfjL5
         zJyEXt9QV50xOhWUp7bGLhmPzK6fj3DvEHrge3C5MK2DJqG9R/Y9awkDyrqzDNJylgtv
         JMjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=f4SIUvLDR9G07y5q3gGRfnXq4nI/e6Gv+BzF2yHmMhQ=;
        b=HFUEzqKEF1WPksIQgMm51523dKNYm5rUcdVUcVvEJD8eA6ohJNWhdmopFlXhK7elHD
         +1WjuFcQ1EV/qhZ6Olx6O/aTvTg7VOP5GYB2oWS1rO9JAOowN2+U0i+ReGdaqOtRwsLL
         ZJizvhZ52JHKa5qB662iXC2HxqG7AlGXrmCT1vCdmVdGmMUdz3OrFlFOv9iEG/O5bP3W
         ugqeVh06iFYyUcc8pBWEHxe1KgHkGROLBd8fUktOsM/tgy4y2yF7vUZgD22V1Mq82tDK
         VijlYwWuxoEKfOAfV0nxSO/T0A7YS97aZnHmjV4MbPffrCH7ppgoXar4Uapny9lCaCTd
         Nrog==
X-Gm-Message-State: AOAM532kyNwiWdeXHAd7RFDWbqxXJ6JIN+4zRKbxFFr3yWVp+0sXgMUn
	o4Fzt+t/kZEQZAMS2zVpF8Gxv+GnRbW7Ow==
X-Google-Smtp-Source: 
 ABdhPJyBUVzPs+YjMTwSG0y8EvRue/qJDuFOrRdQnD1Yw+932Oznfxg8vA6VxrYnIKDQqfnVLGTnNQ==
X-Received: by 2002:a17:906:f248:b0:6cf:8328:af53 with SMTP id
 gy8-20020a170906f24800b006cf8328af53mr19688795ejb.570.1645536428258;
        Tue, 22 Feb 2022 05:27:08 -0800 (PST)
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with ESMTPSA id
 s6sm1092293ejb.112.2022.02.22.05.27.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Feb 2022 05:27:07 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [PATCH] icecc.bbclass: fix syntax error
Date: Tue, 22 Feb 2022 14:26:57 +0100
Message-Id: <20220222132657.1921138-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Feb 2022 13:27:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162133

'class' is already taken as keyword and python doesn't like this:

  ERROR: Error in compiling python function in oe-core/meta/classes/icecc.bbclass, line 151:

  The code lines resulting in this error were:
       0020:    check_pn = set([pn, bpn])
       0021:
       0022:    class_disable = (d.getVar('ICECC_CLASS_DISABLE') or "").split()
       0023:
   *** 0024:    for class in class_disable:
       0025:        if bb.data.inherits_class(class, d):
       0026:            bb.debug(1, "%s: class %s found in disable, disable icecc" % (pn, class))
       0027:            return "no"
       0028:
  SyntaxError: invalid syntax (icecc.bbclass, line 151)

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/icecc.bbclass | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/classes/icecc.bbclass b/meta/classes/icecc.bbclass
index 90ea3d8df6..a550b6af24 100644
--- a/meta/classes/icecc.bbclass
+++ b/meta/classes/icecc.bbclass
@@ -148,9 +148,9 @@ def use_icecc(bb,d):
 
     class_disable = (d.getVar('ICECC_CLASS_DISABLE') or "").split()
 
-    for class in class_disable:
-        if bb.data.inherits_class(class, d):
-            bb.debug(1, "%s: class %s found in disable, disable icecc" % (pn, class))
+    for bbclass in class_disable:
+        if bb.data.inherits_class(bbclass, d):
+            bb.debug(1, "%s: bbclass %s found in disable, disable icecc" % (pn, bbclass))
             return "no"
 
     disabled_recipes = (d.getVar('ICECC_RECIPE_DISABLE') or "").split()
-- 
2.35.1


