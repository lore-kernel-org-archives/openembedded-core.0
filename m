Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A2B1C83F27
	for <webhook@archiver.kernel.org>; Thu, 17 Jul 2025 02:56:01 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web11.40454.1752720952246650438
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Jul 2025 19:55:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=uVCq5fEn;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.50, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-311d5fdf1f0so478003a91.1
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Jul 2025 19:55:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1752720951; x=1753325751; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PhATVIDmaHkKgbMM3CPBKkk7uMkTMB5sx60clzqqST0=;
        b=uVCq5fEnL7wU5poMhDaAmtLLDSg7AZ29XWgVHxTlcW4S70wZ9HkRhXlC0PPf7PaxFx
         7Za6C5si4FjEcUxKbDhdiffKbzKzElMYFbUpVfZVoPslJkf+hPp8494vaN07KIJvMJgI
         JseP0dDdTgkJaBpAWt+RGhweDfnH/Ns+kv3FKpkQkSnS+w+pf2ahVWbfSxWfczX+woYb
         RfDxk6SeqtHttQduidTDwtfql4+7enRBtUnEI1x5QkyJKqHICtkantvo31mcrWv+DSdF
         KoSG+QEPejNAgHjN1g8Lrw00gOntGUW1OJdfYJEVG/0HvAfhO9I0/VyBeShrWfu91JD+
         F8rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752720951; x=1753325751;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PhATVIDmaHkKgbMM3CPBKkk7uMkTMB5sx60clzqqST0=;
        b=jkWBIijNVGVKZzItPuBCiN6fuSP4mOFpU51JL8UAgLdRLy/EFH5o2Krt/AXr/uTllM
         Ub7BogZZ6B9x3p4f/r8qS9r/hYF17T1CfVbx1sumBCqAZvXNNlHV1yRX99xtzdFvfD9V
         e4nqPTfdlCmd+xgq2GODg+nUtaDvVJfbd2p+X2S8PG03Xr58ht8osmjX4TLlSTNIBcyZ
         WJHTdMHApaL0BYYmlN1/jPUbIqGsLGn/ZZqiHDYrsdMa0S+b2ltzrg3FQpzPJ5wdJBP4
         xTzdhAFTVsYMLE1febMlCLnM7CwiWPxScrFC9H/i6hPni17cSTdoqlPJZnCGTB17DbU7
         FDnw==
X-Gm-Message-State: AOJu0YyMzaZnCzsQI9NoPA8T5x4z0Mx2Y7uEggXnBdmYzr5l1yz2n3GV
	vZkqAgFectxCENbH+jEhTH4P7kXhD7RrSjR8S/dsGNL2C5WvXV1E2HIjY8/Xc/7VAczEKzfO1GH
	tUd4f
X-Gm-Gg: ASbGncuqF1EvEO9wtCpUinHd8mr3TbHiUoKMUd/MfVzxPuTiR/I3vAXm6d47yeTWV5v
	y3sA+8I+jY6CyCDJdC7ynxKTNDlmGDn82URFDi6bQZd9Q2wS3Pxt+g0InqV87aoMsJfjCkAz9s/
	JGbNlnKTIDd4d3VXhU6OGAwM/WAka/YLQoKSMzoCnk1ZMv8Df6f9IUncFcQbgQAVH1t+Zqz3mEF
	KPARRF889AlGd/UECZVk8jir/kA6ueMcb5WfE4Iwn2xqVjNlflz/TzQ7jOoH5YEyKlAwcVkntwl
	YHj15PgZgHQ+Fko47yicMsEe+WT4GIyBvjfReyVT6mgtn7gwZL1+VOBwArIg7IqKDni2xpdfQzK
	tco5V//2HrzMuyo2SdUkUHeKd
