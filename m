Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47170C83F27
	for <webhook@archiver.kernel.org>; Thu, 17 Jul 2025 02:59:21 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web10.40264.1752721151659324894
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Jul 2025 19:59:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=2wvsoq0m;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.53, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3138e64b42aso623777a91.0
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Jul 2025 19:59:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1752721151; x=1753325951; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qtlSzuJKk6hf5m16PH23LSRguAGBLjRCyq6+MnEou2U=;
        b=2wvsoq0mMrgz9gvbzhFI3lOQxdkx4H4OeF5Q871uEBJe2L74TnyX5fRdIWdo8MbNiS
         ZLggk4zlkrayNA0z+TDJFLluIMY0dzn0epIVqdCbA3jZJQ/X4/T5UpF6ByskQxwV/fJt
         kbLW9uPZWcX2NcrwvNZJRUCrX7aU1jBMpJk29WO54icTKh7XMCyQ/T/WPVMbxEhHXUna
         2cJA2yeiofBrTkYdqmBf0QuO0J1NpCIlL9Yb1dABB9ZsuAhw9qMuC4v+C+tXOxMCumkI
         7HQX1HJW4W37G5V6nnDflSgA7Gnb+L/W7Vo3q9T4BQFwrckQ9oxz+zVk3BxJNTw9D3sr
         d/UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752721151; x=1753325951;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qtlSzuJKk6hf5m16PH23LSRguAGBLjRCyq6+MnEou2U=;
        b=KJ/Lb10Qa3euLIaBlegcwrx0JJcrDX+HPq4JcqZciB9Kg9vTY6cxmMI7NFH9dPTfvL
         1OvHY4ar/4EyLL6HDcVP9OGeCZBZSSvOX2QZpEHOzI2c+LRcgftyx6crQNlKiK8rlGNi
         g9nrTH7hI/LM2Lh5SXCHj2H0p+aMeAL87HOCnmmxEjloH+0EYK3KWqSAFV2GUR+xyau8
         0VRkRQOCvlXmyDRFNeNFaV4ruKfiEBZ60C6SJ8uQqyrSooq+M/KYbX2I0P+IXvmOT7TR
         3iDz3Zhj6xRC0hMe4oaXewfa3sGc9tsnpuhsSyygtUAL58q/JcDBOFjnzqRG5SyK2rK+
         Yipg==
X-Gm-Message-State: AOJu0Yx6451tIRBOIXX+b9YZOf6Inn7p9Fpo7NqE7TgCh8KblhKGl3XQ
	ULUUHGOZupU4/eod6R+DcWhk/UsBwFCqrArTF2gGJ1l2ZBIJ1XAG4/oj04cS4RFWJD+mBfWlYfA
	hHT1F
X-Gm-Gg: ASbGncvR88ZZOd1uUtNOenTWv7FIML0xCKrbPweeiS94a8bQhGgVb4QFOzQJU69Ynjn
	XAB4e1L3EH/pk7ZQwUzSRKh+2V2+ix06Wrv6AhriqdaKLm0DfVJnMVJoJQRElx3VbRdxdrkF/X+
	Skn3f83jU1U3cE9FeajiS3QldZ4FNIhgqg05Gv0sH+HlTsgJ+QD+ktN6JSm+ax+CugBQ3gq9Z5G
	9f4vm4ZlAQGYQfAKI7r2RKxvrB2AAdY7AIcQGR5iy2Iva7EMaskvaIIOq/zwUDwM+aBe8xeXoMv
	zxyJ/5pzPppiCom6Z4OiTSRtAkwPLzQZmDyYt8fyYFHZcKqa92J37k5UG57OHlsG0HJIH9UCWPY
	HABlnQmL83Ush2g==
X-Google-Smtp-Source: AGHT+IHbxfq2iLe80N8qAeLo+4zVCHVNF93b/NRsi0wtR87/NpUlzZ+3zLHmEyoSiyVFYofqdWjgbw==
X-Received: by 2002:a17:90b:3f08:b0:313:176b:3d4b with SMTP id 98e67ed59e1d1-31caf8db637mr1520008a91.22.1752721150579;
        Wed, 16 Jul 2025 19:59:10 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:3bfc:8fec:7e35:e96a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31c9f29e313sm2204547a91.35.2025.07.16.19.59.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 19:59:10 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 01/12] libxml2: fix CVE-2025-49794 & CVE-2025-49796
Date: Wed, 16 Jul 2025 19:58:49 -0700
Message-ID: <bb20ddc599314161f3bcd6d5479e81478ceaaa3a.1752721028.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1752721028.git.steve@sakoman.com>
References: <cover.1752721028.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Jul 2025 02:59:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220501

From: Hitendra Prajapati <hprajapati@mvista.com>

