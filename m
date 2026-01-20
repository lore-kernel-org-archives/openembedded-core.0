Return-Path: <fred.w.bacon@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA2EED489BF
	for <webhook@archiver.kernel.org>; Tue, 20 Jan 2026 15:57:57 +0000 (UTC)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9658.1768924676283413800
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Jan 2026 07:57:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aydxg9vn;
 spf=pass (domain: gmail.com, ip: 209.85.222.169, mailfrom: fred.w.bacon@gmail.com)
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-8c6a5c57e01so464174485a.2
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 07:57:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768924675; x=1769529475; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/+NaCe3YQ+ixw1AFS1MsPsS7KmnvLBN+x9jaWrzONs4=;
        b=aydxg9vn0TsYYB4y306FJGDPUx+SYaeXiepRjpFBiRSfm/qPUe7L7kG9k70qo5dvuj
         +Zpa/zD6yV756rGrGp2qKQRxMxphfKvnzVNWGBRzJS/kW6h2AhRoGjHsnhwLxYnPfVUF
         XvnvvGgNPDx1zSgCrFIMReJ8Kthk3OcvWZ0uswMtHr0/UhrDya483X0k0KTx3izjNN6d
         a/LQqVLjrgBz6RbqbT/QFIGKe6Fh+MHYHjIKCfreWO/n6GcuDHecoZ+PWpsRwAWT7Bud
         /SEcxZlfX2aYaLTBol1VkATOBiC7Lmc8SrkDVp9smia1GU9gt9wUE49kx5fMQdNHSZcE
         i/dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768924675; x=1769529475;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/+NaCe3YQ+ixw1AFS1MsPsS7KmnvLBN+x9jaWrzONs4=;
        b=uoc1Py/jyZ6Lc3ZrxNKNPie9YsEKlNBSgFlMmYgVPS0kRQiX/OgtaScYSYVZEYNGZi
         1jxCVLKCVEglHrs/4iTRjQnDYiH3wZVZO6N0ugIIfTSrHFArVeFnqYosskhSLmFpP+n9
         2Bk/au3qK+Nsy+XLRT4zPaV2uW+yAmFlChfhZm7u6cADQOQG99UxXhzi4+amTkf57JNt
         NLhgFqSg4eF9X4gK2ZfyCOYH3C3YrdgFBvkjAGbe9vYPhKzJFhmW0eGr44iTBgpdvXEV
         qctM/mfWq05IUGDdPGKai5weTIpUzKlXQEH/ZQEIoQvbWR3Wbk+X9t24ghXRtGJG1S0l
         xtHg==
X-Gm-Message-State: AOJu0Yzd6U3rNpG4DygZVTSG0PLgpKKtPZ3o6k+FAORYj5nUcxB1vEnQ
	u5cE3Erdq+frumMay5wjDIPxfoREBN+Pr9UFQuhhNu0FtiyIW7qj2dub0cjKFA==
X-Gm-Gg: AY/fxX7wld8+cMVfSZv1aOuJ8rJ/5+S+Krjuxf3aEoOFm8+shOaM/BtWB2PhMrCmxZ8
	heVedRQmLu2MwTObIVQFrlGKpUAk2Mtq4+vlw/qycLJMe+jguyN5Y5rv4OoOzWN0ygu1MpzeWYV
	cbGa3D/AtJ7lcaX2mt6mOC7tCpvVitlNJGUbfdkuuxqEP3ApFwFJRT7rkwVIOFw5XZIPGJM1BiS
	fjTuphkOCGZ/MEJZNxlI3CzOA3YkJ6a0lk3PahQm9X6N4hlObeQzdh6wN+4fLpxqev80hJ0aNkf
	35kVb0jndVE3Jf3H2lgOacGL4RmLigWtmgiQjwZw+NR0sObAmdiPXL27M9PfXOx+/DT0v2Iq7YT
	xzNlSYUjIfhsGWulegRMIpMMYitN6Wr77DBy7BR7mrNmiLhdkTmmc6jVPBwj5K2m+xSnn1ssl0Z
	x0dnvLu54uaL0k/aufAt2dJOETY9GO9FxIzA==
X-Received: by 2002:a05:620a:8a89:b0:8c6:ae3b:e134 with SMTP id af79cd13be357-8c6ae3bef53mr1385337785a.90.1768924674967;
        Tue, 20 Jan 2026 07:57:54 -0800 (PST)
Received: from rl80220dt-bacon.aerodyne.com ([208.211.193.106])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c6a72602f3sm1059103985a.40.2026.01.20.07.57.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 07:57:54 -0800 (PST)
From: fred.w.bacon@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Fred Bacon <fred.w.bacon@gmail.com>,
	Fred Bacon <bacon@aerodyne.com>
Subject: [scarthgap][PATCH 1/1] lighttpd: Fix trailing slash on files in mod_dirlisting
Date: Tue, 20 Jan 2026 10:57:48 -0500
Message-ID: <20260120155748.32482-2-fred.w.bacon@gmail.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <20260120155748.32482-1-fred.w.bacon@gmail.com>
References: <20260120155748.32482-1-fred.w.bacon@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 15:57:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229742

From: Fred Bacon <fred.w.bacon@gmail.com>

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

