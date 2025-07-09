Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8199DC83F03
	for <webhook@archiver.kernel.org>; Wed,  9 Jul 2025 09:06:03 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web10.11114.1752051955608273051
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Jul 2025 02:05:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=hhVNjvvv;
 spf=pass (domain: mvista.com, ip: 209.85.214.180, mailfrom: hprajapati@mvista.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2363616a1a6so50464305ad.3
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Jul 2025 02:05:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1752051955; x=1752656755; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GWxTbb3Ao+yHPL3PBvz6feqEfoRx8fsFCxy2UmWeYhQ=;
        b=hhVNjvvvWPbnNLp3tOyPeNgNNG7foa51DwsszZk4Gg5w0LrAAeUz+kiOzoeAKuOVQi
         2ryI6roZHdc9A0H7g3lFKtOyic7tN4suFtkIEKyEQHH8Qf8QZnjkUms2MEIGolWP8Gmu
         OyV8ueMRIkrsIs3Yf9ewjsR0FPREP8WY30rFo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752051955; x=1752656755;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GWxTbb3Ao+yHPL3PBvz6feqEfoRx8fsFCxy2UmWeYhQ=;
        b=msRqq1L+i8sw1S6Nlm8OSFM5EzJLKE0qMGjeuOpltVSChGU7NSPSwJmM46+RROE9LC
         2owhpXmc7Y/NKVjtOjPZxJeDe7csBBw/9FCW4lfEiQiBQcciTcLUdYYJJMcui9aLNk3E
         WyecSCl1RNelNVDEBMOTXIj62+VHENtYRA+zVFT0cO1qQ0AVVH25v9nheaJgfSMn33pe
         xoc1tlFiVTxEzy8iFgvJ9KiBkyS5K2nrAc3IlIawS1xlfmjRbZR74jFw0tEWb95IpaAS
         FxoowcAQdU+skBSx67S/5kpKlYwvzr/5Sagi6SgaN18Rz0jmzIHVn1vsFxIoSM/LpVL3
         hp0Q==
X-Gm-Message-State: AOJu0Yz/bto3G4rKgf9TQ7u5ynAi+bylLohunaaF/sCDRWVAGa6TgE56
	NUr7VNCI8NKYZfqgro1P4eT+RcQPuKcg76QvTkjAlYaSK54BV9EhgPdIo/J3Xy5YOSTvODxZj3N
	DaQ/N
X-Gm-Gg: ASbGnct0NHXD80v/m8nIUqr5QifMUgNZgcmTzRmZ2eC9oSuFPHo86phUXhRpnqy+1gV
	MoBvFq2JvbsqtW8nS3HPqlzB+Rs7SRT68thvdhAUKLPUHJCKzl8ZJMKLkqpvrzF3ir0zH1QS8vT
	pdu/87ZzqTXKaA5zLFw9Y9BXCeLwnL05sDOejEMnc0qraBUepH0OfGkHdRRCuQiabM3OSsJVWLD
	Tk42Woo0aBsp/OBOGxYVjIKFTWs5SGkBTt8kRhcF/A3XayeEuyJlgS3EVcgeIfOI/g/sBeGWCdT
	SiS2X+HHo4c0fG4M3YINkNtaj9U81r2mBF3U6N7MD/JbfNpAiWAhGtzqL5hb1d3agXuYfc3RvUf
	/
X-Google-Smtp-Source: AGHT+IFzUmx2ievBWiZXTOMqNt1naMBreX495f0lLPwAnVMLU4zdy9paLc3CnRYUlwPeVM/JI6FwOg==
X-Received: by 2002:a17:903:1206:b0:23c:7b65:9b08 with SMTP id d9443c01a7336-23ddb1991a1mr29611435ad.1.1752051954711;
        Wed, 09 Jul 2025 02:05:54 -0700 (PDT)
Received: from MVIN00016.mvista.com ([150.129.170.130])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23c8434f0cdsm131843795ad.77.2025.07.09.02.05.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 02:05:54 -0700 (PDT)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [scarthgap][PATCH] libxml2: fix CVE-2025-49794 & CVE-2025-49796
Date: Wed,  9 Jul 2025 14:35:35 +0530
Message-ID: <20250709090535.55848-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Jul 2025 09:06:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220083

Upstream-Status: Backport from https://gitlab.gnome.org/GNOME/libxml2/-/commit/71e1e8af5ee46dad1b57bb96cfbf1c3ad21fbd7b

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
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
2.49.0


