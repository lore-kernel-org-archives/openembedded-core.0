Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC17FC3DA6B
	for <webhook@archiver.kernel.org>; Mon, 29 Aug 2022 21:02:59 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com
 [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web11.3748.1661806965557683592
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Aug 2022 14:02:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=iNY9DSDR;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.50,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f50.google.com with SMTP id
 h13-20020a17090a648d00b001fdb9003787so4524758pjj.4
        for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Aug 2022 14:02:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc;
        bh=Ep+TEapeDFJ/YBbE28Sd207Br14sdESiRfYJTN6C7NM=;
        b=iNY9DSDRHFqv48ytS2XAVINAHhytZ8veR+JBr0JDPBA3/sYrUmws/ZUSHJ88PJsN2A
         J14AKJyLG38LOOdSdP8qBGYrGA5CXaH53sUcfgXHcgQM5DfH2WYzN8gF09axwvFXBFB+
         m9FfRf/bcwEyUmtQk5FNHOp8WPuTGZGkL31Cd/Rw5SkGj+yHLZjllUSDv8a1PiHNsucH
         pz5eG2dx2B5+15DEeZyU0/ml+ezXsYVXhZUB++S1thMTaXmFF6HCff94rjw2wO6VU761
         EmZiuebwSaDlgSKkTuHu0AhLlsil0oQUYNNMQIeb6h3VCmpy/Gptdqb22wtPyTyjCaXg
         yslw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
        bh=Ep+TEapeDFJ/YBbE28Sd207Br14sdESiRfYJTN6C7NM=;
        b=FWINl1I6DMdZInibqhVjOw5m3XPGnQgz/PAr8wDHrC5Xcff+67MpHHdSmHhUzmRzxc
         TeAD2YS9F+MRi+XiS1fmzlea9XYsNbGfD9GazqLtOUKeuIb8Ox1xOTPZtyEIcIjwf2uF
         WjcX21D0WxNPoIEsi1l3FC2LHNdBo3F+MV94VyO7FmUn6U/mOpPdmztv72jGPes2eEKM
         KFtQz1VZPShmrt7EwlNnFHG1xpF7lqh1Oeek4SugFza506J825G9ox9OBshWoYs2wq3t
         9zgaTWtJaG4yT8Xr/taPEnnQY7q2mP6nHfc2ghd1dlmM37L/61wecXHgy78CyvEk9NbI
         DRcA==
X-Gm-Message-State: ACgBeo0TpjFnBhvGZK3UTMHcEyc79JxfnJI0hVw4YSmhMIM6SH9A0JbR
	uTbw8XXayYVB4mYZ7aXUAJya1Vrzei+Tpr2R
X-Google-Smtp-Source: 
 AA6agR5ECELbEya0RVSsmas+mOImmpMJoFRHhdHyKij7flQ/A20tmVd2NOCVrmSdBj2KZ8Jscamuaw==
X-Received: by 2002:a17:903:24e:b0:172:6c9d:14e0 with SMTP id
 j14-20020a170903024e00b001726c9d14e0mr18029531plh.84.1661806978392;
        Mon, 29 Aug 2022 14:02:58 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 q15-20020a17090311cf00b0016eede528b4sm8058957plh.61.2022.08.29.14.02.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Aug 2022 14:02:57 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 06/14] libxml2: Add fix for CVE-2016-3709
Date: Mon, 29 Aug 2022 11:02:25 -1000
Message-Id: 
 <b9312041e4c8d565ad1e1102f8634bcc913adfa7.1661806803.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1661806803.git.steve@sakoman.com>
References: <cover.1661806803.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Aug 2022 21:02:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170031

From: Pawan Badganchi <badganchipv@gmail.com>

Add below patch to fix CVE-2016-3709

CVE-2016-3709.patch
Link: https://github.com/GNOME/libxml2/commit/c1ba6f54d32b707ca6d91cb3257ce9de82876b6f

Signed-off-by: Pawan Badganchi<pawan.badganchi@kpit.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.25.1


