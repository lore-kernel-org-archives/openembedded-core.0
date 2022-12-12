Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DB85C4332F
	for <webhook@archiver.kernel.org>; Mon, 12 Dec 2022 05:58:48 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web11.36589.1670824718549774930
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Dec 2022 21:58:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=UELNRMEz;
 spf=pass (domain: mvista.com, ip: 209.85.216.43, mailfrom: hprajapati@mvista.com)
Received: by mail-pj1-f43.google.com with SMTP id 3-20020a17090a098300b00219041dcbe9so11016705pjo.3
        for <openembedded-core@lists.openembedded.org>; Sun, 11 Dec 2022 21:58:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yHUHcqduxDjS5jpu/UxnSqFwVTtD5jfg1aKm/l4Ysa8=;
        b=UELNRMEzkiCBvgxkpgMO37I0miQW4Y6znChlZL1uAJ4R9fhR+ZDaRDNf9j7+tKsgx7
         NAjgA8p9qvYSFiTjvCqtZsLVZQ3U7/oeYHGQw2sPoZ+T2r6YKf9ruwQcTLs5s4OORuXQ
         NXvamgs+64FRKAZfZapDMex4pX6fZrcrNmvOI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yHUHcqduxDjS5jpu/UxnSqFwVTtD5jfg1aKm/l4Ysa8=;
        b=nS88TpaxnXMn9RDx57s72hTtr8ALGlpP+PqM27EJi67tjWKN2/J/6pz31CGq3AnmWW
         77CZpDNXMkjO3PHSXFzn5uXXozUYPxcfljuzPl2XH7zAv+IxD2k4f/ZItzhMn79+tzEo
         03Rgk4j3joOWkYfRXTlP12KTdAgLjY+bvAr3wkVjvySrxl5rWkqktObXi0WFFPfzjP8X
         +arSLe/drK0wDEJUz+Gz1mBr73wXY9zO7JV92jAlYHB9Di5e05PzCTHf4w45KOzUVawr
         peMtxsA/XrMPNa579yV9nO8A8PdPLzhBBNhwuPc9c2R65A8GzPKBYGIq2wkI+zJ4iTZD
         iOQQ==
X-Gm-Message-State: ANoB5pm7nJ/1yXgFdRybXR1HhOIahRKSfSuDcEMXuVrg2y4lNTXKfm2V
	1HgcL0L3OV7DcnMHuemhga2SSGsI6bcl/Cf1
X-Google-Smtp-Source: AA0mqf62oygxlo7+/d4UNSikY8PSqB7sKPvc0wjbq79C8hRZXp/9PhYBMUscehR2dnf+e+5suUQU+g==
X-Received: by 2002:a17:902:ef47:b0:187:49e0:4ab with SMTP id e7-20020a170902ef4700b0018749e004abmr15585647plx.4.1670824716842;
        Sun, 11 Dec 2022 21:58:36 -0800 (PST)
Received: from MVIN00024 ([43.249.234.213])
        by smtp.gmail.com with ESMTPSA id b8-20020a170902d50800b00174f61a7d09sm5308752plg.247.2022.12.11.21.58.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Dec 2022 21:58:36 -0800 (PST)
Received: by MVIN00024 (sSMTP sendmail emulation); Mon, 12 Dec 2022 11:28:31 +0530
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [kirkstone][PATCH] libxml2: Fix CVE-2022-40303 && CVE-2022-40304
Date: Mon, 12 Dec 2022 11:28:30 +0530
Message-Id: <20221212055830.129996-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Dec 2022 05:58:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174480

Upstream-Status: Backport from https://gitlab.gnome.org/GNOME/libxml2/-/commit/c846986356fc149915a74972bf198abc266bc2c0 && https://gitlab.gnome.org/GNOME/libxml2/-/commit/1b41ec4e9433b05bb0376be4725804c54ef1d80b

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../libxml/libxml2/CVE-2022-40303.patch       | 624 ++++++++++++++++++
 .../libxml/libxml2/CVE-2022-40304.patch       | 106 +++
 meta/recipes-core/libxml/libxml2_2.9.14.bb    |   2 +
 3 files changed, 732 insertions(+)
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2022-40303.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2022-40304.patch

