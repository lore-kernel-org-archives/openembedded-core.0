Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B25C4C83F03
	for <webhook@archiver.kernel.org>; Wed,  9 Jul 2025 09:43:53 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web10.11571.1752054225399769094
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Jul 2025 02:43:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=TU1FRmTf;
 spf=pass (domain: mvista.com, ip: 209.85.210.180, mailfrom: hprajapati@mvista.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-7490702fc7cso3283741b3a.1
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Jul 2025 02:43:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1752054224; x=1752659024; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZKyJJir8izh+sjUhzGl47m5VNXGDJWhHcEZownxJBn4=;
        b=TU1FRmTf8gu3Iro0rZQdU8MV4IsBZEfJVyLZ4+uMFB3QeMvTXu0KDdbySlaLa7YMHN
         jIiKRZCVK0jHSFcnkuCNfM1JrdE0yR5pP82oNLkFr/i00mAfDzTCyRoJ0nSDe8/W3Yzh
         gyj59J5yy0XlsA/jctpBK/5ARhkW7FB0xTnec=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752054224; x=1752659024;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZKyJJir8izh+sjUhzGl47m5VNXGDJWhHcEZownxJBn4=;
        b=T4jwwNwNDCD1BbJV/IX0FEqm/WhMMdgR2nPfX2WJx3xQKlvoNSscnw4sbxtiQ4BafH
         YXXkNI0BFxloqukuOogVYiITCROKjscyY8evIBbPjSi1Ayoa/iywQdwZgj7X7JQcS1V8
         Dp0OKmcT7IPUbgvaWik03ST1aT6K4cXd1nHb6IbvE1N4gg8TuXzs7x1LCYzU5BC19bIr
         eyhYaiXuFJ2Pp9hTleVEPgTACKC3isM1EGmBwzfCZgTzeKzXk7QJKTQrBCQq5p/WNMcX
         hDzn4vEnkNTCXnxZFGW3rPqVa+qr2KK9WQO8Sb8lnTCvASMAtWfiuEX78JdgSZS5s5Ak
         bOEA==
X-Gm-Message-State: AOJu0YwqOiH5DVTWjSmKZt29GeNVM0/tkweSAZZaFkOm5LKi/oeHeMmZ
	nt2SzGT4P9LqcjCWqMrRBN+D6a878veMshe/qOemjGd1jKSfcqLkAVnYXXGVf9G5zTzEtRt/oLr
	g26ac
X-Gm-Gg: ASbGncuJhwFPXYvLRXBAX1XmE2cSsiDNBt0kuRfnP38iqbmoARyEkUAfx/HBcpHigS7
	NdVM7vdvNtvgV62bQT1unKQIF6rr/rFxDpOdc8uZGlSKDh4WhrEv6Ay+aN2YMCWF09K8ua3ndoq
	wSHFHdJedqf/5ibY379FEh25g5lvh7ecQ36EBMJbptlF+L0dxYzu345fwAGq8b5ADpuM4HDNPuS
	lppN+D5/hdum8rtPHXqHj1xSX075od4HuJnu8oe89dqaAx4TeaxHkzC7+njtId81dcgmo3TkrFJ
	JqjuHvKtwStsazGDS1oCxExpFO21lzIR+Q6LH+ZQvrpZQutnj6ixpDYQ93ZlCM2LtFWvE7UynX0
	+
X-Google-Smtp-Source: AGHT+IHNzyheAoR1G9eSY8H7TTiQnXn6mkyjHL7o+3S5d7iUDrcjEMhwN6gSLVqzHkcLiYUjsMDAfA==
X-Received: by 2002:a05:6a00:39a7:b0:748:2b23:308c with SMTP id d2e1a72fcca58-74ea6648d6amr2550864b3a.14.1752054224433;
        Wed, 09 Jul 2025 02:43:44 -0700 (PDT)
Received: from MVIN00016.mvista.com ([150.129.170.130])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74ce42d42d7sm14525193b3a.154.2025.07.09.02.43.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 02:43:44 -0700 (PDT)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [kirkstone][PATCH] libxml2: fix CVE-2025-49794 & CVE-2025-49796
Date: Wed,  9 Jul 2025 15:13:27 +0530
Message-ID: <20250709094327.70517-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Jul 2025 09:43:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220086

Upstream-Status: Backport from https://gitlab.gnome.org/GNOME/libxml2/-/commit/71e1e8af5ee46dad1b57bb96cfbf1c3ad21fbd7b

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../CVE-2025-49794-CVE-2025-49796.patch       | 181 ++++++++++++++++++
 meta/recipes-core/libxml/libxml2_2.9.14.bb    |   1 +
 2 files changed, 182 insertions(+)
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2025-49794-CVE-2025-49796.patch

diff --git a/meta/recipes-core/libxml/libxml2/CVE-2025-49794-CVE-2025-49796.patch b/meta/recipes-core/libxml/libxml2/CVE-2025-49794-CVE-2025-49796.patch
new file mode 100644
index 0000000000..3ec8b4173f
--- /dev/null
+++ b/meta/recipes-core/libxml/libxml2/CVE-2025-49794-CVE-2025-49796.patch
@@ -0,0 +1,181 @@
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
+ schematron.c                           | 37 +++++++++++++++-----------
+ test/schematron/cve-2025-49794.sct     | 10 +++++++
+ test/schematron/cve-2025-49794_0.xml   |  6 +++++
+ test/schematron/cve-2025-49796.sct     |  9 +++++++
+ test/schematron/cve-2025-49796_0.xml   |  3 +++
+ 7 files changed, 53 insertions(+), 16 deletions(-)
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
+index ddbb069..5ebca64 100644
+--- a/schematron.c
++++ b/schematron.c
+@@ -1239,27 +1239,16 @@ exit:
+  *									*
+  ************************************************************************/
+ 
+-static xmlNodePtr
++static xmlXPathObjectPtr
+ xmlSchematronGetNode(xmlSchematronValidCtxtPtr ctxt,
+                      xmlNodePtr cur, const xmlChar *xpath) {
+-    xmlNodePtr node = NULL;
+-    xmlXPathObjectPtr ret;
+ 
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
+-	node = ret->nodesetval->nodeTab[0];
+-
+-    xmlXPathFreeObject(ret);
+-    return(node);
++    return(xmlXPathEval(xpath, ctxt->xctxt));
+ }
+ 
+ /**
+@@ -1304,18 +1293,26 @@ xmlSchematronFormatReport(xmlSchematronValidCtxtPtr ctxt,
+ 	    (child->type == XML_CDATA_SECTION_NODE))
+ 	    ret = xmlStrcat(ret, child->content);
+ 	else if (IS_SCHEMATRON(child, "name")) {
++            xmlXPathObject *obj = NULL;
+ 	    xmlChar *path;
+ 
+ 	    path = xmlGetNoNsProp(child, BAD_CAST "path");
+ 
+             node = cur;
+ 	    if (path != NULL) {
+-	        node = xmlSchematronGetNode(ctxt, cur, path);
+-		if (node == NULL)
+-		    node = cur;
++                obj = xmlSchematronGetNode(ctxt, cur, path);
++                if ((obj != NULL) &&
++                    (obj->type == XPATH_NODESET) &&
++                    (obj->nodesetval != NULL) &&
++                    (obj->nodesetval->nodeNr > 0))
++                    node = obj->nodesetval->nodeTab[0];
+ 		xmlFree(path);
+ 	    }
+ 
++	     switch (node->type) {
++                case XML_ELEMENT_NODE:
++                case XML_ATTRIBUTE_NODE:
++
+ 	    if ((node->ns == NULL) || (node->ns->prefix == NULL))
+ 	        ret = xmlStrcat(ret, node->name);
+ 	    else {
+@@ -1323,6 +1320,14 @@ xmlSchematronFormatReport(xmlSchematronValidCtxtPtr ctxt,
+ 	        ret = xmlStrcat(ret, BAD_CAST ":");
+ 	        ret = xmlStrcat(ret, node->name);
+ 	    }
++	    break;
++
++		/* TODO: handle other node types */
++		default:
++	    break;
++            }
++
++            xmlXPathFreeObject(obj);
+ 	} else {
+ 	    child = child->next;
+ 	    continue;
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
diff --git a/meta/recipes-core/libxml/libxml2_2.9.14.bb b/meta/recipes-core/libxml/libxml2_2.9.14.bb
index 45424e59ff..baac155270 100644
--- a/meta/recipes-core/libxml/libxml2_2.9.14.bb
+++ b/meta/recipes-core/libxml/libxml2_2.9.14.bb
@@ -40,6 +40,7 @@ SRC_URI += "http://www.w3.org/XML/Test/xmlts20080827.tar;subdir=${BP};name=testt
            file://CVE-2025-32414.patch \
            file://CVE-2025-32415.patch \
            file://CVE-2025-6021.patch \
+           file://CVE-2025-49794-CVE-2025-49796.patch \
            "
 
 SRC_URI[archive.sha256sum] = "60d74a257d1ccec0475e749cba2f21559e48139efba6ff28224357c7c798dfee"
-- 
2.49.0


