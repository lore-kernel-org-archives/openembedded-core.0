Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E204C83F36
	for <webhook@archiver.kernel.org>; Tue, 15 Jul 2025 20:36:40 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web10.5491.1752611789334688970
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Jul 2025 13:36:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=RAuySb9m;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.172, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-236377f00a1so56047875ad.3
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Jul 2025 13:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1752611788; x=1753216588; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+aQ8Zzj121j91KpDyQAhFD2Tpjyr/R7yL+9KssQa+gA=;
        b=RAuySb9m0AzxnwjJuWnN8fIo52vkbQ6FXDq/MPs0uFLEhnodvlGYGHutWFW2ektg5p
         jyv3m6uDSntP1B/tNVS1f23P/1kny4aCwjMyhuiEXR5ijX9v33mOYi+9GnjHsLoEEmFJ
         IKyj6GxWnFvoXpWHUCPguvUY5Arunb4a+sJ0fKb9tzmAsKX633gQG6HntVQYWdrMSCwK
         42+zf0BwcG0cnP81q/2uUuA5d2uCP6kRX85fYZ602gmF0OxnrkvJULk9QNullqcB5LLl
         b8sR1vgiUrNLmRmtPxXBPYT7NjuniqGBIm4DxVUq3ftJfVDxFjc5nBMs4iERzr2Rrv7j
         eqPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752611788; x=1753216588;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+aQ8Zzj121j91KpDyQAhFD2Tpjyr/R7yL+9KssQa+gA=;
        b=UUVU76EAekpBoXfjE2ic0osGTwqUU5Zkrw2SUNPuOWZQAekx7JwQHW8gB4a2CLXeAk
         BaPDiiYRcu5RWJ42sdHqiqrvsKWLgDRMIKrrfntWGxhmfT4EY/7gCoC3i60d2YKdSNDs
         sLCrmIOrKIZRvpI5OY8zUN3p/WOrMrVvpF2IodaePwZVFDHBWpdwvoLxwquCXwbhD2n4
         TTQgsC6ZfXFMawERp+zyD59hK5JJE8YJgouxTme4Z+xiCHC5u925nJOC4+n9nGpF2Q3W
         XnuuK0qtpsRK6nq4Fz7WSHHHyqbAFEfRxDjSWyEd6hl87n6WEP+U/yjqS02UolUYPdm9
         QibA==
X-Gm-Message-State: AOJu0Ywfk4V4sCuvtF/Oba6CVIFurZbtQMe2bvti9YfHzHWXpA43WT3k
	S00v/ejTQpqxxTBBrUYyc59s3oto1y6xRogKi7mmtkylQf40Y5bgIydEziyjDyhUkA5kCzLMA7i
	58yt6
X-Gm-Gg: ASbGncva55aJHXgBsJtuQXVtXfxPdJIy4g+ppWJzxg4bCd/inQU3E6B9qbu20ELVgwL
	A3YRHwPLyOU1hikofmO5MiKbbBqVofDydjZiiH0/+0ZpC9qJ4d80aihJmGpa1hEP5FHBa/Hr1XV
	lh870n6AAdTNRgZ+Dhbg4TGIbZpqx4zq6KXp4xSKIem/uuMB71W0cvOTb/odWwGjQbLyVX9FTQy
	z7OdjzTu/QVlebkTelDw+CJtH7/C3XMD7W1DNGB4L/iPwhRu80UIEUFYIE9P5I6xJFYDdkHcfnc
	WfvUAHyZLMctUNKtJzB1UtUQR5NTQeUB/3TMT41NYYRZE5Fu2XYWVLOf07TGkvgjXUB6Mv237zr
	S7Yg6fE33Ec+llg==
X-Google-Smtp-Source: AGHT+IEdQnBfJxlj9SFNWZM2Y8/0/MYzR4BEqodVnHq9YZKi/+tVKxIc8e/4W7dpfGo0sODoXLnYaA==
X-Received: by 2002:a17:903:2b0f:b0:234:f580:9f5 with SMTP id d9443c01a7336-23e24ec73cfmr4557245ad.9.1752611788462;
        Tue, 15 Jul 2025 13:36:28 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:5c42:3781:50b6:b9d7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de43637f2sm115585595ad.241.2025.07.15.13.36.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 13:36:28 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 03/16] libxml2: fix CVE-2025-49794 & CVE-2025-49796
Date: Tue, 15 Jul 2025 13:36:04 -0700
Message-ID: <691b74a5d019752428adc81b114fb4458ece1ebe.1752611671.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1752611671.git.steve@sakoman.com>
References: <cover.1752611671.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Jul 2025 20:36:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220412

From: Hitendra Prajapati <hprajapati@mvista.com>

Upstream-Status: Backport from https://gitlab.gnome.org/GNOME/libxml2/-/commit/71e1e8af5ee46dad1b57bb96cfbf1c3ad21fbd7b

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.43.0


