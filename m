Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A04B4C76195
	for <webhook@archiver.kernel.org>; Wed, 15 Mar 2023 14:01:40 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web11.8783.1678888897068752568
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Mar 2023 07:01:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=jZjPTy4v;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.49, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f49.google.com with SMTP id fy10-20020a17090b020a00b0023b4bcf0727so2120458pjb.0
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Mar 2023 07:01:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1678888896;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qsmbh6EKFaYZmnbgw5uteW9NZT6QTiuGKfRxroHN1YM=;
        b=jZjPTy4vtqzLZN55RUW6CmRqOoAq2gS70LjgyzeZ1KU+SQWoQI2PYUksme+Beuvei+
         +sfuBJrez2VyvsZT3NbUIv8AC8CMlvwBcF0h76qanHizmsJ7TXMyWjCiPFpc9xjqP+Dh
         Q/YbZsQqNsVpZOTgNopBrMbWym/abZI7BkP2BAfjOp2BzM2f1knXD/VxQegQD4bWsqhd
         fap4hhlN8/BExlz6K/1QgSFd9ZCl9c72hT7O1RpXK36GrA5MWOILU5Q657/qkH2s7pYt
         Q6qA7LwQeZ+QIcZ6zeAzntKOhQY5gmp3xYVWsssGzXdH5Z1iOjx0OkwPc12k8I6Eup3r
         a1jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678888896;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qsmbh6EKFaYZmnbgw5uteW9NZT6QTiuGKfRxroHN1YM=;
        b=tq/ZDU7QMCyl8/lg0aof+9lqM2yY7XphlebjkmjXHOV/XunvLcH2hM4DIrHdYdwa+i
         4RhgKlXxzuERaottzreYGRkVq2GcNLmckZOK4EDfVTzhFo8Cgy0Cq5pdZgswFQIC/s5l
         LwQSeiHGXqcs9xbwytv8LGN/GQxd1f/aUQYLfXvNDzZaKkJTaurJRXVTlmcTfl7gTrZ/
         e9EGj6xNdpHN80rlqYvbEcVE1MEPn4qcpeRaOXJpI3tBeqm1c79vonEvMEnEDWPHEQXQ
         ynyYyiiJD9cM7EZVmbGETmUG4urV7jnRA/lMOkQ/Rm89I5iiSpZhAxw8k30x5bIbSKec
         gFpg==
X-Gm-Message-State: AO0yUKXjA9qy5Wf7bHHLt/eemVfNKZIT+oDwz2jJ8AiDQeWai2GVB2t+
	bhvhzqVohbVAsEdiiEjL9VDJoDpiPmVgA+ejPSo=
X-Google-Smtp-Source: AK7set/sJKIT6Xs2XmVYMIwQpPzal5D8q6M81pCFAbhaoFVJUFNMabEdV0L1uot+NaLQTLQRkMdwUg==
X-Received: by 2002:a17:903:2448:b0:19c:e046:d906 with SMTP id l8-20020a170903244800b0019ce046d906mr2739495pls.24.1678888896094;
        Wed, 15 Mar 2023 07:01:36 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id h6-20020a170902f54600b001a0432ca99csm3663755plf.269.2023.03.15.07.01.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Mar 2023 07:01:35 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 07/22] libmicrohttpd: upgrade 0.9.75 -> 0.9.76
Date: Wed, 15 Mar 2023 04:00:58 -1000
Message-Id: <017346be6c97d20b1b16d495ee9484f10973857c.1678888649.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1678888649.git.steve@sakoman.com>
References: <cover.1678888649.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Mar 2023 14:01:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178558

From: Narpat Mali <narpat.mali@windriver.com>

Changelog:
============
Fix potential DoS vector in MHD_PostProcessor.(CVE-2023-27371)
Releasing GNU libmicrohttpd 0.9.76 hotfix.

https://github.com/Karlson2k/libmicrohttpd/blob/v0.9.76/ChangeLog

Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../{libmicrohttpd_0.9.75.bb => libmicrohttpd_0.9.76.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libmicrohttpd/{libmicrohttpd_0.9.75.bb => libmicrohttpd_0.9.76.bb} (91%)

diff --git a/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb b/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.76.bb
similarity index 91%
rename from meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb
rename to meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.76.bb
index 9c99af7c91..ad3c34ab9e 100644
--- a/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb
+++ b/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.76.bb
@@ -7,7 +7,7 @@ SECTION = "net"
 DEPENDS = "file"
 
 SRC_URI = "${GNU_MIRROR}/libmicrohttpd/${BPN}-${PV}.tar.gz"
-SRC_URI[sha256sum] = "9278907a6f571b391aab9644fd646a5108ed97311ec66f6359cebbedb0a4e3bb"
+SRC_URI[sha256sum] = "f0b1547b5a42a6c0f724e8e1c1cb5ce9c4c35fb495e7d780b9930d35011ceb4c"
 
 inherit autotools lib_package pkgconfig gettext
 
-- 
2.34.1


