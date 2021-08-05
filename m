Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
 by mx.groups.io with SMTP id smtpd.web12.10471.1628177716845404330
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Aug 2021 08:35:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=gArT6Ous;
 spf=softfail (domain: sakoman.com, ip: 209.85.161.42, mailfrom: steve@sakoman.com)
Received: by mail-oo1-f42.google.com with SMTP id o17-20020a4a64110000b0290263e1ba7ff9so1425211ooc.2
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Aug 2021 08:35:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=xqV9Q2ln1FtZYq1fqoKT1xTy+ET1vpAJFh6Ge7lBdo8=;
        b=gArT6OusqtM7XWN4zjTYrItK+0V/UJ/QThLzbBM+EgJ9gc66PpqPuuGruNGiX5Xor6
         SqkojI/zY8LrznLeneVGfq9JPsPtgo3COtx4uHpZOgY7QdNJ5olz1sAfQe8hWFcN7jOK
         C34OPIF0BM3n/rZyyBNrvAYBqtqDVCEivATikayAFn37pLDioNelnBZhuRTdBLkPsYSy
         8W1PEPLsnz7aeWJQi20Dn5Mp1Kh2ETH0ITtr5/rodkZgh1BtQuPyVmVUGD7+qx82tv+T
         45GBS05aDSbVs1i2/ngU1vKNmpc5mTrBph3/QRfZJYeRSIZhW5UB34gQ4U70TlZ8xXg8
         fBCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xqV9Q2ln1FtZYq1fqoKT1xTy+ET1vpAJFh6Ge7lBdo8=;
        b=Mjyc3k89x9e09SbcPnGgKyTvXkbXh3EiJKSHmzLHr6RdrKLIAaVadbYYkZfxyxhIxN
         UWr6mFClIqvJmo1tU/BcqFTwFZCV+wMYjwnSTdiC7GVyEVt2Gpj1Q1iZ2D5oCwd9BTuI
         KwLC9lalAy20mN7HV0y6ZvAKSqou4wbGdr4JJbRZ64JghvAZZA/OkahZPEOIQBjqEBPT
         sTaJ5I7zHtckF4wrzJ1wXwM7gjHr8Vaq7DHtaO/IF663TC7o+G+3HloPgUXkS55Ehxpo
         uHTshbkem6bKyEfFiI/TGKd/QFHFUDoTZaCRgYKGtQLTFJkSb+PcENhutHlmN8ro6NyE
         11hA==
X-Gm-Message-State: AOAM533lsP98p8PjZ/m82zrMqNsxZsmRAsUqWh4sBBfhkGKdnjKkl6g9
	5fJ6NZgFZCdD7RoJKm52WQClDiUudQn7cpfv
X-Google-Smtp-Source: ABdhPJzamAx+8L221b18m5d1oQFp444dpqzZKVjQSsYhcrHyMMDO+sfJBo6TRjpHWQUAZWqHqGk+Tg==
X-Received: by 2002:a4a:896e:: with SMTP id g43mr3692701ooi.6.1628177715768;
        Thu, 05 Aug 2021 08:35:15 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id bf41sm1103076oib.41.2021.08.05.08.35.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Aug 2021 08:35:15 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 04/33] libxml2: fix CVE-2021-3541
Date: Thu,  5 Aug 2021 05:33:41 -1000
Message-Id: <1699293a7011797895c284d6ad664c66badba426.1628176985.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1628176985.git.steve@sakoman.com>
References: <cover.1628176985.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A flaw was found in libxml2. Exponential entity expansion attack
is possible bypassing all existing protection mechanisms and leading
to denial of service.

https://nvd.nist.gov/vuln/detail/CVE-2021-3541
CVE: 2021-3541

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libxml/libxml2/CVE-2021-3541.patch        | 73 +++++++++++++++++++
 meta/recipes-core/libxml/libxml2_2.9.10.bb    |  1 +
 2 files changed, 74 insertions(+)
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2021-3541.patch

