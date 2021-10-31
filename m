Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FBA9C433EF
	for <webhook@archiver.kernel.org>; Sun, 31 Oct 2021 16:58:19 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
 [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web11.32829.1635699498344350027
 for <openembedded-core@lists.openembedded.org>;
 Sun, 31 Oct 2021 09:58:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=yjnnjDtt;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.53,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f53.google.com with SMTP id om14so10594826pjb.5
        for <openembedded-core@lists.openembedded.org>;
 Sun, 31 Oct 2021 09:58:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=meTbud7z4q9QJjZ9UxTyUaOBNjN55a2fI4ohFoAHkgA=;
        b=yjnnjDtt7vNdHD1qnwJmNUyCSoXHA2M2LfcymJj9fFQDgxUpQ+xNlDvoWErM8dND7m
         +GYHoCCiFYZxkoOp64JpHCeQeRar27nnukd/b4sTIosGJRdT7I+aCM5lwMbWiLfuARRm
         +oW3Uz1+CdOXkKf0ivWHR42VoWnPFQSZUmwXMyAP5bKp1LaW1vRPIbaeEeGYfxo94TTN
         9bXEVlO1O99KJ/27NP+m6B0c5pOGD5ZCUhOdT5aKlUVcWnX5kIpKg2nLOitagMskg/9X
         iQ25pia5KHTUevcdrhZuGFWJZsAboBoqafHJRht6mYJxIzMKYKj9LppOvVTdSdmDhE+Q
         0pLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=meTbud7z4q9QJjZ9UxTyUaOBNjN55a2fI4ohFoAHkgA=;
        b=YPYgBH0ycSaJTZFW6V7g3of4peh+l1vas/OKntayrRLifPzNvNv4/TukCxcOFP3b56
         jvbDIbK98qaAiPN2f6hH/M4PllE05OW5bgYQ7D8zYRvDxEplPoGqwqg5uRMdwuJtuHnO
         f9srZNbN8agkEhFbdG4kJcv8nTqaW6dfXTnOnJXQs6COwsOy6DKhwJCc21PF7csW1eoF
         EQSEsHdM+pamr2NAE5/MfmxUFzG/rYbOYyA7kL7ndsYATKeu9yVAHcHb3nGGG0UMR7cg
         te/yD8MPed1E7mgcItgbOVBh3t/fXANw6LXL5x3e9rgMN+yd/Rl89smx2w51hKAhdyYb
         tOog==
X-Gm-Message-State: AOAM533BLnXspJd3Tg2uPI2vKeY/eaXWbzBlpFFQ0XeisO+7qdjZlmLu
	5COaAx+8h2aK9sh1bXVjEnCEgRkk6obr06S5tJc=
X-Google-Smtp-Source: 
 ABdhPJy2JpPq3Qf3RtsNj2rmtfSY93wDFki1dJqFV8TgaQ54nMBPgsHMZBobRARaPh2+MOHEkwE3VQ==
X-Received: by 2002:a17:90a:5d09:: with SMTP id
 s9mr32632964pji.163.1635699497448;
        Sun, 31 Oct 2021 09:58:17 -0700 (PDT)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 s21sm13476617pfk.175.2021.10.31.09.58.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Oct 2021 09:58:17 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 08/29] bitbake.conf: Add gpg-agent as a host tool
Date: Sun, 31 Oct 2021 06:57:27 -1000
Message-Id: 
 <f9649bca64771e845a74475b621a3c91ca0a6901.1635699172.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1635699172.git.steve@sakoman.com>
References: <cover.1635699172.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 31 Oct 2021 16:58:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157666

From: Daniel McGregor <daniel.mcgregor@vecima.com>

If gpg is used, it will find the first gpg agent in the path, this
may lead to issues where gpg comes from the host, and the agent
comes from a gnupg-native due to package signing. The versions
being out of sync causes gpg to fail.

Signed-off-by: Daniel McGregor <daniel.mcgregor@vecima.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 2b59fb9d52a405a32a1d069d4c5320b72fbd35ce)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/conf/bitbake.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index f442a6593a..91f003d6dd 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -502,7 +502,7 @@ HOSTTOOLS += " \
 HOSTTOOLS += "${@'ip ping ps scp ssh stty' if (bb.utils.contains_any('IMAGE_CLASSES', 'testimage testsdk', True, False, d) or any(x in (d.getVar("BBINCLUDED") or "") for x in ["testimage.bbclass", "testsdk.bbclass"])) else ''}"
 
 # Link to these if present
-HOSTTOOLS_NONFATAL += "aws gcc-ar gpg ld.bfd ld.gold nc pigz sftp socat ssh sudo"
+HOSTTOOLS_NONFATAL += "aws gcc-ar gpg gpg-agent ld.bfd ld.gold nc pigz sftp socat ssh sudo"
 
 # Temporary add few more detected in bitbake world
 HOSTTOOLS_NONFATAL += "join nl size yes zcat"
-- 
2.25.1


