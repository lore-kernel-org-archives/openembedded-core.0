Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73363C2FC0F
	for <webhook@archiver.kernel.org>; Thu, 17 Aug 2023 02:50:26 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web10.178872.1692240620878145835
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Aug 2023 19:50:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=0b/oWzrX;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.170, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1bf1935f6c2so303915ad.1
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Aug 2023 19:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1692240620; x=1692845420;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=omK6XyEFiySa5gphkQSO8qk5UCXr3Gnbh1P/x/5UCAk=;
        b=0b/oWzrX+KRtXDI4Chfnxxdn8h5GpUFeXVo4xRG6Hby8z+i6s7dRLsdQ0yVY/Kgss1
         nXSs1gxXfJwdKxscidVDSyVn+7AOuSB8siGYdjsQtmM9rNf0KxSZzkTCADBEkFPKot9m
         oIzucRyTkCZwBI7f+OvfMRu1G9vw7GzxNJPutO7DAyI86NALkZpd6CqlhL0IB7HDHiYk
         MHQudsk4VZ+i61bIif712b0nMN6SG8YldgfnfC65Vr9uD4kmKV4DW2HvIU+tt9Fg4+Ag
         TxdyZA0BvGnPtFGBoqNuZfNUUSZbL/hNTgeRKmIIjQcbknoyuSVH+JG3B0D6lBQ13WUt
         2xBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692240620; x=1692845420;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=omK6XyEFiySa5gphkQSO8qk5UCXr3Gnbh1P/x/5UCAk=;
        b=NF4LA7k1WVZI5emsT4AD7f3xYZ0NS8NP+xSf4RHyyA7K9rxFzTl/mmtqI2HzXoMWLP
         haIZD/S8ahosNSlt6zVivE9HUd449ljpildS0pvWPSQarRClDNk/Kjbz+pbFo/7fTyiQ
         Snb0h2jv06M3tNPPkgkPcgq2sX9dKz7BowmqT4WRuTaBqmw1PBk/cW/vMJUye04qjqee
         XDtj2kJt+ROYtHF5EvL8SbcYRHxjigCRn9djBffHOryBjCWXIbSXpXmW0sCx0jObv7Yv
         LZGY/z5VJbK0olJb0oPPyM65KREy0kPU+Lcf6Xz0deq87xctbxVAN/dZ167niW/qyc5T
         P7iw==
X-Gm-Message-State: AOJu0Yw/0MfeHnxPWBX4MNTkvcm+KJN/c7SxzEmA3fxOCSMmmI4wzWjk
	oSw+KCGGqa0OWxR4YIrlOjS2tbUexjzST4DK2nw=
X-Google-Smtp-Source: AGHT+IGhZ6zs8JwueMQaee+kgNRWP2kjKtalgjc4+RmZYUr+Dmfh1KZLUEgwc+c0/mGi3gz2qGV9Dg==
X-Received: by 2002:a17:902:ec90:b0:1b8:6245:1235 with SMTP id x16-20020a170902ec9000b001b862451235mr1730943plg.13.1692240619994;
        Wed, 16 Aug 2023 19:50:19 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id o5-20020a170902d4c500b001bb9bc8d232sm13827594plg.61.2023.08.16.19.50.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Aug 2023 19:50:19 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 13/16] npm.bbclass: avoid DeprecationWarning with new python
Date: Wed, 16 Aug 2023 16:49:45 -1000
Message-Id: <a7078ff976ba720f25e94ddeddd3f82900b483be.1692239433.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1692239433.git.steve@sakoman.com>
References: <cover.1692239433.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Aug 2023 02:50:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186278

From: Martin Jansa <martin.jansa@gmail.com>

meta/classes-recipe/npm.bbclass:85: DeprecationWarning: invalid escape sequence '\.'
  '--transform', 's,^\./,package/,',

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/npm.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/npm.bbclass b/meta/classes/npm.bbclass
index 8379c7b988..45e6b4fac7 100644
--- a/meta/classes/npm.bbclass
+++ b/meta/classes/npm.bbclass
@@ -82,7 +82,7 @@ def npm_pack(env, srcdir, workdir):
     subprocess.run(['tar', 'czf', tarball,
                     '--exclude', './node-modules',
                     '--exclude-vcs',
-                    '--transform', 's,^\./,package/,',
+                    '--transform', r's,^\./,package/,',
                     '--mtime', '1985-10-26T08:15:00.000Z',
                     '.'],
                    check = True, cwd = srcdir)
-- 
2.34.1


