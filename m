Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f45.google.com (mail-pa0-f45.google.com
	[209.85.220.45])
	by mail.openembedded.org (Postfix) with ESMTP id 9258A605FF
	for <openembedded-core@lists.openembedded.org>;
	Sat,  5 Dec 2015 19:35:37 +0000 (UTC)
Received: by pacej9 with SMTP id ej9so103650441pac.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 05 Dec 2015 11:35:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=A5+TY6SbTshHmAOazsI5FUs+EReYYG4/wPJOU8fqpTw=;
	b=N1g8WkW7ZB3HX/lVZ16OspHtHbnO3bUG5J5d83gfs3b3cHYI65Qr/L/kmU8f/uFCxf
	8qAdV5ck71R8KEtE9qCPeF+Sc9/6hEVrl0mrnLTPZXzhvcX1r1nuqSPW9Ef2DDkdukJv
	wjd+csktnV2umPgYRxgKGbLtw9uXFWdhauBkIGJPCGooIO1UC+n86D7r4IEVDQpWPsmQ
	yP+bgcMpnoiGpFE/48EsVYgNeNVtCwOrFDn0y7Lq0WO10ipvB/1uV8uWAnPaxwkWonzp
	7AHvaVknZapgCjpZbqbLXAjm/kC4nEi4vqlHCacn4ylK3gIEpqZQZbIlk1uHyqq23gzi
	Q/uw==
X-Received: by 10.66.159.226 with SMTP id xf2mr31424540pab.23.1449344138604;
	Sat, 05 Dec 2015 11:35:38 -0800 (PST)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	w8sm24789831pfi.41.2015.12.05.11.35.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 05 Dec 2015 11:35:37 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  5 Dec 2015 11:35:17 -0800
Message-Id: <1449344129-32738-4-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
In-Reply-To: <1449344129-32738-1-git-send-email-akuster808@gmail.com>
References: <1449344129-32738-1-git-send-email-akuster808@gmail.com>
Cc: Armin Kuster <akuster@mvista.com>
Subject: [PATCH][jethro][fido] 03/15] libxml2: security fix CVE-2015-8317
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 05 Dec 2015 19:35:39 -0000

From: Armin Kuster <akuster@mvista.com>

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 ...ng-early-on-if-encoding-conversion-failed.patch | 42 ++++++++++++++++++++++
 1 file changed, 42 insertions(+)
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2015-8317-Fail-parsing-early-on-if-encoding-conversion-failed.patch

diff --git a/meta/recipes-core/libxml/libxml2/CVE-2015-8317-Fail-parsing-early-on-if-encoding-conversion-failed.patch b/meta/recipes-core/libxml/libxml2/CVE-2015-8317-Fail-parsing-early-on-if-encoding-conversion-failed.patch
new file mode 100644
index 0000000..59425cb
--- /dev/null
+++ b/meta/recipes-core/libxml/libxml2/CVE-2015-8317-Fail-parsing-early-on-if-encoding-conversion-failed.patch
@@ -0,0 +1,42 @@
+From 709a952110e98621c9b78c4f26462a9d8333102e Mon Sep 17 00:00:00 2001
+From: Daniel Veillard <veillard@redhat.com>
+Date: Mon, 29 Jun 2015 16:10:26 +0800
+Subject: [PATCH] Fail parsing early on if encoding conversion failed
+
+For https://bugzilla.gnome.org/show_bug.cgi?id=751631
+
+If we fail conversing the current input stream while
+processing the encoding declaration of the XMLDecl
+then it's safer to just abort there and not try to
+report further errors.
+
+Upstream-Status: Backport
+
+CVE-2015-8317
+
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ parser.c | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/parser.c b/parser.c
+index a3a9568..0edd53b 100644
+--- a/parser.c
++++ b/parser.c
+@@ -10471,7 +10471,11 @@ xmlParseEncodingDecl(xmlParserCtxtPtr ctxt) {
+ 
+             handler = xmlFindCharEncodingHandler((const char *) encoding);
+ 	    if (handler != NULL) {
+-		xmlSwitchToEncoding(ctxt, handler);
++		if (xmlSwitchToEncoding(ctxt, handler) < 0) {
++		    /* failed to convert */
++		    ctxt->errNo = XML_ERR_UNSUPPORTED_ENCODING;
++		    return(NULL);
++		}
+ 	    } else {
+ 		xmlFatalErrMsgStr(ctxt, XML_ERR_UNSUPPORTED_ENCODING,
+ 			"Unsupported encoding %s\n", encoding);
+-- 
+2.3.5
+
-- 
2.3.5


