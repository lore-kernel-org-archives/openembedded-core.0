Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8578BC636D7
	for <webhook@archiver.kernel.org>; Tue, 21 Feb 2023 14:41:47 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web11.44244.1676990503172685682
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Feb 2023 06:41:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=Wl34nTsp;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.171, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f171.google.com with SMTP id c32so2530027pgc.7
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Feb 2023 06:41:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/0Un6lUx0ZcotAQixy1TT+GjXgIoNemwkGdskbH6Jcs=;
        b=Wl34nTspBxbYvkkphM0UJ83+/Ic4qa09mv8nMiOJHmimh7ykpAkNEmAHhuoHZ4eekN
         eRrh7PI76FRPAaZjePqE36zqN4uectUtU5L5+8YbJaYh3dB3N9txQK8c2gILS2Vz3XWO
         MspVXk9FdT+hEdGjxnZ7pQQkCzAca/JqBcq6QAepQs7vcO7z8yQt2EtyrENe8GUfNQ+t
         MOmpXw/xFT0dAEDOdbqVkqDjrrBFbYd3wgwhhpIAVLBS4j1wRTvBKaTnZg6KEqyU6IHH
         S95RjhsxxIENPHa5nO1ynQ2KyLUoBjW6TTIHo5/keoyQM5H2OfCP7xXOHKN4QtYfP4CF
         Ynpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/0Un6lUx0ZcotAQixy1TT+GjXgIoNemwkGdskbH6Jcs=;
        b=tneM5COEEY6f7GpIXr6QkpoEmClDUzKTBfR0vAMRj+vaP+qfRRFt0pXRAtFE23U2+4
         6c6jVVmgmjwFV1DHVWxLMrjyPcbPTLpSRdm1zT32CgEKIn47sHFiM+OkP09YgLELBRcJ
         HM4/VL23jAVar1eSYYy/fCHAi+vD9U8EX2q1tI49svDstWzuIxntOiIKcENWmt306s2H
         +TAISPPQP7LJDnyMlm1AG1D5SGHqHKn7XpS0eGB8d6I6hgBSgkUQrdUYUA7D4A4/WXuv
         aHQEfzeUOQDGqZlLUhkeOEdmJ00u7++TeqKp4jB5CCTK8Z3onK4HjYJ6nRoFmp2aNm1S
         Ro6Q==
X-Gm-Message-State: AO0yUKUQNGP7D4R0lp+4cjzA5w+75JpBYmwo4b5qlZcJp/SlZ6PNOArT
	nMpUKKfoX8iatyEpAA5elSnIpVkdF+HTXIV+OcE=
X-Google-Smtp-Source: AK7set+f8u/SkRYHHq3mRTgYmtRTxQK/INAiTyMGfnkerHx84pHpSYAVGK5LjvrwtuxrqUsC0a5rFQ==
X-Received: by 2002:a05:6a00:18a9:b0:594:1f1c:3d3b with SMTP id x41-20020a056a0018a900b005941f1c3d3bmr7354540pfh.16.1676990502148;
        Tue, 21 Feb 2023 06:41:42 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id h5-20020a62b405000000b005ae8e94b0d5sm6151140pfn.107.2023.02.21.06.41.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Feb 2023 06:41:41 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 15/23] image.bbclass: print all QA functions exceptions
Date: Tue, 21 Feb 2023 04:40:58 -1000
Message-Id: <6c53d8d8c88fb06b19fbf5bdd754960b21531074.1676990336.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1676990336.git.steve@sakoman.com>
References: <cover.1676990336.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Feb 2023 14:41:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177515

From: Mauro Queiros <maurofrqueiros@gmail.com>

For the QA checks in `image.bbclass`, all exceptions
other than `oe.utils.ImageQAFailed` always print the
following generic message:
"Image QA function func_name failed"

This can be very misleading, as it may hide
python syntax errors and other kind of issues that are
hard to detect without more explicit error messages.

This change makes sure that the error message of all
exceptions are displayed.

Before this change:
 "Image QA function func_name failed"

After this change:
 "Image QA function func_name failed: f-string: empty expression not allowed (<string>, line 13)"

Signed-off-by: Mauro Queiros <maurofrqueiros@gmail.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 3d85b30d8704d38b86f5b006748cebc74bd2a4fa)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/image.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index aa14ea2316..00413d56d1 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -313,7 +313,7 @@ fakeroot python do_image_qa () {
         except oe.utils.ImageQAFailed as e:
             qamsg = qamsg + '\tImage QA function %s failed: %s\n' % (e.name, e.description)
         except Exception as e:
-            qamsg = qamsg + '\tImage QA function %s failed\n' % cmd
+            qamsg = qamsg + '\tImage QA function %s failed: %s\n' % (cmd, e)
 
     if qamsg:
         imgname = d.getVar('IMAGE_NAME')
-- 
2.34.1


