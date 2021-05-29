Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web10.22116.1622304395193734441
 for <openembedded-core@lists.openembedded.org>;
 Sat, 29 May 2021 09:06:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=VENvRRUL;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id x8so6238872wrq.9
        for <openembedded-core@lists.openembedded.org>; Sat, 29 May 2021 09:06:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jNtBbPmtCVRX6xhV6vQGvJs3LjP22nVv2KJfR2xqK2o=;
        b=VENvRRUL5GbiZRmq7Y5BLQXBWsuE7na/5HWGOWUjhQprNb7K70t5hnDW5ZKrJHkII6
         jby8nR6Jxb7UBlBI/J6H+X4OB+RaHT5wMHB4kRwSOvAXfjG1icjz06Z2cBbCtQC5mz08
         MvJSnDQyTECxMvbCQpC2KEZS+zvnMJdkPgnZU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jNtBbPmtCVRX6xhV6vQGvJs3LjP22nVv2KJfR2xqK2o=;
        b=khdRNQEkNYH9WHhrClcB0UNZTGQWhIJATspvHkyv8PE8Ll9ubj82GcJXVM/dh4l0mn
         9xRPO+o+pWSMwwPXR7qSgCrFZC4S75FP2c/DY2GSeOTgeFOXUDVRyDV8/NSM8KpZah6z
         plD2cPadEajaFeCw9mBdqSTxMA4EP7pgk3QnXBhOoOpU2dhdP+0m2e5WQxU9WNP2WimF
         dppt2UzpopiRQFmX3by8roSxU6xOS2Xsri6OkG/1K5/sLi/DlXnhMXYWJhXyAvB5fJsg
         A3sxFq3NHrzujEU7a10RgAGfDaoHZ97tULiaEdocWGb1Z0djg5/1pq8+vNWpsKjp3ZFA
         YC5A==
X-Gm-Message-State: AOAM531PGJd4mrhc+dGsJk4VlzdqDGO+CBoKuCQiC7tUV0Na4lSIRMX2
	gc77l1QLACnT2tr760hTNuC8w2/FUE4awA==
X-Google-Smtp-Source: ABdhPJzq6d2lv2kpStlOY80U1cRAOGLj2xShGW0Wb43H49dYe5SsnmcVZuWq90p0E7JEQ1gVN4UOmQ==
X-Received: by 2002:a5d:59a4:: with SMTP id p4mr14626575wrr.248.1622304393488;
        Sat, 29 May 2021 09:06:33 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:314e:6a46:a163:7356])
        by smtp.gmail.com with ESMTPSA id q20sm20873615wmq.2.2021.05.29.09.06.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 May 2021 09:06:33 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Tony Tascioglu <tony.tascioglu@windriver.com>
Subject: [hardknott] [PATCH 02/10] libxml2: Fix CVE-2021-3541
Date: Sat, 29 May 2021 17:06:24 +0100
Message-Id: <20210529160632.2796977-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210529160632.2796977-1-richard.purdie@linuxfoundation.org>
References: <20210529160632.2796977-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tony Tascioglu <tony.tascioglu@windriver.com>

Upstream commit:
This is related to parameter entities expansion and following
the line of the billion laugh attack. Somehow in that path the
counting of parameters was missed and the normal algorithm based
on entities "density" was useless.

CVE: CVE-2021-3541
Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libxml2/-/commit/8598060bacada41a0eb09d95c97744ff4e428f8e]

Signed-off-by: Tony Tascioglu <tony.tascioglu@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../libxml/libxml2/CVE-2021-3541.patch        | 73 +++++++++++++++++++
 meta/recipes-core/libxml/libxml2_2.9.10.bb    |  1 +
 2 files changed, 74 insertions(+)
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2021-3541.patch

