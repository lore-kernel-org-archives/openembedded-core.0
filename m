Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B363C41513
	for <webhook@archiver.kernel.org>; Tue, 30 Apr 2024 21:24:28 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web11.264.1714512267956600402
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Apr 2024 14:24:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=ABv7V+5o;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.171, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1eb66b6953cso30798405ad.2
        for <openembedded-core@lists.openembedded.org>; Tue, 30 Apr 2024 14:24:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1714512267; x=1715117067; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5GyJgsgk6Jj3H2cPy2TqWsU7AhEFylHV2/ZkN0+vq3c=;
        b=ABv7V+5o9W3fC8/7IO/f7Io0nZczM/yVjJDSENFx/0AJkubXSXOYh/hBbI5rBjyRZu
         ejyaolUCZIkrZoEx3WN+Y0z2ml5n+8tXWjy9To/oqNFBfergHtTfhIGsYyW7Wa1iiqyk
         OuR42XtYwvexUzWdwxTsdaIjTk565lZQf/Ly79suCW9gJML9LkLBCyUdY5fd8xzBdyx+
         8KMX3JjQrzfoUv6BJiQGC09+XakU4gv6b2J/6tVssXKwoklx8MSvvVRVzly/I03aGytv
         pURiSt8wdxDPPA9q541w/DyAcriTolptwufTUsHchC4t3Y8TTyNsVJCleplOHlac2L94
         gjJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714512267; x=1715117067;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5GyJgsgk6Jj3H2cPy2TqWsU7AhEFylHV2/ZkN0+vq3c=;
        b=DGjmV8/ajwPbosNaW461J8pBOWNNOAd3OlH15vmMVRytOj8C2M5a27yE+eQ2bBghiY
         HhraWRscXvuoF0XlZNkpusAQXgHvQjcWAgDyeHJbWouApjO+2GXwTbJm7urnvJCB56gQ
         LO+Q+CtRHxkd856QD1sfA8S6N4QojF5sI4d1n/Jo8SYM4SllCutG3/0jiAfrXQJe5gAV
         8CqZ5MLE+5ru5CtlgzU4y/W5/sD9wkcMqJyjHoUl7CaC+1+BYmf6mhmQ6LgfoLkdxt4M
         WmLYjsvMHMJ0/TG3fCRw7g+95aXlp9s+eV8JxEYm2DGvZtUZRupop2Qa8RwdQyF2WryZ
         ZlEw==
X-Gm-Message-State: AOJu0Yz5eAo4A9XizxsI9ezhOj8DziJwuRDf6Iaou3y7vrNRm/eAUTTH
	PBRr9zRZ0ljov4RVH40ZoyTkSCCCd6oe+Qz/B05ufyMyqK7XHAxyw0fnaBTjp09R92e4nxAKGwJ
	ciAk=
X-Google-Smtp-Source: AGHT+IFB+K9h/B8CTV80Dl57OQYAN9WXt41LVgME/c05reqrYkL2vGkvEvbj14AER46FXZh5qRnzNw==
X-Received: by 2002:a17:903:234e:b0:1e2:3e1e:3d9 with SMTP id c14-20020a170903234e00b001e23e1e03d9mr726208plh.63.1714512267275;
        Tue, 30 Apr 2024 14:24:27 -0700 (PDT)
Received: from xps13.. ([209.237.67.158])
        by smtp.gmail.com with ESMTPSA id l8-20020a170903244800b001ea9580e6a0sm11193133pls.20.2024.04.30.14.24.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Apr 2024 14:24:27 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 09/17] libxml2: upgrade 2.12.5 -> 2.12.6
Date: Tue, 30 Apr 2024 14:23:54 -0700
Message-Id: <006bd4dacc0568f04cbcd704f4908386d3540774.1714511660.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1714511660.git.steve@sakoman.com>
References: <cover.1714511660.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Apr 2024 21:24:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198773

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- parser: Fix detection of duplicate attributes in XML namespace
- xmlreader: Fix xmlTextReaderConstEncoding
- html: Fix htmlCreatePushParserCtxt with encoding
- xmllint: Return error code if XPath returns empty nodeset

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 0bc673b0de08e02ff01ec9ad3daf0bb41662da40)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libxml/{libxml2_2.12.5.bb => libxml2_2.12.6.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/libxml/{libxml2_2.12.5.bb => libxml2_2.12.6.bb} (97%)

diff --git a/meta/recipes-core/libxml/libxml2_2.12.5.bb b/meta/recipes-core/libxml/libxml2_2.12.6.bb
similarity index 97%
rename from meta/recipes-core/libxml/libxml2_2.12.5.bb
rename to meta/recipes-core/libxml/libxml2_2.12.6.bb
index 47c1a72e77..14fcff7fa4 100644
--- a/meta/recipes-core/libxml/libxml2_2.12.5.bb
+++ b/meta/recipes-core/libxml/libxml2_2.12.6.bb
@@ -20,7 +20,7 @@ SRC_URI += "http://www.w3.org/XML/Test/xmlts20130923.tar;subdir=${BP};name=testt
            file://install-tests.patch \
            "
 
-SRC_URI[archive.sha256sum] = "a972796696afd38073e0f59c283c3a2f5a560b5268b4babc391b286166526b21"
+SRC_URI[archive.sha256sum] = "889c593a881a3db5fdd96cc9318c87df34eb648edfc458272ad46fd607353fbb"
 SRC_URI[testtar.sha256sum] = "c6b2d42ee50b8b236e711a97d68e6c4b5c8d83e69a2be4722379f08702ea7273"
 
 # Disputed as a security issue, but fixed in d39f780
-- 
2.34.1


