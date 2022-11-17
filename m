Return-Path: <bindudaniel1996@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EA83C4332F
	for <webhook@archiver.kernel.org>; Thu, 17 Nov 2022 10:46:43 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web11.12658.1668681998226286760
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Nov 2022 02:46:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=KziiUclu;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: bindudaniel1996@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id d13-20020a17090a3b0d00b00213519dfe4aso1573765pjc.2
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Nov 2022 02:46:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gjrz0VmB3ZufCC756+VCJGXK/xL1nvv4ZMmUfAdQm3E=;
        b=KziiUclu+jXs0AAodx1wI+P5TVOubgPkQtxUid7hHCfiM6resDkaR33NcNNnQBjKVc
         CbWJpXfBNdLbnmls5DxVER8f+lRI7H1bafVcOVzZc0aohbMyJ1eLKR5JyRniXHaikl79
         p8YnAaksr1lBvtXlUofGzUYenh6F47dz6rxkTBkkq5kEK4VZdnOYslKCZvFlJfufMryy
         0PoL48zjPwqgQGNzff//q/18zpDUh7uDhgOH3Ty2ICJrnvJJRLPoCeiLqUUf3wpM8cjy
         uWgKk2jPYcVDAEsb6OAZIkn36OY3HcEpJetEhNQmdt7wq+ExjOAQCPtt5rTASpktX+Pa
         hv/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gjrz0VmB3ZufCC756+VCJGXK/xL1nvv4ZMmUfAdQm3E=;
        b=DK62HZDejQRqRAKajHDj4Tpil7Q2Fd8ZTYV5zltXuWz3XVHGnIM8VYEelv9sZGiwNB
         v+yrsSh3mbMzRHQx7d7+5mDl3srxvkgz8AQhWxcaYTlESTcLW1q0XVsR0kQAaSYam6+B
         0MAEye5BEvjpAosptcAfcbTDKzUvaWNI5iyEO8iQKSFuZUxVzrhXfPdvOPiBlkqrbaOS
         /OuJ6fWmUwQ+3rqMHjqORDTmfwi9EYSjMEINXLXNwVMzMq7jLPAzjn1zWfVZ62thARDv
         TXdjCcXU8t1ezeXyWFgf8s7OLjCz7jtzO2cqHCVNypWsOnUVDhlrHUi/dZkPgBgwovRG
         7Pvg==
X-Gm-Message-State: ANoB5pnqz4tqY77JUARtbmEwRlij3Y1dtS2n5LNIuWaSGjJN8+FhfBmr
	4D2xuV+jwqA/hQmsZoXLcNuO/LUVe6cZkw==
X-Google-Smtp-Source: AA0mqf4uOgLkr/j98DwexSMcBGFlXcbse8exoAUzGrGlnIFEDd6bnKmQycZoaoT/HhBW4FN3KVY9pg==
X-Received: by 2002:a17:903:3304:b0:186:61fd:7446 with SMTP id jk4-20020a170903330400b0018661fd7446mr2082819plb.150.1668681997303;
        Thu, 17 Nov 2022 02:46:37 -0800 (PST)
Received: from localhost.localdomain ([2401:4900:1f26:549b:ad0b:ffb0:ec99:c7ad])
        by smtp.gmail.com with ESMTPSA id y185-20020a6232c2000000b0056ddd2b5e9bsm800032pfy.41.2022.11.17.02.46.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Nov 2022 02:46:36 -0800 (PST)
From: Bhabu Bindu <bindudaniel1996@gmail.com>
To: openembedded-core@lists.openembedded.org,
	bindudaniel1996@gmail.com
Cc: ranjitsinh.rathod@kpit.com,
	Bhabu Bindu <bhabu.bindu@kpit.com>
Subject: [OE-core][dunfell][PATCH 2/2] libxml2: Fix CVE-2022-40304
Date: Thu, 17 Nov 2022 16:15:53 +0530
Message-Id: <20221117104553.10288-2-bindudaniel1996@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221117104553.10288-1-bindudaniel1996@gmail.com>
References: <20221117104553.10288-1-bindudaniel1996@gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Nov 2022 10:46:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173414

From: Bhabu Bindu <bhabu.bindu@kpit.com>

Fix dict corruption caused by entity reference cycles

Link: https://gitlab.gnome.org/GNOME/libxml2/-/commit/1b41ec4e9433b05bb0376be4725804c54ef1d80b

Upstream-Status: Pending

Signed-off-by: Bhabu Bindu <bhabu.bindu@kpit.com>
---
 .../libxml/libxml2/CVE-2022-40304.patch       | 104 ++++++++++++++++++
 meta/recipes-core/libxml/libxml2_2.9.10.bb    |   1 +
 2 files changed, 105 insertions(+)
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2022-40304.patch

