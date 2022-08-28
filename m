Return-Path: <badganchipv@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F477ECAAD2
	for <webhook@archiver.kernel.org>; Sun, 28 Aug 2022 09:31:58 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web08.57830.1661679109413285241
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Aug 2022 02:31:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=UOtnFlcN;
 spf=pass (domain: gmail.com, ip: 209.85.214.172,
 mailfrom: badganchipv@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id u22so5330357plq.12
        for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Aug 2022 02:31:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=ZBOHtkJv8MqSMvfMUSPmX/MqCgLhmvonotsWFIKSnN0=;
        b=UOtnFlcNknSy5y5C0uv6833VN5ozt+FUG5wtQXB7fJ2+THlGpXN0D06iC9O/qrcgUU
         kK36nxZnATGByIDA880jEVJiM2DqbVcIPtrXvnsoPGYX8w5F8X5eRGWaKDj6Xqx6cptf
         OPqwLjqGuO102j8+YEU5KVD8rwT1jvqu4/jekL/EmPcORrLV5q9jcoUX7W/q1wmfW7t+
         IO0np6UfGDKXXmI9O+sW7hT8HQOSKc2EnmmhwS5FvReHzYYimGLNXUVjY0/eYPOMDHbm
         R9OV/41Gu47xe+VKo0kptYXdZ1cxRY69nPWiB7QZrLu5P91Hb3mJ8z1ey/GUlnCj1Q5+
         u0uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=ZBOHtkJv8MqSMvfMUSPmX/MqCgLhmvonotsWFIKSnN0=;
        b=4pqvbU2cGnAwKuCfHfXgrl/1V0V5iRCd6iyzylVL/X15iNhexMuOiKOqMaOLnUul/z
         xHt7zk7d7cgFAIk0o/yXHzEgPe+I2i+U4ubtvd1OVGIZE1Z1vF0xAeEYQkHidmZ+jmof
         w1PWmQtT0lo84w4hvWs3un3+4MjnFDlqaWguwFLSfbEEmdejtDIyD959XXIN8JUELvEy
         gGKWv+UJrBY/kxGVIV8b2AYsGLyT+R734r1t3rXJR9MDbz58hwMIUyp20XSFmU1z7feO
         XMGEyteWwguY5rDVyJjc4vPsptkyJEGa05d7XPZCFucMOQozi5f+PAWCEQxof6HMtlko
         9IRA==
X-Gm-Message-State: ACgBeo1Ly6+L8vL2SJSMLYl3fnuIUcyaBnyNZHsJxC+Jmht1ANWschUY
	5XxGo/2uTp2fZj50yP1rFxdF82rufRY=
X-Google-Smtp-Source: 
 AA6agR55JjnbCyGzIFucEHiePEtXyHoGGG/qcvdrfllMghEo/A3OtwFIwOdvFwbbgB+mwUS01Rhdaw==
X-Received: by 2002:a17:902:cec7:b0:172:b20d:e666 with SMTP id
 d7-20020a170902cec700b00172b20de666mr11181544plg.154.1661679108576;
        Sun, 28 Aug 2022 02:31:48 -0700 (PDT)
Received: from localhost.localdomain
 ([2409:4042:e9b:4fdf:790b:f6d5:2baa:24a6])
        by smtp.gmail.com with ESMTPSA id
 u1-20020a17090341c100b0016b81679c1fsm5022174ple.216.2022.08.28.02.31.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Aug 2022 02:31:48 -0700 (PDT)
From: pawan <badganchipv@gmail.com>
To: openembedded-core@lists.openembedded.org,
	badganchipv@gmail.com
Cc: ranjitsinh.rathod@kpit.com,
	Pawan Badganchi <pawan.badganchi@kpit.com>
Subject: [meta][dunfell][PATCH] libxml2: Add fix for CVE-2016-3709
Date: Sun, 28 Aug 2022 15:01:25 +0530
Message-Id: <20220828093125.19186-1-badganchipv@gmail.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 28 Aug 2022 09:31:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169977

From: Pawan Badganchi <badganchipv@gmail.com>

Add below patch to fix CVE-2016-3709

CVE-2016-3709.patch
Link: https://github.com/GNOME/libxml2/commit/c1ba6f54d32b707ca6d91cb3257ce9de82876b6f

Signed-off-by: Pawan Badganchi<pawan.badganchi@kpit.com>
---
 .../libxml/libxml2/CVE-2016-3709.patch        | 89 +++++++++++++++++++
 meta/recipes-core/libxml/libxml2_2.9.10.bb    |  1 +
 2 files changed, 90 insertions(+)
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2016-3709.patch

diff --git a/meta/recipes-core/libxml/libxml2/CVE-2016-3709.patch b/meta/recipes-core/libxml/libxml2/CVE-2016-3709.patch
new file mode 100644
index 0000000000..5301d05323
--- /dev/null
+++ b/meta/recipes-core/libxml/libxml2/CVE-2016-3709.patch
@@ -0,0 +1,89 @@
+From c1ba6f54d32b707ca6d91cb3257ce9de82876b6f Mon Sep 17 00:00:00 2001
+From: Nick Wellnhofer <wellnhofer@aevum.de>
+Date: Sat, 15 Aug 2020 18:32:29 +0200
+Subject: [PATCH] Revert "Do not URI escape in server side includes"
+
+This reverts commit 960f0e275616cadc29671a218d7fb9b69eb35588.
+
+This commit introduced
+
+- an infinite loop, found by OSS-Fuzz, which could be easily fixed.
+- an algorithm with quadratic runtime
+- a security issue, see
+  https://bugzilla.gnome.org/show_bug.cgi?id=769760
+
+A better approach is to add an option not to escape URLs at all
+which libxml2 should have possibly done in the first place.
+
+CVE: CVE-2016-3709
+Upstream-Status: Backport [https://github.com/GNOME/libxml2/commit/c1ba6f54d32b707ca6d91cb3257ce9de82876b6f]
+Signed-off-by: Pawan Badganchi <Pawan.Badganchi@kpit.com>
+---
+ HTMLtree.c | 49 +++++++++++--------------------------------------
+ 1 file changed, 11 insertions(+), 38 deletions(-)
+
+diff --git a/HTMLtree.c b/HTMLtree.c
+index 8d236bb35..cdb7f86a6 100644
+--- a/HTMLtree.c
++++ b/HTMLtree.c
+@@ -706,49 +706,22 @@ htmlAttrDumpOutput(xmlOutputBufferPtr buf, xmlDocPtr doc, xmlAttrPtr cur,
+ 		 (!xmlStrcasecmp(cur->name, BAD_CAST "src")) ||
+ 		 ((!xmlStrcasecmp(cur->name, BAD_CAST "name")) &&
+ 		  (!xmlStrcasecmp(cur->parent->name, BAD_CAST "a"))))) {
++		xmlChar *escaped;
+ 		xmlChar *tmp = value;
+-		/* xmlURIEscapeStr() escapes '"' so it can be safely used. */
+-		xmlBufCCat(buf->buffer, "\"");
+
+ 		while (IS_BLANK_CH(*tmp)) tmp++;
+
+-		/* URI Escape everything, except server side includes. */
+-		for ( ; ; ) {
+-		    xmlChar *escaped;
+-		    xmlChar endChar;
+-		    xmlChar *end = NULL;
+-		    xmlChar *start = (xmlChar *)xmlStrstr(tmp, BAD_CAST "<!--");
+-		    if (start != NULL) {
+-			end = (xmlChar *)xmlStrstr(tmp, BAD_CAST "-->");
+-			if (end != NULL) {
+-			    *start = '\0';
+-			}
+-		    }
+-
+-		    /* Escape the whole string, or until start (set to '\0'). */
+-		    escaped = xmlURIEscapeStr(tmp, BAD_CAST"@/:=?;#%&,+");
+-		    if (escaped != NULL) {
+-		        xmlBufCat(buf->buffer, escaped);
+-		        xmlFree(escaped);
+-		    } else {
+-		        xmlBufCat(buf->buffer, tmp);
+-		    }
+-
+-		    if (end == NULL) { /* Everything has been written. */
+-			break;
+-		    }
+-
+-		    /* Do not escape anything within server side includes. */
+-		    *start = '<'; /* Restore the first character of "<!--". */
+-		    end += 3; /* strlen("-->") */
+-		    endChar = *end;
+-		    *end = '\0';
+-		    xmlBufCat(buf->buffer, start);
+-		    *end = endChar;
+-		    tmp = end;
++		/*
++		 * the < and > have already been escaped at the entity level
++		 * And doing so here breaks server side includes
++		 */
++		escaped = xmlURIEscapeStr(tmp, BAD_CAST"@/:=?;#%&,+<>");
++		if (escaped != NULL) {
++		    xmlBufWriteQuotedString(buf->buffer, escaped);
++		    xmlFree(escaped);
++		} else {
++		    xmlBufWriteQuotedString(buf->buffer, value);
+ 		}
+-
+-		xmlBufCCat(buf->buffer, "\"");
+ 	    } else {
+ 		xmlBufWriteQuotedString(buf->buffer, value);
+ 	    }
diff --git a/meta/recipes-core/libxml/libxml2_2.9.10.bb b/meta/recipes-core/libxml/libxml2_2.9.10.bb
index d1c1f0884f..dc62991739 100644
--- a/meta/recipes-core/libxml/libxml2_2.9.10.bb
+++ b/meta/recipes-core/libxml/libxml2_2.9.10.bb
@@ -33,6 +33,7 @@ SRC_URI += "http://www.w3.org/XML/Test/xmlts20080827.tar.gz;subdir=${BP};name=te
            file://CVE-2022-29824-dependent.patch \
            file://CVE-2022-29824.patch \
            file://0001-Port-gentest.py-to-Python-3.patch \
+           file://CVE-2016-3709.patch \
            "
 
 SRC_URI[archive.sha256sum] = "593b7b751dd18c2d6abcd0c4bcb29efc203d0b4373a6df98e3a455ea74ae2813"
-- 
2.37.2


