Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7591FE7E0B3
	for <webhook@archiver.kernel.org>; Mon,  9 Feb 2026 09:29:47 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.44208.1770629379727591202
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Feb 2026 01:29:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=T9QdYuWV;
 spf=pass (domain: smile.fr, ip: 209.85.221.51, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-43638a33157so1025259f8f.1
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Feb 2026 01:29:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1770629378; x=1771234178; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ctNaJ5tu41DYJP7AfpTFbDORKJGuauuFOt9j00smo48=;
        b=T9QdYuWVHoOXcWXfIVxvzGX1/kuitiXsiJ/y5I6cQJumwoqWue+sfR22MDw4p2FfSH
         1B0m6yLQJJWNAQXx/6Zif+s1DoApShXPvR0iVs5WO1VR+TBJIzLV2UemrEmlwEuRzHBG
         6l9qXbkRjlilS7O+sakGIYFWfDZhN5R//5knY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770629378; x=1771234178;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ctNaJ5tu41DYJP7AfpTFbDORKJGuauuFOt9j00smo48=;
        b=n15HiJsMU74cmvyAc8ONzsqG6q4oI7WmuyUnhKoo+jNC3ms61yd9g2m+9bBLF3u2fT
         zIp9V21/FA759CPW0xzvIS6MccCfdv8QQykMBH1nJzcQ9x8wyr499eljU8JFMDuMfF9S
         s5m17shDQSVLXhAur1o1WMvw45uUPEHZntjsPrPpdFHxhVo45vq1oGu/rzejcTgDo322
         fhSHOfIVOVlsT+4gHNTkpRvqmKlIMRs8NZk88oZ6Lc7s6GN0F7LogilXbH61PxUYVBem
         nxNl5e/Y6ScawEIsynG6aL24Ch3Q6GZuI20ZwYq/sPZ+vDJhJ/PkZZWJZ/YY1c1kwCU5
         98+g==
X-Gm-Message-State: AOJu0Ywd+czxjD7m3c0y1gDdlLNc2pX39DHJGqPIpLtKe/yrujiyOxue
	FURkZJwi02mdNoMKF6YVIFA5X5P2QPmoi47gBtbR9GHWvQE8qb9G7b0BI5N8N470SOM3tHL8FNX
	OP8ohz0k=
X-Gm-Gg: AZuq6aJG0XI+d0PloI/6BRTDZE4G7sIbRc8aA2mK4SAlIFjSTa5ceugOPGxl93JhXgi
	OOFJiSlOsyc5apXp3wHkzpdta1t9i7JBCgGCiL3V/Ak0t3DNvi31joRaPOC+VfL9dNscWhSsz4a
	pYWR7EGumv0bLnvtuNTEWepmpcOY6xepDD5kTK1rz2MN2qtZFTIHNWB0vEx6Iz8YFCpVzU5kDB6
	LwrwN7gNYxJP+/ImgOqz5XKjB8MHBG20w3V2repe3k2d0Kxl89/EVIS1xRaCJ47GAH588NOAjQ2
	26gyBkA9qCqBJr0q5EOaOAT2nMeorPtoEhE42hZGN6q4Y2RkCNB4gJj7qQRZH/+wgSMVsHQBsBv
	fKzmYKAPP/7bAfomoy+wMKgZOT+Vxt7qCr7rJC37bibp3vwHGt++S4+e7vwlQ4puN81keZX6H66
	W5vd6FxSDPg59aJI5XBsxAzyhb01XSyDc1LDiGRFY3rbngGDiGf+Zs5dYBLtXXEqUMNxCGuHo8y
	1rWI8eQBp3TOZs=
X-Received: by 2002:a05:6000:4308:b0:437:75c1:578d with SMTP id ffacd0b85a97d-43775c163afmr1006020f8f.11.1770629377766;
        Mon, 09 Feb 2026 01:29:37 -0800 (PST)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4376a78d796sm9575656f8f.20.2026.02.09.01.29.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 01:29:37 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 22/25] lighttpd: Fix trailing slash on files in mod_dirlisting
Date: Mon,  9 Feb 2026 10:29:05 +0100
Message-ID: <790da20c7bbd569cf75aa95adf5a7f1afe288f97.1770626074.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1770626074.git.yoann.congal@smile.fr>
References: <cover.1770626074.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Feb 2026 09:29:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230773

From: Fred Bacon <fred.w.bacon@gmail.com>

