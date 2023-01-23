Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 923C6C54EB4
	for <webhook@archiver.kernel.org>; Mon, 23 Jan 2023 02:22:46 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web11.34109.1674440563061791401
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Jan 2023 18:22:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=LESY81Pn;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.169, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f169.google.com with SMTP id q9so7955868pgq.5
        for <openembedded-core@lists.openembedded.org>; Sun, 22 Jan 2023 18:22:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LvHZENQ6fLe7D2fhJ5hJuB522YhhU2pIKLPRoqq72D0=;
        b=LESY81PnOF4/PgLGLrKhAOCVOTaoDt71dv6ANdW5XGI23jMqHmaIgJYJJifOTm2K9G
         PkTu3gv5veyQOAZ2zPAVNBL+i5G8GUbti9gOceHpPpy+/lmDD4j/3P9LmodGOmRwB/3/
         GUBFStWEqK6kL+SOm0tmMLfOm90Vo3kuzsFczK6yeBzo7u62PX2UdPggxzJ3aDKAK79x
         zfBFyz/lVe/o9++ECdV5akOkZD/UbBCC0rURK8JNtZcl2porBxBqggxNl/dayAQhXvQk
         ur0nWUJ9oBS8ruj9u+FRcMKh0CMgk3IsfcnPgC7IEaRNnTvkiXx8b21zNaLLUeZqSGKt
         eFgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LvHZENQ6fLe7D2fhJ5hJuB522YhhU2pIKLPRoqq72D0=;
        b=zXqtMZTj4UbKrCcDvuIxiFFO18PELQGcyOW+TVUCD0zxPfNOVv44IWLj1GkIXo+xRj
         FMZvKFPcyYv/yLsMWS6uZy0pJBAekazyUVoIJd+RzeHpDvpDj8ZCeKYf5MLee2viSns9
         m0OCRWUd+n4K4PGKUZ4IUCjjh1rlCV4mcEEgNG6m2HEhOlOIGpgrjP7mwG3J/ePb5DEk
         sdMVn0ph8Aj3iGf3OjElo8YZ3ANNDnfbWJltba3Sr5rmVYtenoiZxRSZb2aOhOYCsqQi
         ad2x8q/0OQbaqJ3BoAW9BpURtV1JAIaDGk9FePfljW/x72PXIruKN4Yaxm87cXSk3bED
         DDeQ==
X-Gm-Message-State: AFqh2kqW3MDHH6ChcAO54bFl4D0124Q9J5OJ5739uMfgKyssBinGsWuG
	Z4FjbhhDQVtX5IGRV6j0fiwerqT8X7BgyY7LEGo=
X-Google-Smtp-Source: AMrXdXsO8AwkOFolvkstHBJTa15LpaqEGKJHERdoxTwMVUsRQ38oe9DL5P5ci4hsK8GnsKOKWp/4/g==
X-Received: by 2002:a62:3181:0:b0:58d:90aa:6039 with SMTP id x123-20020a623181000000b0058d90aa6039mr20158625pfx.32.1674440562091;
        Sun, 22 Jan 2023 18:22:42 -0800 (PST)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id h11-20020a056a00000b00b0058dd9c46a8csm10384222pfk.64.2023.01.22.18.22.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Jan 2023 18:22:41 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 30/32] at: Change when files are copied
Date: Sun, 22 Jan 2023 16:21:24 -1000
Message-Id: <6f44b146f0875c588252b5c3b2015a621eba86ab.1674440376.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1674440376.git.steve@sakoman.com>
References: <cover.1674440376.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Jan 2023 02:22:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176294

From: Saul Wold <Saul.Wold@windriver.com>

The create_spdx code relies on patched code, if files are changed
or added during the do_configure phase they will be missed by the
create_spdx process. So we need to ensure files modifications/additions
happen in the do_patch phase.

Signed-off-by: Saul Wold <saul.wold@windriver.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 227c46fe48b64de7574f7b6b407b8c13be71b392)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/at/at_3.2.5.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/at/at_3.2.5.bb b/meta/recipes-extended/at/at_3.2.5.bb
index 87a436173f..c0c876a644 100644
--- a/meta/recipes-extended/at/at_3.2.5.bb
+++ b/meta/recipes-extended/at/at_3.2.5.bb
@@ -52,8 +52,10 @@ INITSCRIPT_PARAMS = "defaults"
 
 SYSTEMD_SERVICE:${PN} = "atd.service"
 
-do_configure:prepend() {
-	cp -f ${WORKDIR}/posixtm.[ch] ${S}
+do_patch[postfuncs] += "copy_posix_files"
+
+copy_posix_files() {
+    cp -f ${WORKDIR}/posixtm.[ch] ${S}
 }
 
 do_install () {
-- 
2.25.1


