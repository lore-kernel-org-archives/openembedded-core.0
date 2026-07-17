Return-Path: <michalwsieron@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6B43C44516
	for <webhook@archiver.kernel.org>; Fri, 17 Jul 2026 12:54:18 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12717.1784292853920656550
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Jul 2026 05:54:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=eVLuufaY;
 spf=pass (domain: gmail.com, ip: 209.85.208.42, mailfrom: michalwsieron@gmail.com)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-698e5859a3cso3548353a12.0
        for <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2026 05:54:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784292852; x=1784897652; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=27Uq1c8QUTbNu7F27lqurTGRTe/vERORHyfzt2Wms1M=;
        b=eVLuufaYCQa3cvzvvQJzJpig1CpVLqV0/AMrw02FvpT8U44/p6PjiMorPgu1Mpng3u
         GHUb0JeCeXA62/TFJua0/FsAoMoh/S40u2BEDgrWMQrCelET4VBsm9tVXAQk/QWFN3At
         BOnCC3y/V+6u34fcuYnpJ/EgpNtN/wrLc+i0EKvqBAwq+1A8sYGrBIw3LAPk5APqbo70
         pJMaa7vlNwZFFcxQrG9rT2ED9SCV0gLlEMWX+ILAIPY3EJUf7Pr0bcfABTXj87yI4w9o
         93+DsM2pwmlJJLBFBh1mMUWDNkhHIJeYwaeDMjeo4TiK4Esx1KK3paAO1pRjDxR3cjm3
         /YbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784292852; x=1784897652;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=27Uq1c8QUTbNu7F27lqurTGRTe/vERORHyfzt2Wms1M=;
        b=aAxODXM7w6+gmjOYBCB+I33Cs/18IQc1TbQT0XFb5w5VhNXaFH+FL7uFuBrcep5MG4
         DudipxDQMUSJdBzc5qsyDgbkjkFtBxZvfxcWex41md1yth6ydzTflcQHgLbnKR3iBq43
         U51qVc3/lOPIOh9fdYzFEU/O3P3XaXVrYv680R1RIcX3JF8GPXLarFtTvQzb3QVRjO7H
         1HN+G6FzwqXKS12gZXgcv8lGDux4M5kUlVhtq/fb+A7P3vzPatrgEtW8lnJUr03W4jol
         CPucOoTB/UDAVHTo01Zq7Ux8ZANQY8P3xGc4Zowy5bd7QDLe8IdgINxNQhiT8YNW0r5p
         fhVA==
X-Gm-Message-State: AOJu0YzxFAwTcWEywL43pjnsLOJ/EtwoFO+oGE4jDKsUFXnK6BAteK4B
	0IRrDik52xidoM+5jCYbleajX3NN3ep+IXlxwnS9cI2WdPpJMqkkg6aufK/q3w==
X-Gm-Gg: AfdE7cn7LTkrddVg4phbfMCH6pxhBZCVXgzfhQ7ZfoDISXdJ7irB6FDpAxeAxG6VTRu
	Jfhig5EbawzhpXxUXQ04h0CfqoDhQebxbLylTuzuTomfu1gLIvuc9Vy9DSdC+KLqX50nVeemcSh
	ct1ruMgNg5KguYfuZIT6hTJq3Xjef8FC2FoTy7wr8jXMDQHcOLpkT0RTpdYGycNXwlhDWWrusne
	Cf/1iZF92dR43c42k04BQ6r4pLNJKSSsmWPqorx27rUwOzdeVEHm8iwnqCtTctMpIev6KnIO7po
	o6mK/mdA27S2aCJx3lM47fx7QpXHA69oJ7OFfegXRcOjuOsvk9fHD+nXFsafQH0FpE+DQxbZKU3
	qSktcnRmUHGhvkegskJGE/8g4eDpz+Z04enzOr+Lw07rsZK4rhD6AjH86N2HE7u8I2Wu/GbxP39
	cGS0Q2ySlX0Lcb225grze6nkrRQ2+ZoaL0vNVR7LcqkjLzkFGXJkv2
X-Received: by 2002:a05:6402:380e:b0:697:dc30:8fbf with SMTP id 4fb4d7f45d1cf-69e64dce810mr1101384a12.6.1784292851828;
        Fri, 17 Jul 2026 05:54:11 -0700 (PDT)
Received: from [127.0.1.1] (185-164-140-173.cgnat.inetia.pl. [185.164.140.173])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69e6ffbbf4dsm618199a12.16.2026.07.17.05.54.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 05:54:11 -0700 (PDT)
From: Michal Sieron <michalwsieron@gmail.com>
Date: Fri, 17 Jul 2026 14:53:53 +0200
Subject: [PATCH 1/4] rpcbind: Drop dependency on quota
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260717-rpcbind-quota-dep-v1-1-55bc86f09e41@gmail.com>
References: <20260717-rpcbind-quota-dep-v1-0-55bc86f09e41@gmail.com>
In-Reply-To: <20260717-rpcbind-quota-dep-v1-0-55bc86f09e41@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Michal Sieron <michalwsieron@gmail.com>
X-Mailer: b4 0.15.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2026 12:54:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241172

Originally added to provide rpcsvc/rquota.h header [1], it is no longer
needed since at least v1.2.6 where [2] was merged.
Not sure why, but distros like Arch and Ubuntu (possibly others too) did
not have this dependency at any point from what I could find.
Anyway, this builds just fine without quota present.

[1]: https://git.openembedded.org/openembedded-core/commit/?h=4771f4af5926d724958ba7cf46b937c53babfc7c
[2]: git://linux-nfs.org/~steved/rpcbind
     8bf0ce4a1858b5cd00440e416ecfe0fd74662a01
     rpcbind: always use inline rpcsvc constants

Signed-off-by: Michal Sieron <michalwsieron@gmail.com>
---
 meta/recipes-extended/rpcbind/rpcbind_1.2.9.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/rpcbind/rpcbind_1.2.9.bb b/meta/recipes-extended/rpcbind/rpcbind_1.2.9.bb
index 692c421cd9..000ffe3704 100644
--- a/meta/recipes-extended/rpcbind/rpcbind_1.2.9.bb
+++ b/meta/recipes-extended/rpcbind/rpcbind_1.2.9.bb
@@ -4,7 +4,7 @@ DESCRIPTION = "The rpcbind utility is a server that converts RPC \
 SECTION = "console/network"
 HOMEPAGE = "http://sourceforge.net/projects/rpcbind/"
 BUGTRACKER = "http://sourceforge.net/tracker/?group_id=201237&atid=976751"
-DEPENDS = "libtirpc quota"
+DEPENDS = "libtirpc"
 
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b46486e4c4a416602693a711bb5bfa39 \

-- 
2.43.0