diff --git a/meta/recipes-core/libxml/libxml2/CVE-2022-40303.patch b/meta/recipes-core/libxml/libxml2/CVE-2022-40303.patch
new file mode 100644
index 0000000000..346ec37a9f
--- /dev/null
+++ b/meta/recipes-core/libxml/libxml2/CVE-2022-40303.patch
@@ -0,0 +1,624 @@
+From 15050f59d2a62b97b34e9cab8b8076a68ef003bd Mon Sep 17 00:00:00 2001
+From: Nick Wellnhofer <wellnhofer@aevum.de>
+Date: Thu, 25 Aug 2022 17:43:08 +0200
+Subject: [PATCH] CVE-2022-40303
+
+Fix integer overflows with XML_PARSE_HUGE
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
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libxml2/-/commit/c846986356fc149915a74972bf198abc266bc2c0]
+CVE: CVE-2022-40303
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ parser.c | 233 +++++++++++++++++++++++++++++--------------------------
+ 1 file changed, 121 insertions(+), 112 deletions(-)
+
+diff --git a/parser.c b/parser.c
+index 1bc3713..0f76577 100644
+--- a/parser.c
++++ b/parser.c
+@@ -115,6 +115,8 @@ xmlParseElementEnd(xmlParserCtxtPtr ctxt);
+  *									*
+  ************************************************************************/
+ 
++#define XML_MAX_HUGE_LENGTH 1000000000
++
+ #define XML_PARSER_BIG_ENTITY 1000
+ #define XML_PARSER_LOT_ENTITY 5000
+ 
+@@ -565,7 +567,7 @@ xmlFatalErr(xmlParserCtxtPtr ctxt, xmlParserErrors error, const char *info)
+             errmsg = "Malformed declaration expecting version";
+             break;
+         case XML_ERR_NAME_TOO_LONG:
+-            errmsg = "Name too long use XML_PARSE_HUGE option";
++            errmsg = "Name too long";
+             break;
+ #if 0
+         case:
+@@ -3210,6 +3212,9 @@ xmlParseNameComplex(xmlParserCtxtPtr ctxt) {
+     int len = 0, l;
+     int c;
+     int count = 0;
++    int maxLength = (ctxt->options & XML_PARSE_HUGE) ?
++                    XML_MAX_TEXT_LENGTH :
++                    XML_MAX_NAME_LENGTH;
+ 
+ #ifdef DEBUG
+     nbParseNameComplex++;
+@@ -3275,7 +3280,8 @@ xmlParseNameComplex(xmlParserCtxtPtr ctxt) {
+                 if (ctxt->instate == XML_PARSER_EOF)
+                     return(NULL);
+ 	    }
+-	    len += l;
++            if (len <= INT_MAX - l)
++	        len += l;
+ 	    NEXTL(l);
+ 	    c = CUR_CHAR(l);
+ 	}
+@@ -3301,13 +3307,13 @@ xmlParseNameComplex(xmlParserCtxtPtr ctxt) {
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
+@@ -3346,7 +3352,10 @@ const xmlChar *
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
+@@ -3370,8 +3379,7 @@ xmlParseName(xmlParserCtxtPtr ctxt) {
+ 	    in++;
+ 	if ((*in > 0) && (*in < 0x80)) {
+ 	    count = in - ctxt->input->cur;
+-            if ((count > XML_MAX_NAME_LENGTH) &&
+-                ((ctxt->options & XML_PARSE_HUGE) == 0)) {
++            if (count > maxLength) {
+                 xmlFatalErr(ctxt, XML_ERR_NAME_TOO_LONG, "Name");
+                 return(NULL);
+             }
+@@ -3392,6 +3400,9 @@ xmlParseNCNameComplex(xmlParserCtxtPtr ctxt) {
+     int len = 0, l;
+     int c;
+     int count = 0;
++    int maxLength = (ctxt->options & XML_PARSE_HUGE) ?
++                    XML_MAX_TEXT_LENGTH :
++                    XML_MAX_NAME_LENGTH;
+     size_t startPosition = 0;
+ 
+ #ifdef DEBUG
+@@ -3412,17 +3423,13 @@ xmlParseNCNameComplex(xmlParserCtxtPtr ctxt) {
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
+@@ -3440,8 +3447,7 @@ xmlParseNCNameComplex(xmlParserCtxtPtr ctxt) {
+ 	    c = CUR_CHAR(l);
+ 	}
+     }
+-    if ((len > XML_MAX_NAME_LENGTH) &&
+-        ((ctxt->options & XML_PARSE_HUGE) == 0)) {
++    if (len > maxLength) {
+         xmlFatalErr(ctxt, XML_ERR_NAME_TOO_LONG, "NCName");
+         return(NULL);
+     }
+@@ -3467,7 +3473,10 @@ static const xmlChar *
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
+@@ -3492,8 +3501,7 @@ xmlParseNCName(xmlParserCtxtPtr ctxt) {
+ 	    goto complex;
+ 	if ((*in > 0) && (*in < 0x80)) {
+ 	    count = in - ctxt->input->cur;
+-            if ((count > XML_MAX_NAME_LENGTH) &&
+-                ((ctxt->options & XML_PARSE_HUGE) == 0)) {
++            if (count > maxLength) {
+                 xmlFatalErr(ctxt, XML_ERR_NAME_TOO_LONG, "NCName");
+                 return(NULL);
+             }
+@@ -3575,6 +3583,9 @@ xmlParseStringName(xmlParserCtxtPtr ctxt, const xmlChar** str) {
+     const xmlChar *cur = *str;
+     int len = 0, l;
+     int c;
++    int maxLength = (ctxt->options & XML_PARSE_HUGE) ?
++                    XML_MAX_TEXT_LENGTH :
++                    XML_MAX_NAME_LENGTH;
+ 
+ #ifdef DEBUG
+     nbParseStringName++;
+@@ -3610,12 +3621,6 @@ xmlParseStringName(xmlParserCtxtPtr ctxt, const xmlChar** str) {
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
+@@ -3629,14 +3634,18 @@ xmlParseStringName(xmlParserCtxtPtr ctxt, const xmlChar** str) {
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
+@@ -3663,6 +3672,9 @@ xmlParseNmtoken(xmlParserCtxtPtr ctxt) {
+     int len = 0, l;
+     int c;
+     int count = 0;
++    int maxLength = (ctxt->options & XML_PARSE_HUGE) ?
++                    XML_MAX_TEXT_LENGTH :
++                    XML_MAX_NAME_LENGTH;
+ 
+ #ifdef DEBUG
+     nbParseNmToken++;
+@@ -3714,12 +3726,6 @@ xmlParseNmtoken(xmlParserCtxtPtr ctxt) {
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
+@@ -3733,6 +3739,11 @@ xmlParseNmtoken(xmlParserCtxtPtr ctxt) {
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
+@@ -3740,8 +3751,7 @@ xmlParseNmtoken(xmlParserCtxtPtr ctxt) {
+     }
+     if (len == 0)
+         return(NULL);
+-    if ((len > XML_MAX_NAME_LENGTH) &&
+-        ((ctxt->options & XML_PARSE_HUGE) == 0)) {
++    if (len > maxLength) {
+         xmlFatalErr(ctxt, XML_ERR_NAME_TOO_LONG, "NmToken");
+         return(NULL);
+     }
+@@ -3767,6 +3777,9 @@ xmlParseEntityValue(xmlParserCtxtPtr ctxt, xmlChar **orig) {
+     int len = 0;
+     int size = XML_PARSER_BUFFER_SIZE;
+     int c, l;
++    int maxLength = (ctxt->options & XML_PARSE_HUGE) ?
++                    XML_MAX_HUGE_LENGTH :
++                    XML_MAX_TEXT_LENGTH;
+     xmlChar stop;
+     xmlChar *ret = NULL;
+     const xmlChar *cur = NULL;
+@@ -3826,6 +3839,12 @@ xmlParseEntityValue(xmlParserCtxtPtr ctxt, xmlChar **orig) {
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
+@@ -3913,6 +3932,9 @@ xmlParseAttValueComplex(xmlParserCtxtPtr ctxt, int *attlen, int normalize) {
+     xmlChar *rep = NULL;
+     size_t len = 0;
+     size_t buf_size = 0;
++    size_t maxLength = (ctxt->options & XML_PARSE_HUGE) ?
++                       XML_MAX_HUGE_LENGTH :
++                       XML_MAX_TEXT_LENGTH;
+     int c, l, in_space = 0;
+     xmlChar *current = NULL;
+     xmlEntityPtr ent;
+@@ -3944,16 +3966,6 @@ xmlParseAttValueComplex(xmlParserCtxtPtr ctxt, int *attlen, int normalize) {
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
+ 	if (c == '&') {
+ 	    in_space = 0;
+ 	    if (NXT(1) == '#') {
+@@ -4101,6 +4113,11 @@ xmlParseAttValueComplex(xmlParserCtxtPtr ctxt, int *attlen, int normalize) {
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
+@@ -4122,16 +4139,6 @@ xmlParseAttValueComplex(xmlParserCtxtPtr ctxt, int *attlen, int normalize) {
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
+@@ -4202,6 +4209,9 @@ xmlParseSystemLiteral(xmlParserCtxtPtr ctxt) {
+     int len = 0;
+     int size = XML_PARSER_BUFFER_SIZE;
+     int cur, l;
++    int maxLength = (ctxt->options & XML_PARSE_HUGE) ?
++                    XML_MAX_TEXT_LENGTH :
++                    XML_MAX_NAME_LENGTH;
+     xmlChar stop;
+     int state = ctxt->instate;
+     int count = 0;
+@@ -4229,13 +4239,6 @@ xmlParseSystemLiteral(xmlParserCtxtPtr ctxt) {
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
+@@ -4264,6 +4267,12 @@ xmlParseSystemLiteral(xmlParserCtxtPtr ctxt) {
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
+@@ -4291,6 +4300,9 @@ xmlParsePubidLiteral(xmlParserCtxtPtr ctxt) {
+     xmlChar *buf = NULL;
+     int len = 0;
+     int size = XML_PARSER_BUFFER_SIZE;
++    int maxLength = (ctxt->options & XML_PARSE_HUGE) ?
++                    XML_MAX_TEXT_LENGTH :
++                    XML_MAX_NAME_LENGTH;
+     xmlChar cur;
+     xmlChar stop;
+     int count = 0;
+@@ -4318,12 +4330,6 @@ xmlParsePubidLiteral(xmlParserCtxtPtr ctxt) {
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
+@@ -4351,6 +4357,11 @@ xmlParsePubidLiteral(xmlParserCtxtPtr ctxt) {
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
+@@ -4750,6 +4761,9 @@ xmlParseCommentComplex(xmlParserCtxtPtr ctxt, xmlChar *buf,
+     int r, rl;
+     int cur, l;
+     size_t count = 0;
++    size_t maxLength = (ctxt->options & XML_PARSE_HUGE) ?
++                       XML_MAX_HUGE_LENGTH :
++                       XML_MAX_TEXT_LENGTH;
+     int inputid;
+ 
+     inputid = ctxt->input->id;
+@@ -4795,13 +4809,6 @@ xmlParseCommentComplex(xmlParserCtxtPtr ctxt, xmlChar *buf,
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
+@@ -4839,6 +4846,13 @@ xmlParseCommentComplex(xmlParserCtxtPtr ctxt, xmlChar *buf,
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
+@@ -4883,6 +4897,9 @@ xmlParseComment(xmlParserCtxtPtr ctxt) {
+     xmlChar *buf = NULL;
+     size_t size = XML_PARSER_BUFFER_SIZE;
+     size_t len = 0;
++    size_t maxLength = (ctxt->options & XML_PARSE_HUGE) ?
++                       XML_MAX_HUGE_LENGTH :
++                       XML_MAX_TEXT_LENGTH;
+     xmlParserInputState state;
+     const xmlChar *in;
+     size_t nbchar = 0;
+@@ -4966,8 +4983,7 @@ get_more:
+ 		buf[len] = 0;
+ 	    }
+ 	}
+-        if ((len > XML_MAX_TEXT_LENGTH) &&
+-            ((ctxt->options & XML_PARSE_HUGE) == 0)) {
++        if (len > maxLength) {
+             xmlFatalErrMsgStr(ctxt, XML_ERR_COMMENT_NOT_FINISHED,
+                          "Comment too big found", NULL);
+             xmlFree (buf);
+@@ -5167,6 +5183,9 @@ xmlParsePI(xmlParserCtxtPtr ctxt) {
+     xmlChar *buf = NULL;
+     size_t len = 0;
+     size_t size = XML_PARSER_BUFFER_SIZE;
++    size_t maxLength = (ctxt->options & XML_PARSE_HUGE) ?
++                       XML_MAX_HUGE_LENGTH :
++                       XML_MAX_TEXT_LENGTH;
+     int cur, l;
+     const xmlChar *target;
+     xmlParserInputState state;
+@@ -5242,14 +5261,6 @@ xmlParsePI(xmlParserCtxtPtr ctxt) {
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
+@@ -5259,15 +5270,14 @@ xmlParsePI(xmlParserCtxtPtr ctxt) {
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
+@@ -8959,6 +8969,9 @@ xmlParseAttValueInternal(xmlParserCtxtPtr ctxt, int *len, int *alloc,
+     const xmlChar *in = NULL, *start, *end, *last;
+     xmlChar *ret = NULL;
+     int line, col;
++    int maxLength = (ctxt->options & XML_PARSE_HUGE) ?
++                    XML_MAX_HUGE_LENGTH :
++                    XML_MAX_TEXT_LENGTH;
+ 
+     GROW;
+     in = (xmlChar *) CUR_PTR;
+@@ -8998,8 +9011,7 @@ xmlParseAttValueInternal(xmlParserCtxtPtr ctxt, int *len, int *alloc,
+ 	    start = in;
+ 	    if (in >= end) {
+                 GROW_PARSE_ATT_VALUE_INTERNAL(ctxt, in, start, end)
+-                if (((in - start) > XML_MAX_TEXT_LENGTH) &&
+-                    ((ctxt->options & XML_PARSE_HUGE) == 0)) {
++                if ((in - start) > maxLength) {
+                     xmlFatalErrMsg(ctxt, XML_ERR_ATTRIBUTE_NOT_FINISHED,
+                                    "AttValue length too long\n");
+                     return(NULL);
+@@ -9012,8 +9024,7 @@ xmlParseAttValueInternal(xmlParserCtxtPtr ctxt, int *len, int *alloc,
+ 	    if ((*in++ == 0x20) && (*in == 0x20)) break;
+ 	    if (in >= end) {
+                 GROW_PARSE_ATT_VALUE_INTERNAL(ctxt, in, start, end)
+-                if (((in - start) > XML_MAX_TEXT_LENGTH) &&
+-                    ((ctxt->options & XML_PARSE_HUGE) == 0)) {
++                if ((in - start) > maxLength) {
+                     xmlFatalErrMsg(ctxt, XML_ERR_ATTRIBUTE_NOT_FINISHED,
+                                    "AttValue length too long\n");
+                     return(NULL);
+@@ -9046,16 +9057,14 @@ xmlParseAttValueInternal(xmlParserCtxtPtr ctxt, int *len, int *alloc,
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
+@@ -9068,8 +9077,7 @@ xmlParseAttValueInternal(xmlParserCtxtPtr ctxt, int *len, int *alloc,
+ 	    col++;
+ 	    if (in >= end) {
+                 GROW_PARSE_ATT_VALUE_INTERNAL(ctxt, in, start, end)
+-                if (((in - start) > XML_MAX_TEXT_LENGTH) &&
+-                    ((ctxt->options & XML_PARSE_HUGE) == 0)) {
++                if ((in - start) > maxLength) {
+                     xmlFatalErrMsg(ctxt, XML_ERR_ATTRIBUTE_NOT_FINISHED,
+                                    "AttValue length too long\n");
+                     return(NULL);
+@@ -9077,8 +9085,7 @@ xmlParseAttValueInternal(xmlParserCtxtPtr ctxt, int *len, int *alloc,
+ 	    }
+ 	}
+ 	last = in;
+-        if (((in - start) > XML_MAX_TEXT_LENGTH) &&
+-            ((ctxt->options & XML_PARSE_HUGE) == 0)) {
++        if ((in - start) > maxLength) {
+             xmlFatalErrMsg(ctxt, XML_ERR_ATTRIBUTE_NOT_FINISHED,
+                            "AttValue length too long\n");
+             return(NULL);
+@@ -9768,6 +9775,9 @@ xmlParseCDSect(xmlParserCtxtPtr ctxt) {
+     int	s, sl;
+     int cur, l;
+     int count = 0;
++    int maxLength = (ctxt->options & XML_PARSE_HUGE) ?
++                    XML_MAX_HUGE_LENGTH :
++                    XML_MAX_TEXT_LENGTH;
+ 
+     /* Check 2.6.0 was NXT(0) not RAW */
+     if (CMP9(CUR_PTR, '<', '!', '[', 'C', 'D', 'A', 'T', 'A', '[')) {
+@@ -9801,13 +9811,6 @@ xmlParseCDSect(xmlParserCtxtPtr ctxt) {
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
+@@ -9834,6 +9837,12 @@ xmlParseCDSect(xmlParserCtxtPtr ctxt) {
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
+2.25.1
+
diff --git a/meta/recipes-core/libxml/libxml2/CVE-2022-40304.patch b/meta/recipes-core/libxml/libxml2/CVE-2022-40304.patch
new file mode 100644
index 0000000000..b24be03315
--- /dev/null
+++ b/meta/recipes-core/libxml/libxml2/CVE-2022-40304.patch
@@ -0,0 +1,106 @@
+From cde95d801abc9405ca821ad814c7730333328d96 Mon Sep 17 00:00:00 2001
+From: Nick Wellnhofer <wellnhofer@aevum.de>
+Date: Wed, 31 Aug 2022 22:11:25 +0200
+Subject: [PATCH] CVE-2022-40304
+
+Fix dict corruption caused by entity reference cycles
+
+When an entity reference cycle is detected, the entity content is
+cleared by setting its first byte to zero. But the entity content might
+be allocated from a dict. In this case, the dict entry becomes corrupted
+leading to all kinds of logic errors, including memory errors like
+double-frees.
+
+Stop storing entity content, orig, ExternalID and SystemID in a dict.
+These values are unlikely to occur multiple times in a document, so they
+shouldn't have been stored in a dict in the first place.
+
+Thanks to Ned Williamson and Nathan Wachholz working with Google Project
+Zero for the report!
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libxml2/-/commit/1b41ec4e9433b05bb0376be4725804c54ef1d80b]
+CVE: CVE-2022-40304
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ entities.c | 55 ++++++++++++++++--------------------------------------
+ 1 file changed, 16 insertions(+), 39 deletions(-)
+
+diff --git a/entities.c b/entities.c
+index 1a8f86f..ec1b9a7 100644
+--- a/entities.c
++++ b/entities.c
+@@ -112,36 +112,19 @@ xmlFreeEntity(xmlEntityPtr entity)
+     if ((entity->children) && (entity->owner == 1) &&
+         (entity == (xmlEntityPtr) entity->children->parent))
+         xmlFreeNodeList(entity->children);
+-    if (dict != NULL) {
+-        if ((entity->name != NULL) && (!xmlDictOwns(dict, entity->name)))
+-            xmlFree((char *) entity->name);
+-        if ((entity->ExternalID != NULL) &&
+-	    (!xmlDictOwns(dict, entity->ExternalID)))
+-            xmlFree((char *) entity->ExternalID);
+-        if ((entity->SystemID != NULL) &&
+-	    (!xmlDictOwns(dict, entity->SystemID)))
+-            xmlFree((char *) entity->SystemID);
+-        if ((entity->URI != NULL) && (!xmlDictOwns(dict, entity->URI)))
+-            xmlFree((char *) entity->URI);
+-        if ((entity->content != NULL)
+-            && (!xmlDictOwns(dict, entity->content)))
+-            xmlFree((char *) entity->content);
+-        if ((entity->orig != NULL) && (!xmlDictOwns(dict, entity->orig)))
+-            xmlFree((char *) entity->orig);
+-    } else {
+-        if (entity->name != NULL)
+-            xmlFree((char *) entity->name);
+-        if (entity->ExternalID != NULL)
+-            xmlFree((char *) entity->ExternalID);
+-        if (entity->SystemID != NULL)
+-            xmlFree((char *) entity->SystemID);
+-        if (entity->URI != NULL)
+-            xmlFree((char *) entity->URI);
+-        if (entity->content != NULL)
+-            xmlFree((char *) entity->content);
+-        if (entity->orig != NULL)
+-            xmlFree((char *) entity->orig);
+-    }
++    if ((entity->name != NULL) &&
++        ((dict == NULL) || (!xmlDictOwns(dict, entity->name))))
++        xmlFree((char *) entity->name);
++    if (entity->ExternalID != NULL)
++        xmlFree((char *) entity->ExternalID);
++    if (entity->SystemID != NULL)
++        xmlFree((char *) entity->SystemID);
++    if (entity->URI != NULL)
++        xmlFree((char *) entity->URI);
++    if (entity->content != NULL)
++        xmlFree((char *) entity->content);
++    if (entity->orig != NULL)
++        xmlFree((char *) entity->orig);
+     xmlFree(entity);
+ }
+ 
+@@ -177,18 +160,12 @@ xmlCreateEntity(xmlDictPtr dict, const xmlChar *name, int type,
+ 	    ret->SystemID = xmlStrdup(SystemID);
+     } else {
+         ret->name = xmlDictLookup(dict, name, -1);
+-	if (ExternalID != NULL)
+-	    ret->ExternalID = xmlDictLookup(dict, ExternalID, -1);
+-	if (SystemID != NULL)
+-	    ret->SystemID = xmlDictLookup(dict, SystemID, -1);
++	ret->ExternalID = xmlStrdup(ExternalID);
++	ret->SystemID = xmlStrdup(SystemID);
+     }
+     if (content != NULL) {
+         ret->length = xmlStrlen(content);
+-	if ((dict != NULL) && (ret->length < 5))
+-	    ret->content = (xmlChar *)
+-	                   xmlDictLookup(dict, content, ret->length);
+-	else
+-	    ret->content = xmlStrndup(content, ret->length);
++	ret->content = xmlStrndup(content, ret->length);
+      } else {
+         ret->length = 0;
+         ret->content = NULL;
+-- 
+2.25.1
+
diff --git a/meta/recipes-core/libxml/libxml2_2.9.14.bb b/meta/recipes-core/libxml/libxml2_2.9.14.bb
index 519985bbae..fffe7dda98 100644
--- a/meta/recipes-core/libxml/libxml2_2.9.14.bb
+++ b/meta/recipes-core/libxml/libxml2_2.9.14.bb
@@ -23,6 +23,8 @@ SRC_URI += "http://www.w3.org/XML/Test/xmlts20080827.tar.gz;subdir=${BP};name=te
            file://remove-fuzz-from-ptests.patch \
            file://libxml-m4-use-pkgconfig.patch \
            file://0001-Port-gentest.py-to-Python-3.patch \
+           file://CVE-2022-40303.patch \
+           file://CVE-2022-40304.patch \
            "
 
 SRC_URI[archive.sha256sum] = "60d74a257d1ccec0475e749cba2f21559e48139efba6ff28224357c7c798dfee"
-- 
2.25.1


