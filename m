Return-Path: <fred.w.bacon@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EC7BD2ECE4
	for <webhook@archiver.kernel.org>; Mon, 19 Jan 2026 20:35:23 +0000 (UTC)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.44464.1768854919225162290
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Jan 2026 12:35:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=h+R2Imuh;
 spf=pass (domain: gmail.com, ip: 209.85.219.47, mailfrom: fred.w.bacon@gmail.com)
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-8908f5ed4aeso45529526d6.3
        for <openembedded-core@lists.openembedded.org>; Mon, 19 Jan 2026 12:35:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768854918; x=1769459718; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=atUGDZbsrI4+GcP6+4jd04E7deux7TCaASR51z3qqI8=;
        b=h+R2ImuhbyJAwpWS2Zo7EdUhR4VMa3RdOAO5tBzqToTwJC1TTlTVGBhHBJV0W8WvZR
         MK04DITEGfCC7cdd/CjhhMEUyIcAqNHBCD9XtNIjICOjPHA11nzOB7I6pgkhTUQIsLVj
         84mbBHsZeWHH4WA0JgFj1GBu8cJcOchJRpPNp4wZ9Foo6Nmhde+B4pQGdrEpNHNhL2Xb
         aZ+xrxwAEq5KVuPi+vYriHcXf1La+SJephiTkMVLXNnuH4z8QXjlaPqrld5dTJiRs4sf
         bZXEeF/+JYTlHa8g7/R+Fdfk9Qxaw/QYBRXyaJdKtttMClEHLwe48CpgVPXYbsgjy/nM
         Cyfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768854918; x=1769459718;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=atUGDZbsrI4+GcP6+4jd04E7deux7TCaASR51z3qqI8=;
        b=NUXwnNDfYCGdI67OC7McMHnDqeBHRagozuBBduXgjxykuB34KutvnzehnzsCdXMQZp
         gcMvJoohL2/l7CyRc0HE9DBxbxyq15Dqp6EW0cl6STOnygA3Np9z5bOQhy2nAy6t5Uvg
         A9/K6qXeIdpn0TMsuWg21cfGOgTf8GWq4rcAZb9qxYKxvf6c8ZnwwRmQ+2NDd7SHBEXp
         sjFMENyOn+QnLHSUypZiGwEhfnMWdsrwvROI8MjTnaxD6RV4Yz3ZQo9fj3u1cDyIBe3B
         QA89FydPVIJv5klRtibKCH55O+RY5N5zV/XxMwTNy60ZLcpHRQmi4eS0pquGNkwdAXPt
         MEfw==
X-Gm-Message-State: AOJu0Yzx9YgM/8fXHP7BOQ6nw4HHLfs7PS5CpSB9W96plfDcFXvV6PJ1
	XL83IwBCNH/fGp0d79bRCDnkShz7T04P7xtU94dFdDadNsauOgAXD4NL8ST01Q==
X-Gm-Gg: AZuq6aL3FAN/s1tPJNbd9fRVZvMm26WM75bwdDEEyUF1YXsxvCmDhpHiKO8a8PWamud
	CW74IKQMJ1cUnqHL3tWG6OwLE3RCcVkUqqxjk1VALRk/3Y2X0rVi7Uqj/1ILVC1aNeq1XmAybYy
	SzbJOqKLCYMG5goieaTWOaFyQ/CMxzAWucWGYnliGnetFfgqSfCJffe8tHPAMSsmWcOhDZ6P15N
	FTfuFi7AV9u60swvgWxl5uBFa1j7nU4lk0bPG7Z27P5hkOKzsakBel42njcR6/SXuBZSbg/jD9q
	qUU8d5Nugl1Dq6HPvVdVjfBE+D4mkTcTR3+9pTA9dQ/hVwmaXyI1tz70YujldkL9F1BkX74ONCB
	166EfwTR6yCYVuh9N0WS7uqZAbZl8r1dV171FvI6mmHIPXuzgdK6D9Z3+kLCxlQ2T4NjvrVHp57
	RJIw1jvAv0WdtUrrk0NAAIgCT+se/GP37uAxsHWT1MCghQ
X-Received: by 2002:a05:6214:1c85:b0:886:3fd2:ea78 with SMTP id 6a1803df08f44-8942e2de814mr153717846d6.24.1768854917901;
        Mon, 19 Jan 2026 12:35:17 -0800 (PST)
Received: from rl80220dt-bacon.aerodyne.com ([208.211.193.106])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8942e6040casm91719516d6.21.2026.01.19.12.35.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 12:35:17 -0800 (PST)
From: fred.w.bacon@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Fred Bacon <bacon@aerodyne.com>
Subject: [PATCH 1/1] lighttpd: Fix trailing slash on files in mod_dirlisting
Date: Mon, 19 Jan 2026 15:35:09 -0500
Message-ID: <20260119203509.3960946-2-fred.w.bacon@gmail.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <20260119203509.3960946-1-fred.w.bacon@gmail.com>
References: <20260119203509.3960946-1-fred.w.bacon@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Jan 2026 20:35:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229635

From: Fred Bacon <bacon@aerodyne.com>

Fixes [YOCTO #16128]

Backport of upstream bug fix from lighttpd-1.4.75. Version 1.4.74 introduced a bug that
would append a trailing slash to files in a directory listing. When the user attempts to
download one of these files, the web browser could not save the file with a trailing
slash. As a consequence, every web browser tested would generate a random character string
for the saved file name.

Upstream-Status: Backport [1.4.75]
Signed-off-by: Fred Bacon <bacon@aerodyne.com>
---
 .../lighttpd/0001-mod_dirlisting.patch        | 48 +++++++++++++++++++
 .../lighttpd/lighttpd_1.4.74.bb               |  1 +
 2 files changed, 49 insertions(+)
 create mode 100644 meta/recipes-extended/lighttpd/lighttpd/0001-mod_dirlisting.patch

diff --git a/meta/recipes-extended/lighttpd/lighttpd/0001-mod_dirlisting.patch b/meta/recipes-extended/lighttpd/lighttpd/0001-mod_dirlisting.patch
new file mode 100644
index 0000000000..8afdc1ecd0
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
+Upstream-Status: Backport [1.4.75]
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
index 7460d3d716..e48fd16514 100644
--- a/meta/recipes-extended/lighttpd/lighttpd_1.4.74.bb
+++ b/meta/recipes-extended/lighttpd/lighttpd_1.4.74.bb
@@ -14,6 +14,7 @@ SRC_URI = "http://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-${PV}.t
            file://index.html.lighttpd \
            file://lighttpd.conf \
            file://lighttpd \
+           file://0001-mod_dirlisting.patch \
            "
 
 SRC_URI[sha256sum] = "5c08736e83088f7e019797159f306e88ec729abe976dc98fb3bed71b9d3e53b5"

