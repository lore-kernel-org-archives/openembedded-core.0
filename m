Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DACFC43219
	for <webhook@archiver.kernel.org>; Tue,  4 Oct 2022 15:51:48 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
 [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web11.12356.1664898687674186702
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Oct 2022 08:51:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=lvgCxQYt;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.169,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f169.google.com with SMTP id f140so8220688pfa.1
        for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Oct 2022 08:51:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date;
        bh=zLf6wyh6AQyeIf7EDjmy1RUQ/1gPsS9jWVT02yLAa2k=;
        b=lvgCxQYtChMEKbzqI+c+EO61G5BItRMgwKWuCJP5r9ELUVl9+0camxNLZqVPdsuD7L
         xY4zgvR9JTk/v+BqGL22fkXme5w8YZKU4uZbAUIFTmXCb7L7pVvaGmrRG7lcQV5JHwz6
         ccvsytjErER1qG4dvGWgWN95qCTVCfAxmR1MlQhBpIUq2ZFIAl56+LElzHjqCub2Klnr
         ZcUS5+RoeU7mdV9aCfT5t67tHVQgXJp93OOlgc6k5V2AQN+hOuBOUBOh5yyUd34SU1bd
         vmOuMVHhgE4WRMvoOEn4Qwea5jEOnZYFy7MXs3EtYjtrmqUsKKFvxELpHQwGVf4ZPdIa
         f+bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=zLf6wyh6AQyeIf7EDjmy1RUQ/1gPsS9jWVT02yLAa2k=;
        b=MPy+hNFwmSpGTaPmqV+SoLJU3uIOfWrn7BMIn4FEtbbgiomR5pgKUW3PoGu2rWW4sH
         D9UwbwxRKQ1udgofajkjS2ARhFSZMEc8HintBkA4ByVUi+5aON3KFUDrEs40rRRLXMOF
         e2yJOAJQiziEwTSq+DLikVU9+Ykg4fldzWQ2ezLBHk8oTiM9wCPp3GXsPlozMZJOCAT/
         MxzUeS3YbrN5YX+hQ31dNamIt1YXocPWKIWS4qt42xGXqGHEVcaP0WldUDibBiFEFCZX
         yamWJz/7Fmcir4iXpSwlVhUz+caIMNPozD9Ma2+9LzonVq/yunAc5tOMj9hv8igxR1L4
         6FKw==
X-Gm-Message-State: ACrzQf2JQBvdzTqBqWdmEZcjF9pFLg3ytWlw6EXQp1OgvuIhOJolQqnJ
	9nqEnpYYizPccZPQR1sj8ZLL0u9S/vmCUmf8
X-Google-Smtp-Source: 
 AMsMyM4fobreMn61Fmj0DNWzZMTP5FaHgerkRWtTDvnb+YtuFQe7eelWRQSuKMaoV+FdmKeQvvbKNw==
X-Received: by 2002:a63:9149:0:b0:448:9717:d8bc with SMTP id
 l70-20020a639149000000b004489717d8bcmr14374287pge.134.1664898705211;
        Tue, 04 Oct 2022 08:51:45 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 a2-20020aa78e82000000b00561642b6903sm4464266pfr.120.2022.10.04.08.51.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Oct 2022 08:51:44 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 18/18] go: Fix reproducibility failures
Date: Tue,  4 Oct 2022 05:50:47 -1000
Message-Id: 
 <1a62e4a755b1513468f6274ce6791916f5325816.1664898546.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1664898546.git.steve@sakoman.com>
References: <cover.1664898546.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Oct 2022 15:51:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171425

From: Richard Purdie <richard.purdie@linuxfoundation.org>

We're seeing "cmd" static libs being sometimes present and sometimes not.
The issue depends whether BUILD == TARGET so they're present for qemux86-64
on x86-64 hosts but not for qemux86-64 on an aarch64 system.

Add an extra deletion to make the files consistent between the different
hosts.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 6e652835814c389a826ad2d262ee26c14dfb48b5)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/go/go-runtime.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/go/go-runtime.inc b/meta/recipes-devtools/go/go-runtime.inc
index e18339cddb..02601f7992 100644
--- a/meta/recipes-devtools/go/go-runtime.inc
+++ b/meta/recipes-devtools/go/go-runtime.inc
@@ -50,6 +50,8 @@ do_install() {
 	rm -rf ${D}${libdir}/go/pkg/tool
 	rm -rf ${D}${libdir}/go/pkg/obj
 	rm -rf ${D}${libdir}/go/pkg/bootstrap
+	# the cmd directory is built for the native arch so if BUILD == TARGET
+	rm -rf ${D}${libdir}/go/pkg/${BUILD_GOTUPLE}/cmd
 	find src -mindepth 1 -maxdepth 1 -type d | while read srcdir; do
 		cp --preserve=mode,timestamps -R $srcdir ${D}${libdir}/go/src/
 	done
-- 
2.25.1


