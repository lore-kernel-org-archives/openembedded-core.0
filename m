Return-Path: <bindudaniel1996@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DA35C433FE
	for <webhook@archiver.kernel.org>; Thu, 17 Nov 2022 10:46:43 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web10.12606.1668681993390348904
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Nov 2022 02:46:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=SULJbW7s;
 spf=pass (domain: gmail.com, ip: 209.85.215.173, mailfrom: bindudaniel1996@gmail.com)
Received: by mail-pg1-f173.google.com with SMTP id 62so1583532pgb.13
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Nov 2022 02:46:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6aa0yX2z2m6xnaRcqIvSbMQvtMYWec/24MdhCzDbFBA=;
        b=SULJbW7sftdtMXNXqpoNRdmfmCMlsXDP9jaWQrusN31zgCWpV13h4hkIY696EmD+xk
         lGucUD1gEi/0JRplVs4pDnydfK+1E3KVTjWHFwhuaFoK4AfmT7ZiRjjcvVpUPmHbBniS
         ztJgMHtUsUy2fLglIXpGOan+9Xp2qquW7lL3fBqs4kHq2E/zPUTTaLanWbwTxCHHpX3N
         6wRDStsX5vlBwOTKroIQakE8pjn+s+R8lyBQLnvW6H5npnGNCICJDaZ2SWJpmkLvNQYw
         7W9Ri2dPHVVzGSXxuCWRgMsV3lRIu/cXGewDe2pwpzLiv8NIlUlO0EtKzTBXVF8ou5lS
         RRrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6aa0yX2z2m6xnaRcqIvSbMQvtMYWec/24MdhCzDbFBA=;
        b=myXrJ18FP1QSRadpSwwF9YwAaGFknmTnVRB7p6U06xV1Jx5jJXCTjg+WAAUB6o6MRM
         zT9tKEIt8L+KgfTMgAQJjtPe1k5YKg3ITgLJlfWbL8Sxeg53Dc4n/88E8wKLPhKBjGkd
         wFnJ80OiktePnM38nHdGvfYO8oM1wQNAcU1NN5u7qTJKlrz0zEpqplSVGmk3Lqyyj70Z
         TZn2AoKWVOe9M2/wW54jGXAhOJAuO+WXngY12McU2Jc/MJFpjkTSQiKDAXGdbo/sUtnm
         DhpjQ77OCkHnDqHYUig0i7DQHm/gzbkriHZvYAvq2R4leLr2WElHEDlSJzUVhFOkjBww
         zaOw==
X-Gm-Message-State: ANoB5pn8ZIm2ybTIl1CBdt3P8fRdnxH0KmeOhCOVV+DXaYJhBLg+ljt7
	9C8N/r32kK1oeqYfzEzOW9fHvKKGS+4WZA==
X-Google-Smtp-Source: AA0mqf595F7l4Bw3lZcOiTe4rjmiBU+4HLbf0I9QwYC12V4TAchSHc/6j42vMzRPVclgKTcSLVSF1g==
X-Received: by 2002:a63:4703:0:b0:470:27c:54b8 with SMTP id u3-20020a634703000000b00470027c54b8mr1481631pga.578.1668681991918;
        Thu, 17 Nov 2022 02:46:31 -0800 (PST)
Received: from localhost.localdomain ([2401:4900:1f26:549b:ad0b:ffb0:ec99:c7ad])
        by smtp.gmail.com with ESMTPSA id y185-20020a6232c2000000b0056ddd2b5e9bsm800032pfy.41.2022.11.17.02.46.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Nov 2022 02:46:31 -0800 (PST)
From: Bhabu Bindu <bindudaniel1996@gmail.com>
To: openembedded-core@lists.openembedded.org,
	bindudaniel1996@gmail.com
Cc: ranjitsinh.rathod@kpit.com,
	Bhabu Bindu <bhabu.bindu@kpit.com>
Subject: [OE-core][dunfell][PATCH 1/2] libxml2: Fix CVE-2022-40303
Date: Thu, 17 Nov 2022 16:15:52 +0530
Message-Id: <20221117104553.10288-1-bindudaniel1996@gmail.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Nov 2022 10:46:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173413

From: Bhabu Bindu <bhabu.bindu@kpit.com>

Fix integer overflows with XML_PARSE_HUGE

Link: https://gitlab.gnome.org/GNOME/libxml2/-/commit/c846986356fc149915a74972bf198abc266bc2c0

Upstream-Status: Pending

Signed-off-by: Bhabu Bindu <bhabu.bindu@kpit.com>
---
 .../libxml/libxml2/CVE-2022-40303.patch       | 623 ++++++++++++++++++
 meta/recipes-core/libxml/libxml2_2.9.10.bb    |   1 +
 2 files changed, 624 insertions(+)
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2022-40303.patch