diff --git a/meta/recipes-core/libxml/libxml2/CVE-2021-3541.patch b/meta/recipes-core/libxml/libxml2/CVE-2021-3541.patch
new file mode 100644
index 00000000000..3b86278ac4d
--- /dev/null
+++ b/meta/recipes-core/libxml/libxml2/CVE-2021-3541.patch
@@ -0,0 +1,73 @@
+From 8598060bacada41a0eb09d95c97744ff4e428f8e Mon Sep 17 00:00:00 2001
+From: Daniel Veillard <veillard@redhat.com>
+Date: Thu, 13 May 2021 14:55:12 +0200
+Subject: [PATCH] Patch for security issue CVE-2021-3541
+
+This is relapted to parameter entities expansion and following
+the line of the billion laugh attack. Somehow in that path the
+counting of parameters was missed and the normal algorithm based
+on entities "density" was useless.
+
+CVE: CVE-2021-3541
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libxml2/-/commit/8598060bacada41a0eb09d95c97744ff4e428f8e]
+
+Signed-off-by: Tony Tascioglu <tony.tascioglu@windriver.com>
+
+---
+ parser.c | 26 ++++++++++++++++++++++++++
+ 1 file changed, 26 insertions(+)
+
+diff --git a/parser.c b/parser.c
+index f5e5e169..c9312fa4 100644
+--- a/parser.c
++++ b/parser.c
+@@ -140,6 +140,7 @@ xmlParserEntityCheck(xmlParserCtxtPtr ctxt, size_t size,
+                      xmlEntityPtr ent, size_t replacement)
+ {
+     size_t consumed = 0;
++    int i;
+ 
+     if ((ctxt == NULL) || (ctxt->options & XML_PARSE_HUGE))
+         return (0);
+@@ -177,6 +178,28 @@ xmlParserEntityCheck(xmlParserCtxtPtr ctxt, size_t size,
+ 	    rep = NULL;
+ 	}
+     }
++
++    /*
++     * Prevent entity exponential check, not just replacement while
++     * parsing the DTD
++     * The check is potentially costly so do that only once in a thousand
++     */
++    if ((ctxt->instate == XML_PARSER_DTD) && (ctxt->nbentities > 10000) &&
++        (ctxt->nbentities % 1024 == 0)) {
++	for (i = 0;i < ctxt->inputNr;i++) {
++	    consumed += ctxt->inputTab[i]->consumed +
++	               (ctxt->inputTab[i]->cur - ctxt->inputTab[i]->base);
++	}
++	if (ctxt->nbentities > consumed * XML_PARSER_NON_LINEAR) {
++	    xmlFatalErr(ctxt, XML_ERR_ENTITY_LOOP, NULL);
++	    ctxt->instate = XML_PARSER_EOF;
++	    return (1);
++	}
++	consumed = 0;
++    }
++
++
++
+     if (replacement != 0) {
+ 	if (replacement < XML_MAX_TEXT_LENGTH)
+ 	    return(0);
+@@ -7963,6 +7986,9 @@ xmlParsePEReference(xmlParserCtxtPtr ctxt)
+             xmlChar start[4];
+             xmlCharEncoding enc;
+ 
++	    if (xmlParserEntityCheck(ctxt, 0, entity, 0))
++	        return;
++
+ 	    if ((entity->etype == XML_EXTERNAL_PARAMETER_ENTITY) &&
+ 	        ((ctxt->options & XML_PARSE_NOENT) == 0) &&
+ 		((ctxt->options & XML_PARSE_DTDVALID) == 0) &&
+-- 
+2.25.1
+
diff --git a/meta/recipes-core/libxml/libxml2_2.9.10.bb b/meta/recipes-core/libxml/libxml2_2.9.10.bb
index a9bff74b553..ce4f9a33408 100644
--- a/meta/recipes-core/libxml/libxml2_2.9.10.bb
+++ b/meta/recipes-core/libxml/libxml2_2.9.10.bb
@@ -29,6 +29,7 @@ SRC_URI = "http://www.xmlsoft.org/sources/libxml2-${PV}.tar.gz;name=libtar \
            file://CVE-2021-3518-0001.patch \
            file://CVE-2021-3518-0002.patch \
            file://CVE-2021-3537.patch \
+           file://CVE-2021-3541.patch \
            "
 
 SRC_URI[libtar.md5sum] = "10942a1dc23137a8aa07f0639cbfece5"
-- 
2.30.2

