Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C669CC7EE22
	for <webhook@archiver.kernel.org>; Sun, 14 May 2023 16:32:06 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web11.69677.1684081917766085119
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 May 2023 09:31:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=lYjCNoIp;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.169, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-6436e075166so8794622b3a.0
        for <openembedded-core@lists.openembedded.org>; Sun, 14 May 2023 09:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1684081917; x=1686673917;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jdPfFturuwou5luIp7RJvS8layQ9UqruZL/ga6Y7SGU=;
        b=lYjCNoIp2D3uJisMOQ0gaQbj0JEpkiqLS3e4EsvQj2WPntsuepBJW/G5In7H/EOX5l
         TfroHhP63NtkY7jviLZGAb7bRtWkt7JhRge5IWfXw1lW3ZUebNtmPMApP9w7tkB4TCpN
         OZKzwzl3y2xapvX4YYDP6mlBIOpc/ZJpxjG6EifviLjpjao/rcCUyC26QmSUMOVUn/IB
         a3I0CD4MMQsA5TYdHZinjUOJOxIrd2Br/Md36hX9MjFhYtl0XrJto9zzjWDgsnVj0jIm
         4EQsv8lxxBywKGNZM6aAypqhqHkg6KvaZuQaAejMiXZKrS/UqC6bz33CrjiO7bxjNJB3
         SvfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684081917; x=1686673917;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jdPfFturuwou5luIp7RJvS8layQ9UqruZL/ga6Y7SGU=;
        b=UIY4owBjsj11DYYadm5cY+VhTNCNSu7jlzQGYkhvffEqb76PQCmHUKjp6DVyF8wuJs
         etHTEBin9I7P+wDBRk2ouyFapV9+U/xrAN0TycgsUeAtv6KXNE2uq8jeWwVTt07VtSi9
         zwdLWwm4wCnhnIWF1ZtMi8tEMF/OGIBbrCCOybxk5+px46mpNkyQ5f58LY5VpzaZl4b3
         gRO8adX1ilVtAH19804ALwaUcIyenUBfa4rk0infSvs9Rov/Nm3P2FO6TMyYdLKDSNVF
         R6j0p+L3Y7odX2CYjAgUiwlRivcJWogcgnKQsFsQezKSiCeRDuIFQF/itm7iXs4tRtwy
         79Jg==
X-Gm-Message-State: AC+VfDxH3TkiMy0U8yMm1XDVggy0b0GAXWINHQ/ehC1qw5dAjhDj5gci
	f6zlrxcV0BivYTKd32K/LE9vslqaZTnwZrGiKX0=
X-Google-Smtp-Source: ACHHUZ7xiikd8Thz6LjW+SnqSVaAohhs1sfdFGrj4ZtLbU78/fiZjJPlCkD8rp+GQenahHa3+ly5KA==
X-Received: by 2002:a05:6a20:4328:b0:101:1d1d:4396 with SMTP id h40-20020a056a20432800b001011d1d4396mr26949275pzk.2.1684081916704;
        Sun, 14 May 2023 09:31:56 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id x14-20020aa784ce000000b006475f831838sm981877pfn.30.2023.05.14.09.31.55
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 May 2023 09:31:56 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 06/15] gawk: Disable known ptest fails on musl
Date: Sun, 14 May 2023 06:31:31 -1000
Message-Id: <71f515d63aaf6eeb91170c9ee3eb123935a18da8.1684081748.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1684081748.git.steve@sakoman.com>
References: <cover.1684081748.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 14 May 2023 16:32:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181207

From: Khem Raj <raj.khem@gmail.com>

Add needed locale rdeps on musl as well.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
(cherry picked from commit 1e71eaf6792727d2335ee2e2ad4c5ce88137fe77)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/gawk/gawk_5.2.1.bb | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/gawk/gawk_5.2.1.bb b/meta/recipes-extended/gawk/gawk_5.2.1.bb
index e381bad148..bbb26231a1 100644
--- a/meta/recipes-extended/gawk/gawk_5.2.1.bb
+++ b/meta/recipes-extended/gawk/gawk_5.2.1.bb
@@ -62,8 +62,21 @@ do_install_ptest() {
 	rm -f ${D}${PTEST_PATH}/test/timeout.*
 }
 
-RDEPENDS:${PN}-ptest += "make"
+do_install_ptest:append:libc-musl() {
+	# Reported  https://lists.gnu.org/archive/html/bug-gawk/2021-02/msg00005.html
+	rm -f ${D}${PTEST_PATH}/test/clos1way6.*
+	# Needs en_US.UTF-8 but then does not work with musl
+	rm -f ${D}${PTEST_PATH}/test/backsmalls1.*
+	# Needs en_US.UTF-8 but then does not work with musl
+	rm -f ${D}${PTEST_PATH}/test/commas.*
+	# The below two need LANG=C inside the make rule for musl
+	rm -f ${D}${PTEST_PATH}/test/rebt8b1.*
+	rm -f ${D}${PTEST_PATH}/test/regx8bit.*
+}
+
+RDEPENDS:${PN}-ptest += "make locale-base-en-us"
 
-RDEPENDS:${PN}-ptest:append:libc-glibc = " locale-base-en-us locale-base-en-us.iso-8859-1"
+RDEPENDS:${PN}-ptest:append:libc-glibc = " locale-base-en-us.iso-8859-1"
+RDEPENDS:${PN}-ptest:append:libc-musl = " musl-locales"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.34.1