diff --git a/meta/recipes-core/libxml/libxml2/CVE-2021-3541.patch b/meta/recipes-core/libxml/libxml2/CVE-2021-3541.patch
new file mode 100644
index 0000000000..1f392b4cd7
--- /dev/null
+++ b/meta/recipes-core/libxml/libxml2/CVE-2021-3541.patch
@@ -0,0 +1,73 @@
+From 8598060bacada41a0eb09d95c97744ff4e428f8e Mon Sep 17 00:00:00 2001
+From: Daniel Veillard <veillard@redhat.com>
+Date: Thu, 13 May 2021 14:55:12 +0200
+Subject: [PATCH] Patch for security issue CVE-2021-3541
+
+This is relapted to parameter entities expansion and following
+the line of the billion laugh attack. Somehow in that path the
+counting of parameters was missed and the normal algorithm based
+on entities "density" was useless.
+
+Upstream-Status: Backport
+[https://gitlab.gnome.org/GNOME/libxml2/-/commit/8598060bacada41a0eb09d95c97744ff4e428f8e]
+CVE: CVE-2021-3541
+Signed-off-by: Steve Sakoman <steve@sakoman.com>
+
+---
+ parser.c | 26 ++++++++++++++++++++++++++
+ 1 file changed, 26 insertions(+)
+
+diff --git a/parser.c b/parser.c
+index f5e5e169..c9312fa4 100644
+--- a/parser.c
++++ b/parser.c
+@@ -140,6 +140,7 @@ xmlParserEntityCheck(xmlParserCtxtPtr ctxt, size_t size,
+                      xmlEntityPtr ent, size_t replacement)
+ {
+     size_t consumed = 0;
++    int i;
+ 
+     if ((ctxt == NULL) || (ctxt->options & XML_PARSE_HUGE))
+         return (0);
+@@ -177,6 +178,28 @@ xmlParserEntityCheck(xmlParserCtxtPtr ctxt, size_t size,
+ 	    rep = NULL;
+ 	}
+     }
++
++    /*
++     * Prevent entity exponential check, not just replacement while
++     * parsing the DTD
++     * The check is potentially costly so do that only once in a thousand
++     */
++    if ((ctxt->instate == XML_PARSER_DTD) && (ctxt->nbentities > 10000) &&
++        (ctxt->nbentities % 1024 == 0)) {
++	for (i = 0;i < ctxt->inputNr;i++) {
++	    consumed += ctxt->inputTab[i]->consumed +
++	               (ctxt->inputTab[i]->cur - ctxt->inputTab[i]->base);
++	}
++	if (ctxt->nbentities > consumed * XML_PARSER_NON_LINEAR) {
++	    xmlFatalErr(ctxt, XML_ERR_ENTITY_LOOP, NULL);
++	    ctxt->instate = XML_PARSER_EOF;
++	    return (1);
++	}
++	consumed = 0;
++    }
++
++
++
+     if (replacement != 0) {
+ 	if (replacement < XML_MAX_TEXT_LENGTH)
+ 	    return(0);
+@@ -7963,6 +7986,9 @@ xmlParsePEReference(xmlParserCtxtPtr ctxt)
+             xmlChar start[4];
+             xmlCharEncoding enc;
+ 
++	    if (xmlParserEntityCheck(ctxt, 0, entity, 0))
++	        return;
++
+ 	    if ((entity->etype == XML_EXTERNAL_PARAMETER_ENTITY) &&
+ 	        ((ctxt->options & XML_PARSE_NOENT) == 0) &&
+ 		((ctxt->options & XML_PARSE_DTDVALID) == 0) &&
+-- 
+GitLab
+
diff --git a/meta/recipes-core/libxml/libxml2_2.9.10.bb b/meta/recipes-core/libxml/libxml2_2.9.10.bb
index b5fb3e6315..60dc71f38d 100644
--- a/meta/recipes-core/libxml/libxml2_2.9.10.bb
+++ b/meta/recipes-core/libxml/libxml2_2.9.10.bb
@@ -26,6 +26,7 @@ SRC_URI = "http://www.xmlsoft.org/sources/libxml2-${PV}.tar.gz;name=libtar \
            file://CVE-2021-3517.patch \
            file://CVE-2021-3537.patch \
            file://CVE-2021-3518.patch \
+           file://CVE-2021-3541.patch \
            "
 
 SRC_URI[libtar.md5sum] = "10942a1dc23137a8aa07f0639cbfece5"
-- 
2.25.1

