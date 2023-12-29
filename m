Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 651BDC4707B
	for <webhook@archiver.kernel.org>; Fri, 29 Dec 2023 15:45:58 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web11.151026.1703864752559275420
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Dec 2023 07:45:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=sUCU19Ov;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.172, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1d41bb4da91so20482705ad.0
        for <openembedded-core@lists.openembedded.org>; Fri, 29 Dec 2023 07:45:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1703864752; x=1704469552; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6STXqr9iHvIrZrzkNoIjWH3+KkBRWb4K/IrG+cvBPTE=;
        b=sUCU19Ov2YMcCy1wL+RrP2ul7NYl1WVQkpaELA0lvHvvBeXuFyC4FqE9tTop2MOSDW
         0EbJXuvXH+49NAAiGdLidbgQ8A8MHwdi0xSD1Tr6ojK1D8UAEiQgOCEeaykkFhDKAyDZ
         bFkqzXIRKXXZRZRmhuKRltjfQO3TkoaCZLm6mf1sZ0Ly8cEzWvxqfYMtxa14SHtV1srB
         H6PVXnZ2XhKcfCVK6cwtmIAw1vpIefLanRKkKpi28LB2iCcO2dK/G/4NnMc0b41GHtUC
         vKl4lnppmdwbhABhOghgnUBqEvYfh1hadbBPwrdmH/qfXaAcRblo7pGtQ+Y8P2mXOe4+
         RDFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703864752; x=1704469552;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6STXqr9iHvIrZrzkNoIjWH3+KkBRWb4K/IrG+cvBPTE=;
        b=icU1o1jlA2FH851JClw0Q24vsVQkVds635A7bvYtEZvHBvAceXWbOvYxWPAMue1SLk
         NJdZMN6jZFOAXsLii7kX9fjRB3Um3Ta98y5uO6eGsmkh/sENEEMQilFB33yhJmiWvIep
         LmJYDG+VbF9kJTCa7R6q/oTPKr/IMYfCnt4Cy+4G0cmT9R1vgbtoAIXIUIcH1nDEFEfh
         0FajBQ/CqxJCpxVDV/m84oUhmlDr1xgd5v7eOUvMXVBOTqBVj+8u0fv9mxwmxKnTpHgs
         7MGaLhRG77CaEBmycHh9ZKZaNgbqrAtZZwrEjKH8mUUFRh9ji+qdSwScz+IDVtnNqedV
         b6QA==
X-Gm-Message-State: AOJu0Yw1H2eePPqqQqSofC1RJ+MKinGjNYFuwk4yOs/EDhaU6+plBKq9
	ws6xKZKLKJtATGrJIOxLANnbmeS1v68Dx5HKcvxHG52J3T8Myw==
X-Google-Smtp-Source: AGHT+IFPn5gSP/2UPGh2bM078CgFttn7DxSRG+oYiH6q+S26Rgr975TDdlTX5IAqzht5APrUsudPhw==
X-Received: by 2002:a17:902:d503:b0:1d4:46ff:f421 with SMTP id b3-20020a170902d50300b001d446fff421mr4388088plg.122.1703864751766;
        Fri, 29 Dec 2023 07:45:51 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id jm7-20020a17090304c700b001d3e6f58e5esm15772705plb.6.2023.12.29.07.45.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Dec 2023 07:45:51 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 26/41] useradd_base: Fix sed command line for passwd-expire
Date: Fri, 29 Dec 2023 05:44:40 -1000
Message-Id: <67721b71bf677097645b9150a31ac833125c0c23.1703864512.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1703864512.git.steve@sakoman.com>
References: <cover.1703864512.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Dec 2023 15:45:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193043

From: Adam Johnston <adam.johnston@arm.com>

A previous commit tried to add the --follow-symlinks option to
the perform_passwd_expire function in useradd_base.bbclass, however it used
a single -.

This is interpreted as --file=ollow-symlinks which results in...

sed: couldn't open file ollow-symlinks: No such file or directory

and...

ERROR: <image name>: passwd --expire operation did not succeed.

Fix by adding the missing -

Signed-off-by:  Adam Johnston <adam.johnston@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 3c0deafcfcea3f610c7dd9a2d2884a16fbfe0497)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/useradd_base.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/useradd_base.bbclass b/meta/classes/useradd_base.bbclass
index f1a7a9695d..5e1c699118 100644
--- a/meta/classes/useradd_base.bbclass
+++ b/meta/classes/useradd_base.bbclass
@@ -160,7 +160,7 @@ perform_passwd_expire () {
 	local username=`echo "$opts" | awk '{ print $NF }'`
 	local user_exists="`grep "^$username:" $rootdir/etc/passwd || true`"
 	if test "x$user_exists" != "x"; then
-		eval flock -x $rootdir${sysconfdir} -c \"$PSEUDO sed -follow-symlinks -i \''s/^\('$username':[^:]*\):[^:]*:/\1:0:/'\' $rootdir/etc/shadow \" || true
+		eval flock -x $rootdir${sysconfdir} -c \"$PSEUDO sed --follow-symlinks -i \''s/^\('$username':[^:]*\):[^:]*:/\1:0:/'\' $rootdir/etc/shadow \" || true
 		local passwd_lastchanged="`grep "^$username:" $rootdir/etc/shadow | cut -d: -f3`"
 		if test "x$passwd_lastchanged" != "x0"; then
 			bbfatal "${PN}: passwd --expire operation did not succeed."
-- 
2.34.1