diff --git a/meta/recipes-core/libxml/libxml2/CVE-2022-40303.patch b/meta/recipes-core/libxml/libxml2/CVE-2022-40303.patch
new file mode 100644
index 0000000000..bdb9e9eb7a
--- /dev/null
+++ b/meta/recipes-core/libxml/libxml2/CVE-2022-40303.patch
@@ -0,0 +1,623 @@
+From c846986356fc149915a74972bf198abc266bc2c0 Mon Sep 17 00:00:00 2001
+From: Nick Wellnhofer <wellnhofer@aevum.de>
+Date: Thu, 25 Aug 2022 17:43:08 +0200
+Subject: [PATCH] [CVE-2022-40303] Fix integer overflows with XML_PARSE_HUGE
+
+Also impose size limits when XML_PARSE_HUGE is set. Limit size of names
+to XML_MAX_TEXT_LENGTH (10 million bytes) and other content to
+XML_MAX_HUGE_LENGTH (1 billion bytes).
+
+Move some the length checks to the end of the respective loop to make
+them strict.
+
+xmlParseEntityValue didn't have a length limitation at all. But without
+XML_PARSE_HUGE, this should eventually trigger an error in xmlGROW.
+
+Thanks to Maddie Stone working with Google Project Zero for the report!
+
+CVE: CVE-2022-40303
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libxml2/-/commit/c846986356fc149915a74972bf198abc266bc2c0]
+Comments: Refreshed hunk
+
+Signed-off-by: Bhabu Bindu <bhabu.bindu@kpit.com>
+---
+ parser.c | 233 +++++++++++++++++++++++++++++--------------------------
+ 1 file changed, 121 insertions(+), 112 deletions(-)
+
+diff --git a/parser.c b/parser.c
+index 93f031be..79479979 100644
+--- a/parser.c
++++ b/parser.c
+@@ -102,6 +102,8 @@ xmlParseElementEnd(xmlParserCtxtPtr ctxt);
+  *									*
+  ************************************************************************/
+ 
++#define XML_MAX_HUGE_LENGTH 1000000000
++
+ #define XML_PARSER_BIG_ENTITY 1000
+ #define XML_PARSER_LOT_ENTITY 5000
+ 
+@@ -552,7 +554,7 @@ xmlFatalErr(xmlParserCtxtPtr ctxt, xmlParserErrors error, const char *info)
+             errmsg = "Malformed declaration expecting version";
+             break;
+         case XML_ERR_NAME_TOO_LONG:
+-            errmsg = "Name too long use XML_PARSE_HUGE option";
++            errmsg = "Name too long";
+             break;
+ #if 0
+         case:
+@@ -3202,6 +3204,9 @@ xmlParseNameComplex(xmlParserCtxtPtr ctxt) {
+     int len = 0, l;
+     int c;
+     int count = 0;
++    int maxLength = (ctxt->options & XML_PARSE_HUGE) ?
++                    XML_MAX_TEXT_LENGTH :
++                    XML_MAX_NAME_LENGTH;
+ 
+ #ifdef DEBUG
+     nbParseNameComplex++;
+@@ -3267,7 +3272,8 @@ xmlParseNameComplex(xmlParserCtxtPtr ctxt) {
+                 if (ctxt->instate == XML_PARSER_EOF)
+                     return(NULL);
+ 	    }
+-	    len += l;
++            if (len <= INT_MAX - l)
++	        len += l;
+ 	    NEXTL(l);
+ 	    c = CUR_CHAR(l);
+ 	}
+@@ -3293,13 +3299,13 @@ xmlParseNameComplex(xmlParserCtxtPtr ctxt) {
+                 if (ctxt->instate == XML_PARSER_EOF)
+                     return(NULL);
+ 	    }
+-	    len += l;
++            if (len <= INT_MAX - l)
++	        len += l;
+ 	    NEXTL(l);
+ 	    c = CUR_CHAR(l);
+ 	}
+     }
+-    if ((len > XML_MAX_NAME_LENGTH) &&
+-        ((ctxt->options & XML_PARSE_HUGE) == 0)) {
++    if (len > maxLength) {
+         xmlFatalErr(ctxt, XML_ERR_NAME_TOO_LONG, "Name");
+         return(NULL);
+     }
+@@ -3338,7 +3344,10 @@ const xmlChar *
+ xmlParseName(xmlParserCtxtPtr ctxt) {
+     const xmlChar *in;
+     const xmlChar *ret;
+-    int count = 0;
++    size_t count = 0;
++    size_t maxLength = (ctxt->options & XML_PARSE_HUGE) ?
++                       XML_MAX_TEXT_LENGTH :
++                       XML_MAX_NAME_LENGTH;
+ 
+     GROW;
+ 
+@@ -3362,8 +3371,7 @@ xmlParseName(xmlParserCtxtPtr ctxt) {
+ 	    in++;
+ 	if ((*in > 0) && (*in < 0x80)) {
+ 	    count = in - ctxt->input->cur;
+-            if ((count > XML_MAX_NAME_LENGTH) &&
+-                ((ctxt->options & XML_PARSE_HUGE) == 0)) {
++            if (count > maxLength) {
+                 xmlFatalErr(ctxt, XML_ERR_NAME_TOO_LONG, "Name");
+                 return(NULL);
+             }
+@@ -3384,6 +3392,9 @@ xmlParseNCNameComplex(xmlParserCtxtPtr ctxt) {
+     int len = 0, l;
+     int c;
+     int count = 0;
++    int maxLength = (ctxt->options & XML_PARSE_HUGE) ?
++                    XML_MAX_TEXT_LENGTH :
++                    XML_MAX_NAME_LENGTH;
+     size_t startPosition = 0;
+ 
+ #ifdef DEBUG
+@@ -3404,17 +3415,13 @@ xmlParseNCNameComplex(xmlParserCtxtPtr ctxt) {
+     while ((c != ' ') && (c != '>') && (c != '/') && /* test bigname.xml */
+ 	   (xmlIsNameChar(ctxt, c) && (c != ':'))) {
+ 	if (count++ > XML_PARSER_CHUNK_SIZE) {
+-            if ((len > XML_MAX_NAME_LENGTH) &&
+-                ((ctxt->options & XML_PARSE_HUGE) == 0)) {
+-                xmlFatalErr(ctxt, XML_ERR_NAME_TOO_LONG, "NCName");
+-                return(NULL);
+-            }
+ 	    count = 0;
+ 	    GROW;
+             if (ctxt->instate == XML_PARSER_EOF)
+                 return(NULL);
+ 	}
+-	len += l;
++        if (len <= INT_MAX - l)
++	    len += l;
+ 	NEXTL(l);
+ 	c = CUR_CHAR(l);
+ 	if (c == 0) {
+@@ -3432,8 +3439,7 @@ xmlParseNCNameComplex(xmlParserCtxtPtr ctxt) {
+ 	    c = CUR_CHAR(l);
+ 	}
+     }
+-    if ((len > XML_MAX_NAME_LENGTH) &&
+-        ((ctxt->options & XML_PARSE_HUGE) == 0)) {
++    if (len > maxLength) {
+         xmlFatalErr(ctxt, XML_ERR_NAME_TOO_LONG, "NCName");
+         return(NULL);
+     }
+@@ -3459,7 +3465,10 @@ static const xmlChar *
+ xmlParseNCName(xmlParserCtxtPtr ctxt) {
+     const xmlChar *in, *e;
+     const xmlChar *ret;
+-    int count = 0;
++    size_t count = 0;
++    size_t maxLength = (ctxt->options & XML_PARSE_HUGE) ?
++                       XML_MAX_TEXT_LENGTH :
++                       XML_MAX_NAME_LENGTH;
+ 
+ #ifdef DEBUG
+     nbParseNCName++;
+@@ -3484,8 +3493,7 @@ xmlParseNCName(xmlParserCtxtPtr ctxt) {
+ 	    goto complex;
+ 	if ((*in > 0) && (*in < 0x80)) {
+ 	    count = in - ctxt->input->cur;
+-            if ((count > XML_MAX_NAME_LENGTH) &&
+-                ((ctxt->options & XML_PARSE_HUGE) == 0)) {
++            if (count > maxLength) {
+                 xmlFatalErr(ctxt, XML_ERR_NAME_TOO_LONG, "NCName");
+                 return(NULL);
+             }
+@@ -3567,6 +3575,9 @@ xmlParseStringName(xmlParserCtxtPtr ctxt, const xmlChar** str) {
+     const xmlChar *cur = *str;
+     int len = 0, l;
+     int c;
++    int maxLength = (ctxt->options & XML_PARSE_HUGE) ?
++                    XML_MAX_TEXT_LENGTH :
++                    XML_MAX_NAME_LENGTH;
+ 
+ #ifdef DEBUG
+     nbParseStringName++;
+@@ -3602,12 +3613,6 @@ xmlParseStringName(xmlParserCtxtPtr ctxt, const xmlChar** str) {
+ 		if (len + 10 > max) {
+ 		    xmlChar *tmp;
+ 
+-                    if ((len > XML_MAX_NAME_LENGTH) &&
+-                        ((ctxt->options & XML_PARSE_HUGE) == 0)) {
+-                        xmlFatalErr(ctxt, XML_ERR_NAME_TOO_LONG, "NCName");
+-			xmlFree(buffer);
+-                        return(NULL);
+-                    }
+ 		    max *= 2;
+ 		    tmp = (xmlChar *) xmlRealloc(buffer,
+ 			                            max * sizeof(xmlChar));
+@@ -3621,14 +3626,18 @@ xmlParseStringName(xmlParserCtxtPtr ctxt, const xmlChar** str) {
+ 		COPY_BUF(l,buffer,len,c);
+ 		cur += l;
+ 		c = CUR_SCHAR(cur, l);
++                if (len > maxLength) {
++                    xmlFatalErr(ctxt, XML_ERR_NAME_TOO_LONG, "NCName");
++                    xmlFree(buffer);
++                    return(NULL);
++                }
+ 	    }
+ 	    buffer[len] = 0;
+ 	    *str = cur;
+ 	    return(buffer);
+ 	}
+     }
+-    if ((len > XML_MAX_NAME_LENGTH) &&
+-        ((ctxt->options & XML_PARSE_HUGE) == 0)) {
++    if (len > maxLength) {
+         xmlFatalErr(ctxt, XML_ERR_NAME_TOO_LONG, "NCName");
+         return(NULL);
+     }
+@@ -3655,6 +3664,9 @@ xmlParseNmtoken(xmlParserCtxtPtr ctxt) {
+     int len = 0, l;
+     int c;
+     int count = 0;
++    int maxLength = (ctxt->options & XML_PARSE_HUGE) ?
++                    XML_MAX_TEXT_LENGTH :
++                    XML_MAX_NAME_LENGTH;
+ 
+ #ifdef DEBUG
+     nbParseNmToken++;
+@@ -3706,12 +3718,6 @@ xmlParseNmtoken(xmlParserCtxtPtr ctxt) {
+ 		if (len + 10 > max) {
+ 		    xmlChar *tmp;
+ 
+-                    if ((max > XML_MAX_NAME_LENGTH) &&
+-                        ((ctxt->options & XML_PARSE_HUGE) == 0)) {
+-                        xmlFatalErr(ctxt, XML_ERR_NAME_TOO_LONG, "NmToken");
+-                        xmlFree(buffer);
+-                        return(NULL);
+-                    }
+ 		    max *= 2;
+ 		    tmp = (xmlChar *) xmlRealloc(buffer,
+ 			                            max * sizeof(xmlChar));
+@@ -3725,6 +3731,11 @@ xmlParseNmtoken(xmlParserCtxtPtr ctxt) {
+ 		COPY_BUF(l,buffer,len,c);
+ 		NEXTL(l);
+ 		c = CUR_CHAR(l);
++                if (len > maxLength) {
++                    xmlFatalErr(ctxt, XML_ERR_NAME_TOO_LONG, "NmToken");
++                    xmlFree(buffer);
++                    return(NULL);
++                }
+ 	    }
+ 	    buffer[len] = 0;
+ 	    return(buffer);
+@@ -3732,8 +3743,7 @@ xmlParseNmtoken(xmlParserCtxtPtr ctxt) {
+     }
+     if (len == 0)
+         return(NULL);
+-    if ((len > XML_MAX_NAME_LENGTH) &&
+-        ((ctxt->options & XML_PARSE_HUGE) == 0)) {
++    if (len > maxLength) {
+         xmlFatalErr(ctxt, XML_ERR_NAME_TOO_LONG, "NmToken");
+         return(NULL);
+     }
+@@ -3759,6 +3769,9 @@ xmlParseEntityValue(xmlParserCtxtPtr ctxt, xmlChar **orig) {
+     int len = 0;
+     int size = XML_PARSER_BUFFER_SIZE;
+     int c, l;
++    int maxLength = (ctxt->options & XML_PARSE_HUGE) ?
++                    XML_MAX_HUGE_LENGTH :
++                    XML_MAX_TEXT_LENGTH;
+     xmlChar stop;
+     xmlChar *ret = NULL;
+     const xmlChar *cur = NULL;
+@@ -3818,6 +3831,12 @@ xmlParseEntityValue(xmlParserCtxtPtr ctxt, xmlChar **orig) {
+ 	    GROW;
+ 	    c = CUR_CHAR(l);
+ 	}
++
++        if (len > maxLength) {
++            xmlFatalErrMsg(ctxt, XML_ERR_ENTITY_NOT_FINISHED,
++                           "entity value too long\n");
++            goto error;
++        }
+     }
+     buf[len] = 0;
+     if (ctxt->instate == XML_PARSER_EOF)
+@@ -3905,6 +3924,9 @@ xmlParseAttValueComplex(xmlParserCtxtPtr ctxt, int *attlen, int normalize) {
+     xmlChar *rep = NULL;
+     size_t len = 0;
+     size_t buf_size = 0;
++    size_t maxLength = (ctxt->options & XML_PARSE_HUGE) ?
++                       XML_MAX_HUGE_LENGTH :
++                       XML_MAX_TEXT_LENGTH;
+     int c, l, in_space = 0;
+     xmlChar *current = NULL;
+     xmlEntityPtr ent;
+@@ -3925,16 +3925,6 @@
+     while (((NXT(0) != limit) && /* checked */
+             (IS_CHAR(c)) && (c != '<')) &&
+             (ctxt->instate != XML_PARSER_EOF)) {
+-        /*
+-         * Impose a reasonable limit on attribute size, unless XML_PARSE_HUGE
+-         * special option is given
+-         */
+-        if ((len > XML_MAX_TEXT_LENGTH) &&
+-            ((ctxt->options & XML_PARSE_HUGE) == 0)) {
+-            xmlFatalErrMsg(ctxt, XML_ERR_ATTRIBUTE_NOT_FINISHED,
+-                           "AttValue length too long\n");
+-            goto mem_error;
+-        }
+ 	if (c == 0) break;
+ 	if (c == '&') {
+ 	    in_space = 0;
+@@ -4093,6 +4105,11 @@ xmlParseAttValueComplex(xmlParserCtxtPtr ctxt, int *attlen, int normalize) {
+ 	}
+ 	GROW;
+ 	c = CUR_CHAR(l);
++        if (len > maxLength) {
++            xmlFatalErrMsg(ctxt, XML_ERR_ATTRIBUTE_NOT_FINISHED,
++                           "AttValue length too long\n");
++            goto mem_error;
++        }
+     }
+     if (ctxt->instate == XML_PARSER_EOF)
+         goto error;
+@@ -4114,16 +4131,6 @@ xmlParseAttValueComplex(xmlParserCtxtPtr ctxt, int *attlen, int normalize) {
+     } else
+ 	NEXT;
+ 
+-    /*
+-     * There we potentially risk an overflow, don't allow attribute value of
+-     * length more than INT_MAX it is a very reasonable assumption !
+-     */
+-    if (len >= INT_MAX) {
+-        xmlFatalErrMsg(ctxt, XML_ERR_ATTRIBUTE_NOT_FINISHED,
+-                       "AttValue length too long\n");
+-        goto mem_error;
+-    }
+-
+     if (attlen != NULL) *attlen = (int) len;
+     return(buf);
+ 
+@@ -4194,6 +4201,9 @@ xmlParseSystemLiteral(xmlParserCtxtPtr ctxt) {
+     int len = 0;
+     int size = XML_PARSER_BUFFER_SIZE;
+     int cur, l;
++    int maxLength = (ctxt->options & XML_PARSE_HUGE) ?
++                    XML_MAX_TEXT_LENGTH :
++                    XML_MAX_NAME_LENGTH;
+     xmlChar stop;
+     int state = ctxt->instate;
+     int count = 0;
+@@ -4221,13 +4231,6 @@ xmlParseSystemLiteral(xmlParserCtxtPtr ctxt) {
+ 	if (len + 5 >= size) {
+ 	    xmlChar *tmp;
+ 
+-            if ((size > XML_MAX_NAME_LENGTH) &&
+-                ((ctxt->options & XML_PARSE_HUGE) == 0)) {
+-                xmlFatalErr(ctxt, XML_ERR_NAME_TOO_LONG, "SystemLiteral");
+-                xmlFree(buf);
+-		ctxt->instate = (xmlParserInputState) state;
+-                return(NULL);
+-            }
+ 	    size *= 2;
+ 	    tmp = (xmlChar *) xmlRealloc(buf, size * sizeof(xmlChar));
+ 	    if (tmp == NULL) {
+@@ -4256,6 +4259,12 @@ xmlParseSystemLiteral(xmlParserCtxtPtr ctxt) {
+ 	    SHRINK;
+ 	    cur = CUR_CHAR(l);
+ 	}
++        if (len > maxLength) {
++            xmlFatalErr(ctxt, XML_ERR_NAME_TOO_LONG, "SystemLiteral");
++            xmlFree(buf);
++            ctxt->instate = (xmlParserInputState) state;
++            return(NULL);
++        }
+     }
+     buf[len] = 0;
+     ctxt->instate = (xmlParserInputState) state;
+@@ -4283,6 +4292,9 @@ xmlParsePubidLiteral(xmlParserCtxtPtr ctxt) {
+     xmlChar *buf = NULL;
+     int len = 0;
+     int size = XML_PARSER_BUFFER_SIZE;
++    int maxLength = (ctxt->options & XML_PARSE_HUGE) ?
++                    XML_MAX_TEXT_LENGTH :
++                    XML_MAX_NAME_LENGTH;
+     xmlChar cur;
+     xmlChar stop;
+     int count = 0;
+@@ -4310,12 +4322,6 @@ xmlParsePubidLiteral(xmlParserCtxtPtr ctxt) {
+ 	if (len + 1 >= size) {
+ 	    xmlChar *tmp;
+ 
+-            if ((size > XML_MAX_NAME_LENGTH) &&
+-                ((ctxt->options & XML_PARSE_HUGE) == 0)) {
+-                xmlFatalErr(ctxt, XML_ERR_NAME_TOO_LONG, "Public ID");
+-                xmlFree(buf);
+-                return(NULL);
+-            }
+ 	    size *= 2;
+ 	    tmp = (xmlChar *) xmlRealloc(buf, size * sizeof(xmlChar));
+ 	    if (tmp == NULL) {
+@@ -4343,6 +4349,11 @@ xmlParsePubidLiteral(xmlParserCtxtPtr ctxt) {
+ 	    SHRINK;
+ 	    cur = CUR;
+ 	}
++        if (len > maxLength) {
++            xmlFatalErr(ctxt, XML_ERR_NAME_TOO_LONG, "Public ID");
++            xmlFree(buf);
++            return(NULL);
++        }
+     }
+     buf[len] = 0;
+     if (cur != stop) {
+@@ -4742,6 +4753,9 @@ xmlParseCommentComplex(xmlParserCtxtPtr ctxt, xmlChar *buf,
+     int r, rl;
+     int cur, l;
+     size_t count = 0;
++    size_t maxLength = (ctxt->options & XML_PARSE_HUGE) ?
++                       XML_MAX_HUGE_LENGTH :
++                       XML_MAX_TEXT_LENGTH;
+     int inputid;
+ 
+     inputid = ctxt->input->id;
+@@ -4787,13 +4801,6 @@ xmlParseCommentComplex(xmlParserCtxtPtr ctxt, xmlChar *buf,
+ 	if ((r == '-') && (q == '-')) {
+ 	    xmlFatalErr(ctxt, XML_ERR_HYPHEN_IN_COMMENT, NULL);
+ 	}
+-        if ((len > XML_MAX_TEXT_LENGTH) &&
+-            ((ctxt->options & XML_PARSE_HUGE) == 0)) {
+-            xmlFatalErrMsgStr(ctxt, XML_ERR_COMMENT_NOT_FINISHED,
+-                         "Comment too big found", NULL);
+-            xmlFree (buf);
+-            return;
+-        }
+ 	if (len + 5 >= size) {
+ 	    xmlChar *new_buf;
+             size_t new_size;
+@@ -4831,6 +4838,13 @@ xmlParseCommentComplex(xmlParserCtxtPtr ctxt, xmlChar *buf,
+ 	    GROW;
+ 	    cur = CUR_CHAR(l);
+ 	}
++
++        if (len > maxLength) {
++            xmlFatalErrMsgStr(ctxt, XML_ERR_COMMENT_NOT_FINISHED,
++                         "Comment too big found", NULL);
++            xmlFree (buf);
++            return;
++        }
+     }
+     buf[len] = 0;
+     if (cur == 0) {
+@@ -4875,6 +4889,9 @@ xmlParseComment(xmlParserCtxtPtr ctxt) {
+     xmlChar *buf = NULL;
+     size_t size = XML_PARSER_BUFFER_SIZE;
+     size_t len = 0;
++    size_t maxLength = (ctxt->options & XML_PARSE_HUGE) ?
++                       XML_MAX_HUGE_LENGTH :
++                       XML_MAX_TEXT_LENGTH;
+     xmlParserInputState state;
+     const xmlChar *in;
+     size_t nbchar = 0;
+@@ -4958,8 +4975,7 @@ get_more:
+ 		buf[len] = 0;
+ 	    }
+ 	}
+-        if ((len > XML_MAX_TEXT_LENGTH) &&
+-            ((ctxt->options & XML_PARSE_HUGE) == 0)) {
++        if (len > maxLength) {
+             xmlFatalErrMsgStr(ctxt, XML_ERR_COMMENT_NOT_FINISHED,
+                          "Comment too big found", NULL);
+             xmlFree (buf);
+@@ -5159,6 +5175,9 @@ xmlParsePI(xmlParserCtxtPtr ctxt) {
+     xmlChar *buf = NULL;
+     size_t len = 0;
+     size_t size = XML_PARSER_BUFFER_SIZE;
++    size_t maxLength = (ctxt->options & XML_PARSE_HUGE) ?
++                       XML_MAX_HUGE_LENGTH :
++                       XML_MAX_TEXT_LENGTH;
+     int cur, l;
+     const xmlChar *target;
+     xmlParserInputState state;
+@@ -5234,14 +5253,6 @@ xmlParsePI(xmlParserCtxtPtr ctxt) {
+                         return;
+                     }
+ 		    count = 0;
+-                    if ((len > XML_MAX_TEXT_LENGTH) &&
+-                        ((ctxt->options & XML_PARSE_HUGE) == 0)) {
+-                        xmlFatalErrMsgStr(ctxt, XML_ERR_PI_NOT_FINISHED,
+-                                          "PI %s too big found", target);
+-                        xmlFree(buf);
+-                        ctxt->instate = state;
+-                        return;
+-                    }
+ 		}
+ 		COPY_BUF(l,buf,len,cur);
+ 		NEXTL(l);
+@@ -5251,15 +5262,14 @@ xmlParsePI(xmlParserCtxtPtr ctxt) {
+ 		    GROW;
+ 		    cur = CUR_CHAR(l);
+ 		}
++                if (len > maxLength) {
++                    xmlFatalErrMsgStr(ctxt, XML_ERR_PI_NOT_FINISHED,
++                                      "PI %s too big found", target);
++                    xmlFree(buf);
++                    ctxt->instate = state;
++                    return;
++                }
+ 	    }
+-            if ((len > XML_MAX_TEXT_LENGTH) &&
+-                ((ctxt->options & XML_PARSE_HUGE) == 0)) {
+-                xmlFatalErrMsgStr(ctxt, XML_ERR_PI_NOT_FINISHED,
+-                                  "PI %s too big found", target);
+-                xmlFree(buf);
+-                ctxt->instate = state;
+-                return;
+-            }
+ 	    buf[len] = 0;
+ 	    if (cur != '?') {
+ 		xmlFatalErrMsgStr(ctxt, XML_ERR_PI_NOT_FINISHED,
+@@ -8954,6 +8964,9 @@ xmlParseAttValueInternal(xmlParserCtxtPtr ctxt, int *len, int *alloc,
+     const xmlChar *in = NULL, *start, *end, *last;
+     xmlChar *ret = NULL;
+     int line, col;
++    int maxLength = (ctxt->options & XML_PARSE_HUGE) ?
++                    XML_MAX_HUGE_LENGTH :
++                    XML_MAX_TEXT_LENGTH;
+ 
+     GROW;
+     in = (xmlChar *) CUR_PTR;
+@@ -8993,8 +9006,7 @@ xmlParseAttValueInternal(xmlParserCtxtPtr ctxt, int *len, int *alloc,
+ 	    start = in;
+ 	    if (in >= end) {
+                 GROW_PARSE_ATT_VALUE_INTERNAL(ctxt, in, start, end)
+-                if (((in - start) > XML_MAX_TEXT_LENGTH) &&
+-                    ((ctxt->options & XML_PARSE_HUGE) == 0)) {
++                if ((in - start) > maxLength) {
+                     xmlFatalErrMsg(ctxt, XML_ERR_ATTRIBUTE_NOT_FINISHED,
+                                    "AttValue length too long\n");
+                     return(NULL);
+@@ -9007,8 +9019,7 @@ xmlParseAttValueInternal(xmlParserCtxtPtr ctxt, int *len, int *alloc,
+ 	    if ((*in++ == 0x20) && (*in == 0x20)) break;
+ 	    if (in >= end) {
+                 GROW_PARSE_ATT_VALUE_INTERNAL(ctxt, in, start, end)
+-                if (((in - start) > XML_MAX_TEXT_LENGTH) &&
+-                    ((ctxt->options & XML_PARSE_HUGE) == 0)) {
++                if ((in - start) > maxLength) {
+                     xmlFatalErrMsg(ctxt, XML_ERR_ATTRIBUTE_NOT_FINISHED,
+                                    "AttValue length too long\n");
+                     return(NULL);
+@@ -9041,16 +9052,14 @@ xmlParseAttValueInternal(xmlParserCtxtPtr ctxt, int *len, int *alloc,
+ 		    last = last + delta;
+ 		}
+ 		end = ctxt->input->end;
+-                if (((in - start) > XML_MAX_TEXT_LENGTH) &&
+-                    ((ctxt->options & XML_PARSE_HUGE) == 0)) {
++                if ((in - start) > maxLength) {
+                     xmlFatalErrMsg(ctxt, XML_ERR_ATTRIBUTE_NOT_FINISHED,
+                                    "AttValue length too long\n");
+                     return(NULL);
+                 }
+ 	    }
+ 	}
+-        if (((in - start) > XML_MAX_TEXT_LENGTH) &&
+-            ((ctxt->options & XML_PARSE_HUGE) == 0)) {
++        if ((in - start) > maxLength) {
+             xmlFatalErrMsg(ctxt, XML_ERR_ATTRIBUTE_NOT_FINISHED,
+                            "AttValue length too long\n");
+             return(NULL);
+@@ -9063,8 +9072,7 @@ xmlParseAttValueInternal(xmlParserCtxtPtr ctxt, int *len, int *alloc,
+ 	    col++;
+ 	    if (in >= end) {
+                 GROW_PARSE_ATT_VALUE_INTERNAL(ctxt, in, start, end)
+-                if (((in - start) > XML_MAX_TEXT_LENGTH) &&
+-                    ((ctxt->options & XML_PARSE_HUGE) == 0)) {
++                if ((in - start) > maxLength) {
+                     xmlFatalErrMsg(ctxt, XML_ERR_ATTRIBUTE_NOT_FINISHED,
+                                    "AttValue length too long\n");
+                     return(NULL);
+@@ -9072,8 +9080,7 @@ xmlParseAttValueInternal(xmlParserCtxtPtr ctxt, int *len, int *alloc,
+ 	    }
+ 	}
+ 	last = in;
+-        if (((in - start) > XML_MAX_TEXT_LENGTH) &&
+-            ((ctxt->options & XML_PARSE_HUGE) == 0)) {
++        if ((in - start) > maxLength) {
+             xmlFatalErrMsg(ctxt, XML_ERR_ATTRIBUTE_NOT_FINISHED,
+                            "AttValue length too long\n");
+             return(NULL);
+@@ -9763,6 +9770,9 @@ xmlParseCDSect(xmlParserCtxtPtr ctxt) {
+     int	s, sl;
+     int cur, l;
+     int count = 0;
++    int maxLength = (ctxt->options & XML_PARSE_HUGE) ?
++                    XML_MAX_HUGE_LENGTH :
++                    XML_MAX_TEXT_LENGTH;
+ 
+     /* Check 2.6.0 was NXT(0) not RAW */
+     if (CMP9(CUR_PTR, '<', '!', '[', 'C', 'D', 'A', 'T', 'A', '[')) {
+@@ -9796,13 +9806,6 @@ xmlParseCDSect(xmlParserCtxtPtr ctxt) {
+ 	if (len + 5 >= size) {
+ 	    xmlChar *tmp;
+ 
+-            if ((size > XML_MAX_TEXT_LENGTH) &&
+-                ((ctxt->options & XML_PARSE_HUGE) == 0)) {
+-                xmlFatalErrMsgStr(ctxt, XML_ERR_CDATA_NOT_FINISHED,
+-                             "CData section too big found", NULL);
+-                xmlFree (buf);
+-                return;
+-            }
+ 	    tmp = (xmlChar *) xmlRealloc(buf, size * 2 * sizeof(xmlChar));
+ 	    if (tmp == NULL) {
+ 	        xmlFree(buf);
+@@ -9829,6 +9832,12 @@ xmlParseCDSect(xmlParserCtxtPtr ctxt) {
+ 	}
+ 	NEXTL(l);
+ 	cur = CUR_CHAR(l);
++        if (len > maxLength) {
++            xmlFatalErrMsg(ctxt, XML_ERR_CDATA_NOT_FINISHED,
++                           "CData section too big found\n");
++            xmlFree(buf);
++            return;
++        }
+     }
+     buf[len] = 0;
+     ctxt->instate = XML_PARSER_CONTENT;
+-- 
+GitLab
diff --git a/meta/recipes-core/libxml/libxml2_2.9.10.bb b/meta/recipes-core/libxml/libxml2_2.9.10.bb
index dc62991739..39036f2688 100644
--- a/meta/recipes-core/libxml/libxml2_2.9.10.bb
+++ b/meta/recipes-core/libxml/libxml2_2.9.10.bb
@@ -34,6 +34,7 @@ SRC_URI += "http://www.w3.org/XML/Test/xmlts20080827.tar.gz;subdir=${BP};name=te
            file://CVE-2022-29824.patch \
            file://0001-Port-gentest.py-to-Python-3.patch \
            file://CVE-2016-3709.patch \
+           file://CVE-2022-40303.patch \
            "
 
 SRC_URI[archive.sha256sum] = "593b7b751dd18c2d6abcd0c4bcb29efc203d0b4373a6df98e3a455ea74ae2813"
-- 
2.17.1


