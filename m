Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F810C43217
	for <webhook@archiver.kernel.org>; Sat, 19 Nov 2022 17:48:08 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web10.26302.1668880080260198294
 for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Nov 2022 09:48:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=vii4f+jS;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.171, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f171.google.com with SMTP id 62so7621471pgb.13
        for <openembedded-core@lists.openembedded.org>; Sat, 19 Nov 2022 09:48:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y0UAmTaUmhIMaeeKs4RtVCdsMwc+FzgLS6majGOAK8Q=;
        b=vii4f+jS2pSq99lxqrskfkPD2ssAKswyeDlr70rflKa2HoP4rynZwu+3Cv83OOI7Wy
         eyPdmQIPP4cBm+qkvmdcxwS5Lof9RDtGl2EEfeYXLqwXoOPd8qFjcdfiaG/3hAUj+WdS
         Dtr9RDpXpE9a0b2llVTmtM69Kw9bKDNFYn6+wgXYW+BOXStx3deCbiT3lNUALkI+5Jmf
         Q0QO4IW1XKeuI1v9y81bLMJLKjwlBnWYwsQNIhzS+OB2kdElX1bLORDVAReg6ExFjqqc
         I4pfBxIlC3ttnhBXDRFZNeff8PdgzjjSs1ctJMXZrn4F03IFiQdHwMs1p7YHWlfjQZvV
         I3Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y0UAmTaUmhIMaeeKs4RtVCdsMwc+FzgLS6majGOAK8Q=;
        b=x/YFCeaOpAdjVvIfYFR3jQouWd5VXp96C5jCyTdz4HgwpCBwhtzEiMModcc51sWzk7
         38fHJKobeBfFthVBc2lVTCFeMb++W9PNWdc2tx11J2zxv42A+4bgqGSitoyUc/1lbiMu
         FXoo8nIWDXMl1ExAZGMY/tfzGGPO36UjP5mTwpJjrzZdqOWV5dTD1awRU8eCf3i7T8l/
         wCralft5wsmlJ8BgRLN1HveVo3e/PRxVIi2elT5hBhH9334w28FrOB5PS2Xy8IXpKk49
         WfcLOzB3mNraalaWZht0wH/1R88DyZD0F5+eM2EJelhfsNBzEDg/xJHmHGyoD17E7Gju
         DYBQ==
X-Gm-Message-State: ANoB5pncziQb6mm4UfpwTkH+PbeL0XMc83abMmnhF4k5qDcZN6BKOZuR
	k1DFInY21jH3gW0W6t7lm8VvG+1jxcJAF183bNg=
X-Google-Smtp-Source: AA0mqf4Q19l9Swap7vl4ky346m5IZRFYKyNapY4OsAdWe3C8p7SVWrckkQpePF+4jyYeXfDSRby0ZA==
X-Received: by 2002:a63:1466:0:b0:476:cac7:16ad with SMTP id 38-20020a631466000000b00476cac716admr11336319pgu.128.1668880087074;
        Sat, 19 Nov 2022 09:48:07 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id m6-20020a17090a668600b0020d3662cc77sm7384151pjj.48.2022.11.19.09.48.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Nov 2022 09:48:06 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 06/21] libxml2: Fix CVE-2022-40304
Date: Sat, 19 Nov 2022 07:47:34 -1000
Message-Id: <ce3b84f38dcdd9244f2de461479dce05ca9d1a4e.1668879817.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1668879817.git.steve@sakoman.com>
References: <cover.1668879817.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 19 Nov 2022 17:48:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173524

From: Bhabu Bindu <bhabu.bindu@kpit.com>

Fix dict corruption caused by entity reference cycles

Link: https://gitlab.gnome.org/GNOME/libxml2/-/commit/1b41ec4e9433b05bb0376be4725804c54ef1d80b

Upstream-Status: Pending

Signed-off-by: Bhabu Bindu <bhabu.bindu@kpit.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.25.1