Upstream-Status: Backport from https://gitlab.gnome.org/GNOME/libxml2/-/commit/71e1e8af5ee46dad1b57bb96cfbf1c3ad21fbd7b

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../CVE-2025-49794-CVE-2025-49796.patch       | 186 ++++++++++++++++++
 meta/recipes-core/libxml/libxml2_2.12.10.bb   |   1 +
 2 files changed, 187 insertions(+)
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2025-49794-CVE-2025-49796.patch

diff --git a/meta/recipes-core/libxml/libxml2/CVE-2025-49794-CVE-2025-49796.patch b/meta/recipes-core/libxml/libxml2/CVE-2025-49794-CVE-2025-49796.patch
new file mode 100644
index 0000000000..881cac7f03
--- /dev/null
+++ b/meta/recipes-core/libxml/libxml2/CVE-2025-49794-CVE-2025-49796.patch
@@ -0,0 +1,186 @@
+From 71e1e8af5ee46dad1b57bb96cfbf1c3ad21fbd7b Mon Sep 17 00:00:00 2001
+From: Nick Wellnhofer <wellnhofer@aevum.de>
+Date: Fri, 4 Jul 2025 14:28:26 +0200
+Subject: [PATCH] schematron: Fix memory safety issues in
+ xmlSchematronReportOutput
+
+Fix use-after-free (CVE-2025-49794) and type confusion (CVE-2025-49796)
+in xmlSchematronReportOutput.
+
+Fixes #931.
+Fixes #933.
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libxml2/-/commit/71e1e8af5ee46dad1b57bb96cfbf1c3ad21fbd7b]
+CVE: CVE-2025-49794 CVE-2025-49796
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ result/schematron/cve-2025-49794_0.err |  2 ++
+ result/schematron/cve-2025-49796_0.err |  2 ++
+ schematron.c                           | 49 ++++++++++++++------------
+ test/schematron/cve-2025-49794.sct     | 10 ++++++
+ test/schematron/cve-2025-49794_0.xml   |  6 ++++
+ test/schematron/cve-2025-49796.sct     |  9 +++++
+ test/schematron/cve-2025-49796_0.xml   |  3 ++
+ 7 files changed, 58 insertions(+), 23 deletions(-)
+ create mode 100644 result/schematron/cve-2025-49794_0.err
+ create mode 100644 result/schematron/cve-2025-49796_0.err
+ create mode 100644 test/schematron/cve-2025-49794.sct
+ create mode 100644 test/schematron/cve-2025-49794_0.xml
+ create mode 100644 test/schematron/cve-2025-49796.sct
+ create mode 100644 test/schematron/cve-2025-49796_0.xml
+
+diff --git a/result/schematron/cve-2025-49794_0.err b/result/schematron/cve-2025-49794_0.err
+new file mode 100644
+index 0000000..5775231
+--- /dev/null
++++ b/result/schematron/cve-2025-49794_0.err
+@@ -0,0 +1,2 @@
++./test/schematron/cve-2025-49794_0.xml:2: element boo0: schematron error : /librar0/boo0 line 2:  
++./test/schematron/cve-2025-49794_0.xml fails to validate
+diff --git a/result/schematron/cve-2025-49796_0.err b/result/schematron/cve-2025-49796_0.err
+new file mode 100644
+index 0000000..bf875ee
+--- /dev/null
++++ b/result/schematron/cve-2025-49796_0.err
+@@ -0,0 +1,2 @@
++./test/schematron/cve-2025-49796_0.xml:2: element boo0: schematron error : /librar0/boo0 line 2:  
++./test/schematron/cve-2025-49796_0.xml fails to validate
+diff --git a/schematron.c b/schematron.c
+index a825920..411a515 100644
+--- a/schematron.c
++++ b/schematron.c
+@@ -1389,27 +1389,15 @@ exit:
+  *                                                                      *
+  ************************************************************************/
+ 
+-static xmlNodePtr
++static xmlXPathObjectPtr
+ xmlSchematronGetNode(xmlSchematronValidCtxtPtr ctxt,
+                      xmlNodePtr cur, const xmlChar *xpath) {
+-    xmlNodePtr node = NULL;
+-    xmlXPathObjectPtr ret;
+-
+     if ((ctxt == NULL) || (cur == NULL) || (xpath == NULL))
+         return(NULL);
+ 
+     ctxt->xctxt->doc = cur->doc;
+     ctxt->xctxt->node = cur;
+-    ret = xmlXPathEval(xpath, ctxt->xctxt);
+-    if (ret == NULL)
+-        return(NULL);
+-
+-    if ((ret->type == XPATH_NODESET) &&
+-        (ret->nodesetval != NULL) && (ret->nodesetval->nodeNr > 0))
+-        node = ret->nodesetval->nodeTab[0];
+-
+-    xmlXPathFreeObject(ret);
+-    return(node);
++    return(xmlXPathEval(xpath, ctxt->xctxt));
+ }
+ 
+ /**
+@@ -1455,25 +1443,40 @@ xmlSchematronFormatReport(xmlSchematronValidCtxtPtr ctxt,
+             (child->type == XML_CDATA_SECTION_NODE))
+             ret = xmlStrcat(ret, child->content);
+         else if (IS_SCHEMATRON(child, "name")) {
++            xmlXPathObject *obj = NULL;
+             xmlChar *path;
+ 
+             path = xmlGetNoNsProp(child, BAD_CAST "path");
+ 
+             node = cur;
+             if (path != NULL) {
+-                node = xmlSchematronGetNode(ctxt, cur, path);
+-                if (node == NULL)
+-                    node = cur;
++                obj = xmlSchematronGetNode(ctxt, cur, path);
++                if ((obj != NULL) &&
++                    (obj->type == XPATH_NODESET) &&
++                    (obj->nodesetval != NULL) &&
++                    (obj->nodesetval->nodeNr > 0))
++                    node = obj->nodesetval->nodeTab[0];
+                 xmlFree(path);
+             }
+ 
+-            if ((node->ns == NULL) || (node->ns->prefix == NULL))
+-                ret = xmlStrcat(ret, node->name);
+-            else {
+-                ret = xmlStrcat(ret, node->ns->prefix);
+-                ret = xmlStrcat(ret, BAD_CAST ":");
+-                ret = xmlStrcat(ret, node->name);
++            switch (node->type) {
++                case XML_ELEMENT_NODE:
++                case XML_ATTRIBUTE_NODE:
++                    if ((node->ns == NULL) || (node->ns->prefix == NULL))
++                        ret = xmlStrcat(ret, node->name);
++                    else {
++                        ret = xmlStrcat(ret, node->ns->prefix);
++                        ret = xmlStrcat(ret, BAD_CAST ":");
++                        ret = xmlStrcat(ret, node->name);
++                    }
++                    break;
++
++                /* TODO: handle other node types */
++                default:
++                    break;
+             }
++
++            xmlXPathFreeObject(obj);
+         } else if (IS_SCHEMATRON(child, "value-of")) {
+             xmlChar *select;
+             xmlXPathObjectPtr eval;
+diff --git a/test/schematron/cve-2025-49794.sct b/test/schematron/cve-2025-49794.sct
+new file mode 100644
+index 0000000..7fc9ee3
+--- /dev/null
++++ b/test/schematron/cve-2025-49794.sct
+@@ -0,0 +1,10 @@
++<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron">
++    <sch:pattern id="">
++        <sch:rule context="boo0">
++            <sch:report test="not(0)">
++                <sch:name path="&#9;e|namespace::*|e"/>
++            </sch:report>
++            <sch:report test="0"></sch:report>
++        </sch:rule>
++    </sch:pattern>
++</sch:schema>
+diff --git a/test/schematron/cve-2025-49794_0.xml b/test/schematron/cve-2025-49794_0.xml
+new file mode 100644
+index 0000000..debc64b
+--- /dev/null
++++ b/test/schematron/cve-2025-49794_0.xml
+@@ -0,0 +1,6 @@
++<librar0>
++    <boo0 t="">
++        <author></author>
++    </boo0>
++    <ins></ins>
++</librar0>
+diff --git a/test/schematron/cve-2025-49796.sct b/test/schematron/cve-2025-49796.sct
+new file mode 100644
+index 0000000..e9702d7
+--- /dev/null
++++ b/test/schematron/cve-2025-49796.sct
+@@ -0,0 +1,9 @@
++<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron">
++    <sch:pattern id="">
++        <sch:rule context="boo0">
++            <sch:report test="not(0)">
++                <sch:name path="/"/>
++            </sch:report>
++        </sch:rule>
++    </sch:pattern>
++</sch:schema>
+diff --git a/test/schematron/cve-2025-49796_0.xml b/test/schematron/cve-2025-49796_0.xml
+new file mode 100644
+index 0000000..be33c4e
+--- /dev/null
++++ b/test/schematron/cve-2025-49796_0.xml
+@@ -0,0 +1,3 @@
++<librar0>
++    <boo0/>
++</librar0>
+-- 
+2.49.0
+
diff --git a/meta/recipes-core/libxml/libxml2_2.12.10.bb b/meta/recipes-core/libxml/libxml2_2.12.10.bb
index 1ecac70b4c..488ace62e5 100644
--- a/meta/recipes-core/libxml/libxml2_2.12.10.bb
+++ b/meta/recipes-core/libxml/libxml2_2.12.10.bb
@@ -21,6 +21,7 @@ SRC_URI += "http://www.w3.org/XML/Test/xmlts20130923.tar;subdir=${BP};name=testt
            file://CVE-2025-32414.patch \
            file://CVE-2025-32415.patch \
            file://CVE-2025-6021.patch \
+           file://CVE-2025-49794-CVE-2025-49796.patch \
            "
 
 SRC_URI[archive.sha256sum] = "c3d8c0c34aa39098f66576fe51969db12a5100b956233dc56506f7a8679be995"
-- 
2.43.0


