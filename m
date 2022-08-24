Return-Path: <badganchipv@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EA92C00140
	for <webhook@archiver.kernel.org>; Wed, 24 Aug 2022 11:54:02 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
 [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web12.9962.1661342040116212624
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Aug 2022 04:54:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=a1DT8Ijd;
 spf=pass (domain: gmail.com, ip: 209.85.216.51,
 mailfrom: badganchipv@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id
 ds12-20020a17090b08cc00b001fae6343d9fso3498785pjb.0
        for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Aug 2022 04:54:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=+XbbBOyPJ7y/UNl5OrWa0eOJCYHFqIatV94Pnxw19BA=;
        b=a1DT8IjdcgqBF73GR7pdfaGd+oYa/lzyDCEmcPNiO3yFjNy9DA+QXewji6Sd1e1QD1
         MRNlz+SnqBHuj885Bo+rE5mBsiOqIgLKSJ/rXKGgcyxGTOOVbGIq8b/x50yzuQNTDEGh
         5PglO4H3iRjvHNQ/4xzvjxodbkciGRbHsNqf8jLC/Ak7qypBqa/OFZO4XRvUhGZ65Eyz
         uu8HXFw6qImTJuIiooGkeRBeW2llEqqc/Qi5wutYLt8MD/KP82BZ2cjdpaJ3sg/6QXo7
         P1Q4h0w0Wo+VR0pklJc0LyJzwIvjWY/iWXxooDTZ477P10J1/znSiuGBJhyW+6MOmOVD
         RSLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=+XbbBOyPJ7y/UNl5OrWa0eOJCYHFqIatV94Pnxw19BA=;
        b=NNXu9LkbcXd4nd49xVJhLEcM/7xrqcEB7UPIzKsaMOHkp7dadTajOsJdbLTLKEYpbu
         +vyScaNYGNmvq043cTcPabrCCOfjeSFiKTvzcuHDntern0VXem/ohskeBjcmkjkLlhzF
         ZIQj64pbYaaPSaQSp9q/LRolO9Ki7WlztWyTDrIuINbBVdTXj0tZhtbPDUU2hJIj2iBv
         dIGvneHKak0UW6IJCC7+vKAvQzeRrjvEKr3PnRSu4/0/qCyvb2ToXs35EbS0egRP+Xiu
         0VTXpjphDzjyNNT1QNNZbzSPDBtx6c36M2+x7ww0yuiLkTlQ2YefpS10Uj27ES0oRodM
         YVXg==
X-Gm-Message-State: ACgBeo2yAmeYvjbBCN0ZWqTsya5vmnSWSuV/uNNzK61W6XFMlNli/DVx
	NaQyCrDcqrnks3XpjJqRnXnpxXblprg=
X-Google-Smtp-Source: 
 AA6agR5/7Z4Maf/7euqHxqJQNvvCfDJoX39xwq0KqmGdCQpd5oZHmgJ8j0hLBTiIovp0mCaKb/X7WA==
X-Received: by 2002:a17:90a:4496:b0:1fa:bbb5:7000 with SMTP id
 t22-20020a17090a449600b001fabbb57000mr7984348pjg.218.1661342039459;
        Wed, 24 Aug 2022 04:53:59 -0700 (PDT)
Received: from localhost.localdomain
 ([2409:4042:50e:5bb4:acec:a918:820e:8aa3])
        by smtp.gmail.com with ESMTPSA id
 s4-20020a170902ea0400b00172c7a2c662sm9916000plg.48.2022.08.24.04.53.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Aug 2022 04:53:58 -0700 (PDT)
From: pawan <badganchipv@gmail.com>
To: openembedded-core@lists.openembedded.org,
	badganchipv@gmail.com
Cc: ranjitsinh.rathod@kpit.com
Subject: [meta][dunfell][PATCH] libxml2: Add fix for CVE-2016-3709
Date: Wed, 24 Aug 2022 17:23:40 +0530
Message-Id: <20220824115340.17653-1-badganchipv@gmail.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Aug 2022 11:54:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169808

From: Pawan Badganchi <badganchipv@gmail.com>

Add below patch to fix CVE-2016-3709

CVE-2016-3709.patch
Link: https://github.com/GNOME/libxml2/commit/c1ba6f54d32b707ca6d91cb3257ce9de82876b6f

Signed-off-by: Pawan Badganchi<badganchipv@gmail.com>
---
 .../libxml/libxml2/CVE-2016-3709.patch        | 89 +++++++++++++++++++
 meta/recipes-core/libxml/libxml2_2.9.10.bb    |  2 +-
 2 files changed, 90 insertions(+), 1 deletion(-)
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
index d1c1f0884f..adeef5bda2 100644
--- a/meta/recipes-core/libxml/libxml2_2.9.10.bb
+++ b/meta/recipes-core/libxml/libxml2_2.9.10.bb
@@ -32,7 +32,7 @@ SRC_URI += "http://www.w3.org/XML/Test/xmlts20080827.tar.gz;subdir=${BP};name=te
            file://CVE-2022-23308-fix-regression.patch \
            file://CVE-2022-29824-dependent.patch \
            file://CVE-2022-29824.patch \
-           file://0001-Port-gentest.py-to-Python-3.patch \
+           file://CVE-2016-3709.patch \
            "
 
 SRC_URI[archive.sha256sum] = "593b7b751dd18c2d6abcd0c4bcb29efc203d0b4373a6df98e3a455ea74ae2813"
-- 
2.37.1