Fixes [YOCTO #16128]

Backport of upstream bug fix from lighttpd-1.4.75. Version 1.4.74 introduced a bug that
would append a trailing slash to files in a directory listing. When the user attempts to
download one of these files, the web browser could not save the file with a trailing
slash. As a consequence, every web browser tested would generate a random character string
for the saved file name.

Signed-off-by: Fred Bacon <bacon@aerodyne.com>
[Yoann: Fixed Upstream-Status: Backport URL]
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../lighttpd/0001-mod_dirlisting.patch        | 48 +++++++++++++++++++
 .../lighttpd/lighttpd_1.4.74.bb               |  1 +
 2 files changed, 49 insertions(+)
 create mode 100644 meta/recipes-extended/lighttpd/lighttpd/0001-mod_dirlisting.patch

diff --git a/meta/recipes-extended/lighttpd/lighttpd/0001-mod_dirlisting.patch b/meta/recipes-extended/lighttpd/lighttpd/0001-mod_dirlisting.patch
new file mode 100644
index 00000000000..9df2b7556c2
--- /dev/null
+++ b/meta/recipes-extended/lighttpd/lighttpd/0001-mod_dirlisting.patch
@@ -0,0 +1,48 @@
+From 3d400ce06dcb950a61363f87330324db244f4bac Mon Sep 17 00:00:00 2001
+From: Glenn Strauss <gstrauss@gluelogic.com>
+Date: Thu, 29 Feb 2024 20:59:57 -0500
+Subject: [PATCH] [mod_dirlisting] fix suffix display of '/' on file (fixes
+ #3242)
+
+fix incorrect suffix display of '/' on files
+
+(regression in lighttpd 1.4.74)
+
+(thx guy)
+
+Upstream-Status: Backport [https://github.com/lighttpd/lighttpd1.4/commit/3d400ce06dcb950a61363f87330324db244f4bac]
+
+References:
+[1] https://redmine.lighttpd.net/issues/3242
+
+Signed-off-by: Glenn Strauss <gstrauss@gluelogic.com>
+---
+ src/mod_dirlisting.c | 11 ++++++++++-
+ 1 file changed, 10 insertions(+), 1 deletion(-)
+
+diff --git a/src/mod_dirlisting.c b/src/mod_dirlisting.c
+index a3432211..2686cd3e 100644
+--- a/src/mod_dirlisting.c
++++ b/src/mod_dirlisting.c
+@@ -1022,10 +1022,19 @@ static void http_list_directory_dirname(buffer * const out, const dirls_entry_t
+ 	buffer_append_string_len(out, CONST_STR_LEN("</td><td class=\"s\">- &nbsp;</td><td class=\"t\">Directory</td></tr>\n"));
+ }
+ 
++static void http_list_file_ent(buffer * const out, const dirls_entry_t * const ent, const char * const name) {
++	buffer_append_string_encoded(out, name, ent->namelen, ENCODING_REL_URI_PART);
++	buffer_append_string_len(out, CONST_STR_LEN("\">"));
++	buffer_append_string_encoded(out, name, ent->namelen, ENCODING_MINIMAL_XML);
++	buffer_append_string_len(out, CONST_STR_LEN("</a></td><td class=\"m\">"));
++
++	http_list_directory_mtime(out, ent);
++}
++
+ static void http_list_directory_filename(buffer * const out, const dirls_entry_t * const ent, const char * const name, handler_ctx * const hctx) {
+ 	buffer_append_string_len(out, CONST_STR_LEN("<tr><td class=\"n\"><a href=\""));
+ 
+-	http_list_directory_ent(out, ent, name);
++	http_list_file_ent(out, ent, name);
+ 
+ 	const buffer *content_type;
+   #if defined(HAVE_XATTR) || defined(HAVE_EXTATTR) /*(pass full path)*/
+
diff --git a/meta/recipes-extended/lighttpd/lighttpd_1.4.74.bb b/meta/recipes-extended/lighttpd/lighttpd_1.4.74.bb
index 7460d3d716d..e48fd165145 100644
--- a/meta/recipes-extended/lighttpd/lighttpd_1.4.74.bb
+++ b/meta/recipes-extended/lighttpd/lighttpd_1.4.74.bb
@@ -14,6 +14,7 @@ SRC_URI = "http://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-${PV}.t
            file://index.html.lighttpd \
            file://lighttpd.conf \
            file://lighttpd \
+           file://0001-mod_dirlisting.patch \
            "
 
 SRC_URI[sha256sum] = "5c08736e83088f7e019797159f306e88ec729abe976dc98fb3bed71b9d3e53b5"

