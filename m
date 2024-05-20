Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51B66C25B7B
	for <webhook@archiver.kernel.org>; Mon, 20 May 2024 13:33:56 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web10.60343.1716212032784673109
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 May 2024 06:33:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=YHkp5Ikd;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.182, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1f2ecea41deso66245145ad.1
        for <openembedded-core@lists.openembedded.org>; Mon, 20 May 2024 06:33:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1716212032; x=1716816832; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nD+iJ0eiDicS1+UQJE1ZILHWB43vWdhgs48rfhT18zM=;
        b=YHkp5IkdsJ6gzaGyPXCqUcHtipAxivvpxjfi/O8bbrd1kkPg1DNKfUzTFPMvsnD+8L
         1Bn3dm3f3gABbUSdgpPFHgNL2xd9/xpT1VAbigj/AJKvCKtvJtNOoRGWkus65vkDF2oE
         38GKJ9z11HdcXqm/iRHUEYg0+4W3EjXpZZ3MQudnvUpKoN1lH6wmAbzBv1DstZqIj0tK
         nfxPJDjJiaqdLe63PKyQIUll4FASbxoFlWeny+QfpDuCKj1nFMEFnloMSfDRr6isQ4x4
         PsOkUge+DBDkb3lGwfiGh9laU7E6DnmmABlrlMDMJSKNy6x98XEhgGCt6q3PFygIYJ7o
         Jjmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716212032; x=1716816832;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nD+iJ0eiDicS1+UQJE1ZILHWB43vWdhgs48rfhT18zM=;
        b=jKrlXT4MsrRnWd3rdvp3HiQmUBWVsGyEyPOYOJzvuOubsOZBpTFyw+VJVIdboIGxVF
         e6oe3ZtZtf9y6xgXaBq66P/0smx9l0YubN3CIsk0wWJAWtfmny7n0YvAjSKUJE704T/r
         S8t6SGZuPCMZNC4vxPvnbZsXt4sEg05H33WxHtQKxTgEJDhfZreoDZ4OGbDJZevhzS9u
         BPdKuZtC9nRthGC49ZDO+toRTFbKoioJBjnrKK68CElu8XaIvkmvoSJAZq3vXfkOTFMd
         LcHxPMAM/ogThTepaPaSMxJmlC6NCZ8T6rMqe2NfeU9ULw92G5dy/izRWIIIvOPTQvuq
         N6rQ==
X-Gm-Message-State: AOJu0YzdJqufgQqtHbRzRfEp2G3CH30ejQ8Y5ZK96yBjp1J9pDdUd/ni
	mjqENOdtTPGmnRbjAN/ANk5DA/tN80SkUJyUdHIXLf0nctt9xZ1ytFsKH+FrlhraKb3FcZ3+6xg
	h
X-Google-Smtp-Source: AGHT+IHgP1HwvuvGfqKz/3q9QZqCZYbueSKmZLfzHRFHKSFSPgdZCdtWJQrVVoxE05V5S5DAJxNWaA==
X-Received: by 2002:a05:6a00:92a0:b0:6f0:c828:8e0b with SMTP id d2e1a72fcca58-6f4e0297e33mr40299279b3a.7.1716212032101;
        Mon, 20 May 2024 06:33:52 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f4d2a66621sm19671465b3a.13.2024.05.20.06.33.51
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 May 2024 06:33:51 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 10/21] uboot-sign: fix loop in do_uboot_assemble_fitimage
Date: Mon, 20 May 2024 06:33:21 -0700
Message-Id: <0862abfede2680ff8d67c5e9ece2017f594cb8a1.1716211838.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1716211838.git.steve@sakoman.com>
References: <cover.1716211838.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 May 2024 13:33:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199581

From: Ralph Siemsen <ralph.siemsen@linaro.org>

When using multiple u-boot configurations in UBOOT_CONFIG, the helper
function uboot_assemble_fitimage_helper() was not called with all
combinations of type & binary, due to a copy-n-paste indexing error.

Signed-off-by: Ralph Siemsen <ralph.siemsen@linaro.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 2d338548a4b745a71eaf6c29231adc93c4165778)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes-recipe/uboot-sign.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/uboot-sign.bbclass b/meta/classes-recipe/uboot-sign.bbclass
index 7a0b8047e4..c8e097f2f2 100644
--- a/meta/classes-recipe/uboot-sign.bbclass
+++ b/meta/classes-recipe/uboot-sign.bbclass
@@ -367,7 +367,7 @@ do_uboot_assemble_fitimage() {
 			done
 
 			for binary in ${UBOOT_BINARIES}; do
-				k=$(expr $j + 1);
+				k=$(expr $k + 1);
 				if [ $k -eq $i ]; then
 					break;
 				fi
-- 
2.34.1


