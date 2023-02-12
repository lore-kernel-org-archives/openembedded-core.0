Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62BB3C05027
	for <webhook@archiver.kernel.org>; Sun, 12 Feb 2023 21:11:23 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web10.21044.1676236276686690773
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Feb 2023 13:11:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=CdiTFMTr;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.44, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f44.google.com with SMTP id e10-20020a17090a630a00b0022bedd66e6dso15054857pjj.1
        for <openembedded-core@lists.openembedded.org>; Sun, 12 Feb 2023 13:11:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=roCA43hWp7GVnEXR3Gw/JyT2ZLCnTQn+FVuzMiH7H+Q=;
        b=CdiTFMTre60r+xuU7WcXaENewTKhySTHJxajJqr/hoJeMPstuzJ9UUxbwn253++3Ka
         7HrSZ3Ab9l8NzuYeDFkodKU83Eb7v9KgXponCvb7Xgbx2mB0MO3jZ/BzB3cGHbjPiDIR
         wL/Qx7/hVgYNs8WlTlxpRC3s68gMQngmhHmGHGYbb7fZKkpj6xzJU2uWawN2ZWkLlyPT
         H8MlBqH6TNPolIz1Bw8QpK91oJSwq9kqeKDgVqh3Zr88f/TcRdhaWovz5KR2zE1K5J70
         DDmfA0BVkgXH0fPI6TX/FmdZTRI8oUaI4dttT+RjgcqdZJ4mHaOhv1wLTYQC5t7wxbms
         VuKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=roCA43hWp7GVnEXR3Gw/JyT2ZLCnTQn+FVuzMiH7H+Q=;
        b=v6d+gM7mgnxCfz95YEvH+FF12a+rgpCdWwL1t4gdmN1RMEiKqNgBsmNId03ox+FWtK
         yrraaKvddqa/pZsVMraEL9h/QFse/6sKMuifaRJK5ACGsX4kOSOSmMR52b4/a5cMG5U6
         DYxK842AdS4TyBZZpVtk62OM/yxrkypBRLqnKuRazk6nJ/FuWp+fLGgRNgddSYrc2TCq
         igCxNcWlDh0wkWZKKAUKed7budddUcnmulQhSpqRfIH+G8c2RXOy6h8LyYaGSFBN2B1G
         dSjmqwk6HCuQ7jKv+xZnzboK1VCrGF+/oOUwetgH4r/uEBk15q9/Hjn9mi9N2mkmGFXa
         lv8Q==
X-Gm-Message-State: AO0yUKUnl/9kyP+84ZqOqIhY9W91Z/wi4un8/sXYHAsLbH3YfzOMaie9
	HMqlRdQM9VppU+nsnTNs689fo+7m+rSitXcDjzM=
X-Google-Smtp-Source: AK7set/ad8KT0P1XsCZnTE2OfiDSvnz2g+Gv/R1VZhwFx+S3/U7s6S+87WsyXSuNCllyvRGU37S6dw==
X-Received: by 2002:a17:902:d512:b0:198:9e29:cc4f with SMTP id b18-20020a170902d51200b001989e29cc4fmr26019346plg.43.1676236275652;
        Sun, 12 Feb 2023 13:11:15 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id d23-20020a170902b71700b001933b4b1a49sm5675482pls.183.2023.02.12.13.11.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Feb 2023 13:11:15 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 13/27] scons: Pass MAXLINELENGTH to scons invocation
Date: Sun, 12 Feb 2023 11:10:29 -1000
Message-Id: <b0e7777a911e236bda76e90258098057ed355953.1676236110.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1676236110.git.steve@sakoman.com>
References: <cover.1676236110.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Feb 2023 21:11:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177056

From: Khem Raj <raj.khem@gmail.com>

This helps in overcoming a problem when using scons with ccache enabled.
When commands get longer, then it resorts to using response files to do
the operations e.g. @/tmp/tmp96j6icra.lnk when this response file is
inboked by compiler it works ok, however, this does not when ccache is
used to invoke the complilation. We see errors e.g.

ccache @/tmp/tmppsyij_0v.lnk
ccache: error: execute_noreturn of @/tmp/tmppsyij_0v.lnk failed: No such file or directory

Using MAXLINELENGTH setting ensures that we can use ARG_MAX to extend
the length of commandline and hence avoid using response files. This
issue is also reported in mongodb [1]

[1] https://jira.mongodb.org/browse/SERVER-38389

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 29558f6218f4676b459f2c78f82d245339d51c8c)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/scons.bbclass | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/meta/classes/scons.bbclass b/meta/classes/scons.bbclass
index 80f8382107..72422d8884 100644
--- a/meta/classes/scons.bbclass
+++ b/meta/classes/scons.bbclass
@@ -3,11 +3,12 @@ inherit python3native
 DEPENDS += "python3-scons-native"
 
 EXTRA_OESCONS ?= ""
-
+# This value below is derived from $(getconf ARG_MAX)
+SCONS_MAXLINELENGTH ?= "2097152"
 do_configure() {
 	if [ -n "${CONFIGURESTAMPFILE}" -a "${S}" = "${B}" ]; then
 		if [ -e "${CONFIGURESTAMPFILE}" -a "`cat ${CONFIGURESTAMPFILE}`" != "${BB_TASKHASH}" -a "${CLEANBROKEN}" != "1" ]; then
-			${STAGING_BINDIR_NATIVE}/scons --directory=${S} --clean PREFIX=${prefix} prefix=${prefix} ${EXTRA_OESCONS}
+			${STAGING_BINDIR_NATIVE}/scons --directory=${S} --clean PREFIX=${prefix} MAXLINELENGTH=${SCONS_MAXLINELENGTH} prefix=${prefix} ${EXTRA_OESCONS}
 		fi
 
 		mkdir -p `dirname ${CONFIGURESTAMPFILE}`
@@ -16,13 +17,17 @@ do_configure() {
 }
 
 scons_do_compile() {
-	${STAGING_BINDIR_NATIVE}/scons --directory=${S} ${PARALLEL_MAKE} PREFIX=${prefix} prefix=${prefix} ${EXTRA_OESCONS} || \
+	${STAGING_BINDIR_NATIVE}/scons --directory=${S} ${PARALLEL_MAKE} PREFIX=${prefix} prefix=${prefix} MAXLINELENGTH=${SCONS_MAXLINELENGTH} ${EXTRA_OESCONS} || \
 	die "scons build execution failed."
 }
 
 scons_do_install() {
-	${STAGING_BINDIR_NATIVE}/scons --directory=${S} install_root=${D}${prefix} PREFIX=${prefix} prefix=${prefix} ${EXTRA_OESCONS} install || \
+	${STAGING_BINDIR_NATIVE}/scons --directory=${S} install_root=${D}${prefix} PREFIX=${prefix} prefix=${prefix} MAXLINELENGTH=${SCONS_MAXLINELENGTH} ${EXTRA_OESCONS} install || \
 	die "scons install execution failed."
 }
 
+do_configure[vardepsexclude] = "SCONS_MAXLINELENGTH"
+do_compile[vardepsexclude] = "SCONS_MAXLINELENGTH"
+do_install[vardepsexclude] = "SCONS_MAXLINELENGTH"
+
 EXPORT_FUNCTIONS do_compile do_install
-- 
2.34.1