diff --git a/meta/recipes-core/libxml/libxml2/CVE-2022-40304.patch b/meta/recipes-core/libxml/libxml2/CVE-2022-40304.patch
new file mode 100644
index 0000000000..c19726fe9f
--- /dev/null
+++ b/meta/recipes-core/libxml/libxml2/CVE-2022-40304.patch
@@ -0,0 +1,104 @@
+From 1b41ec4e9433b05bb0376be4725804c54ef1d80b Mon Sep 17 00:00:00 2001
+From: Nick Wellnhofer <wellnhofer@aevum.de>
+Date: Wed, 31 Aug 2022 22:11:25 +0200
+Subject: [PATCH] [CVE-2022-40304] Fix dict corruption caused by entity
+ reference cycles
+
+When an entity reference cycle is detected, the entity content is
+cleared by setting its first byte to zero. But the entity content might
+be allocated from a dict. In this case, the dict entry becomes corrupted
+leading to all kinds of logic errors, including memory errors like
+double-frees.
+
+Stop storing entity content, orig, ExternalID and SystemID in a dict.
+These values are unlikely to occur multiple times in a document, so they
+shouldn't have been stored in a dict in the first place.
+
+Thanks to Ned Williamson and Nathan Wachholz working with Google Project
+Zero for the report!
+
+CVE: CVE-2022-40304
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libxml2/-/commit/1b41ec4e9433b05bb0376be4725804c54ef1d80b]
+Signed-off-by: Bhabu Bindu <bhabu.bindu@kpit.com>
+---
+ entities.c | 55 ++++++++++++++++--------------------------------------
+ 1 file changed, 16 insertions(+), 39 deletions(-)
+
+diff --git a/entities.c b/entities.c
+index 84435515..d4e5412e 100644
+--- a/entities.c
++++ b/entities.c
+@@ -128,36 +128,19 @@ xmlFreeEntity(xmlEntityPtr entity)
+     if ((entity->children) && (entity->owner == 1) &&
+         (entity == (xmlEntityPtr) entity->children->parent))
+         xmlFreeNodeList(entity->children);
+-    if (dict != NULL) {
+-        if ((entity->name != NULL) && (!xmlDictOwns(dict, entity->name)))
+-            xmlFree((char *) entity->name);
+-        if ((entity->ExternalID != NULL) &&
+-	    (!xmlDictOwns(dict, entity->ExternalID)))
+-            xmlFree((char *) entity->ExternalID);
+-        if ((entity->SystemID != NULL) &&
+-	    (!xmlDictOwns(dict, entity->SystemID)))
+-            xmlFree((char *) entity->SystemID);
+-        if ((entity->URI != NULL) && (!xmlDictOwns(dict, entity->URI)))
+-            xmlFree((char *) entity->URI);
+-        if ((entity->content != NULL)
+-            && (!xmlDictOwns(dict, entity->content)))
+-            xmlFree((char *) entity->content);
+-        if ((entity->orig != NULL) && (!xmlDictOwns(dict, entity->orig)))
+-            xmlFree((char *) entity->orig);
+-    } else {
+-        if (entity->name != NULL)
+-            xmlFree((char *) entity->name);
+-        if (entity->ExternalID != NULL)
+-            xmlFree((char *) entity->ExternalID);
+-        if (entity->SystemID != NULL)
+-            xmlFree((char *) entity->SystemID);
+-        if (entity->URI != NULL)
+-            xmlFree((char *) entity->URI);
+-        if (entity->content != NULL)
+-            xmlFree((char *) entity->content);
+-        if (entity->orig != NULL)
+-            xmlFree((char *) entity->orig);
+-    }
++    if ((entity->name != NULL) &&
++        ((dict == NULL) || (!xmlDictOwns(dict, entity->name))))
++        xmlFree((char *) entity->name);
++    if (entity->ExternalID != NULL)
++        xmlFree((char *) entity->ExternalID);
++    if (entity->SystemID != NULL)
++        xmlFree((char *) entity->SystemID);
++    if (entity->URI != NULL)
++        xmlFree((char *) entity->URI);
++    if (entity->content != NULL)
++        xmlFree((char *) entity->content);
++    if (entity->orig != NULL)
++        xmlFree((char *) entity->orig);
+     xmlFree(entity);
+ }
+ 
+@@ -193,18 +176,12 @@ xmlCreateEntity(xmlDictPtr dict, const xmlChar *name, int type,
+ 	    ret->SystemID = xmlStrdup(SystemID);
+     } else {
+         ret->name = xmlDictLookup(dict, name, -1);
+-	if (ExternalID != NULL)
+-	    ret->ExternalID = xmlDictLookup(dict, ExternalID, -1);
+-	if (SystemID != NULL)
+-	    ret->SystemID = xmlDictLookup(dict, SystemID, -1);
++	ret->ExternalID = xmlStrdup(ExternalID);
++	ret->SystemID = xmlStrdup(SystemID);
+     }
+     if (content != NULL) {
+         ret->length = xmlStrlen(content);
+-	if ((dict != NULL) && (ret->length < 5))
+-	    ret->content = (xmlChar *)
+-	                   xmlDictLookup(dict, content, ret->length);
+-	else
+-	    ret->content = xmlStrndup(content, ret->length);
++	ret->content = xmlStrndup(content, ret->length);
+      } else {
+         ret->length = 0;
+         ret->content = NULL;
+-- 
+GitLab
diff --git a/meta/recipes-core/libxml/libxml2_2.9.10.bb b/meta/recipes-core/libxml/libxml2_2.9.10.bb
index 39036f2688..40e3434ead 100644
--- a/meta/recipes-core/libxml/libxml2_2.9.10.bb
+++ b/meta/recipes-core/libxml/libxml2_2.9.10.bb
@@ -35,6 +35,7 @@ SRC_URI += "http://www.w3.org/XML/Test/xmlts20080827.tar.gz;subdir=${BP};name=te
            file://0001-Port-gentest.py-to-Python-3.patch \
            file://CVE-2016-3709.patch \
            file://CVE-2022-40303.patch \
+           file://CVE-2022-40304.patch \
            "
 
 SRC_URI[archive.sha256sum] = "593b7b751dd18c2d6abcd0c4bcb29efc203d0b4373a6df98e3a455ea74ae2813"
-- 
2.17.1