X-Google-Smtp-Source: AGHT+IG0uWZYIaQ/S0RZ20jD5ZoqGDXFYOR4e1Q7tjuRSuSLlfvmpglKLaHTiq3FXXg3jqNybZ/YwA==
X-Received: by 2002:a17:90b:46:b0:312:1cd7:b337 with SMTP id 98e67ed59e1d1-31c9f3c3663mr6048414a91.5.1752720951141;
        Wed, 16 Jul 2025 19:55:51 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:3bfc:8fec:7e35:e96a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31c9f288173sm2333256a91.25.2025.07.16.19.55.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 19:55:50 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 06/13] libxml2: Fix CVE-2025-49794 & CVE-2025-49796
Date: Wed, 16 Jul 2025 19:55:29 -0700
Message-ID: <b0f34931f7ae35538d007add80e2f81c85fa950f.1752720827.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1752720827.git.steve@sakoman.com>
References: <cover.1752720827.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Jul 2025 02:56:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220492

From: Divya Chellam <divya.chellam@windriver.com>

A use-after-free vulnerability was found in libxml2. This issue
occurs when parsing XPath elements under certain circumstances
when the XML schematron has the <sch:name path="..."/> schema
elements. This flaw allows a malicious actor to craft a malicious
XML document used as input for libxml, resulting in the program's
crash using libxml or other possible undefined behaviors.

A vulnerability was found in libxml2. Processing certain sch:name
elements from the input XML file can trigger a memory corruption
issue. This flaw allows an attacker to craft a malicious XML input
file that can lead libxml to crash, resulting in a denial of service
or other possible undefined behavior due to sensitive data being
corrupted in memory.

References:
https://security-tracker.debian.org/tracker/CVE-2025-49794
https://security-tracker.debian.org/tracker/CVE-2025-49796

Upstream-patch:
https://gitlab.gnome.org/GNOME/libxml2/-/commit/71e1e8af5ee46dad1b57bb96cfbf1c3ad21fbd7b

Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../CVE-2025-49794_CVE-2025-49796.patch       | 189 ++++++++++++++++++
 meta/recipes-core/libxml/libxml2_2.13.8.bb    |   1 +
 2 files changed, 190 insertions(+)
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2025-49794_CVE-2025-49796.patch

diff --git a/meta/recipes-core/libxml/libxml2/CVE-2025-49794_CVE-2025-49796.patch b/meta/recipes-core/libxml/libxml2/CVE-2025-49794_CVE-2025-49796.patch
new file mode 100644
index 0000000000..77b04f7147
--- /dev/null
+++ b/meta/recipes-core/libxml/libxml2/CVE-2025-49794_CVE-2025-49796.patch
@@ -0,0 +1,189 @@
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
+---
+
+CVE: CVE-2025-49794 CVE-2025-49796
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libxml2/-/commit/71e1e8af5ee46dad1b57bb96cfbf1c3ad21fbd7b]
+
+Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
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
+index 1de25de..426300c 100644
+--- a/schematron.c
++++ b/schematron.c
+@@ -1414,27 +1414,15 @@ exit:
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
+@@ -1480,25 +1468,40 @@ xmlSchematronFormatReport(xmlSchematronValidCtxtPtr ctxt,
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
+2.40.0
+
diff --git a/meta/recipes-core/libxml/libxml2_2.13.8.bb b/meta/recipes-core/libxml/libxml2_2.13.8.bb
index ea7aa9c41d..3d6ecf5458 100644
--- a/meta/recipes-core/libxml/libxml2_2.13.8.bb
+++ b/meta/recipes-core/libxml/libxml2_2.13.8.bb
@@ -18,6 +18,7 @@ SRC_URI += "http://www.w3.org/XML/Test/xmlts20130923.tar;subdir=${BP};name=testt
            file://run-ptest \
            file://install-tests.patch \
            file://CVE-2025-6021.patch \
+           file://CVE-2025-49794_CVE-2025-49796.patch \
            "
 
 SRC_URI[archive.sha256sum] = "277294cb33119ab71b2bc81f2f445e9bc9435b893ad15bb2cd2b0e859a0ee84a"
-- 
2.43.0


